Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6A192D7E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184455; cv=none; b=aGF7uvayLntyREw34Wik16u8B5C5aVek0AekJ680H4e80H0Y33ApUhXHkYqISiomoRAPnLQJP/0zy0aHIK0SKodiWBRo854a01zNSOAFwFCkXbXxJd5qPYd2uK30EAtTvz2uiJkMHGSx6GnNSg3kbeTvmI8fk72avm0OvEBM77s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184455; c=relaxed/simple;
	bh=RyDdPLJAJx5lq8duL1JiMZTQ/WS5GK+BEUrGt6x5Qoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXQDTqYTEwDMBobudLAZtYdFZet19Lc06Pw8C3agh1Szsj4ux23NcgNQeDCSAzGkODeQoDCK8GrtBe0qYzZ4aCYuH1pa2uDKxizIFK5pNUVB8gouz333WENR7WyOQolzflW/kANYso3DQoDm21jNI1zK9NP44JGf6Hlwf8xvs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3ZXAEFv; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3ZXAEFv"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5fc13355a5bso2136288eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739184452; x=1739789252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPjc19+IbH1zEU9yAY5Xx0kNMjcj6pnO65lz66CPdCw=;
        b=A3ZXAEFvL+un7aQrUndmwutXlffwedpZe4WunQ85+YuOoeHlYOlfKOobkScE+giS66
         DYOT0nae9ADOlqPY2KeUg4OqFe4dJsMKU0yqfQuGqHMUOEcP9e08H8B12JP6ftzi0NFX
         19fxCA6eYJbcv5UfJVbRGbjaTGRUN364Nx303YeEEFgUeOKf/3q3Cab/tDv6jVyNzX/c
         rFHOpYYFGBT0Mc0LftgoZYaEorzHOgymodIg0llXts1I1orDSgxIGXzKjnXdU5VZ2L2Q
         yj6sJfNs1n7LLVANFr/2CxkCKHeNFVDb+ap028Z24HmEfUoL9TBA4T/Y5Q8afP1XT2VN
         I7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184452; x=1739789252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPjc19+IbH1zEU9yAY5Xx0kNMjcj6pnO65lz66CPdCw=;
        b=BejqCjt0ANhA9/It4VL5fGjVOLWwqkLwjKjuZx01SNLCWagSP9J35fCfDOnEJrX1SG
         91EZ2c0ZQvgV01sMQCLqnTRnjiNSD3JO9XaDcacFqeKEJftitqYET/W8z0snkoT8AuTA
         oW2lRO/OcIKd9Jz1ojyapQ8N0V03T3O5jB4WiXMIzcmKL6OiPbAQjx+r9rZ1Dpsx++ou
         Xwa70WK/nxLw65YfvQDYo1q+9mSYWQqZTZ6xniM2UXGZdjHw45Xfu7SlpJGa74rihInh
         3Xtnzy4ioUb5m3wDxrCkuM/LhA3hIMeZvERRwWNl27FOiwK1Bw6UFZzxRKjO3PmIpAuA
         G5hw==
X-Gm-Message-State: AOJu0Yyw/AfbBwy9G7fwZEgZ0fwhXcW9IFKDqflcONpc2QipKDGZDrr8
	JrksFcQpm2gpS5/IG/7kOElORk7Qz1iNN4BzkzlrsjnnanOOuJJKE4OJqNos6Y8xvCB3wYnQtNF
	SRqJhUUviQq2n+la5a/CNgQNFAys=
X-Gm-Gg: ASbGncu1gBaZbwxiWSBv9Q+YHr8YGMEKqOdn7PzQN+sZUeKKVkN1VDNhnwFE5IGJj1f
	Elm23uTEHTizLYWzFA03bm77k7w7jsg32Cl5mmoy0xDMkjVOT9CfNczIq2wOMVhKRmP0Ej6S6WJ
	Kmkr+QILev59I=
X-Google-Smtp-Source: AGHT+IFGe2JQb0rI3ilhPmU1DQVnT38kGb7hUndb3Rlmw0z11tQxGL+6XkGhBmpdlpiBdt7o4yMMSEoUP/FRoDSh/Bg=
X-Received: by 2002:a05:6871:291:b0:296:e698:3227 with SMTP id
 586e51a60fabf-2b83ef86d8dmr8354541fac.36.1739184451614; Mon, 10 Feb 2025
 02:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>
