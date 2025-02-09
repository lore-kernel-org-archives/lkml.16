Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20222F38D
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134850; cv=none; b=A3NIE8uZQIRwLWUxsc5YzutW2jpjMGGbRngqMZkfxhXzNU7/wCguD/PajS6YJg7xrRdM968o6BroEQ7DLTa4/Q32I520RANgHksJiOr74xXNMEOL5lzgf96Kb/0SqSifp2PZk5RG4C0xwoCZxgrjGO+0HdYZBRrAkxYt4kZztdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134850; c=relaxed/simple;
	bh=XuPmAmPATaj7l+3TlrHivscWdmhFwgxZ3rKElGWQUgU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=I/M3KbEXMzfascqRdy3aL4k8mQNov3oZse+B3gYC0ssDVpcWiOvms802ZhtVw67/1A0PlYemNjesiXXQGrQBcEMip5z3afZM4jMMSL50tn7a4jfDfOgzRI7tRKbaOyHI8Ln2zBMPu+UVWt5XvFRzvg9YIWxt5Tyw0YAkRLJ+Vb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JSpBgjqG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JSpBgjqG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so5991757a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739134846; x=1739739646; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gz6eYuZ+xXQv7K+9UWrPYa97qhuI1dM3a0ygyjnwFQA=;
        b=JSpBgjqGl5JGvADmGk4H5Y858gj2mZbFzEJ9P8JK44R3MUkXFpX4+bp2zh6mKN4Hl9
         mZTEdKkVBMOBqoiDYbdGxmFoKOfwkd3MTV0EJmjqsLw3BE8yCK8ETEfHvhoDD+JHLbgH
         lyNbbv7vFfvPnvygJKZc1cA2qqL4GkP9+bMDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739134846; x=1739739646;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz6eYuZ+xXQv7K+9UWrPYa97qhuI1dM3a0ygyjnwFQA=;
        b=dd6tZMJYXzTe05yhCu+mvI6ZJ3qBsUXeBY3HKbaGZKdIspNYTbsh6nlW8WVeMT8de9
         7km4hMSHkCRTCpDC877qIlSvPofzFOaUCdWrf31ijTREDvo7rD47RYGibvjSFG8/f1p4
         UP8l8/UN+EnTNV4fh+qQqzLgw7A7XH9LTuyRMArp9Z3KeqQKwKaDZKDc+7mPrusATioe
         uZDCrEGfdX9r7MgCCLS7wfQm1aPgzMfR2y+jT8smo2RBtxBbRw3j1cpaQReOsCwLk43E
         8kUQqlI5ngc75Yj7jSDSgb/aVpTxV1TYwvnRDBBfU0JTAFdj0xt1OwRlnGO9sKABeE/c
         OT1w==
X-Gm-Message-State: AOJu0YzNvCDwvsvAZuG6fhOHISIRUL0ifGQuh8TKHfLf1gvC81cG2C3V
	1ni9kh6rnwemZp9iXXULNhWtP7RYM9ldgS/PbwLQ8YlJDJiRqXdumK1r2K1ks/gJIKVoKOyAh6a
	K9wQ=
X-Gm-Gg: ASbGnctcmcxasWn9V0ao+yG+hORZvxpo2ZNwpkBzRBSKst5hjqtIo7RQwd52w5LO1d4
	Tq0jFiNqM/E5Ls8bcSaEYDcyUTR8y88mIuCRGmxkY4BKB1XwNKnpL3Ec9EGbX+szs1gOL7BPhQw
	AYv3jgc3o2phP0Jmh8IoXkXIpk5l/882OBs1P1h2M6CSZKUHzx4ebBu53g4g9bOYCKsl+GZf65/
	oJbT2S+fcIZ54ySy9EZ0+meBcr0IL7zzUfowdlR7rT2RDPNaikDc9YtT8BiAKoKbTNh/t4/MxoM
	gzC33+KSYIP92u1n4rF+OBH5k/tQAFVCVv76zBwJn22350ElmEjCqmRlSrgms63iBg==
