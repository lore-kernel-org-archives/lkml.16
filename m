Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C8525A355
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620131; cv=none; b=TV9HCflr4MGJFvVuV/1uTBdYEGdaA4aEtQLDLIRgTm2d+UlrccxWwO2miVg7Fwgc2tgpFPffK04AM9dhieE0217i9TclKBgiT+cAlo/f9gluThqX7kL4zpjKyc5/5tqYC7sGhn5Y9OrQqsQt9vYqwnf3XOCnG3QwcmQxsonyN+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620131; c=relaxed/simple;
	bh=QputKyzqt4DXiQBvBxPgddecJrLfRge23Wa1xu5yk/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8hEkJIxAhas2nZgC6tu2Wfj5oAtIPP62RYtuc8rNmMo77HIHt14kSB5GIr+PcbQXjw5KyJnMKXSKA0Y8y/t70Vdc1L4CTcU6hHshFPvTnQtJeRYNhsDAaeNkYPsbFPlilURcimxTP7EXNesC9TkXUCzBPpoPhr0ALhgxNwqj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh2WW3r3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh2WW3r3"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3015001f862so2860474a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744620129; x=1745224929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qojVJvFxtgg2TxLfGusDfLvX0+S+297x1StoBTF46Rc=;
        b=Zh2WW3r3Sf8qu1IJxW6YRtEG4vcOw3D5GEfM79heRf0TTByNGQEh9md5L4p0cNFVxS
         L73OnV381BHdvc2cLt3vhlGfpfE50d6e6OwLFGU+vDxAya6jLGNEFTdg6HqWL34vhyhc
         DxSKEEWLkJ27pz2SSrPQaMslbRXRryo8s6l46XSMJl1B6I14hnwN2veyelHeMLqhOPgG
         ctTN2VZEWAvHGw8DQ06o3PkOSrtfSwZpsjyxeep9/GFm7ntuJ7/gU4HUmJi96rogm4XV
         aDHqCBlI1R5KRDX3HeDOquHXeB8KDC5vIZkeEI7r2iPS/3DHKHGLK9cRVhIG09SK+jK2
         fs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620129; x=1745224929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qojVJvFxtgg2TxLfGusDfLvX0+S+297x1StoBTF46Rc=;
        b=WVr80vyeyjmg0DmBaOQSLyHdYgY/blMa0c0OD/0zMUrvdxK0zAcI8SQ5mOYD82nyI7
         iwzChqTZyVkRnxmWxgieR9xxiLg8tXlfYLWWHmzozK8uzhBF2PewXqucYDNBVcfkEOCz
         AG7TE1hf1iXxmStC5yW9eK85f8dRhSTF9XdwDbjugSUVLLv0u0SHoQnDSK84HRHNYmG+
         bVe1zEsDsUNkHn74fqhQEi/LiZTPIoP7gXTG+2/20dfjkx3CeJ3UnGLbY39uOPCh8TON
         IpNRb2c5JZdMfCZn6Qd9bolFS9TFDoNAzBAKdppwEmPfgf4YpmVa9cljWRHIdEY03jld
         6FxA==
X-Gm-Message-State: AOJu0YyzV1bI9eSDBd+G7dTjFe+i+OuGPVQwOGxtJZ/5ZzNDvlGiAXoF
	merMkBXtny3rt/5m8iRL5Y2LN9hXPOV6QgdroNOWfcV5UXPegxLmkTPQ/Ci5oo0WNEw0vBX0ghc
	GkB6c3T2izaH/UlZaG/k69fs2VBE=
X-Gm-Gg: ASbGncsjtmWJIPiA2Rspe5T9/tdc+510PdXMBOqJ9rYHQw1fkE7zWdcFGyIRrvUVRWp
	Grd6MK8S/cErG9wgu34isT0h+GJ6GIHIW2SeYGozckgZZOsKjJ0WzcHh3XQc0p1PO2lwJ140Q8U
	Tqka6l89eoEQSfHVFXeRD3zFi2z1VmJWhRArWN
