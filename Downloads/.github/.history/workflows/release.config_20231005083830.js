module.exports = {
branches: "main",
repositoryUrl: "https://github.com/kingphillips/s3-workflows.git",
plugins: [
'@semantic-release/commit-analysis',
'@semantic-release/release-n0tes-generator',
'@semantic-release/git',
'@semantic-release/github']    
}    
