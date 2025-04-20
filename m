Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FD4A11
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 21:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745182936; cv=none; b=eA+bhhamVLA4ppnwsj8R+RxGHaGBee7jVMgVgjDKUAQ5g349zuQ5A+9NzRGw/puL4Kfv+jBxE+VYFQcULcjIgK7AI3waet1Sr1suUvyIKolj4XLvh6JPQNrLctaRk7QaGO9/9Ejl5rTVcnqRk2AqgJGDQ4M+ZsxELYGxS8W9CyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745182936; c=relaxed/simple;
	bh=5wztOTioyhlJG2/zecbTPCRTj/kq2TliOLC8pT0I10U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Pzr1V5dq3aY7kDgAE9hdFoqYmWIBJIUQ58jYb/pNnvGenYQjQLrmhXbxxJ+L7lkeM0M3MIAVHEINKpr3xTCgmcTD8xVdcNI2IfwQC5p8u8gBMP5J2txn+AS9C79doO09Odaphugzx2/d9FNEnYoSD7EhuKI12uFLtyN3dBflCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=X7MYeIGe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="X7MYeIGe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so5799521a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745182928; x=1745787728; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NzR3nPomY6Y+58s+JGufBnpYC5RKpbNkaky/SlxvJ+s=;
        b=X7MYeIGe6U+0uFA/ZVToSddY3F7l4iS5e1ffiGwbsbtgsF2P6QNcKgjSENe/52kGUl
         QgqgV2TP7SkTAgW6i11mIdAXkE6FfeJ8jfHgrs/nyuZFNNgjQe+ExT+f149eoS+47LBK
         lgQS17Wb3nlOhe9krLqN/JtN3sH7x/nr8987A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745182928; x=1745787728;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzR3nPomY6Y+58s+JGufBnpYC5RKpbNkaky/SlxvJ+s=;
        b=r28TIOPSgynZb0ejmCCtK44JaPp3VkIAJ9YAYs1CLfJQS4pMW8JFxsbWxTtU+qW8l9
         3hI7BSKzFIA44h9mysCQ8KY9nER1ZInJi7rH5+51a1oCDSHKhV3CNasaPzQ32kfGqZSe
         ZPAab0Uf5EdoyWMpUHsHqeFIjbkutMiPUh92HYGjkaQSMNVf33hY6JhByOUo1g4Uc8Qk
         /JaIu+clViehUw6IZZvNV37q8z++IwogrHUMu2OPA2QvLb3/eNsxlXU9CGVSJIestnhD
         sVobuZJchRm6mywREEZ//GxY+E9bxfe7W5XUXUHFdCgLUrKZcy2uWaM+pfi0Vnja04bl
         R9Rg==
X-Gm-Message-State: AOJu0YyqujREmjkHe++/fJOkfbdi/+kxyH5Q9774mptLxriwHjb89Ti4
	EaNODulbo7n7/lrK7RtnI5Gu9GcTgN7O2xuvLh8bigWprFc9E5yFXzeXd5u/k4V8bgn6Rags0GP
	i
X-Gm-Gg: ASbGncurTrW9xlq1dw5RiieI3e00WjsRYFOd0KH7kLBqkyjRAHuQ44Ciq2LaNc6/r06
	pVWB33aMJkOjn90oNPPtFIL0wxwylBQWF/PVdO7TT8GYglV8AEGmiXZ63ImS2ov3Ee/FZsFInbl
	vJZYGU+DI8p4CeZ8X9+63PC1tqx71+bNCDHa/618gPYtoIfLR+Z72wuO9nLN/3eeRPsP2mFQvlX
	G+5yR7wK+hWHPLn1zdCd0D9C0lCAWlGOXZus5jYFhPn0L5vmjhZje/a2Pj1LRdeyS3lbcoFgsjp
	YZBOHrb9sKCJhNFYoM0gT3OcVJBz573mV6teeMeKsKz+2H2KPwIxshd0cJ1mgXRcEESE/JqsfQo
	tce/pQ4TBXmSXAvk=
X-Google-Smtp-Source: AGHT+IFrZRqbtMIqR8sTwEzVzzbUeR7l6KnvodjTuxs0nB4eZcfrUxZzSrwRb6uJu0q3Y8oVCD0VWg==
X-Received: by 2002:a17:907:d1b:b0:acb:34b2:851 with SMTP id a640c23a62f3a-acb74dbf387mr905643366b.44.1745182927864;
        Sun, 20 Apr 2025 14:02:07 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4c6b5sm423254766b.49.2025.04.20.14.02.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 14:02:07 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac339f53df9so606714366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 14:02:06 -0700 (PDT)
X-Received: by 2002:a17:907:d8a:b0:ac6:b729:9285 with SMTP id
 a640c23a62f3a-acb74e2f9b1mr870547566b.55.1745182926043; Sun, 20 Apr 2025
 14:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Apr 2025 14:01:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