X-Google-Smtp-Source: AGHT+IFdlrL5vbWWEFoKOV2nBZYgZsLkN8S/9pDiUfERBQZTLsTF/DwKYxgOIPGteFNIUO7h0pP973QnCa0WIeyNFj4=
X-Received: by 2002:a17:90b:562e:b0:2ff:692b:b15 with SMTP id
 98e67ed59e1d1-308237f41aemr19924032a91.33.1744620128051; Mon, 14 Apr 2025
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wi=9W+46NB85mJ9By2OB9ROLYVB4Z3au4qi0aYXDepd5w@mail.gmail.com>
In-Reply-To: <CAHk-=wi=9W+46NB85mJ9By2OB9ROLYVB4Z3au4qi0aYXDepd5w@mail.gmail.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Mon, 14 Apr 2025 10:41:54 +0200
X-Gm-Features: ATxdqUH_Xn3xbvRU_lm3Y4NsucqbFAHBvHuNCdiH55Pj1Z1A8v2LKJcggjWwL_w
Message-ID: <CADo9pHhwen12gFEayOD+z_x4t4P5MhKCDF2LVGEEpowjHXnjmA@mail.gmail.com>
Subject: Re: Linux 6.15-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>, Luna Jernberg <droidbittin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Mikael Eriksson <mikael_eriksson@miffe.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Works fine on my Dell Latitude 7390 laptop with Arch Linux

