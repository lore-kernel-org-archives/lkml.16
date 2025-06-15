Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F111CBA
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750021594; cv=none; b=nJduVr6ABn7DCOJRrrpLg/UA+yITPx4SPxychS4h5NFW7Gn1bzb5R54mPwgOHlyYAEUpF2D9FkDzbCslktUEFldc9qxB33sFg8nEKW/g04kVe71ayhCzFKPoLuR6MgfB/TJcEJl+ok4WWJjBhQDPYvGpIuof01TW4Vgp8mDYp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750021594; c=relaxed/simple;
	bh=2bO8QB1HUDFWYivRKctNAbhBJlKSOReh3zMCSG6Xwb8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=c96zeT9fLLWM623+k4/c8Esm15DOL9tpaWRA21L/mKNQZVeWCbHtQ/sv/nULYhAeWmFpipruCZ77nqUgdL/yNNLndUE/f83fz0IKccZw6Y722XUQcWL4WIyy8tF0gllzdmFPNhJamDsFl+Kp2qUkl4yNGFe/mkAifbKlGI9Fka8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=C3qVGI9Z; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C3qVGI9Z"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso6950532a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750021589; x=1750626389; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1CBV4fwHGx9WBvTW4JoXopLVNjFiB8JczzXwxBxK6Z8=;
        b=C3qVGI9ZznnaaWfx37meofTVRjyrFX9I3RI/99z9AQIyDyOsVflpXy46BPrs+f+xeE
         Qj4y1yHbeK/AUcQHZvhftTaYYKpnK69ZB7XrjyYuui21l5hygGIOLcDLC7qtKXY7S+aK
         EXsIcX1ZuLcLrhcyJw8IoTmEek5/GHFh1Q0A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750021589; x=1750626389;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CBV4fwHGx9WBvTW4JoXopLVNjFiB8JczzXwxBxK6Z8=;
        b=eCDxul3HRoEc27I4825MRkNqwrlEclwySKs179r+Ld2VbGoK/FWV311W6evpVlQTO6
         ulrnvdGJjao2mTv0Lfpdg5iEJEm5usRNUfT74QP50ojQJ4X77mHhbyjvWbxyz/p1orIJ
         IDu/112eN/+iqeWGQoGyI1r53sQfEyReNel3+41hsUvvHEb/bYBLaNGJTYrmoVRAUA/A
         2MxIMt3631mOcI5e3X2kIf87NzWR8Fi3UdBXrTqQrADffnKY3l1V0mTLoHNCTTZEqr8D
         0r8H3c+jgfSDtp/AEq6kEUtbHdKZApdMN/f0Va0aXYRMn6/FDJ87rJ98kUusSxbG8kgz
         9VxQ==
X-Gm-Message-State: AOJu0YyIQqfxanV1eRRFZ3phEIjG0quSk12ykSgx22+5zXGPr5KSntV7
	4tDVvFahJKkSbGVdYSS/lwJA15pSi5f5CVB1UWxPQ9bXOLOeL+A/mll9yYXuQQ9MT4MzKx6x1p+
	xroraN40=
X-Gm-Gg: ASbGncv0thNuBazKkYJkUDrBVlpl91Vtyl/qeneB3r3dZTC4WvoqnkEOtWVtIBo4JZ2
	Dk1UHqb0UdA1D80H9whCjJuNIxJNRexY8Q0A2Pa4RnvrSIxfYNloDO9DvYfVfOtakdiHptT7mzl
	a8SN2T4oGBULdBq8MPX3srCh4Br8MHnzQvcJkzKrf2UB2AKMXJ4JzhINWeTYpN6qCiErgblGBpf
	Xuj6gH32uaJTHppFarmaaibgvPmIPQhWY69VpT8aa0mdvC7ZAHjPi8eCPq5k/NYJbjMAHrz2O+1
	d3r0so6S8b1cuToSKJUrxMMUKi9eb1OHa590Cv7xmZKavET5H+upbLA0qvZZE3o7w07NhsUM7qb
	qOomQlUM2WjL36bIh+A/wGiQ5p9VuNeAQ9dgs
X-Google-Smtp-Source: AGHT+IFzrmO97z/PhUg+v/OCFaqQQVmbgpHYka5kupv3+5voytIqym5iy5Pa+DMkz0yDHfHbNSENWQ==
X-Received: by 2002:a17:907:3fa7:b0:ad8:a9fc:8127 with SMTP id a640c23a62f3a-adfad4a2522mr735953466b.41.1750021588682;
        Sun, 15 Jun 2025 14:06:28 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm531412066b.47.2025.06.15.14.06.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 14:06:28 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo7452251a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:06:27 -0700 (PDT)
