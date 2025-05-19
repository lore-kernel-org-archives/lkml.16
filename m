Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C79D1F0994
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643827; cv=none; b=E/0or2SWSuZVC4LDuY3zBVm02SNU4Sq3ZaBSE5a2hC8lsB4MBsfKupMCu9BOUYavsGWx5A2jSHeF1fg2hzA1O92hALBCnQJl+adTzx5w5AEe6S/XhOnWJ6BN+ArojlypGyXCPucaP+t0YNbWbYLrcHHVZmqabiiRwCn8/OoDEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643827; c=relaxed/simple;
	bh=8spRBr8+FG0TSo3j8HaUOnFZIa3REadkjp0RLcYCpCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fliNcwN/0oC3Amn7X9BYatTPzONky3aRlcLk66SEo32m3gvG0hAOb7TGcsTJjnikmRmWJIHBcyFCsWibhTbG4/il34oY3YlXELHqF/PPM/LUXyjIFEj5CBSG39n1EP5JlT6M0wUknQpFAoVTvyHFh6+eznD5jvnxrOpApVyJqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RE9RGvPN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RE9RGvPN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747643825; x=1779179825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8spRBr8+FG0TSo3j8HaUOnFZIa3REadkjp0RLcYCpCg=;
  b=RE9RGvPNvu5Z6K5WpnTDGZ0CwupdG1lxMGH4wAfkZeBjKAuL4yoaqve7
   F0ndPVIg2w0NZUHjnQfXij2QsvDV+NaQ05ZATiTxIBzyTJYE1JDq5LtXT
   e1UPSeBDXYwkXMUnWwkqA6sFU9BMx5aFnvLZFswz0W/gRN65DS/Exmjps
   8v/Ec7xI9OdSevaFxxLONhZH/sH1c0f0P2aGH4lh6OMqmix/R4qVbGwm3
   /ZUBAXqX7DCIXemgn2eo8A1MpK8gVfMQOjNvwTUnT5QRukUrsKbhTNUkM
   G5UrGZjMoydVDyAnu+67XDhR/3YOcVNqj/+8vD8g11jLD271HurZCtBVk
   Q==;
X-CSE-ConnectionGUID: RkEmA+U6RMC45RMBV3qnug==
X-CSE-MsgGUID: mScUqOzsRZi6NDIY1hu9yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49465143"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49465143"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 01:37:05 -0700
X-CSE-ConnectionGUID: hkMo6LElQ22CyN0yguC6pQ==
X-CSE-MsgGUID: eqUs8ji9RfeNtFRCJMkEKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="144286662"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 May 2025 01:37:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGvzY-000LHv-1E;
	Mon, 19 May 2025 08:37:00 +0000
Date: Mon, 19 May 2025 16:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sunghun Son <thswpvm1111@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: remove typedef declaration
Message-ID: <202505191650.PbeMZMEG-lkp@intel.com>
References: <aCrP0mBkFxfZKUZT@debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCrP0mBkFxfZKUZT@debian>

Hi Sunghun,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunghun-Son/staging-octeon-remove-typedef-declaration/20250519-143105
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/aCrP0mBkFxfZKUZT%40debian
patch subject: [PATCH] staging: octeon: remove typedef declaration
config: x86_64-buildonly-randconfig-006-20250519 (https://download.01.org/0day-ci/archive/20250519/202505191650.PbeMZMEG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191650.PbeMZMEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191650.PbeMZMEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_get_stats':
>> drivers/staging/octeon/ethernet.c:204:9: error: unknown type name 'cvmx_pip_port_status_t'
     204 |         cvmx_pip_port_status_t rx_status;
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/ethernet.c:205:9: error: unknown type name 'cvmx_pko_port_status_t'; use 'struct' keyword to refer to the type
     205 |         cvmx_pko_port_status_t tx_status;
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         struct 
>> drivers/staging/octeon/ethernet.c:214:65: error: passing argument 3 of 'cvmx_pip_get_port_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
     214 |                         cvmx_pip_get_port_status(priv->port, 1, &rx_status);
         |                                                                 ^~~~~~~~~~
         |                                                                 |
         |                                                                 int *
   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet.c:23:
   drivers/staging/octeon/octeon-stubs.h:1261:74: note: expected 'struct cvmx_pip_port_status *' but argument is of type 'int *'
    1261 |                                             struct cvmx_pip_port_status *status)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/staging/octeon/ethernet.c:215:65: error: passing argument 3 of 'cvmx_pko_get_port_status' from incompatible pointer type [-Werror=incompatible-pointer-types]
     215 |                         cvmx_pko_get_port_status(priv->port, 1, &tx_status);
         |                                                                 ^~~~~~~~~~
         |                                                                 |
         |                                                                 int *
   drivers/staging/octeon/octeon-stubs.h:1265:76: note: expected 'struct cvmx_pko_port_status_t *' but argument is of type 'int *'
    1265 |                                             struct cvmx_pko_port_status_t *status)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/staging/octeon/ethernet.c:218:51: error: request for member 'inb_packets' in something not a structure or union
     218 |                 dev->stats.rx_packets += rx_status.inb_packets;
         |                                                   ^