Den m=C3=A5n 14 apr. 2025 kl 00:43 skrev Linus Torvalds
<torvalds@linux-foundation.org>:
>
> It's Sunday, just barely afternoon, and I've pushed out the rc2 tag.
>
> Things look fairly normal. Yes, this was a larger-than-usual merge
> window, but at least for now rc2 looks pretty much in line with normal
> statistics both when it comes to number of commits and to the
> diffstat. Nothing particularly stands out to me, but it's early in the
> release yet, so let's see how it goes...
>
> About a quarter of the patch is selftests updates, which is perhaps a
> bit unusual but at the same time certainly not alarming.
>
> Other than that, it's all pretty evenly spread out: drivers (gpu is
> about half of that), arch updates, core kernel and networking,
> filesystems, documentation. A little something for everybody, in other
> words.
>
> Please do keep testing,
>
>                  Linus
>
> ---
>
> Ahmed Salem (1):
>       selftests: tpm2: test_smoke: use POSIX-conformant expression operat=
or
>
> Alex Deucher (5):
>       drm/amdgpu/mes11: optimize MES pipe FW version fetching
>       drm/amdgpu/pm: add workload profile pause helper
>       drm/amdgpu/pm/swsmu: implement pause workload profile
>       drm/amdgpu: cancel gfx idle work in device suspend for s0ix
>       drm/amdgpu/mes12: optimize MES pipe FW version fetching
>
> Andrii Nakryiko (1):
>       uprobes: Avoid false-positive lockdep splat on
> CONFIG_PREEMPT_RT=3Dy in the ri_timer() uprobe timer callback, use
> raw_write_seqcount_*()
>
> Andy Chiu (1):
>       ftrace: Properly merge notrace hashes
>
> Andy Shevchenko (3):
>       gpiolib: of: Fix the choice for Ingenic NAND quirk
>       gpiolib: of: Move Atmel HSMCI quirk up out of the regulator comment
>       x86/early_printk: Use 'mmio32' for consistency, fix comments
>
> Andy Yan (2):
>       drm/rockchip: vop2: Fix interface enable/mux setting of DP1 on rk35=
88
>       drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resum=
e
>
> Ankit Nautiyal (1):
>       drm/i915/vrr: Add vrr.vsync_{start, end} in vrr_params_changed
>
> Arnaud Lecomte (1):
>       net: ppp: Add bound checking for skb data on ppp_sync_txmung
>
> Arnd Bergmann (2):
>       xenbus: add module description
>       drm/xe: avoid plain 64-bit division
>
> Artem Sadovnikov (1):
>       ext4: fix off-by-one error in do_split
>
> Badal Nilawar (1):
>       drm/i915: Disable RPG during live selftest
>
> Bartosz Golaszewski (5):
>       irqchip/davinci: Remove leftover header
>       gpio: deprecate the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag
>       gpio: deprecate devm_gpiod_unhinge()
>       MAINTAINERS: add more keywords for the GPIO subsystem entry
>       gpio: TODO: track the removal of regulator-related workarounds
>
> Bo Liu (1):
>       erofs: remove duplicate code
>
> Borislav Petkov (AMD) (1):
>       Documentation/x86: Zap the subsection letters
>
> Brendan King (2):
>       drm/imagination: take paired job reference
>       drm/imagination: fix firmware memory leaks
>
> Caleb Sander Mateos (1):
>       ublk: pass ublksrv_ctrl_cmd * instead of io_uring_cmd *
>
> Chen Ni (1):
>       smccc: kvm_guest: Remove unneeded semicolon
>
> Chenyuan Yang (1):
>       net: libwx: handle page_pool_dev_alloc_pages error
>
> Chris Bainbridge (1):
>       drm/nouveau: prime: fix ttm_bo_delayed_delete oops
>
> Christian K=C3=B6nig (2):
>       drm/amdgpu: immediately use GTT for new allocations
>       drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can d=
o P2P
>
> Cong Wang (11):
>       sch_htb: make htb_qlen_notify() idempotent
>       sch_drr: make drr_qlen_notify() idempotent
>       sch_hfsc: make hfsc_qlen_notify() idempotent
>       sch_qfq: make qfq_qlen_notify() idempotent
>       sch_ets: make est_qlen_notify() idempotent
>       codel: remove sch->q.qlen check before qdisc_tree_reduce_backlog()
>       selftests/tc-testing: Add a test case for FQ_CODEL with HTB parent
>       selftests/tc-testing: Add a test case for FQ_CODEL with QFQ parent
>       selftests/tc-testing: Add a test case for FQ_CODEL with HFSC parent
>       selftests/tc-testing: Add a test case for FQ_CODEL with DRR parent
>       selftests/tc-testing: Add a test case for FQ_CODEL with ETS parent
>
> Daniel Wagner (8):
>       nvmet-fcloop: swap list_add_tail arguments
>       nvmet-fcloop: replace kref with refcount
>       nvmet-fcloop: add ref counting to lport
>       nvmet-fc: inline nvmet_fc_delete_assoc
>       nvmet-fc: inline nvmet_fc_free_hostport
>       nvmet-fc: update tgtport ref per assoc
>       nvmet-fc: take tgtport reference only once
>       nvmet-fc: put ref when assoc->del_work is already scheduled
>
> Dave Hansen (1):
>       x86/cpu: Avoid running off the end of an AMD erratum table
>
> David Hildenbrand (1):
>       s390/virtio_ccw: Don't allocate/assign airqs for non-existing queue=
s
>
> Denis Arefev (1):
>       drm/amd/pm/smu11: Prevent division by zero
>
> Dmitry Osipenko (2):
>       drm/virtio: Don't attach GEM to a non-created context in gem_object=
_open()
>       drm/virtio: Fix missed dmabuf unpinning in error path of prepare_fb=
()
>
> Edward Liaw (1):
>       selftests/futex: futex_waitv wouldblock test should fail
>
> Emily Deng (1):
>       drm/amdkfd: sriov doesn't support per queue reset
>
> Eric Biggers (9):
>       lib/crc: remove unnecessary prompt for CONFIG_CRC32 and drop 'defau=
lt y'
>       lib/crc: remove unnecessary prompt for CONFIG_CRC_CCITT
>       lib/crc: remove unnecessary prompt for CONFIG_CRC16
>       lib/crc: remove unnecessary prompt for CONFIG_CRC_T10DIF
>       lib/crc: remove unnecessary prompt for CONFIG_CRC_ITU_T
>       lib/crc: document all the CRC library kconfig options
>       lib/crc: remove CONFIG_LIBCRC32C
>       bcachefs: use library APIs for ChaCha20 and Poly1305
>       bcachefs: Remove unnecessary softdep on xxhash
>
> Fedor Pchelkin (1):
>       iommu: Fix crash in report_iommu_fault()
>
> Flora Cui (1):
>       drm/amdgpu/ip_discovery: add missing ip_discovery fw
>
> Florian Westphal (2):
>       nft_set_pipapo: fix incorrect avx2 match of 5th field octet
>       selftests: netfilter: add test case for recent mismatch bug
>
> Frederic Weisbecker (1):
>       perf: Fix hang while freeing sigtrap event
>
> Gabriel Shahrouzi (4):
>       perf/core: Fix WARN_ON(!ctx) in __free_event() for partial init
>       bcachefs: Fix escape sequence in prt_printf
>       bcachefs: Fix type for parameter in journal_advance_devs_to_next_bu=
cket
>       bcachefs: Use cpu_to_le16 for dirent lengths
>
> Gao Xiang (2):
>       erofs: add __packed annotation to union(__le16..)
>       erofs: fix encoded extents handling
>
> Geert Uytterhoeven (2):
>       mtd: nand: Drop explicit test for built-in CONFIG_SPI_QPIC_SNAND
>       kunit: Spelling s/slowm/slow/
>
> Guixin Liu (1):
>       gpio: tegra186: fix resource handling in ACPI probe path
>
> Gustavo A. R. Silva (1):
>       ext4: avoid -Wflex-array-member-not-at-end warning
>
> Hannes Reinecke (2):
>       nvme: requeue namespace scan on missed AENs
>       nvme: re-read ANA log page after ns scan completes
>
> Hariprasad Kelam (1):
>       octeontx2-pf: qos: fix VF root node parent queue index
>
> Henry Martin (1):
>       ata: pata_pxa: Fix potential NULL pointer dereference in pxa_ata_pr=
obe()
>
> Huacai Chen (3):
>       drm/amd/display: Protect FPU in dml21_copy()
>       drm/amd/display: Protect FPU in dml2_init()/dml21_init()
>       drm/amd/display: Protect FPU in dml2_validate()/dml21_validate()
>
> Ido Schimmel (2):
>       ipv6: Align behavior across nexthops during path selection
>       ethtool: cmis_cdb: Fix incorrect read / write length extension
>
> Inochi Amaoto (1):
>       irqchip/sg2042-msi: Add missing chip flags
>
> Jacek Lawrynowicz (3):
>       accel/ivpu: Fix warning in ivpu_ipc_send_receive_internal()
>       accel/ivpu: Fix deadlock in ivpu_ms_cleanup()
>       accel/ivpu: Fix PM related deadlocks in MS IOCTLs
>
> Jakub Kicinski (2):
>       net: tls: explicitly disallow disconnect
>       selftests: tls: check that disconnect does nothing
>
> James Morse (1):
>       x86/resctrl: Fix rdtgroup_mkdir()'s unlocked use of kernfs_node::na=
me
>
> Jani Nikula (1):
>       drm/i915/gvt: fix unterminated-string-initialization warning
>
> Jann Horn (1):
>       ext4: don't treat fhandle lookup of ea_inode as FS corruption
>
> Janusz Krzysztofik (1):
>       drm/i915/huc: Fix fence not released on early probe errors
>
> Jason Andryuk (1):
>       xen: Change xen-acpi-processor dom0 dependency
>
> Jay Cornwall (1):
>       drm/amdgpu: Increase KIQ invalidate_tlbs timeout
>
> Jean-Marc Eurin (1):
>       ACPI PPTT: Fix coding mistakes in a couple of sizeof() calls
>
> Jens Axboe (1):
>       io_uring/kbuf: reject zero sized provided buffers
>
> Jiawen Wu (1):
>       net: libwx: Fix the wrong Rx descriptor field
>
> Jonathan Kim (1):
>       drm/amdkfd: limit sdma queue reset caps flagging for gfx9
>
> Josh Poimboeuf (13):
>       pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
>       objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
>       objtool: Split INSN_CONTEXT_SWITCH into INSN_SYSCALL and INSN_SYSRE=
T
>       objtool: Stop UNRET validation on UD2
>       objtool, xen: Fix INSN_SYSCALL / INSN_SYSRET semantics
>       objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC
>       x86/bugs: Rename entry_ibpb() to write_ibpb()
>       x86/bugs: Use SBPB in write_ibpb() if applicable
>       x86/bugs: Fix RSB clearing in indirect_branch_prediction_barrier()
>       x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline
>       x86/bugs: Don't fill RSB on context switch with eIBRS
>       x86/bugs: Add RSB mitigation document
>       objtool: Fix false-positive "ignoring unreachables" warning
>
> Julia Filipchuk (1):
>       drm/xe/xe3lpg: Apply Wa_14022293748, Wa_22019794406
>
> Kenneth Feng (1):
>       drm/amd/display: pause the workload setting in dm
>
> Kenneth Graunke (1):
>       drm/xe: Invalidate L3 read-only cachelines for geometry streams too
>
> Kent Overstreet (3):
>       bcachefs: Fix UAF in bchfs_read()
>       bcachefs: Fix duplicate "ro,read_only" in opts at startup
>       bcachefs: Use sort_nonatomic() instead of sort()
>
> Kevin Hao (2):
>       spi: fsl-qspi: Fix double cleanup in probe error path
>       spi: fsl-spi: Remove redundant probe error message
>
> Khaled Elnaggar (1):
>       selftests: tpm2: create a dedicated .gitignore
>
> Krzysztof Kozlowski (2):
>       gpio: mpc8xxx: Fix wakeup source leaks on device unbind
>       gpio: zynq: Fix wakeup source leaks on device unbind
>
> Kumar Kartikeya Dwivedi (5):
>       selftests/bpf: Make res_spin_lock test less verbose
>       selftests/bpf: Make res_spin_lock AA test condition stronger
>       bpf: Use architecture provided res_smp_cond_load_acquire
>       bpf: Convert queue_stack map to rqspinlock
>       bpf: Convert ringbuf map to rqspinlock
>
> Kuniyuki Iwashima (4):
>       ipv6: Fix null-ptr-deref in addrconf_add_ifaddr().
>       rtnetlink: Fix bad unlock balance in do_setlink().
>       nvme-tcp: fix use-after-free of netns by kernel TCP socket.
>       net: Fix null-ptr-deref by sock_lock_init_class_and_name() and rmmo=
d.
>
> Linus Torvalds (1):
>       Linux 6.15-rc2
>
> Louis-Alexis Eyraud (1):
>       iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_grou=
p
>
> Maarten Lankhorst (1):
>       drm/amdgpu: Add cgroups implementation
>
> Marek Szyprowski (1):
>       iommu/exynos: Fix suspend/resume with IDENTITY domain
>
> Mario Limonciello (4):
>       ACPI: button: Only send `KEY_POWER` for `ACPI_BUTTON_NOTIFY_STATUS`
>       ACPI: EC: Set ec_no_wakeup for Lenovo Go S
>       drm/amd/display: Add HP Probook 445 and 465 to the quirk list
> for eDP on DP1
>       drm/amd/display: Add HP Elitebook 645 to the quirk list for eDP on =
DP1
>
> Masami Hiramatsu (Google) (4):
>       tracing: fprobe: Fix to lock module while registering fprobe
>       tracing: fprobe events: Fix possible UAF on modules
>       memblock tests: Fix mutex related build error
>       tracing: fprobe: Cleanup fprobe hash when module unloading
>
> Matt Roper (1):
>       drm/xe/bmg: Add one additional PCI ID
>
> Matthew Auld (1):
>       drm/amdgpu/dma_buf: fix page_link check
>
> Matthew Brost (1):
>       drm/xe: Use local fence in error path of xe_migrate_clear
>
> Matthieu Baerts (NGI0) (2):
>       mptcp: only inc MPJoinAckHMacFailure for HMAC failures
>       selftests: mptcp: validate MPJoin HMacFailure counters
>
> Maxime Chevallier (1):
>       net: ethtool: Don't call .cleanup_data when prepare_data fails
>
> Maxime Ripard (7):
>       drm/tests: helpers: Create kunit helper to destroy a drm_display_mo=
de
>       drm/tests: modeset: Fix drm_display_mode memory leak
>       drm/tests: modeset: Fix drm_display_mode memory leak
>       drm/tests: cmdline: Fix drm_display_mode memory leak
>       drm/tests: modes: Fix drm_display_mode memory leak
>       drm/tests: modes: Fix drm_display_mode memory leak
>       drm/tests: probe-helper: Fix drm_display_mode memory leak
>
> Ming Lei (3):
>       selftests: ublk: fix test_stripe_04
>       ublk: fix handling recovery & reissue in ublk_abort_queue()
>       ublk: don't fail request for recovery & reissue in case of ubq->can=
celing
>
> Miquel Raynal (1):
>       mtd: spinand: Fix build with gcc < 7.5
>
> Myrrh Periwinkle (1):
>       x86/e820: Fix handling of subpage regions when calculating
> nosave ranges in e820__register_nosave_regions()
>
> Nam Cao (2):
>       hrtimer: Add missing ACCESS_PRIVATE() for hrtimer::function
>       rv: Fix out-of-bound memory access in rv_is_container_monitor()
>
> Nathan Chancellor (1):
>       kbuild: Add '-fno-builtin-wcslen'
>
> Naveen N Rao (AMD) (1):
>       Documentation/x86: Update the naming of CPU features for /proc/cpui=
nfo
>
> Nicolin Chen (1):
>       iommu/tegra241-cmdqv: Fix warnings due to dmam_free_coherent()
>
> Niranjana Vishwanathapura (1):
>       drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change
>
> Octavian Purdila (3):
>       net_sched: sch_sfq: use a temporary work area for validating config=
uration
>       net_sched: sch_sfq: move the limit validation
>       selftests/tc-testing: sfq: check that a derived limit of 1 is rejec=
ted
>
> Ojaswin Mujoo (1):
>       ext4: make block validity check resistent to sb bh corruption
>
> Oliver Upton (4):
>       smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
>       KVM: arm64: Only read HPFAR_EL2 when value is architecturally valid
>       arm64: Convert HPFAR_EL2 to sysreg table
>       KVM: arm64: Don't translate FAR if invalid/unsafe
>
> Pali Roh=C3=A1r (7):
>       cifs: Ensure that all non-client-specific reparse points are
> processed by the server
>       cifs: Fix support for WSL-style symlinks
>       cifs: Fix encoding of SMB1 Session Setup Kerberos Request in
> non-UNICODE mode
>       cifs: Remove explicit handling of IO_REPARSE_TAG_MOUNT_POINT in ino=
de.c
>       cifs: Improve handling of name surrogate reparse points in reparse.=
c
>       cifs: Split parse_reparse_point callback to functions: get
> buffer and parse buffer
>       cifs: Fix querying of WSL CHR and BLK reparse points over SMB1
>
> Paolo Bonzini (9):
>       selftests: kvm: revamp MONITOR/MWAIT tests
>       selftests: kvm: bring list of exit reasons up to date
>       selftests: kvm: list once tests that are valid on all architectures
>       Documentation: KVM: KVM_GET_SUPPORTED_CPUID now exposes TSC_DEADLIN=
E
>       Documentation: kvm: give correct name for KVM_CAP_SPAPR_MULTITCE
>       Documentation: kvm: drop "Capability" heading from capabilities
>       Documentation: kvm: fix some definition lists
>       Documentation: kvm: organize capabilities in the right section
>       Documentation: kvm: remove KVM_CAP_MIPS_TE
>
> Paulo Alcantara (1):
>       smb: client: fix UAF in decryption with multichannel
>
> Pavel Begunkov (3):
>       io_uring: don't post tag CQEs on file/buffer registration failure
>       io_uring/zcrx: put refill data into separate cache line
>       io_uring/zcrx: separate niov number from pages
>
> Pei Xiao (1):
>       iommu: remove unneeded semicolon
>
> Peng Jiang (1):
>       vdso: Address variable shadowing in macros
>
> Peter Zijlstra (1):
>       x86/ibt: Fix hibernate
>
> Petr Tesarik (1):
>       iommu/vt-d: Remove an unnecessary call set_dma_ops()
>
> Petr Van=C4=9Bk (1):
>       x86/acpi: Don't limit CPUs to 1 for Xen PV guests due to disabled A=
CPI
>
> Qiuxu Zhuo (1):
>       selftests/mincore: Allow read-ahead pages to reach the end of the f=
ile
>
> Rae Moar (1):
>       kunit: tool: fix count of tests if late test plan
>
> Raghavendra Rao Ananta (2):
>       KVM: arm64: selftests: Introduce and use hardware-definition macros
>       KVM: arm64: selftests: Explicitly set the page attrs to Inner-Share=
able
>
> Ricardo Ca=C3=B1uelo Navarro (1):
>       sctp: detect and prevent references to a freed transport in sendmsg
>
> Robin Murphy (2):
>       iommu: Clear iommu-dma ops on cleanup
>       iommu/ipmmu-vmsa: Register in a sensible order
>
> Rodrigo Vivi (1):
>       drm/xe: Restore EIO errno return when GuC PC start fails
>
> Roger Pau Monne (2):
>       x86/xen: fix balloon target initialization for PVH dom0
>       x86/xen: disable CPU idle and frequency drivers for PVH dom0
>
> Rolf Eike Beer (1):
>       drm/sti: remove duplicate object names
>
> Sean Christopherson (7):
>       KVM: x86: Acquire SRCU in KVM_GET_MP_STATE to protect guest
> memory accesses
>       KVM: selftests: Add option to rseq test to override /dev/cpu_dma_la=
tency
>       KVM: x86/mmu: Wrap sanity check on number of TDP MMU pages with
> KVM_PROVE_MMU
>       KVM: Allow building irqbypass.ko as as module when kvm.ko is a modu=
le
>       KVM: x86: Explicitly zero-initialize on-stack CPUID unions
>       KVM: VMX: Assert that IRQs are disabled when putting vCPU on PI
> wakeup list
>       iommu/vt-d: Wire up irq_ack() to irq_move_irq() for posted MSIs
>
> Sebastian Andrzej Siewior (1):
>       timekeeping: Add a lockdep override in tick_freeze()
>
> Shakeel Butt (1):
>       cgroup: rstat: call cgroup_rstat_updated_list with cgroup_rstat_loc=
k
>
> Sheng Yong (1):
>       erofs: set error to bio if file-backed IO fails
>
> Stanimir Varbanov (1):
>       irqchip/irq-bcm2712-mip: Set EOI/ACK flags in msi_parent_ops
>
> Stanislav Fomichev (1):
>       net: hold instance lock during NETDEV_CHANGE
>
> Steve French (2):
>       smb311 client: fix missing tcon check when mounting with
> linux/posix extensions
>       smb3: Add defines for two new FileSystemAttributes
>
> Steven Rostedt (5):
>       tracing: Hide get_vm_area() from MMUless builds
>       tracing: Do not add length to print format in synthetic events
>       ftrace: Fix accounting of subop hashes
>       tracing/selftest: Add test to better test subops filtering of
> function graph
>       ftrace: Do not have print_graph_retval() add a newline
>
> Taehee Yoo (2):
>       net: ethtool: fix ethtool_ringparam_get_cfg() returns a
> hds_thresh value always as 0.
>       selftests: drv-net: test random value for hds-thresh
>
> Tejas Upadhyay (1):
>       drm/xe/hw_engine: define sysfs_ops on all directories
>
> Thomas Hellstr=C3=B6m (2):
>       drm/xe/svm: Fix a potential bo UAF
>       drm/xe: Fix an out-of-bounds shift when invalidating TLB
>
> Thomas Richter (2):
>       s390/cpumf: Update CPU Measurement facility extended counter set su=
pport
>       s390/cpumf: Fix double free on error in cpumf_pmu_event_init()
>
> Thomas Wei=C3=9Fschuh (2):
>       KVM: s390: Don't use %pK through tracepoints
>       KVM: s390: Don't use %pK through debug printing
>
> Thorsten Blum (1):
>       null_blk: Use strscpy() instead of strscpy_pad() in null_add_dev()
>
> Toke H=C3=B8iland-J=C3=B8rgensen (1):
>       tc: Ensure we have enough buffer space when sending filter
> netlink notifications
>
> Tom Chung (1):
>       drm/amd/display: Do not enable Replay and PSR while VRR is on in
> amdgpu_dm_commit_planes()
>
> Tom Vierjahn (1):
>       Documentation: ext4: Add fields to ext4_super_block documentation
>
> Tung Nguyen (1):
>       tipc: fix memory leak in tipc_link_xmit
>
> Uday Shankar (1):
>       nvme: multipath: fix return value of nvme_available_path
>
> Uwe Kleine-K=C3=B6nig (5):
>       pwm: rcar: Improve register calculation
>       pwm: fsl-ftm: Handle clk_get_rate() returning 0
>       pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded=
 up
