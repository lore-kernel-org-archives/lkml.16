Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D3946C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751836830; cv=none; b=raRFhijw8kc6cr6Q5ZquCNmikz61Odhq0OtyAyxoCrva8ougMt1faKQPo1KyO/b3Ys3SDvJQh7Y3bxGiYmybaK/FP94TYTctztfviCLiRGeu5cKm7cXdehukUI+V2BbxCZhc7i1krgGnWcrmKGJP1SkE67YEJgiYDdBILx553UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751836830; c=relaxed/simple;
	bh=napj6E180cT+wfRifgYCvoWBs98B3EgIgamBrPZWTdQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mxXnSnsEgHcd1ZeHbarof/2LiJAn2qMaE6nVBaYLPVq60z3Jbuu5ichNamjZR5kNlrb7JkJrRyvCPZVjh+ocZkqDM2Nieh1ZGVUmGi32DgP1HBnRalCUgT/Es3lMjQiQod1jVKQ6iZjjLwpk14JXeFz49AAi01WpLikV/eluBoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bO2TeF47; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bO2TeF47"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae3a604b43bso386182566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751836825; x=1752441625; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bR8OBhPGXjNAOiPV8+pK0BFQZ1GF/HvySQnQL86Mfb4=;
        b=bO2TeF47RGV+lK40XxESCbp0c2uRsWXZU9Q0AfzeMZGPXLXBmWeIjzMG7QMhiIOrpI
         5NfJ0Lk9N696qeL3b5Nn/ejbGIZ1CXPSgENqmYTj6zkcszeVNtAyw1XzVmvl5NqEh/xL
         NGF68e74ktPWQF5KjjcxK72MFAFGxc9a0Hlmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751836825; x=1752441625;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR8OBhPGXjNAOiPV8+pK0BFQZ1GF/HvySQnQL86Mfb4=;
        b=AVLVc0HtXK02d9KF+Z8Z4Sre87H/eWhBPMCVlyfu0ajW0vNhkdRwy66W4NvgVA1NI/
         0rrgjkA4uIJAaXYtvIeh7+llLZRxRIR9QJSSVTtFwiKOiMvPlW6tRg3ZKP/YETJKIO15
         5k4VGwgS17Bd1PPLzlyalAT1fd79d5RsHxeOyZxw11McggXL+flb59cK5bHb3wJvfNLs
         fdwceYCs/XiXd/TEJ/txxd0xviR0mDBgIYx23YhgfD+9+kWOAIg6scPtuw9fkzsrm28l
         pzBANdysXAXAd1SgNRHIta4sxoiL7gheY7FXlO9IkDcDs/02dJhG+MG6Gm6pW2LVTWtw
         FJQA==
X-Gm-Message-State: AOJu0YzYC5gmJWqoLAepSa9vj6HSGt6EmPAT9fJ8HhtOdEjwn7gQfTOP
	nc3oSRr6M0cutUWW0L/3xeh1EwVMyL5nh6reYlgZMIJ/ZniREUVmCabUcfR1ZxG+69BA6jAc98e
	HWrwP5Iw=
X-Gm-Gg: ASbGncsEyV8qzT6lePeYpgiEQS0TtOsiuMRAlLfVbchxIss5sTf0BgnKrFc+36ApHae
	UGzgfGuQbWaCgNE3TCfFytXzrYLF3nduqQbVHkEVGX2ELRE45HYvzLaHQZpgRJ5Ea7qYpjHHuAF
	fBl2kev0A+PYu4P69I8iFLKfmklErtOYDTE/FtWdrp3WH8tRj0y+1BQCZaWh/3ZVa5mIQDXkv4e
	segRyLIV3JrHtTFEbTl/8qbDd7lZOa2r/S9f9TGMwx9+SdrSmdG0hJD3bRijT+Tvwe1QiaBf8Vk
	FwYpwXnpJqPT1415byJ5hUHkwTezt2+NW84cvkiJtjd1e9A0SD/CdiuiR4cDMAWs68PX5ic8lt/
	N5FV4Q7r2sF38hs5DgW3D5E3TcPyV/eSa7paB