>> drivers/staging/octeon/ethernet.c:219:51: error: request for member 'packets' in something not a structure or union
     219 |                 dev->stats.tx_packets += tx_status.packets;
         |                                                   ^
>> drivers/staging/octeon/ethernet.c:220:49: error: request for member 'inb_octets' in something not a structure or union
     220 |                 dev->stats.rx_bytes += rx_status.inb_octets;
         |                                                 ^
>> drivers/staging/octeon/ethernet.c:221:49: error: request for member 'octets' in something not a structure or union
     221 |                 dev->stats.tx_bytes += tx_status.octets;
         |                                                 ^
>> drivers/staging/octeon/ethernet.c:222:50: error: request for member 'multicast_packets' in something not a structure or union
     222 |                 dev->stats.multicast += rx_status.multicast_packets;
         |                                                  ^
>> drivers/staging/octeon/ethernet.c:223:54: error: request for member 'inb_errors' in something not a structure or union
     223 |                 dev->stats.rx_crc_errors += rx_status.inb_errors;
         |                                                      ^
>> drivers/staging/octeon/ethernet.c:224:56: error: request for member 'fcs_align_err_packets' in something not a structure or union
     224 |                 dev->stats.rx_frame_errors += rx_status.fcs_align_err_packets;
         |                                                        ^
>> drivers/staging/octeon/ethernet.c:225:51: error: request for member 'dropped_packets' in something not a structure or union
     225 |                 dev->stats.rx_dropped += rx_status.dropped_packets;
         |                                                   ^
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
>> drivers/staging/octeon/ethernet.c:801:17: error: unknown type name 'cvmx_helper_interface_mode_t'
     801 |                 cvmx_helper_interface_mode_t imode =
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cvmx_pip_port_status_t +204 drivers/staging/octeon/ethernet.c