>       pwm: stm32: Search an appropriate duty_cycle if period cannot be mo=
dified
>       pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request
> was rounded up
>
> Vasily Gorbik (2):
>       s390: Add z17 elf platform
>       s390: Allow to compile with z17 optimizations
>
> Ville Syrj=C3=A4l=C3=A4 (2):
>       drm/i915: Fix scanline_offset for LNL+ and BMG+
>       drm/i915/dp: Reject HBR3 when sink doesn't support TPS4
>
> Vivek Kasireddy (2):
>       drm/virtio: Fix flickering issue seen with imported dmabufs
>       drm/i915/xe2hpd: Identify the memory type for SKUs with GDDR + ECC
>
> Vladimir Oltean (2):
>       net: phy: move phy_link_change() prior to mdio_bus_phy_may_suspend(=
)
>       net: phy: allow MDIO bus PM ops to start/stop state machine for
> phylink-controlled PHY
>
> Waiman Long (10):
>       cgroup/cpuset: Fix incorrect isolated_cpus update in
> update_parent_effective_cpumask()
>       cgroup/cpuset: Fix error handling in remote_partition_disable()
>       cgroup/cpuset: Remove remote_partition_check() & make
> update_cpumasks_hier() handle remote partition
>       cgroup/cpuset: Don't allow creation of local partition over a remot=
e one
>       cgroup/cpuset: Code cleanup and comment update
>       cgroup/cpuset: Remove unneeded goto in sched_partition_write()
> and rename it
>       selftest/cgroup: Update test_cpuset_prs.sh to use | as effective
> CPUs and state separator
>       selftest/cgroup: Clean up and restructure test_cpuset_prs.sh
>       selftest/cgroup: Add a remote partition transition test to
> test_cpuset_prs.sh
>       cgroup/cpuset: Fix race between newly created partition and dying o=
ne
>
> Wentao Liang (3):
>       mtd: inftlcore: Add error check for inftl_read_oob()
>       mtd: rawnand: Add status chack in r852_ready()
>       ata: sata_sx4: Add error handling in pdc20621_i2c_read()
>
> Will Deacon (1):
>       KVM: arm64: Use acquire/release to communicate FF-A version negotia=
tion
>
> Willem de Bruijn (2):
>       bpf: support SKF_NET_OFF and SKF_LL_OFF on skb frags
>       selftests/net: test sk_filter support for SKF_NET_OFF on frags
>
> Xiaogang Chen (1):
>       udmabuf: fix a buf size overflow issue during udmabuf creation
>
> Yan Zhao (1):
>       KVM: VMX: Use separate subclasses for PI wakeup lock to squash
> false positive
>
> Zhangfei Gao (1):
>       PCI: Run quirk_huawei_pcie_sva() before arm_smmu_probe_device()
>