X-Google-Smtp-Source: AGHT+IHrmj63/NUCH1IjC61FIBORjsLjOpcTvrqo4Wfjw81TxAOziI8DpprEga3mMs/TosJ85y5mJg==
X-Received: by 2002:a05:6402:5290:b0:5dc:6e27:e6e8 with SMTP id 4fb4d7f45d1cf-5de450706fcmr29534040a12.24.1739134845715;
        Sun, 09 Feb 2025 13:00:45 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm3972205a12.45.2025.02.09.13.00.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 13:00:45 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab78e6edb48so330269866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 13:00:44 -0800 (PST)
X-Received: by 2002:a05:6402:2392:b0:5de:4a8b:4c9c with SMTP id
 4fb4d7f45d1cf-5de4a8b4fc4mr19918402a12.32.1739134843703; Sun, 09 Feb 2025
 13:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 13:00:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>
X-Gm-Features: AWEUYZnPi2cFj6xZZtJZ8c9SGJt9XffilQgY0lLlLomHKB50skOT6kwiqnar7Lk
Message-ID: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>
Subject: Linux 6.14-rc2
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's Sunday afternoon, and I'm releasing the usual regularly scheduled
release candidate while the rest of the US is getting ready for the
biggest day in TV commercials interrupted by some kind of lawn bowling
tournament.

With 6.14 being a fairly small release, rc2 follows suit. It's not the
smallest rc2 we've had in the 6.x series, but it's definitely on the
smaller side.

Nothing particularly odd stands out. The diffstat is a bit unusual
just because one of the bigger areas of change was some s390 kvm
cleanups. So the fact that s390 accounts for about a third of the
overall patch is certainly not very common, but it's just a result of
some code movement and the fact that most of the rest of rc2 really is
just very small fixes.

We have a similar pattern (on a much smaller scale) wrt selftests: the
tests show up in the diffstat, but it's due to trivial small fixes
that then triggered a whole new self test to be written.

Anyway, it all looks fine, please give it a try,

                  Linus

---

Aboorva Devarajan (1):
      cpufreq: prevent NULL dereference in cpufreq_online()

Al Viro (1):
      fix braino in "9p: fix ->rename_sem exclusion"

Alex Hung (1):
      drm/amd/display: Fix out-of-bound accesses

Alice Ryhl (1):
      x86: rust: set rustc-abi=3Dx86-softfloat on rustc>=3D1.86.0

Amir Goldstein (3):
      fsnotify: use accessor to set FMODE_NONOTIFY_*
      fsnotify: disable notification by default for all pseudo files
      fsnotify: disable pre-content and permission events by default

Andreas Gruenbacher (3):
      gfs2: use lockref_init for gl_lockref
      gfs2: switch to lockref_init(..., 1)
      lockref: remove count argument of lockref_init

Andr=C3=A9 Draszik (1):
      scsi: ufs: core: Fix use-after free in init error and remove paths

Andy Shevchenko (2):
      hrtimers: Mark is_migration_base() with __always_inline
      ACPI: property: Fix return value for nval =3D=3D 0 in acpi_data_prop_=
read()

Ankit Nautiyal (2):
      drm/i915/dp: fix the Adaptive sync Operation mode for SDP
      drm/i915/dp: Return min bpc supported by source instead of 0

Arnd Bergmann (1):
      cpufreq: airoha: modify CONFIG_OF dependency

Ashutosh Dixit (2):
      drm/xe/oa: Preserve oa_ctrl unused bits
      drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked

Aubrey Li (1):
      ACPI: PRM: Remove unnecessary strict handler address checks

Avri Altman (3):
      scsi: ufs: core: Simplify temperature exception event handling
      scsi: ufs: core: Ensure clk_gating.lock is used only after initializa=
tion
      scsi: ufs: Fix toggling of clk_gating.state when clock gating is
not allowed

Bao D. Nguyen (1):
      scsi: ufs: core: Fix the HIGH/LOW_TEMP Bit Definitions

Bart Van Assche (1):
      md: Fix linear_set_limits()

Bartosz Golaszewski (1):
      gpio: sim: lock hog configfs items if present