X-Google-Smtp-Source: AGHT+IFzk/pZoswTswClv1sqY3e+tjmukOOy7dyFK1IEnZC9GvzhI/VVtX4KWOjuxl6gmNH/hk7SSg==
X-Received: by 2002:a17:907:1c27:b0:ad2:425c:27ce with SMTP id a640c23a62f3a-ae3fbc33710mr956914366b.2.1751836824349;
        Sun, 06 Jul 2025 14:20:24 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae410916ee7sm347490566b.15.2025.07.06.14.20.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 14:20:23 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso3852540a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 14:20:23 -0700 (PDT)
X-Received: by 2002:a05:6402:4413:b0:607:f55d:7c56 with SMTP id
 4fb4d7f45d1cf-60fd3492703mr8622405a12.25.1751836822328; Sun, 06 Jul 2025
 14:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Jul 2025 14:20:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjaAJX1zbHhiG3UWOgqauAwPZGbOv+_f64oUPAgS7Acvg@mail.gmail.com>
X-Gm-Features: Ac12FXxbMdWXtnoH1uLccYOhKPxSkFiHUna4fGXUxF9KUh0QE1wPiC12rZ25mSY
Message-ID: <CAHk-=wjaAJX1zbHhiG3UWOgqauAwPZGbOv+_f64oUPAgS7Acvg@mail.gmail.com>
Subject: Linux 6.16-rc5
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Absolutely nothing in here looks all that odd. The bulk of the changes
are to drivers, with all the usual suspects (ie gpu and networking
tends to be the most noticeable, but we've got usb, rtc, platform
drivers etc too).

And there's various filesystem fixes in here too, with several
filesystems having sent updates last week. Not that any of them are
particularly large, but there's just several filesystems that all
decided to send in their fixes last week: xfs, btrfs, smb and nfs
clients, bcachefs and netfs).

Other than that it's the usual random sprinkling of fixes.

Please keep testing, but this all feels fairly regular for this phase
of the release,

             Linus

---

Ahmed Zaki (1):
      idpf: convert control queue mutex to a spinlock

Al Viro (1):
      fix proc_sys_compare() handling of in-lookup dentries

Alan Huang (1):
      bcachefs: Fix incorrect transaction restart handling

Alessandro Carminati (1):
      regulator: core: fix NULL dereference on unbind due to stale coupling=
 data

Alex Deucher (2):
      drm/amdgpu/sdma5.x: suspend KFD queues in ring reset
      drm/amdkfd: add hqd_sdma_get_doorbell callbacks for gfx7/8

Alok Tiwari (6):
      platform/mellanox: mlxbf-pmc: Fix duplicate event ID for CACHE_DATA1
      platform/mellanox: Fix spelling and comment clarity in Mellanox drive=
rs
      platform/mellanox: nvsw-sn2201: Fix bus number in adapter error messa=
ge
      nvme: Fix incorrect cdw15 value in passthru error logging
      platform/mellanox: mlxreg-lc: Fix logic error in power state check
      enic: fix incorrect MTU comparison in enic_change_mtu()

Andrei Kuchynski (1):
      usb: typec: displayport: Fix potential deadlock

Andr=C3=A9 Draszik (7):
      rtc: s5m: cache device type during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with
regmap helpers

Andy Shevchenko (1):
      Input: alps - use scnprintf() to suppress truncation warning

Antoine Tenart (1):
      net: ipv4: fix stat increase when udp early demux drops the packet

Armin Wolf (2):
      platform/x86: wmi: Fix WMI event enablement
      platform/x86: wmi: Update documentation of WCxx/WExx ACPI methods

Arnd Bergmann (2):
      RDMA/mlx5: reduce stack usage in mlx5_ib_ufile_hw_cleanup
      mfd: Fix building without CONFIG_OF

Avri Altman (1):
      mmc: core: sd: Apply BROKEN_SD_DISCARD quirk earlier

Bart Van Assche (1):
      scsi: ufs: core: Fix spelling of a sysfs attribute name

Benjamin Coddington (1):
      NFSv4/pNFS: Fix a race to wake on NFS_LAYOUT_DRAIN

Bharadwaj Raju (1):
      bcachefs: mark invalid_btree_id autofix

Bui Quang Minh (4):
      virtio-net: ensure the received length does not exceed allocated size
      virtio-net: remove redundant truesize check with PAGE_SIZE
      virtio-net: use the check_mergeable_len helper
      virtio-net: xsk: rx: fix the frame's length check

