Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6E156CA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745795817; cv=none; b=knx/z9clvmObaqPXmBFczNfA/72yxHV05olbEtNROF3UbcPZNr0NdXRssMLZKhzCkoYERnj0a7mat6WWAx9qI565FY9X9Im9HLszY9K6ORpxHi8OHm4hOzxhWYLJ3wovT5pcMxJswitmuv/QWW1b9Ctchhr6GBqy7Ic7P6yFyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745795817; c=relaxed/simple;
	bh=2ab6Fx4FbTOjkzEnvZ4LGsxyky34KfMaaHcwErNjIwc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mXWlDx4djtt45ft1D8D7zeerO6WBZaTFEtJqyR98XeSXC6b7aWBiEI3YdHmghK3ayFzr+ajGkXdx5yJ+6+mlFP7DmxPtySfeGeBYzUy4xngCUMPL56AH3s0ryJMJLxzPxXo+sKOaxMWCGKzQXiKTNBOqFg86HnqYRuRr1dCbShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WluyR5xp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WluyR5xp"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac34257295dso707677566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745795811; x=1746400611; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7quDKUxZoAitH1KANYE7D4DNnts8Iux3P1cVAGHDiMc=;
        b=WluyR5xp96tC5V4EO9Jpvm0IEcBvYbH7SdcQ5MiULKMNyrXBnEELdRU2a0FoPoxAuK
         LW5mvkjsvoSe17+5FbDUv4r9uSOXAss/urJtvkBMkmBbjmfnz29tqOJRT5yRl/3bwRwc
         oB/zDj9Fy3vIEeEcUm0oeiST/LX0+1gknWcJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745795811; x=1746400611;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quDKUxZoAitH1KANYE7D4DNnts8Iux3P1cVAGHDiMc=;
        b=W8Zt90OUoEaXODs/78nBj/h6xJy8/3L0hoeKupBTcLZyDweSpA6zwsgG+3xe1OLP9E
         C9KfK87+qWTDXYLEqao49a2+aXV4W3Id5czDZhhOznPNyRLPro1SqM37Fkw/+2iOfeNF
         l2/PGSLUpuv91bqXtasihorSpiMlIe/cH/ZpiAYNmK+Qu/0FcwiSbItC+OQHFTWRGpRk
         NYypJNh1WR6L2V6aCx/AH4B2FZOBMWJXktl09j+v+O81FqDFwOAxr3QP6YpyUCfIqi+Q
         MtLj9n+NCAmmgM5EiGcIlRQ2A1X7qF1csgbvpUJ+TmbUX7IIijX3QXVndqBUrXtGFHGS
         qFlA==
X-Gm-Message-State: AOJu0YwjJ+riDtyyI3TuPxlXLYuP4wtJkFxBYTmUapczywDwO3RrpS1o
	bTxGaheN4i2eD9hC9xtaahUR1md5fkIC3J5TrobB01wY804lftMIcHWAoW7k+1JVnnMExBP7OEU
	dtL0=
X-Gm-Gg: ASbGncuHjmwHuYefAicwCfzGCtTzqNFyq71nv8Ba95o9N4rYXbfTK2gGHIywxKjb47A
	yfHVIIl/LGseMQC72K9x5gDZL+hn/HD7Fi1earC0DUlVOoFE43QP5ZyQ9nInaQ1D5dG+olzJfv0
	CufjPUkUa+KuzQ+ZyMcKnpzgEKMLodzkYRgfqU4mVlRDgton4A5chUEajhWc7z9zcSxM5XulnGL
	iF3lEt7z2P7R7mt0DKT8glIWtdvGeQJs6eZT105BR7mLJ8YEZcSBgBhXNHpFYmF5ohxW8NAv9d/
	ohBeqsRpITbxqEscNJvWYD2GccXvIK3ctUxS9erOOUuWqVopucNbqCSQJn8gxbk6casK6aiHE4V
	AxDl01Ua67wNXMbk=
X-Google-Smtp-Source: AGHT+IHNDK2kCZkaTG8abXOcVQO8jDGv8ORTDFSC8yBAY/63B3VM1t4r/cj2bSswWdo+nI7oH9NLjA==
X-Received: by 2002:a17:907:7fa1:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-ace710b1105mr876181966b.17.1745795811078;
        Sun, 27 Apr 2025 16:16:51 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm512891966b.36.2025.04.27.16.16.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 16:16:50 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso691446966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:16:50 -0700 (PDT)