X-Gm-Features: ATxdqUHbncGJzT5LsKElaiWuERj0V7aIsMIMujOEOqMJANMkg-fKA_fz7e4Pjdc
Message-ID: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
Subject: Linux 6.15-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's absolutely nothing of huge note here as far as I can tell.
Just a fair number of small fixes all over  the place - the biggest
changes are to fix some ublk driver issues, and the related selftests
for same. The rest is generally one- or few-lines.

So everything looks fine, and while the merge window was fairly big,
that doesn't seem to have resulted in any particular pain. At least so
far. Knock wood.

So a happy Easter Sunday to everybody (or a regular Sunday in case you
don't care, and don't do the "eat odd traditional Finnish foods" like
we do here in our family).

Because regardless of whether you observe the day or not, now you can
download a fresh new release candidate, and that's always cause for
celebration, isn't it? Even if it's the regularly scheduled
every-Sunday-afternoon-like-clockwork-unless-Linus-forgets kind of
thing.

             Linus

---

Abdun Nihaal (7):
      wifi: at76c50x: fix use after free access in at76_disconnect
      wifi: brcmfmac: fix memory leak in brcmf_get_module_param
      wifi: wl1251: fix memory leak in wl1251_tx_work
      pds_core: fix memory leak in pdsc_debugfs_add_qcq()
      net: ngbe: fix memory leak in ngbe_probe() error path
      cxgb4: fix memory leak in cxgb4_init_ethtool_filters() error path
      net: txgbe: fix memory leak in txgbe_probe() error path

Ahmad Fatoum (1):
      docs: ABI: replace mcroce@microsoft.com with new Meta address

Akhil R (1):
      crypto: tegra - Fix IV usage for AES ECB

Alan Huang (1):
      bcachefs: Add missing error handling

Alex Deucher (1):
      drm/amd/display/dml2: use vzalloc rather than kzalloc

Alex Williamson (2):
      vfio/pci: Virtualize zero INTx PIN if no pdev->irq
      Revert "PCI: Avoid reset when disabled via sysfs"

Alexei Starovoitov (2):
      locking/local_lock, mm: replace localtry_ helpers with
local_trylock_t type
      mm/page_alloc: avoid second trylock of zone->lock

Amadeusz S=C5=82awi=C5=84ski (1):
      ASoC: Intel: avs: Constrain path based on BE capabilities

Andreas Gruenbacher (1):
      writeback: fix false warning in inode_to_wb()

Andrew Jones (2):
      riscv: Fix unaligned access info messages
      riscv: Provide all alternative macros all the time

Andrzej Kacprowski (2):
      accel/ivpu: Fix the NPU's DPU frequency calculation
      accel/ivpu: Show NPU frequency in sysfs

Andy Shevchenko (1):
      i2c: atr: Fix wrong include

Ankit Nautiyal (2):
      drm/i915/display: Add macro for checking 3 DSC engines
      drm/i915/dp: Check for HAS_DSC_3ENGINES while configuring DSC slices

Anshuman Khandual (1):
      selftests/mm: fix compiler -Wmaybe-uninitialized warning

Ard Biesheuvel (1):
      x86/boot/sev: Avoid shared GHCB page for early memory acceptance

Armin Wolf (2):
      platform/x86: msi-wmi-platform: Rename "data" variable
      platform/x86: msi-wmi-platform: Workaround a ACPI firmware bug

Arnaldo Carvalho de Melo (1):
      perf libunwind arm64: Fix missing close parens in an if statement

Arnd Bergmann (9):
      iwlwifi: mld: fix building with CONFIG_PM_SLEEP disabled
      RDMA/ucaps: Avoid format-security warning
      ASN.1: add module description
      samples/livepatch: add module descriptions
      fpga: tests: add module descriptions
      zlib: add module description
      ucs2_string: add module description
      mm/kasan: add module decription
      kunit: slub: add module description

Bao D. Nguyen (2):
      scsi: ufs: core: Rename ufshcd_wb_presrv_usrspc_keep_vcc_on()
      scsi: ufs: core: Add device level exception support

Baolin Wang (1):
      selftests: mincore: fix tmpfs mincore test failure

Baoquan He (2):
      MAINTAINERS: add Andrew and Baoquan as kexec maintainers
      mm/gup: fix wrongly calculated returned value in fault_in_safe_writea=
ble()

Bart Van Assche (1):
      scsi: ufs: core: Fix a race condition related to device commands

Biju Das (1):
      irqchip/renesas-rzv2h: Prevent TINT spurious interrupt

Bird, Tim (1):
      block: add SPDX header line to blk-throttle.h

Bj=C3=B6rn T=C3=B6pel (1):
      riscv: Properly export reserved regions in /proc/iomem

Bo-Cun Chen (3):
      net: ethernet: mtk_eth_soc: reapply mdc divider on reset
      net: ethernet: mtk_eth_soc: correct the max weight of the queue
limit for 100Mbps
      net: ethernet: mtk_eth_soc: revise QDMA packet scheduler settings

Borislav Petkov (AMD) (1):
      x86/microcode/AMD: Extend the SHA check to Zen5, block loading