In-Reply-To: <CAHk-=wiGR6aB2oE7VsDkpnSbHaUnxVqtMvcEB0JzdvS-YmT_Lg@mail.gmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 10 Feb 2025 11:47:18 +0100
X-Gm-Features: AWEUYZkaR86g6AAens3bA_jIX-eKD3o5nnWIZ4SF8svN09owCCESH478L5lvDmE
Message-ID: <CADo9pHiVf1M63M46mYx7TCQ9HeLsf6hY6da7MUAX1AAwFYfAVg@mail.gmail.com>
Subject: Re: Linux 6.14-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Luna Jernberg <droidbittin@gmail.com>, 
	Mikael Eriksson <mikael_eriksson@miffe.org>, Jan Alexander Steffens <heftig@archlinux.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey!

This solved the problem i had with my MicroSD card reader on my Dell
Latitude 7390 laptop not showing up with 6.14-rc1, but now it works
again

Den s=C3=B6n 9 feb. 2025 kl 22:00 skrev Linus Torvalds
<torvalds@linux-foundation.org>:
>
> It's Sunday afternoon, and I'm releasing the usual regularly scheduled
> release candidate while the rest of the US is getting ready for the
> biggest day in TV commercials interrupted by some kind of lawn bowling
> tournament.
>
> With 6.14 being a fairly small release, rc2 follows suit. It's not the
> smallest rc2 we've had in the 6.x series, but it's definitely on the
> smaller side.
>
> Nothing particularly odd stands out. The diffstat is a bit unusual
> just because one of the bigger areas of change was some s390 kvm
> cleanups. So the fact that s390 accounts for about a third of the
> overall patch is certainly not very common, but it's just a result of
> some code movement and the fact that most of the rest of rc2 really is
> just very small fixes.
>
> We have a similar pattern (on a much smaller scale) wrt selftests: the
> tests show up in the diffstat, but it's due to trivial small fixes
> that then triggered a whole new self test to be written.
>
> Anyway, it all looks fine, please give it a try,
>
>                   Linus
>
> ---
>
> Aboorva Devarajan (1):
>       cpufreq: prevent NULL dereference in cpufreq_online()
>
> Al Viro (1):
>       fix braino in "9p: fix ->rename_sem exclusion"
>
> Alex Hung (1):
>       drm/amd/display: Fix out-of-bound accesses
>
> Alice Ryhl (1):
>       x86: rust: set rustc-abi=3Dx86-softfloat on rustc>=3D1.86.0
>
> Amir Goldstein (3):
>       fsnotify: use accessor to set FMODE_NONOTIFY_*
>       fsnotify: disable notification by default for all pseudo files
>       fsnotify: disable pre-content and permission events by default
>
> Andreas Gruenbacher (3):
>       gfs2: use lockref_init for gl_lockref
>       gfs2: switch to lockref_init(..., 1)
>       lockref: remove count argument of lockref_init
>
> Andr=C3=A9 Draszik (1):
>       scsi: ufs: core: Fix use-after free in init error and remove paths
>
> Andy Shevchenko (2):
>       hrtimers: Mark is_migration_base() with __always_inline
>       ACPI: property: Fix return value for nval =3D=3D 0 in acpi_data_pro=
p_read()
>
> Ankit Nautiyal (2):
>       drm/i915/dp: fix the Adaptive sync Operation mode for SDP
>       drm/i915/dp: Return min bpc supported by source instead of 0
>
> Arnd Bergmann (1):
>       cpufreq: airoha: modify CONFIG_OF dependency
>
> Ashutosh Dixit (2):
>       drm/xe/oa: Preserve oa_ctrl unused bits
>       drm/xe/oa: Set stream->pollin in xe_oa_buffer_check_unlocked
>
> Aubrey Li (1):
>       ACPI: PRM: Remove unnecessary strict handler address checks
>
> Avri Altman (3):
>       scsi: ufs: core: Simplify temperature exception event handling
>       scsi: ufs: core: Ensure clk_gating.lock is used only after initiali=
zation
>       scsi: ufs: Fix toggling of clk_gating.state when clock gating is
> not allowed
>
> Bao D. Nguyen (1):
>       scsi: ufs: core: Fix the HIGH/LOW_TEMP Bit Definitions
>
> Bart Van Assche (1):
>       md: Fix linear_set_limits()
>
> Bartosz Golaszewski (1):
>       gpio: sim: lock hog configfs items if present
>
> Brahmajit Das (1):
>       vboxsf: fix building with GCC 15
>
> Brian Geffon (1):
>       drm/i915: Fix page cleanup on DMA remap failure
>
> Chengen Du (1):
>       iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show=
_nic()
>
> Christian Brauner (1):
>       pidfs: improve ioctl handling
>
> Christian Loehle (1):
>       sched/debug: Provide slice length for fair tasks
>
> Christoph Hellwig (5):
>       xfs: remove an out of data comment in _xfs_buf_alloc
>       xfs: don't call remap_verify_area with sb write protection held
>       xfs: remove xfs_buf_cache.bc_lock
>       nvmet: the result field in nvmet_alloc_ctrl_args is little endian
>       nvmet: add a missing endianess conversion in nvmet_execute_admin_co=
nnect
>
> Christoph Schlameuss (1):
>       KVM: s390: selftests: Streamline uc_skey test to issue iske after s=
ske
>
> Claudio Imbrenda (14):
>       KVM: s390: wrapper for KVM_BUG
>       KVM: s390: fake memslot for ucontrol VMs
>       KVM: s390: selftests: fix ucontrol memory region test
>       KVM: s390: move pv gmap functions into kvm
>       KVM: s390: use __kvm_faultin_pfn()
>       KVM: s390: get rid of gmap_fault()
>       KVM: s390: get rid of gmap_translate()
>       KVM: s390: move some gmap shadowing functions away from mm/gmap.c
>       KVM: s390: stop using page->index for non-shadow gmaps
>       KVM: s390: stop using lists to keep track of used dat tables
>       KVM: s390: move gmap_shadow_pgt_lookup() into kvm
>       KVM: s390: remove useless page->index usage
>       KVM: s390: move PGSTE softbits
>       KVM: s390: remove the last user of page->index
>
> Colin Ian King (1):
>       KVM: selftests: Fix spelling mistake "initally" -> "initially"
>
> Cong Wang (2):
>       netem: Update sch->q.qlen before qdisc_tree_reduce_backlog()
>       selftests/tc-testing: Add a test case for qdisc_tree_reduce_backlog=
()
>
> Daniel Wagner (4):
>       nvme-fc: go straight to connecting state when initializing
>       nvme: handle connectivity loss in nvme_set_queue_count
>       nvme-fc: do not ignore connectivity loss during connecting
>       nvme-fc: use ctrl state getter
>
> Daniele Ceraolo Spurio (1):
>       drm/i915/guc: Debug print LRC state entries only if the context is =
pinned
>
> David Hildenbrand (4):
>       KVM: s390: vsie: fix some corner-cases when grabbing vsie pages
>       KVM: s390: vsie: stop using page->index
>       KVM: s390: vsie: stop messing with page refcount
>       KVM: s390: vsie: stop using "struct page" for vsie page
>
> David Howells (3):
>       rxrpc: Fix the rxrpc_connection attend queue handling
>       rxrpc: Fix call state set to not include the SERVER_SECURING state
>       rxrpc: Fix race in call state changing vs recvmsg()
>
> Dhananjay Ugwekar (3):
>       cpufreq/amd-pstate: Remove the goto label in amd_pstate_update_limi=
ts
>       cpufreq/amd-pstate: Fix max_perf updation with schedutil
>       cpufreq/amd-pstate: Fix cpufreq_policy ref counting
>
> Dmitry Kandybka (1):
>       platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
>
> Easwar Hariharan (1):
>       jiffies: Cast to unsigned long in secs_to_jiffies() conversion
>
> Eric Dumazet (1):
>       net: rose: lock the socket in rose_bind()
>
> Eric W. Biederman (1):
>       alpha/elf: Fix misc/setarch test of util-linux by removing 32bit su=
pport
>
> Eyal Birger (2):
>       seccomp: passthrough uretprobe systemcall without filtering
>       selftests/seccomp: validate uretprobe syscall passes through seccom=
p
>
> Fedor Pchelkin (1):
>       platform/x86: ideapad-laptop: pass a correct pointer to the driver =
data
>
> Filipe Manana (4):
>       btrfs: fix lockdep splat while merging a relocation root
>       btrfs: fix assertion failure when splitting ordered extent after
> transaction abort
>       btrfs: fix use-after-free when attempting to join an aborted transa=
ction
>       btrfs: avoid starting new transaction when cleaning qgroup
> during subvolume drop
>
> Florian Fainelli (1):
>       net: bcmgenet: Correct overlaying of PHY and MAC Wake-on-LAN
>
> Francis Pravin (1):
>       nvme-pci: remove redundant dma frees in hmb
>
> Frederic Weisbecker (2):
>       hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMER=
S_DYING
>       timers/migration: Fix off-by-one root mis-connection
>
> Gannon Kolding (1):
>       ACPI: resource: IRQ override for Eluktronics MECH-17
>
> Geert Uytterhoeven (5):
>       dt-bindings: interrupt-controller: microchip,lan966x-oic:
> Clarify endpoint use
>       irqchip/lan966x-oic: Make CONFIG_LAN966X_OIC depend on
> CONFIG_MCHP_LAN966X_PCI
>       gpio: GPIO_GRGPIO should depend on OF
>       stackinit: Fix comment for test_small_end
>       genirq: Remove leading space from irq_chip::irq_print_chip() callba=
cks
>
> Georg Gottleuber (2):
>       nvme-pci: Add TUXEDO InfinityFlex to Samsung sleep quirk
>       nvme-pci: Add TUXEDO IBP Gen9 to Samsung sleep quirk
>
> Guenter Roeck (1):
>       drm/i915/backlight: Return immediately when scale() finds
> invalid parameters
>
> Guixin Liu (1):
>       scsi: target: core: Add line break to status show
>
> Gustavo Sousa (1):
>       drm/print: Include drm_device.h
>
> Hans Verkuil (1):
>       gpu: drm_dp_cec: fix broken CEC adapter properties check
>
> Haoxiang Li (1):
>       drm/komeda: Add check for komeda_get_layer_fourcc_list()
>
> Hector Martin (1):
>       MAINTAINERS: Remove myself
>
> Ido Schimmel (1):
>       net: sched: Fix truncation of offloaded action statistics
>
> Igor Pylypiv (1):
>       scsi: core: Do not retry I/Os during depopulation
>
> Ilpo J=C3=A4rvinen (1):
>       PCI/ASPM: Fix L1SS saving
>
> Jacek Lawrynowicz (3):
>       accel/ivpu: Fix error handling in ivpu_boot()
>       accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get() f=
ails
>       accel/ivpu: Fix error handling in recovery/reset
>
> Jacob Moroni (1):
>       net: atlantic: fix warning during hot unplug
>
> Jakub Kicinski (12):
>       net: ipv6: fix dst refleaks in rpl, seg6 and ioam6 lwtunnels
>       net: ipv6: fix dst ref loops in rpl, seg6 and ioam6 lwtunnels
>       MAINTAINERS: list openvswitch docs under its entry
>       MAINTAINERS: add Kuniyuki Iwashima to TCP reviewers
>       MAINTAINERS: add a general entry for BSD sockets
>       MAINTAINERS: add entry for UNIX sockets
>       ethtool: rss: fix hiding unsupported fields in dumps
>       ethtool: ntuple: fix rss + ring_cookie check
>       selftests: drv-net: rss_ctx: add missing cleanup in queue reconfigu=
re
>       selftests: drv-net: rss_ctx: don't fail reconfigure test if
> queue offset not supported
>       MAINTAINERS: add entry for ethtool
>       MAINTAINERS: add a sample ethtool section entry
>
> Jani Nikula (2):
>       drm/i915/dp: Iterate DSC BPP from high to low on all platforms
>       drm/i915/dp: Fix potential infinite loop in 128b/132b SST
>
> Jens Axboe (1):
>       futex: Pass in task to futex_queue()
>
> Jeongjun Park (2):
>       bcachefs: fix incorrect pointer check in __bch2_subvolume_delete()
>       bcachefs: fix deadlock in journal_entry_open()
>
> Jiasheng Jiang (1):
>       ice: Add check for devm_kzalloc()
>
> Jinliang Zheng (1):
>       xfs: fix the entry condition of exact EOF block allocation optimiza=
tion
>
> Jithu Joseph (1):
>       platform/x86/intel/ifs: Update documentation with image download pa=
th
>
> Joe Hattori (1):
>       powercap: call put_device() on an error path in
> powercap_register_control_type()
>
> Juergen Gross (3):
>       x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
>       x86/xen: add FRAME_END to xen_hypercall_hvm()
>       x86/xen: remove unneeded dummy push from xen_hypercall_hvm()
>
> Justin M. Forbes (1):
>       rust: kbuild: add -fzero-init-padding-bits to bindgen_skip_cflags
>
> K Prateek Nayak (1):
>       sched/fair: Fix inaccurate h_nr_runnable accounting with delayed de=
queue
>
> Kees Cook (4):
>       stackinit: Keep selftest union size small on m68k
>       compiler.h: Move C string helpers into C-only kernel section
>       compiler.h: Introduce __must_be_byte_array()
>       string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()
>
> Keith Busch (2):
>       nvmet: fix rw control endian access
>       nvme: make nvme_tls_attrs_group static
>
> Kent Overstreet (4):
>       bcachefs docs: SubmittingPatches.rst
>       bcachefs: Fix discard path journal flushing
>       bcachefs: Fix rcu imbalance in bch2_fs_btree_key_cache_exit()
>       bcachefs: bch2_bkey_sectors_need_rebalance() now only depends on
> bch_extent_rebalance
>
> Lenny Szubowicz (1):
>       tg3: Disable tg3 PCIe AER on system reboot
>
> Lifeng Zheng (1):
>       cpufreq/amd-pstate: Fix per-policy boost flag incorrect when fail
>
> Linus Torvalds (1):
>       Linux 6.14-rc2
>
> Lo-an Chen (1):
>       drm/amd/display: Fix seamless boot sequence
>
> Lokesh Vutla (1):
>       KVM: arm64: Flush hyp bss section after initialization of variables=
 in bss