X-Received: by 2002:a17:907:60d0:b0:aca:a1e2:8abc with SMTP id
 a640c23a62f3a-ace7104d6d4mr853507466b.12.1745795809607; Sun, 27 Apr 2025
 16:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Apr 2025 16:16:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8VMvbaq6EECWxP7OcrGtUmauFQCjeLT24pXh-H=o-4Q@mail.gmail.com>
X-Gm-Features: ATxdqUEPFGrkgBIwrgg3bEno-7IQMYGoceN-Pv8xp7tAJlV7TS-wGcU7__sE9_k
Message-ID: <CAHk-=wg8VMvbaq6EECWxP7OcrGtUmauFQCjeLT24pXh-H=o-4Q@mail.gmail.com>
Subject: Linux 6.15-rc4
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So let's see if this rc ends up avoiding any silly issues - things
certainly look pretty normal, and there were no hurried last-minute
changes this week due to system upgrades. And the locking mishap with
local_trylock reported by phoronix (which didn't trigger on all
compiler versions, so you saw it or not depending on what compiler you
used) also got sorted out.

In fact, we seem to have reached the point where much of the
discussion is about future changes. Which tends to be a good sign.

The rc4 diffstat looks pretty good - mostly flat with some (untimely,
but still fairly small) openrisc updates and bcachefs
case-insensitivity patches standing out. But the rest looks like just
a lot of tiny fixes.

And by "a lot" I don't even mean anything excessive - it's all very
normal for the rc4 timeframe.

Please do keep testing,

            Linus

---

Adam Xue (1):
      USB: serial: option: add Sierra Wireless EM9291

Adrian Hunter (2):
      KVM: x86: Do not use kvm_rip_read() unconditionally in KVM tracepoint=
s
      KVM: x86: Do not use kvm_rip_read() unconditionally for KVM_PROFILING

Akhil P Oommen (1):
      dt-bindings: nvmem: qfprom: Add X1E80100 compatible

Al Viro (1):
      fix a couple of races in MNT_TREE_BENEATH handling by do_move_mount()

Alexander Usyskin (1):
      mei: me: add panther lake H DID

Alexei Starovoitov (1):
      bpf: Add namespace to BPF internal symbols

Alexey Nepomnyashih (1):
      xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()

Alexis Lothore (1):
      net: stmmac: fix dwmac1000 ptp timestamp status offset

Alexis Lothor=C3=A9 (1):
      net: stmmac: fix multiplication overflow when reading timestamp

Anastasia Kovaleva (1):
      scsi: core: Clear flags for scsi_cmnd that did not complete

Andre Przywara (1):
      cpufreq: sun50i: prevent out-of-bounds access

Andrei Kuchynski (2):
      usb: typec: class: Fix NULL pointer access
      usb: typec: class: Invalidate USB device pointers on partner
unregistration

Andy Shevchenko (1):
      device property: Add a note to the fwnode.h

Anindya Sundar Gayen (1):
      drm/exynos: fixed a spelling error

Ard Biesheuvel (1):
      x86/boot: Work around broken busybox 'truncate' tool

Arnd Bergmann (1):
      dma/contiguous: avoid warning about unused size_bytes

Balbir Singh (2):
      dma/mapping.c: dev_dbg support for dma_addressing_limited
      dma-mapping: Fix warning reported for missing prototype

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      dt-bindings: nvmem: Add compatible for MS8937

Bibo Mao (2):
      LoongArch: KVM: Fully clear some CSRs when VM reboot
      LoongArch: KVM: Fix PMU pass-through issue if VM exits to host finall=
y

Bj=C3=B6rn T=C3=B6pel (2):
      riscv: Replace function-like macro by static inline function
      riscv: uprobes: Add missing fence.i after building the XOL buffer

Bo-Cun Chen (1):
      net: ethernet: mtk_eth_soc: net: revise NETSYSv3 hardware configurati=
on

Brandon Kammerdiener (2):
      bpf: fix possible endless loop in BPF map iteration
      selftests/bpf: add test for softlock when modifying hashmap
