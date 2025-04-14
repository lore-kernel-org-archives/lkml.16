Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57626B97C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626208; cv=none; b=qHQnofEIqy+Yd6N0uQjnKKnuBr9sityl4nW8z6leIY5ZnULAVqtpiFUrmqLA1O/d+N7l1AlObF9hl5n6h7wH3grGmBwiAFDlubyHWHYkkfugSsBNtebopH+AerwO87gCUQos1QvD7Jy+h9yoKNWdXx7EQvSt+6+XIHRepe2uEFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626208; c=relaxed/simple;
	bh=uO79AsvnnvqpyVc0830FV5bi/c39xeLs/SAKKh1b0us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X+m930/M87To2ecsJ3XbQvCgdJCSrIsvUjDwmsFoWTGc9CdoSwliuYhfM5/0WViwwBCoigN1slWEf0tANcCgO45AP7TD/IhR0ArtWVLSKcQmO4WwPrwaKgfeJXeT70WC/Tsgo1MgECQjH7xL33L5BxN4tN/3bb2itL+rWboW8A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVfm8foE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVfm8foE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F68C4CEEB;
	Mon, 14 Apr 2025 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626207;
	bh=uO79AsvnnvqpyVc0830FV5bi/c39xeLs/SAKKh1b0us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVfm8foE7dNFBOnI5F2eIKOu85xFlLCThv6wmfAx3NyjwdnciC6BMs1lEIsVwP1Ip
	 cWVBn78MRw12urXnwA0MtT9xo/Jz8wni3gQ9dnc3+/l3Ss1xYRe0Ao7yWMyukoSpeN
	 4sB2sec+m4u6oypDUQ+DRnILNBILWi+xcbFw1ejeH2NRs+V863VW4Bp7qvS+HDfkyX
	 2K0lC9eRmPN473h8zbnwKs0MdITfVRSw4EQ7lCuF2IK2zs6Bw11Udl84r5opmenw+8
	 x4j2/vdPh3Z0nuY03kxfJlgCex0+BwUCGek6E8lTt+jZZHOFvomuSLq7hQqdbr1amm
	 ejasMmG23NAjg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 08/17] treewide, timers: Rename add_timer() => timer_add()
Date: Mon, 14 Apr 2025 12:22:42 +0200
Message-ID: <20250414102301.332225-9-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 Documentation/kernel-hacking/locking.rst           |  4 ++--
 Documentation/scsi/ChangeLog.lpfc                  |  2 +-
 .../translations/it_IT/kernel-hacking/locking.rst  |  4 ++--
 arch/alpha/kernel/process.c                        |  2 +-
 arch/arm/mach-footbridge/dc21285.c                 |  4 ++--
 arch/m68k/amiga/amisound.c                         |  2 +-
 arch/m68k/mac/macboing.c                           |  6 +++---
 arch/mips/sgi-ip22/ip22-reset.c                    |  6 +++---
 arch/mips/sgi-ip32/ip32-reset.c                    |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c              |  2 +-
 arch/powerpc/platforms/powermac/low_i2c.c          |  6 +++---
 arch/sh/drivers/pci/common.c                       |  2 +-
 arch/sh/drivers/pci/pci-sh7780.c                   |  2 +-
 arch/sparc/kernel/led.c                            |  2 +-
 arch/um/drivers/vector_kern.c                      |  2 +-
 arch/x86/kernel/tsc_sync.c                         |  2 +-
 block/blk-iocost.c                                 |  2 +-
 drivers/accel/qaic/qaic_timesync.c                 |  2 +-
 drivers/acpi/apei/ghes.c                           |  2 +-
 drivers/ata/libata-eh.c                            |  4 ++--
 drivers/atm/idt77105.c                             |  4 ++--
 drivers/atm/idt77252.c                             |  2 +-
 drivers/atm/iphase.c                               |  4 ++--
 drivers/atm/lanai.c                                |  2 +-
 drivers/atm/nicstar.c                              |  2 +-
 drivers/atm/suni.c                                 |  2 +-
 drivers/auxdisplay/panel.c                         |  2 +-
 drivers/base/power/main.c                          |  2 +-
 drivers/block/amiflop.c                            |  8 ++++----
 drivers/block/aoe/aoecmd.c                         |  2 +-
 drivers/block/aoe/aoedev.c                         |  4 ++--
 drivers/block/drbd/drbd_receiver.c                 |  2 +-
 drivers/block/drbd/drbd_worker.c                   |  4 ++--
 drivers/block/floppy.c                             |  2 +-
 drivers/block/swim3.c                              |  2 +-
 drivers/char/hw_random/xgene-rng.c                 |  2 +-
 drivers/char/ipmi/bt-bmc.c                         |  4 ++--
 drivers/comedi/drivers/comedi_test.c               |  4 ++--
 drivers/comedi/drivers/das16.c                     |  2 +-
 drivers/comedi/drivers/jr3_pci.c                   |  4 ++--
 drivers/gpu/drm/xe/xe_execlist.c                   |  4 ++--
 drivers/greybus/operation.c                        |  2 +-
 drivers/hwmon/npcm750-pwm-fan.c                    |  4 ++--
 drivers/infiniband/hw/cxgb4/cm.c                   |  2 +-
 drivers/infiniband/hw/hfi1/chip.c                  |  2 +-
 drivers/infiniband/hw/hfi1/driver.c                |  2 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c              |  4 ++--
 drivers/infiniband/hw/irdma/cm.c                   |  4 ++--
 drivers/infiniband/hw/irdma/utils.c                |  2 +-
 drivers/infiniband/hw/mthca/mthca_catas.c          |  2 +-
 drivers/infiniband/hw/qib/qib_driver.c             |  2 +-
 drivers/infiniband/hw/qib/qib_iba6120.c            |  4 ++--
 drivers/infiniband/hw/qib/qib_iba7220.c            |  6 +++---
 drivers/infiniband/hw/qib/qib_iba7322.c            |  6 +++---
 drivers/infiniband/hw/qib/qib_mad.c                |  2 +-
 drivers/infiniband/hw/qib/qib_sd7220.c             |  2 +-
 drivers/infiniband/hw/qib/qib_tx.c                 |  2 +-
 drivers/infiniband/sw/rdmavt/qp.c                  |  2 +-
 drivers/input/serio/hp_sdc.c                       |  2 +-
 drivers/isdn/hardware/mISDN/hfcpci.c               |  6 +++---
 drivers/isdn/hardware/mISDN/mISDNipac.c            |  2 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c            |  2 +-
 drivers/isdn/hardware/mISDN/w6692.c                |  2 +-
 drivers/isdn/mISDN/dsp_cmx.c                       |  2 +-
 drivers/isdn/mISDN/dsp_core.c                      |  2 +-
 drivers/isdn/mISDN/dsp_tones.c                     |  4 ++--
 drivers/isdn/mISDN/fsm.c                           |  4 ++--
 drivers/isdn/mISDN/l1oip_core.c                    |  2 +-
 drivers/isdn/mISDN/timerdev.c                      |  2 +-
 drivers/leds/trigger/ledtrig-pattern.c             |  2 +-
 drivers/md/bcache/stats.c                          |  4 ++--
 drivers/md/dm-raid1.c                              |  2 +-
 drivers/media/dvb-core/dmxdev.c                    |  2 +-
 drivers/media/i2c/tc358743.c                       |  2 +-
 drivers/media/pci/bt8xx/bttv-input.c               |  2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |  6 +++---
 drivers/media/pci/saa7134/saa7134-input.c          |  2 +-
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  4 ++--
 .../platform/st/sti/c8sectpfe/c8sectpfe-core.c     |  4 ++--
 drivers/media/radio/radio-cadet.c                  |  4 ++--
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c            | 10 +++++-----
 drivers/misc/cardreader/rtsx_usb.c                 |  2 +-
 drivers/misc/sgi-xp/xpc.h                          |  2 +-
 drivers/misc/sgi-xp/xpc_main.c                     |  2 +-
 drivers/misc/sgi-xp/xpc_partition.c                |  2 +-
 drivers/mmc/host/vub300.c                          |  6 +++---
 drivers/most/most_usb.c                            |  2 +-
 drivers/net/eql.c                                  |  4 ++--
 drivers/net/ethernet/3com/3c515.c                  |  2 +-
 drivers/net/ethernet/3com/3c574_cs.c               |  6 +++---
 drivers/net/ethernet/3com/3c589_cs.c               |  4 ++--
 drivers/net/ethernet/8390/axnet_cs.c               |  4 ++--
 drivers/net/ethernet/8390/pcnet_cs.c               |  4 ++--
 drivers/net/ethernet/agere/et131x.c                |  2 +-
 drivers/net/ethernet/amd/amd8111e.c                |  2 +-
 drivers/net/ethernet/apple/bmac.c                  |  2 +-
 drivers/net/ethernet/apple/mace.c                  |  2 +-
 drivers/net/ethernet/broadcom/b44.c                |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c       |  4 ++--
 drivers/net/ethernet/broadcom/tg3.c                |  4 ++--
 drivers/net/ethernet/dec/tulip/21142.c             |  6 +++---
 drivers/net/ethernet/dec/tulip/de2104x.c           |  8 ++++----
 drivers/net/ethernet/dec/tulip/dmfe.c              |  8 ++++----
 drivers/net/ethernet/dec/tulip/pnic2.c             |  6 +++---
 drivers/net/ethernet/dec/tulip/timer.c             |  4 ++--
 drivers/net/ethernet/dec/tulip/tulip_core.c        |  2 +-
 drivers/net/ethernet/dec/tulip/uli526x.c           |  6 +++---
 drivers/net/ethernet/dec/tulip/winbond-840.c       |  4 ++--
 drivers/net/ethernet/dlink/dl2k.c                  |  6 +++---
 drivers/net/ethernet/fealnx.c                      |  6 +++---
 drivers/net/ethernet/marvell/mv643xx_eth.c         |  4 ++--
 drivers/net/ethernet/marvell/pxa168_eth.c          |  2 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c         |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/health.c   |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c              |  6 +++---
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c             |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c       |  4 ++--
 drivers/net/ethernet/packetengines/yellowfin.c     |  4 ++--
 drivers/net/ethernet/realtek/atp.c                 |  4 ++--
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c    |  4 ++--
 drivers/net/ethernet/seeq/ether3.c                 |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c                |  4 ++--
 drivers/net/ethernet/sis/sis190.c                  |  2 +-
 drivers/net/ethernet/sis/sis900.c                  |  4 ++--
 drivers/net/ethernet/smsc/epic100.c                |  4 ++--
 drivers/net/ethernet/smsc/smc91c92_cs.c            |  4 ++--
 drivers/net/ethernet/sun/niu.c                     | 10 +++++-----
 drivers/net/ethernet/sun/sunbmac.c                 |  4 ++--
 drivers/net/ethernet/sun/sunhme.c                  |  4 ++--
 drivers/net/ethernet/ti/cpsw_ale.c                 |  4 ++--
 drivers/net/ethernet/ti/netcp_ethss.c              |  4 ++--
 drivers/net/ethernet/ti/tlan.c                     | 12 ++++++------
 drivers/net/fddi/defza.c                           |  4 ++--
 drivers/net/hamradio/scc.c                         |  8 ++++----
 drivers/net/hamradio/yam.c                         |  4 ++--
 drivers/net/hippi/rrunner.c                        |  4 ++--
 drivers/net/slip/slip.c                            |  4 ++--
 drivers/net/usb/sierra_net.c                       |  2 +-
 drivers/net/wan/hdlc_cisco.c                       |  4 ++--
 drivers/net/wan/hdlc_fr.c                          |  4 ++--
 drivers/net/wan/hdlc_ppp.c                         |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/sdio.c    |  2 +-
 drivers/net/wireless/intel/ipw2x00/libipw_crypto.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7921/main.c   |  2 +-
 drivers/net/wireless/purelifi/plfxlc/usb.c         |  4 ++--
 drivers/net/wireless/rsi/rsi_91x_hal.c             |  2 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c        |  2 +-
 drivers/pci/hotplug/cpqphp_ctrl.c                  |  4 ++--
 drivers/pci/hotplug/shpchp_hpc.c                   |  2 +-
 drivers/pcmcia/i82365.c                            |  4 ++--
 drivers/pcmcia/tcic.c                              |  2 +-
 drivers/pcmcia/yenta_socket.c                      |  2 +-
 drivers/pps/clients/pps-gpio.c                     |  4 ++--
 drivers/rtc/dev.c                                  |  2 +-
 drivers/rtc/rtc-test.c                             |  4 ++--
 drivers/s390/char/con3215.c                        |  4 ++--
 drivers/s390/char/sclp.c                           |  2 +-
 drivers/s390/char/sclp_vt220.c                     |  2 +-
 drivers/s390/char/tape_core.c                      |  2 +-
 drivers/s390/net/fsm.c                             |  4 ++--
 drivers/s390/scsi/zfcp_erp.c                       |  2 +-
 drivers/s390/scsi/zfcp_fsf.c                       |  4 ++--
 drivers/scsi/aic7xxx/aic79xx_core.c                |  2 +-
 drivers/scsi/aic94xx/aic94xx_hwi.c                 |  2 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c                 |  2 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                   |  4 ++--
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c                  |  2 +-
 drivers/scsi/bnx2i/bnx2i_iscsi.c                   |  8 ++++----
 drivers/scsi/dc395x.c                              |  4 ++--
 drivers/scsi/esas2r/esas2r_main.c                  |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c              |  2 +-
 drivers/scsi/hisi_sas/hisi_sas_v2_hw.c             |  2 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  4 ++--
 drivers/scsi/ibmvscsi/ibmvscsi.c                   |  2 +-
 drivers/scsi/ipr.c                                 |  8 ++++----
 drivers/scsi/libiscsi.c                            |  2 +-
 drivers/scsi/libsas/sas_expander.c                 |  2 +-
 drivers/scsi/libsas/sas_scsi_host.c                |  4 ++--
 drivers/scsi/megaraid/megaraid_mbox.c              |  2 +-
 drivers/scsi/megaraid/megaraid_mm.c                |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c          |  2 +-
 drivers/scsi/mvsas/mv_sas.c                        |  2 +-
 drivers/scsi/ncr53c8xx.c                           |  2 +-
 drivers/scsi/pmcraid.c                             | 12 ++++++------
 drivers/scsi/qla2xxx/qla_edif.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_iocb.c                    |  2 +-
 drivers/scsi/qla2xxx/qla_os.c                      |  2 +-
 drivers/scsi/qla4xxx/ql4_os.c                      |  2 +-
 drivers/scsi/smartpqi/smartpqi_init.c              |  2 +-
 drivers/scsi/sym53c8xx_2/sym_glue.c                |  2 +-
 drivers/tty/serial/fsl_lpuart.c                    |  2 +-
 drivers/tty/vcc.c                                  |  4 ++--
 drivers/usb/chipidea/otg_fsm.c                     |  2 +-
 drivers/usb/gadget/udc/snps_udc_core.c             | 14 +++++++-------
 drivers/usb/host/xhci.c                            |  2 +-
 drivers/usb/isp1760/isp1760-hcd.c                  |  4 ++--
 drivers/usb/phy/phy-fsl-usb.c                      |  2 +-
 drivers/usb/phy/phy-mv-usb.c                       |  2 +-
 drivers/watchdog/cpwd.c                            |  2 +-
 drivers/xen/grant-table.c                          |  4 ++--
 fs/jbd2/transaction.c                              |  2 +-
 fs/nilfs2/segment.c                                |  4 ++--
 include/linux/timer.h                              |  4 ++--
 include/linux/usb/otg-fsm.h                        |  6 +++---
 kernel/kthread.c                                   |  2 +-
 kernel/rcu/tasks.h                                 |  4 ++--
 kernel/time/sleep_timeout.c                        |  2 +-
 kernel/time/timer.c                                | 22 +++++++++++-----------
 mm/oom_kill.c                                      |  2 +-
 net/appletalk/aarp.c                               |  2 +-
 net/appletalk/ddp.c                                |  4 ++--
 net/atm/lec.c                                      |  6 +++---
 net/atm/mpc.c                                      |  2 +-
 net/ax25/af_ax25.c                                 |  2 +-
 net/core/drop_monitor.c                            |  4 ++--
 net/ipv4/igmp.c                                    |  2 +-
 net/lapb/lapb_timer.c                              |  4 ++--
 net/mptcp/pm.c                                     | 20 ++++++++++----------
 net/netfilter/ipset/ip_set_bitmap_gen.h            |  2 +-
 net/netfilter/ipset/ip_set_list_set.c              |  2 +-
 net/netfilter/nf_conntrack_expect.c                |  2 +-
 net/netfilter/nf_conntrack_netlink.c               |  2 +-
 net/netfilter/nfnetlink_log.c                      |  2 +-
 net/netrom/af_netrom.c                             |  2 +-
 net/rose/af_rose.c                                 |  2 +-
 net/rose/rose_link.c                               |  4 ++--
 net/sctp/sm_sideeffect.c                           |  2 +-
 net/x25/af_x25.c                                   |  2 +-
 samples/ftrace/sample-trace-array.c                |  2 +-
 sound/pci/asihpi/asihpi.c                          |  2 +-
 233 files changed, 400 insertions(+), 400 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index dff0646a717b..8a8e54f5beb0 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1003,7 +1003,7 @@ do::
 
 
 Another common problem is deleting timers which restart themselves (by
-calling add_timer() at the end of their timer function).
+calling timer_add() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use timer_delete_sync() (``include/linux/timer.h``) to handle this case.
 
@@ -1338,7 +1338,7 @@ lock.
 
 -  kfree()
 
--  add_timer() and timer_delete()
+-  timer_add() and timer_delete()
 
 Mutex API reference
 ===================
diff --git a/Documentation/scsi/ChangeLog.lpfc b/Documentation/scsi/ChangeLog.lpfc
index ccc48b8359bf..801895f3a284 100644
--- a/Documentation/scsi/ChangeLog.lpfc
+++ b/Documentation/scsi/ChangeLog.lpfc
@@ -796,7 +796,7 @@ Changes from 20040908 to 20040920
 	* Remove unnecessary lpfc_brd_no.  Ensure brd_no assignment is
 	  unique.
 	* Removed unused MAX_FCP_LUN.
-	* Use mod_timer instead of add_timer for fdmi in lpfc_ct.c.
+	* Use mod_timer instead of timer_add for fdmi in lpfc_ct.c.
 	* Fixed misc discovery problems.
 	* Move stopping timers till just before lpfc_mem_free() call.
 	* Fix up NameServer reglogin error path.
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 4c21cf60f775..526da3e779de 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1024,7 +1024,7 @@ esecuzione, quindi possiamo fare come segue::
                     spin_unlock_bh(&list_lock);
 
 Un altro problema è l'eliminazione dei temporizzatori che si riavviano
-da soli (chiamando add_timer() alla fine della loro esecuzione).
+da soli (chiamando timer_add() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
 alle corse critiche, dovreste usare timer_delete_sync()
 (``include/linux/timer.h``) per gestire questo caso.
@@ -1377,7 +1377,7 @@ contesto, o trattenendo un qualsiasi *lock*.
 
 -  kfree()
 
--  add_timer() e timer_delete()
+-  timer_add() e timer_delete()
 
 Riferimento per l'API dei Mutex
 ===============================
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 582d96548385..e65c10820fb7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -381,7 +381,7 @@ __get_wchan(struct task_struct *p)
 	 * This one depends on the frame size of schedule().  Do a
 	 * "disass schedule" in gdb to find the frame size.  Also, the
 	 * code assumes that sleep_on() follows immediately after
-	 * interruptible_sleep_on() and that add_timer() follows
+	 * interruptible_sleep_on() and that timer_add() follows
 	 * immediately after interruptible_sleep().  Ugly, isn't it?
 	 * Maybe adding a wchan field to task_struct would be better,
 	 * after all...
diff --git a/arch/arm/mach-footbridge/dc21285.c b/arch/arm/mach-footbridge/dc21285.c
index 6521ab3d24fa..de515121e3f0 100644
--- a/arch/arm/mach-footbridge/dc21285.c
+++ b/arch/arm/mach-footbridge/dc21285.c
@@ -193,7 +193,7 @@ static irqreturn_t dc21285_serr_irq(int irq, void *dev_id)
 	 */
 	disable_irq(irq);
 	timer->expires = jiffies + HZ;
-	add_timer(timer);
+	timer_add(timer);
 
 	return IRQ_HANDLED;
 }
@@ -237,7 +237,7 @@ static irqreturn_t dc21285_parity_irq(int irq, void *dev_id)
 	 */
 	disable_irq(irq);
 	timer->expires = jiffies + HZ;
-	add_timer(timer);
+	timer_add(timer);
 
 	return IRQ_HANDLED;
 }
diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
index 5fd93dfab809..2ba5a5df0272 100644
--- a/arch/m68k/amiga/amisound.c
+++ b/arch/m68k/amiga/amisound.c
@@ -96,7 +96,7 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
 
 		if (ticks) {
 			sound_timer.expires = jiffies + ticks;
-			add_timer( &sound_timer );
+			timer_add( &sound_timer );
 		}
 
 		/* turn on DMA for audio channel 2 */
diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
index 6312d5b600a5..40e1e2c137a4 100644
--- a/arch/m68k/mac/macboing.c
+++ b/arch/m68k/mac/macboing.c
@@ -201,7 +201,7 @@ void mac_mksound( unsigned int freq, unsigned int length )
 	mac_asc_regs[ ASC_ENABLE ] = ASC_ENABLE_SAMPLE;
 
 	mac_sound_timer.expires = jiffies + length;
-	add_timer( &mac_sound_timer );
+	timer_add( &mac_sound_timer );
 
 	local_irq_restore(flags);
 }
@@ -253,7 +253,7 @@ static void mac_quadra_start_bell( unsigned int freq, unsigned int length, unsig
 
 	mac_sound_timer.function = mac_quadra_ring_bell;
 	mac_sound_timer.expires = jiffies + 1;
-	add_timer( &mac_sound_timer );
+	timer_add( &mac_sound_timer );
 
 	local_irq_restore(flags);
 }
@@ -287,7 +287,7 @@ static void mac_quadra_ring_bell(struct timer_list *unused)
 			mac_asc_regs[ 0 ] = mac_asc_wave_tab[ mac_bell_phase & ( sizeof( mac_asc_wave_tab ) - 1 ) ];
 		}
 		mac_sound_timer.expires = jiffies + 1;
-		add_timer( &mac_sound_timer );
+		timer_add( &mac_sound_timer );
 	}
 	else
 		mac_asc_regs[ 0x801 ] = 0;
diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index 8539f562f5b8..32b0f9f1d877 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -102,7 +102,7 @@ static void debounce(struct timer_list *unused)
 	if (sgint->istat1 & SGINT_ISTAT1_PWR) {
 		/* Interrupt still being sent. */
 		debounce_timer.expires = jiffies + (HZ / 20); /* 0.05s	*/
-		add_timer(&debounce_timer);
+		timer_add(&debounce_timer);
 
 		sgioc->panel = SGIOC_PANEL_POWERON | SGIOC_PANEL_POWERINTR |
 			       SGIOC_PANEL_VOLDNINTR | SGIOC_PANEL_VOLDNHOLD |
@@ -134,7 +134,7 @@ static inline void power_button(void)
 
 	timer_setup(&power_timer, power_timeout, 0);
 	power_timer.expires = jiffies + POWERDOWN_TIMEOUT * HZ;
-	add_timer(&power_timer);
+	timer_add(&power_timer);
 }
 
 static irqreturn_t panel_int(int irq, void *dev_id)
@@ -149,7 +149,7 @@ static irqreturn_t panel_int(int irq, void *dev_id)
 		disable_irq_nosync(SGI_PANEL_IRQ);
 		timer_setup(&debounce_timer, debounce, 0);
 		debounce_timer.expires = jiffies + 5;
-		add_timer(&debounce_timer);
+		timer_add(&debounce_timer);
 	}
 
 	/* Power button was pressed
diff --git a/arch/mips/sgi-ip32/ip32-reset.c b/arch/mips/sgi-ip32/ip32-reset.c
index 6bdc1421cda4..ef778499ebd3 100644
--- a/arch/mips/sgi-ip32/ip32-reset.c
+++ b/arch/mips/sgi-ip32/ip32-reset.c
@@ -108,7 +108,7 @@ void ip32_prepare_poweroff(void)
 
 	timer_setup(&power_timer, power_timeout, 0);
 	power_timer.expires = jiffies + POWERDOWN_TIMEOUT * HZ;
-	add_timer(&power_timer);
+	timer_add(&power_timer);
 }
 
 static int panic_event(struct notifier_block *this, unsigned long event,
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 5158aefe4873..87b080bbd57c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1328,7 +1328,7 @@ static void __init htab_initialize(void)
 
 		timer_setup(&stress_hpt_timer, stress_hpt_timer_fn, 0);
 		stress_hpt_timer.expires = jiffies + msecs_to_jiffies(10);
-		add_timer(&stress_hpt_timer);
+		timer_add(&stress_hpt_timer);
 	}
 
 	/*
diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index 4fda05aa83ba..29637125c652 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -351,7 +351,7 @@ static irqreturn_t kw_i2c_irq(int irq, void *dev_id)
 	kw_i2c_handle_interrupt(host, kw_read_reg(reg_isr));
 	if (host->state != state_idle) {
 		host->timeout_timer.expires = jiffies + KW_POLL_TIMEOUT;
-		add_timer(&host->timeout_timer);
+		timer_add(&host->timeout_timer);
 	}
 	spin_unlock_irqrestore(&host->lock, flags);
 	return IRQ_HANDLED;
@@ -374,7 +374,7 @@ static void kw_i2c_timeout(struct timer_list *t)
 	kw_i2c_handle_interrupt(host, kw_read_reg(reg_isr));
 	if (host->state != state_idle) {
 		host->timeout_timer.expires = jiffies + KW_POLL_TIMEOUT;
-		add_timer(&host->timeout_timer);
+		timer_add(&host->timeout_timer);
 	}
  skip:
 	spin_unlock_irqrestore(&host->lock, flags);
@@ -454,7 +454,7 @@ static int kw_i2c_xfer(struct pmac_i2c_bus *bus, u8 addrdir, int subsize,
 		kw_write_reg(reg_isr, kw_read_reg(reg_isr));
 		/* Arm timeout */
 		host->timeout_timer.expires = jiffies + KW_POLL_TIMEOUT;
-		add_timer(&host->timeout_timer);
+		timer_add(&host->timeout_timer);
 		/* Enable emission */
 		kw_write_reg(reg_ier, KW_I2C_IRQ_MASK);
 	}