Brahmajit Das (1):
      vboxsf: fix building with GCC 15

Brian Geffon (1):
      drm/i915: Fix page cleanup on DMA remap failure

Chengen Du (1):
      iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_n=
ic()

Christian Brauner (1):
      pidfs: improve ioctl handling

Christian Loehle (1):
      sched/debug: Provide slice length for fair tasks

Christoph Hellwig (5):
      xfs: remove an out of data comment in _xfs_buf_alloc
      xfs: don't call remap_verify_area with sb write protection held
      xfs: remove xfs_buf_cache.bc_lock
      nvmet: the result field in nvmet_alloc_ctrl_args is little endian
      nvmet: add a missing endianess conversion in nvmet_execute_admin_conn=
ect

Christoph Schlameuss (1):
      KVM: s390: selftests: Streamline uc_skey test to issue iske after ssk=
e

Claudio Imbrenda (14):
      KVM: s390: wrapper for KVM_BUG
      KVM: s390: fake memslot for ucontrol VMs
      KVM: s390: selftests: fix ucontrol memory region test
      KVM: s390: move pv gmap functions into kvm
      KVM: s390: use __kvm_faultin_pfn()
      KVM: s390: get rid of gmap_fault()
      KVM: s390: get rid of gmap_translate()
      KVM: s390: move some gmap shadowing functions away from mm/gmap.c
      KVM: s390: stop using page->index for non-shadow gmaps
      KVM: s390: stop using lists to keep track of used dat tables
      KVM: s390: move gmap_shadow_pgt_lookup() into kvm
      KVM: s390: remove useless page->index usage
      KVM: s390: move PGSTE softbits
      KVM: s390: remove the last user of page->index

Colin Ian King (1):
      KVM: selftests: Fix spelling mistake "initally" -> "initially"

Cong Wang (2):
      netem: Update sch->q.qlen before qdisc_tree_reduce_backlog()
      selftests/tc-testing: Add a test case for qdisc_tree_reduce_backlog()

Daniel Wagner (4):
      nvme-fc: go straight to connecting state when initializing
      nvme: handle connectivity loss in nvme_set_queue_count
      nvme-fc: do not ignore connectivity loss during connecting
      nvme-fc: use ctrl state getter

Daniele Ceraolo Spurio (1):
      drm/i915/guc: Debug print LRC state entries only if the context is pi=
nned

David Hildenbrand (4):
      KVM: s390: vsie: fix some corner-cases when grabbing vsie pages
      KVM: s390: vsie: stop using page->index
      KVM: s390: vsie: stop messing with page refcount
      KVM: s390: vsie: stop using "struct page" for vsie page

David Howells (3):
      rxrpc: Fix the rxrpc_connection attend queue handling
      rxrpc: Fix call state set to not include the SERVER_SECURING state
      rxrpc: Fix race in call state changing vs recvmsg()

Dhananjay Ugwekar (3):
      cpufreq/amd-pstate: Remove the goto label in amd_pstate_update_limits
      cpufreq/amd-pstate: Fix max_perf updation with schedutil
      cpufreq/amd-pstate: Fix cpufreq_policy ref counting

Dmitry Kandybka (1):
      platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()

Easwar Hariharan (1):
      jiffies: Cast to unsigned long in secs_to_jiffies() conversion

Eric Dumazet (1):
      net: rose: lock the socket in rose_bind()

Eric W. Biederman (1):
      alpha/elf: Fix misc/setarch test of util-linux by removing 32bit supp=
ort

Eyal Birger (2):
      seccomp: passthrough uretprobe systemcall without filtering
      selftests/seccomp: validate uretprobe syscall passes through seccomp

Fedor Pchelkin (1):
      platform/x86: ideapad-laptop: pass a correct pointer to the driver da=
ta

Filipe Manana (4):
      btrfs: fix lockdep splat while merging a relocation root
      btrfs: fix assertion failure when splitting ordered extent after
transaction abort
      btrfs: fix use-after-free when attempting to join an aborted transact=
ion
      btrfs: avoid starting new transaction when cleaning qgroup
during subvolume drop