while iterating

Breno Leitao (1):
      sched_ext: Use kvzalloc for large exit_dump allocation

Brett Creeley (3):
      pds_core: Prevent possible adminq overflow/stuck condition
      pds_core: handle unsupported PDS_CORE_CMD_FW_CONTROL result
      pds_core: Remove unnecessary check in pds_client_adminq_cmd()

Brian Foster (4):
      bcachefs: drop duplicate fiemap sync flag
      bcachefs: track current fiemap offset in start variable
      bcachefs: refactor fiemap processing into extent helper and struct
      bcachefs: add fiemap delalloc extent detection

Bui Quang Minh (1):
      virtio-net: disable delayed refill when pausing rx

Carlos Llamas (1):
      binder: fix offset calculation in debug log

Carlos Maiolino (1):
      XFS: fix zoned gc threshold math for 32-bit arches

Chen-Yu Tsai (1):
      dma-coherent: Warn if OF reserved memory is beyond current
coherent DMA mask

Chenyuan Yang (2):
      scsi: ufs: mcq: Add NULL check in ufshcd_mcq_abort()
      scsi: ufs: core: Add NULL check in ufshcd_mcq_compl_pending_transfer(=
)

Christian Hewitt (1):
      Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Christian Schrefl (1):
      rust: firmware: Use `ffi::c_char` type in `FwFunc`

Christoph Hellwig (6):
      block: never reduce ra_pages in blk_apply_bdi_limits
      block: move blkdev_{get,put} _no_open prototypes out of blkdev.h
      block: remove the backing_inode variable in bdev_statx
      block: don't autoload drivers on stat
      block: don't autoload drivers on blk-cgroup configuration
      devtmpfs: don't use vfs_getattr_nosec to query i_mode

Chuck Lever (1):
      Revert "sunrpc: clean cache_detail immediately when flush is
written frequently"

Colin Ian King (1):
      drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"

Cong Wang (3):
      net_sched: hfsc: Fix a UAF vulnerability in class handling
      net_sched: hfsc: Fix a potential UAF in hfsc_dequeue() too
      selftests/tc-testing: Add test for HFSC queue emptying during
peek operation

Craig Hesling (1):
      USB: serial: simple: add OWON HDS200 series oscilloscope support

Damien Le Moal (4):
      ata: libata-scsi: Fix ata_mselect_control_ata_feature() return type
      ata: libata-scsi: Fix ata_msense_control_ata_feature()
      ata: libata-scsi: Improve CDL control
      scsi: Improve CDL control

Dan Carpenter (1):
      usb: typec: class: Unlocked on error in typec_register_partner()

Daniel Golle (1):
      net: dsa: mt7530: sync driver-specific behavior of MT7531 variants

Daniel Jurgens (1):
      virtio_pci: Use self group type for cap commands

Danilo Krummrich (1):
      MAINTAINERS: pci: add entry for Rust PCI code

Darrick J. Wong (2):
      block: fix race between set_blocksize and read paths
      block: hoist block size validation code to a separate function

Dave Jiang (1):
      cxl: Fix devm host device for CXL fwctl initialization

David Howells (1):
      ceph: Fix incorrect flush end position calculation

David Sterba (1):
      btrfs: tree-checker: adjust error code for header level check

Davidlohr Bueso (7):
      fs/buffer: split locking for pagecache lookups
      fs/buffer: introduce sleeping flavors for pagecache lookups
      fs/buffer: use sleeping version of __find_get_block()
      fs/ocfs2: use sleeping version of __find_get_block()
      fs/jbd2: use sleeping version of __find_get_block()
      fs/ext4: use sleeping version of sb_find_get_block()
      mm/migrate: fix sleep in atomic for large folios and buffer heads

Dmitry Baryshkov (5):
      dt-bindings: nvmem: fixed-cell: increase bits start value to 31
      nvmem: core: fix bit offsets of more than one byte
      nvmem: core: verify cell's raw_len
      nvmem: core: update raw_len if the bit reading is required
      nvmem: qfprom: switch to 4-byte aligned reads

Dmitry Bogdanov (1):
      scsi: target: iscsi: Fix timeout on deleted connection