diff --git a/arch/sh/drivers/pci/common.c b/arch/sh/drivers/pci/common.c
index 9633b6147a05..5f94c9c0e713 100644
--- a/arch/sh/drivers/pci/common.c
+++ b/arch/sh/drivers/pci/common.c
@@ -152,7 +152,7 @@ unsigned int pcibios_handle_status_errors(unsigned long addr,
 		if (hose->err_irq) {
 			disable_irq_nosync(hose->err_irq);
 			hose->err_timer.expires = jiffies + HZ;
-			add_timer(&hose->err_timer);
+			timer_add(&hose->err_timer);
 		}
 	}
 
diff --git a/arch/sh/drivers/pci/pci-sh7780.c b/arch/sh/drivers/pci/pci-sh7780.c
index 9a624a6ee354..40838315c6f4 100644
--- a/arch/sh/drivers/pci/pci-sh7780.c
+++ b/arch/sh/drivers/pci/pci-sh7780.c
@@ -156,7 +156,7 @@ static irqreturn_t sh7780_pci_serr_irq(int irq, void *dev_id)
 	/* Back off the IRQ for awhile */
 	disable_irq_nosync(irq);
 	hose->serr_timer.expires = jiffies + HZ;
-	add_timer(&hose->serr_timer);
+	timer_add(&hose->serr_timer);
 
 	return IRQ_HANDLED;
 }
diff --git a/arch/sparc/kernel/led.c b/arch/sparc/kernel/led.c
index f4fb82b019bb..fb2974f70f84 100644
--- a/arch/sparc/kernel/led.c
+++ b/arch/sparc/kernel/led.c
@@ -47,7 +47,7 @@ static void led_blink(struct timer_list *unused)
 	} else { /* blink at user specified interval */
 		led_blink_timer.expires = jiffies + (timeout * HZ);
 	}
-	add_timer(&led_blink_timer);
+	timer_add(&led_blink_timer);
 }
 
 #ifdef CONFIG_PROC_FS
diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 570a14f9f995..abaf9fdb8ab2 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1302,7 +1302,7 @@ static int vector_net_open(struct net_device *dev)
 	vdevice->opened = 1;
 
 	if ((vp->options & VECTOR_TX) != 0)
-		add_timer(&vp->tl);
+		timer_add(&vp->tl);
 	return 0;
 out_close:
 	vector_net_close(dev);
diff --git a/arch/x86/kernel/tsc_sync.c b/arch/x86/kernel/tsc_sync.c
index 4334033658ed..982a407fb1fb 100644
--- a/arch/x86/kernel/tsc_sync.c
+++ b/arch/x86/kernel/tsc_sync.c
@@ -113,7 +113,7 @@ static int __init start_sync_check_timer(void)
 
 	timer_setup(&tsc_sync_check_timer, tsc_sync_check_timer_fn, 0);
 	tsc_sync_check_timer.expires = jiffies + SYNC_CHECK_INTERVAL;
-	add_timer(&tsc_sync_check_timer);
+	timer_add(&tsc_sync_check_timer);
 
 	return 0;
 }
diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 5bfd70311359..a1ec4946b928 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -1073,7 +1073,7 @@ static void ioc_start_period(struct ioc *ioc, struct ioc_now *now)
 	write_seqcount_end(&ioc->period_seqcount);
 
 	ioc->timer.expires = jiffies + usecs_to_jiffies(ioc->period_us);
-	add_timer(&ioc->timer);
+	timer_add(&ioc->timer);
 }
 
 /*
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 3fac540f8e03..1b59c51ea44a 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -204,7 +204,7 @@ static int qaic_timesync_probe(struct mhi_device *mhi_dev, const struct mhi_devi
 	mqtsdev->qtimer_addr = qdev->bar_mhi + QTIMER_REG_OFFSET;
 	timer_setup(timer, qaic_timesync_timer, 0);
 	timer->expires = jiffies + msecs_to_jiffies(timesync_delay_ms);
-	add_timer(timer);
+	timer_add(timer);
 	dev_set_drvdata(&mhi_dev->dev, mqtsdev);
 
 	return 0;
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index f5e6400bfbfb..9a8ace68dc2b 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1133,7 +1133,7 @@ static void ghes_add_timer(struct ghes *ghes)
 	}
 	expire = jiffies + msecs_to_jiffies(g->notify.poll_interval);
 	ghes->timer.expires = round_jiffies_relative(expire);
-	add_timer(&ghes->timer);
+	timer_add(&ghes->timer);
 }
 
 static void ghes_poll_func(struct timer_list *t)
diff --git a/drivers/ata/libata-eh.c b/drivers/ata/libata-eh.c
index 883d33db7972..141057623914 100644
--- a/drivers/ata/libata-eh.c
+++ b/drivers/ata/libata-eh.c
@@ -890,7 +890,7 @@ void ata_eh_fastdrain_timerfn(struct timer_list *t)
 		ap->fastdrain_cnt = cnt;
 		ap->fastdrain_timer.expires =
 			ata_deadline(jiffies, ATA_EH_FASTDRAIN_INTERVAL);
-		add_timer(&ap->fastdrain_timer);
+		timer_add(&ap->fastdrain_timer);
 	}
 
  out_unlock:
@@ -931,7 +931,7 @@ static void ata_eh_set_pending(struct ata_port *ap, int fastdrain)
 	ap->fastdrain_cnt = cnt;
 	ap->fastdrain_timer.expires =
 		ata_deadline(jiffies, ATA_EH_FASTDRAIN_INTERVAL);
-	add_timer(&ap->fastdrain_timer);
+	timer_add(&ap->fastdrain_timer);
 }
 
 /**
diff --git a/drivers/atm/idt77105.c b/drivers/atm/idt77105.c
index e6a300203e6c..2dd628debe11 100644
--- a/drivers/atm/idt77105.c
+++ b/drivers/atm/idt77105.c
@@ -308,10 +308,10 @@ static int idt77105_start(struct atm_dev *dev)
 		start_timer = 0;
                 
 		stats_timer.expires = jiffies+IDT77105_STATS_TIMER_PERIOD;
-		add_timer(&stats_timer);
+		timer_add(&stats_timer);
                 
 		restart_timer.expires = jiffies+IDT77105_RESTART_TIMER_PERIOD;
-		add_timer(&restart_timer);
+		timer_add(&restart_timer);
 	}
 	spin_unlock_irqrestore(&idt77105_priv_lock, flags);
 	return 0;
diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index 1206ab764ba9..c7c0cd9ca86a 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -2102,7 +2102,7 @@ idt77252_est_timer(struct timer_list *t)
 	}
 
 	est->timer.expires = jiffies + ((HZ / 4) << est->interval);
-	add_timer(&est->timer);
+	timer_add(&est->timer);
 
 out:
 	spin_unlock_irqrestore(&vc->lock, flags);
diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 301e697e22ad..246ec28aca4f 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2737,7 +2737,7 @@ static int ia_open(struct atm_vcc *vcc)
            static u8 first = 1; 
            if (first) {
               ia_timer.expires = jiffies + 3*HZ;
-              add_timer(&ia_timer);
+              timer_add(&ia_timer);
               first = 0;
            }           
         }
@@ -3273,7 +3273,7 @@ static int __init ia_module_init(void)
 	ret = pci_register_driver(&ia_driver);
 	if (ret >= 0) {
 		ia_timer.expires = jiffies + 3*HZ;
-		add_timer(&ia_timer); 
+		timer_add(&ia_timer); 
 	} else
 		printk(KERN_ERR DEV_LABEL ": no adapter found\n");  
 	return ret;
diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 2a1fe3080712..d8ac6fade09a 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -1787,7 +1787,7 @@ static inline void lanai_timed_poll_start(struct lanai_dev *lanai)
 {
 	timer_setup(&lanai->timer, lanai_timed_poll, 0);
 	lanai->timer.expires = jiffies + LANAI_POLL_PERIOD;
-	add_timer(&lanai->timer);
+	timer_add(&lanai->timer);
 }
 
 static inline void lanai_timed_poll_stop(struct lanai_dev *lanai)
diff --git a/drivers/atm/nicstar.c b/drivers/atm/nicstar.c
index 45952cfea06b..028bb868180b 100644
--- a/drivers/atm/nicstar.c
+++ b/drivers/atm/nicstar.c
@@ -290,7 +290,7 @@ static int __init nicstar_init(void)
 	if (!error) {
 		timer_setup(&ns_timer, ns_poll, 0);
 		ns_timer.expires = jiffies + NS_POLL_PERIOD;
-		add_timer(&ns_timer);
+		timer_add(&ns_timer);
 	}
 
 	return error;
diff --git a/drivers/atm/suni.c b/drivers/atm/suni.c
index 7d0fa729c2fe..899bab8b3c43 100644
--- a/drivers/atm/suni.c
+++ b/drivers/atm/suni.c
@@ -331,7 +331,7 @@ static int suni_start(struct atm_dev *dev)
 printk(KERN_DEBUG "[u] p=0x%lx,n=0x%lx\n",(unsigned long) poll_timer.list.prev,
     (unsigned long) poll_timer.list.next);
 #endif
-		add_timer(&poll_timer);
+		timer_add(&poll_timer);
 	}
 	return 0;
 }
diff --git a/drivers/auxdisplay/panel.c b/drivers/auxdisplay/panel.c
index 958c0e31e84a..ccfd0b06ed6c 100644
--- a/drivers/auxdisplay/panel.c
+++ b/drivers/auxdisplay/panel.c
@@ -1360,7 +1360,7 @@ static void init_scan_timer(void)
 
 	timer_setup(&scan_timer, panel_scan_timer, 0);
 	scan_timer.expires = jiffies + INPUT_POLL_TIME;
-	add_timer(&scan_timer);
+	timer_add(&scan_timer);
 }
 
 /* converts a name of the form "({BbAaPpSsEe}{01234567-})*" to a series of bits.
diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 318d4a4efbea..c47b246dbf87 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -548,7 +548,7 @@ static void dpm_watchdog_set(struct dpm_watchdog *wd, struct device *dev)
 	timer_setup_on_stack(timer, dpm_watchdog_handler, 0);
 	/* use same timeout value for both suspend and resume */
 	timer->expires = jiffies + HZ * CONFIG_DPM_WATCHDOG_WARNING_TIMEOUT;
-	add_timer(timer);
+	timer_add(timer);
 }
 
 /**
diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index 6357d86eafdc..5e7060874912 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -449,7 +449,7 @@ static void motor_on_callback(struct timer_list *unused)
 		complete_all(&motor_on_completion);
 	} else {
 		motor_on_timer.expires = jiffies + HZ/10;
-		add_timer(&motor_on_timer);
+		timer_add(&motor_on_timer);
 	}
 }
 
@@ -495,7 +495,7 @@ static void fd_motor_off(struct timer_list *timer)
 	if (!try_fdc(drive)) {
 		/* We would be blocked in an interrupt, so try again later */
 		timer->expires = jiffies + 1;
-		add_timer(timer);
+		timer_add(timer);
 		return;
 	}
 	unit[drive].motor = 0;
@@ -680,7 +680,7 @@ static irqreturn_t fd_block_done(int irq, void *dummy)
 		writepending = 2;
 		post_write_timer.expires = jiffies + 1; /* at least 2 ms */
 		post_write_timer_drive = selected;
-		add_timer(&post_write_timer);
+		timer_add(&post_write_timer);
 	}
 	else {                /* reading */
 		block_flag = 0;
@@ -1374,7 +1374,7 @@ static void flush_track_callback(struct timer_list *timer)
 	if (!try_fdc(nr)) {
 		/* we might block in an interrupt, so try again later */
 		flush_track_timer[nr].expires = jiffies + 1;
-		add_timer(flush_track_timer + nr);
+		timer_add(flush_track_timer + nr);
 		return;
 	}
 	get_fdc(nr);
diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 50cc90f6ab35..01bba6a7d2ea 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -824,7 +824,7 @@ rexmit_timer(struct timer_list *timer)
 	}
 
 	d->timer.expires = jiffies + TIMERTICK;
-	add_timer(&d->timer);
+	timer_add(&d->timer);
 
 	spin_unlock_irqrestore(&d->lock, flags);
 }
diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index bba05f0c5bbd..4cbffbfb06e6 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -153,7 +153,7 @@ dummy_timer(struct timer_list *t)
 	if (d->flags & DEVFL_TKILL)
 		return;
 	d->timer.expires = jiffies + HZ;
-	add_timer(&d->timer);
+	timer_add(&d->timer);
 }
 
 static void
@@ -476,7 +476,7 @@ aoedev_by_aoeaddr(ulong maj, int min, int do_alloc)
 	skb_queue_head_init(&d->skbpool);
 	timer_setup(&d->timer, dummy_timer, 0);
 	d->timer.expires = jiffies + HZ;
-	add_timer(&d->timer);
+	timer_add(&d->timer);
 	d->bufpool = NULL;	/* defer to aoeblk_gdalloc */
 	d->tgt = d->targets;
 	d->ref = 1;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e5a2e5f7887b..fbda55ba253e 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5841,7 +5841,7 @@ static int got_BarrierAck(struct drbd_connection *connection, struct packet_info
 		    atomic_read(&device->ap_in_flight) == 0 &&
 		    !test_and_set_bit(AHEAD_TO_SYNC_SOURCE, &device->flags)) {
 			device->start_resync_timer.expires = jiffies + HZ;
-			add_timer(&device->start_resync_timer);
+			timer_add(&device->start_resync_timer);
 		}
 	}
 	rcu_read_unlock();
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 50ee616c6c5d..1d61328582e2 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1707,7 +1707,7 @@ static void do_start_resync(struct drbd_device *device)
 	if (atomic_read(&device->unacked_cnt) || atomic_read(&device->rs_pending_cnt)) {
 		drbd_warn(device, "postponing start_resync ...\n");
 		device->start_resync_timer.expires = jiffies + HZ/10;
-		add_timer(&device->start_resync_timer);
+		timer_add(&device->start_resync_timer);
 		return;
 	}
 
@@ -1789,7 +1789,7 @@ void drbd_start_resync(struct drbd_device *device, enum drbd_conns side)
 		if (!mutex_trylock(device->state_mutex)) {
 			set_bit(B_RS_H_DONE, &device->flags);
 			device->start_resync_timer.expires = jiffies + HZ/5;
-			add_timer(&device->start_resync_timer);
+			timer_add(&device->start_resync_timer);
 			return;
 		}
 	} else {
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index e97432032f01..a185aca5f34e 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -948,7 +948,7 @@ static void floppy_off(unsigned int drive)
 		motor_off_timer[drive].expires =
 		    jiffies + drive_params[drive].spindown - delta;
 	}
-	add_timer(motor_off_timer + drive);
+	timer_add(motor_off_timer + drive);
 }
 
 /*
diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index 01f7aef3fcfb..5b4b6f5bde09 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -365,7 +365,7 @@ static void set_timeout(struct floppy_state *fs, int nticks,
 		timer_delete(&fs->timeout);
 	fs->timeout.expires = jiffies + nticks;
 	fs->timeout.function = proc;
-	add_timer(&fs->timeout);
+	timer_add(&fs->timeout);
 	fs->timeout_pending = 1;
 }
 
diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/xgene-rng.c
index 709a36507145..00b74d07c3db 100644
--- a/drivers/char/hw_random/xgene-rng.c
+++ b/drivers/char/hw_random/xgene-rng.c
@@ -100,7 +100,7 @@ static void xgene_rng_expired_timer(struct timer_list *t)
 static void xgene_rng_start_timer(struct xgene_rng_dev *ctx)
 {
 	ctx->failure_timer.expires = jiffies + 120 * HZ;
-	add_timer(&ctx->failure_timer);
+	timer_add(&ctx->failure_timer);
 }
 
 /*
diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index a179d4797011..4f1b2a3eeb54 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -351,7 +351,7 @@ static void poll_timer(struct timer_list *t)
 
 	bt_bmc->poll_timer.expires += msecs_to_jiffies(500);
 	wake_up(&bt_bmc->queue);
-	add_timer(&bt_bmc->poll_timer);
+	timer_add(&bt_bmc->poll_timer);
 }
 
 static irqreturn_t bt_bmc_irq(int irq, void *arg)
@@ -444,7 +444,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		dev_info(dev, "No IRQ; using timer\n");
 		timer_setup(&bt_bmc->poll_timer, poll_timer, 0);
 		bt_bmc->poll_timer.expires = jiffies + msecs_to_jiffies(10);
-		add_timer(&bt_bmc->poll_timer);
+		timer_add(&bt_bmc->poll_timer);
 	}
 
 	writel((BT_IO_BASE << BT_CR0_IO_BASE) |
diff --git a/drivers/comedi/drivers/comedi_test.c b/drivers/comedi/drivers/comedi_test.c
index 71124b694bf3..b15cb3d62e26 100644
--- a/drivers/comedi/drivers/comedi_test.c
+++ b/drivers/comedi/drivers/comedi_test.c
@@ -403,7 +403,7 @@ static int waveform_ai_cmd(struct comedi_device *dev,
 	devpriv->ai_timer_enable = true;
 	devpriv->ai_timer.expires =
 		jiffies + usecs_to_jiffies(devpriv->ai_convert_period) + 1;
-	add_timer(&devpriv->ai_timer);
+	timer_add(&devpriv->ai_timer);
 	spin_unlock_bh(&dev->spinlock);
 	return 0;
 }
@@ -537,7 +537,7 @@ static int waveform_ao_inttrig_start(struct comedi_device *dev,
 	devpriv->ao_timer_enable = true;
 	devpriv->ao_timer.expires =
 		jiffies + usecs_to_jiffies(devpriv->ao_scan_period);
-	add_timer(&devpriv->ao_timer);
+	timer_add(&devpriv->ao_timer);
 	spin_unlock_bh(&dev->spinlock);
 
 	return 1;
diff --git a/drivers/comedi/drivers/das16.c b/drivers/comedi/drivers/das16.c
index a2588b35e156..5e0866d5d1d6 100644
--- a/drivers/comedi/drivers/das16.c
+++ b/drivers/comedi/drivers/das16.c
@@ -739,7 +739,7 @@ static int das16_cmd_exec(struct comedi_device *dev, struct comedi_subdevice *s)
 	spin_lock_irqsave(&dev->spinlock, flags);
 	devpriv->timer_running = 1;
 	devpriv->timer.expires = jiffies + timer_period();
-	add_timer(&devpriv->timer);
+	timer_add(&devpriv->timer);
 
 	/* enable DMA interrupt with external or internal pacing */
 	devpriv->ctrl_reg &= ~(DAS16_CTRL_INTE | DAS16_CTRL_PACING_MASK);
diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pci.c
index 18a23d6625f6..827e8e2034e4 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -599,7 +599,7 @@ static void jr3_pci_poll_dev(struct timer_list *t)
 	spin_unlock_irqrestore(&dev->spinlock, flags);
 
 	devpriv->timer.expires = jiffies + msecs_to_jiffies(delay);
-	add_timer(&devpriv->timer);
+	timer_add(&devpriv->timer);
 }
 
 static struct jr3_pci_subdev_private *
@@ -748,7 +748,7 @@ static int jr3_pci_auto_attach(struct comedi_device *dev,
 	devpriv->dev = dev;
 	timer_setup(&devpriv->timer, jr3_pci_poll_dev, 0);
 	devpriv->timer.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&devpriv->timer);
+	timer_add(&devpriv->timer);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 788f56b066b6..4ded38304a52 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -251,7 +251,7 @@ static void xe_execlist_port_irq_fail_timer(struct timer_list *timer)
 	spin_unlock_irq(&port->lock);
 
 	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&port->irq_fail);
+	timer_add(&port->irq_fail);
 }
 
 struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
@@ -287,7 +287,7 @@ struct xe_execlist_port *xe_execlist_port_create(struct xe_device *xe,
 	/* TODO: Fix the interrupt code so it doesn't race like mad */
 	timer_setup(&port->irq_fail, xe_execlist_port_irq_fail_timer, 0);
 	port->irq_fail.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&port->irq_fail);
+	timer_add(&port->irq_fail);
 
 	return port;
 
diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 6d02ab77e32d..04e7d5408ce1 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -771,7 +771,7 @@ int gb_operation_request_send(struct gb_operation *operation,
 
 	if (timeout) {
 		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
-		add_timer(&operation->timer);
+		timer_add(&operation->timer);
 	}
 
 	return 0;
diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 802c73def428..227dd14fd5c4 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -361,7 +361,7 @@ static void npcm7xx_fan_polling(struct timer_list *t)
 	/* reset the timer interval */
 	data->fan_timer.expires = jiffies +
 		msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
-	add_timer(&data->fan_timer);
+	timer_add(&data->fan_timer);
 }
 
 static inline void npcm7xx_fan_compute(struct npcm7xx_pwm_fan_data *data,
@@ -1027,7 +1027,7 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 				msecs_to_jiffies(NPCM7XX_FAN_POLL_TIMER_200MS);
 			timer_setup(&data->fan_timer,
 				    npcm7xx_fan_polling, 0);
-			add_timer(&data->fan_timer);
+			timer_add(&data->fan_timer);
 			break;
 		}
 	}
diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index b3b45c49077d..8d7ee865886b 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -185,7 +185,7 @@ static void start_ep_timer(struct c4iw_ep *ep)
 	clear_bit(TIMEOUT, &ep->com.flags);
 	c4iw_get_ep(&ep->com);
 	ep->timer.expires = jiffies + ep_timeout_secs * HZ;
-	add_timer(&ep->timer);
+	timer_add(&ep->timer);
 }
 
 static int stop_ep_timer(struct c4iw_ep *ep)
diff --git a/drivers/infiniband/hw/hfi1/chip.c b/drivers/infiniband/hw/hfi1/chip.c
index 0781ab756d44..a5eb009a0db7 100644
--- a/drivers/infiniband/hw/hfi1/chip.c
+++ b/drivers/infiniband/hw/hfi1/chip.c
@@ -12605,7 +12605,7 @@ static int init_cntrs(struct hfi1_devdata *dd)
 	const int bit_type_32_sz = strlen(bit_type_32);
 	u32 sdma_engines = chip_sdma_engines(dd);
 
-	/* set up the stats timer; the add_timer is done at the end */
+	/* set up the stats timer; the timer_add is done at the end */
 	timer_setup(&dd->synth_stats_timer, update_synth_timer, 0);
 
 	/***********************/
diff --git a/drivers/infiniband/hw/hfi1/driver.c b/drivers/infiniband/hw/hfi1/driver.c
index 96bffa9e8dc7..2d12278ec96a 100644
--- a/drivers/infiniband/hw/hfi1/driver.c
+++ b/drivers/infiniband/hw/hfi1/driver.c
@@ -1361,7 +1361,7 @@ void hfi1_start_led_override(struct hfi1_pportdata *ppd, unsigned int timeon,
 	if (!timer_pending(&ppd->led_override_timer)) {
 		timer_setup(&ppd->led_override_timer, run_led_override, 0);
 		ppd->led_override_timer.expires = jiffies + 1;
-		add_timer(&ppd->led_override_timer);
+		timer_add(&ppd->led_override_timer);
 		atomic_set(&ppd->led_override_timer_active, 1);
 		/* Ensure the atomic_set is visible to all CPUs */
 		smp_wmb();
diff --git a/drivers/infiniband/hw/hfi1/tid_rdma.c b/drivers/infiniband/hw/hfi1/tid_rdma.c
index 948b5883e9dd..73a600aea617 100644
--- a/drivers/infiniband/hw/hfi1/tid_rdma.c
+++ b/drivers/infiniband/hw/hfi1/tid_rdma.c
@@ -3944,7 +3944,7 @@ static void hfi1_add_tid_reap_timer(struct rvt_qp *qp)
 		qpriv->s_flags |= HFI1_R_TID_RSC_TIMER;
 		qpriv->s_tid_timer.expires = jiffies +
 			qpriv->tid_timer_timeout_jiffies;
-		add_timer(&qpriv->s_tid_timer);
+		timer_add(&qpriv->s_tid_timer);
 	}
 }
 
@@ -4758,7 +4758,7 @@ void hfi1_add_tid_retry_timer(struct rvt_qp *qp)
 		priv->s_flags |= HFI1_S_TID_RETRY_TIMER;
 		priv->s_tid_retry_timer.expires = jiffies +
 			priv->tid_retry_timeout_jiffies + rdi->busy_jiffies;
-		add_timer(&priv->s_tid_retry_timer);
+		timer_add(&priv->s_tid_retry_timer);
 	}
 }
 
diff --git a/drivers/infiniband/hw/irdma/cm.c b/drivers/infiniband/hw/irdma/cm.c
index 2a6d705bd471..12ae5571047e 100644
--- a/drivers/infiniband/hw/irdma/cm.c
+++ b/drivers/infiniband/hw/irdma/cm.c
@@ -1183,7 +1183,7 @@ int irdma_schedule_cm_timer(struct irdma_cm_node *cm_node,
 
 	if (!was_timer_set) {
 		cm_core->tcp_timer.expires = new_send->timetosend;
-		add_timer(&cm_core->tcp_timer);
+		timer_add(&cm_core->tcp_timer);
 	}
 	spin_unlock_irqrestore(&cm_core->ht_lock, flags);
 
@@ -1366,7 +1366,7 @@ static void irdma_cm_timer_tick(struct timer_list *t)
 		spin_lock_irqsave(&cm_core->ht_lock, flags);
 		if (!timer_pending(&cm_core->tcp_timer)) {
 			cm_core->tcp_timer.expires = nexttimeout;
-			add_timer(&cm_core->tcp_timer);
+			timer_add(&cm_core->tcp_timer);
 		}
 		spin_unlock_irqrestore(&cm_core->ht_lock, flags);
 	}
diff --git a/drivers/infiniband/hw/irdma/utils.c b/drivers/infiniband/hw/irdma/utils.c
index b510ef747399..32e775e07afb 100644
--- a/drivers/infiniband/hw/irdma/utils.c
+++ b/drivers/infiniband/hw/irdma/utils.c
@@ -950,7 +950,7 @@ void irdma_terminate_start_timer(struct irdma_sc_qp *qp)
 	timer_setup(&iwqp->terminate_timer, irdma_terminate_timeout, 0);
 	iwqp->terminate_timer.expires = jiffies + HZ;
 