>
> Long Li (1):
>       scsi: storvsc: Set correct data length for sending SCSI command
> without payload
>
> Lucas De Marchi (2):
>       drm/xe/devcoredump: Move exec queue snapshot to Contexts section
>       drm/xe: Fix and re-enable xe_print_blob_ascii85()
>
> Maciej Fijalkowski (3):
>       ice: put Rx buffers after being done with current frame
>       ice: gather page_count()'s of each frag right before XDP prog call
>       ice: stop storing XDP verdict within ice_rx_buf
>
> Madhavan Srinivasan (1):
>       selftests: livepatch: handle PRINTK_CALLER in check_result()
>
> Magnus Lindholm (1):
>       scsi: qla1280: Fix kernel oops when debug level > 2
>
> Marc Zyngier (4):
>       KVM: arm64: Fix nested S2 MMU structures reallocation
>       KVM: arm64: timer: Always evaluate the need for a soft timer
>       KVM: arm64: timer: Correctly handle EL1 timer emulation when !FEAT_=
ECV
>       KVM: arm64: timer: Don't adjust the EL2 virtual timer offset
>
> Marek Ol=C5=A1=C3=A1k (1):
>       drm/amdgpu: add a BO metadata flag to disable write compression for=
 Vulkan
>
> Mario Limonciello (1):
>       accel/amdxdna: Add MODULE_FIRMWARE() declarations
>
> Mark Tomlinson (1):
>       gpio: pca953x: Improve interrupt support
>
> Masahiro Yamada (1):
>       kbuild: keep symbols for symbol_get() even with CONFIG_TRIM_UNUSED_=
KSYMS
>
> Mateusz Guzik (1):
>       vfs: sanity check the length passed to inode_set_cached_link()
>
> Matthew Maurer (1):
>       rust: kbuild: do not export generated KASAN ODR symbols
>
> Matthieu Baerts (NGI0) (1):
>       selftests: mptcp: connect: -f: no reconnect
>
> Meetakshi Setiya (1):
>       smb: client: change lease epoch type from unsigned int to __u16
>
> Michal Wajdeczko (1):
>       drm/xe/pf: Fix migration initialization
>
> Miguel Ojeda (1):
>       rust: init: use explicit ABI to clean warning in future compilers
>
> Mika Westerberg (1):
>       MAINTAINERS: Use my kernel.org address for ACPI GPIO work
>
> Mike Christie (1):
>       scsi: core: Add passthrough tests for success and no failure defini=
tions
>
> Miklos Szeredi (3):
>       statmount: let unset strings be empty
>       fs: fix adding security options to statmount.mnt_opt
>       selftests: always check mask returned by statmount(2)
>
> Nathan Chancellor (4):
>       x86/boot: Use '-std=3Dgnu11' to fix build with GCC 15
>       drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml file=
s
>       scripts/Makefile.extrawarn: Do not show clang's non-kprintf
> warnings at W=3D1
>       kbuild: Move -Wenum-enum-conversion to W=3D2
>
> Nick Chan (1):
>       irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured=
 so