X-Received: by 2002:a05:6402:520c:b0:604:6196:e26b with SMTP id
 4fb4d7f45d1cf-608d09487b3mr5467923a12.21.1750021587318; Sun, 15 Jun 2025
 14:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 15 Jun 2025 14:06:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjoSZFTv3kWKpcHoWJG723TS5KxfStvB40mYYjqVspgFw@mail.gmail.com>
X-Gm-Features: AX0GCFsmohT6Fzw_15XMjrQfGcKL-v4UpMB6CvC3f_kk2rp3A9yGvWuIEsyT890
Message-ID: <CAHk-=wjoSZFTv3kWKpcHoWJG723TS5KxfStvB40mYYjqVspgFw@mail.gmail.com>
Subject: Linux 6.16-rc2
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pretty quiet week, with a pretty small rc2 as a result. That's not
uncommon, and things tend to pick up at rc3, but this is admittedly
even smaller than usual.

It may be that people are taking a breather after a fairly sizable
merge window, but it might also be seasonal, with Europe starting to
see summer vacations... We'll see how this goes.

The diffstat looks somewhat unusual, with a lot of one-liners with
both ARC and pincontrol having (presumably independently) ended up
doing some unrelated trivial cleanups.

But even that is probably noticeable only because everything else is
pretty small. That "everything else" is mostly network drivers (and
bluetooth) and bcachefs, with some rust infrastructure and core
networking changes thrown in.

And, as always, just random smaller stuff all over. Shortlog appended
for people who like to see the details.

            Linus

---

Ahmed Zaki (1):
      iavf: fix reset_task for early reset event

Alan Huang (1):
      bcachefs: Fix possible console lock involved deadlock

Alok Tiwari (1):
      scsi: iscsi: Fix incorrect error path labels for flashnode operations

Amir Tzin (1):
      net/mlx5: Fix ECVF vports unload on shutdown flow

Andres Urian Florez (1):
      spi: offload: check offload ops existence before disabling the trigge=
r

Andrew Morton (1):
      drivers/rapidio/rio_cm.c: prevent possible heap overwrite

Andrii Nakryiko (1):
      libbpf: Handle unsupported mmap-based /sys/kernel/btf/vmlinux correct=
ly

Ankit Chauhan (1):
      scsi: mvsas: Fix typos in per-phy comments and SAS cmd port registers

Anton Nadezhdin (1):
      ice/ptp: fix crosstimestamp reporting

Armin Wolf (1):
      ACPI: EC: Ignore ECDT tables with an invalid ID string

Arnd Bergmann (1):
      bcachefs: ioctl: avoid stack overflow warning

Ashish Kalra (1):
      KVM: SEV: Disable SEV-SNP support on initialization failure

Bagas Sanjaya (1):
      Documentation: ublk: Separate UBLK_F_AUTO_BUF_REG fallback
behavior sublists

Baochen Qiang (8):
      wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
      wifi: ath11k: don't use static variables in
ath11k_debugfs_fw_stats_process()
      wifi: ath11k: don't wait when there is no vdev started
      wifi: ath11k: move some firmware stats related functions outside
of debugfs
      wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
      wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
      wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
      wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850

Barry Song (1):
      MAINTAINERS: add Barry as a THP reviewer

Bharath SM (1):
      smb: improve directory cache reuse for readdir operations

Carlos Fernandez (1):
      macsec: MACsec SCI assignment for ES =3D 0

Casey Connolly (1):
      ath10k: snoc: fix unbalanced IRQ enable in crash recovery

Chandrashekar Devegowda (2):
      Bluetooth: btintel_pcie: Increase the tx and rx descriptor count
      Bluetooth: btintel_pcie: Reduce driver buffer posting to prevent
race condition

Chen-Yu Tsai (1):
      pinctrl: sunxi: dt: Consider pin base when calculating bank
number from pin

Christian K=C3=B6nig (1):
      dma-buf: fix compare in WARN_ON_ONCE

Christoph Hellwig (1):
      block: don't use submit_bio_noacct_nocheck in blk_zone_wplug_bio_work

Damien Le Moal (1):
      block: Clear BIO_EMULATES_ZONE_APPEND flag on BIO completion

Dan Carpenter (4):
      regulator: max20086: Fix refcount leak in max20086_parse_regulators_d=
t()
      spi: spi-pci1xxxx: Fix error code in probe
      spi: stm32-ospi: clean up on error in probe()
      net/mlx5: HWS, Add error checking to hws_bwc_rule_complex_hash_node_g=
et()