Casey Connolly (1):
      arm64: defconfig: update renamed PHY_SNPS_EUSB2

Chen-Yu Tsai (1):
      dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18

Christian Brauner (1):
      anon_inode: rework assertions

Christian Eggers (4):
      Bluetooth: hci_sync: revert some mesh modifications
      Bluetooth: MGMT: set_mesh: update LE scan interval and window
      Bluetooth: MGMT: mesh_send: check instances prior disabling advertisi=
ng
      Bluetooth: HCI: Set extended advertising data synchronously

Christian K=C3=B6nig (2):
      dma-buf: fix timeout handling in dma_resv_wait_timeout v2
      drm/ttm: fix error handling in ttm_buffer_object_transfer

Christoph Hellwig (6):
      xfs: check for shutdown before going to sleep in xfs_select_zone
      xfs: remove NULL pointer checks in xfs_mru_cache_insert
      xfs: use xfs_readonly_buftarg in xfs_remount_rw
      xfs: move xfs_submit_zoned_bio a bit
      scsi: RDMA/srp: Don't set a max_segment_size when
virt_boundary_mask is set
      scsi: core: Enforce unlimited max_segment_size when
virt_boundary_mask is set

Conor Dooley (1):
      i2c: microchip-core: re-fix fake detections w/ i2cdetect

Dan Carpenter (3):
      mmc: sdhci-of-k1: Fix error code in probe()
      drm/i915/selftests: Change mock_request() to return error pointers
      lib: test_objagg: Set error message in check_expect_hints_stats()

Daniele Ceraolo Spurio (1):
      drm/xe: Extend WA 14018094691 to BMG

Darrick J. Wong (1):
      xfs: actually use the xfs_growfs_check_rtgeom tracepoint

Dave Chinner (7):
      xfs: xfs_ifree_cluster vs xfs_iflush_shutdown_abort deadlock
      xfs: catch stale AGF/AGF metadata
      xfs: avoid dquot buffer pin deadlock
      xfs: add tracepoints for stale pinned inode state debug
      xfs: rearrange code in xfs_buf_item.c
      xfs: factor out stale buffer item completion
      xfs: fix unmount hang with unflushable inodes stuck in the AIL

David Howells (9):
      netfs: Fix hang due to missing case in final DIO read result collecti=
on
      netfs: Fix double put of request
      netfs: Provide helpers to perform NETFS_RREQ_IN_PROGRESS flag wanglin=
g
      netfs: Fix looping in wait functions
      netfs: Fix ref leak on inserted extra subreq in write retry
      netfs: Fix i_size updating
      netfs: Merge i_size update functions
      netfs: Renumber the NETFS_RREQ_* flags to make traces easier to read
      netfs: Update tracepoints in a number of ways

David Thompson (1):
      platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment

David Yat Sin (1):
      amdkfd: MTYPE_UC for ext-coherent system memory

Dmitry Baryshkov (2):
      drm/bridge: panel: move prepare_prev_first handling to
drm_panel_bridge_add_typed
      drm/bridge: aux-hpd-bridge: fix assignment of the of_node

Dmitry Bogdanov (1):
      nvmet: fix memory leak of bio integrity

Dmitry Torokhov (4):
      Input: atkbd - switch to use scnprintf() to suppress truncation warni=
ng
      Input: alps - switch to use scnprintf() to suppress truncation warnin=
g
      Input: lifebook - switch to use scnprintf() to suppress truncation wa=
rning
      Input: psmouse - switch to use scnprintf() to suppress truncation war=
ning

Elena Popa (1):
      rtc: pcf2127: fix SPI command byte for PCF2131

Eugen Hristev (1):
      nvme-pci: refresh visible attrs after being checked

Filipe Manana (7):
      btrfs: fix failure to rebuild free space tree using multiple transact=
ions
      btrfs: fix missing error handling when searching for inode refs
during log replay
      btrfs: fix iteration of extrefs during log replay
      btrfs: fix inode lookup error handling during log replay
      btrfs: record new subvolume in parent dir earlier to avoid dir
logging races
      btrfs: propagate last_unlink_trans earlier when doing a rmdir
      btrfs: use btrfs_record_snapshot_destroy() during rmdir

Fushuai Wang (1):
      dpaa2-eth: fix xdp_rxq_info leak