-	add_timer(&iwqp->terminate_timer);
+	timer_add(&iwqp->terminate_timer);
 }
 
 /**
diff --git a/drivers/infiniband/hw/mthca/mthca_catas.c b/drivers/infiniband/hw/mthca/mthca_catas.c
index f1d79968c985..4331aa00c6a7 100644
--- a/drivers/infiniband/hw/mthca/mthca_catas.c
+++ b/drivers/infiniband/hw/mthca/mthca_catas.c
@@ -166,7 +166,7 @@ void mthca_start_catas_poll(struct mthca_dev *dev)
 
 	dev->catas_err.timer.expires  = jiffies + MTHCA_CATAS_POLL_INTERVAL;
 	INIT_LIST_HEAD(&dev->catas_err.list);
-	add_timer(&dev->catas_err.timer);
+	timer_add(&dev->catas_err.timer);
 }
 
 void mthca_stop_catas_poll(struct mthca_dev *dev)
diff --git a/drivers/infiniband/hw/qib/qib_driver.c b/drivers/infiniband/hw/qib/qib_driver.c
index 9c478ab9238b..c3cdf14d32e0 100644
--- a/drivers/infiniband/hw/qib/qib_driver.c
+++ b/drivers/infiniband/hw/qib/qib_driver.c
@@ -713,7 +713,7 @@ void qib_set_led_override(struct qib_pportdata *ppd, unsigned int val)
 		/* Need to start timer */
 		timer_setup(&ppd->led_override_timer, qib_run_led_override, 0);
 		ppd->led_override_timer.expires = jiffies + 1;
-		add_timer(&ppd->led_override_timer);
+		timer_add(&ppd->led_override_timer);
 	} else {
 		if (ppd->led_override_vals[0] || ppd->led_override_vals[1])
 			mod_timer(&ppd->led_override_timer, jiffies + 1);
diff --git a/drivers/infiniband/hw/qib/qib_iba6120.c b/drivers/infiniband/hw/qib/qib_iba6120.c
index 2640d283eee6..bb9d089fac7a 100644
--- a/drivers/infiniband/hw/qib/qib_iba6120.c
+++ b/drivers/infiniband/hw/qib/qib_iba6120.c
@@ -2611,7 +2611,7 @@ static void qib_chk_6120_errormask(struct qib_devdata *dd)
  *
  * This needs more work; in particular, decision on whether we really
  * need traffic_wds done the way it is
- * called from add_timer
+ * called from timer_add
  */
 static void qib_get_6120_faststats(struct timer_list *t)
 {
@@ -3240,7 +3240,7 @@ static int init_6120_variables(struct qib_devdata *dd)
 	 */
 	dd->rhdrhead_intr_off = 1ULL << 32;
 
-	/* setup the stats timer; the add_timer is done at end of init */
+	/* setup the stats timer; the timer_add is done at end of init */
 	timer_setup(&dd->stats_timer, qib_get_6120_faststats, 0);
 	timer_setup(&dd->cspec->pma_timer, pma_6120_timer, 0);
 
diff --git a/drivers/infiniband/hw/qib/qib_iba7220.c b/drivers/infiniband/hw/qib/qib_iba7220.c
index 0b7399d3f46e..2731185dad97 100644
--- a/drivers/infiniband/hw/qib/qib_iba7220.c
+++ b/drivers/infiniband/hw/qib/qib_iba7220.c
@@ -1080,7 +1080,7 @@ static void handle_7220_chase(struct qib_pportdata *ppd, u64 ibcst)
 				QLOGIC_IB_IBCC_LINKINITCMD_DISABLE);
 			ppd->cpspec->chase_timer.expires = jiffies +
 				QIB_CHASE_DIS_TIME;
-			add_timer(&ppd->cpspec->chase_timer);
+			timer_add(&ppd->cpspec->chase_timer);
 		} else if (!ppd->cpspec->chase_end)
 			ppd->cpspec->chase_end = tnow + QIB_CHASE_TIME;
 		break;
@@ -3236,7 +3236,7 @@ static u32 qib_read_7220portcntrs(struct qib_devdata *dd, loff_t pos, u32 port,
  *
  * This needs more work; in particular, decision on whether we really
  * need traffic_wds done the way it is
- * called from add_timer
+ * called from timer_add
  */
 static void qib_get_7220_faststats(struct timer_list *t)
 {
@@ -4051,7 +4051,7 @@ static int qib_init_7220_variables(struct qib_devdata *dd)
 	 */
 	dd->rhdrhead_intr_off = 1ULL << 32;
 
-	/* setup the stats timer; the add_timer is done at end of init */
+	/* setup the stats timer; the timer_add is done at end of init */
 	timer_setup(&dd->stats_timer, qib_get_7220_faststats, 0);
 	dd->stats_timer.expires = jiffies + ACTIVITY_TIMER * HZ;
 
diff --git a/drivers/infiniband/hw/qib/qib_iba7322.c b/drivers/infiniband/hw/qib/qib_iba7322.c
index 71258d17dbe8..f5beacbd2c46 100644
--- a/drivers/infiniband/hw/qib/qib_iba7322.c
+++ b/drivers/infiniband/hw/qib/qib_iba7322.c
@@ -1740,7 +1740,7 @@ static void disable_chase(struct qib_pportdata *ppd, unsigned long tnow,
 	qib_set_ib_7322_lstate(ppd, QLOGIC_IB_IBCC_LINKCMD_DOWN,
 		QLOGIC_IB_IBCC_LINKINITCMD_DISABLE);
 	ppd->cpspec->chase_timer.expires = jiffies + QIB_CHASE_DIS_TIME;
-	add_timer(&ppd->cpspec->chase_timer);
+	timer_add(&ppd->cpspec->chase_timer);
 }
 
 static void handle_serdes_issues(struct qib_pportdata *ppd, u64 ibcst)
@@ -5080,7 +5080,7 @@ static u32 qib_read_7322portcntrs(struct qib_devdata *dd, loff_t pos, u32 port,
  * "active time", which in turn is only logged into the eeprom,
  * which we don;t have, yet, for 7322-based boards.
  *
- * called from add_timer
+ * called from timer_add
  */
 static void qib_get_7322_faststats(struct timer_list *t)
 {
@@ -6574,7 +6574,7 @@ static int qib_init_7322_variables(struct qib_devdata *dd)
 	dd->rhdrhead_intr_off =
 		(u64) rcv_int_count << IBA7322_HDRHEAD_PKTINT_SHIFT;
 
-	/* setup the stats timer; the add_timer is done at end of init */
+	/* setup the stats timer; the timer_add is done at end of init */
 	timer_setup(&dd->stats_timer, qib_get_7322_faststats, 0);
 
 	dd->ureg_align = 0x10000;  /* 64KB alignment */
diff --git a/drivers/infiniband/hw/qib/qib_mad.c b/drivers/infiniband/hw/qib/qib_mad.c
index b4b39c6ee134..a8d909afa4e6 100644
--- a/drivers/infiniband/hw/qib/qib_mad.c
+++ b/drivers/infiniband/hw/qib/qib_mad.c
@@ -2431,7 +2431,7 @@ void qib_notify_create_mad_agent(struct rvt_dev_info *rdi, int port_idx)
 	timer_setup(&dd->pport[port_idx].cong_stats.timer,
 		    xmit_wait_timer_func, 0);
 	dd->pport[port_idx].cong_stats.timer.expires = 0;
-	add_timer(&dd->pport[port_idx].cong_stats.timer);
+	timer_add(&dd->pport[port_idx].cong_stats.timer);
 }
 
 void qib_notify_free_mad_agent(struct rvt_dev_info *rdi, int port_idx)
diff --git a/drivers/infiniband/hw/qib/qib_sd7220.c b/drivers/infiniband/hw/qib/qib_sd7220.c
index 40bc0a34273e..58cccc6c94e6 100644
--- a/drivers/infiniband/hw/qib/qib_sd7220.c
+++ b/drivers/infiniband/hw/qib/qib_sd7220.c
@@ -1436,7 +1436,7 @@ void set_7220_relock_poll(struct qib_devdata *dd, int ibup)
 			timer_setup(&cs->relock_timer, qib_run_relock, 0);
 			cs->relock_interval = timeout;
 			cs->relock_timer.expires = jiffies + timeout;
-			add_timer(&cs->relock_timer);
+			timer_add(&cs->relock_timer);
 		} else {
 			cs->relock_interval = timeout;
 			mod_timer(&cs->relock_timer, jiffies + timeout);
diff --git a/drivers/infiniband/hw/qib/qib_tx.c b/drivers/infiniband/hw/qib/qib_tx.c
index 397928c80f7c..bac1bd975fb0 100644
--- a/drivers/infiniband/hw/qib/qib_tx.c
+++ b/drivers/infiniband/hw/qib/qib_tx.c
@@ -522,7 +522,7 @@ void qib_hol_down(struct qib_pportdata *ppd)
 /*
  * Link is at INIT.
  * We start the HoL timer so we can detect stuck packets blocking SMP replies.
- * Timer may already be running, so use mod_timer, not add_timer.
+ * Timer may already be running, so use mod_timer, not timer_add.
  */
 void qib_hol_init(struct qib_pportdata *ppd)
 {
diff --git a/drivers/infiniband/sw/rdmavt/qp.c b/drivers/infiniband/sw/rdmavt/qp.c
index e825e2ef7966..ef22b4882fdb 100644
--- a/drivers/infiniband/sw/rdmavt/qp.c
+++ b/drivers/infiniband/sw/rdmavt/qp.c
@@ -2513,7 +2513,7 @@ void rvt_add_retry_timer_ext(struct rvt_qp *qp, u8 shift)
        /* 4.096 usec. * (1 << qp->timeout) */
 	qp->s_timer.expires = jiffies + rdi->busy_jiffies +
 			      (qp->timeout_jiffies << shift);
-	add_timer(&qp->s_timer);
+	timer_add(&qp->s_timer);
 }
 EXPORT_SYMBOL(rvt_add_retry_timer_ext);
 
diff --git a/drivers/input/serio/hp_sdc.c b/drivers/input/serio/hp_sdc.c
index 0eec4c5585cb..05f6d96e0aa3 100644
--- a/drivers/input/serio/hp_sdc.c
+++ b/drivers/input/serio/hp_sdc.c
@@ -908,7 +908,7 @@ static int __init hp_sdc_init(void)
 	/* Create the keepalive task */
 	timer_setup(&hp_sdc.kicker, hp_sdc_kicker, 0);
 	hp_sdc.kicker.expires = jiffies + HZ;
-	add_timer(&hp_sdc.kicker);
+	timer_add(&hp_sdc.kicker);
 
 	hp_sdc.dev_err = 0;
 	return 0;
diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
index 2b05722d4dbe..75c118d59c78 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -296,7 +296,7 @@ hfcpci_Timer(struct timer_list *t)
 	/* WD RESET */
 /*
  *	WriteReg(hc, HFCD_DATA, HFCD_CTMT, hc->hw.ctmt | 0x80);
- *	add_timer(&hc->hw.timer);
+ *	timer_add(&hc->hw.timer);
  */
 }
 
@@ -2306,7 +2306,7 @@ hfcpci_softirq(struct timer_list *unused)
 	else
 		hfc_jiffies += tics;
 	hfc_tl.expires = hfc_jiffies;
-	add_timer(&hfc_tl);
+	timer_add(&hfc_tl);
 }
 
 static int __init
@@ -2335,7 +2335,7 @@ HFC_init(void)
 		timer_setup(&hfc_tl, hfcpci_softirq, 0);
 		hfc_tl.expires = jiffies + tics;
 		hfc_jiffies = hfc_tl.expires;
-		add_timer(&hfc_tl);
+		timer_add(&hfc_tl);
 	} else
 		tics = 0; /* indicate the use of controller's timer */
 
diff --git a/drivers/isdn/hardware/mISDN/mISDNipac.c b/drivers/isdn/hardware/mISDN/mISDNipac.c
index a34ea6058960..5a083aa71886 100644
--- a/drivers/isdn/hardware/mISDN/mISDNipac.c
+++ b/drivers/isdn/hardware/mISDN/mISDNipac.c
@@ -161,7 +161,7 @@ isac_fill_fifo(struct isac_hw *isac)
 		timer_delete(&isac->dch.timer);
 	}
 	isac->dch.timer.expires = jiffies + ((DBUSY_TIMER_VALUE * HZ)/1000);
-	add_timer(&isac->dch.timer);
+	timer_add(&isac->dch.timer);
 	if (isac->dch.debug & DEBUG_HW_DFIFO) {
 		char	pfx[MISDN_MAX_IDLEN + 16];
 
diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/mISDN/mISDNisar.c
index dace91ba412b..3c02ef9eba7f 100644
--- a/drivers/isdn/hardware/mISDN/mISDNisar.c
+++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
@@ -935,7 +935,7 @@ isar_pump_statev_fax(struct isar_ch *ch, u8 devt) {
 					jiffies + ((delay * HZ) / 1000);
 				test_and_set_bit(FLG_LL_CONN,
 						 &ch->bch.Flags);
-				add_timer(&ch->ftimer);
+				timer_add(&ch->ftimer);
 			} else {
 				deliver_status(ch, HW_MOD_CONNECT);
 			}
diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISDN/w6692.c
index 168fc345dcdc..a2bc981726e4 100644
--- a/drivers/isdn/hardware/mISDN/w6692.c
+++ b/drivers/isdn/hardware/mISDN/w6692.c
@@ -297,7 +297,7 @@ W6692_fill_Dfifo(struct w6692_hw *card)
 		timer_delete(&dch->timer);
 	}
 	dch->timer.expires = jiffies + ((DBUSY_TIMER_VALUE * HZ) / 1000);
-	add_timer(&dch->timer);
+	timer_add(&dch->timer);
 	if (debug & DEBUG_HW_DFIFO) {
 		snprintf(card->log, 63, "D-send %s %d ",
 			 card->name, count);
diff --git a/drivers/isdn/mISDN/dsp_cmx.c b/drivers/isdn/mISDN/dsp_cmx.c
index 53fad9487574..73280cbf846c 100644
--- a/drivers/isdn/mISDN/dsp_cmx.c
+++ b/drivers/isdn/mISDN/dsp_cmx.c
@@ -1836,7 +1836,7 @@ dsp_cmx_send(struct timer_list *arg)
 		dsp_spl_jiffies += dsp_tics;
 
 	dsp_spl_tl.expires = dsp_spl_jiffies;
-	add_timer(&dsp_spl_tl);
+	timer_add(&dsp_spl_tl);
 
 	/* unlock */
 	spin_unlock_irqrestore(&dsp_lock, flags);
diff --git a/drivers/isdn/mISDN/dsp_core.c b/drivers/isdn/mISDN/dsp_core.c
index d0aa415a6b09..18f6c23c5176 100644
--- a/drivers/isdn/mISDN/dsp_core.c
+++ b/drivers/isdn/mISDN/dsp_core.c
@@ -1199,7 +1199,7 @@ static int __init dsp_init(void)
 	timer_setup(&dsp_spl_tl, dsp_cmx_send, 0);
 	dsp_spl_tl.expires = jiffies + dsp_tics;
 	dsp_spl_jiffies = dsp_spl_tl.expires;
-	add_timer(&dsp_spl_tl);
+	timer_add(&dsp_spl_tl);
 
 	return 0;
 }
diff --git a/drivers/isdn/mISDN/dsp_tones.c b/drivers/isdn/mISDN/dsp_tones.c
index fa7813ae8d97..83d9df81681a 100644
--- a/drivers/isdn/mISDN/dsp_tones.c
+++ b/drivers/isdn/mISDN/dsp_tones.c
@@ -479,7 +479,7 @@ dsp_tone_timeout(struct timer_list *t)
 		dsp_tone_hw_message(dsp, pat->data[index], *(pat->siz[index]));
 	/* set timer */
 	tone->tl.expires = jiffies + (pat->seq[index] * HZ) / 8000;
-	add_timer(&tone->tl);
+	timer_add(&tone->tl);
 }
 
 
@@ -541,7 +541,7 @@ dsp_tone(struct dsp *dsp, int tone)
 		if (timer_pending(&tonet->tl))
 			timer_delete(&tonet->tl);
 		tonet->tl.expires = jiffies + (pat->seq[0] * HZ) / 8000;
-		add_timer(&tonet->tl);
+		timer_add(&tonet->tl);
 	} else {
 		tonet->software = 1;
 	}
diff --git a/drivers/isdn/mISDN/fsm.c b/drivers/isdn/mISDN/fsm.c
index 825b686496d2..a577c4b77680 100644
--- a/drivers/isdn/mISDN/fsm.c
+++ b/drivers/isdn/mISDN/fsm.c
@@ -150,7 +150,7 @@ mISDN_FsmAddTimer(struct FsmTimer *ft,
 	ft->event = event;
 	ft->arg = arg;
 	ft->tl.expires = jiffies + (millisec * HZ) / 1000;
-	add_timer(&ft->tl);
+	timer_add(&ft->tl);
 	return 0;
 }
 EXPORT_SYMBOL(mISDN_FsmAddTimer);
@@ -171,6 +171,6 @@ mISDN_FsmRestartTimer(struct FsmTimer *ft,
 	ft->event = event;
 	ft->arg = arg;
 	ft->tl.expires = jiffies + (millisec * HZ) / 1000;
-	add_timer(&ft->tl);
+	timer_add(&ft->tl);
 }
 EXPORT_SYMBOL(mISDN_FsmRestartTimer);
diff --git a/drivers/isdn/mISDN/l1oip_core.c b/drivers/isdn/mISDN/l1oip_core.c
index 16226a280c02..76da7c5b4049 100644
--- a/drivers/isdn/mISDN/l1oip_core.c
+++ b/drivers/isdn/mISDN/l1oip_core.c
@@ -1424,7 +1424,7 @@ init_card(struct l1oip *hc, int pri, int bundle)
 
 	timer_setup(&hc->keep_tl, l1oip_keepalive, 0);
 	hc->keep_tl.expires = jiffies + 2 * HZ; /* two seconds first time */
-	add_timer(&hc->keep_tl);
+	timer_add(&hc->keep_tl);
 
 	timer_setup(&hc->timeout_tl, l1oip_timeout, 0);
 	hc->timeout_on = 0; /* state that we have timer off */
diff --git a/drivers/isdn/mISDN/timerdev.c b/drivers/isdn/mISDN/timerdev.c
index df98144a9539..8691e70771d0 100644
--- a/drivers/isdn/mISDN/timerdev.c
+++ b/drivers/isdn/mISDN/timerdev.c
@@ -187,7 +187,7 @@ misdn_add_timer(struct mISDNtimerdev *dev, int timeout)
 			dev->next_id = 1;
 		list_add_tail(&timer->list, &dev->pending);
 		timer->tl.expires = jiffies + ((HZ * (u_long)timeout) / 1000);
-		add_timer(&timer->tl);
+		timer_add(&timer->tl);
 		spin_unlock_irq(&dev->lock);
 	}
 	return id;
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 9af3c18f14f4..1aac5e087242 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -85,7 +85,7 @@ static void pattern_trig_timer_start(struct pattern_trig_data *data)
 		hrtimer_start(&data->hrtimer, ns_to_ktime(0), HRTIMER_MODE_REL);
 	} else {
 		data->timer.expires = jiffies;
-		add_timer(&data->timer);
+		timer_add(&data->timer);
 	}
 }
 
diff --git a/drivers/md/bcache/stats.c b/drivers/md/bcache/stats.c
index 0056106495a7..c32af4d987c3 100644
--- a/drivers/md/bcache/stats.c
+++ b/drivers/md/bcache/stats.c
@@ -175,7 +175,7 @@ static void scale_accounting(struct timer_list *t)
 	acc->timer.expires += accounting_delay;
 
 	if (!atomic_read(&acc->closing))
-		add_timer(&acc->timer);
+		timer_add(&acc->timer);
 	else
 		closure_return(&acc->cl);
 }
@@ -230,5 +230,5 @@ void bch_cache_accounting_init(struct cache_accounting *acc,
 	closure_init(&acc->cl, parent);
 	timer_setup(&acc->timer, scale_accounting, 0);
 	acc->timer.expires	= jiffies + accounting_delay;
-	add_timer(&acc->timer);
+	timer_add(&acc->timer);
 }
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index d2b73e7bc9cd..d8bbc87c248b 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -115,7 +115,7 @@ static void delayed_wake(struct mirror_set *ms)
 		return;
 
 	ms->timer.expires = jiffies + HZ / 5;
-	add_timer(&ms->timer);
+	timer_add(&ms->timer);
 }
 
 static void wakeup_all_recovery_waiters(void *context)
diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 8fb5989ec31a..bf002de719a7 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -369,7 +369,7 @@ static void dvb_dmxdev_filter_timer(struct dmxdev_filter *dmxdevfilter)
 	if (para->timeout) {
 		dmxdevfilter->timer.expires =
 		    jiffies + 1 + (HZ / 2 + HZ * para->timeout) / 1000;
-		add_timer(&dmxdevfilter->timer);
+		timer_add(&dmxdevfilter->timer);
 	}
 }
 
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 88027cbc3e61..4281f47f217b 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2166,7 +2166,7 @@ static int tc358743_probe(struct i2c_client *client)
 		timer_setup(&state->timer, tc358743_irq_poll_timer, 0);
 		state->timer.expires = jiffies +
 				       msecs_to_jiffies(POLL_INTERVAL_MS);
-		add_timer(&state->timer);
+		timer_add(&state->timer);
 	}
 
 	err = cec_register_adapter(state->cec_adap, &client->dev);
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 84aa269248fd..cbb80a0b491e 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -292,7 +292,7 @@ static void bttv_ir_start(struct bttv_ir *ir)
 	if (ir->polling) {
 		timer_setup(&ir->timer, bttv_input_timer, 0);
 		ir->timer.expires  = jiffies + msecs_to_jiffies(1000);
-		add_timer(&ir->timer);
+		timer_add(&ir->timer);
 	} else if (ir->rc5_gpio) {
 		/* set timer_end for code completion */
 		timer_setup(&ir->timer, bttv_rc5_timer_end, 0);
diff --git a/drivers/media/pci/ivtv/ivtv-irq.c b/drivers/media/pci/ivtv/ivtv-irq.c
index 748c14e87963..ff196f2bb3a6 100644
--- a/drivers/media/pci/ivtv/ivtv-irq.c
+++ b/drivers/media/pci/ivtv/ivtv-irq.c
@@ -424,7 +424,7 @@ static void ivtv_dma_enc_start_xfer(struct ivtv_stream *s)
 	write_reg(s->sg_handle, IVTV_REG_ENCDMAADDR);
 	write_reg_sync(read_reg(IVTV_REG_DMAXFER) | 0x02, IVTV_REG_DMAXFER);
 	itv->dma_timer.expires = jiffies + msecs_to_jiffies(300);
-	add_timer(&itv->dma_timer);
+	timer_add(&itv->dma_timer);
 }
 
 static void ivtv_dma_dec_start_xfer(struct ivtv_stream *s)
@@ -440,7 +440,7 @@ static void ivtv_dma_dec_start_xfer(struct ivtv_stream *s)
 	write_reg(s->sg_handle, IVTV_REG_DECDMAADDR);
 	write_reg_sync(read_reg(IVTV_REG_DMAXFER) | 0x01, IVTV_REG_DMAXFER);
 	itv->dma_timer.expires = jiffies + msecs_to_jiffies(300);
-	add_timer(&itv->dma_timer);
+	timer_add(&itv->dma_timer);
 }
 
 /* start the encoder DMA */
@@ -709,7 +709,7 @@ static void ivtv_irq_dma_err(struct ivtv *itv)
 				 */
 				itv->dma_timer.expires =
 						jiffies + msecs_to_jiffies(600);
-				add_timer(&itv->dma_timer);
+				timer_add(&itv->dma_timer);
 				return;
 			}
 
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 468dbe8d552f..a0bf76e3f8af 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -484,7 +484,7 @@ int saa7134_ir_open(struct rc_dev *rc)
 	if (ir->polling) {
 		timer_setup(&ir->timer, saa7134_input_timer, 0);
 		ir->timer.expires = jiffies + HZ;
-		add_timer(&ir->timer);
+		timer_add(&ir->timer);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index e571042023e5..3bd0e5a2d115 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -160,7 +160,7 @@ static void s5p_mfc_watchdog(struct timer_list *t)
 	}
 	dev->watchdog_timer.expires = jiffies +
 					msecs_to_jiffies(MFC_WATCHDOG_INTERVAL);
-	add_timer(&dev->watchdog_timer);
+	timer_add(&dev->watchdog_timer);
 }
 
 static void s5p_mfc_watchdog_worker(struct work_struct *work)
@@ -842,7 +842,7 @@ static int s5p_mfc_open(struct file *file)
 	if (dev->num_inst == 1) {
 		dev->watchdog_timer.expires = jiffies +
 					msecs_to_jiffies(MFC_WATCHDOG_INTERVAL);
-		add_timer(&dev->watchdog_timer);
+		timer_add(&dev->watchdog_timer);
 		ret = s5p_mfc_power_on(dev);
 		if (ret < 0) {
 			mfc_err("power on failed\n");
diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 602c37cbe177..8242e0c48dfd 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -76,7 +76,7 @@ static void c8sectpfe_timer_interrupt(struct timer_list *t)
 	}
 
 	fei->timer.expires = jiffies +	msecs_to_jiffies(POLL_MSECS);
-	add_timer(&fei->timer);
+	timer_add(&fei->timer);
 }
 
 static void channel_swdemux_bh_work(struct work_struct *t)
@@ -203,7 +203,7 @@ static int c8sectpfe_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 		fei->timer.expires = jiffies +
 			msecs_to_jiffies(msecs_to_jiffies(POLL_MSECS));
 
-		add_timer(&fei->timer);
+		timer_add(&fei->timer);
 	}
 
 	if (stdemux->running_feed_count == 0) {
diff --git a/drivers/media/radio/radio-cadet.c b/drivers/media/radio/radio-cadet.c
index 5110754e1a31..a05570265b25 100644
--- a/drivers/media/radio/radio-cadet.c
+++ b/drivers/media/radio/radio-cadet.c
@@ -311,7 +311,7 @@ static void cadet_handler(struct timer_list *t)
 	 * Clean up and exit
 	 */
 	dev->readtimer.expires = jiffies + msecs_to_jiffies(50);
-	add_timer(&dev->readtimer);
+	timer_add(&dev->readtimer);
 }
 
 static void cadet_start_rds(struct cadet *dev)
@@ -320,7 +320,7 @@ static void cadet_start_rds(struct cadet *dev)
 	outb(0x80, dev->io);        /* Select RDS fifo */
 	timer_setup(&dev->readtimer, cadet_handler, 0);
 	dev->readtimer.expires = jiffies + msecs_to_jiffies(50);
-	add_timer(&dev->readtimer);
+	timer_add(&dev->readtimer);
 }
 
 static ssize_t cadet_read(struct file *file, char __user *data, size_t count, loff_t *ppos)
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 9ae5eee5ed62..a8ccb5898a80 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3714,7 +3714,7 @@ status);
 	}
 
 	/* Start timer */