Dan Williams (3):
      driver core: faux: Suppress bind attributes
      driver core: faux: Quiet probe failures
      ACPI: APEI: EINJ: Do not fail einj_init() on faux_device_create() fai=
lure

Dexuan Cui (1):
      scsi: storvsc: Increase the timeouts to storvsc_timeout

Dmitry Baryshkov (1):
      pinctrl: qcom: switch to devm_gpiochip_add_data()

Emmanuel Grumbach (1):
      wifi: iwlwifi: fix merge damage related to iwl_pci_resume

Eric Biggers (1):
      crypto: hkdf - move to late_initcall

Eric Dumazet (7):
      net_sched: sch_sfq: fix a potential crash on gso_skb handling
      net_sched: sch_sfq: reject invalid perturb period
      net_sched: prio: fix a race in prio_tune()
      net_sched: red: fix a race in __red_change()
      net_sched: tbf: fix a race in tbf_change()
      net_sched: ets: fix a race in ets_qdisc_change()
      net_sched: remove qdisc_tree_flush_backlog()

FUJITA Tomonori (1):
      rust: time: Fix compile error in impl_has_hr_timer macro

Francesco Dolcini (1):
      Revert "wifi: mwifiex: Fix HT40 bandwidth issue."

Francesco Poli (wintermute) (1):
      cpupower: split unitdir from libdir in Makefile

F=C3=A9lix Pi=C3=A9dallu (2):
      spi: omap2-mcspi: Disable multi mode when CS should be kept
asserted after message
      spi: omap2-mcspi: Disable multi-mode when the previous message
kept CS asserted

Gabriel Dalimonte (1):
      drm/vc4: fix infinite EPROBE_DEFER loop

Gal Pressman (2):
      net: ethtool: Don't check if RSS context exists in case of context 0
      selftests: drv-net: rss_ctx: Add test for ntuple rules targeting
default RSS context

Gustavo Luiz Duarte (1):
      netconsole: fix appending sysdata when sysdata_fields =3D=3D SYSDATA_=
RELEASE

Haren Myneni (1):
      powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()

Herbert Xu (1):
      KEYS: Invert FINAL_PUT bit

Huacai Chen (2):
      spi: loongson: Fix build warnings about export.h
      init: fix build warnings about export.h

Jakub Kicinski (3):
      net: clear the dst when changing skb protocol
      selftests: net: add test case for NAT46 looping back dst
      net: drv: netdevsim: don't napi_complete() from netpoll

Jakub Raczynski (2):
      net/mdiobus: Fix potential out-of-bounds read/write access
      net/mdiobus: Fix potential out-of-bounds clause 45 read/write access

Jason Gunthorpe (2):
      ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed
      iommu/tegra: Fix incorrect size calculation

Jeff Johnson (1):
      wifi: ath12k: Fix hal_reo_cmd_status kernel-doc

Jens Axboe (4):
      block: use plug request list tail for one-shot backmerge attempt
      io_uring/kbuf: don't truncate end buffer for multiple buffer peeks
      nvme: always punt polled uring_cmd end_io work to task_work
      io_uring: run local task_work from ring exit IOPOLL reaping

Jeongjun Park (1):
      ptp: remove ptp->n_vclocks check logic in ptp_vclock_in_use()

Jesper Dangaard Brouer (1):
      veth: prevent NULL pointer dereference in veth_xdp_rcv

Jianbo Liu (1):
      net/mlx5e: Fix leak of Geneve TLV option object

Joe Damato (1):
      e1000: Move cancel_work_sync to avoid deadlock

Jonas Gorski (1):
      net: dsa: b53: fix untagged traffic sent via cpu tagged with VID 0

Keith Busch (1):
      io_uring: consistently use rcu semantics with sqpoll thread

Kent Overstreet (21):
      bcachefs: Add missing restart handling to check_topology()
      bcachefs: Log fsck errors in the journal
      bcachefs: Add range being updated to btree_update_to_text()
      bcachefs: Add more flags to btree nodes for rewrite reason
      bcachefs: Update /dev/disk/by-uuid on device add
      bcachefs: Mark need_discard_freespace_key_bad autofix
      bcachefs: Only run 'increase_depth' for keys from btree node csan
      bcachefs: Read error message now prints if self healing
      bcachefs: Don't persistently run scan_for_btree_nodes
      bcachefs: mark more errors autofix
      bcachefs: Make sure opts.read_only gets propagated back to VFS
      bcachefs: Don't put rhashtable on stack
      bcachefs: Fix downgrade_table_extra()
      bcachefs: Fix rcu_pending for PREEMPT_RT
      bcachefs: Fix leak in bch2_fs_recovery() error path
      bcachefs: Don't pass trans to fsck_err() in gc_accounting_done
      bcachefs: Fix version checks in validate_bset()
      bcachefs: Don't trust sb->nr_devices in members_to_text()
      bcachefs: Print devices we're mounting on multi device filesystems
      bcachefs: Ensure that snapshot creation propagates has_case_insensiti=