of any unreleased standalone Zen5 microcode patches

Brady Norander (1):
      ASoC: dwc: always enable/disable i2s irqs

Breno Leitao (2):
      spi: tegra210-quad: use WARN_ON_ONCE instead of WARN_ON for timeouts
      spi: tegra210-quad: add rate limiting and simplify timeout error mess=
age

Caleb Sander Mateos (1):
      ublk: don't suggest CONFIG_BLK_DEV_UBLK=3DY

Chandrakanth Patil (2):
      scsi: megaraid_sas: Block zero-length ATA VPD inquiry
      scsi: megaraid_sas: Driver version update to 07.734.00.00-rc1

Charles Keepax (1):
      ASoC: cs42l43: Reset clamp override on jack removal

Chen Ni (1):
      ALSA: hda/tas2781: Remove unnecessary NULL check before release_firmw=
are()

Chengchang Tang (1):
      RDMA/hns: Fix wrong maximum DMA segment size

Chenyuan Yang (2):
      drm/msm/dpu: Fix error pointers in dpu_plane_virtual_atomic_check
      octeontx2-pf: handle otx2_mbox_get_rsp errors

Christian Brauner (6):
      mount: ensure we don't pointlessly walk the mount tree
      Kconfig: switch CONFIG_SYSFS_SYCALL default to n
      hfs{plus}: add deprecation warning
      fs: add kern_path_locked_negative()
      fs: ensure that *path_locked*() helpers leave passed path pristine
      Revert "hfs{plus}: add deprecation warning"

Christian K=C3=B6nig (1):
      drm/amdgpu: use a dummy owner for sysfs triggered cleaner shaders v4

Christoph Hellwig (4):
      xfs: remove the leftover xfs_{set,clear}_li_failed infrastructure
      xfs: mark xfs_buf_free as might_sleep()
      loop: stop using vfs_iter_{read,write} for buffered I/O
      fs: move the bdex_statx call to vfs_getattr_nosec

Christopher S M Hall (6):
      igc: fix PTM cycle trigger logic
      igc: increase wait time before retrying PTM
      igc: move ktime snapshot into PTM retry loop
      igc: handle the IGC_PTP_ENABLED flag correctly
      igc: cleanup PTP module if probe fails
      igc: add lock preventing multiple simultaneous PTM transactions

Chunjie Zhu (1):
      smb3 client: fix open hardlink on deferred close file error

Damien Le Moal (4):
      nvmet: auth: use NULL to clear a pointer in nvmet_auth_sq_free()
      nvmet: pci-epf: always fully initialize completion entries
      nvmet: pci-epf: clear CC and CSTS when disabling the controller
      nvmet: pci-epf: cleanup link state management

Damodharam Ammepalli (1):
      ethtool: cmis_cdb: use correct rpl size in ethtool_cmis_module_poll()

Dan Carpenter (3):
      wifi: iwlwifi: mld: silence uninitialized variable warning
      Bluetooth: btrtl: Prevent potential NULL dereference
      dma-buf/sw_sync: Decrement refcount on error in
sw_sync_ioctl_get_deadline()

Dan Williams (1):
      fwctl/cxl: Fix uuid_t usage in uapi

Daniel Gomez (1):
      radix-tree: add missing cleanup.h

Daniele Ceraolo Spurio (1):
      drm/xe/pxp: do not queue unneeded terminations from debugfs

Dapeng Mi (2):
      perf/x86/intel: Don't clear perf metrics overflow bit unconditionally
      perf/x86/intel: Allow to update user space GPRs from PEBS records

Darrick J. Wong (2):
      xfs: compute buffer address correctly in xmbuf_map_backing_mem
      xfs: fix fsmap for internal zoned devices

David E. Box (1):
      platform/x86: intel_pmc_ipc: add option to build without ACPI

David Hildenbrand (3):
      mm: (un)track_pfn_copy() fix + doc improvements
      fs/dax: fix folio splitting issue by resetting old folio order + _nr_=
pages
      mm/memory: move sanity checks in do_wp_page() after mapcount vs.
refcount stabilization

David Howells (2):
      devpts: Fix type for uid and gid params
      afs: Fix afs_dynroot_readdir() to not use the RCU read lock

David Rosca (1):
      drm/amdgpu: Add back JPEG to video caps for carrizo and newer

David Thompson (1):
      mlxbf-bootctl: use sysfs_emit_at() in secure_boot_fuse_state_show()

David Wei (1):
      io_uring/zcrx: enable tcp-data-split in selftest

Davide Caratti (1):
      can: fix missing decrement of j1939_proto.inuse_idx

Denis Arefev (2):
      asus-laptop: Fix an uninitialized variable
      ksmbd: Prevent integer overflow in calculation of deadtime

Dhananjay Ugwekar (1):
      cpufreq/amd-pstate: Fix min_limit perf and freq updation for
performance governor