Florian Fainelli (1):
      net: bcmgenet: Correct overlaying of PHY and MAC Wake-on-LAN

Francis Pravin (1):
      nvme-pci: remove redundant dma frees in hmb

Frederic Weisbecker (2):
      hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_=
DYING
      timers/migration: Fix off-by-one root mis-connection

Gannon Kolding (1):
      ACPI: resource: IRQ override for Eluktronics MECH-17

Geert Uytterhoeven (5):
      dt-bindings: interrupt-controller: microchip,lan966x-oic:
Clarify endpoint use
      irqchip/lan966x-oic: Make CONFIG_LAN966X_OIC depend on
CONFIG_MCHP_LAN966X_PCI
      gpio: GPIO_GRGPIO should depend on OF
      stackinit: Fix comment for test_small_end
      genirq: Remove leading space from irq_chip::irq_print_chip() callback=
s

Georg Gottleuber (2):
      nvme-pci: Add TUXEDO InfinityFlex to Samsung sleep quirk
      nvme-pci: Add TUXEDO IBP Gen9 to Samsung sleep quirk

Guenter Roeck (1):
      drm/i915/backlight: Return immediately when scale() finds
invalid parameters

Guixin Liu (1):
      scsi: target: core: Add line break to status show

Gustavo Sousa (1):
      drm/print: Include drm_device.h

Hans Verkuil (1):
      gpu: drm_dp_cec: fix broken CEC adapter properties check

Haoxiang Li (1):
      drm/komeda: Add check for komeda_get_layer_fourcc_list()

Hector Martin (1):
      MAINTAINERS: Remove myself

Ido Schimmel (1):
      net: sched: Fix truncation of offloaded action statistics

Igor Pylypiv (1):
      scsi: core: Do not retry I/Os during depopulation

Ilpo J=C3=A4rvinen (1):
      PCI/ASPM: Fix L1SS saving

Jacek Lawrynowicz (3):
      accel/ivpu: Fix error handling in ivpu_boot()
      accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get() fai=
ls
      accel/ivpu: Fix error handling in recovery/reset

Jacob Moroni (1):
      net: atlantic: fix warning during hot unplug

Jakub Kicinski (12):
      net: ipv6: fix dst refleaks in rpl, seg6 and ioam6 lwtunnels
      net: ipv6: fix dst ref loops in rpl, seg6 and ioam6 lwtunnels
      MAINTAINERS: list openvswitch docs under its entry
      MAINTAINERS: add Kuniyuki Iwashima to TCP reviewers
      MAINTAINERS: add a general entry for BSD sockets
      MAINTAINERS: add entry for UNIX sockets
      ethtool: rss: fix hiding unsupported fields in dumps
      ethtool: ntuple: fix rss + ring_cookie check
      selftests: drv-net: rss_ctx: add missing cleanup in queue reconfigure
      selftests: drv-net: rss_ctx: don't fail reconfigure test if
queue offset not supported
      MAINTAINERS: add entry for ethtool
      MAINTAINERS: add a sample ethtool section entry

Jani Nikula (2):
      drm/i915/dp: Iterate DSC BPP from high to low on all platforms
      drm/i915/dp: Fix potential infinite loop in 128b/132b SST

Jens Axboe (1):
      futex: Pass in task to futex_queue()

Jeongjun Park (2):
      bcachefs: fix incorrect pointer check in __bch2_subvolume_delete()
      bcachefs: fix deadlock in journal_entry_open()

Jiasheng Jiang (1):
      ice: Add check for devm_kzalloc()

Jinliang Zheng (1):
      xfs: fix the entry condition of exact EOF block allocation optimizati=
on

Jithu Joseph (1):
      platform/x86/intel/ifs: Update documentation with image download path

Joe Hattori (1):
      powercap: call put_device() on an error path in
powercap_register_control_type()

Juergen Gross (3):
      x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
      x86/xen: add FRAME_END to xen_hypercall_hvm()
      x86/xen: remove unneeded dummy push from xen_hypercall_hvm()

Justin M. Forbes (1):
      rust: kbuild: add -fzero-init-padding-bits to bindgen_skip_cflags