-	add_timer(&timer.timer);
+	timer_add(&timer.timer);
 
 	/* Now wait for all I/O to complete */
 	hdw->cmd_debug_state = 4;
@@ -4286,7 +4286,7 @@ static int state_eval_encoder_config(struct pvr2_hdw *hdw)
 					hdw->encoder_wait_timer.expires =
 						jiffies + msecs_to_jiffies(
 						TIME_MSEC_ENCODER_WAIT);
-					add_timer(&hdw->encoder_wait_timer);
+					timer_add(&hdw->encoder_wait_timer);
 				}
 			}
 			/* We can't continue until we know we have been
@@ -4410,7 +4410,7 @@ static int state_eval_encoder_run(struct pvr2_hdw *hdw)
 		if (!hdw->state_encoder_runok) {
 			hdw->encoder_run_timer.expires = jiffies +
 				 msecs_to_jiffies(TIME_MSEC_ENCODER_OK);
-			add_timer(&hdw->encoder_run_timer);
+			timer_add(&hdw->encoder_run_timer);
 		}
 	}
 	trace_stbit("state_encoder_run",hdw->state_encoder_run);
@@ -4502,7 +4502,7 @@ static int state_eval_decoder_run(struct pvr2_hdw *hdw)
 					hdw->quiescent_timer.expires =
 						jiffies + msecs_to_jiffies(
 						TIME_MSEC_DECODER_WAIT);
-					add_timer(&hdw->quiescent_timer);
+					timer_add(&hdw->quiescent_timer);
 				}
 			}
 			/* Don't allow decoder to start again until it has
@@ -4527,7 +4527,7 @@ static int state_eval_decoder_run(struct pvr2_hdw *hdw)
 			hdw->decoder_stabilization_timer.expires =
 				jiffies + msecs_to_jiffies(
 				TIME_MSEC_DECODER_STABILIZATION_WAIT);
-			add_timer(&hdw->decoder_stabilization_timer);
+			timer_add(&hdw->decoder_stabilization_timer);
 		} else {
 			hdw->state_decoder_ready = !0;
 		}
diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rtsx_usb.c
index 148107a4547c..b0912d493586 100644
--- a/drivers/misc/cardreader/rtsx_usb.c
+++ b/drivers/misc/cardreader/rtsx_usb.c
@@ -51,7 +51,7 @@ static int rtsx_usb_bulk_transfer_sglist(struct rtsx_ucr *ucr,
 		return ret;
 
 	ucr->sg_timer.expires = jiffies + msecs_to_jiffies(timeout);
-	add_timer(&ucr->sg_timer);
+	timer_add(&ucr->sg_timer);
 	usb_sg_wait(&ucr->current_sg);
 	if (!timer_delete_sync(&ucr->sg_timer))
 		ret = -ETIMEDOUT;
diff --git a/drivers/misc/sgi-xp/xpc.h b/drivers/misc/sgi-xp/xpc.h
index 225f2bb84e39..726e44c3f471 100644
--- a/drivers/misc/sgi-xp/xpc.h
+++ b/drivers/misc/sgi-xp/xpc.h
@@ -208,7 +208,7 @@ struct xpc_activate_mq_msg_chctl_opencomplete_uv {
 };
 
 /*
- * Functions registered by add_timer() or called by kernel_thread() only
+ * Functions registered by timer_add() or called by kernel_thread() only
  * allow for a single 64-bit argument. The following macros can be used to
  * pack and unpack two (32-bit, 16-bit or 8-bit) arguments into or out from
  * the passed argument.
diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index ef34483ee8e2..b38e09d6aa97 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -188,7 +188,7 @@ xpc_hb_beater(struct timer_list *unused)
 		wake_up_interruptible(&xpc_activate_IRQ_wq);
 
 	xpc_hb_timer.expires = jiffies + (xpc_hb_interval * HZ);
-	add_timer(&xpc_hb_timer);
+	timer_add(&xpc_hb_timer);
 }
 
 static void
diff --git a/drivers/misc/sgi-xp/xpc_partition.c b/drivers/misc/sgi-xp/xpc_partition.c
index f983885d57e9..3beb85e17f9b 100644
--- a/drivers/misc/sgi-xp/xpc_partition.c
+++ b/drivers/misc/sgi-xp/xpc_partition.c
@@ -377,7 +377,7 @@ xpc_deactivate_partition(const int line, struct xpc_partition *part,
 	/* set a timelimit on the disengage phase of the deactivation request */
 	part->disengage_timeout = jiffies + (xpc_disengage_timelimit * HZ);
 	part->disengage_timer.expires = part->disengage_timeout;
-	add_timer(&part->disengage_timer);
+	timer_add(&part->disengage_timer);
 
 	dev_dbg(xpc_part, "bringing partition %d down, reason = %d\n",
 		XPC_PARTID(part), reason);
diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
index fdf5d23b1427..e4dff077d136 100644
--- a/drivers/mmc/host/vub300.c
+++ b/drivers/mmc/host/vub300.c
@@ -1450,7 +1450,7 @@ static int __command_read_data(struct vub300_mmc_host *vub300,
 			vub300->sg_transfer_timer.expires =
 				jiffies + msecs_to_jiffies(2000 +
 						  (linear_length / 16384));
-			add_timer(&vub300->sg_transfer_timer);
+			timer_add(&vub300->sg_transfer_timer);
 			usb_sg_wait(&vub300->sg_request);
 			timer_delete(&vub300->sg_transfer_timer);
 			if (vub300->sg_request.status < 0) {
@@ -1567,7 +1567,7 @@ static int __command_write_data(struct vub300_mmc_host *vub300,
 			vub300->sg_transfer_timer.expires =
 				jiffies + msecs_to_jiffies(2000 +
 							   linear_length / 16384);
-			add_timer(&vub300->sg_transfer_timer);
+			timer_add(&vub300->sg_transfer_timer);
 			usb_sg_wait(&vub300->sg_request);
 			if (cmd->error) {
 				data->bytes_xfered = 0;
@@ -2322,7 +2322,7 @@ static int vub300_probe(struct usb_interface *interface,
 	timer_setup(&vub300->inactivity_timer,
 		    vub300_inactivity_timer_expired, 0);
 	vub300->inactivity_timer.expires = jiffies + HZ;
-	add_timer(&vub300->inactivity_timer);
+	timer_add(&vub300->inactivity_timer);
 	if (vub300->card_present)
 		dev_info(&vub300->udev->dev,
 			 "USB vub300 remote SDIO host controller[%d]"
diff --git a/drivers/most/most_usb.c b/drivers/most/most_usb.c
index cf5be9c449a5..f59a93b65ffb 100644
--- a/drivers/most/most_usb.c
+++ b/drivers/most/most_usb.c
@@ -671,7 +671,7 @@ static void link_stat_timer_handler(struct timer_list *t)
 
 	schedule_work(&mdev->poll_work_obj);
 	mdev->link_stat_timer.expires = jiffies + (2 * HZ);
-	add_timer(&mdev->link_stat_timer);
+	timer_add(&mdev->link_stat_timer);
 }
 
 /**
diff --git a/drivers/net/eql.c b/drivers/net/eql.c
index 9ba10efd3794..d7ef6b3a7a20 100644
--- a/drivers/net/eql.c
+++ b/drivers/net/eql.c
@@ -163,7 +163,7 @@ static void eql_timer(struct timer_list *t)
 	spin_unlock(&eql->queue.lock);
 
 	eql->timer.expires = jiffies + EQL_DEFAULT_RESCHED_IVAL;
-	add_timer(&eql->timer);
+	timer_add(&eql->timer);
 }
 
 static const char version[] __initconst =
@@ -215,7 +215,7 @@ static int eql_open(struct net_device *dev)
 	eql->min_slaves = 1;
 	eql->max_slaves = EQL_DEFAULT_MAX_SLAVES; /* 4 usually... */
 
-	add_timer(&eql->timer);
+	timer_add(&eql->timer);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/3com/3c515.c b/drivers/net/ethernet/3com/3c515.c
index ecdea58e6a21..843035fbf7fe 100644
--- a/drivers/net/ethernet/3com/3c515.c
+++ b/drivers/net/ethernet/3com/3c515.c
@@ -923,7 +923,7 @@ static void corkscrew_timer(struct timer_list *t)
 						dev->name,
 						media_tbl[dev->if_port].name);
 				vp->timer.expires = jiffies + media_tbl[dev->if_port].wait;
-				add_timer(&vp->timer);
+				timer_add(&vp->timer);
 			}
 			outw((media_status & ~(Media_10TP | Media_SQE)) |
 			     media_tbl[dev->if_port].media_bits,
diff --git a/drivers/net/ethernet/3com/3c574_cs.c b/drivers/net/ethernet/3com/3c574_cs.c
index 1f2070497a75..7d0a2e4b2ae1 100644
--- a/drivers/net/ethernet/3com/3c574_cs.c
+++ b/drivers/net/ethernet/3com/3c574_cs.c
@@ -681,7 +681,7 @@ static int el3_open(struct net_device *dev)
 	
 	tc574_reset(dev);
 	lp->media.expires = jiffies + HZ;
-	add_timer(&lp->media);
+	timer_add(&lp->media);
 	
 	dev_dbg(&link->dev, "%s: opened, status %4.4x.\n",
 		  dev->name, inw(dev->base_addr + EL3_STATUS));
@@ -882,7 +882,7 @@ static void media_check(struct timer_list *t)
 	if (lp->fast_poll) {
 		lp->fast_poll--;
 		lp->media.expires = jiffies + 2*HZ/100;
-		add_timer(&lp->media);
+		timer_add(&lp->media);
 		return;
 	}
 
@@ -927,7 +927,7 @@ static void media_check(struct timer_list *t)
 
 reschedule:
 	lp->media.expires = jiffies + HZ;
-	add_timer(&lp->media);
+	timer_add(&lp->media);
 }
 
 static struct net_device_stats *el3_get_stats(struct net_device *dev)
diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com/3c589_cs.c
index ea49be43b8c3..77b8430787f9 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -711,7 +711,7 @@ static void media_check(struct timer_list *t)
 	if (lp->fast_poll) {
 		lp->fast_poll--;
 		lp->media.expires = jiffies + HZ/100;
-		add_timer(&lp->media);
+		timer_add(&lp->media);
 		return;
 	}
 
@@ -767,7 +767,7 @@ static void media_check(struct timer_list *t)
 
 reschedule:
 	lp->media.expires = jiffies + HZ;
-	add_timer(&lp->media);
+	timer_add(&lp->media);
 }
 
 static struct net_device_stats *el3_get_stats(struct net_device *dev)
diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390/axnet_cs.c
index 7c8213011b5c..80ccea96887b 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -569,7 +569,7 @@ static void ei_watchdog(struct timer_list *t)
     if (info->fast_poll) {
 	info->fast_poll--;
 	info->watchdog.expires = jiffies + 1;
-	add_timer(&info->watchdog);
+	timer_add(&info->watchdog);
 	return;
     }
 
@@ -600,7 +600,7 @@ static void ei_watchdog(struct timer_list *t)
 
 reschedule:
     info->watchdog.expires = jiffies + HZ;
-    add_timer(&info->watchdog);
+    timer_add(&info->watchdog);
 }
 
 /*====================================================================*/
diff --git a/drivers/net/ethernet/8390/pcnet_cs.c b/drivers/net/ethernet/8390/pcnet_cs.c
index 19f9c5db3f3b..07ae1cc347a1 100644
--- a/drivers/net/ethernet/8390/pcnet_cs.c
+++ b/drivers/net/ethernet/8390/pcnet_cs.c
@@ -1037,7 +1037,7 @@ static void ei_watchdog(struct timer_list *t)
     if (info->fast_poll) {
 	info->fast_poll--;
 	info->watchdog.expires = jiffies + 1;
-	add_timer(&info->watchdog);
+	timer_add(&info->watchdog);
 	return;
     }
 
@@ -1099,7 +1099,7 @@ static void ei_watchdog(struct timer_list *t)
 
 reschedule:
     info->watchdog.expires = jiffies + HZ;
-    add_timer(&info->watchdog);
+    timer_add(&info->watchdog);
 }
 
 /*====================================================================*/
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index 12def2cddc55..5b0274f64318 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -3610,7 +3610,7 @@ static int et131x_open(struct net_device *netdev)
 	timer_setup(&adapter->error_timer, et131x_error_timer_handler, 0);
 	adapter->error_timer.expires = jiffies +
 		msecs_to_jiffies(TX_ERROR_PERIOD);
-	add_timer(&adapter->error_timer);
+	timer_add(&adapter->error_timer);
 
 	result = request_irq(irq, et131x_isr,
 			     IRQF_SHARED, netdev->name, netdev);
diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index f9a936ac6731..4077a96847b0 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1211,7 +1211,7 @@ static int amd8111e_open(struct net_device *dev)
 	}
 	/* Start ipg timer */
 	if (lp->options & OPTION_DYN_IPG_ENABLE) {
-		add_timer(&lp->ipg_data.ipg_timer);
+		timer_add(&lp->ipg_data.ipg_timer);
 		netdev_info(dev, "Dynamic IPG Enabled\n");
 	}
 
diff --git a/drivers/net/ethernet/apple/bmac.c b/drivers/net/ethernet/apple/bmac.c
index afaebc58d986..c395749d10e9 100644
--- a/drivers/net/ethernet/apple/bmac.c
+++ b/drivers/net/ethernet/apple/bmac.c
@@ -548,7 +548,7 @@ static inline void bmac_set_timeout(struct net_device *dev)
 	if (bp->timeout_active)
 		timer_delete(&bp->tx_timeout);
 	bp->tx_timeout.expires = jiffies + TX_TIMEOUT;
-	add_timer(&bp->tx_timeout);
+	timer_add(&bp->tx_timeout);
 	bp->timeout_active = 1;
 	spin_unlock_irqrestore(&bp->lock, flags);
 }
diff --git a/drivers/net/ethernet/apple/mace.c b/drivers/net/ethernet/apple/mace.c
index af26905e44e3..cd8dfb6f1ed9 100644
--- a/drivers/net/ethernet/apple/mace.c
+++ b/drivers/net/ethernet/apple/mace.c
@@ -525,7 +525,7 @@ static inline void mace_set_timeout(struct net_device *dev)
     if (mp->timeout_active)
 	timer_delete(&mp->tx_timeout);
     mp->tx_timeout.expires = jiffies + TX_TIMEOUT;
-    add_timer(&mp->tx_timeout);
+    timer_add(&mp->tx_timeout);
     mp->timeout_active = 1;
 }
 
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index 8267417b3750..3db6bc4e30f5 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -1450,7 +1450,7 @@ static int b44_open(struct net_device *dev)
 
 	timer_setup(&bp->timer, b44_timer, 0);
 	bp->timer.expires = jiffies + HZ;
-	add_timer(&bp->timer);
+	timer_add(&bp->timer);
 
 	b44_enable_ints(bp);
 
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 92204fea1f08..986cc73f328f 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -275,7 +275,7 @@ static int bcm_enet_refill_rx(struct net_device *dev, bool napi_mode)
 	if (priv->rx_desc_count == 0 && netif_running(dev)) {
 		dev_warn(&priv->pdev->dev, "unable to refill rx ring\n");
 		priv->rx_timeout.expires = jiffies + HZ;
-		add_timer(&priv->rx_timeout);
+		timer_add(&priv->rx_timeout);
 	}
 
 	return 0;
@@ -2091,7 +2091,7 @@ static void swphy_poll_timer(struct timer_list *t)
 	}
 
 	priv->swphy_poll.expires = jiffies + HZ;
-	add_timer(&priv->swphy_poll);
+	timer_add(&priv->swphy_poll);
 }
 
 /*
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index abbf81f06aa0..d8ce97f20cdf 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -11220,7 +11220,7 @@ static void tg3_timer(struct timer_list *t)
 
 restart_timer:
 	tp->timer.expires = jiffies + tp->timer_offset;
-	add_timer(&tp->timer);
+	timer_add(&tp->timer);
 }
 
 static void tg3_timer_init(struct tg3 *tp)
@@ -11247,7 +11247,7 @@ static void tg3_timer_start(struct tg3 *tp)
 	tp->timer_counter = tp->timer_multiplier;
 
 	tp->timer.expires = jiffies + tp->timer_offset;
-	add_timer(&tp->timer);
+	timer_add(&tp->timer);
 }
 
 static void tg3_timer_stop(struct tg3 *tp)
diff --git a/drivers/net/ethernet/dec/tulip/21142.c b/drivers/net/ethernet/dec/tulip/21142.c
index 76767dec216d..09c2682ae07c 100644
--- a/drivers/net/ethernet/dec/tulip/21142.c
+++ b/drivers/net/ethernet/dec/tulip/21142.c
@@ -101,7 +101,7 @@ void t21142_media_task(struct work_struct *work)
 		next_tick = 3*HZ;
 	}
 
-	/* mod_timer synchronizes us with potential add_timer calls
+	/* mod_timer synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
 	mod_timer(&tp->timer, RUN_AT(next_tick));
@@ -219,7 +219,7 @@ void t21142_lnk_change(struct net_device *dev, int csr5)
 		timer_delete_sync(&tp->timer);
 		t21142_start_nway(dev);
 		tp->timer.expires = RUN_AT(3*HZ);
-		add_timer(&tp->timer);
+		timer_add(&tp->timer);
 	} else if (dev->if_port == 3  ||  dev->if_port == 5) {
 		if (tulip_debug > 1)
 			dev_info(&dev->dev, "21143 %s link beat %s\n",
@@ -229,7 +229,7 @@ void t21142_lnk_change(struct net_device *dev, int csr5)
 			timer_delete_sync(&tp->timer);
 			t21142_start_nway(dev);
 			tp->timer.expires = RUN_AT(3*HZ);
-			add_timer(&tp->timer);
+			timer_add(&tp->timer);
 		} else if (dev->if_port == 5)
 			iowrite32(csr14 & ~0x080, ioaddr + CSR14);
 	} else if (dev->if_port == 0  ||  dev->if_port == 4) {
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index f9504f340c4a..0bc15c31023a 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -976,7 +976,7 @@ static void de21040_media_timer (struct timer_list *t)
 			goto no_link_yet;
 
 		de->media_timer.expires = jiffies + DE_TIMER_LINK;
-		add_timer(&de->media_timer);
+		timer_add(&de->media_timer);
 		if (!netif_carrier_ok(dev))
 			de_link_up(de);
 		else
@@ -1006,7 +1006,7 @@ static void de21040_media_timer (struct timer_list *t)
 
 no_link_yet:
 	de->media_timer.expires = jiffies + DE_TIMER_NO_LINK;
-	add_timer(&de->media_timer);
+	timer_add(&de->media_timer);
 
 	netif_info(de, timer, dev, "no link, trying media %s, status %x\n",
 		   media_name[de->media_type], status);
@@ -1063,7 +1063,7 @@ static void de21041_media_timer (struct timer_list *t)
 			goto no_link_yet;
 
 		de->media_timer.expires = jiffies + DE_TIMER_LINK;
-		add_timer(&de->media_timer);
+		timer_add(&de->media_timer);
 		if (!netif_carrier_ok(dev))
 			de_link_up(de);
 		else
@@ -1142,7 +1142,7 @@ static void de21041_media_timer (struct timer_list *t)
 
 no_link_yet:
 	de->media_timer.expires = jiffies + DE_TIMER_NO_LINK;
-	add_timer(&de->media_timer);
+	timer_add(&de->media_timer);
 
 	netif_info(de, timer, dev, "no link, trying media %s, status %x\n",
 		   media_name[de->media_type], status);
diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index 2d3bd343b6e6..b6c775432fd9 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -584,7 +584,7 @@ static int dmfe_open(struct net_device *dev)
 	/* set and active a timer process */
 	timer_setup(&db->timer, dmfe_timer, 0);
 	db->timer.expires = DMFE_TIMER_WUT + HZ * 2;
-	add_timer(&db->timer);
+	timer_add(&db->timer);
 
 	return 0;
 }
@@ -1137,7 +1137,7 @@ static void dmfe_timer(struct timer_list *t)
 			db->cr6_data |= 0x40000;
 			update_cr6(db->cr6_data, ioaddr);
 			db->timer.expires = DMFE_TIMER_WUT + HZ * 2;
-			add_timer(&db->timer);
+			timer_add(&db->timer);
 			spin_unlock_irqrestore(&db->lock, flags);
 			return;
 		}
@@ -1176,7 +1176,7 @@ static void dmfe_timer(struct timer_list *t)
 		dmfe_dynamic_reset(dev);
 		db->first_in_callback = 0;
 		db->timer.expires = DMFE_TIMER_WUT;
-		add_timer(&db->timer);
+		timer_add(&db->timer);
 		spin_unlock_irqrestore(&db->lock, flags);
 		return;
 	}
@@ -1258,7 +1258,7 @@ static void dmfe_timer(struct timer_list *t)
 
 	/* Timer active again */
 	db->timer.expires = DMFE_TIMER_WUT;
-	add_timer(&db->timer);
+	timer_add(&db->timer);
 	spin_unlock_irqrestore(&db->lock, flags);
 }
 
diff --git a/drivers/net/ethernet/dec/tulip/pnic2.c b/drivers/net/ethernet/dec/tulip/pnic2.c
index 39c410bf224e..181a2612f00a 100644
--- a/drivers/net/ethernet/dec/tulip/pnic2.c
+++ b/drivers/net/ethernet/dec/tulip/pnic2.c
@@ -326,7 +326,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
 		timer_delete_sync(&tp->timer);
 		pnic2_start_nway(dev);
 		tp->timer.expires = RUN_AT(3*HZ);
-		add_timer(&tp->timer);
+		timer_add(&tp->timer);
 
                 return;
 	}
@@ -351,7 +351,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
 			timer_delete_sync(&tp->timer);
 			pnic2_start_nway(dev);
 			tp->timer.expires = RUN_AT(3*HZ);
-			add_timer(&tp->timer);
+			timer_add(&tp->timer);
                 }
 
                 return;
@@ -375,7 +375,7 @@ void pnic2_lnk_change(struct net_device *dev, int csr5)
 			timer_delete_sync(&tp->timer);
 			pnic2_start_nway(dev);
 			tp->timer.expires = RUN_AT(3*HZ);
-			add_timer(&tp->timer);
+			timer_add(&tp->timer);
                 }
 
                 return;
diff --git a/drivers/net/ethernet/dec/tulip/timer.c b/drivers/net/ethernet/dec/tulip/timer.c
index ca0c509b601c..88d771c24d74 100644
--- a/drivers/net/ethernet/dec/tulip/timer.c
+++ b/drivers/net/ethernet/dec/tulip/timer.c
@@ -130,7 +130,7 @@ void tulip_media_task(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(&tp->lock, flags);
 
-	/* mod_timer synchronizes us with potential add_timer calls
+	/* mod_timer synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
 	mod_timer(&tp->timer, RUN_AT(next_tick));
@@ -164,7 +164,7 @@ void comet_timer(struct timer_list *t)
 		netdev_dbg(dev, "Comet link status %04x partner capability %04x\n",
 			   tulip_mdio_read(dev, tp->phys[0], 1),
 			   tulip_mdio_read(dev, tp->phys[0], 5));
-	/* mod_timer synchronizes us with potential add_timer calls
+	/* mod_timer synchronizes us with potential timer_add calls
 	 * from interrupts.
 	 */
 	if (tulip_check_duplex(dev) < 0)
diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index cd3da0e9a183..84ec9f990f21 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -492,7 +492,7 @@ static void tulip_up(struct net_device *dev)
 	/* Set the timer to switch to check for link beat and perhaps switch
 	   to an alternate media type. */
 	tp->timer.expires = RUN_AT(next_tick);
-	add_timer(&tp->timer);
+	timer_add(&tp->timer);
 #ifdef CONFIG_TULIP_NAPI
 	timer_setup(&tp->oom_timer, oom_timer, 0);
 #endif
diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/dec/tulip/uli526x.c
index 6e4d8d31aba9..1693cd403723 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -484,7 +484,7 @@ static int uli526x_open(struct net_device *dev)
 	/* set and active a timer process */
 	timer_setup(&db->timer, uli526x_timer, 0);
 	db->timer.expires = ULI526X_TIMER_WUT + HZ * 2;
-	add_timer(&db->timer);
+	timer_add(&db->timer);
 
 	return 0;
 }
@@ -1052,7 +1052,7 @@ static void uli526x_timer(struct timer_list *t)
 		db->reset_count++;
 		uli526x_dynamic_reset(dev);
 		db->timer.expires = ULI526X_TIMER_WUT;
-		add_timer(&db->timer);
+		timer_add(&db->timer);
 		spin_unlock_irqrestore(&db->lock, flags);
 		return;
 	}
@@ -1114,7 +1114,7 @@ static void uli526x_timer(struct timer_list *t)
 
 	/* Timer active again */
 	db->timer.expires = ULI526X_TIMER_WUT;
-	add_timer(&db->timer);
+	timer_add(&db->timer);
 	spin_unlock_irqrestore(&db->lock, flags);
 }
 
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index ded7d1855e0f..4f988135e0b0 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -646,7 +646,7 @@ static int netdev_open(struct net_device *dev)
 	/* Set the timer to check for link beat. */
 	timer_setup(&np->timer, netdev_timer, 0);
 	np->timer.expires = jiffies + 1*HZ;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 	return 0;
 out_err:
 	netif_device_attach(dev);
@@ -775,7 +775,7 @@ static void netdev_timer(struct timer_list *t)
 	update_csr6(dev, update_link(dev));
 	spin_unlock_irq(&np->lock);
 	np->timer.expires = jiffies + 10*HZ;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 }
 
 static void init_rxtx_rings(struct net_device *dev)
diff --git a/drivers/net/ethernet/dlink/dl2k.c b/drivers/net/ethernet/dlink/dl2k.c
index dc1ff862e04b..b6644a2882ca 100644
--- a/drivers/net/ethernet/dlink/dl2k.c
+++ b/drivers/net/ethernet/dlink/dl2k.c
@@ -637,7 +637,7 @@ static int rio_open(struct net_device *dev)
 
 	timer_setup(&np->timer, rio_timer, 0);
 	np->timer.expires = jiffies + 1 * HZ;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 
 	netif_start_queue (dev);
 
@@ -685,7 +685,7 @@ rio_timer (struct timer_list *t)
 	} /* end if */
 	spin_unlock_irqrestore (&np->rx_lock, flags);
 	np->timer.expires = jiffies + next_tick;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 }
 
 static void