Dmitry Baryshkov (2):
      Bluetooth: qca: fix NV variant for one of WCN3950 SoCs
      drm/msm/dpu: drop rogue intr_tear_rd_ptr values

Edward Adam Davis (1):
      isofs: Prevent the use of too small fid

Eric Biggers (1):
      nfs: add missing selections of CONFIG_CRC32

Evgeny Pimenov (1):
      ASoC: qcom: Fix sc7280 lpass potential buffer overflow

FUJITA Tomonori (2):
      rust: helpers: Remove volatile qualifier from io helpers
      rust: helpers: Add dma_alloc_attrs() and dma_free_attrs()

Fernando Fernandez Mancera (1):
      x86/i8253: Call clockevent_i8253_disable() with interrupts disabled

Florian Westphal (1):
      netfilter: conntrack: fix erronous removal of offload bit

Frank Li (3):
      dt-bindings: display: nwl-dsi: Allow 'data-lanes' property for port@1
      dt-bindings: interrupt-controller: fsl,irqsteer: Add i.MX94 support
      dt-bindings: timer: nxp,sysctr-timer: Add i.MX94 support

Frank van der Linden (1):
      mm/cma: report base address of single range correctly

Fr=C3=A9d=C3=A9ric Danis (2):
      Bluetooth: l2cap: Check encryption key size on incoming connection
      Bluetooth: l2cap: Process valid commands in too long frame

Gabriel Shahrouzi (1):
      bcachefs: Prevent granting write refs when filesystem is read-only

Geert Uytterhoeven (2):
      dt-bindings: soc: fsl: fsl,ls1028a-reset: Fix maintainer entry
      lib/prime_numbers: KUnit test should not select PRIME_NUMBERS

Giuseppe Scrivano (1):
      ovl: remove unused forward declaration

Gou Hao (1):
      iomap: skip unnecessary ifs_block_is_uptodate check

Hannes Reinecke (2):
      nvme: fixup scan failure for non-ANA multipath controllers
      nvme-multipath: sysfs links may not be created for devices

Hans Holmberg (2):
      xfs: add tunable threshold parameter for triggering zone GC
      xfs: document zoned rt specifics in admin-guide

Hans de Goede (2):
      platform/x86: x86-android-tablets: Add "9v" to Vexia EDU ATLA 10
tablet symbols
      platform/x86: x86-android-tablets: Add Vexia Edu Atla 10 tablet 5V da=
ta

Henry Martin (1):
      ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()

Herbert Xu (4):
      crypto: scomp - Fix null-pointer deref when freeing streams
      crypto: caam/qi - Fix drv_ctx refcount bug
      crypto: scomp - Fix wild memory accesses in scomp_free_streams
      crypto: ahash - Disable request chaining

Herve Codina (1):
      ASoC: fsl: fsl_qmc_audio: Reset audio data pointers on TRIGGER_START =
event

Ido Schimmel (2):
      net: fib_rules: Fix iif / oif matching on L3 master device
      selftests: fib_rule_tests: Add VRF match tests

Igor Pylypiv (1):
      scsi: pm80xx: Set phy_attached to zero when device is gone

Ilya Leoshkevich (1):
      ftrace: Fix type of ftrace_graph_ent_entry.depth

Ilya Maximets (1):
      net: openvswitch: fix nested key length validation in the set() actio=
n

Ingo Molnar (1):
      clang-format: Update the ForEachMacros list for v6.15-rc1

Jakub Kicinski (12):
      net: don't mix device locking in dev_close_many() calls
      netlink: specs: ovs_vport: align with C codegen capabilities
      eth: bnxt: fix missing ring index trim on error path
      tools: ynl-gen: don't declare loop iterator in place
      tools: ynl-gen: move local vars after the opening bracket
      tools: ynl-gen: individually free previous values on double set
      tools: ynl-gen: make sure we validate subtype of array-nest
      netlink: specs: rt-link: add an attr layer around alt-ifname
      netlink: specs: rtnetlink: attribute naming corrections
      netlink: specs: rt-link: adjust mctp attribute naming
      netlink: specs: rt-neigh: prefix struct nfmsg members with ndm
      net: don't try to ops lock uninitialized devs

Jan Stancek (1):
      fs: use namespace_{lock,unlock} in dissolve_on_fput()

Jason Andryuk (1):
      x86/xen: Fix __xen_hypercall_setfunc()

Jean-Michel Hautbois (1):
      mailmap: add entry for Jean-Michel Hautbois

Jens Axboe (1):
      io_uring/rsrc: ensure segments counts are correct on kbuf buffers

Jijie Shao (7):
      net: hibmcge: fix incorrect pause frame statistics issue
      net: hibmcge: fix incorrect multicast filtering issue
      net: hibmcge: fix the share of irq statistics among different
network ports issue
      net: hibmcge: fix wrong mtu log issue
      net: hibmcge: fix the incorrect np_link fail state issue.
      net: hibmcge: fix not restore rx pause mac addr after reset issue
      net: hibmcge: fix multiple phy_stop() issue