>
> Oleh Zadorozhnyi (1):
>       kbuild: fix misspelling in scripts/Makefile.lib
>
> Oliver Upton (2):
>       KVM: arm64: Flush/sync debug state in protected mode
>       KVM: arm64: Fail protected mode init if no vgic hardware is present
>
> Paolo Abeni (1):
>       net: harmonize tstats and dstats
>
> Paolo Bonzini (2):
>       kvm: x86: SRSO_USER_KERNEL_NO is not synthesized
>       KVM: remove kvm_arch_post_init_vm
>
> Paulo Alcantara (3):
>       smb: client: don't trust DFSREF_STORAGE_SERVER bit
>       smb: client: fix noisy when tree connecting to DFS interlink target=
s
>       smb: client: get rid of kstrdup() in get_ses_refpath()
>
> Pavel Machek (1):
>       MAINTAINERS: Move Pavel to kernel.org address
>
> Prasad Pandit (1):
>       firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry
>
> Qu Wenruo (1):
>       btrfs: do not output error message if a qgroup has been already cle=
aned up
>
> Quang Le (2):
>       pfifo_tail_enqueue: Drop new packet when sch->limit =3D=3D 0
>       selftests/tc-testing: Add a test case for pfifo_head_drop qdisc
> when limit=3D=3D0
>
> Rafael J. Wysocki (1):
>       PM: sleep: core: Restrict power.set_active propagation
>
> Rik van Riel (1):
>       scsi: core: Use GFP_NOIO to avoid circular locking dependency
>
> Robin Murphy (1):
>       PCI/TPH: Restore TPH Requester Enable correctly
>
> Russell King (Oracle) (1):
>       Revert "net: stmmac: Specify hardware capability value when FIFO
> size isn't specified"
>
> Sagi Grimberg (1):
>       nvmet: fix a memory leak in controller identify
>
> Sankararaman Jayaraman (1):
>       vmxnet3: Fix tx queue race condition with XDP
>
> Sean Christopherson (2):
>       KVM: Do not restrict the size of KVM-internal memory regions
>       KVM: x86/mmu: Ensure NX huge page recovery thread is alive before w=
aking
>
> Seunghui Lee (1):
>       scsi: ufs: core: Fix error return with query response
>
> Stefan Eichenberger (1):
>       irqchip/irq-mvebu-icu: Fix access to msi_data from irq_domain::host=
_data
>
> Stephen Rothwell (1):
>       drivers/block/sunvdc.c: update the correct AIP call
>
> Steven Rostedt (1):
>       fgraph: Fix set_graph_notrace with setting TRACE_GRAPH_NOTRACE_BIT
>
> Su Hui (1):
>       fs/stat.c: avoid harmless garbage value problem in vfs_statx_path()
>
> Suraj Kandpal (2):
>       drm/i915/hdcp: Fix Repeater authentication during topology change
>       drm/i915/hdcp: Use correct function to check if encoder is HDMI
>
> Tamir Duberstein (1):
>       rust: kbuild: use host dylib naming in rusttestlib-kernel
>
> Thomas Zimmermann (1):
>       drm/ast: astdp: Fix timeout for enabling video signal
>
> Tom Chung (1):
>       Revert "drm/amd/display: Use HW lock mgr for PSR1"
>
> Umesh Nerlige Ramappa (1):
>       drm/i915/pmu: Fix zero delta busyness issue
>
> Ville Syrj=C3=A4l=C3=A4 (1):
>       drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
>
> Waiman Long (2):
>       clocksource: Use pr_info() for "Checking clocksource
> synchronization" message
>       clocksource: Use migrate_disable() to avoid calling
> get_random_u32() in atomic context
>
> WangYuli (1):
>       kbuild: install-extmod-build: add missing quotation marks for CC va=
riable
>
> Wentao Liang (2):
>       xfs: Propagate errors from xfs_reflink_cancel_cow_range in
> xfs_dax_write_iomap_end
>       xfs: Add error handling for xfs_reflink_cancel_cow_range
>
> Willem de Bruijn (1):
>       tun: revert fix group permission check
>
> Wolfram Sang (2):
>       Revert "i2c: Replace list-based mechanism for handling
> userspace-created clients"
>       Revert "i2c: Replace list-based mechanism for handling
> auto-detected clients"
>
> Xu Lu (1):
>       irqchip/riscv: Ensure ordering of memory writes and IPI writes
>
> Yan Zhai (1):
>       udp: gso: do not drop small packets when PMTU reduces
>
> Yu-Chun Lin (1):
>       kthread: Fix return value on kzalloc() failure in
> kthread_affine_preferred()
>