@@ -1835,7 +1835,7 @@ static int rio_resume(struct device *device)
 	rio_reset_ring(np);
 	rio_hw_init(dev);
 	np->timer.expires = jiffies + 1 * HZ;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 	netif_device_attach(dev);
 	dl2k_enable_int(np);
 
diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
index 6ac8547ef9b8..99f68da357f5 100644
--- a/drivers/net/ethernet/fealnx.c
+++ b/drivers/net/ethernet/fealnx.c
@@ -905,7 +905,7 @@ static int netdev_open(struct net_device *dev)
 	np->timer.expires = RUN_AT(3 * HZ);
 
 	/* timer handler */
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 
 	timer_setup(&np->reset_timer, reset_timer, 0);
 	np->reset_timer_armed = 0;
@@ -1104,7 +1104,7 @@ static void netdev_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&np->lock, flags);
 
 	np->timer.expires = RUN_AT(10 * HZ);
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 }
 
 
@@ -1568,7 +1568,7 @@ static irqreturn_t intr_handler(int irq, void *dev_instance)
 			if (!np->reset_timer_armed) {
 				np->reset_timer_armed = 1;
 				np->reset_timer.expires = RUN_AT(HZ/2);
-				add_timer(&np->reset_timer);
+				timer_add(&np->reset_timer);
 				stop_nic_rxtx(ioaddr, 0);
 				netif_stop_queue(dev);
 				/* or netif_tx_disable(dev); ?? */
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 5006696eb93d..a056094f02ee 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2452,7 +2452,7 @@ static int mv643xx_eth_open(struct net_device *dev)
 
 	if (mp->oom) {
 		mp->rx_oom.expires = jiffies + (HZ / 10);
-		add_timer(&mp->rx_oom);
+		timer_add(&mp->rx_oom);
 	}
 
 	for (i = 0; i < mp->txq_count; i++) {
@@ -2465,7 +2465,7 @@ static int mv643xx_eth_open(struct net_device *dev)
 		mp->int_mask |= INT_TX_END_0 << i;
 	}
 
-	add_timer(&mp->mib_counters_timer);
+	timer_add(&mp->mib_counters_timer);
 	port_start(mp);
 
 	wrlp(mp, INT_MASK_EXT, INT_EXT_LINK_PHY | INT_EXT_TX);
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index e4cfdc8bc055..99fab31505bd 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -347,7 +347,7 @@ static void rxq_refill(struct net_device *dev)
 	 */
 	if (pep->rx_desc_count == 0) {
 		pep->timeout.expires = jiffies + (HZ / 10);
-		add_timer(&pep->timeout);
+		timer_add(&pep->timeout);
 	}
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/catas.c b/drivers/net/ethernet/mellanox/mlx4/catas.c
index edcc6f662618..38a9c51c7f43 100644
--- a/drivers/net/ethernet/mellanox/mlx4/catas.c
+++ b/drivers/net/ethernet/mellanox/mlx4/catas.c
@@ -298,7 +298,7 @@ void mlx4_start_catas_poll(struct mlx4_dev *dev)
 
 	priv->catas_err.timer.expires  =
 		round_jiffies(jiffies + MLX4_CATAS_POLL_INTERVAL);
-	add_timer(&priv->catas_err.timer);
+	timer_add(&priv->catas_err.timer);
 }
 
 void mlx4_stop_catas_poll(struct mlx4_dev *dev)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
index d70351815d7c..75b3a1561f92 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fw_reset.c
@@ -305,7 +305,7 @@ static void mlx5_start_sync_reset_poll(struct mlx5_core_dev *dev)
 
 	timer_setup(&fw_reset->timer, poll_sync_reset, 0);
 	fw_reset->timer.expires = round_jiffies(jiffies + MLX5_RESET_POLL_INTERVAL);
-	add_timer(&fw_reset->timer);
+	timer_add(&fw_reset->timer);
 }
 
 static int mlx5_fw_reset_set_reset_sync_ack(struct mlx5_core_dev *dev)
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/health.c b/drivers/net/ethernet/mellanox/mlx5/core/health.c
index e96eb0a8e511..c2a7fe22367e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/health.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/health.c
@@ -837,7 +837,7 @@ void mlx5_start_health_poll(struct mlx5_core_dev *dev)
 	health->health_counter = &dev->iseg->health_counter;
 
 	health->timer.expires = jiffies + msecs_to_jiffies(poll_interval_ms);
-	add_timer(&health->timer);
+	timer_add(&health->timer);
 }
 
 void mlx5_stop_health_poll(struct mlx5_core_dev *dev, bool disable_health)
diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index bdf42518d431..aef253be1e77 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -3935,7 +3935,7 @@ static void ksz_start_timer(struct ksz_timer_info *info, int time)
 {
 	info->cnt = 0;
 	info->timer.expires = jiffies + time;
-	add_timer(&info->timer);
+	timer_add(&info->timer);
 
 	/* infinity */
 	info->max = -1;
@@ -3969,12 +3969,12 @@ static void ksz_update_timer(struct ksz_timer_info *info)
 	if (info->max > 0) {
 		if (info->cnt < info->max) {
 			info->timer.expires = jiffies + info->period;
-			add_timer(&info->timer);
+			timer_add(&info->timer);
 		} else
 			info->max = 0;
 	} else if (info->max < 0) {
 		info->timer.expires = jiffies + info->period;
-		add_timer(&info->timer);
+		timer_add(&info->timer);
 	}
 }
 
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index e611ff7fa3fa..5639306c525d 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -2449,7 +2449,7 @@ static int myri10ge_open(struct net_device *dev)
 
 	mgp->running = MYRI10GE_ETH_RUNNING;
 	mgp->watchdog_timer.expires = jiffies + myri10ge_watchdog_timeout * HZ;
-	add_timer(&mgp->watchdog_timer);
+	timer_add(&mgp->watchdog_timer);
 	netif_tx_wake_all_queues(dev);
 
 	return 0;
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 12ff5a4c6e44..5d838369607f 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -1570,7 +1570,7 @@ static int netdev_open(struct net_device *dev)
 	/* Set the timer to check for link beat. */
 	timer_setup(&np->timer, netdev_timer, 0);
 	np->timer.expires = round_jiffies(jiffies + NATSEMI_TIMER_FREQ);
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/packetengines/hamachi.c b/drivers/net/ethernet/packetengines/hamachi.c
index b0de7e9f12a5..abf77c8a9651 100644
--- a/drivers/net/ethernet/packetengines/hamachi.c
+++ b/drivers/net/ethernet/packetengines/hamachi.c
@@ -987,7 +987,7 @@ static int hamachi_open(struct net_device *dev)
 	/* Set the timer to check for link beat. */
 	timer_setup(&hmp->timer, hamachi_timer, 0);
 	hmp->timer.expires = RUN_AT((24*HZ)/10);			/* 2.4 sec. */
-	add_timer(&hmp->timer);
+	timer_add(&hmp->timer);
 
 	return 0;
 }
@@ -1045,7 +1045,7 @@ static void hamachi_timer(struct timer_list *t)
 	}
 	/* We could do something here... nah. */
 	hmp->timer.expires = RUN_AT(next_tick);
-	add_timer(&hmp->timer);
+	timer_add(&hmp->timer);
 }
 
 static void hamachi_tx_timeout(struct net_device *dev, unsigned int txqueue)
diff --git a/drivers/net/ethernet/packetengines/yellowfin.c b/drivers/net/ethernet/packetengines/yellowfin.c
index 1e25ac13a7d8..00f44d83528c 100644
--- a/drivers/net/ethernet/packetengines/yellowfin.c
+++ b/drivers/net/ethernet/packetengines/yellowfin.c
@@ -641,7 +641,7 @@ static int yellowfin_open(struct net_device *dev)
 	/* Set the timer to check for link beat. */
 	timer_setup(&yp->timer, yellowfin_timer, 0);
 	yp->timer.expires = jiffies + 3*HZ;
-	add_timer(&yp->timer);
+	timer_add(&yp->timer);
 out:
 	return rc;
 
@@ -681,7 +681,7 @@ static void yellowfin_timer(struct timer_list *t)
 	}
 
 	yp->timer.expires = jiffies + next_tick;
-	add_timer(&yp->timer);
+	timer_add(&yp->timer);
 }
 
 static void yellowfin_tx_timeout(struct net_device *dev, unsigned int txqueue)
diff --git a/drivers/net/ethernet/realtek/atp.c b/drivers/net/ethernet/realtek/atp.c
index 0d65434982a2..ac389394c139 100644
--- a/drivers/net/ethernet/realtek/atp.c
+++ b/drivers/net/ethernet/realtek/atp.c
@@ -444,7 +444,7 @@ static int net_open(struct net_device *dev)
 	lp->dev = dev;
 	timer_setup(&lp->timer, atp_timed_checker, 0);
 	lp->timer.expires = jiffies + TIMED_CHECKER;
-	add_timer(&lp->timer);
+	timer_add(&lp->timer);
 
 	netif_start_queue(dev);
 	return 0;
@@ -748,7 +748,7 @@ static void atp_timed_checker(struct timer_list *t)
 	}
 	spin_unlock(&lp->lock);
 	lp->timer.expires = jiffies + TIMED_CHECKER;
-	add_timer(&lp->timer);
+	timer_add(&lp->timer);
 }
 #endif
 
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
index f0da8f118ab8..cbbec53e9957 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -132,7 +132,7 @@ bool sxgbe_eee_init(struct sxgbe_priv_data * const priv)
 
 		timer_setup(&priv->eee_ctrl_timer, sxgbe_eee_ctrl_timer, 0);
 		priv->eee_ctrl_timer.expires = SXGBE_LPI_TIMER(eee_timer);
-		add_timer(&priv->eee_ctrl_timer);
+		timer_add(&priv->eee_ctrl_timer);
 
 		priv->hw->mac->set_eee_timer(priv->ioaddr,
 					     SXGBE_DEFAULT_LPI_TIMER,
@@ -1034,7 +1034,7 @@ static void sxgbe_tx_init_coalesce(struct sxgbe_priv_data *priv)
 		p->tx_coal_timer = SXGBE_COAL_TX_TIMER;
 		timer_setup(&p->txtimer, sxgbe_tx_timer, 0);
 		p->txtimer.expires = SXGBE_COAL_TIMER(p->tx_coal_timer);
-		add_timer(&p->txtimer);
+		timer_add(&p->txtimer);
 	}
 }
 
diff --git a/drivers/net/ethernet/seeq/ether3.c b/drivers/net/ethernet/seeq/ether3.c
index 20dad39b5ab9..c227d5a762a9 100644
--- a/drivers/net/ethernet/seeq/ether3.c
+++ b/drivers/net/ethernet/seeq/ether3.c
@@ -183,7 +183,7 @@ static inline void ether3_ledon(struct net_device *dev)
 {
 	timer_delete(&priv(dev)->timer);
 	priv(dev)->timer.expires = jiffies + HZ / 50; /* leave on for 1/50th second */
-	add_timer(&priv(dev)->timer);
+	timer_add(&priv(dev)->timer);
 	if (priv(dev)->regs.config2 & CFG2_CTRLO)
 		ether3_outw(priv(dev)->regs.config2 &= ~CFG2_CTRLO, REG_CONFIG2);
 }
diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index 39731069d99e..5195bbd7d882 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -577,7 +577,7 @@ static void ioc3_timer(struct timer_list *t)
 	ioc3_setup_duplex(ip);
 
 	ip->ioc3_timer.expires = jiffies + ((12 * HZ) / 10); /* 1.2s */
-	add_timer(&ip->ioc3_timer);
+	timer_add(&ip->ioc3_timer);
 }
 
 /* Try to find a PHY.  There is no apparent relation between the MII addresses
@@ -604,7 +604,7 @@ static int ioc3_mii_init(struct ioc3_private *ip)
 static void ioc3_mii_start(struct ioc3_private *ip)
 {
 	ip->ioc3_timer.expires = jiffies + (12 * HZ) / 10;  /* 1.2 sec. */
-	add_timer(&ip->ioc3_timer);
+	timer_add(&ip->ioc3_timer);
 }
 
 static inline void ioc3_tx_unmap(struct ioc3_private *ip, int entry)
diff --git a/drivers/net/ethernet/sis/sis190.c b/drivers/net/ethernet/sis/sis190.c
index 15e46e6ac262..c157aeea2f57 100644
--- a/drivers/net/ethernet/sis/sis190.c
+++ b/drivers/net/ethernet/sis/sis190.c
@@ -1044,7 +1044,7 @@ static inline void sis190_request_timer(struct net_device *dev)
 
 	timer_setup(timer, sis190_phy_timer, 0);
 	timer->expires = jiffies + SIS190_PHY_TIMEOUT;
-	add_timer(timer);
+	timer_add(timer);
 }
 
 static void sis190_set_rxbufsize(struct sis190_private *tp,
diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 3172f898171d..f03a59300368 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -1077,7 +1077,7 @@ sis900_open(struct net_device *net_dev)
 	   to an alternate media type. */
 	timer_setup(&sis_priv->timer, sis900_timer, 0);
 	sis_priv->timer.expires = jiffies + HZ;
-	add_timer(&sis_priv->timer);
+	timer_add(&sis_priv->timer);
 
 	return 0;
 }
@@ -1360,7 +1360,7 @@ static void sis900_timer(struct timer_list *t)
 	}
 
 	sis_priv->timer.expires = jiffies + next_tick;
-	add_timer(&sis_priv->timer);
+	timer_add(&sis_priv->timer);
 }
 
 /**
diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/epic100.c
index 45f703fe0e5a..15489b02000e 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -746,7 +746,7 @@ static int epic_open(struct net_device *dev)
 	   to an alternate media type. */
 	timer_setup(&ep->timer, epic_timer, 0);
 	ep->timer.expires = jiffies + 3*HZ;
-	add_timer(&ep->timer);
+	timer_add(&ep->timer);
 
 	return rc;
 }
@@ -865,7 +865,7 @@ static void epic_timer(struct timer_list *t)
 	check_media(dev);
 
 	ep->timer.expires = jiffies + next_tick;
-	add_timer(&ep->timer);
+	timer_add(&ep->timer);
 }
 
 static void epic_tx_timeout(struct net_device *dev, unsigned int txqueue)
diff --git a/drivers/net/ethernet/smsc/smc91c92_cs.c b/drivers/net/ethernet/smsc/smc91c92_cs.c
index cc0c75694351..bf57a5b4647a 100644
--- a/drivers/net/ethernet/smsc/smc91c92_cs.c
+++ b/drivers/net/ethernet/smsc/smc91c92_cs.c
@@ -1756,7 +1756,7 @@ static void media_check(struct timer_list *t)
     if (smc->fast_poll) {
 	smc->fast_poll--;
 	smc->media.expires = jiffies + HZ/100;
-	add_timer(&smc->media);
+	timer_add(&smc->media);
 	return;
     }
 
@@ -1828,7 +1828,7 @@ static void media_check(struct timer_list *t)
 
 reschedule:
     smc->media.expires = jiffies + HZ;
-    add_timer(&smc->media);
+    timer_add(&smc->media);
     SMC_SELECT_BANK(saved_bank);
     spin_unlock_irqrestore(&smc->lock, flags);
 }
diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 2f185827abba..c0dd496791f8 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -2239,7 +2239,7 @@ static void niu_timer(struct timer_list *t)
 		off = 1 * HZ;
 	np->timer.expires = jiffies + off;
 
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 }
 
 static const struct niu_phy_ops phy_ops_10g_serdes = {
@@ -6144,7 +6144,7 @@ static int niu_open(struct net_device *dev)
 	if (np->link_config.loopback_mode != LOOPBACK_DISABLED)
 		netif_carrier_on(dev);
 
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 
 	return 0;
 
@@ -6529,7 +6529,7 @@ static void niu_reset_task(struct work_struct *work)
 	err = niu_init_hw(np);
 	if (!err) {
 		np->timer.expires = jiffies + HZ;
-		add_timer(&np->timer);
+		timer_add(&np->timer);
 		niu_netif_start(np);
 	}
 
@@ -6792,7 +6792,7 @@ static int niu_change_mtu(struct net_device *dev, int new_mtu)
 		if (np->link_config.loopback_mode != LOOPBACK_DISABLED)
 			netif_carrier_on(dev);
 
-		add_timer(&np->timer);
+		timer_add(&np->timer);
 	}
 
 	return err;
@@ -9947,7 +9947,7 @@ static int __maybe_unused niu_resume(struct device *dev_d)
 	err = niu_init_hw(np);
 	if (!err) {
 		np->timer.expires = jiffies + HZ;
-		add_timer(&np->timer);
+		timer_add(&np->timer);
 		niu_netif_start(np);
 	}
 
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index edb2fd3a6551..aed3b2c31faa 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -573,7 +573,7 @@ static void bigmac_timer(struct timer_list *t)
 
 	if (restart_timer != 0) {
 		bp->bigmac_timer.expires = jiffies + ((12 * HZ)/10); /* 1.2 sec. */
-		add_timer(&bp->bigmac_timer);
+		timer_add(&bp->bigmac_timer);
 	}
 }
 
@@ -614,7 +614,7 @@ static void bigmac_begin_auto_negotiation(struct bigmac *bp)
 	bp->timer_state = ltrywait;
 	bp->timer_ticks = 0;
 	bp->bigmac_timer.expires = jiffies + (12 * HZ) / 10;
-	add_timer(&bp->bigmac_timer);
+	timer_add(&bp->bigmac_timer);
 }
 
 static int bigmac_init_hw(struct bigmac *bp, bool non_blocking)
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sunhme.c
index 4bc0e114d5ee..37db34f35dec 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -716,7 +716,7 @@ happy_meal_begin_auto_negotiation(struct happy_meal *hp,
 
 	hp->timer_ticks = 0;
 	hp->happy_timer.expires = jiffies + (12 * HZ)/10;  /* 1.2 sec. */
-	add_timer(&hp->happy_timer);
+	timer_add(&hp->happy_timer);
 }
 
 static void happy_meal_timer(struct timer_list *t)
@@ -887,7 +887,7 @@ static void happy_meal_timer(struct timer_list *t)
 
 	if (restart_timer) {
 		hp->happy_timer.expires = jiffies + ((12 * HZ)/10); /* 1.2 sec. */
-		add_timer(&hp->happy_timer);
+		timer_add(&hp->happy_timer);
 	}
 
 out:
diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index fbe35af615a6..2a31c8c02d51 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -1237,7 +1237,7 @@ static void cpsw_ale_timer(struct timer_list *t)
 
 	if (ale->ageout) {
 		ale->timer.expires = jiffies + ale->ageout;
-		add_timer(&ale->timer);
+		timer_add(&ale->timer);
 	}
 }
 
@@ -1274,7 +1274,7 @@ static void cpsw_ale_aging_start(struct cpsw_ale *ale)
 
 	timer_setup(&ale->timer, cpsw_ale_timer, 0);
 	ale->timer.expires = jiffies + ale->ageout;
-	add_timer(&ale->timer);
+	timer_add(&ale->timer);
 }
 
 static void cpsw_ale_aging_stop(struct cpsw_ale *ale)
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index 55a1a96cd834..569cdb83bc36 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -2861,7 +2861,7 @@ static void netcp_ethss_timer(struct timer_list *t)
 	spin_unlock(&gbe_dev->hw_stats_lock);
 
 	gbe_dev->timer.expires	= jiffies + GBE_TIMER_INTERVAL;
-	add_timer(&gbe_dev->timer);
+	timer_add(&gbe_dev->timer);
 }
 
 static int gbe_txhook(int order, void *data, struct netcp_packet *p_info)
@@ -3725,7 +3725,7 @@ static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
 
 	timer_setup(&gbe_dev->timer, netcp_ethss_timer, 0);
 	gbe_dev->timer.expires	 = jiffies + GBE_TIMER_INTERVAL;
-	add_timer(&gbe_dev->timer);
+	timer_add(&gbe_dev->timer);
 	*inst_priv = gbe_dev;
 	return 0;
 
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index a55b0f951181..fb7a23dead36 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -1409,7 +1409,7 @@ static u32 tlan_handle_tx_eof(struct net_device *dev, u16 host_int)
 			priv->timer.expires = jiffies + TLAN_TIMER_ACT_DELAY;
 			priv->timer_set_at = jiffies;
 			priv->timer_type = TLAN_TIMER_ACTIVITY;
-			add_timer(&priv->timer);
+			timer_add(&priv->timer);
 		} else if (priv->timer_type == TLAN_TIMER_ACTIVITY) {
 			priv->timer_set_at = jiffies;
 		}
@@ -1560,7 +1560,7 @@ static u32 tlan_handle_rx_eof(struct net_device *dev, u16 host_int)
 			priv->timer.expires = jiffies + TLAN_TIMER_ACT_DELAY;
 			priv->timer_set_at = jiffies;
 			priv->timer_type = TLAN_TIMER_ACTIVITY;
-			add_timer(&priv->timer);
+			timer_add(&priv->timer);
 		} else if (priv->timer_type == TLAN_TIMER_ACTIVITY) {
 			priv->timer_set_at = jiffies;
 		}
@@ -1790,7 +1790,7 @@ ThunderLAN driver timer function
  *		Nothing
  *	Parms:
  *		data	A value given to add timer when
- *			add_timer was called.
+ *			timer_add was called.
  *
  *	This function handles timed functionality for the
  *	TLAN driver.  The two current timer uses are for
@@ -1852,7 +1852,7 @@ static void tlan_timer(struct timer_list *t)
 				priv->timer.expires = priv->timer_set_at
 					+ TLAN_TIMER_ACT_DELAY;
 				spin_unlock_irqrestore(&priv->lock, flags);
-				add_timer(&priv->timer);
+				timer_add(&priv->timer);
 				break;
 			}
 		}
@@ -2291,7 +2291,7 @@ tlan_finish_reset(struct net_device *dev)
 				netdev_info(dev, "Link active\n");
 			/* Enabling link beat monitoring */
 			priv->media_timer.expires = jiffies + HZ;
-			add_timer(&priv->media_timer);
+			timer_add(&priv->media_timer);
 		}
 	}
 
@@ -2789,7 +2789,7 @@ static void tlan_phy_monitor(struct timer_list *t)
 		netif_carrier_on(dev);
 	}
 	priv->media_timer.expires = jiffies + HZ;
-	add_timer(&priv->media_timer);
+	timer_add(&priv->media_timer);
 }
 
 
diff --git a/drivers/net/fddi/defza.c b/drivers/net/fddi/defza.c
index 2098c3068d34..6ea44aaefafe 100644
--- a/drivers/net/fddi/defza.c
+++ b/drivers/net/fddi/defza.c
@@ -1025,7 +1025,7 @@ static irqreturn_t fza_interrupt(int irq, void *dev_id)
 			fza_do_reset(fp);
 			fp->timer_state = 0;
 			fp->reset_timer.expires = jiffies + 45 * HZ;
-			add_timer(&fp->reset_timer);
+			timer_add(&fp->reset_timer);
 			break;
 
 		default:
@@ -1067,7 +1067,7 @@ static void fza_reset_timer(struct timer_list *t)
 		fp->timer_state = 0;
 		fp->reset_timer.expires = jiffies + 45 * HZ;
 	}
-	add_timer(&fp->reset_timer);
+	timer_add(&fp->reset_timer);
 }
 
 static int fza_set_mac_address(struct net_device *dev, void *addr)
diff --git a/drivers/net/hamradio/scc.c b/drivers/net/hamradio/scc.c
index ae5048efde68..d8d56909291f 100644
--- a/drivers/net/hamradio/scc.c
+++ b/drivers/net/hamradio/scc.c
@@ -1009,7 +1009,7 @@ static void __scc_start_tx_timer(struct scc_channel *scc,
 	{
 		scc->tx_t.function = handler;
 		scc->tx_t.expires = jiffies + (when*HZ)/100;
-		add_timer(&scc->tx_t);
+		timer_add(&scc->tx_t);
 	}
 }
 
@@ -1035,7 +1035,7 @@ static void scc_start_defer(struct scc_channel *scc)
 	{
 		scc->tx_wdog.function = t_busy;
 		scc->tx_wdog.expires = jiffies + HZ*scc->kiss.maxdefer;
-		add_timer(&scc->tx_wdog);
+		timer_add(&scc->tx_wdog);
 	}
 	spin_unlock_irqrestore(&scc->lock, flags);
 }
@@ -1051,7 +1051,7 @@ static void scc_start_maxkeyup(struct scc_channel *scc)
 	{
 		scc->tx_wdog.function = t_maxkeyup;
 		scc->tx_wdog.expires = jiffies + HZ*scc->kiss.maxkeyup;
-		add_timer(&scc->tx_wdog);
+		timer_add(&scc->tx_wdog);
 	}
 	spin_unlock_irqrestore(&scc->lock, flags);
 }
@@ -1432,7 +1432,7 @@ scc_start_calibrate(struct scc_channel *scc, int duration, unsigned char pattern
 
 	scc->tx_wdog.function = scc_stop_calibrate;
 	scc->tx_wdog.expires = jiffies + HZ*duration;
-	add_timer(&scc->tx_wdog);
+	timer_add(&scc->tx_wdog);
 
 	/* This doesn't seem to work. Why not? */	
 	wr(scc, R6, 0);
diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index f29997b20fd7..6f8e3e11da68 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -642,7 +642,7 @@ static void yam_dotimer(struct timer_list *unused)
 			yam_arbitrate(dev);
 	}
 	yam_timer.expires = jiffies + HZ / 100;
-	add_timer(&yam_timer);
+	timer_add(&yam_timer);
 }
 
 static void yam_tx_byte(struct net_device *dev, struct yam_port *yp)
@@ -1139,7 +1139,7 @@ static int __init yam_init_driver(void)
 
 	timer_setup(&yam_timer, yam_dotimer, 0);
 	yam_timer.expires = jiffies + HZ / 100;
-	add_timer(&yam_timer);
+	timer_add(&yam_timer);
 
 	proc_create_seq("yam", 0444, init_net.proc_net, &yam_seqops);
 	return 0;
diff --git a/drivers/net/hippi/rrunner.c b/drivers/net/hippi/rrunner.c
index 7b7e7a47a75e..77c834ad27fe 100644
--- a/drivers/net/hippi/rrunner.c
+++ b/drivers/net/hippi/rrunner.c
@@ -1176,7 +1176,7 @@ static void rr_timer(struct timer_list *t)
 		}
 	}
 	rrpriv->timer.expires = RUN_AT(5*HZ);
-	add_timer(&rrpriv->timer);
+	timer_add(&rrpriv->timer);
 }
 
 