Jinjiang Tu (1):
      mm/hugetlb: fix set_max_huge_pages() when there are surplus pages

Joe Damato (1):
      eventpoll: Set epoll timeout if it's in the future

Johannes Berg (4):
      wifi: iwlwifi: mld: fix PM_SLEEP -Wundef warning
      wifi: add wireless list to MAINTAINERS
      wifi: iwlwifi: pcie: set state to no-FW before reset handshake
      Revert "wifi: mac80211: Update skb's control block key in
ieee80211_tx_dequeue()"

Johannes Kimmel (1):
      btrfs: correctly escape subvol in btrfs_show_options()

Johannes Weiner (3):
      mm: page_alloc: speed up fallbacks in rmqueue_bulk()
      mm: vmscan: restore high-cpu watermark safety in kswapd
      mm: vmscan: fix kswapd exit condition in defrag_mode

Jonas Gorski (2):
      net: b53: enable BPDU reception for management port
      net: bridge: switchdev: do not notify new brentries as changed

Jonathan Currier (2):
      PCI/MSI: Add an option to write MSIX ENTRY_DATA before any reads
      net/niu: Niu requires MSIX ENTRY_DATA fields touch before entry reads

Juergen Gross (1):
      xen: fix multicall debug feature

Jun Nie (1):
      drm/msm/dpu: check every pipe per capability

K Prateek Nayak (1):
      cpufreq/amd-pstate: Enable ITMT support after initializing core ranki=
ngs

Kailang Yang (1):
      ALSA: hda/realtek - Fixed ASUS platform headset Mic issue

Kan Liang (4):
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on =
SNR
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on =
ICX
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on =
SPR
      perf/x86/intel: Add Panther Lake support

Karol Wachowski (2):
      accel/ivpu: Update FW Boot API to version 3.28.3
      accel/ivpu: Add cmdq_id to job related logs

Kashyap Desai (1):
      RDMA/bnxt_re: Fix budget handling of notification queue

Kees Cook (3):
      hardening: Disable GCC randstruct for COMPILE_TEST
      Bluetooth: vhci: Avoid needless snprintf() calls
      netfs: Mark __nonstring lookup tables

Kent Overstreet (9):
      bcachefs: Don't print data read retry success on non-errors
      bcachefs: fix bch2_dev_usage_full_read_fast()
      bcachefs: btree_root_unreadable_and_scan_found_nothing now AUTOFIX
      bcachefs: Silence extent_poisoned error messages
      bcachefs: Print version_incompat_allowed on startup
      bcachefs: Log message when incompat version requested but not enabled
      bcachefs: snapshot_node_missing is now autofix
      bcachefs: Add missing READ_ONCE() for metadata replicas
      bcachefs: Fix snapshotting a subvolume, then renaming it

Kirill A. Shutemov (2):
      mm: fix apply_to_existing_page_range()
      mm/page_alloc: fix deadlock on cpu_hotplug_lock in __accept_page()

Kuninori Morimoto (2):
      ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry
      dt-bindings: timer: renesas,tpu: remove obsolete binding

Kuniyuki Iwashima (3):
      smc: Fix lockdep false-positive for IPPROTO_SMC.
      Revert "smb: client: Fix netns refcount imbalance causing leaks
and use-after-free"
      Revert "smb: client: fix TCP timers deadlock after rmmod"

Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Add G-Mode support to Alienware m16=
 R1
      platform/x86: alienware-wmi-wmax: Extend support to more laptops

Leon Romanovsky (1):
      RDMA/bnxt_re: Remove unusable nq variable

Li Haoran (1):
      scsi: scsi_transport_srp: Replace min/max nesting with clamp()

Li Lingfeng (1):
      nfsd: decrease sc_count directly if fail to queue dl_recall

Li Zhijian (1):
      RDMA/rxe: Fix null pointer dereference in ODP MR check

Liam R. Howlett (1):
      MAINTAINERS: add mmap trace events to MEMORY MAPPING

Lijo Lazar (1):
      drm/amdgpu: Use the right function for hdp flush

Linus Torvalds (6):
      gcc-15: make 'unterminated string initialization' just a warning
      gcc-15: acpi: sprinkle random '__nonstring' crumbles around
      gcc-15: get rid of misc extra NUL character padding
      gcc-15: add '__nonstring' markers to byte arrays
      gcc-15: work around sequence-point warning
      Linux 6.15-rc3

Liu Shixin (1):
      mm/hugetlb: fix nid mismatch in alloc_surplus_hugetlb_folio()

Loic Poulain (1):
      mailmap: map Loic Poulain's old email addresses

Lorenzo Stoakes (4):
      mm/vma: add give_up_on_oom option on modify/merge, use in uffd releas=
e
      MAINTAINERS: add memory advice section
      MAINTAINERS: add Pedro as reviewer to the MEMORY MAPPING section
      MAINTAINERS: add section for locking of mm's and VMAs

Lucas De Marchi (1):
      drm/xe: Set LRC addresses before guc load

Luiz Augusto von Dentz (1):
      Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for invalid ad=