Gabor Juhos (2):
      spi: spi-qpic-snand: reallocate BAM transactions
      mtd: nand: qpic_common: prevent out of bounds access of BAM arrays

Geliang Tang (1):
      nvme-multipath: fix suspicious RCU usage warning

Hans de Goede (1):
      drm/i915/dsi: Fix NULL pointer deref in vlv_dphy_param_init()

Harold Sun (1):
      drm/amd/display: Added case for when RR equals panel's max RR
using freesync

Harry Austen (1):
      drm/xe: Allow dropping kunit dependency as built-in

HarshaVardhana S A (1):
      vsock/vmci: Clear the vmci transport packet properly when initializin=
g it

Heikki Krogerus (1):
      usb: acpi: fix device link removal

Heiko Carstens (1):
      objtool: Add missing endian conversion to read_annotate()

Hongyu Xie (1):
      xhci: Disable stream for xHC controller with XHCI_BROKEN_STREAMS

Hugo Villeneuve (1):
      rtc: pcf2127: add missing semicolon after statement

Ivan Hu (1):
      platform/x86: portwell-ec: Move watchdog device under correct
platform hierarchy

JP Kobryn (1):
      x86/mce: Make sure CMCI banks are cleared during shutdown on Intel

Jakub Kicinski (1):
      docs: netdev: correct the heading level for co-posting selftests

James Clark (1):
      spi: spi-fsl-dspi: Clear completion counter before initiating transfe=
r

Jan Karcher (1):
      MAINTAINERS: update smc section

Janne Grunau (1):
      arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename

Janusz Krzysztofik (1):
      drm/i915/gt: Fix timeline left held on VMA alloc error

Jeff LaBundy (2):
      Input: iqs626a - replace snprintf() with scnprintf()
      Input: iqs7222 - explicitly define number of external channels

Jens Axboe (1):
      io_uring: gate REQ_F_ISREG on !S_ANON_INODE as well

Jens Wiklander (1):
      optee: ffa: fix sleep in atomic context

Jia Yao (1):
      drm/xe: Fix out-of-bounds field write in MI_STORE_DATA_IMM

Jiawen Wu (5):
      net: txgbe: fix the issue of TX failure
      net: libwx: fix the incorrect display of the queue number
      net: txgbe: request MISC IRQ in ndo_open
      net: wangxun: revert the adjustment of the IRQ vector sequence
      net: ngbe: specify IRQ vector when the number of VFs is 7

Jisheng Zhang (2):
      regulator: sy8824x: Fix ID table driver_data
      regulator: mp886x: Fix ID table driver_data

Joanne Koong (1):
      fuse: fix fuse_fill_write_pages() upper bound calculation

Junxiao Chang (1):
      drm/i915/gsc: mei interrupt top half should be in irq disabled contex=
t

Kaustabh Chakraborty (1):
      drm/exynos: exynos7_drm_decon: add vblank check in IRQ handling

Kent Overstreet (3):
      bcachefs: fix btree_trans_peek_prev_journal()
      bcachefs: Work around deadlock to btree node rewrites in journal repl=
ay
      bcachefs: opts.casefold_disabled

Kent Russell (1):
      drm/amdgpu: Include sdma_4_4_4.bin

Khairul Anuar Romli (1):
      spi: cadence-quadspi: fix cleanup of rx_chan on failure paths

Kohei Enju (1):
      rose: fix dangling neighbour pointers in rose_rt_device_down()

Krzysztof Kozlowski (3):
      Input: Fully open-code compatible for grepping
      dt-bindings: i2c: realtek,rtl9301: Fix missing 'reg' constraint
      dt-bindings: net: sophgo,sg2044-dwmac: Drop status from the example

Kuen-Han Tsai (3):
      usb: dwc3: Abort suspend on soft disconnect failure
      Revert "usb: gadget: u_serial: Add null pointer check in gs_start_io"
      usb: gadget: u_serial: Fix race condition in TTY wakeup

Kuniyuki Iwashima (1):
      nfs: Clean up /proc/net/rpc/nfs when nfs_fs_proc_net_init() fails.

Kurt Borja (7):
      platform/x86: dell-wmi-sysman: Fix WMI data block retrieval in