Dmitry Torokhov (3):
      Revert "drivers: core: synchronize really_probe() and dev_uevent()"
      driver core: introduce device_set_driver() helper
      driver core: fix potential NULL pointer dereference in dev_uevent()

Dongli Zhang (3):
      vhost-scsi: protect vq->log_used with vq->mutex
      vhost-scsi: Fix vhost_scsi_send_bad_target()
      vhost-scsi: Fix vhost_scsi_send_status()

Dr. David Alan Gilbert (1):
      ceph: Remove osd_client deadcode

Fedor Pchelkin (3):
      usb: chipidea: ci_hdrc_imx: fix usbmisc handling
      usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
      usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling

Felix Kuehling (3):
      drm/amdgpu: Use allowed_domains for pinning dmabufs
      drm/amdgpu: Don't pin VRAM without DMABUF_MOVE_NOTIFY
      drm/amdgpu: Allow P2P access through XGMI

Filipe Manana (1):
      btrfs: fix invalid inode pointer after failure to create reloc inode

Fiona Klute (1):
      net: phy: microchip: force IRQ polling mode for lan88xx

Frederick Lawler (1):
      ima: process_measurement() needlessly takes inode_lock() on MAY_READ

Frode Isaksen (1):
      usb: dwc3: gadget: check that event count does not exceed event
buffer length

Gavin Shan (1):
      drivers/base/memory: Avoid overhead from for_each_present_section_nr(=
)

Geliang Tang (1):
      selftests: mptcp: diag: use mptcp_lib_get_info_value

George Shen (1):
      drm/amd/display: Use 16ms AUX read interval for LTTPR with old sinks

Gergo Koteles (1):
      drm/amd/display: do not copy invalid CRTC timing info

Greg Kroah-Hartman (1):
      MAINTAINERS: update the location of the driver-core git tree

Guoqing Jiang (1):
      drm/exynos: Remove unnecessary checking

G=C3=BCnther Noack (1):
      tty: Require CAP_SYS_ADMIN for all usages of TIOCL_SELMOUSEREPORT

Halil Pasic (1):
      virtio_console: fix missing byte order handling for cols and rows

Hans Holmberg (1):
      xfs: remove duplicate Zoned Filesystems sections in admin-guide

Hans de Goede (2):
      mei: vsc: Fix fortify-panic caused by invalid counted_by() use
      mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type

Haoran Jiang (1):
      samples/bpf: Fix compilation failure for samples/bpf on LoongArch Fed=
ora

Haoxiang Li (1):
      mcb: fix a double free bug in chameleon_parse_gdd()

Heikki Krogerus (1):
      MAINTAINERS: Assign maintainer for the port controller drivers

Heiko Stuebner (4):
      nvmem: rockchip-otp: Move read-offset into variant-data
      dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
      dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
      nvmem: rockchip-otp: add rk3576 variant data

Henry Martin (5):
      cpufreq: apple-soc: Fix null-ptr-deref in apple_soc_cpufreq_get_rate(=
)
      cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
      cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
      net/mlx5: Fix null-ptr-deref in mlx5_create_{inner_,}ttc_table()
      net/mlx5: Move ttc allocation after switch case to prevent leaks

Herbert Xu (2):
      Revert "crypto: testmgr - Add multibuffer acomp testing"
      crypto: scomp - Fix off-by-one bug when calculating last page

Huacai Chen (1):
      USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)

Hugo Villeneuve (1):
      drm: panel: jd9365da: fix reset signal polarity in unprepare

Ian Abbott (1):
      comedi: jr3_pci: Fix synchronous deletion of timer

Ihor Solodrai (1):
      selftests/bpf: Mitigate sockmap_ktls disconnect_after_delete failure

Ilpo J=C3=A4rvinen (2):
      PCI: Restore assigned resources fully after release
      selftests/pcie_bwctrl: Fix test progs list

Jakub Kicinski (1):
      net: fix the missing unlock for detached devices

Jan Kara (1):
      fs/xattr: Fix handling of AT_FDCWD in setxattrat(2) and getxattrat(2)

Jens Axboe (1):
      io_uring: fix 'sync' handling of io_fallback_tw()

Johan Hovold (1):
      cpufreq: fix compile-test defaults