dress

Lukas Fischer (1):
      scripts: generate_rust_analyzer: Add ffi crate

Lukas Wunner (1):
      wifi: iwlwifi: mld: Restart firmware on iwl_mld_no_wowlan_resume() er=
ror

Maciej Falkowski (1):
      accel/ivpu: Flush pending jobs of device's workqueues

Mans Rullgard (1):
      spi: sun4i: add support for GPIO chip select lines

Mario Limonciello (2):
      platform/x86: amd: pmf: Fix STT limits
      drm/amd: Forbid suspending into non-default suspend states

Mark Bloch (1):
      RDMA/mlx5: Fix compilation warning when USER_ACCESS isn't set

Mark Brown (1):
      selftests/mm: generate a temporary mountpoint for cgroup filesystem

Martin K. Petersen (1):
      block: integrity: Do not call set_page_dirty_lock()

Martin Wilck (1):
      scsi: smartpqi: Use is_kdump_kernel() to check for kdump

Mathieu Dubois-Briand (1):
      gpiolib: Allow to use setters with return value for output-only gpios

Matt Johnston (1):
      net: mctp: Set SOCK_RCU_FREE

Matthew Auld (2):
      drm/xe/userptr: fix notifier vs folio deadlock
      drm/xe/dma_buf: stop relying on placement in unmap

Matthew Wilcox (Oracle) (1):
      test suite: use %zu to print size_t

Ma=C3=ADra Canal (1):
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

Meghana Malladi (3):
      net: ti: icssg-prueth: Fix kernel warning while bringing down
network interface
      net: ti: icssg-prueth: Fix possible NULL pointer dereference
inside emac_xmit_xdp_frame()
      net: ti: icss-iep: Fix possible NULL pointer dereference for
perout request

Meir Elisha (1):
      md/raid1: Add check for missing source disk in process_checks()

Menglong Dong (1):
      ftrace: fix incorrect hash size in register_ftrace_direct()

Miaoqian Lin (1):
      scsi: iscsi: Fix missing scsi_host_put() in error path

Michael Walle (1):
      net: ethernet: ti: am65-cpsw: fix port_np reference counting

Miguel Ojeda (6):
      rust: pin-init: alloc: restrict `impl ZeroableOption` for `Box`
to `T: Sized`
      rust: pin-init: use Markdown autolinks in Rust comments
      rust: disable `clippy::needless_continue`
      rust: kasan/kbuild: fix missing flags on first build
      objtool/rust: add one more `noreturn` Rust function for Rust 1.86.0
      rust: kbuild: use `pound` to support GNU Make < 4.3

Miklos Szeredi (1):
      ovl: don't allow datadir only

Ming Lei (18):
      selftests: ublk: fix ublk_find_tgt()
      selftests: ublk: add io_uring uapi header
      selftests: ublk: cleanup backfile automatically
      selftests: ublk: make sure _add_ublk_dev can return in sub-shell
      selftests: ublk: run stress tests in parallel
      selftests: ublk: add two stress tests for zero copy feature
      selftests: ublk: setup ring with
IORING_SETUP_SINGLE_ISSUER/IORING_SETUP_DEFER_TASKRUN
      selftests: ublk: set queue pthread's cpu affinity
      selftests: ublk: increase max nr_queues and queue depth
      selftests: ublk: support target specific command line
      selftests: ublk: support user recovery
      selftests: ublk: add test_stress_05.sh
      selftests: ublk: move creating UBLK_TMP into _prep_test()
      ublk: add ublk_force_abort_dev()
      ublk: rely on ->canceling for dealing with ublk_nosrv_dev_should_queu=
e_io
      ublk: move device reset into ublk_ch_release()
      ublk: remove __ublk_quiesce_dev()
      ublk: simplify aborting ublk request

Mostafa Saleh (1):
      ubsan: Fix panic from test_ubsan_out_of_bounds

Mubin Sayyed (1):
      dt-bindings: xilinx: Remove myself from maintainership

Muchun Song (1):
      mm: memcontrol: fix swap counter leak from offline cgroup

Nam Cao (1):
      Documentation: riscv: Fix typo MIMPLID -> MIMPID

Namhyung Kim (11):
      tools headers: Update the KVM headers with the kernel sources
      tools headers: Update the socket headers with the kernel sources
      tools headers: Update the uapi/linux/perf_event.h copy with the
kernel sources
      tools headers: Update the VFS headers with the kernel sources
      tools headers: Update the syscall table with the kernel sources
      tools headers: Update the uapi/linux/prctl.h copy with the kernel sou=
rces
      tools headers: Update the uapi/asm-generic/mman-common.h copy
with the kernel sources
      tools headers: Update the linux/unaligned.h copy with the kernel sour=
ces
      tools headers: Update the x86 headers with the kernel sources
      tools headers: Update the arch/x86/lib/memset_64.S copy with the
kernel sources
      perf tools: Remove evsel__handle_error_quirks()

