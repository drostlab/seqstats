#' @title Visualize Genome Properties
#' @description This function allows to visualize selected properties of input genomes such as:
#' \itemize{
#' \item gene length distribution: \code{stats_type} = \code{"length_distr"}
#'
#' }
#' @param data a file path to a \code{fasta} file storing either DNA, CDS, or protein sequences.
#' @param seq_type sequence type stored in the \code{fasta} file specified in \code{data}.
#' Available options are:
#' \itemize{
#' \item \code{seq_type = "dna"}: the \code{fasta} file specified in \code{data} contains a \code{DNA} alphabet.
#' \item \code{seq_type = "cds"}: the \code{fasta} file specified in \code{data} contains coding sequences (CDS) (\code{DNA} alphabet).
#' \item \code{seq_type = "protein"}: the \code{fasta} file specified in \code{data} contains a \code{protein} alphabet.
#' }
#' @param stats_type a character string specifying the genome feature that shall be visualized: "length_distr", ... .
#' @param ... additional parameters that shall be passed to the corresponding plot function.
#' @author Hajk-Georg Drost
#' @return a plot object.
#' @examples \dontrun{
#' # download the proteome of Arabidopsis thaliana from refseq
#' # and store the corresponding proteome file in '_ncbi_downloads/proteomes'
#' # install.packages("biomartr")
#' Ath_proteome <- biomartr::getProteome( db = "refseq",
#'              organism = "Arabidopsis thaliana" )
#'
#' # visualize the length distribution of the proteome of A. thaliana
#' visGenome(data = Ath_proteome,
#'           seq_type = "protein",
#'           stats_type = "length_distr", 
#'           main = "Histogram of A. thaliana protein sequence lengths",
#'           xlab = "Sequence Length",
#'           breaks = 100)
#' }
#' @export

visGenome <-
        function(data,
                 seq_type,
                 stats_type = "length_distr",
                 ...) {
                
                message("Starting visualization of ",seq_type," sequence lengths for '", data," ... ")
                if (!is.element(stats_type, c("length_distr")))
                        stop(
                                paste0(
                                        "stats_type = ",
                                        stats_type,
                                        " is not supported by this function."
                                ),
                                call. = FALSE
                        )
                
                if (!is.element(seq_type, c("dna", "cds", "protein")))
                        stop(
                                paste0(
                                        "seq_type = ",
                                        stats_type,
                                        " is not supported by this function. Please choose between 'dna', 'cds' or 'protein'."
                                ),
                                call. = FALSE
                        )

                if (seq_type == "dna")
                        seq_data <- biomartr::read_genome(data)
                
                if (seq_type == "cds")
                        seq_data <- biomartr::read_cds(data)
                
                if (seq_type == "protein")
                        seq_data <- biomartr::read_proteome(data)
                
                
                if (stats_type == "length_distr") {
                        graphics::hist(x = nchar(as.character(seq_data)),  ...)
                        graphics::rug(x = nchar(as.character(seq_data)))
                }
                
                
        }