sysfs callbacks
      platform/x86: hp-bioscfg: Fix class device unregistration
      platform/x86: think-lmi: Fix class device unregistration
      platform/x86: dell-wmi-sysman: Fix class device unregistration
      platform/x86: think-lmi: Create ksets consecutively
      platform/x86: think-lmi: Fix kobject cleanup
      platform/x86: think-lmi: Fix sysfs group cleanup

Laurent Vivier (3):
      virtio_ring: Fix error reporting in virtqueue_resize
      virtio_net: Cleanup '2+MAX_SKB_FRAGS'
      virtio_net: Enforce minimum TX ring size for reliability

Leonard Dizon (1):
      HID: elecom: add support for ELECOM HUGE 019B variant

Lin.Cao (1):
      drm/amdgpu: Fix memory leak in amdgpu_ctx_mgr_entity_fini

Linus Torvalds (1):
      Linux 6.16-rc5

Lion Ackermann (1):
      net/sched: Always pass notifications when child class becomes empty

Lu Baolu (1):
      iommu/vt-d: Assign devtlb cache tag on ATS enablement

Lucas De Marchi (4):
      drm/xe/guc_pc: Add _locked variant for min/max freq
      drm/xe/xe_guc_pc: Lock once to update stashed frequencies
      drm/xe: Split xe_device_td_flush()
      drm/xe: Fix kconfig prompt

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb

Luo Gengkun (1):
      perf/core: Fix the WARN_ON_ONCE is out of lock protected region

Manivannan Sadhasivam (1):
      regulator: gpio: Fix the out-of-bounds access to drvdata::gpiods

Maor Gottlieb (1):
      RDMA/core: Rate limit GID cache warning messages

Marc Kleine-Budde (1):
      spi: Raise limit on number of chip selects to 24

Marek Szyprowski (1):
      drm/exynos: fimd: Guard display clock control with runtime PM calls

Mario Limonciello (6):
      PM: Restrict swap use to later in the suspend sequence
      Input: xpad - adjust error handling for disconnect
      Input: xpad - return errors from xpad_try_sending_next_out_packet() u=
p
      Move FCH header to a location accessible by all archs
      i2c: Re-enable piix4 driver on non-x86
      drm/amd/display: Don't allow OLED to go down to fully off

Mark Bloch (1):
      MAINTAINERS: Add myself as mlx5 core and mlx5e co-maintainer

Mark Pearson (1):
      platform/x86: thinkpad_acpi: handle HKEY 0x1402 event

Mark Zhang (1):
      RDMA/mlx5: Initialize obj_event->obj_sub_list before xa_insert

Marko Kiiskila (1):
      drm/vmwgfx: Fix guests running with TDX/SEV

Markus Elfring (1):
      xfs: Improve error handling in xfs_mru_cache_create()

Markus Koch (1):
      Input: fsia6b - suppress buffer truncation warning for phys

Masami Hiramatsu (Google) (2):
      mtk-sd: Fix a pagefault in dma_unmap_sg() for not prepared data
      mtk-sd: Prevent memory corruption from DMA map failure

Mateusz Jo=C5=84czyk (1):
      rtc: cmos: use spin_lock_irqsave in cmos_interrupt

Mathias Nyman (4):
      usb: hub: fix detection of high tier USB3 devices behind suspended hu=
bs
      usb: hub: Fix flushing and scheduling of delayed work that tunes
runtime pm
      xhci: dbc: Flush queued requests before stopping dbc
      usb: hub: Fix flushing of delayed work used for post resume purposes

Matthew Brost (3):
      drm/xe: Make WA BB part of LRC BO
      drm/sched: Increment job count before swapping tail spsc queue
      drm/xe: Do not wedge device on killed exec queues

Maxime Ripard (5):
      drm/mipi-dsi: Add dev_is_mipi_dsi function
      drm/panel: panel-simple: make panel_dpi_probe return a panel_desc
      drm/panel: panel-simple: Make panel_simple_probe return its panel
      drm/panel: panel-simple: Add function to look panel data up
      drm/panel: panel-simple: get rid of panel_dpi hack

Ma=C3=ADra Canal (1):
      drm/v3d: Disable interrupts before resetting the GPU

Michael J. Ruhl (1):
      i2c/designware: Fix an initialization issue

Michal Swiatkowski (1):
      idpf: return 0 size for RSS key if not supported