Namjae Jeon (4):
      ksmbd: fix WARNING "do not call blocking ops when !TASK_RUNNING"
      ksmbd: fix use-after-free in __smb2_lease_break_noti()
      ksmbd: fix use-after-free in smb_break_all_levII_oplock()
      ksmbd: fix the warning from __kernel_write_iter

Nathan Chancellor (3):
      riscv: Avoid fortify warning in syscall_get_arguments()
      lib/Kconfig.ubsan: Remove 'default UBSAN' from UBSAN_INTEGER_WRAP
      riscv: Avoid fortify warning in syscall_get_arguments()

Neeraj Sanjay Kale (2):
      Bluetooth: btnxpuart: Revert baudrate change in nxp_shutdown
      Bluetooth: btnxpuart: Add an error message if FW dump trigger fails

Niklas Cassel (1):
      ata: libata-sata: Save all fields from sense data descriptor

Nitesh Shetty (1):
      io_uring/rsrc: send exact nr_segs for fixed buffer

Omar Sandoval (1):
      dcache: convert dentry flag macros to enum

Oscar Salvador (2):
      MAINTAINERS: update HUGETLB reviewers
      mm, hugetlb: increment the number of pages to be reset on HVO

Pauli Virtanen (1):
      Bluetooth: increment TX timestamping tskey always for stream sockets

Pavel Begunkov (6):
      io_uring/zcrx: return ifq id to the user
      io_uring/zcrx: add pp to ifq conversion helper
      io_uring/rsrc: don't skip offset calculation
      io_uring/rsrc: separate kbuf offset adjustments
      io_uring/rsrc: refactor io_import_fixed
      io_uring/zcrx: fix late dma unmap for a dead dev

Peter Collingbourne (1):
      string: Add load_unaligned_zeropad() code path to sized_strscpy()

Peter Griffin (7):
      scsi: ufs: exynos: Ensure pre_link() executes before exynos_ufs_phy_i=
nit()
      scsi: ufs: exynos: Move UFS shareability value to drvdata
      scsi: ufs: exynos: Disable iocc if dma-coherent property isn't set
      scsi: ufs: exynos: Ensure consistent phy reference counts
      scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
      scsi: ufs: exynos: Move phy calls to .exit() callback
      scsi: ufs: exynos: gs101: Put UFS device in reset on .suspend()

Peter Robinson (1):
      irqchip/irq-bcm2712-mip: Enable driver when ARCH_BCM2835 is enabled

Peter Ujfalusi (1):
      ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S16

Pi Xiange (1):
      x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor
Cove cores

Qasim Ijaz (1):
      drm/msm/dpu: reorder pointer operations after sanity checks to
avoid NULL deref

Qu Wenruo (1):
      btrfs: remove folio order ASSERT()s in super block writeback path

Rafael J. Wysocki (5):
      cpufreq: intel_pstate: Fix hwp_get_cpu_scaling()
      cpufreq/sched: Fix the usage of CPUFREQ_NEED_UPDATE_LIMITS
      cpufreq/sched: Explicitly synchronize limits_changed flag handling
      cpufreq/sched: Set need_freq_update in ignore_dl_rate_limit()
      cpufreq: Avoid using inconsistent policy->min and policy->max

Remi Pommarel (2):
      wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeu=
e()
      wifi: mac80211: Purge vif txq in ieee80211_do_stop()

Richard Fitzgerald (2):
      ALSA: hda/cirrus_scodec_test: Don't select dependencies
      firmware: cs_dsp: test_bin_error: Fix uninitialized data used as
fw version

Rob Clark (1):
      drm/msm/a6xx+: Don't let IB_SIZE overflow

Sagi Maimon (1):
      ptp: ocp: fix start time alignment in ptp_ocp_signal_set

Sakari Ailus (1):
      Documentation: PM: runtime: Fix a reference to pm_runtime_autosuspend=
()

Sami Tolvanen (1):
      rust: kbuild: Don't export __pfx symbols

Samuel Holland (2):
      riscv: module: Fix out-of-bounds relocation access
      riscv: module: Allocate PLT entries for R_RISCV_PLT32

Sandipan Das (1):
      x86/cpu/amd: Fix workaround for erratum 1054

Sean Heelan (1):
      ksmbd: Fix dangling pointer in krb_authenticate

Shannon Nelson (2):
      pds_fwctl: Fix type and endian complaints
      fwctl: Fix repeated device word in log message

Sharath Srinivasan (1):
      RDMA/cma: Fix workqueue crash in cma_netevent_work_handler

Shay Drory (1):
      RDMA/core: Silence oversized kvmalloc() warning

Sheng Yong (1):
      lib/iov_iter: fix to increase non slab folio refcount

Shengjiu Wang (1):
      ASoC: fsl_asrc_dma: get codec or cpu dai from backend

Sidong Yang (1):
      btrfs: ioctl: don't free iov when btrfs_encoded_read() returns -EAGAI=
N

Song Liu (2):
      netfs: Only create /proc/fs/netfs with CONFIG_PROC_FS
      fs: Fix filename init after recent refactoring

