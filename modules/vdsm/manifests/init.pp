class vdsm {
    require server-utils
    include vdsm::packages
    include vdsm::tools
    include vdsm::initiator
}