Johannes Schneider (1):
      net: dp83822: Fix OF_MDIO config check

Johannes Thumshirn (1):
      btrfs: zoned: return EIO on RAID1 block group write pointer mismatch

Juergen Gross (1):
      x86/mm: Fix _pgd_alloc() for Xen PV mode

Justin Iurman (1):
      net: lwtunnel: disable BHs when required

Kent Overstreet (20):
      bcachefs: Fix early startup error path
      bcachefs: Fix null ptr deref in bch2_snapshot_tree_oldest_subvol()
      bcachefs: Error ratelimiting is no longer only during fsck
      bcachefs: Stricter checks on "key allowed in this btree"
      bcachefs: Ensure journal space is block size aligned
      bcachefs: Change __journal_entry_close() assert to ERO
      bcachefs: Fix ref leak in write_super()
      bcachefs: bch2_copygc_wakeup()
      bcachefs: Refactor bch2_run_recovery_passes()
      bcachefs: Start copygc, rebalance threads earlier
      bcachefs: Allocator now copes with unaligned buckets
      bcachefs: Implement fileattr_(get|set)
      bcachefs: Casefold is now a regular opts.h option
      bcachefs: Fix casefold lookups
      bcachefs: unlink: casefold d_invalidate
      bcachefs: Print mount opts earlier
      bcachefs: Unit test fixes
      bcachefs: Make btree_iter_peek_prev() assert more precise
      bcachefs: Fix btree_iter_peek_prev() at end of inode
      bcachefs: Rework fiemap transaction restart handling

Kirill A. Shutemov (1):
      x86/insn: Fix CTEST instruction decoding

Krzysztof Kozlowski (2):
      cpufreq: Do not enable by default during compile testing
      drm/exynos: exynos7_drm_decon: Consstify struct decon_data

Leo Li (1):
      drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF

Leon Romanovsky (2):
      drivers/base: Extend documentation with preferred way to use auxbus
      drivers/base: Add myself as auxiliary bus reviewer

Li Ming (4):
      cxl/core: Fix caching dport GPF DVSEC issue
      cxl/pci: Update Port GPF timeout only when the first EP attaching
      cxl/pci: Drop the parameter is_port of cxl_gpf_get_dvsec()
      cxl/feature: Update out_len in set feature failure case

Linus Torvalds (3):
      gcc-15: disable '-Wunterminated-string-initialization' entirely for n=
ow
      Fix mis-uses of 'cc-option' for warning disablement
      Linux 6.15-rc4

Lizhi Xu (1):
      software node: Prevent link creation failure from causing kobj
reference count imbalance

Lorenzo Stoakes (1):
      intel_th: avoid using deprecated page->mapping, index fields

Luo Gengkun (1):
      perf/x86: Fix non-sampling (counting) events on certain x86 platforms

Mahesh Rao (1):
      firmware: stratix10-svc: Add of_platform_default_populate()

Manish Pandey (2):
      scsi: ufs: qcom: Add quirks for Samsung UFS devices
      scsi: ufs: Introduce quirk to extend PA_HIBERN8TIME for UFS devices

Manivannan Sadhasivam (1):
      MAINTAINERS: Move Manivannan Sadhasivam as PCI Native host
bridge and endpoint maintainer

Marc Zyngier (2):
      cpufreq: cppc: Fix invalid return value in .get() callback
      arm64: Rework checks for broken Cavium HW in the PI code

Marek Beh=C3=BAn (1):
      crypto: atmel-sha204a - Set hwrng quality to lowest possible

Marek Szyprowski (1):
      dma-mapping: avoid potential unused data compilation warning

Mario Limonciello (1):
      drm/amd/display: Fix ACPI edid parsing on some Lenovo systems

Mark Brown (1):
      lib: Ensure prime numbers tests are included in KUnit test runs

Martin Blumenstingl (1):
      drm/meson: use unsigned long long / Hz for frequency types

Mat Martineau (1):
      mptcp: pm: Defer freeing of MPTCP userspace path manager entries

Mateusz Guzik (1):
      fs: fall back to file_ref_put() for non-last reference

Mathias Nyman (3):
      Revert "xhci: Avoid queuing redundant Stop Endpoint command for