Srinivas Kandagatla (4):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
      MAINTAINERS: use kernel.org alias
      mailmap: Add entry for Srinivas Kandagatla

Srinivas Pandruvada (2):
      thermal: intel: int340x: Add missing DVFS support flags
      thermal: intel: int340x: Fix Panther Lake DLVR support

Stanislav Fomichev (1):
      bonding: hold ops lock around get_link

Steven Rostedt (6):
      selftests/ftrace: Differentiate bash and dash in dynevent_limitations=
.tc
      ftrace: Initialize variables for ftrace_startup/shutdown_subops()
      ftrace: Reinitialize hash to EMPTY_HASH after freeing
      ftrace: Free ftrace hashes after they are replaced in the subops code
      tracing: Fix filter string testing
      tracing: selftests: Add testing a user string to filters

Suren Baghdasaryan (1):
      slab: ensure slab->obj_exts is clear in a newly allocated slab page

Sven Eckelmann (1):
      batman-adv: Fix double-hold of meshif when getting enabled

T.J. Mercier (1):
      alloc_tag: handle incomplete bulk allocations in vm_module_tags_popul=
ate

Takuma Watanabe (1):
      mseal: fix typo and style in documentation

Tamura Dai (1):
      spi: spi-imx: Add check for spi_imx_setupxfer()

Thadeu Lima de Souza Cascardo (1):
      i2c: cros-ec-tunnel: defer probe if parent EC is not present

Thomas Wei=C3=9Fschuh (3):
      kunit: qemu_configs: SH: Respect kunit cmdline
      loop: properly send KOBJ_CHANGED uevent for disk device
      loop: LOOP_SET_FD: send uevents for partitions

Thomas Zimmermann (2):
      drm/gem: Internally test import_attach for imported objects
      drm/mgag200: Fix value in <VBLKSTR> register

Thorsten Blum (1):
      ALSA: azt2320: Replace deprecated strcpy() with strscpy()

Toke H=C3=B8iland-J=C3=B8rgensen (1):
      selftests/tc-testing: Add test for echo of big TC filters

Uday Shankar (3):
      ublk: properly serialize all FETCH_REQs
      ublk: improve detection and handling of ublk server exit
      selftests: ublk: add generic_06 for covering fault inject

Uros Bizjak (1):
      genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers

Vasiliy Kovalev (1):
      hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key

Vincenzo Frascino (1):
      kasan: Add strscpy() test to trigger tag fault on arm64

Vishal Moola (Oracle) (2):
      mm/compaction: fix bug in hugetlb handling pathway
      mm: fix filemap_get_folios_contig returning batches of identical foli=
os

Vladimir Oltean (5):
      net: dsa: mv88e6xxx: avoid unregistering devlink regions which
were never registered
      net: dsa: mv88e6xxx: fix -ENOENT when deleting VLANs and MST is
unsupported
      net: dsa: clean up FDB, MDB, VLAN entries on unbind
      net: dsa: free routing table on probe failure
      net: dsa: avoid refcount warnings when ds->ops->tag_8021q_vlan_del() =
fails

Vlastimil Babka (2):
      MAINTAINERS: update SLAB ALLOCATOR maintainers
      MAINTAINERS: add MM subsection for the page allocator

WangYuli (2):
      riscv: KGDB: Do not inline arch_kgdb_breakpoint()
      riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_bre=
ak

Weidong Wang (1):
      ASoC: codecs: Add of_match_table for aw888081 driver

Weizhao Ouyang (1):
      can: rockchip_canfd: fix broken quirks checks

Will Pierce (1):
      riscv: Use kvmalloc_array on relocation_hashtable

Xiangsheng Hou (1):
      virtiofs: add filesystem context source name check

Xin Long (1):
      ipv6: add exception routes to GC list in rt6_insert_exception

Xingui Yang (2):
      scsi: hisi_sas: Enable force phy when SATA disk directly connected
      scsi: hisi_sas: Fix I/O errors caused by hardware port ID changes

Yazen Ghannam (2):
      RAS/AMD/ATL: Include row[13] bit in row retirement
      RAS/AMD/FMPM: Get masked address

Yedidya Benshimol (1):
      wifi: iwlwifi: mld: reduce scope for uninitialized variable

Yu Kuai (1):
      md/raid10: fix missing discard IO accounting

Yue Haibing (1):
      RDMA/usnic: Fix passing zero to PTR_ERR in usnic_ib_pci_probe()

Yunlong Xing (1):
      loop: aio inherit the ioprio of original request

Zhang Xianwei (1):
      xfs: Fix spelling mistake "drity" -> "dirty"

ZhenGuo Yin (1):
      drm/amdgpu: fix warning of drm_mm_clean

Zheng Qixing (2):
      md/md-bitmap: fix stats collection for external bitmaps
      block: fix resource leak in blk_register_queue() error path

wangxuewen (1):
      mm/hugetlb: add a line break at the end of the format string