K Prateek Nayak (1):
      sched/fair: Fix inaccurate h_nr_runnable accounting with delayed dequ=
eue

Kees Cook (4):
      stackinit: Keep selftest union size small on m68k
      compiler.h: Move C string helpers into C-only kernel section
      compiler.h: Introduce __must_be_byte_array()
      string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()

Keith Busch (2):
      nvmet: fix rw control endian access
      nvme: make nvme_tls_attrs_group static

Kent Overstreet (4):
      bcachefs docs: SubmittingPatches.rst
      bcachefs: Fix discard path journal flushing
      bcachefs: Fix rcu imbalance in bch2_fs_btree_key_cache_exit()
      bcachefs: bch2_bkey_sectors_need_rebalance() now only depends on
bch_extent_rebalance

Lenny Szubowicz (1):
      tg3: Disable tg3 PCIe AER on system reboot

Lifeng Zheng (1):
      cpufreq/amd-pstate: Fix per-policy boost flag incorrect when fail

Linus Torvalds (1):
      Linux 6.14-rc2

Lo-an Chen (1):
      drm/amd/display: Fix seamless boot sequence

Lokesh Vutla (1):
      KVM: arm64: Flush hyp bss section after initialization of variables i=
n bss

Long Li (1):
      scsi: storvsc: Set correct data length for sending SCSI command
without payload

Lucas De Marchi (2):
      drm/xe/devcoredump: Move exec queue snapshot to Contexts section
      drm/xe: Fix and re-enable xe_print_blob_ascii85()

Maciej Fijalkowski (3):
      ice: put Rx buffers after being done with current frame
      ice: gather page_count()'s of each frag right before XDP prog call
      ice: stop storing XDP verdict within ice_rx_buf

Madhavan Srinivasan (1):
      selftests: livepatch: handle PRINTK_CALLER in check_result()

Magnus Lindholm (1):
      scsi: qla1280: Fix kernel oops when debug level > 2

Marc Zyngier (4):
      KVM: arm64: Fix nested S2 MMU structures reallocation
      KVM: arm64: timer: Always evaluate the need for a soft timer
      KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_EC=
V
      KVM: arm64: timer: Don't adjust the EL2 virtual timer offset

Marek Ol=C5=A1=C3=A1k (1):
      drm/amdgpu: add a BO metadata flag to disable write compression for V=
ulkan

Mario Limonciello (1):
      accel/amdxdna: Add MODULE_FIRMWARE() declarations

Mark Tomlinson (1):
      gpio: pca953x: Improve interrupt support

Masahiro Yamada (1):
      kbuild: keep symbols for symbol_get() even with CONFIG_TRIM_UNUSED_KS=
YMS

Mateusz Guzik (1):
      vfs: sanity check the length passed to inode_set_cached_link()

Matthew Maurer (1):
      rust: kbuild: do not export generated KASAN ODR symbols

Matthieu Baerts (NGI0) (1):
      selftests: mptcp: connect: -f: no reconnect

Meetakshi Setiya (1):
      smb: client: change lease epoch type from unsigned int to __u16

Michal Wajdeczko (1):
      drm/xe/pf: Fix migration initialization

Miguel Ojeda (1):
      rust: init: use explicit ABI to clean warning in future compilers

Mika Westerberg (1):
      MAINTAINERS: Use my kernel.org address for ACPI GPIO work

Mike Christie (1):
      scsi: core: Add passthrough tests for success and no failure definiti=
ons

Miklos Szeredi (3):
      statmount: let unset strings be empty
      fs: fix adding security options to statmount.mnt_opt
      selftests: always check mask returned by statmount(2)

Nathan Chancellor (4):
      x86/boot: Use '-std=3Dgnu11' to fix build with GCC 15
      drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml files
      scripts/Makefile.extrawarn: Do not show clang's non-kprintf
warnings at W=3D1
      kbuild: Move -Wenum-enum-conversion to W=3D2

Nick Chan (1):
      irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured s=
o

Oleh Zadorozhnyi (1):
      kbuild: fix misspelling in scripts/Makefile.lib