ve
      bcachefs: Don't trace should_be_locked unless changing

Kiran K (1):
      Bluetooth: btintel_pcie: Fix driver not posting maximum rx buffers

Krzysztof Kozlowski (3):
      pinctrl: st: Drop unused st_gpio_bank() function
      pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
      pinctrl: tb10x: Drop of_match_ptr for ID table

Kuniyuki Iwashima (3):
      MAINTAINERS: Update Kuniyuki Iwashima's email address.
      ipv6: Move fib6_config_validate() to ip6_route_add().
      af_unix: Allow passing cred for embryo without SO_PASSCRED/SO_PASSPID=
FD.

Linus Torvalds (2):
      Revert "mm/damon/Kconfig: enable CONFIG_DAMON by default"
      Linux 6.16-rc2

Lizhi Hou (1):
      accel/amdxdna: Fix incorrect PSP firmware size

Loic Poulain (1):
      wifi: ath10k: Avoid vdev delete timeout when firmware is already down

Lorenzo Bianconi (1):
      net: airoha: Enable RX queues 16-31

Lorenzo Stoakes (2):
      mm/vma: reset VMA iterator on commit_merge() OOM failure
      mm: add mmap_prepare() compatibility layer for nested file systems

Lucas De Marchi (1):
      drm/xe/lrc: Use a temporary buffer for WA BB

Lucas Sanchez Sagrado (1):
      net: usb: r8152: Add device ID for TP-Link UE200

Luiz Augusto von Dentz (8):
      Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_complete
      Bluetooth: MGMT: Protect mgmt_pending list with its own lock
      Bluetooth: Fix NULL pointer deference on eir_get_service_data
      Bluetooth: hci_sync: Fix broadcast/PA when using an existing instance
      Bluetooth: eir: Fix possible crashes on eir_create_adv_data
      Bluetooth: ISO: Fix using BT_SK_PA_SYNC to detect BIS sockets
      Bluetooth: ISO: Fix not using bc_sid as advertisement SID
      Bluetooth: MGMT: Fix sparse errors

Maarten Lankhorst (1):
      drm/xe/svm: Fix regression disallowing 64K SVM migration

Magnus Lindholm (1):
      mm: pgtable: fix pte_swp_exclusive

Marc Zyngier (4):
      KVM: arm64: Add assignment-specific sysreg accessor
      KVM: arm64: Add RMW specific sysreg accessor
      KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
      KVM: arm64: Make __vcpu_sys_reg() a pure rvalue operand

Marek Szyprowski (1):
      udmabuf: use sgtable-based scatterlist wrappers

Mark Brown (1):
      selftests/mm: skip failed memfd setups in gup_longterm

Martin Blumenstingl (3):
      drm/meson: fix debug log statement when setting the HDMI clocks
      drm/meson: use vclk_freq instead of pixel_freq in debug print
      drm/meson: fix more rounding issues with 59.94Hz modes

Masahiro Yamada (1):
      kbuild: move warnings about linux/export.h from W=3D1 to W=3D2

Matthew Wilcox (Oracle) (2):
      bio: Fix bio_first_folio() for SPARSEMEM without VMEMMAP
      block: Fix bvec_set_folio() for very large folios

Maxime Chevallier (1):
      net: phy: phy_caps: Don't skip better duplex macth on non-exact match

Miaoqing Pan (1):
      wifi: ath12k: fix uaf in ath12k_core_init()

Michal Luczaj (1):
      net: Fix TOCTOU issue in sk_is_readable()

Ming Lei (2):
      loop: move lo_set_size() out of queue freeze
      ublk: document auto buffer registration(UBLK_F_AUTO_BUF_REG)

Moshe Shemesh (1):
      net/mlx5: Ensure fw pages are always allocated on same NUMA

Nathan Chancellor (1):
      drm/sitronix: st7571-i2c: Select VIDEOMODE_HELPERS

Oleg Nesterov (1):
      posix-cpu-timers: fix race between handle_posix_cpu_timers() and
posix_cpu_timer_del()

Paolo Bonzini (2):
      KVM: x86/mmu: Embed direct bits into gpa for KVM_PRE_FAULT_MEMORY
      KVM: x86/mmu: Reject direct bits in gpa passed to KVM_PRE_FAULT_MEMOR=