422d97b8b05ed3 Chris Packham 2020-02-05   22  
422d97b8b05ed3 Chris Packham 2020-02-05  @23  #include "octeon-ethernet.h"
422d97b8b05ed3 Chris Packham 2020-02-05   24  #include "ethernet-defines.h"
422d97b8b05ed3 Chris Packham 2020-02-05   25  #include "ethernet-mem.h"
422d97b8b05ed3 Chris Packham 2020-02-05   26  #include "ethernet-rx.h"
422d97b8b05ed3 Chris Packham 2020-02-05   27  #include "ethernet-tx.h"
422d97b8b05ed3 Chris Packham 2020-02-05   28  #include "ethernet-mdio.h"
422d97b8b05ed3 Chris Packham 2020-02-05   29  #include "ethernet-util.h"
422d97b8b05ed3 Chris Packham 2020-02-05   30  
422d97b8b05ed3 Chris Packham 2020-02-05   31  #define OCTEON_MAX_MTU 65392
422d97b8b05ed3 Chris Packham 2020-02-05   32  
422d97b8b05ed3 Chris Packham 2020-02-05   33  static int num_packet_buffers = 1024;
422d97b8b05ed3 Chris Packham 2020-02-05   34  module_param(num_packet_buffers, int, 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   35  MODULE_PARM_DESC(num_packet_buffers, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   36  	"\tNumber of packet buffers to allocate and store in the\n"
422d97b8b05ed3 Chris Packham 2020-02-05   37  	"\tFPA. By default, 1024 packet buffers are used.\n");
422d97b8b05ed3 Chris Packham 2020-02-05   38  
422d97b8b05ed3 Chris Packham 2020-02-05   39  static int pow_receive_group = 15;
422d97b8b05ed3 Chris Packham 2020-02-05   40  module_param(pow_receive_group, int, 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   41  MODULE_PARM_DESC(pow_receive_group, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   42  	"\tPOW group to receive packets from. All ethernet hardware\n"
422d97b8b05ed3 Chris Packham 2020-02-05   43  	"\twill be configured to send incoming packets to this POW\n"
422d97b8b05ed3 Chris Packham 2020-02-05   44  	"\tgroup. Also any other software can submit packets to this\n"
422d97b8b05ed3 Chris Packham 2020-02-05   45  	"\tgroup for the kernel to process.");
422d97b8b05ed3 Chris Packham 2020-02-05   46  
422d97b8b05ed3 Chris Packham 2020-02-05   47  static int receive_group_order;
422d97b8b05ed3 Chris Packham 2020-02-05   48  module_param(receive_group_order, int, 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   49  MODULE_PARM_DESC(receive_group_order, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   50  	"\tOrder (0..4) of receive groups to take into use. Ethernet hardware\n"
422d97b8b05ed3 Chris Packham 2020-02-05   51  	"\twill be configured to send incoming packets to multiple POW\n"
422d97b8b05ed3 Chris Packham 2020-02-05   52  	"\tgroups. pow_receive_group parameter is ignored when multiple\n"
422d97b8b05ed3 Chris Packham 2020-02-05   53  	"\tgroups are taken into use and groups are allocated starting\n"
422d97b8b05ed3 Chris Packham 2020-02-05   54  	"\tfrom 0. By default, a single group is used.\n");
422d97b8b05ed3 Chris Packham 2020-02-05   55  
422d97b8b05ed3 Chris Packham 2020-02-05   56  int pow_send_group = -1;
422d97b8b05ed3 Chris Packham 2020-02-05   57  module_param(pow_send_group, int, 0644);
422d97b8b05ed3 Chris Packham 2020-02-05   58  MODULE_PARM_DESC(pow_send_group, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   59  	"\tPOW group to send packets to other software on. This\n"
422d97b8b05ed3 Chris Packham 2020-02-05   60  	"\tcontrols the creation of the virtual device pow0.\n"
422d97b8b05ed3 Chris Packham 2020-02-05   61  	"\talways_use_pow also depends on this value.");
422d97b8b05ed3 Chris Packham 2020-02-05   62  
422d97b8b05ed3 Chris Packham 2020-02-05   63  int always_use_pow;
422d97b8b05ed3 Chris Packham 2020-02-05   64  module_param(always_use_pow, int, 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   65  MODULE_PARM_DESC(always_use_pow, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   66  	"\tWhen set, always send to the pow group. This will cause\n"
422d97b8b05ed3 Chris Packham 2020-02-05   67  	"\tpackets sent to real ethernet devices to be sent to the\n"
422d97b8b05ed3 Chris Packham 2020-02-05   68  	"\tPOW group instead of the hardware. Unless some other\n"
422d97b8b05ed3 Chris Packham 2020-02-05   69  	"\tapplication changes the config, packets will still be\n"
422d97b8b05ed3 Chris Packham 2020-02-05   70  	"\treceived from the low level hardware. Use this option\n"
422d97b8b05ed3 Chris Packham 2020-02-05   71  	"\tto allow a CVMX app to intercept all packets from the\n"
422d97b8b05ed3 Chris Packham 2020-02-05   72  	"\tlinux kernel. You must specify pow_send_group along with\n"
422d97b8b05ed3 Chris Packham 2020-02-05   73  	"\tthis option.");
422d97b8b05ed3 Chris Packham 2020-02-05   74  
422d97b8b05ed3 Chris Packham 2020-02-05   75  char pow_send_list[128] = "";
422d97b8b05ed3 Chris Packham 2020-02-05   76  module_param_string(pow_send_list, pow_send_list, sizeof(pow_send_list), 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   77  MODULE_PARM_DESC(pow_send_list, "\n"
422d97b8b05ed3 Chris Packham 2020-02-05   78  	"\tComma separated list of ethernet devices that should use the\n"
422d97b8b05ed3 Chris Packham 2020-02-05   79  	"\tPOW for transmit instead of the actual ethernet hardware. This\n"
422d97b8b05ed3 Chris Packham 2020-02-05   80  	"\tis a per port version of always_use_pow. always_use_pow takes\n"
422d97b8b05ed3 Chris Packham 2020-02-05   81  	"\tprecedence over this list. For example, setting this to\n"
422d97b8b05ed3 Chris Packham 2020-02-05   82  	"\t\"eth2,spi3,spi7\" would cause these three devices to transmit\n"
422d97b8b05ed3 Chris Packham 2020-02-05   83  	"\tusing the pow_send_group.");
422d97b8b05ed3 Chris Packham 2020-02-05   84  
422d97b8b05ed3 Chris Packham 2020-02-05   85  int rx_napi_weight = 32;
422d97b8b05ed3 Chris Packham 2020-02-05   86  module_param(rx_napi_weight, int, 0444);
422d97b8b05ed3 Chris Packham 2020-02-05   87  MODULE_PARM_DESC(rx_napi_weight, "The NAPI WEIGHT parameter.");
422d97b8b05ed3 Chris Packham 2020-02-05   88  
422d97b8b05ed3 Chris Packham 2020-02-05   89  /* Mask indicating which receive groups are in use. */
422d97b8b05ed3 Chris Packham 2020-02-05   90  int pow_receive_groups;
422d97b8b05ed3 Chris Packham 2020-02-05   91  
422d97b8b05ed3 Chris Packham 2020-02-05   92  /*
422d97b8b05ed3 Chris Packham 2020-02-05   93   * cvm_oct_poll_queue_stopping - flag to indicate polling should stop.
422d97b8b05ed3 Chris Packham 2020-02-05   94   *
422d97b8b05ed3 Chris Packham 2020-02-05   95   * Set to one right before cvm_oct_poll_queue is destroyed.
422d97b8b05ed3 Chris Packham 2020-02-05   96   */
422d97b8b05ed3 Chris Packham 2020-02-05   97  atomic_t cvm_oct_poll_queue_stopping = ATOMIC_INIT(0);
422d97b8b05ed3 Chris Packham 2020-02-05   98  
422d97b8b05ed3 Chris Packham 2020-02-05   99  /*
422d97b8b05ed3 Chris Packham 2020-02-05  100   * Array of every ethernet device owned by this driver indexed by
422d97b8b05ed3 Chris Packham 2020-02-05  101   * the ipd input port number.
422d97b8b05ed3 Chris Packham 2020-02-05  102   */
422d97b8b05ed3 Chris Packham 2020-02-05  103  struct net_device *cvm_oct_device[TOTAL_NUMBER_OF_PORTS];
422d97b8b05ed3 Chris Packham 2020-02-05  104  
422d97b8b05ed3 Chris Packham 2020-02-05  105  u64 cvm_oct_tx_poll_interval;
422d97b8b05ed3 Chris Packham 2020-02-05  106  
422d97b8b05ed3 Chris Packham 2020-02-05  107  static void cvm_oct_rx_refill_worker(struct work_struct *work);
422d97b8b05ed3 Chris Packham 2020-02-05  108  static DECLARE_DELAYED_WORK(cvm_oct_rx_refill_work, cvm_oct_rx_refill_worker);
422d97b8b05ed3 Chris Packham 2020-02-05  109  
422d97b8b05ed3 Chris Packham 2020-02-05  110  static void cvm_oct_rx_refill_worker(struct work_struct *work)
422d97b8b05ed3 Chris Packham 2020-02-05  111  {
422d97b8b05ed3 Chris Packham 2020-02-05  112  	/*
422d97b8b05ed3 Chris Packham 2020-02-05  113  	 * FPA 0 may have been drained, try to refill it if we need
422d97b8b05ed3 Chris Packham 2020-02-05  114  	 * more than num_packet_buffers / 2, otherwise normal receive
422d97b8b05ed3 Chris Packham 2020-02-05  115  	 * processing will refill it.  If it were drained, no packets
422d97b8b05ed3 Chris Packham 2020-02-05  116  	 * could be received so cvm_oct_napi_poll would never be
422d97b8b05ed3 Chris Packham 2020-02-05  117  	 * invoked to do the refill.
422d97b8b05ed3 Chris Packham 2020-02-05  118  	 */
422d97b8b05ed3 Chris Packham 2020-02-05  119  	cvm_oct_rx_refill_pool(num_packet_buffers / 2);
422d97b8b05ed3 Chris Packham 2020-02-05  120  
422d97b8b05ed3 Chris Packham 2020-02-05  121  	if (!atomic_read(&cvm_oct_poll_queue_stopping))
422d97b8b05ed3 Chris Packham 2020-02-05  122  		schedule_delayed_work(&cvm_oct_rx_refill_work, HZ);
422d97b8b05ed3 Chris Packham 2020-02-05  123  }
422d97b8b05ed3 Chris Packham 2020-02-05  124  
422d97b8b05ed3 Chris Packham 2020-02-05  125  static void cvm_oct_periodic_worker(struct work_struct *work)
422d97b8b05ed3 Chris Packham 2020-02-05  126  {
422d97b8b05ed3 Chris Packham 2020-02-05  127  	struct octeon_ethernet *priv = container_of(work,
422d97b8b05ed3 Chris Packham 2020-02-05  128  						    struct octeon_ethernet,
422d97b8b05ed3 Chris Packham 2020-02-05  129  						    port_periodic_work.work);
422d97b8b05ed3 Chris Packham 2020-02-05  130  
422d97b8b05ed3 Chris Packham 2020-02-05  131  	if (priv->poll)
422d97b8b05ed3 Chris Packham 2020-02-05  132  		priv->poll(cvm_oct_device[priv->port]);
422d97b8b05ed3 Chris Packham 2020-02-05  133  
422d97b8b05ed3 Chris Packham 2020-02-05  134  	cvm_oct_device[priv->port]->netdev_ops->ndo_get_stats
422d97b8b05ed3 Chris Packham 2020-02-05  135  						(cvm_oct_device[priv->port]);
422d97b8b05ed3 Chris Packham 2020-02-05  136  
422d97b8b05ed3 Chris Packham 2020-02-05  137  	if (!atomic_read(&cvm_oct_poll_queue_stopping))
422d97b8b05ed3 Chris Packham 2020-02-05  138  		schedule_delayed_work(&priv->port_periodic_work, HZ);
422d97b8b05ed3 Chris Packham 2020-02-05  139  }
422d97b8b05ed3 Chris Packham 2020-02-05  140  
422d97b8b05ed3 Chris Packham 2020-02-05  141  static void cvm_oct_configure_common_hw(void)
422d97b8b05ed3 Chris Packham 2020-02-05  142  {
422d97b8b05ed3 Chris Packham 2020-02-05  143  	/* Setup the FPA */
422d97b8b05ed3 Chris Packham 2020-02-05  144  	cvmx_fpa_enable();
422d97b8b05ed3 Chris Packham 2020-02-05  145  	cvm_oct_mem_fill_fpa(CVMX_FPA_PACKET_POOL, CVMX_FPA_PACKET_POOL_SIZE,
422d97b8b05ed3 Chris Packham 2020-02-05  146  			     num_packet_buffers);
422d97b8b05ed3 Chris Packham 2020-02-05  147  	cvm_oct_mem_fill_fpa(CVMX_FPA_WQE_POOL, CVMX_FPA_WQE_POOL_SIZE,
422d97b8b05ed3 Chris Packham 2020-02-05  148  			     num_packet_buffers);
422d97b8b05ed3 Chris Packham 2020-02-05  149  	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
422d97b8b05ed3 Chris Packham 2020-02-05  150  		cvm_oct_mem_fill_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
422d97b8b05ed3 Chris Packham 2020-02-05  151  				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
422d97b8b05ed3 Chris Packham 2020-02-05  152  
422d97b8b05ed3 Chris Packham 2020-02-05  153  #ifdef __LITTLE_ENDIAN
422d97b8b05ed3 Chris Packham 2020-02-05  154  	{
422d97b8b05ed3 Chris Packham 2020-02-05  155  		union cvmx_ipd_ctl_status ipd_ctl_status;
422d97b8b05ed3 Chris Packham 2020-02-05  156  
422d97b8b05ed3 Chris Packham 2020-02-05  157  		ipd_ctl_status.u64 = cvmx_read_csr(CVMX_IPD_CTL_STATUS);
422d97b8b05ed3 Chris Packham 2020-02-05  158  		ipd_ctl_status.s.pkt_lend = 1;
422d97b8b05ed3 Chris Packham 2020-02-05  159  		ipd_ctl_status.s.wqe_lend = 1;
422d97b8b05ed3 Chris Packham 2020-02-05  160  		cvmx_write_csr(CVMX_IPD_CTL_STATUS, ipd_ctl_status.u64);
422d97b8b05ed3 Chris Packham 2020-02-05  161  	}
422d97b8b05ed3 Chris Packham 2020-02-05  162  #endif
422d97b8b05ed3 Chris Packham 2020-02-05  163  
422d97b8b05ed3 Chris Packham 2020-02-05  164  	cvmx_helper_setup_red(num_packet_buffers / 4, num_packet_buffers / 8);
422d97b8b05ed3 Chris Packham 2020-02-05  165  }
422d97b8b05ed3 Chris Packham 2020-02-05  166  
422d97b8b05ed3 Chris Packham 2020-02-05  167  /**
422d97b8b05ed3 Chris Packham 2020-02-05  168   * cvm_oct_free_work- Free a work queue entry
422d97b8b05ed3 Chris Packham 2020-02-05  169   *
422d97b8b05ed3 Chris Packham 2020-02-05  170   * @work_queue_entry: Work queue entry to free
422d97b8b05ed3 Chris Packham 2020-02-05  171   *
422d97b8b05ed3 Chris Packham 2020-02-05  172   * Returns Zero on success, Negative on failure.
422d97b8b05ed3 Chris Packham 2020-02-05  173   */
422d97b8b05ed3 Chris Packham 2020-02-05  174  int cvm_oct_free_work(void *work_queue_entry)
422d97b8b05ed3 Chris Packham 2020-02-05  175  {
422d97b8b05ed3 Chris Packham 2020-02-05  176  	struct cvmx_wqe *work = work_queue_entry;
422d97b8b05ed3 Chris Packham 2020-02-05  177  
422d97b8b05ed3 Chris Packham 2020-02-05  178  	int segments = work->word2.s.bufs;
422d97b8b05ed3 Chris Packham 2020-02-05  179  	union cvmx_buf_ptr segment_ptr = work->packet_ptr;
422d97b8b05ed3 Chris Packham 2020-02-05  180  
422d97b8b05ed3 Chris Packham 2020-02-05  181  	while (segments--) {
422d97b8b05ed3 Chris Packham 2020-02-05  182  		union cvmx_buf_ptr next_ptr = *(union cvmx_buf_ptr *)
422d97b8b05ed3 Chris Packham 2020-02-05  183  			cvmx_phys_to_ptr(segment_ptr.s.addr - 8);
422d97b8b05ed3 Chris Packham 2020-02-05  184  		if (unlikely(!segment_ptr.s.i))
422d97b8b05ed3 Chris Packham 2020-02-05  185  			cvmx_fpa_free(cvm_oct_get_buffer_ptr(segment_ptr),
422d97b8b05ed3 Chris Packham 2020-02-05  186  				      segment_ptr.s.pool,
422d97b8b05ed3 Chris Packham 2020-02-05  187  				      CVMX_FPA_PACKET_POOL_SIZE / 128);
422d97b8b05ed3 Chris Packham 2020-02-05  188  		segment_ptr = next_ptr;
422d97b8b05ed3 Chris Packham 2020-02-05  189  	}
422d97b8b05ed3 Chris Packham 2020-02-05  190  	cvmx_fpa_free(work, CVMX_FPA_WQE_POOL, 1);
422d97b8b05ed3 Chris Packham 2020-02-05  191  
422d97b8b05ed3 Chris Packham 2020-02-05  192  	return 0;
422d97b8b05ed3 Chris Packham 2020-02-05  193  }
422d97b8b05ed3 Chris Packham 2020-02-05  194  EXPORT_SYMBOL(cvm_oct_free_work);
422d97b8b05ed3 Chris Packham 2020-02-05  195  
422d97b8b05ed3 Chris Packham 2020-02-05  196  /**
422d97b8b05ed3 Chris Packham 2020-02-05  197   * cvm_oct_common_get_stats - get the low level ethernet statistics
422d97b8b05ed3 Chris Packham 2020-02-05  198   * @dev:    Device to get the statistics from
422d97b8b05ed3 Chris Packham 2020-02-05  199   *
422d97b8b05ed3 Chris Packham 2020-02-05  200   * Returns Pointer to the statistics
422d97b8b05ed3 Chris Packham 2020-02-05  201   */
422d97b8b05ed3 Chris Packham 2020-02-05  202  static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
422d97b8b05ed3 Chris Packham 2020-02-05  203  {
422d97b8b05ed3 Chris Packham 2020-02-05 @204  	cvmx_pip_port_status_t rx_status;
422d97b8b05ed3 Chris Packham 2020-02-05 @205  	cvmx_pko_port_status_t tx_status;
422d97b8b05ed3 Chris Packham 2020-02-05  206  	struct octeon_ethernet *priv = netdev_priv(dev);
422d97b8b05ed3 Chris Packham 2020-02-05  207  
422d97b8b05ed3 Chris Packham 2020-02-05  208  	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
422d97b8b05ed3 Chris Packham 2020-02-05  209  		if (octeon_is_simulation()) {
422d97b8b05ed3 Chris Packham 2020-02-05  210  			/* The simulator doesn't support statistics */
422d97b8b05ed3 Chris Packham 2020-02-05  211  			memset(&rx_status, 0, sizeof(rx_status));
422d97b8b05ed3 Chris Packham 2020-02-05  212  			memset(&tx_status, 0, sizeof(tx_status));
422d97b8b05ed3 Chris Packham 2020-02-05  213  		} else {
422d97b8b05ed3 Chris Packham 2020-02-05 @214  			cvmx_pip_get_port_status(priv->port, 1, &rx_status);
422d97b8b05ed3 Chris Packham 2020-02-05 @215  			cvmx_pko_get_port_status(priv->port, 1, &tx_status);
422d97b8b05ed3 Chris Packham 2020-02-05  216  		}
422d97b8b05ed3 Chris Packham 2020-02-05  217  
422d97b8b05ed3 Chris Packham 2020-02-05 @218  		dev->stats.rx_packets += rx_status.inb_packets;
422d97b8b05ed3 Chris Packham 2020-02-05 @219  		dev->stats.tx_packets += tx_status.packets;
422d97b8b05ed3 Chris Packham 2020-02-05 @220  		dev->stats.rx_bytes += rx_status.inb_octets;
422d97b8b05ed3 Chris Packham 2020-02-05 @221  		dev->stats.tx_bytes += tx_status.octets;
422d97b8b05ed3 Chris Packham 2020-02-05 @222  		dev->stats.multicast += rx_status.multicast_packets;
422d97b8b05ed3 Chris Packham 2020-02-05 @223  		dev->stats.rx_crc_errors += rx_status.inb_errors;
422d97b8b05ed3 Chris Packham 2020-02-05 @224  		dev->stats.rx_frame_errors += rx_status.fcs_align_err_packets;
422d97b8b05ed3 Chris Packham 2020-02-05 @225  		dev->stats.rx_dropped += rx_status.dropped_packets;
422d97b8b05ed3 Chris Packham 2020-02-05  226  	}
422d97b8b05ed3 Chris Packham 2020-02-05  227  
422d97b8b05ed3 Chris Packham 2020-02-05  228  	return &dev->stats;
422d97b8b05ed3 Chris Packham 2020-02-05  229  }
422d97b8b05ed3 Chris Packham 2020-02-05  230  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