Oliver Upton (2):
      KVM: arm64: Flush/sync debug state in protected mode
      KVM: arm64: Fail protected mode init if no vgic hardware is present

Paolo Abeni (1):
      net: harmonize tstats and dstats

Paolo Bonzini (2):
      kvm: x86: SRSO_USER_KERNEL_NO is not synthesized
      KVM: remove kvm_arch_post_init_vm

Paulo Alcantara (3):
      smb: client: don't trust DFSREF_STORAGE_SERVER bit
      smb: client: fix noisy when tree connecting to DFS interlink targets
      smb: client: get rid of kstrdup() in get_ses_refpath()

Pavel Machek (1):
      MAINTAINERS: Move Pavel to kernel.org address

Prasad Pandit (1):
      firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry

Qu Wenruo (1):
      btrfs: do not output error message if a qgroup has been already clean=
ed up

Quang Le (2):
      pfifo_tail_enqueue: Drop new packet when sch->limit =3D=3D 0
      selftests/tc-testing: Add a test case for pfifo_head_drop qdisc
when limit=3D=3D0

Rafael J. Wysocki (1):
      PM: sleep: core: Restrict power.set_active propagation

Rik van Riel (1):
      scsi: core: Use GFP_NOIO to avoid circular locking dependency

Robin Murphy (1):
      PCI/TPH: Restore TPH Requester Enable correctly

Russell King (Oracle) (1):
      Revert "net: stmmac: Specify hardware capability value when FIFO
size isn't specified"

Sagi Grimberg (1):
      nvmet: fix a memory leak in controller identify

Sankararaman Jayaraman (1):
      vmxnet3: Fix tx queue race condition with XDP

Sean Christopherson (2):
      KVM: Do not restrict the size of KVM-internal memory regions
      KVM: x86/mmu: Ensure NX huge page recovery thread is alive before wak=
ing

Seunghui Lee (1):
      scsi: ufs: core: Fix error return with query response

Stefan Eichenberger (1):
      irqchip/irq-mvebu-icu: Fix access to msi_data from irq_domain::host_d=
ata

Stephen Rothwell (1):
      drivers/block/sunvdc.c: update the correct AIP call

Steven Rostedt (1):
      fgraph: Fix set_graph_notrace with setting TRACE_GRAPH_NOTRACE_BIT

Su Hui (1):
      fs/stat.c: avoid harmless garbage value problem in vfs_statx_path()

Suraj Kandpal (2):
      drm/i915/hdcp: Fix Repeater authentication during topology change
      drm/i915/hdcp: Use correct function to check if encoder is HDMI

Tamir Duberstein (1):
      rust: kbuild: use host dylib naming in rusttestlib-kernel

Thomas Zimmermann (1):
      drm/ast: astdp: Fix timeout for enabling video signal

Tom Chung (1):
      Revert "drm/amd/display: Use HW lock mgr for PSR1"

Umesh Nerlige Ramappa (1):
      drm/i915/pmu: Fix zero delta busyness issue

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes

Waiman Long (2):
      clocksource: Use pr_info() for "Checking clocksource
synchronization" message
      clocksource: Use migrate_disable() to avoid calling
get_random_u32() in atomic context

WangYuli (1):
      kbuild: install-extmod-build: add missing quotation marks for CC vari=
able

Wentao Liang (2):
      xfs: Propagate errors from xfs_reflink_cancel_cow_range in
xfs_dax_write_iomap_end
      xfs: Add error handling for xfs_reflink_cancel_cow_range

Willem de Bruijn (1):
      tun: revert fix group permission check

Wolfram Sang (2):
      Revert "i2c: Replace list-based mechanism for handling
userspace-created clients"
      Revert "i2c: Replace list-based mechanism for handling
auto-detected clients"

Xu Lu (1):
      irqchip/riscv: Ensure ordering of memory writes and IPI writes

Yan Zhai (1):
      udp: gso: do not drop small packets when PMTU reduces

Yu-Chun Lin (1):
      kthread: Fix return value on kzalloc() failure in
kthread_affine_preferred()