Y

Patrice Chotard (1):
      spi: stm32-ospi: Make usage of reset_control_acquire/release() API

Patrisious Haddad (1):
      net/mlx5: Fix return value when searching for existing flow group

Pauli Virtanen (1):
      Bluetooth: hci_core: fix list_for_each_entry_rcu usage

Paulo Alcantara (1):
      smb: client: fix perf regression with deferred closes

Penglei Jiang (1):
      io_uring: fix use-after-free of sq->thread in __io_uring_show_fdinfo(=
)

Peter Oberparleiter (1):
      scsi: s390: zfcp: Ensure synchronous unit_add

Philipp Kerling (1):
      smb: client: disable path remapping with POSIX extensions

Rafael J. Wysocki (5):
      intel_idle: Use subsys_initcall_sync() for initialization
      x86/smp: PM/hibernate: Split arch_resume_nosmt()
      intel_idle: Rescan "dead" SMT siblings during initialization
      ACPI: processor: Rescan "dead" SMT siblings during initialization
      Reapply "x86/smp: Eliminate mwait_play_dead_cpuid_hint()"

Rajashekhar M A (1):
      scsi: error: alua: I/O errors for ALUA state transitions

Randy Dunlap (1):
      scatterlist: fix extraneous '@'-sign kernel-doc notation

Ritesh Harjani (IBM) (1):
      powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap

Robert Malz (2):
      i40e: return false from i40e_reset_vf if reset is in progress
      i40e: retry VFLR handling if there is ongoing VF reset

Rodrigo Gobbi (1):
      wifi: ath11k: validate ath11k_crypto_mode on top of
ath11k_core_qmi_firmware_ready

Ryan Roberts (1):
      mm: close theoretical race where stale TLB entries could linger

Sami Tolvanen (1):
      gendwarfksyms: Fix structure type overrides

Sanjeev Yadav (1):
      scsi: core: ufs: Fix a hang in the error handler

Sebastian Gottschall (1):
      wil6210: fix support for sparrow chipsets

Sebastian Ott (4):
      KVM: arm64: selftests: Fix help text for arch_timer_edge_cases
      KVM: arm64: selftests: Fix thread migration in arch_timer_edge_cases
      KVM: arm64: selftests: Fix xVAL init in arch_timer_edge_cases
      KVM: arm64: selftests: Determine effective counter width in
arch_timer_edge_cases

Shahar Shitrit (1):
      net/mlx5e: Fix number of lanes to UNKNOWN when using data_rate_oper

Stanislav Fomichev (1):
      MAINTAINERS: Add myself as bpf networking reviewer

Steven Rostedt (1):
      tracing: Do not free "head" on error path of
filter_free_subsystem_filters()

Suleiman Souhlal (1):
      tools/resolve_btfids: Fix build when cross compiling kernel with clan=
g.

Thangaraj Samynathan (1):
      spi: spi-pci1xxxx: Drop MSI-X usage as unsupported by DMA engine

Thomas Huth (2):
      ARC: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      ARC: Replace __ASSEMBLY__ with __ASSEMBLER__ in the non-uapi headers

Thomas Wei=C3=9Fschuh (1):
      uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again

Uros Bizjak (2):
      ACPI: PAD: Update arguments of mwait_idle_with_hints()
      intel_idle: Update arguments of mwait_idle_with_hints()

Viresh Kumar (4):
      cpufreq: Convert `/// SAFETY` lines to `# Safety` sections
      rust: cpu: Introduce CpuId abstraction
      rust: Use CpuId in place of raw CPU numbers
      rust: cpu: Add CpuId::current() to retrieve current CPU ID

Vlad Dogaru (2):
      net/mlx5: HWS, Init mutex on the correct path
      net/mlx5: HWS, make sure the uplink is the last destination

Wei Fang (1):
      net: enetc: fix the netc-lib driver build dependency

Wentao Guan (1):
      ACPI: resource: Use IRQ override on MACHENIKE 16P

Wojciech Slenska (1):
      pinctrl: qcom: pinctrl-qcm2290: Add missing pins

Yevgeny Kliteynik (1):
      net/mlx5: HWS, fix missing ip_version handling in definer

Yu-Chun Lin (1):
      ARC: unwind: Use built-in sort swap to reduce code size and
improve performance

Yunhui Cui (1):
      ACPI: CPPC: Fix NULL pointer dereference when nosmp is used

Zilin Guan (1):
      wifi: cfg80211: use kfree_sensitive() for connkeys cleanup

wangfushuai (1):
      docs: proc: update VmFlags documentation in smaps
