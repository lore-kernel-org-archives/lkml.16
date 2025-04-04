Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098AA937
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786287; cv=none; b=B7rdlvWzGpZBUgLywPzuqYo68TRMWnO7I9+blg2Xwb/Hg5eCD/7nOfiCF9NlAxpLvJEgrwZtyn4IZAHnHZAOyuHhtjzdBJrSH1ECA9PYl/naxRCHMaRAsXck1ifOerNggp2qKAbk4Q6ds5ufHr5cnNJvG2olyiTgmINqzJMaybM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786287; c=relaxed/simple;
	bh=DUI7lYj6otj4ok3LWvzagnZKOIHr+y1eZ4Z4l6ZhSmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPm1WCZAG7ZQUhcSLj2a6VDvBdle34IYyyEw3u8l0MENHfxgUcTA7MOg8ygCGKrcBjxI05GwBl8MWsLSvE5Re8wvIeelPxC4XXxZjexYvC8I3ID5Db4ywyrYBg9sSkcVWo23ZyapacAQsZsvHCe/aJNnNz/n8DRogbyotBJmqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ix2qZJ3g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix2qZJ3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743786287; x=1775322287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DUI7lYj6otj4ok3LWvzagnZKOIHr+y1eZ4Z4l6ZhSmA=;
  b=Ix2qZJ3g1qE3nriFozGgGU/qeXwVD4W8MFGeC1H2cYBOitLUQZP8nFiO
   egOQ9rbbswEXfwT2FM56aly98VE6sAswUwrKqTjNGZ5SBnA+GZiJR99dc
   mthQhysQEOkeaTNwbSeO4LElOS675outboeh81kfcjrP/T/HpA46JxXax
   rY3nyuGsqAp9Rcn4Lzx3h+HjNW473ffBsOAS8xStCejo5lDV8R9+54kGx
   z91yRQRPeyMrabWKzK4y0dcXBPZ9YuaGpz6tKO4kipgoWVeIJUNjTURo9
   hvSJ5kUwh8NzshqndO7YqHqycF8pHNNdi4jmvSFbeiI35s0Tpo97YEJH5
   Q==;
X-CSE-ConnectionGUID: D9Cjqb/aQBawuScJdii/0Q==
X-CSE-MsgGUID: NvzI5WjuTMqwhRwzWryNUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49027880"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49027880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:04:46 -0700
X-CSE-ConnectionGUID: t0sqFrCgQTCNXxHSvyFcPw==
X-CSE-MsgGUID: WRjr3bVtRjmcKtfQJXrZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132564003"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2025 10:04:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kTB-0001PR-1V;
	Fri, 04 Apr 2025 17:04:41 +0000
Date: Sat, 5 Apr 2025 01:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:timers/cleanups 1/10] drivers/usb/host/xhci.c:1074:25: error:
 implicit declaration of function 'timer_delelet_sync'; did you mean
 'timer_delete_sync'?
Message-ID: <202504050021.xNNi1XQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
commit: 915bfe3b63168b863b4c14a0c9cffa0ee9acfeeb [1/10] treewide: Switch to timer_delete[_sync]()
config: i386-buildonly-randconfig-004-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050021.xNNi1XQ0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050021.xNNi1XQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050021.xNNi1XQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci.c: In function 'xhci_resume':
>> drivers/usb/host/xhci.c:1074:25: error: implicit declaration of function 'timer_delelet_sync'; did you mean 'timer_delete_sync'? [-Werror=implicit-function-declaration]
    1074 |                         timer_delelet_sync(&xhci->comp_mode_recovery_timer);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         timer_delete_sync
   cc1: some warnings being treated as errors