stalled endpoint"
      Revert "xhci: Prevent early endpoint restart when handling STALL erro=
rs."
      xhci: Limit time spent with xHC interrupts disabled during bus resume

Maxime Chevallier (1):
      MAINTAINERS: Add entry for Socfpga DWMAC ethernet glue driver

Maximilian Immanuel Brandtner (1):
      virtio_console: fix order of fields cols and rows

Miao Li (2):
      usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
      usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive

Michael Ehrenreich (1):
      USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe

Michael S. Tsirkin (1):
      virtgpu: don't reset on shutdown

Michal Pecio (2):
      usb: xhci: Fix Short Packet handling rework ignoring errors
      usb: xhci: Fix invalid pointer dereference in Etron workaround

Micka=C3=ABl Sala=C3=BCn (7):
      landlock: Remove incorrect warning
      landlock: Log the TGID of the domain creator
      selftests/landlock: Factor out audit fixture in audit_test
      selftests/landlock: Add PID tests for audit records
      landlock: Fix documentation for landlock_create_ruleset(2)
      landlock: Fix documentation for landlock_restrict_self(2)
      landlock: Update log documentation

Mike Looijmans (1):
      usb: dwc3: xilinx: Prevent spike in reset signal

Mike Rapoport (Microsoft) (1):
      x86/e820: Discard high memory that can't be addressed by 32-bit syste=
ms

Ming Lei (4):
      selftests: ublk: fix recover test
      selftests: ublk: remove useless 'delay_us' from 'struct dev_ctx'
      ublk: call ublk_dispatch_req() for handling UBLK_U_IO_NEED_GET_DATA
      ublk: fix race between io_uring_cmd_complete_in_task and ublk_cancel_=
cmd

Ming Wang (1):
      LoongArch: Return NULL from huge_pte_offset() for invalid PMD

Namhyung Kim (1):
      perf/core: Change to POLLERR for pinned events with error

Naohiro Aota (2):
      block: introduce zone capacity helper
      btrfs: zoned: skip reporting zone for new block group

Nicholas Susanto (1):
      drm/amd/display: Enable urgent latency adjustment on DCN35

Niklas Cassel (1):
      misc: pci_endpoint_test: Defer IRQ allocation until
ioctl(PCITEST_SET_IRQTYPE)

Oleksij Rempel (1):
      net: selftests: initialize TCP header and skb payload with zero

Oliver Neukum (6):
      USB: storage: quirk for ADATA Portable HDD CH94
      USB: VLI disk crashes if LPM is used
      USB: wdm: handle IO errors in wdm_wwan_port_start
      USB: wdm: close race between wdm_open and wdm_wwan_port_stop
      USB: wdm: wdm_wwan_port_tx_complete mutex in atomic context
      USB: wdm: add annotation

Omar Sandoval (1):
      sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash

Paolo Bonzini (1):
      KVM: arm64, x86: make kvm_arch_has_irq_bypass() inline

Pavel Begunkov (1):
      io_uring: don't duplicate flushing in io_req_post_cqe

Peilin Ye (1):
      selftests/bpf: Correct typo in __clang_major__ macro

Pengyu Luo (1):
      cpufreq: Add SM8650 to cpufreq-dt-platdev blocklist

Petr Tesarik (1):
      LoongArch: Remove a bogus reference to ZONE_DMA

Qingfang Deng (1):
      net: phy: leds: fix memory leak

Qu Wenruo (3):
      btrfs: subpage: access correct object when reading bitmap start
in subpage_calc_start_bit()
      btrfs: avoid page_lockend underflow in btrfs_punch_hole_lock_range()
      btrfs: fix the ASSERT() inside GET_SUBPAGE_BITMAP()

Raag Jadav (1):
      pps: generators: tio: fix platform_set_drvdata()

Ralph Siemsen (1):
      usb: cdns3: Fix deadlock when using NCM gadget

Ranjan Kumar (3):
      scsi: mpi3mr: Fix pending I/O counter
      scsi: mpi3mr: Reset the pending interrupt flag
      scsi: mpi3mr: Add level check to control event logging

Rengarajan S (2):
      misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler
registration
      misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during a=
ck

Richard Weinberger (1):
      nvmet: fix out-of-bounds access in nvmet_enable_port