Ming Lei (1):
      ublk: don't queue request if the associated uring_cmd is canceled

Nam Cao (3):
      selftests/coredump: Fix "socket_detect_userspace_client" test failure
      irqchip/irq-msi-lib: Select CONFIG_GENERIC_MSI_IRQ
      eventpoll: Fix priority inversion problem

Nathan Chancellor (1):
      riscv: Require clang-17 or newer for kCFI

Nicolin Chen (4):
      iommufd/selftest: Fix iommufd_dirty_tracking with large hugepage size=
s
      iommufd/selftest: Add missing close(mfd) in memfd_mmap()
      iommufd/selftest: Add asserts testing global mfd
      iommufd/selftest: Fix build warnings due to uninitialized mfd

Nikhil Jha (1):
      sunrpc: fix loop in gss seqno cache

Niklas Schnelle (3):
      s390/pci: Fix stale function handles in error handling
      s390/pci: Do not try re-enabling load/store if device is disabled
      s390/pci: Allow automatic recovery with minimal driver support

Nikunj A Dadhania (1):
      x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation

Nilay Shroff (1):
      nvme: correctly account for namespace head reference counter

Nilton Perim Neto (1):
      Input: xpad - support Acer NGR 200 Controller

Oleksij Rempel (1):
      net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect

Oliver Neukum (1):
      Logitech C-270 even more broken

Or Har-Toov (3):
      RDMA/mlx5: Fix unsafe xarray access in implicit ODP handling
      IB/mlx5: Fix potential deadlock in MR deregistration
      IB/core: Annotate umem_mutex acquisition under fs_reclaim for lockdep

Patrisious Haddad (3):
      RDMA/mlx5: Fix HW counters query for non-representor devices
      RDMA/mlx5: Fix CC counters query for MPV
      RDMA/mlx5: Fix vport loopback for MPV device

Paul Menzel (1):
      platform/x86: dell-lis3lv02d: Add Latitude 5500

Paulo Alcantara (5):
      smb: client: fix warning when reconnecting channel
      smb: client: set missing retry flag in smb2_writev_callback()
      smb: client: set missing retry flag in cifs_readv_callback()
      smb: client: set missing retry flag in cifs_writev_callback()
      smb: client: fix native SMB symlink traversal

Pawel Laszczak (1):
      usb: cdnsp: Fix issue with CV Bad Descriptor test

Peter Chen (1):
      usb: cdnsp: do not disable slot for disabled slot

Peter Zijlstra (2):
      sched/core: Fix migrate_swap() vs. hotplug
      perf: Revert to requiring CAP_SYS_ADMIN for uprobes

Philip Yang (1):
      drm/amdkfd: Don't call mmput from MMU notifier callback

Philipp Kerling (1):
      smb: client: fix readdir returning wrong type with POSIX extensions

Pratap Nirujogi (1):
      platform/x86: Update swnode graph for amd isp4

Qasim Ijaz (2):
      HID: appletb-kbd: fix memory corruption of input_handler_list
      HID: appletb-kbd: fix slab use-after-free bug in appletb_kbd_probe

RD Babiera (2):
      usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
      usb: typec: altmodes/displayport: do not index invalid pin_assignment=
s

Rafael J. Wysocki (1):
      Revert "ACPI: battery: negate current when discharging"

Rahul Chandra (1):
      platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8406C=
A

Raju Rangoju (3):
      usb: xhci: quirk for data loss in ISOC transfers
      amd-xgbe: align CL37 AN sequence as per databook
      amd-xgbe: do not double read link status

Roy Luo (2):
      usb: xhci: Skip xhci_reset in xhci_resume if xhci is being removed
      Revert "usb: xhci: Implement xhci_handshake_check_state() helper"

SCHNEIDER Johannes (1):
      usb: dwc3: gadget: Fix TRB reclaim logic for short transfers and ZLPs

Sebastian Andrzej Siewior (1):
      futex: Temporary disable FUTEX_PRIVATE_HASH

Sergey Senozhatsky (1):
      mtk-sd: reset host->mrq on prepare_data() error

Shiju Jose (1):
      EDAC: Initialize EDAC features sysfs attributes

Shivank Garg (1):
      fs: export anon_inode_make_secure_inode() and fix secretmem LSM bypas=
