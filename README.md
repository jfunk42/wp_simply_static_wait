# wp_simply_static_wait
Script for waiting for Wordpress Plugin "Simply Static" to finish generating static site before moving files to S3

Example usage in jenkinsfile

    ...
    transfers: [
    							sshTransfer (
    								execCommand: "sudo wp cache flush;"
    								+"sudo wp eval 'Simply_Static\\Plugin::instance()->run_static_export();';"
    								+"sudo /home/bitnami/wp_simply_static_wait.sh;"
            // after script returns, update links in file, move files to aws S3, then invalidate cloudfront etc.
    ...