@@ -1235,7 +1235,7 @@ static int rr_open(struct net_device *dev)
 	   to an alternate media type. */
 	timer_setup(&rrpriv->timer, rr_timer, 0);
 	rrpriv->timer.expires = RUN_AT(5*HZ);           /* 5 sec. watchdog */
-	add_timer(&rrpriv->timer);
+	timer_add(&rrpriv->timer);
 
 	netif_start_queue(dev);
 
diff --git a/drivers/net/slip/slip.c b/drivers/net/slip/slip.c
index c889fb374703..1a2950f95221 100644
--- a/drivers/net/slip/slip.c
+++ b/drivers/net/slip/slip.c
@@ -838,11 +838,11 @@ static int slip_open(struct tty_struct *tty)
 #ifdef CONFIG_SLIP_SMART
 	if (sl->keepalive) {
 		sl->keepalive_timer.expires = jiffies + sl->keepalive * HZ;
-		add_timer(&sl->keepalive_timer);
+		timer_add(&sl->keepalive_timer);
 	}
 	if (sl->outfill) {
 		sl->outfill_timer.expires = jiffies + sl->outfill * HZ;
-		add_timer(&sl->outfill_timer);
+		timer_add(&sl->outfill_timer);
 	}
 #endif
 
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index c30ca415d1d3..c0a57917a284 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -456,7 +456,7 @@ static void sierra_net_dosync(struct usbnet *dev)
 
 	/* Now, start a timer and make sure we get the Restart Indication */
 	priv->sync_timer.expires = jiffies + SIERRA_NET_SYNCDELAY;
-	add_timer(&priv->sync_timer);
+	timer_add(&priv->sync_timer);
 }
 
 static void sierra_net_kevent(struct work_struct *work)
diff --git a/drivers/net/wan/hdlc_cisco.c b/drivers/net/wan/hdlc_cisco.c
index bfc978b15bc2..70e7596e7a95 100644
--- a/drivers/net/wan/hdlc_cisco.c
+++ b/drivers/net/wan/hdlc_cisco.c
@@ -260,7 +260,7 @@ static void cisco_timer(struct timer_list *t)
 	spin_unlock(&st->lock);
 
 	st->timer.expires = jiffies + st->settings.interval * HZ;
-	add_timer(&st->timer);
+	timer_add(&st->timer);
 }
 
 static void cisco_start(struct net_device *dev)
@@ -276,7 +276,7 @@ static void cisco_start(struct net_device *dev)
 	st->dev = dev;
 	timer_setup(&st->timer, cisco_timer, 0);
 	st->timer.expires = jiffies + HZ; /* First poll after 1 s */
-	add_timer(&st->timer);
+	timer_add(&st->timer);
 }
 
 static void cisco_stop(struct net_device *dev)
diff --git a/drivers/net/wan/hdlc_fr.c b/drivers/net/wan/hdlc_fr.c
index 08a0ba5ca471..4f500dde54ea 100644
--- a/drivers/net/wan/hdlc_fr.c
+++ b/drivers/net/wan/hdlc_fr.c
@@ -627,7 +627,7 @@ static void fr_timer(struct timer_list *t)
 			state(hdlc)->settings.t391 * HZ;
 	}
 
-	add_timer(&state(hdlc)->timer);
+	timer_add(&state(hdlc)->timer);
 }
 
 static int fr_lmi_recv(struct net_device *dev, struct sk_buff *skb)
@@ -1012,7 +1012,7 @@ static void fr_start(struct net_device *dev)
 		timer_setup(&state(hdlc)->timer, fr_timer, 0);
 		/* First poll after 1 s */
 		state(hdlc)->timer.expires = jiffies + HZ;
-		add_timer(&state(hdlc)->timer);
+		timer_add(&state(hdlc)->timer);
 	} else {
 		fr_set_link_state(1, dev);
 	}
diff --git a/drivers/net/wan/hdlc_ppp.c b/drivers/net/wan/hdlc_ppp.c
index 7496a2e9a282..7889fe51f346 100644
--- a/drivers/net/wan/hdlc_ppp.c
+++ b/drivers/net/wan/hdlc_ppp.c
@@ -604,7 +604,7 @@ static void ppp_timer(struct timer_list *t)
 				  ppp->echo_id, 0, NULL);
 			proto->timer.expires = jiffies +
 				ppp->keepalive_interval * HZ;
-			add_timer(&proto->timer);
+			timer_add(&proto->timer);
 		}
 		break;
 	}
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index d40d2823a1e5..82b526b476f0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2317,7 +2317,7 @@ brcmf_pcie_fwcon_timer(struct brcmf_pciedev_info *devinfo, bool active)
 
 	if (!devinfo->console_active) {
 		devinfo->timer.expires = jiffies + devinfo->console_interval;
-		add_timer(&devinfo->timer);
+		timer_add(&devinfo->timer);
 		devinfo->console_active = true;
 	} else {
 		/* Reschedule the timer */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index cf26ab15ee0c..bd2e602fd027 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -4626,7 +4626,7 @@ void brcmf_sdio_wd_timer(struct brcmf_sdio *bus, bool active)
 			   dynamically changed or in the first instance
 			 */
 			bus->timer.expires = jiffies + BRCMF_WD_POLL;
-			add_timer(&bus->timer);
+			timer_add(&bus->timer);
 			bus->wd_active = true;
 		} else {
 			/* Re arm the timer, at last watchdog period */
diff --git a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c b/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
index 2fe539d5bbf9..018810c6f7ea 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
+++ b/drivers/net/wireless/intel/ipw2x00/libipw_crypto.c
@@ -121,7 +121,7 @@ static void libipw_crypt_deinit_handler(struct timer_list *t)
 		printk(KERN_DEBUG "%s: entries remaining in delayed crypt "
 		       "deletion list\n", info->name);
 		info->crypt_deinit_timer.expires = jiffies + HZ;
-		add_timer(&info->crypt_deinit_timer);
+		timer_add(&info->crypt_deinit_timer);
 	}
 	spin_unlock_irqrestore(info->lock, flags);
 }
@@ -147,7 +147,7 @@ void libipw_crypt_delayed_deinit(struct libipw_crypt_info *info,
 		list_add(&tmp->list, &info->crypt_deinit_list);
 		if (!timer_pending(&info->crypt_deinit_timer)) {
 			info->crypt_deinit_timer.expires = jiffies + HZ;
-			add_timer(&info->crypt_deinit_timer);
+			timer_add(&info->crypt_deinit_timer);
 		}
 	}
 	spin_unlock_irqrestore(info->lock, flags);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 826c48a2ee69..37b73be38b71 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1467,7 +1467,7 @@ static void mt7921_channel_switch(struct ieee80211_hw *hw,
 	u16 beacon_interval = vif->bss_conf.beacon_int;
 
 	mvif->csa_timer.expires = TU_TO_EXP_TIME(beacon_interval * chsw->count);
-	add_timer(&mvif->csa_timer);
+	timer_add(&mvif->csa_timer);
 }
 
 static void mt7921_abort_channel_switch(struct ieee80211_hw *hw,
diff --git a/drivers/net/wireless/purelifi/plfxlc/usb.c b/drivers/net/wireless/purelifi/plfxlc/usb.c
index 1c54cb2906bf..89e6c5dddcc5 100644
--- a/drivers/net/wireless/purelifi/plfxlc/usb.c
+++ b/drivers/net/wireless/purelifi/plfxlc/usb.c
@@ -679,12 +679,12 @@ static int probe(struct usb_interface *intf,
 
 	timer_setup(&tx->tx_retry_timer, slif_data_plane_sap_timer_callb, 0);
 	tx->tx_retry_timer.expires = jiffies + TX_RETRY_BACKOFF_JIFF;
-	add_timer(&tx->tx_retry_timer);
+	timer_add(&tx->tx_retry_timer);
 
 	timer_setup(&usb->sta_queue_cleanup,
 		    sta_queue_cleanup_timer_callb, 0);
 	usb->sta_queue_cleanup.expires = jiffies + STA_QUEUE_CLEANUP_JIFF;
-	add_timer(&usb->sta_queue_cleanup);
+	timer_add(&usb->sta_queue_cleanup);
 
 	plfxlc_mac_init_hw(hw);
 	usb->initialized = true;
diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireless/rsi/rsi_91x_hal.c
index 7d26314a3e76..8ef65e3cf49d 100644
--- a/drivers/net/wireless/rsi/rsi_91x_hal.c
+++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
@@ -502,7 +502,7 @@ static int bl_start_cmd_timer(struct rsi_hw *adapter, u32 timeout)
 	adapter->bl_cmd_timer.expires = (msecs_to_jiffies(timeout) + jiffies);
 
 	adapter->blcmd_timer_expired = false;
-	add_timer(&adapter->bl_cmd_timer);
+	timer_add(&adapter->bl_cmd_timer);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
index 0e115b428f96..cbee7c947562 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
@@ -1779,7 +1779,7 @@ static int rsi_mac80211_roc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		timer_delete(&common->roc_timer);
 	}
 	common->roc_timer.expires = msecs_to_jiffies(duration) + jiffies;
-	add_timer(&common->roc_timer);
+	timer_add(&common->roc_timer);
 
 	/* Configure band */
 	if (rsi_band_check(common, chan)) {
diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
index 760a5dec0431..a7d3f82b58d6 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -1855,8 +1855,8 @@ static void interrupt_event_handler(struct controller *ctrl)
 /*					p_slot->physical_slot = physical_slot; */
 					p_slot->task_event.expires = jiffies + 5 * HZ;   /* 5 second delay */
 
-					dbg("add_timer p_slot = %p\n", p_slot);
-					add_timer(&p_slot->task_event);
+					dbg("timer_add p_slot = %p\n", p_slot);
+					timer_add(&p_slot->task_event);
 				}
 				/***********POWER FAULT */
 				else if (ctrl->event_queue[loop].event_type == INT_POWER_FAULT) {
diff --git a/drivers/pci/hotplug/shpchp_hpc.c b/drivers/pci/hotplug/shpchp_hpc.c
index 183bf43510a1..c657a1520c41 100644
--- a/drivers/pci/hotplug/shpchp_hpc.c
+++ b/drivers/pci/hotplug/shpchp_hpc.c
@@ -232,7 +232,7 @@ static void start_int_poll_timer(struct controller *ctrl, int sec)
 		sec = 2;
 
 	ctrl->poll_timer.expires = jiffies + sec * HZ;
-	add_timer(&ctrl->poll_timer);
+	timer_add(&ctrl->poll_timer);
 }
 
 static inline int is_ctrl_busy(struct controller *ctrl)
diff --git a/drivers/pcmcia/i82365.c b/drivers/pcmcia/i82365.c
index 1e464b951ed2..f1270c685e77 100644
--- a/drivers/pcmcia/i82365.c
+++ b/drivers/pcmcia/i82365.c
@@ -879,7 +879,7 @@ static void pcic_interrupt_wrapper(struct timer_list *unused)
 {
     pcic_interrupt(0, NULL);
     poll_timer.expires = jiffies + poll_interval;
-    add_timer(&poll_timer);
+    timer_add(&poll_timer);
 }
 
 /*====================================================================*/
@@ -1291,7 +1291,7 @@ static int __init init_i82365(void)
     if (poll_interval != 0) {
 	timer_setup(&poll_timer, pcic_interrupt_wrapper, 0);
     	poll_timer.expires = jiffies + poll_interval;
-	add_timer(&poll_timer);
+	timer_add(&poll_timer);
     }
     
     return 0;
diff --git a/drivers/pcmcia/tcic.c b/drivers/pcmcia/tcic.c
index 060aed0edc65..a8de893357e8 100644
--- a/drivers/pcmcia/tcic.c
+++ b/drivers/pcmcia/tcic.c
@@ -572,7 +572,7 @@ static irqreturn_t tcic_interrupt(int irq, void *dev)
     /* Schedule next poll, if needed */
     if (((cs_irq == 0) || quick) && (!tcic_timer_pending)) {
 	poll_timer.expires = jiffies + (quick ? poll_quick : poll_interval);
-	add_timer(&poll_timer);
+	timer_add(&poll_timer);
 	tcic_timer_pending = 1;
     }
     active = 0;
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index 372db25c1589..f0145938cae2 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -543,7 +543,7 @@ static void yenta_interrupt_wrapper(struct timer_list *t)
 
 	yenta_interrupt(0, (void *)socket);
 	socket->poll_timer.expires = jiffies + HZ;
-	add_timer(&socket->poll_timer);
+	timer_add(&socket->poll_timer);
 }
 
 static void yenta_clear_maps(struct yenta_socket *socket)
diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 47d9891de368..2c189602a5c1 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -71,7 +71,7 @@ static irqreturn_t pps_gpio_irq_handler(int irq, void *data)
 /* This function will only be called when an ECHO GPIO is defined */
 static void pps_gpio_echo(struct pps_device *pps, int event, void *data)
 {
-	/* add_timer() needs to write into info->echo_timer */
+	/* timer_add() needs to write into info->echo_timer */
 	struct pps_gpio_device_data *info = data;
 
 	switch (event) {
@@ -89,7 +89,7 @@ static void pps_gpio_echo(struct pps_device *pps, int event, void *data)
 	/* fire the timer */
 	if (info->pps->params.mode & (PPS_ECHOASSERT | PPS_ECHOCLEAR)) {
 		info->echo_timer.expires = jiffies + info->echo_timeout;
-		add_timer(&info->echo_timer);
+		timer_add(&info->echo_timer);
 	}
 }
 
diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
index baf1a8ca8b2b..48a44e8efcf5 100644
--- a/drivers/rtc/dev.c
+++ b/drivers/rtc/dev.c
@@ -61,7 +61,7 @@ static void rtc_uie_task(struct work_struct *work)
 		rtc->uie_timer.expires = jiffies + HZ - (HZ / 10);
 		rtc->uie_timer_active = 1;
 		rtc->uie_task_active = 0;
-		add_timer(&rtc->uie_timer);
+		timer_add(&rtc->uie_timer);
 	} else if (schedule_work(&rtc->uie_task) == 0) {
 		rtc->uie_task_active = 0;
 	}
diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
index 94f995febe5b..e5df794d447f 100644
--- a/drivers/rtc/rtc-test.c
+++ b/drivers/rtc/rtc-test.c
@@ -53,7 +53,7 @@ static int test_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	rtd->alarm.expires = expires;
 
 	if (alrm->enabled)
-		add_timer(&rtd->alarm);
+		timer_add(&rtd->alarm);
 
 	rtd->alarm_en = alrm->enabled;
 
@@ -84,7 +84,7 @@ static int test_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 
 	rtd->alarm_en = enable;
 	if (enable)
-		add_timer(&rtd->alarm);
+		timer_add(&rtd->alarm);
 	else
 		timer_delete(&rtd->alarm);
 
diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
index 56e43d43c713..5a2ca4b9c4f5 100644
--- a/drivers/s390/char/con3215.c
+++ b/drivers/s390/char/con3215.c
@@ -295,7 +295,7 @@ static void raw3215_timeout(struct timer_list *t)
 	    !(raw->flags & RAW3215_WORKING) &&
 	    !(raw->flags & RAW3215_TIMER_RUNS)) {
 		raw->timer.expires = RAW3215_TIMEOUT + jiffies;
-		add_timer(&raw->timer);
+		timer_add(&raw->timer);
 		raw->flags |= RAW3215_TIMER_RUNS;
 	}
 	spin_unlock_irqrestore(get_ccwdev_lock(raw->cdev), flags);
@@ -324,7 +324,7 @@ static inline void raw3215_try_io(struct raw3215_info *raw)
 	    !(raw->flags & RAW3215_WORKING) &&
 	    !(raw->flags & RAW3215_TIMER_RUNS)) {
 		raw->timer.expires = RAW3215_TIMEOUT + jiffies;
-		add_timer(&raw->timer);
+		timer_add(&raw->timer);
 		raw->flags |= RAW3215_TIMER_RUNS;
 	}
 }
diff --git a/drivers/s390/char/sclp.c b/drivers/s390/char/sclp.c
index 840be75e75d4..f50a28ee6451 100644
--- a/drivers/s390/char/sclp.c
+++ b/drivers/s390/char/sclp.c
@@ -264,7 +264,7 @@ __sclp_set_request_timer(unsigned long time, void (*cb)(struct timer_list *))
 	timer_delete(&sclp_request_timer);
 	sclp_request_timer.function = cb;
 	sclp_request_timer.expires = jiffies + time;
-	add_timer(&sclp_request_timer);
+	timer_add(&sclp_request_timer);
 }
 
 static void sclp_request_timeout_restart(struct timer_list *unused)
diff --git a/drivers/s390/char/sclp_vt220.c b/drivers/s390/char/sclp_vt220.c
index 62979adcb381..787a61a66a8e 100644
--- a/drivers/s390/char/sclp_vt220.c
+++ b/drivers/s390/char/sclp_vt220.c
@@ -449,7 +449,7 @@ __sclp_vt220_write(const unsigned char *buf, int count, int do_schedule,
 	if (sclp_vt220_current_request != NULL &&
 	    !timer_pending(&sclp_vt220_timer) && do_schedule) {
 		sclp_vt220_timer.expires = jiffies + BUFFER_MAX_DELAY;
-		add_timer(&sclp_vt220_timer);
+		timer_add(&sclp_vt220_timer);
 	}
 out:
 	spin_unlock_irqrestore(&sclp_vt220_lock, flags);
diff --git a/drivers/s390/char/tape_core.c b/drivers/s390/char/tape_core.c
index fa063e84eafc..900b72094ebc 100644
--- a/drivers/s390/char/tape_core.c
+++ b/drivers/s390/char/tape_core.c
@@ -1166,7 +1166,7 @@ __tape_do_irq (struct ccw_device *cdev, unsigned long intparm, struct irb *irb)
 			device->lb_timeout.expires = jiffies +
 				LONG_BUSY_TIMEOUT * HZ;
 			DBF_EVENT(3, "(%08x): add timer\n", device->cdev_id);
-			add_timer(&device->lb_timeout);
+			timer_add(&device->lb_timeout);
 			request->status = TAPE_REQUEST_LONG_BUSY;
 			break;
 		case TAPE_IO_RETRY:
diff --git a/drivers/s390/net/fsm.c b/drivers/s390/net/fsm.c
index 6a12d2422540..7d9396359771 100644
--- a/drivers/s390/net/fsm.c
+++ b/drivers/s390/net/fsm.c
@@ -174,7 +174,7 @@ fsm_addtimer(fsm_timer *this, int millisec, int event, void *arg)
 	this->expire_event = event;
 	this->event_arg = arg;
 	this->tl.expires = jiffies + (millisec * HZ) / 1000;
-	add_timer(&this->tl);
+	timer_add(&this->tl);
 	return 0;
 }
 
@@ -193,7 +193,7 @@ fsm_modtimer(fsm_timer *this, int millisec, int event, void *arg)
 	this->expire_event = event;
 	this->event_arg = arg;
 	this->tl.expires = jiffies + (millisec * HZ) / 1000;
-	add_timer(&this->tl);
+	timer_add(&this->tl);
 }
 
 EXPORT_SYMBOL(init_fsm);