vim +1074 drivers/usb/host/xhci.c

   990	
   991	/*
   992	 * start xHC (not bus-specific)
   993	 *
   994	 * This is called when the machine transition from S3/S4 mode.
   995	 *
   996	 */
   997	int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
   998	{
   999		u32			command, temp = 0;
  1000		struct usb_hcd		*hcd = xhci_to_hcd(xhci);
  1001		int			retval = 0;
  1002		bool			comp_timer_running = false;
  1003		bool			pending_portevent = false;
  1004		bool			suspended_usb3_devs = false;
  1005	
  1006		if (!hcd->state)
  1007			return 0;
  1008	
  1009		/* Wait a bit if either of the roothubs need to settle from the
  1010		 * transition into bus suspend.
  1011		 */
  1012	
  1013		if (time_before(jiffies, xhci->usb2_rhub.bus_state.next_statechange) ||
  1014		    time_before(jiffies, xhci->usb3_rhub.bus_state.next_statechange))
  1015			msleep(100);
  1016	
  1017		set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
  1018		if (xhci->shared_hcd)
  1019			set_bit(HCD_FLAG_HW_ACCESSIBLE, &xhci->shared_hcd->flags);
  1020	
  1021		spin_lock_irq(&xhci->lock);
  1022	
  1023		if (xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
  1024			power_lost = true;
  1025	
  1026		if (!power_lost) {
  1027			/*
  1028			 * Some controllers might lose power during suspend, so wait
  1029			 * for controller not ready bit to clear, just as in xHC init.
  1030			 */
  1031			retval = xhci_handshake(&xhci->op_regs->status,
  1032						STS_CNR, 0, 10 * 1000 * 1000);
  1033			if (retval) {
  1034				xhci_warn(xhci, "Controller not ready at resume %d\n",
  1035					  retval);
  1036				spin_unlock_irq(&xhci->lock);
  1037				return retval;
  1038			}
  1039			/* step 1: restore register */
  1040			xhci_restore_registers(xhci);
  1041			/* step 2: initialize command ring buffer */
  1042			xhci_set_cmd_ring_deq(xhci);
  1043			/* step 3: restore state and start state*/
  1044			/* step 3: set CRS flag */
  1045			command = readl(&xhci->op_regs->command);
  1046			command |= CMD_CRS;
  1047			writel(command, &xhci->op_regs->command);
  1048			/*
  1049			 * Some controllers take up to 55+ ms to complete the controller
  1050			 * restore so setting the timeout to 100ms. Xhci specification
  1051			 * doesn't mention any timeout value.
  1052			 */
  1053			if (xhci_handshake(&xhci->op_regs->status,
  1054				      STS_RESTORE, 0, 100 * 1000)) {
  1055				xhci_warn(xhci, "WARN: xHC restore state timeout\n");
  1056				spin_unlock_irq(&xhci->lock);
  1057				return -ETIMEDOUT;
  1058			}
  1059		}
  1060	
  1061		temp = readl(&xhci->op_regs->status);
  1062	
  1063		/* re-initialize the HC on Restore Error, or Host Controller Error */
  1064		if ((temp & (STS_SRE | STS_HCE)) &&
  1065		    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
  1066			if (!power_lost)
  1067				xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
  1068			power_lost = true;
  1069		}
  1070	
  1071		if (power_lost) {
  1072			if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
  1073					!(xhci_all_ports_seen_u0(xhci))) {
> 1074				timer_delelet_sync(&xhci->comp_mode_recovery_timer);
  1075				xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
  1076					"Compliance Mode Recovery Timer deleted!");
  1077			}
  1078	
  1079			/* Let the USB core know _both_ roothubs lost power. */
  1080			usb_root_hub_lost_power(xhci->main_hcd->self.root_hub);
  1081			if (xhci->shared_hcd)
  1082				usb_root_hub_lost_power(xhci->shared_hcd->self.root_hub);
  1083	
  1084			xhci_dbg(xhci, "Stop HCD\n");
  1085			xhci_halt(xhci);
  1086			xhci_zero_64b_regs(xhci);
  1087			retval = xhci_reset(xhci, XHCI_RESET_LONG_USEC);
  1088			spin_unlock_irq(&xhci->lock);
  1089			if (retval)
  1090				return retval;
  1091	
  1092			xhci_dbg(xhci, "// Disabling event ring interrupts\n");
  1093			temp = readl(&xhci->op_regs->status);
  1094			writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
  1095			xhci_disable_interrupter(xhci->interrupters[0]);
  1096	
  1097			xhci_dbg(xhci, "cleaning up memory\n");
  1098			xhci_mem_cleanup(xhci);
  1099			xhci_debugfs_exit(xhci);
  1100			xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
  1101				    readl(&xhci->op_regs->status));
  1102	
  1103			/* USB core calls the PCI reinit and start functions twice:
  1104			 * first with the primary HCD, and then with the secondary HCD.
  1105			 * If we don't do the same, the host will never be started.
  1106			 */
  1107			xhci_dbg(xhci, "Initialize the xhci_hcd\n");
  1108			retval = xhci_init(hcd);
  1109			if (retval)
  1110				return retval;
  1111			comp_timer_running = true;
  1112	
  1113			xhci_dbg(xhci, "Start the primary HCD\n");
  1114			retval = xhci_run(hcd);
  1115			if (!retval && xhci->shared_hcd) {
  1116				xhci_dbg(xhci, "Start the secondary HCD\n");
  1117				retval = xhci_run(xhci->shared_hcd);
  1118			}
  1119			if (retval)
  1120				return retval;
  1121			/*
  1122			 * Resume roothubs unconditionally as PORTSC change bits are not
  1123			 * immediately visible after xHC reset
  1124			 */
  1125			hcd->state = HC_STATE_SUSPENDED;
  1126	
  1127			if (xhci->shared_hcd) {
  1128				xhci->shared_hcd->state = HC_STATE_SUSPENDED;
  1129				usb_hcd_resume_root_hub(xhci->shared_hcd);
  1130			}
  1131			usb_hcd_resume_root_hub(hcd);
  1132	
  1133			goto done;
  1134		}
  1135	
  1136		/* step 4: set Run/Stop bit */
  1137		command = readl(&xhci->op_regs->command);
  1138		command |= CMD_RUN;
  1139		writel(command, &xhci->op_regs->command);
  1140		xhci_handshake(&xhci->op_regs->status, STS_HALT,
  1141			  0, 250 * 1000);
  1142	
  1143		/* step 5: walk topology and initialize portsc,
  1144		 * portpmsc and portli
  1145		 */
  1146		/* this is done in bus_resume */
  1147	
  1148		/* step 6: restart each of the previously
  1149		 * Running endpoints by ringing their doorbells
  1150		 */
  1151	
  1152		spin_unlock_irq(&xhci->lock);
  1153	
  1154		xhci_dbc_resume(xhci);
  1155	
  1156		if (retval == 0) {
  1157			/*
  1158			 * Resume roothubs only if there are pending events.
  1159			 * USB 3 devices resend U3 LFPS wake after a 100ms delay if
  1160			 * the first wake signalling failed, give it that chance if
  1161			 * there are suspended USB 3 devices.
  1162			 */
  1163			if (xhci->usb3_rhub.bus_state.suspended_ports ||
  1164			    xhci->usb3_rhub.bus_state.bus_suspended)
  1165				suspended_usb3_devs = true;
  1166	
  1167			pending_portevent = xhci_pending_portevent(xhci);
  1168	
  1169			if (suspended_usb3_devs && !pending_portevent && is_auto_resume) {
  1170				msleep(120);
  1171				pending_portevent = xhci_pending_portevent(xhci);
  1172			}
  1173	
  1174			if (pending_portevent) {
  1175				if (xhci->shared_hcd)
  1176					usb_hcd_resume_root_hub(xhci->shared_hcd);
  1177				usb_hcd_resume_root_hub(hcd);
  1178			}
  1179		}
  1180	done:
  1181		/*
  1182		 * If system is subject to the Quirk, Compliance Mode Timer needs to
  1183		 * be re-initialized Always after a system resume. Ports are subject
  1184		 * to suffer the Compliance Mode issue again. It doesn't matter if
  1185		 * ports have entered previously to U0 before system's suspension.
  1186		 */
  1187		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) && !comp_timer_running)
  1188			compliance_mode_recovery_timer_init(xhci);
  1189	
  1190		if (xhci->quirks & XHCI_ASMEDIA_MODIFY_FLOWCONTROL)
  1191			usb_asmedia_modifyflowcontrol(to_pci_dev(hcd->self.controller));
  1192	
  1193		/* Re-enable port polling. */
  1194		xhci_dbg(xhci, "%s: starting usb%d port polling.\n",
  1195			 __func__, hcd->self.busnum);
  1196		if (xhci->shared_hcd) {
  1197			set_bit(HCD_FLAG_POLL_RH, &xhci->shared_hcd->flags);
  1198			usb_hcd_poll_rh_status(xhci->shared_hcd);
  1199		}
  1200		set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
  1201		usb_hcd_poll_rh_status(hcd);
  1202	
  1203		return retval;
  1204	}
  1205	EXPORT_SYMBOL_GPL(xhci_resume);
  1206	#endif	/* CONFIG_PM */
  1207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