s

Shree Ramamoorthy (1):
      regulator: tps65219: Fix devm_kmalloc size allocation

Shyam Prasad N (1):
      cifs: all initializations for tcon should happen in tcon_info_alloc

Simon Xue (1):
      iommu/rockchip: prevent iommus dead loop when two masters share one I=
OMMU

Srinivas Pandruvada (1):
      platform/x86/intel/hid: Add Wildcat Lake support

Sudeep Holla (3):
      firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      firmware: arm_ffa: Move memory allocation outside the mutex locking
      firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in
atomic context

Sumanth Gavini (1):
      PM: sleep: docs: Replace "diasble" with "disable"

Sven Peter (3):
      arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      arm64: dts: apple: Move touchbar mipi {address,size}-cells from
dtsi to dts
      Input: apple_z2 - drop default ARCH_APPLE in Kconfig

Terry Tritton (1):
      selftests/futex: Add futex_numa to .gitignore

Thomas Fourier (4):
      scsi: qla2xxx: Fix DMA mapping test in qla24xx_get_port_database()
      scsi: qla4xxx: Fix missing DMA mapping error in qla4xxx_alloc_pdu()
      ethernet: atl1: Add missing DMA mapping error checks and count errors
      nui: Fix dma_mapping_error() check

Thomas Wei=C3=9Fschuh (3):
      drm/exynos: Don't use %pK through printk
      drm/bridge: samsung-dsim: Don't use %pK through printk
      sched: Fix preemption string of preempt_dynamic_none

Thomas Zimmermann (2):
      drm/vesadrm: Avoid NULL-ptr deref in vesadrm_pmi_cmap_write()
      drm/gem: Acquire references on GEM handles for framebuffers

Trond Myklebust (1):
      NFSv4/flexfiles: Fix handling of NFS level errors in I/O

Tudor Ambarus (1):
      firmware: exynos-acpm: fix timeouts on xfers handling

Ulf Hansson (1):
      Revert "mmc: sdhci: Disable SD card clock before changing parameters"

Ulrich Weber (1):
      doc: tls: socket needs to be established to enable ulp

Vicki Pfau (1):
      HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP, BTN_WHEEL

Victor Shih (3):
      mmc: core: Adjust some error messages for SD UHS-II cards
      mmc: sdhci: Add a helper function for dump register in dynamic debug =
mode
      mmc: sdhci-uhs2: Adjust some error messages and register dump
for SD UHS-II card

Vinay Belgaumkar (2):
      drm/xe/bmg: Update Wa_14022085890
      drm/xe/bmg: Update Wa_22019338487

Viresh Kumar (1):
      firmware: arm_ffa: Fix the missing entry in struct ffa_indirect_msg_h=
dr

Vitaly Lifshits (1):
      igc: disable L1.2 PCI-E link substate to avoid performance issue

Vivian Wang (1):
      riscv: cpu_ops_sbi: Use static array for boot_data

Wang Zhaolong (1):
      smb: client: fix race condition in negotiate timeout by using
more precise timing

Xu Yang (1):
      usb: chipidea: udc: disconnect/reconnect from host when do suspend/re=
sume

Yang Li (1):
      Bluetooth: Prevent unintended pause by checking if advertising is act=
ive

Yazen Ghannam (4):
      x86/mce: Don't remove sysfs if thresholding sysfs init fails
      x86/mce: Ensure user polling settings are honored when restarting tim=
er
      x86/mce/amd: Add default names for MCA banks and blocks
      x86/mce/amd: Fix threshold limit reset

Youling Tang (1):
      xfs: add FALLOC_FL_ALLOCATE_RANGE to supported flags mask

Yu Kuai (1):
      brd: fix sleeping function called from invalid context in
brd_insert_page()

Yunshui Jiang (1):
      Input: cs40l50-vibra - fix potential NULL dereference in
cs40l50_upload_owt()

Zhang Rui (1):
      powercap: intel_rapl: Do not change CLAMPING bit if ENABLE bit
cannot be changed

jackysliu (1):
      scsi: sd: Fix VPD page 0xb7 length check

kuyo chang (1):
      sched/deadline: Fix dl_server runtime calculation formula

=C5=81ukasz Bartosik (1):
      xhci: dbctty: disable ECHO flag by default