diff --git a/drivers/s390/scsi/zfcp_erp.c b/drivers/s390/scsi/zfcp_erp.c
index ffd994416995..839e8ab4a851 100644
--- a/drivers/s390/scsi/zfcp_erp.c
+++ b/drivers/s390/scsi/zfcp_erp.c
@@ -638,7 +638,7 @@ static void zfcp_erp_strategy_memwait(struct zfcp_erp_action *erp_action)
 {
 	timer_setup(&erp_action->timer, zfcp_erp_memwait_handler, 0);
 	erp_action->timer.expires = jiffies + HZ;
-	add_timer(&erp_action->timer);
+	timer_add(&erp_action->timer);
 }
 
 void zfcp_erp_port_forced_reopen_all(struct zfcp_adapter *adapter,
diff --git a/drivers/s390/scsi/zfcp_fsf.c b/drivers/s390/scsi/zfcp_fsf.c
index c5bba1be88f4..45d8b0334a3d 100644
--- a/drivers/s390/scsi/zfcp_fsf.c
+++ b/drivers/s390/scsi/zfcp_fsf.c
@@ -49,7 +49,7 @@ static void zfcp_fsf_start_timer(struct zfcp_fsf_req *fsf_req,
 {
 	fsf_req->timer.function = zfcp_fsf_request_timeout_handler;
 	fsf_req->timer.expires = jiffies + timeout;
-	add_timer(&fsf_req->timer);
+	timer_add(&fsf_req->timer);
 }
 
 static void zfcp_fsf_start_erp_timer(struct zfcp_fsf_req *fsf_req)
@@ -57,7 +57,7 @@ static void zfcp_fsf_start_erp_timer(struct zfcp_fsf_req *fsf_req)
 	BUG_ON(!fsf_req->erp_action);
 	fsf_req->timer.function = zfcp_erp_timeout_handler;
 	fsf_req->timer.expires = jiffies + 30 * HZ;
-	add_timer(&fsf_req->timer);
+	timer_add(&fsf_req->timer);
 }
 
 /* association between FSF command and FSF QTCB type */
diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 6b87ea004e53..bc95fe8a340e 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -6977,7 +6977,7 @@ ahd_timer_reset(struct timer_list *timer, int usec)
 {
 	timer_delete(timer);
 	timer->expires = jiffies + (usec * HZ)/1000000;
-	add_timer(timer);
+	timer_add(timer);
 }
 
 /*
diff --git a/drivers/scsi/aic94xx/aic94xx_hwi.c b/drivers/scsi/aic94xx/aic94xx_hwi.c
index e74393357025..1ca6c2b3b482 100644
--- a/drivers/scsi/aic94xx/aic94xx_hwi.c
+++ b/drivers/scsi/aic94xx/aic94xx_hwi.c
@@ -1157,7 +1157,7 @@ static void asd_start_scb_timers(struct list_head *list)
 		if (!ascb->uldd_timer) {
 			ascb->timer.function = asd_ascb_timedout;
 			ascb->timer.expires = jiffies + AIC94XX_SCB_TIMEOUT;
-			add_timer(&ascb->timer);
+			timer_add(&ascb->timer);
 		}
 	}
 }
diff --git a/drivers/scsi/aic94xx/aic94xx_tmf.c b/drivers/scsi/aic94xx/aic94xx_tmf.c
index 28ac92b041fe..9c54b014b38f 100644
--- a/drivers/scsi/aic94xx/aic94xx_tmf.c
+++ b/drivers/scsi/aic94xx/aic94xx_tmf.c
@@ -27,7 +27,7 @@ static int asd_enqueue_internal(struct asd_ascb *ascb,
 	ascb->timer.function = timed_out;
 	ascb->timer.expires = jiffies + AIC94XX_SCB_TIMEOUT;
 
-	add_timer(&ascb->timer);
+	timer_add(&ascb->timer);
 
 	res = asd_post_ascb_list(ascb->ha, ascb, 1);
 	if (unlikely(res))
diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 929a3d2f88cd..154d971e5b50 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -1039,14 +1039,14 @@ static void arcmsr_init_get_devmap_timer(struct AdapterControlBlock *pacb)
 	pacb->fw_flag = FW_NORMAL;
 	timer_setup(&pacb->eternal_timer, arcmsr_request_device_map, 0);
 	pacb->eternal_timer.expires = jiffies + msecs_to_jiffies(6 * HZ);
-	add_timer(&pacb->eternal_timer);
+	timer_add(&pacb->eternal_timer);
 }
 
 static void arcmsr_init_set_datetime_timer(struct AdapterControlBlock *pacb)
 {
 	timer_setup(&pacb->refresh_timer, arcmsr_set_iop_datetime, 0);
 	pacb->refresh_timer.expires = jiffies + secs_to_jiffies(60);
-	add_timer(&pacb->refresh_timer);
+	timer_add(&pacb->refresh_timer);
 }
 
 static int arcmsr_set_dma_mask(struct AdapterControlBlock *acb)
diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index 58da993251e9..55dc01668590 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -1929,7 +1929,7 @@ static void bnx2fc_fw_destroy(struct bnx2fc_hba *hba)
 				    0);
 			hba->destroy_timer.expires = BNX2FC_FW_TIMEOUT +
 								jiffies;
-			add_timer(&hba->destroy_timer);
+			timer_add(&hba->destroy_timer);
 			wait_event_interruptible(hba->destroy_wait,
 					test_bit(BNX2FC_FLAG_DESTROY_CMPL,
 						 &hba->flags));
diff --git a/drivers/scsi/bnx2i/bnx2i_iscsi.c b/drivers/scsi/bnx2i/bnx2i_iscsi.c
index 6c80e5b514fd..e8057afecd57 100644
--- a/drivers/scsi/bnx2i/bnx2i_iscsi.c
+++ b/drivers/scsi/bnx2i/bnx2i_iscsi.c
@@ -1619,7 +1619,7 @@ static int bnx2i_conn_start(struct iscsi_cls_conn *cls_conn)
 	 */
 	timer_setup(&bnx2i_conn->ep->ofld_timer, bnx2i_ep_ofld_timer, 0);
 	bnx2i_conn->ep->ofld_timer.expires = 1 * HZ + jiffies;
-	add_timer(&bnx2i_conn->ep->ofld_timer);
+	timer_add(&bnx2i_conn->ep->ofld_timer);
 	/* update iSCSI context for this conn, wait for CNIC to complete */
 	wait_event_interruptible(bnx2i_conn->ep->ofld_wait,
 			bnx2i_conn->ep->state != EP_STATE_ULP_UPDATE_START);
@@ -1736,7 +1736,7 @@ static int bnx2i_tear_down_conn(struct bnx2i_hba *hba,
 	ep->state = EP_STATE_CLEANUP_START;
 	timer_setup(&ep->ofld_timer, bnx2i_ep_ofld_timer, 0);
 	ep->ofld_timer.expires = hba->conn_ctx_destroy_tmo + jiffies;
-	add_timer(&ep->ofld_timer);
+	timer_add(&ep->ofld_timer);
 
 	bnx2i_ep_destroy_list_add(hba, ep);
 
@@ -1840,7 +1840,7 @@ static struct iscsi_endpoint *bnx2i_ep_connect(struct Scsi_Host *shost,
 
 	timer_setup(&bnx2i_ep->ofld_timer, bnx2i_ep_ofld_timer, 0);
 	bnx2i_ep->ofld_timer.expires = 2 * HZ + jiffies;
-	add_timer(&bnx2i_ep->ofld_timer);
+	timer_add(&bnx2i_ep->ofld_timer);
 
 	if (bnx2i_send_conn_ofld_req(hba, bnx2i_ep)) {
 		if (bnx2i_ep->state == EP_STATE_OFLD_FAILED_CID_BUSY) {
@@ -2057,7 +2057,7 @@ int bnx2i_hw_ep_disconnect(struct bnx2i_endpoint *bnx2i_ep)
 
 	timer_setup(&bnx2i_ep->ofld_timer, bnx2i_ep_ofld_timer, 0);
 	bnx2i_ep->ofld_timer.expires = hba->conn_teardown_tmo + jiffies;
-	add_timer(&bnx2i_ep->ofld_timer);
+	timer_add(&bnx2i_ep->ofld_timer);
 
 	if (!test_bit(BNX2I_CNIC_REGISTERED, &hba->reg_with_cnic))
 		goto out;
diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index 61bd89b7964d..048ab05a243d 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -747,7 +747,7 @@ static void waiting_set_timer(struct AdapterCtlBlk *acb, unsigned long to)
 		    acb->last_reset - HZ / 2 + 1;
 	else
 		acb->waiting_timer.expires = jiffies + to + 1;
-	add_timer(&acb->waiting_timer);
+	timer_add(&acb->waiting_timer);
 }
 
 
@@ -1307,7 +1307,7 @@ static void selto_timer(struct AdapterCtlBlk *acb)
 		    acb->last_reset + HZ / 2 + 1;
 	else
 		acb->selto_timer.expires = jiffies + HZ + 1;
-	add_timer(&acb->selto_timer);
+	timer_add(&acb->selto_timer);
 }
 
 
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index 3f31875ff46e..d0ac3e0d5817 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -1580,7 +1580,7 @@ void esas2r_kickoff_timer(struct esas2r_adapter *a)
 	a->timer.expires = jiffies +
 			   msecs_to_jiffies(100);
 
-	add_timer(&a->timer);
+	timer_add(&a->timer);
 }
 
 static void esas2r_timer_callback(struct timer_list *t)
diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
index 894846f0f014..4d5356a87a57 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_main.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
@@ -1017,7 +1017,7 @@ void hisi_sas_phy_oob_ready(struct hisi_hba *hisi_hba, int phy_no)
 			phy->wait_phyup_cnt++;
 			phy->timer.expires = jiffies +
 					     HISI_SAS_WAIT_PHYUP_TIMEOUT;
-			add_timer(&phy->timer);
+			timer_add(&phy->timer);
 			spin_unlock_irqrestore(&phy->lock, flags);
 			return;
 		}
diff --git a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
index 87cff6d7d8d5..945c2d52d10c 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v2_hw.c
@@ -1372,7 +1372,7 @@ static void set_link_timer_quirk(struct hisi_hba *hisi_hba)
 {
 	hisi_hba->timer.function = link_timeout_disable_link;
 	hisi_hba->timer.expires = jiffies + msecs_to_jiffies(1000);
-	add_timer(&hisi_hba->timer);
+	timer_add(&hisi_hba->timer);
 }
 
 static int hw_init_v2_hw(struct hisi_hba *hisi_hba)
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 862ab0fbc893..40d226e8bb2e 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -1731,7 +1731,7 @@ static int ibmvfc_send_event(struct ibmvfc_event *evt,
 
 	if (timeout) {
 		evt->timer.expires = jiffies + (timeout * HZ);
-		add_timer(&evt->timer);
+		timer_add(&evt->timer);
 	}
 
 	spin_lock_irqsave(&evt->queue->l_lock, flags);
@@ -4735,7 +4735,7 @@ static void ibmvfc_tgt_adisc(struct ibmvfc_target *tgt)
 		mod_timer(&tgt->timer, jiffies + (IBMVFC_ADISC_TIMEOUT * HZ));
 	else {
 		tgt->timer.expires = jiffies + (IBMVFC_ADISC_TIMEOUT * HZ);
-		add_timer(&tgt->timer);
+		timer_add(&tgt->timer);
 	}
 
 	ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_INIT_WAIT);
diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index c9285d1faf23..7620ebf52200 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -937,7 +937,7 @@ static int ibmvscsi_send_srp_event(struct srp_event_struct *evt_struct,
 	timer_setup(&evt_struct->timer, ibmvscsi_timeout, 0);
 	if (timeout) {
 		evt_struct->timer.expires = jiffies + (timeout * HZ);
-		add_timer(&evt_struct->timer);
+		timer_add(&evt_struct->timer);
 	}
 
 	rc = ibmvscsi_send_crq(hostdata, be64_to_cpu(crq_as_u64[0]),
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index b29bec6abd72..98770758ae4e 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -934,7 +934,7 @@ static void ipr_do_req(struct ipr_cmnd *ipr_cmd,
 	ipr_cmd->timer.expires = jiffies + timeout;
 	ipr_cmd->timer.function = timeout_func;
 
-	add_timer(&ipr_cmd->timer);
+	timer_add(&ipr_cmd->timer);
 
 	ipr_trc_hook(ipr_cmd, IPR_TRACE_START, 0);
 
@@ -7514,7 +7514,7 @@ static void ipr_reset_start_timer(struct ipr_cmnd *ipr_cmd,
 
 	ipr_cmd->timer.expires = jiffies + timeout;
 	ipr_cmd->timer.function = ipr_reset_timer_done;
-	add_timer(&ipr_cmd->timer);
+	timer_add(&ipr_cmd->timer);
 }
 
 /**
@@ -7600,7 +7600,7 @@ static int ipr_reset_next_stage(struct ipr_cmnd *ipr_cmd)
 	ipr_cmd->timer.expires = jiffies + stage_time * HZ;
 	ipr_cmd->timer.function = ipr_oper_timeout;
 	ipr_cmd->done = ipr_reset_ioa_job;
-	add_timer(&ipr_cmd->timer);
+	timer_add(&ipr_cmd->timer);
 
 	list_add_tail(&ipr_cmd->queue, &ipr_cmd->hrrq->hrrq_pending_q);
 
@@ -7670,7 +7670,7 @@ static int ipr_reset_enable_ioa(struct ipr_cmnd *ipr_cmd)
 	ipr_cmd->timer.expires = jiffies + (ioa_cfg->transop_timeout * HZ);
 	ipr_cmd->timer.function = ipr_oper_timeout;
 	ipr_cmd->done = ipr_reset_ioa_job;
-	add_timer(&ipr_cmd->timer);
+	timer_add(&ipr_cmd->timer);
 	list_add_tail(&ipr_cmd->queue, &ipr_cmd->hrrq->hrrq_pending_q);
 
 	LEAVE;
diff --git a/drivers/scsi/libiscsi.c b/drivers/scsi/libiscsi.c
index 0d441f4cdb5d..bd15c749228d 100644
--- a/drivers/scsi/libiscsi.c
+++ b/drivers/scsi/libiscsi.c
@@ -1926,7 +1926,7 @@ static int iscsi_exec_task_mgmt_fn(struct iscsi_conn *conn,
 	}
 	conn->tmfcmd_pdus_cnt++;
 	session->tmf_timer.expires = timeout * HZ + jiffies;
-	add_timer(&session->tmf_timer);
+	timer_add(&session->tmf_timer);
 	ISCSI_DBG_EH(session, "tmf set timeout\n");
 
 	spin_unlock_bh(&session->frwd_lock);
diff --git a/drivers/scsi/libsas/sas_expander.c b/drivers/scsi/libsas/sas_expander.c
index 869b5d4db44c..bc5a6719e685 100644
--- a/drivers/scsi/libsas/sas_expander.c
+++ b/drivers/scsi/libsas/sas_expander.c
@@ -84,7 +84,7 @@ static int smp_execute_task_sg(struct domain_device *dev,
 
 		task->slow_task->timer.function = sas_task_internal_timedout;
 		task->slow_task->timer.expires = jiffies + SMP_TIMEOUT*HZ;
-		add_timer(&task->slow_task->timer);
+		timer_add(&task->slow_task->timer);
 
 		res = i->dft->lldd_execute_task(task, GFP_KERNEL);
 
diff --git a/drivers/scsi/libsas/sas_scsi_host.c b/drivers/scsi/libsas/sas_scsi_host.c
index 928723c90b75..87487b18f624 100644
--- a/drivers/scsi/libsas/sas_scsi_host.c
+++ b/drivers/scsi/libsas/sas_scsi_host.c
@@ -903,7 +903,7 @@ static int sas_execute_internal_abort(struct domain_device *device,
 		task->task_done = sas_task_internal_done;
 		task->slow_task->timer.function = sas_task_internal_timedout;
 		task->slow_task->timer.expires = jiffies + TASK_TIMEOUT;
-		add_timer(&task->slow_task->timer);
+		timer_add(&task->slow_task->timer);
 
 		task->abort_task.tag = tag;
 		task->abort_task.type = type;
@@ -1006,7 +1006,7 @@ int sas_execute_tmf(struct domain_device *device, void *parameter,
 
 		task->slow_task->timer.function = sas_task_internal_timedout;
 		task->slow_task->timer.expires = jiffies + TASK_TIMEOUT;
-		add_timer(&task->slow_task->timer);
+		timer_add(&task->slow_task->timer);
 
 		res = i->dft->lldd_execute_task(task, GFP_KERNEL);
 		if (res) {
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index ce72cb04a78a..7740daa94313 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -3913,7 +3913,7 @@ megaraid_sysfs_get_ldmap(adapter_t *adapter)
 			     megaraid_sysfs_get_ldmap_timeout, 0);
 
 	timeout.timer.expires		= jiffies + 60 * HZ;
-	add_timer(&timeout.timer);
+	timer_add(&timeout.timer);
 
 	/*
 	 * Send the command to the firmware
diff --git a/drivers/scsi/megaraid/megaraid_mm.c b/drivers/scsi/megaraid/megaraid_mm.c
index d3133be36879..38dc22f8c8cd 100644
--- a/drivers/scsi/megaraid/megaraid_mm.c
+++ b/drivers/scsi/megaraid/megaraid_mm.c
@@ -694,7 +694,7 @@ lld_ioctl(mraid_mmadp_t *adp, uioc_t *kioc)
 
 		timeout.timer.expires	= jiffies + adp->timeout * HZ;
 
-		add_timer(&timeout.timer);
+		timer_add(&timeout.timer);
 	}
 
 	/*
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index e94bf778e83b..3e1a19b199cd 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -2335,7 +2335,7 @@ void megasas_start_timer(struct megasas_instance *instance)
 
 	timer_setup(timer, megasas_sriov_heartbeat_handler, 0);
 	timer->expires = jiffies + MEGASAS_SRIOV_HEARTBEAT_INTERVAL_VF;
-	add_timer(timer);
+	timer_add(timer);
 }
 
 static void
diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index 6c46654b9cd9..176ad9c72876 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1821,7 +1821,7 @@ void mvs_int_port(struct mvs_info *mvi, int phy_no, u32 events)
 		if (phy->timer.function == NULL) {
 			phy->timer.function = mvs_sig_time_out;
 			phy->timer.expires = jiffies + 5*HZ;
-			add_timer(&phy->timer);
+			timer_add(&phy->timer);
 		}
 	}
 	if (phy->irq_status & (PHYEV_SIG_FIS | PHYEV_ID_DONE)) {
diff --git a/drivers/scsi/ncr53c8xx.c b/drivers/scsi/ncr53c8xx.c
index 34ba9b137789..629010fae809 100644
--- a/drivers/scsi/ncr53c8xx.c
+++ b/drivers/scsi/ncr53c8xx.c
@@ -5573,7 +5573,7 @@ static void ncr_timeout (struct ncb *np)
 	}
 
 	np->timer.expires = jiffies + SCSI_NCR_TIMER_INTERVAL;
-	add_timer(&np->timer);
+	timer_add(&np->timer);
 
 	/*
 	**	If we are resetting the ncr, wait for settle_time before 
diff --git a/drivers/scsi/pmcraid.c b/drivers/scsi/pmcraid.c
index 33f403e307eb..67a1ca5168b9 100644
--- a/drivers/scsi/pmcraid.c
+++ b/drivers/scsi/pmcraid.c
@@ -558,7 +558,7 @@ static void pmcraid_bist_done(struct timer_list *t)
 		pmcraid_info("BIST not complete, waiting another 2 secs\n");
 		cmd->timer.expires = jiffies + cmd->time_left;
 		cmd->time_left = 0;
-		add_timer(&cmd->timer);
+		timer_add(&cmd->timer);
 	} else {
 		cmd->time_left = 0;
 		pmcraid_info("BIST is complete, proceeding with reset\n");
@@ -590,7 +590,7 @@ static void pmcraid_start_bist(struct pmcraid_cmd *cmd)
 	cmd->time_left = msecs_to_jiffies(PMCRAID_BIST_TIMEOUT);
 	cmd->timer.expires = jiffies + msecs_to_jiffies(PMCRAID_BIST_TIMEOUT);
 	cmd->timer.function = pmcraid_bist_done;
-	add_timer(&cmd->timer);
+	timer_add(&cmd->timer);
 }
 
 /**
@@ -622,7 +622,7 @@ static void pmcraid_reset_alert_done(struct timer_list *t)
 		cmd->time_left -= PMCRAID_CHECK_FOR_RESET_TIMEOUT;
 		cmd->timer.expires = jiffies + PMCRAID_CHECK_FOR_RESET_TIMEOUT;
 		cmd->timer.function = pmcraid_reset_alert_done;
-		add_timer(&cmd->timer);
+		timer_add(&cmd->timer);
 	}
 }
 
@@ -659,7 +659,7 @@ static void pmcraid_reset_alert(struct pmcraid_cmd *cmd)
 		cmd->time_left = PMCRAID_RESET_TIMEOUT;
 		cmd->timer.expires = jiffies + PMCRAID_CHECK_FOR_RESET_TIMEOUT;
 		cmd->timer.function = pmcraid_reset_alert_done;
-		add_timer(&cmd->timer);
+		timer_add(&cmd->timer);
 
 		iowrite32(DOORBELL_IOA_RESET_ALERT,
 			pinstance->int_regs.host_ioa_interrupt_reg);
@@ -902,7 +902,7 @@ static void pmcraid_send_cmd(
 		/* setup timeout handler */
 		cmd->timer.expires = jiffies + timeout;
 		cmd->timer.function = timeout_func;
-		add_timer(&cmd->timer);
+		timer_add(&cmd->timer);
 	}
 
 	/* fire the command to IOA */
@@ -1928,7 +1928,7 @@ static void pmcraid_soft_reset(struct pmcraid_cmd *cmd)
 	cmd->timer.function = pmcraid_timeout_handler;
 
 	if (!timer_pending(&cmd->timer))
-		add_timer(&cmd->timer);
+		timer_add(&cmd->timer);
 
 	/* Enable destructive diagnostics on IOA if it is not yet in
 	 * operational state
diff --git a/drivers/scsi/qla2xxx/qla_edif.c b/drivers/scsi/qla2xxx/qla_edif.c
index 32e9f7aefecf..822d174b05c2 100644
--- a/drivers/scsi/qla2xxx/qla_edif.c
+++ b/drivers/scsi/qla2xxx/qla_edif.c
@@ -1718,7 +1718,7 @@ qla24xx_sadb_update(struct bsg_job *bsg_job)
 		 * This is an activity timer that goes off if we have not
 		 * received packets with the new sa_index
 		 */
-		add_timer(&edif_entry->timer);
+		timer_add(&edif_entry->timer);
 
 		/*
 		 * sa_delete for rx key with an active rx key including this one
diff --git a/drivers/scsi/qla2xxx/qla_iocb.c b/drivers/scsi/qla2xxx/qla_iocb.c
index 3224044f1775..b6b8530d1bee 100644
--- a/drivers/scsi/qla2xxx/qla_iocb.c
+++ b/drivers/scsi/qla2xxx/qla_iocb.c
@@ -4035,7 +4035,7 @@ qla2x00_start_sp(srb_t *sp)
 		 * kref_put even on failure
 		 */
 		kref_get(&sp->cmd_kref);
-		add_timer(&sp->u.iocb_cmd.timer);
+		timer_add(&sp->u.iocb_cmd.timer);
 	}
 
 	wmb();
diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index c028a9979e45..5482320ac18b 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -381,7 +381,7 @@ qla2x00_start_timer(scsi_qla_host_t *vha, unsigned long interval)
 {
 	timer_setup(&vha->timer, qla2x00_timer, 0);
 	vha->timer.expires = jiffies + interval * HZ;
-	add_timer(&vha->timer);
+	timer_add(&vha->timer);
 	vha->timer_active = 1;
 }
 
diff --git a/drivers/scsi/qla4xxx/ql4_os.c b/drivers/scsi/qla4xxx/ql4_os.c
index d4141656b204..94205369321a 100644
--- a/drivers/scsi/qla4xxx/ql4_os.c
+++ b/drivers/scsi/qla4xxx/ql4_os.c
@@ -4015,7 +4015,7 @@ static void qla4xxx_start_timer(struct scsi_qla_host *ha,
 		     __func__, ha->host->host_no));
 	timer_setup(&ha->timer, qla4xxx_timer, 0);
 	ha->timer.expires = jiffies + interval * HZ;
-	add_timer(&ha->timer);
+	timer_add(&ha->timer);
 	ha->timer_active = 1;
 }
 
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 0042f8e648d0..e1912f5f8528 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -3848,7 +3848,7 @@ static void pqi_start_heartbeat_timer(struct pqi_ctrl_info *ctrl_info)
 
 	ctrl_info->heartbeat_timer.expires =
 		jiffies + PQI_HEARTBEAT_TIMER_INTERVAL;
-	add_timer(&ctrl_info->heartbeat_timer);
+	timer_add(&ctrl_info->heartbeat_timer);
 }
 
 static inline void pqi_stop_heartbeat_timer(struct pqi_ctrl_info *ctrl_info)
diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/sym_glue.c
index 57637a81776d..a18fea5f5683 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -428,7 +428,7 @@ static void sym_timer(struct sym_hcb *np)
 	 *  Restart the timer.
 	 */
 	np->s.timer.expires = thistime + SYM_CONF_TIMER_INTERVAL;
-	add_timer(&np->s.timer);
+	timer_add(&np->s.timer);
 
 	/*
 	 *  If we are resetting the ncr, wait for settle_time before 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index 8243f9168f4c..549b355cd8d2 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1710,7 +1710,7 @@ static void rx_dma_timer_init(struct lpuart_port *sport)
 
 	timer_setup(&sport->lpuart_timer, lpuart_timer_func, 0);
 	sport->lpuart_timer.expires = jiffies + sport->dma_rx_timeout;
-	add_timer(&sport->lpuart_timer);
+	timer_add(&sport->lpuart_timer);
 }
 
 static void lpuart_request_dma(struct lpuart_port *sport)
diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
index 2960031ace72..5d9a3ddfd110 100644
--- a/drivers/tty/vcc.c
+++ b/drivers/tty/vcc.c
@@ -260,7 +260,7 @@ static void vcc_kick_rx(struct vcc_port *port)
 	if (!timer_pending(&port->rx_timer) && !port->removed) {
 		disable_irq_nosync(vio->vdev->rx_irq);
 		port->rx_timer.expires = (jiffies + 1);
-		add_timer(&port->rx_timer);
+		timer_add(&port->rx_timer);
 	}
 }
 
@@ -270,7 +270,7 @@ static void vcc_kick_tx(struct vcc_port *port)
 
 	if (!timer_pending(&port->tx_timer) && !port->removed) {
 		port->tx_timer.expires = (jiffies + 1);
-		add_timer(&port->tx_timer);
+		timer_add(&port->tx_timer);
 	}
 }
 
diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fsm.c
index a093544482d5..c486fef9cfc1 100644
--- a/drivers/usb/chipidea/otg_fsm.c
+++ b/drivers/usb/chipidea/otg_fsm.c
@@ -580,7 +580,7 @@ static struct otg_fsm_ops ci_otg_ops = {
 	.loc_conn = ci_otg_loc_conn,
 	.loc_sof = ci_otg_loc_sof,
 	.start_pulse = ci_otg_start_pulse,
-	.add_timer = ci_otg_fsm_add_timer,
+	.timer_add = ci_otg_fsm_add_timer,
 	.del_timer = ci_otg_fsm_del_timer,
 	.start_host = ci_otg_start_host,
 	.start_gadget = ci_otg_start_gadget,
diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index 373942ceb076..e993b3011fce 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -1342,7 +1342,7 @@ udc_set_halt(struct usb_ep *usbep, int halt)
 					/ (1000 * 1000);
 				if (!stop_pollstall_timer) {
 					DBG(ep->dev, "start polltimer\n");
-					add_timer(&udc_pollstall_timer);
+					timer_add(&udc_pollstall_timer);
 				}
 			}
 		}
@@ -1727,7 +1727,7 @@ static void udc_timer_function(struct timer_list *unused)
 			 */
 			udc_timer.expires = jiffies + HZ/UDC_RDE_TIMER_DIV;
 			if (!stop_timer)
-				add_timer(&udc_timer);
+				timer_add(&udc_timer);
 		} else {
 			/*
 			 * fifo contains data now, setup timer for opening
@@ -1740,7 +1740,7 @@ static void udc_timer_function(struct timer_list *unused)
 			/* debug: lhadmot_timer_start = 221070 */
 			udc_timer.expires = jiffies + HZ*UDC_RDE_TIMER_SECONDS;
 			if (!stop_timer)
-				add_timer(&udc_timer);
+				timer_add(&udc_timer);
 		}
 
 	} else
@@ -1807,7 +1807,7 @@ static void udc_pollstall_timer_function(struct timer_list *unused)
 		udc_pollstall_timer.expires = jiffies +
 					HZ * UDC_POLLSTALL_TIMER_USECONDS
 					/ (1000 * 1000);
-		add_timer(&udc_pollstall_timer);
+		timer_add(&udc_pollstall_timer);
 	}
 	spin_unlock_irq(&udc_stall_spinlock);
 
@@ -2045,7 +2045,7 @@ static void udc_ep0_set_rde(struct udc *dev)
 					jiffies + HZ/UDC_RDE_TIMER_DIV;
 				set_rde = 1;
 				if (!stop_timer)
-					add_timer(&udc_timer);
+					timer_add(&udc_timer);
 			}
 		}
 	}
@@ -2234,7 +2234,7 @@ static irqreturn_t udc_data_out_isr(struct udc *dev, int ep_ix)
 						+ HZ*UDC_RDE_TIMER_SECONDS;
 					set_rde = 1;
 					if (!stop_timer)
-						add_timer(&udc_timer);
+						timer_add(&udc_timer);
 				}
 				if (ep->num != UDC_EP0OUT_IX)
 					dev->data_ep_queued = 0;
@@ -2513,7 +2513,7 @@ __acquires(dev->lock)
 				udc_timer.expires = jiffies +
 							HZ/UDC_RDE_TIMER_DIV;
 				if (!stop_timer)
-					add_timer(&udc_timer);
+					timer_add(&udc_timer);
 			}
 		}
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0244d2854372..172b2ab79557 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -423,7 +423,7 @@ static void compliance_mode_recovery_timer_init(struct xhci_hcd *xhci)
 	xhci->comp_mode_recovery_timer.expires = jiffies +
 			msecs_to_jiffies(COMP_MODE_RCVRY_MSECS);
 
-	add_timer(&xhci->comp_mode_recovery_timer);
+	timer_add(&xhci->comp_mode_recovery_timer);
 	xhci_dbg_trace(xhci, trace_xhci_dbg_quirks,
 			"Compliance mode recovery timer initialized");
 }
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 8dcd9cc22413..4803052a9098 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1577,7 +1577,7 @@ static void errata2_function(struct timer_list *unused)
 	spin_unlock_irqrestore(&priv->lock, spinflags);
 
 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
-	add_timer(&errata2_timer);
+	timer_add(&errata2_timer);
 }
 
 static int isp1763_run(struct usb_hcd *hcd)
@@ -1712,7 +1712,7 @@ static int isp1760_run(struct usb_hcd *hcd)
 	errata2_timer_hcd = hcd;
 	timer_setup(&errata2_timer, errata2_function, 0);
 	errata2_timer.expires = jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD);
-	add_timer(&errata2_timer);
+	timer_add(&errata2_timer);
 
 	chipid_h = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
 	chipid_l = isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 40ac68e52cee..17c74f0ac9c8 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -762,7 +762,7 @@ static struct otg_fsm_ops fsl_otg_ops = {
 	.loc_sof = fsl_otg_loc_sof,
 	.start_pulse = fsl_otg_start_pulse,
 
-	.add_timer = fsl_otg_fsm_add_timer,
+	.timer_add = fsl_otg_fsm_add_timer,
 	.del_timer = fsl_otg_fsm_del_timer,
 
 	.start_host = fsl_otg_start_host,
diff --git a/drivers/usb/phy/phy-mv-usb.c b/drivers/usb/phy/phy-mv-usb.c
index 24b8ea50fb86..afc3462e301c 100644
--- a/drivers/usb/phy/phy-mv-usb.c
+++ b/drivers/usb/phy/phy-mv-usb.c
@@ -130,7 +130,7 @@ static int mv_otg_set_timer(struct mv_otg *mvotg, unsigned int id,
 	}
 
 	timer->expires = jiffies + interval;
-	add_timer(timer);
+	timer_add(timer);
 
 	return 0;
 }
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 13a4d47e68cd..7a1db26b16b3 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -252,7 +252,7 @@ static void cpwd_brokentimer(struct timer_list *unused)
 	if (tripped) {
 		/* there is at least one timer brokenstopped-- reschedule */
 		cpwd_timer.expires = WD_BTIMEOUT;
-		add_timer(&cpwd_timer);
+		timer_add(&cpwd_timer);
 	}
 }
 
diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 04a6b470b15d..ebaac810a16d 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -544,7 +544,7 @@ static void gnttab_handle_deferred(struct timer_list *unused)
 		WARN_ON(atomic64_read(&deferred_count));
 	else if (!timer_pending(&deferred_timer)) {
 		deferred_timer.expires = jiffies + HZ;
-		add_timer(&deferred_timer);
+		timer_add(&deferred_timer);
 	}
 	spin_unlock_irqrestore(&gnttab_list_lock, flags);
 	pr_debug("Freed %zu references", freed);
@@ -574,7 +574,7 @@ static void gnttab_add_deferred(grant_ref_t ref, struct page *page)
 		list_add_tail(&entry->list, &deferred_list);
 		if (!timer_pending(&deferred_timer)) {
 			deferred_timer.expires = jiffies + HZ;
-			add_timer(&deferred_timer);
+			timer_add(&deferred_timer);
 		}
 		spin_unlock_irqrestore(&gnttab_list_lock, flags);
 		deferred = atomic64_inc_return(&deferred_count);
diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index cbc4785462f5..cf6e1e5faa44 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -95,7 +95,7 @@ static void jbd2_get_transaction(journal_t *journal,
 
 	/* Set up the commit timer for the new transaction. */
 	journal->j_commit_timer.expires = round_jiffies_up(transaction->t_expires);
-	add_timer(&journal->j_commit_timer);
+	timer_add(&journal->j_commit_timer);
 
 	J_ASSERT(journal->j_running_transaction == NULL);
 	journal->j_running_transaction = transaction;
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 34a075155965..c3a1ac2c3d14 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2201,7 +2201,7 @@ static void nilfs_segctor_start_timer(struct nilfs_sc_info *sci)
 	if (!(sci->sc_state & NILFS_SEGCTOR_COMMIT)) {
 		if (sci->sc_task) {
 			sci->sc_timer.expires = jiffies + sci->sc_interval;
-			add_timer(&sci->sc_timer);
+			timer_add(&sci->sc_timer);
 		}
 		sci->sc_state |= NILFS_SEGCTOR_COMMIT;
 	}
@@ -2452,7 +2452,7 @@ static void nilfs_segctor_notify(struct nilfs_sc_info *sci, int mode, int err)
 		/* re-enable timer if checkpoint creation was not done */
 		if ((sci->sc_state & NILFS_SEGCTOR_COMMIT) && sci->sc_task &&
 		    time_before(jiffies, sci->sc_timer.expires))
-			add_timer(&sci->sc_timer);
+			timer_add(&sci->sc_timer);
 	}
 	spin_unlock(&sci->sc_state_lock);
 }
diff --git a/include/linux/timer.h b/include/linux/timer.h
index f662aca5d536..899dac465250 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -38,7 +38,7 @@
  *
  * @TIMER_PINNED: A pinned timer will always expire on the CPU on which the
  * timer was enqueued. When a particular CPU is required, add_timer_on()
- * has to be used. Enqueue via mod_timer() and add_timer() is always done
+ * has to be used. Enqueue via mod_timer() and timer_add() is always done
  * on the local CPU.
  */
 #define TIMER_CPUMASK		0x0003FFFF
@@ -158,7 +158,7 @@ extern int timer_reduce(struct timer_list *timer, unsigned long expires);
  */
 #define NEXT_TIMER_MAX_DELTA	((1UL << 30) - 1)
 
-extern void add_timer(struct timer_list *timer);
+extern void timer_add(struct timer_list *timer);
 extern void timer_add_local(struct timer_list *timer);
 extern void timer_add_global(struct timer_list *timer);
 
diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
index 6135d076c53d..def298bae8c8 100644
--- a/include/linux/usb/otg-fsm.h
+++ b/include/linux/usb/otg-fsm.h
@@ -195,7 +195,7 @@ struct otg_fsm_ops {
 	void	(*start_pulse)(struct otg_fsm *fsm);
 	void	(*start_adp_prb)(struct otg_fsm *fsm);
 	void	(*start_adp_sns)(struct otg_fsm *fsm);
-	void	(*add_timer)(struct otg_fsm *fsm, enum otg_fsm_timer timer);
+	void	(*timer_add)(struct otg_fsm *fsm, enum otg_fsm_timer timer);
 	void	(*del_timer)(struct otg_fsm *fsm, enum otg_fsm_timer timer);
 	int	(*start_host)(struct otg_fsm *fsm, int on);
 	int	(*start_gadget)(struct otg_fsm *fsm, int on);
@@ -279,9 +279,9 @@ static inline int otg_start_adp_sns(struct otg_fsm *fsm)
 
 static inline int otg_add_timer(struct otg_fsm *fsm, enum otg_fsm_timer timer)
 {
-	if (!fsm->ops->add_timer)
+	if (!fsm->ops->timer_add)
 		return -EOPNOTSUPP;
-	fsm->ops->add_timer(fsm, timer);
+	fsm->ops->timer_add(fsm, timer);
 	return 0;
 }
 
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 07370e74ebf1..43f550279758 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1259,7 +1259,7 @@ static void __kthread_queue_delayed_work(struct kthread_worker *worker,
 	list_add(&work->node, &worker->delayed_work_list);
 	work->worker = worker;
 	timer->expires = jiffies + delay;
-	add_timer(timer);
+	timer_add(timer);
 }
 
 /**
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 7982183ef279..d72399187d6d 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1033,7 +1033,7 @@ static void rcu_tasks_postscan(struct list_head *hop)
 
 	if (!IS_ENABLED(CONFIG_TINY_RCU)) {
 		tasks_rcu_exit_srcu_stall_timer.expires = jiffies + rtsi;
-		add_timer(&tasks_rcu_exit_srcu_stall_timer);
+		timer_add(&tasks_rcu_exit_srcu_stall_timer);
 	}
 
 	/*
@@ -1169,7 +1169,7 @@ static void tasks_rcu_exit_srcu_stall(struct timer_list *unused)
 		tasks_gp_state_getname(&rcu_tasks), jiffies - rcu_tasks.gp_jiffies);
 	pr_info("Please check any exiting tasks stuck between calls to exit_tasks_rcu_start() and exit_tasks_rcu_finish()\n");
 	tasks_rcu_exit_srcu_stall_timer.expires = jiffies + rtsi;
-	add_timer(&tasks_rcu_exit_srcu_stall_timer);
+	timer_add(&tasks_rcu_exit_srcu_stall_timer);
 #endif // #ifndef CONFIG_TINY_RCU
 }
 
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index 4873eceb85ce..0745d2148150 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -95,7 +95,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer.task = current;
 	timer_setup_on_stack(&timer.timer, process_timeout, 0);
 	timer.timer.expires = expire;
-	add_timer(&timer.timer);
+	timer_add(&timer.timer);
 	schedule();
 	timer_delete_sync(&timer.timer);
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 74c1383e887f..67fdc84b2a30 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1212,7 +1212,7 @@ EXPORT_SYMBOL(timer_mod_pending);
  *
  * mod_timer(timer, expires) is equivalent to:
  *
- *     timer_delete(timer); timer->expires = expires; add_timer(timer);
+ *     timer_delete(timer); timer->expires = expires; timer_add(timer);
  *
  * mod_timer() is more efficient than the above open coded sequence. In
  * case that the timer is inactive, the timer_delete() part is a NOP. The
@@ -1220,7 +1220,7 @@ EXPORT_SYMBOL(timer_mod_pending);
  *
  * Note that if there are multiple unserialized concurrent users of the
  * same timer, then mod_timer() is the only safe way to modify the timeout,
- * since add_timer() cannot modify an already running timer.
+ * since timer_add() cannot modify an already running timer.
  *
  * If @timer->function == NULL then the start operation is silently
  * discarded. In this case the return value is 0 and meaningless.
@@ -1265,7 +1265,7 @@ int timer_reduce(struct timer_list *timer, unsigned long expires)
 EXPORT_SYMBOL(timer_reduce);
 
 /**
- * add_timer - Start a timer
+ * timer_add - Start a timer
  * @timer:	The timer to be started
  *
  * Start @timer to expire at @timer->expires in the future. @timer->expires
@@ -1284,21 +1284,21 @@ EXPORT_SYMBOL(timer_reduce);
  * This can only operate on an inactive timer. Attempts to invoke this on
  * an active timer are rejected with a warning.
  */
-void add_timer(struct timer_list *timer)
+void timer_add(struct timer_list *timer)
 {
 	if (WARN_ON_ONCE(timer_pending(timer)))
 		return;
 	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
-EXPORT_SYMBOL(add_timer);
+EXPORT_SYMBOL(timer_add);
 
 /**
  * timer_add_local() - Start a timer on the local CPU
  * @timer:	The timer to be started
  *
- * Same as add_timer() except that the timer flag TIMER_PINNED is set.
+ * Same as timer_add() except that the timer flag TIMER_PINNED is set.
  *
- * See add_timer() for further details.
+ * See timer_add() for further details.
  */
 void timer_add_local(struct timer_list *timer)
 {
@@ -1313,9 +1313,9 @@ EXPORT_SYMBOL(timer_add_local);
  * timer_add_global() - Start a timer without TIMER_PINNED flag set
  * @timer:	The timer to be started
  *
- * Same as add_timer() except that the timer flag TIMER_PINNED is unset.
+ * Same as timer_add() except that the timer flag TIMER_PINNED is unset.
  *
- * See add_timer() for further details.
+ * See timer_add() for further details.
  */
 void timer_add_global(struct timer_list *timer)
 {
@@ -1331,12 +1331,12 @@ EXPORT_SYMBOL(timer_add_global);
  * @timer:	The timer to be started
  * @cpu:	The CPU to start it on
  *
- * Same as add_timer() except that it starts the timer on the given CPU and
+ * Same as timer_add() except that it starts the timer on the given CPU and
  * the TIMER_PINNED flag is set. When timer shouldn't be a pinned timer in
  * the next round, timer_add_global() should be used instead as it unsets
  * the TIMER_PINNED flag.
  *
- * See add_timer() for further details.
+ * See timer_add() for further details.
  */
 void add_timer_on(struct timer_list *timer, int cpu)
 {
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 25923cfec9c6..eafc120eb405 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -701,7 +701,7 @@ static void queue_oom_reaper(struct task_struct *tsk)
 	get_task_struct(tsk);
 	timer_setup(&tsk->oom_reaper_timer, wake_oom_reaper, 0);
 	tsk->oom_reaper_timer.expires = jiffies + OOM_REAPER_DELAY;
-	add_timer(&tsk->oom_reaper_timer);
+	timer_add(&tsk->oom_reaper_timer);
 }
 
 #ifdef CONFIG_SYSCTL
diff --git a/net/appletalk/aarp.c b/net/appletalk/aarp.c
index 9c787e2e4b17..43d9bca10b73 100644
--- a/net/appletalk/aarp.c
+++ b/net/appletalk/aarp.c
@@ -853,7 +853,7 @@ int __init aarp_proto_init(void)
 	}
 	timer_setup(&aarp_timer, aarp_expire_timeout, 0);
 	aarp_timer.expires  = jiffies + sysctl_aarp_expiry_time;
-	add_timer(&aarp_timer);
+	timer_add(&aarp_timer);
 	rc = register_netdevice_notifier(&aarp_notifier);
 	if (rc) {
 		timer_delete_sync(&aarp_timer);
diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index 73ea7e67f05a..47d876f46422 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -173,7 +173,7 @@ static void atalk_destroy_timer(struct timer_list *t)
 
 	if (sk_has_allocations(sk)) {
 		sk->sk_timer.expires = jiffies + SOCK_DESTROY_TIME;
-		add_timer(&sk->sk_timer);
+		timer_add(&sk->sk_timer);
 	} else
 		sock_put(sk);
 }
@@ -186,7 +186,7 @@ static inline void atalk_destroy_socket(struct sock *sk)
 	if (sk_has_allocations(sk)) {
 		timer_setup(&sk->sk_timer, atalk_destroy_timer, 0);
 		sk->sk_timer.expires	= jiffies + SOCK_DESTROY_TIME;
-		add_timer(&sk->sk_timer);
+		timer_add(&sk->sk_timer);
 	} else
 		sock_put(sk);
 }
diff --git a/net/atm/lec.c b/net/atm/lec.c
index 97c6a1b9ca89..ca452b2982c2 100644
--- a/net/atm/lec.c
+++ b/net/atm/lec.c
@@ -1778,7 +1778,7 @@ static struct atm_vcc *lec_arp_resolve(struct lec_priv *priv,
 			send_to_lecd(priv, l_arp_xmt, mac_to_find, NULL, NULL);
 		entry->timer.expires = jiffies + (1 * HZ);
 		entry->timer.function = lec_arp_expire_arp;
-		add_timer(&entry->timer);
+		timer_add(&entry->timer);
 		found = priv->mcast_vcc;
 	}
 
@@ -1970,7 +1970,7 @@ lec_vcc_added(struct lec_priv *priv, const struct atmlec_ioc *ioc_data,
 		entry->timer.expires = jiffies + priv->vcc_timeout_period;
 		entry->timer.function = lec_arp_expire_vcc;
 		hlist_add_head(&entry->next, &priv->lec_no_forward);
-		add_timer(&entry->timer);
+		timer_add(&entry->timer);
 		dump_arp_table(priv);
 		goto out;
 	}
@@ -2044,7 +2044,7 @@ lec_vcc_added(struct lec_priv *priv, const struct atmlec_ioc *ioc_data,
 	hlist_add_head(&entry->next, &priv->lec_arp_empty_ones);
 	entry->timer.expires = jiffies + priv->vcc_timeout_period;
 	entry->timer.function = lec_arp_expire_vcc;
-	add_timer(&entry->timer);
+	timer_add(&entry->timer);
 	pr_debug("After vcc was added\n");
 	dump_arp_table(priv);
 out:
diff --git a/net/atm/mpc.c b/net/atm/mpc.c
index f6b447bba329..6b0c98a71329 100644
--- a/net/atm/mpc.c
+++ b/net/atm/mpc.c
@@ -1416,7 +1416,7 @@ static void mpc_timer_refresh(void)
 {
 	mpc_timer.expires = jiffies + (MPC_P2 * HZ);
 	checking_time = mpc_timer.expires;
-	add_timer(&mpc_timer);
+	timer_add(&mpc_timer);
 }
 
 static void mpc_cache_check(struct timer_list *unused)
diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6ef8b2a57a9b..4dc6c5f2e0b1 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -345,7 +345,7 @@ void ax25_destroy_socket(ax25_cb *ax25)
 			/* Defer: outstanding buffers */
 			timer_setup(&ax25->dtimer, ax25_destroy_timer, 0);
 			ax25->dtimer.expires  = jiffies + 2 * HZ;
-			add_timer(&ax25->dtimer);
+			timer_add(&ax25->dtimer);
 		} else {
 			struct sock *sk=ax25->sk;
 			ax25->sk=NULL;
diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
index 60d31c2feed3..046764ec42de 100644
--- a/net/core/drop_monitor.c
+++ b/net/core/drop_monitor.c
@@ -256,7 +256,7 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
 
 	if (!timer_pending(&data->send_timer)) {
 		data->send_timer.expires = jiffies + dm_delay * HZ;
-		add_timer(&data->send_timer);
+		timer_add(&data->send_timer);
 	}
 
 out:
@@ -475,7 +475,7 @@ net_dm_hw_trap_summary_probe(void *ignore, const struct devlink *devlink,
 
 	if (!timer_pending(&hw_data->send_timer)) {
 		hw_data->send_timer.expires = jiffies + dm_delay * HZ;
-		add_timer(&hw_data->send_timer);
+		timer_add(&hw_data->send_timer);
 	}
 
 out:
diff --git a/net/ipv4/igmp.c b/net/ipv4/igmp.c
index d1769034b643..ab1084be3ce7 100644
--- a/net/ipv4/igmp.c
+++ b/net/ipv4/igmp.c
@@ -253,7 +253,7 @@ static void igmp_mod_timer(struct ip_mc_list *im, int max_delay)
 	im->unsolicit_count = 0;
 	if (timer_delete(&im->timer)) {
 		if ((long)(im->timer.expires-jiffies) < max_delay) {
-			add_timer(&im->timer);
+			timer_add(&im->timer);
 			im->tm_running = 1;
 			spin_unlock_bh(&im->lock);
 			return;
diff --git a/net/lapb/lapb_timer.c b/net/lapb/lapb_timer.c
index 9fde6cf20f10..03269d53efe5 100644
--- a/net/lapb/lapb_timer.c
+++ b/net/lapb/lapb_timer.c
@@ -41,7 +41,7 @@ void lapb_start_t1timer(struct lapb_cb *lapb)
 	lapb->t1timer.expires  = jiffies + lapb->t1;
 
 	lapb->t1timer_running = true;
-	add_timer(&lapb->t1timer);
+	timer_add(&lapb->t1timer);
 }
 
 void lapb_start_t2timer(struct lapb_cb *lapb)
@@ -52,7 +52,7 @@ void lapb_start_t2timer(struct lapb_cb *lapb)
 	lapb->t2timer.expires  = jiffies + lapb->t2;
 
 	lapb->t2timer_running = true;
-	add_timer(&lapb->t2timer);
+	timer_add(&lapb->t2timer);
 }
 
 void lapb_stop_t1timer(struct lapb_cb *lapb)
diff --git a/net/mptcp/pm.c b/net/mptcp/pm.c
index 2475b3975813..14c1123039b4 100644
--- a/net/mptcp/pm.c
+++ b/net/mptcp/pm.c
@@ -16,7 +16,7 @@ struct mptcp_pm_add_entry {
 	struct list_head	list;
 	struct mptcp_addr_info	addr;
 	u8			retrans_times;
-	struct timer_list	add_timer;
+	struct timer_list	timer_add;
 	struct mptcp_sock	*sock;
 };
 
@@ -267,7 +267,7 @@ int mptcp_pm_mp_prio_send_ack(struct mptcp_sock *msk,
 
 static void mptcp_pm_add_timer(struct timer_list *timer)
 {
-	struct mptcp_pm_add_entry *entry = timer_container_of(entry, timer, add_timer);
+	struct mptcp_pm_add_entry *entry = timer_container_of(entry, timer, timer_add);
 	struct mptcp_sock *msk = entry->sock;
 	struct sock *sk = (struct sock *)msk;
 
@@ -315,21 +315,21 @@ mptcp_pm_del_add_timer(struct mptcp_sock *msk,
 {
 	struct mptcp_pm_add_entry *entry;
 	struct sock *sk = (struct sock *)msk;
-	struct timer_list *add_timer = NULL;
+	struct timer_list *timer_add = NULL;
 
 	spin_lock_bh(&msk->pm.lock);
 	entry = mptcp_lookup_anno_list_by_saddr(msk, addr);
 	if (entry && (!check_id || entry->addr.id == addr->id)) {
 		entry->retrans_times = ADD_ADDR_RETRANS_MAX;
-		add_timer = &entry->add_timer;
+		timer_add = &entry->timer_add;
 	}
 	if (!check_id && entry)
 		list_del(&entry->list);
 	spin_unlock_bh(&msk->pm.lock);
 
 	/* no lock, because sk_stop_timer_sync() is calling timer_delete_sync() */
-	if (add_timer)
-		sk_stop_timer_sync(sk, add_timer);
+	if (timer_add)
+		sk_stop_timer_sync(sk, timer_add);
 
 	return entry;
 }
@@ -349,7 +349,7 @@ bool mptcp_pm_alloc_anno_list(struct mptcp_sock *msk,
 		if (WARN_ON_ONCE(mptcp_pm_is_kernel(msk)))
 			return false;
 
-		sk_reset_timer(sk, &add_entry->add_timer,
+		sk_reset_timer(sk, &add_entry->timer_add,
 			       jiffies + mptcp_get_add_addr_timeout(net));
 		return true;
 	}
@@ -364,8 +364,8 @@ bool mptcp_pm_alloc_anno_list(struct mptcp_sock *msk,
 	add_entry->sock = msk;
 	add_entry->retrans_times = 0;
 
-	timer_setup(&add_entry->add_timer, mptcp_pm_add_timer, 0);
-	sk_reset_timer(sk, &add_entry->add_timer,
+	timer_setup(&add_entry->timer_add, mptcp_pm_add_timer, 0);
+	sk_reset_timer(sk, &add_entry->timer_add,
 		       jiffies + mptcp_get_add_addr_timeout(net));
 
 	return true;
@@ -384,7 +384,7 @@ static void mptcp_pm_free_anno_list(struct mptcp_sock *msk)
 	spin_unlock_bh(&msk->pm.lock);
 
 	list_for_each_entry_safe(entry, tmp, &free_list, list) {
-		sk_stop_timer_sync(sk, &entry->add_timer);
+		sk_stop_timer_sync(sk, &entry->timer_add);
 		kfree(entry);
 	}
 }
diff --git a/net/netfilter/ipset/ip_set_bitmap_gen.h b/net/netfilter/ipset/ip_set_bitmap_gen.h
index 798c7993635e..b6be18037f30 100644
--- a/net/netfilter/ipset/ip_set_bitmap_gen.h
+++ b/net/netfilter/ipset/ip_set_bitmap_gen.h
@@ -285,7 +285,7 @@ mtype_gc(struct timer_list *t)
 	spin_unlock_bh(&set->lock);
 
 	map->gc.expires = jiffies + IPSET_GC_PERIOD(set->timeout) * HZ;
-	add_timer(&map->gc);
+	timer_add(&map->gc);
 }
 
 static void
diff --git a/net/netfilter/ipset/ip_set_list_set.c b/net/netfilter/ipset/ip_set_list_set.c
index 13c7a08aa868..dc45021a784a 100644
--- a/net/netfilter/ipset/ip_set_list_set.c
+++ b/net/netfilter/ipset/ip_set_list_set.c
@@ -579,7 +579,7 @@ list_set_gc(struct timer_list *t)
 	spin_unlock_bh(&set->lock);
 
 	map->gc.expires = jiffies + IPSET_GC_PERIOD(set->timeout) * HZ;
-	add_timer(&map->gc);
+	timer_add(&map->gc);
 }
 
 static void
diff --git a/net/netfilter/nf_conntrack_expect.c b/net/netfilter/nf_conntrack_expect.c
index cfc2daa3fc7f..a71ee3d36bb9 100644
--- a/net/netfilter/nf_conntrack_expect.c
+++ b/net/netfilter/nf_conntrack_expect.c
@@ -400,7 +400,7 @@ static void nf_ct_expect_insert(struct nf_conntrack_expect *exp)
 		exp->timeout.expires = jiffies +
 			helper->expect_policy[exp->class].timeout * HZ;
 	}
-	add_timer(&exp->timeout);
+	timer_add(&exp->timeout);
 
 	hlist_add_head_rcu(&exp->lnode, &master_help->expectations);
 	master_help->expecting[exp->class]++;
diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 2cc0fde23344..1446c1bfa5cd 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -3482,7 +3482,7 @@ ctnetlink_change_expect(struct nf_conntrack_expect *x,
 
 		x->timeout.expires = jiffies +
 			ntohl(nla_get_be32(cda[CTA_EXPECT_TIMEOUT])) * HZ;
-		add_timer(&x->timeout);
+		timer_add(&x->timeout);
 	}
 	return 0;
 }
diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index bfcb9cd335bf..494d9426ba9e 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -813,7 +813,7 @@ nfulnl_log_packet(struct net *net,
 	else if (!timer_pending(&inst->timer)) {
 		instance_get(inst);
 		inst->timer.expires = jiffies + (inst->flushtimeout*HZ/100);
-		add_timer(&inst->timer);
+		timer_add(&inst->timer);
 	}
 
 unlock_and_release:
diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 3331669d8e33..8a33d8ba24ed 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -283,7 +283,7 @@ void nr_destroy_socket(struct sock *sk)
 		/* Defer: outstanding buffers */
 		sk->sk_timer.function = nr_destroy_timer;
 		sk->sk_timer.expires  = jiffies + 2 * HZ;
-		add_timer(&sk->sk_timer);
+		timer_add(&sk->sk_timer);
 	} else
 		sock_put(sk);
 }
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 4e72b636a46a..0d98387cf547 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -382,7 +382,7 @@ void rose_destroy_socket(struct sock *sk)
 		/* Defer: outstanding buffers */
 		timer_setup(&sk->sk_timer, rose_destroy_timer, 0);
 		sk->sk_timer.expires  = jiffies + 10 * HZ;
-		add_timer(&sk->sk_timer);
+		timer_add(&sk->sk_timer);
 	} else
 		sock_put(sk);
 }
diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index 7746229fdc8c..d9f5d3f76223 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -38,7 +38,7 @@ void rose_start_ftimer(struct rose_neigh *neigh)
 	neigh->ftimer.expires  =
 		jiffies + msecs_to_jiffies(sysctl_rose_link_fail_timeout);
 
-	add_timer(&neigh->ftimer);
+	timer_add(&neigh->ftimer);
 }
 
 static void rose_start_t0timer(struct rose_neigh *neigh)
@@ -49,7 +49,7 @@ static void rose_start_t0timer(struct rose_neigh *neigh)
 	neigh->t0timer.expires  =
 		jiffies + msecs_to_jiffies(sysctl_rose_restart_request_timeout);
 
-	add_timer(&neigh->t0timer);
+	timer_add(&neigh->t0timer);
 }
 
 void rose_stop_ftimer(struct rose_neigh *neigh)
diff --git a/net/sctp/sm_sideeffect.c b/net/sctp/sm_sideeffect.c
index 6c24ac6d3bf1..d16c244fc451 100644
--- a/net/sctp/sm_sideeffect.c
+++ b/net/sctp/sm_sideeffect.c
@@ -1539,7 +1539,7 @@ static int sctp_cmd_interpreter(enum sctp_event_type event_type,
 			 * SCTP has a hard time with timer starts.  Because we process
 			 * timer starts as side effects, it can be hard to tell if we
 			 * have already started a timer or not, which leads to BUG
-			 * halts when we call add_timer. So here, instead of just starting
+			 * halts when we call timer_add. So here, instead of just starting
 			 * a timer, if the timer is already started, and just mod
 			 * the timer with the shorter of the two expiration times
 			 */
diff --git a/net/x25/af_x25.c b/net/x25/af_x25.c
index 1f8ae9f4a3f1..f51c249efb39 100644
--- a/net/x25/af_x25.c
+++ b/net/x25/af_x25.c
@@ -399,7 +399,7 @@ static void __x25_destroy_socket(struct sock *sk)
 		/* Defer: outstanding buffers */
 		sk->sk_timer.expires  = jiffies + 10 * HZ;
 		sk->sk_timer.function = x25_destroy_timer;
-		add_timer(&sk->sk_timer);
+		timer_add(&sk->sk_timer);
 	} else {
 		/* drop last reference so sock_put will free */
 		__sock_put(sk);
diff --git a/samples/ftrace/sample-trace-array.c b/samples/ftrace/sample-trace-array.c
index dac67c367457..0e0e0628cead 100644
--- a/samples/ftrace/sample-trace-array.c
+++ b/samples/ftrace/sample-trace-array.c
@@ -76,7 +76,7 @@ static int simple_thread(void *arg)
 	 * delay seconds.
 	 *
 	 */
-	add_timer(&mytimer);
+	timer_add(&mytimer);
 	mod_timer(&mytimer, jiffies+delay);
 
 	while (!kthread_should_stop())
diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 0fcb416c26cb..3fba8f3a90ec 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -892,7 +892,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 	}
 
 	if (!card->hpi->interrupt_mode && dpcm->respawn_timer)
-		add_timer(&dpcm->timer);
+		timer_add(&dpcm->timer);
 }
 
 static void snd_card_asihpi_isr(struct hpi_adapter *a)
-- 
2.45.2