Roman Li (2):
      drm/amd/display: Fix gpu reset in multidisplay config
      drm/amd/display: Force full update in gpu reset

Rudraksha Gupta (1):
      dt-bindings: nvmem: Add compatible for MSM8960

Russell King (Oracle) (2):
      net: phylink: fix suspend/resume with WoL enabled and link down
      net: phylink: mac_link_(up|down)() clarifications

Ryo Takakura (1):
      serial: sifive: lock port in startup()/shutdown() callbacks

Sahil Siddiq (3):
      openrisc: Refactor struct cpuinfo_or1k to reduce duplication
      openrisc: Introduce new utility functions to flush and invalidate cac=
hes
      openrisc: Add cacheinfo support

Sean Christopherson (8):
      KVM: SVM: Don't update IRTEs if APICv/AVIC is disabled
      KVM: SVM: Allocate IR data using atomic allocation
      KVM: x86: Reset IRTE to host control if *new* route isn't postable
      KVM: x86: Explicitly treat routing entry type changes as changes
      KVM: x86: Take irqfds.lock when adding/deleting IRQ bypass producer
      iommu/amd: Return an error if vCPU affinity is set for non-vCPU IRTE
      iommu/amd: WARN if KVM attempts to set vCPU affinity without
posted intrrupts
      KVM: SVM: WARN if an invalid posted interrupt IRTE entry is added

Shannon Nelson (1):
      pds_core: make wait_context part of q_info

Simon Horman (2):
      MAINTAINERS: Add ism.h to S390 NETWORKING DRIVERS
      MAINTAINERS: Add s390 networking drivers to NETWORKING DRIVERS

Smita Koralahalli (1):
      cxl/core/regs.c: Skip Memory Space Enable check for RCD and RCH Ports

Sricharan Ramabadhran (1):
      dt-bindings: nvmem: Add compatible for IPQ5018

Stafford Horne (2):
      Documentation: openrisc: Update mailing list
      Documentation: openrisc: Update toolchain binaries URL

Stefano Garzarella (2):
      vhost: fix VHOST_*_OWNER documentation
      vhost_task: fix vhost_task_create() documentation

Stephan Gerhold (1):
      serial: msm: Configure correct working mode before starting earlycon

Suzuki K Poulose (1):
      irqchip/gic-v2m: Prevent use after free of gicv2m_get_fwnode()

T.J. Mercier (2):
      cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
      splice: remove duplicate noinline from pipe_clear_nowait

Tejun Heo (2):
      sched_ext: Remove cpu.weight / cpu.idle unimplemented warnings
      sched_ext: Mark SCX_OPS_HAS_CGROUP_WEIGHT for deprecation

Thadeu Lima de Souza Cascardo (1):
      char: misc: register chrdev region with all possible minors

Tiezhu Yang (3):
      LoongArch: Make regs_irqs_disabled() more clear
      LoongArch: Make do_xyz() exception handlers more robust
      LoongArch: Handle fp, lsx, lasx and lbt assembly symbols

Tung Nguyen (1):
      tipc: fix NULL pointer dereference in tipc_mon_reinit_self()

Uday Shankar (1):
      selftests: ublk: common: fix _get_disk_dev_t for pre-9.0 coreutils

Viacheslav Dubeyko (1):
      MAINTAINERS: add HFS/HFS+ maintainers

Vladimir Oltean (3):
      net: enetc: register XDP RX queues with frag_size
      net: enetc: refactor bulk flipping of RX buffers to separate function
      net: enetc: fix frame corruption on bpf_xdp_adjust_head/tail()
and XDP_PASS

Vlastimil Babka (1):
      locking/local_lock: fix _Generic() matching of local_trylock_t

Wentao Liang (1):
      drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()

Yangtao Li (1):
      MAINTAINERS: hfs/hfsplus: add myself as maintainer

Yuli Wang (1):
      LoongArch: Select ARCH_USE_MEMTEST

Yulong Han (1):
      LoongArch: KVM: Fix multiple typos of KVM code

Zhongqiu Han (1):
      virtio_ring: Fix data race by tagging event_triggered as racy for KCS=
AN

gaoxu (1):
      cgroup: Fix compilation issue due to cgroup_mutex not being exported
