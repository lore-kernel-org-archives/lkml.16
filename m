Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18F2F2E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624832; cv=none; b=ZLEanZPqVMtosUaiap7t9OFQy8VUVMThB9eVJfSYwaIpD5gg3E+hyTom6EzTGDpqPSv9NQ5kPt36MnzK+PeLIgHeiUrtVHRFah+FFQvf73nLH/Qo4Ssu9qBmrVeEHEdUXL5kInibquvH/5x8wYLPt0zLRzoKpT6jPMlnNFzgGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624832; c=relaxed/simple;
	bh=mqTjfjI8kdZLRtrBBFImHMnLBKOU0sHhESlLDsyH+0M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=D4T11IikY8Z3iXlenpnqB7TpbzCn7e3duWHKoKmXevK98uWU+lOKMFiFwA9aV40lZMSK/TNylR4Os+s2I39nnC5N97WjE5IpUKmgP7xTjS2g1P7bmTXTcdD2+995OpCGoMWQ3A1ySGGMI5jQrNEb2WoTzTlpUB6wmHKR6Xa8Z2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OwK4+yZn; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OwK4+yZn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso6822345a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 13:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750624827; x=1751229627; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tlKdj+Ximkbn+1ctNLLNmd37Np7g6wXOL5LZPjpYH/M=;
        b=OwK4+yZnxwdFgFGBnAgWnFqrjALFufn6wdCusrMTbaZ4bnSNWf1nCD/4aDRPI9z+N0
         dk+pdGY4OQTVHyzelwpYF5WkzTmASA5WHakBJuObetCUJS8Ztac0iNLgmeCQ92WqqlNv
         EJLXJ6g8WETx+nFWJfRbShPjJk1f1nbIKMRHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624827; x=1751229627;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlKdj+Ximkbn+1ctNLLNmd37Np7g6wXOL5LZPjpYH/M=;
        b=cLrwr0hC6mtUbPcSzb9AjcNsDJuyGmqCd02SN65em/7D2ldBehaz61YyRmHfGW4Z3O
         WBg0+0DgRStSgTWc+ZmOo3kfzFMCrYyOitIeatlJScZzD/GMUGn/Xd1zuFC1BQzZbBte
         4OAWKvWI5HLie2RbCI5o1jgYiSLbktgl6EUdVcKYRc4Q2Kri2csirzCCdjWCfvEaUVar
         MlpayIw42NinETAO8o2tZa2PFxmxFCkLLmhR+rzP3Ad+zu79gOyJpa3bUyFxPGkAG243
         0LCQH8JlNCAtbJT7J7xX0hpd51ZgfYAELojewcRsPMBXFh5Ubhg+aBTxfc/73VtPTKkb
         zjfQ==
X-Gm-Message-State: AOJu0YxBB+wusaItoVwCN6JhvWp2z3TXHwUJHSjAn2aNS73jwk6CEFZw
	ubQQwrL4JJv+3Zb5gp9o7uxBn50d+eFO7WUoq7istN5jbTvjC8noVQaxVM7PLhO1ZX7d3Z5Gw9Y
	djj28dmM=
X-Gm-Gg: ASbGncumV3CdERT2MwfMXjr2S6qUjS8Wqtc6ZszTqcKkuSLuBl+ZpGWluy28sFkYSFA
	MYxqiBtGGe87SvTh7Chh6eTsHG0EW0PbDbGOr6j6Jy+3Mbjp1izldTf0g5ER8pbI4UOJp1Rh3cK
	TEETv6nGY1qHiKtkRacMHuzu19fJ4S6liqEKlf/rLWU4PoWNIiTQrYZAi5JMylxaU5ya00DtQH/
	AltyRFxdU5fMsdIydq1ZkzP5yb3lnEc2Qc7lf8r7eBzhAu9LxzGymek4nWmjrMZH4bxc+n702wH
	MH9UgkP7uHdjDRBu0GWoG7SZ5GtqV7OetYMuIqMR56YTuz/+LSauc7O2YLuQrsL/MqkVkdD8xl9
	7doYYGVVQ1JQroz/9jxueQY8oySTaXgnskFxA
X-Google-Smtp-Source: AGHT+IFko1z/ke/mUgmtrVk7j7eLHF2bWMNj4lBpqTUoopI6x5Pvk5+KSelFu3tawP3VKBRBHNl4Dw==
X-Received: by 2002:aa7:db58:0:b0:5fe:7b09:9e27 with SMTP id 4fb4d7f45d1cf-60a1ccb50abmr7813563a12.12.1750624826757;
        Sun, 22 Jun 2025 13:40:26 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18551c7csm4974979a12.30.2025.06.22.13.40.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 13:40:26 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso6586988a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 13:40:26 -0700 (PDT)
X-Received: by 2002:a05:6402:510f:b0:604:e85d:8bb4 with SMTP id
 4fb4d7f45d1cf-60a1cd1f040mr8712846a12.21.1750624825036; Sun, 22 Jun 2025
 13:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 13:40:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqni5PduSvcsbkPXzPH9md2do6HUXw9Yqrvjq8e8GNmA@mail.gmail.com>
X-Gm-Features: AX0GCFvH8VXmSlAszFcowhkHFq1xASWbkGzuJpXCs5wE3ywnpCdYJEm_4KQoWDs
Message-ID: <CAHk-=wjqni5PduSvcsbkPXzPH9md2do6HUXw9Yqrvjq8e8GNmA@mail.gmail.com>
Subject: Linux 6.16-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So rc2 was smaller than usual, but rc3 seems to be right in the usual
ballpark for this time, so everything looks entirely normal.

The diff is dominated by some wireless networking and gpu driver
updates, but "dominated" is relative: it's not really anything really
huge, it's just that there are few other bigger changes, and so all
the rest is fairly small and spread out.

Nothing really stands out to me, so I'll just point people at the
shortlog below to get a taste of the kinds of fixes we have.

Please keep testing,

               Linus

---

Akhil R (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties

Alex Deucher (3):
      drm/amdgpu: switch job hw_fence to amdgpu_fence
      drm/amdgpu/sdma5: init engine reset mutex
      drm/amdgpu/sdma5.2: init engine reset mutex

Alex Elder (1):
      i2c: k1: check for transfer error

Alex Hung (2):
      drm/amd/display: Fix mpv playback corruption on weston
      drm/amd/display: Check dce_hwseq before dereferencing it

Alexander Stein (1):
      drm/arm/malidp: Silence informational message

Alexey Kodanev (1):
      net: lan743x: fix potential out-of-bounds write in
lan743x_ptp_io_event_clock_get()

Amir Goldstein (2):
      ovl: fix regression caused by lookup helpers API changes
      ovl: fix debug print in case of mkdir error

Anup Patel (2):
      RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
      RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs

Arnaldo Carvalho de Melo (16):
      tools headers: Update the fs headers with the kernel sources
      tools headers UAPI: Sync linux/prctl.h with the kernel sources
to pick FUTEX knob
      tools kvm headers arm64: Update KVM header from the kernel sources
      tools headers UAPI: Sync KVM's vmx.h header with the kernel sources
      tools headers x86 svm: Sync svm headers with the kernel sources
      tools headers UAPI: Sync kvm header with the kernel sources
      perf beauty: Update copy of linux/socket.h with the kernel sources
      tools headers UAPI: Sync the drm/drm.h with the kernel sources
      tools headers UAPI: Sync linux/kvm.h with the kernel sources
      tools headers: Update the copy of x86's mem{cpy,set}_64.S used
in 'perf bench'
      tools headers: Syncronize linux/build_bug.h with the kernel sources
      tools arch x86: Sync the msr-index.h copy with the kernel sources
      tools arch amd ibs: Sync ibs.h with the kernel sources
      tools headers: Synchronize linux/bits.h with the kernel sources
      perf bench futex: Fix prctl include in musl libc
      tools headers x86 cpufeatures: Sync with the kernel sources

Arnd Bergmann (3):
      platform/x86/intel-uncore-freq: avoid non-literal format string
      hwmon: (occ) Rework attribute registration for stack usage
      hwmon: (occ) fix unaligned accesses

Avadhut Naik (1):
      EDAC/amd64: Correct number of UMCs for family 19h models 70h-7fh

Bagas Sanjaya (1):
      Documentation: nouveau: Update GSP message queue kernel-doc reference

Baochen Qiang (10):
      wifi: ath12k: parse and save hardware mode info from
WMI_SERVICE_READY_EXT_EVENTID event for later use
      wifi: ath12k: parse and save sbs_lower_band_end_freq from
WMI_SERVICE_READY_EXT2_EVENTID event
      wifi: ath12k: update freq range for each hardware mode
      wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      wifi: ath12k: update link active in case two links fall on the same M=
AC
      wifi: ath12k: don't activate more links than firmware supports
      wifi: ath12k: fix documentation on firmware stats
      wifi: ath12k: avoid burning CPU while waiting for firmware stats
      wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_proce=
ss()
      wifi: ath12k: don't wait when there is no vdev started

Benjamin Coddington (1):
      SUNRPC: Cleanup/fix initial rq_pages allocation

Bharath SM (4):
      smb: fix secondary channel creation issue with kerberos by
populating hostname when adding channels
      smb: Use loff_t for directory position in cached_dirents
      smb: minor fix to use sizeof to initialize flags_string buffer
      smb: minor fix to use SMB2_NTLMV2_SESSKEY_SIZE for auth_key size

Binbin Wu (3):
      KVM: TDX: Add new TDVMCALL status code for unsupported subfuncs
      KVM: TDX: Handle TDG.VP.VMCALL<GetQuote>
      KVM: TDX: Exit to userspace for GetTdVmCallInfo

Binbin Zhou (1):
      gpio: loongson-64bit: Correct Loongson-7A2000 ACPI GPIO access mode

Bjorn Andersson (1):
      wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT and BCN_STAT

Brahmajit Das (1):
      ALSA: ctxfi: Replace deprecated strcpy() with strscpy()

Brett Creeley (1):
      ionic: Prevent driver/fw getting out of sync on devcmd(s)

Brett Werling (1):
      can: tcan4x5x: fix power regulator retrieval during probe

Brian Norris (2):
      genirq/cpuhotplug: Rebalance managed interrupts across multi-CPU hotp=
lug
      genirq/cpuhotplug: Restore affinity even for suspended IRQ

Chen Ridong (1):
      cgroup,freezer: fix incomplete freezing when attaching tasks

Chris Chiu (1):
      ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA

Christoph Hellwig (1):
      fs: add missing values to TRACE_IOCB_STRINGS

Christophe Leroy (1):
      powerpc/vdso: Fix build of VDSO32 with pcrel

Chuck Lever (1):
      NFSD: Avoid corruption of a referring call list

Chun-Tse Shao (1):
      perf test: Restrict uniquifying test to machines with 'uncore_imc'

Chuyi Zhou (1):
      workqueue: Initialize wq_isolated_cpumask in workqueue_init_early()

Colin Ian King (2):
      drm/nouveau/gsp: Fix potential integer overflow on integer shifts
      wifi: iwlwifi: Fix incorrect logic on cmd_ver range checking

Connor Abbott (5):
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
      drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE

Dan Carpenter (1):
      platform/x86/intel: power-domains: Fix error code in tpmi_init()

Daniele Ceraolo Spurio (1):
      drm/xe: Fix early wedge on GuC load failure

Danilo Krummrich (5):
      rust: completion: implement initial abstraction
      rust: revocable: indicate whether `data` has been revoked already
      rust: devres: fix race in Devres::drop()
      rust: devres: do not dereference to the internal Revocable
      mailmap: add entry for Danilo Krummrich

Darrick J. Wong (1):
      fs: unlock the superblock during iterate_supers_type

Dave Hansen (1):
      x86/mm: Disable INVLPGB when PTI is enabled

David Howells (1):
      cifs: Fix prepare_write to negotiate wsize if needed

David Thompson (2):
      gpio: mlxbf3: only get IRQ for device instance 0
      mlxbf_gige: return EPROBE_DEFER if PHY IRQ is not available

David Wei (4):
      selftests: netdevsim: improve lib.sh include in peer.sh
      selftests: net: add passive TFO test binary
      selftests: net: add test for passive TFO socket NAPI ID
      tcp: fix passive TFO socket having invalid NAPI ID

Dev Jain (1):
      arm64: Restrict pagetable teardown to avoid false warning

Dmitry Antipov (1):
      wifi: carl9170: do not ping device which has failed to load firmware

Drew Fustini (1):
      dt-bindings: pmem: Convert binding to YAML

Edip Hazuri (1):
      ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx
and HP Victus 15-fa1xxx

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Enable headset Mic on Positivo P15X

Eric Biggers (2):
      crypto: testmgr - reinstate kconfig control over full self-tests
      lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()

Eric Dumazet (2):
      net: atm: add lec_mutex
      net: atm: fix /proc/net/atm/lec handling

Frank Min (2):
      drm/amdgpu: Add kicker device detection
      drm/amdgpu: add kicker fws loading for gfx11/smu13/psp13

Gabriel Santese (1):
      ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic

Gao Xiang (3):
      erofs: remove unused trace event erofs_destroy_inode
      erofs: refuse crafted out-of-file-range encoded extents
      erofs: remove a superfluous check for encoded extents

Grzegorz Nitka (1):
      ice: fix eswitch code memory leak in reset scenario

Gui-Dong Han (1):
      hwmon: (ftsteutates) Fix TOCTOU race in fts_read()

Gyeyoung Baek (1):
      genirq/irq_sim: Initialize work context pointers properly

Haixia Qu (1):
      tipc: fix null-ptr-deref when acquiring remote ip of ethernet bearer

Hans de Goede (1):
      MAINTAINERS: .mailmap: Update Hans de Goede's email address

Hariprasad Kelam (1):
      Octeontx2-pf: Fix Backpresure configuration

Harshit Mogalapalli (1):
      ASoC: cs48l32: Fix a signedness bug in cs48l32_hw_params()

Heiko Stuebner (1):
      regulator: fan53555: add enable_time support and soft-start times

Heiner Kallweit (1):
      net: ftgmac100: select FIXED_PHY

Herbert Xu (1):
      crypto: ahash - Fix infinite recursion in ahash_def_finup

Huacai Chen (1):
      ASoC: loongson: Fix build warnings about export.h

Hyunwoo Kim (1):
      net/sched: fix use-after-free in taprio_dev_notifier

Ian Rogers (2):
      perf evsel: Missed close() when probing hybrid core PMUs
      perf test: Directory file descriptor leak

J. Neusch=C3=A4fer (2):
      powerpc/microwatt: Fix model property in device tree
      powerpc: dts: mpc8315erdb: Add GPIO controller node

Jacob Keller (1):
      drm/nouveau/bl: increase buffer size to avoid truncate warning

Jake Hillion (2):
      x86/platform/amd: move final timeout check to after final sleep
      x86/platform/amd: replace down_timeout() with down_interruptible()

Jakub Kicinski (3):
      net: ethtool: remove duplicate defines for family info
      eth: fbnic: avoid double free when failing to DMA-map FW msg
      tools: ynl: fix mixing ops and notifications on one socket

James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

Jay Cornwall (1):
      drm/amdkfd: Fix race in GWS queue scheduling

Jeff Layton (2):
      nfsd: use threads array as-is in netlink interface
      sunrpc: handle SVC_GARBAGE during svc auth processing as auth error

Jens Axboe (4):
      io_uring/rsrc: validate buffer count with offset for cloning
      io_uring: remove duplicate io_uring_alloc_task_context() definition
      io_uring/sqpoll: don't put task_struct on tctx setup failure
      io_uring/net: always use current transfer count for buffer put

Jesse Zhang (3):
      drm/amdgpu: Fix SDMA engine reset with logical instance ID
      drm/amdgpu: Use logical instance ID for SDMA v4_4_2 queue operations
      drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences

Jesse.Zhang (1):
      drm/amdkfd: move SDMA queue reset capability check to node_show

Johannes Berg (6):
      ata: pata_cs5536: fix build on 32-bit UML
      wifi: remove zero-length arrays
      wifi: mac80211: drop invalid source address OCB frames
      wifi: mac80211: don't WARN for late channel/color switch
      wifi: ath6kl: remove WARN on bad firmware input
      wifi: iwlwifi: dvm: restore n_no_reclaim_cmds setting

John Keeping (1):
      drm/ssd130x: fix ssd132x_clear_screen() columns

Jonathan Lane (1):
      ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged

Joshua Grisham (1):
      platform/x86: samsung-galaxybook: Add SAM0426

Juergen Gross (1):
      x86/mm/pat: don't collapse pages without PSE set

Justin Sanders (2):
      aoe: clean device rq_list in aoedev_downdev()
      aoe: defer rexmit timer downdev work to workqueue

Kai Huang (1):
      x86/virt/tdx: Avoid indirect calls to TDX assembly functions

Kalesh AP (1):
      bnxt_en: Fix double invocation of bnxt_ulp_stop()/bnxt_ulp_start()

Kan Liang (2):
      perf: Fix the throttle error of some clock events
      perf/x86/intel: Fix crash in icl_update_topdown_event()

Kees Cook (1):
      lib/crypto: Annotate crypto strings with nonstring

Krishna Kumar (1):
      net: ice: Perform accurate aRFS flow match

Krzysztof Kozlowski (2):
      drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
      NFC: nci: uart: Set tty->disc_data only in success path

Kuniyuki Iwashima (4):
      mpls: Use rcu_dereference_rtnl() in mpls_route_input_rcu().
      atm: atmtcp: Free invalid length skb in atmtcp_c_send().
      atm: Revert atm_account_tx() if copy_from_iter_full() fails.
      calipso: Fix null-ptr-deref in calipso_req_{set,del}attr().

Kurt Borja (1):
      Revert "platform/x86: alienware-wmi-wmax: Add G-Mode support to
Alienware m16 R1"

Laurentiu Mihalcea (1):
      ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x

Lijo Lazar (1):
      drm/amdgpu: Release reset locks during failures

Linus Torvalds (1):
      Linux 6.16-rc3

Lorenzo Bianconi (3):
      net: airoha: Always check return value from airoha_ppe_foe_get_entry(=
)
      net: airoha: Compute number of descriptors according to reserved
memory size
      net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1

Lorenzo Pieralisi (1):
      docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst

Lucas De Marchi (1):
      drm/xe: Fix memset on iomem

Luis Henriques (1):
      fs: drop assert in file_seek_cur_needs_f_lock

Lukas Bulwahn (1):
      x86/its: Fix an ifdef typo in its_alloc()

Lukas Wunner (1):
      PCI: pciehp: Ignore belated Presence Detect Changed caused by DPC

Luo Gengkun (1):
      perf/core: Fix WARN in perf_cgroup_switch()

Madhavan Srinivasan (2):
      powerpc: Fix struct termio related ioctl macros
      Documentation: embargoed-hardware-issues.rst: Add myself for Power

Marc Zyngier (1):
      KVM: arm64: nv: Fix tracking of shadow list registers

Mario Limonciello (8):
      platform/x86/amd: pmc: Clear metrics table at start of cycle
      platform/x86/amd: pmf: Use device managed allocations
      platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twic=
e
      platform/x86/amd: pmf: Simplify error flow in amd_pmf_init_smart_pc()
      platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042
quirks list
      PCI/PM: Set up runtime PM even for devices without PCI PM
      drm/amd/display: Only read ACPI backlight caps once
      drm/amd/display: Export full brightness range to userspace

Mark Brown (1):
      arm64/gcs: Don't call gcs_free() during flush_gcs()

Mark Rutland (7):
      KVM: arm64: VHE: Synchronize restore of host debug registers
      KVM: arm64: VHE: Synchronize CPTR trap deactivation
      KVM: arm64: Reorganise CPTR trap manipulation
      KVM: arm64: Remove ad-hoc CPTR manipulation from fpsimd_sve_sync()
      KVM: arm64: Remove ad-hoc CPTR manipulation from kvm_hyp_handle_fpsim=
d()
      KVM: arm64: Remove cpacr_clear_set()
      KVM: arm64: VHE: Centralize ISBs when returning to host

Masami Hiramatsu (Google) (1):
      x86/alternatives: Fix int3 handling failure from broken text_poke arr=
ay

Maurizio Lombardi (1):
      scsi: target: Fix NULL pointer dereference in
core_scsi3_decode_spec_i_port()

Ma=C3=ADra Canal (2):
      drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`
      drm/etnaviv: Protect the scheduler's pending list with its lock

Meghana Malladi (1):
      net: ti: icssg-prueth: Fix packet handling for XDP_TX

Michael Strauss (1):
      drm/amd/display: Get LTTPR IEEE OUI/Device ID From Closest LTTPR To H=
ost

Mike Rapoport (Microsoft) (3):
      x86/Kconfig: only enable ROX cache in execmem when
STRICT_MODULE_RWX is set
      x86/its: move its_pages array to struct mod_arch_specific
      Revert "mm/execmem: Unify early execmem_cache behaviour"

Mike Yuan (1):
      pidfs: never refuse ppid =3D=3D 0 in PIDFD_GET_INFO

Mikko Korhonen (1):
      ata: ahci: Disallow LPM for Asus B550-F motherboard

Mina Almasry (1):
      net: netmem: fix skb_ensure_writable with unreadable skbs

Miquel Raynal (4):
      Revert "mtd: core: always create master device"
      mtd: spinand: winbond: Fix W35N number of planes/LUN
      mtd: spinand: winbond: Increase maximum frequency on an octal operati=
on
      mtd: spinand: winbond: Prevent unsupported frequencies on
dual/quad I/O variants

Miri Korenblit (1):
      wifi: iwlwifi: restore missing initialization of
async_handlers_list (again)

Namhyung Kim (1):
      perf mem: Document new output fields (op, cache, mem, dtlb, snoop)

Namjae Jeon (3):
      ksmbd: add free_transport ops in ksmbd connection
      ksmbd: fix null pointer dereference in destroy_previous_session
      ksmbd: handle set/get info file for streamed file

Narayana Murty N (1):
      powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO
EEH recovery

Nathan Chancellor (1):
      lib/crypto/curve25519-hacl64: Disable KASAN with clang-17 and older

Neal Cardwell (1):
      tcp: fix tcp_packet_delayed() for
tcp_is_non_sack_preventing_reopen() behavior

NeilBrown (1):
      VFS: change try_lookup_noperm() to skip revalidation

Nicholas Kazlauskas (1):
      drm/amd/display: Add more checks for DSC / HUBP ONO guarantees

Niklas Cassel (2):
      ata: ahci: Use correct BIOS build date for ThinkPad W541 quirk
      ata: ahci: Disallow LPM for ASUSPRO-D840SA motherboard

Nuno S=C3=A1 (1):
      hwmon: (ltc4282) avoid repeated register write

Pablo Martin-Gomez (1):
      mtd: spinand: fix memory leak of ECC engine conf

Pali Roh=C3=A1r (1):
      cifs: Remove duplicate fattr->cf_dtype assignment from
wsl_to_fattr() function

Paul Aurich (1):
      smb: Log an error when close_all_cached_dirs fails

Pavan Chebbi (2):
      bnxt_en: Add a helper function to configure MRU and RSS
      bnxt_en: Update MRU and RSS table of RSS contexts on queue reset

Pei Xiao (1):
      wifi: iwlwifi: cfg: Limit cb_size to valid range

Peichen Huang (1):
      drm/amd/display: Add dc cap for dp tunneling

Penglei Jiang (2):
      io_uring: fix task leak issue in io_wq_create()
      io_uring: fix potential page leak in io_sqe_buffer_register()

Peter Ujfalusi (1):
      ASoC: Intel: sof-function-topology-lib: Print out the
unsupported dmic count

Peter Zijlstra (4):
      perf: Fix sample vs do_exit()
      perf: Fix cgroup state vs ERROR
      perf: Add comment to enum perf_event_state
      futex: Handle invalid node numbers supplied by user

Peter Zijlstra (Intel) (1):
      x86/its: explicitly manage permissions for ITS pages

Philipp Stanner (1):
      ata: pata_macio: Fix PCI region leak

Qinyun Tan (1):
      x86,fs/resctrl: Remove inappropriate references to cacheinfo in
the resctrl subsystem

Qiuxu Zhuo (1):
      EDAC/igen6: Fix NULL pointer dereference

Rafael J. Wysocki (1):
      ACPICA: Refuse to evaluate a method if arguments are missing

Raven Black (1):
      ASoC: amd: yc: update quirk data for HP Victus

Richard Fitzgerald (5):
      ALSA: hda/realtek: Add quirk for Asus GU605C
      ASoC: cs35l56: Use SoundWire address as firmware name suffix for
new silicon
      ASoC: cs35l56: Use SoundWire address as alternate firmware
suffix on L56 B0
      ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suf=
fix
      ASoC: doc: cs35l56: Add CS35L63 to the list of supported devices

Rik van Riel (1):
      x86/mm: Fix early boot use of INVPLGB

Rob Clark (6):
      drm/msm: Fix a fence leak in submit error path
      drm/msm: Fix another leak in the submit error path
      drm/msm: Rename add_components_mdp()
      drm/msm/adreno: Pass device_node to find_chipid()
      drm/msm/adreno: Check for recognized GPU before bind
      drm/msm: Fix inverted WARN_ON() logic

Rong Zhang (1):
      platform/x86: ideapad-laptop: use usleep_range() for EC polling

Ronnie Sahlberg (1):
      ublk: santizize the arguments from userspace when adding a device

Ryan Eatmon (1):
      drivers: gpu: drm: msm: registers: improve reproducibility

Sascha Hauer (1):
      gpio: pca953x: fix wrong error probe return value

Sean Christopherson (1):
      KVM: arm64: Explicitly treat routing entry type changes as changes

Sebastian Andrzej Siewior (4):
      selftests/futex: getopt() requires int as return value.
      selftests/futex: Set the home_node in futex_numa_mpol
      futex: Verify under the lock if hash can be replaced
      openvswitch: Allocate struct ovs_pcpu_storage dynamically

Shannon Nelson (1):
      MAINTAINERS: Remove Shannon Nelson from MAINTAINERS file

Shiji Yang (1):
      irqchip/ath79-misc: Fix missing prototypes warnings

Simon Horman (1):
      pldmfw: Select CRC32 when PLDMFW is selected

Simon Trimmer (1):
      ALSA: hda/realtek: Add quirk for Asus GA605K

Sonny Jiang (1):
      drm/amdgpu: VCN v5_0_1 to prevent FW checking RB during DPG pause

Srinivas Pandruvada (1):
      platform/x86/intel-uncore-freq: Fail module load when plat_info is NU=
LL

Stefan Metzmacher (1):
      smb: client: fix max_sge overflow in smb_extract_folioq_to_rdma()

Stephen Smalley (2):
      fs/xattr.c: fix simple_xattr_list()
      selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len

Steven Rostedt (1):
      fgraph: Do not enable function_graph tracer when setting funcgraph-ar=
gs

Stuart Hayes (4):
      platform/x86: dell_rbu: Fix lock context warning
      platform/x86: dell_rbu: Fix list usage
      platform/x86: dell_rbu: Stop overwriting data buffer
      platform/x86: dell_rbu: Bump version

Sven Peter (1):
      ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig

Takashi Iwai (3):
      ALSA: hda/intel: Add Thinkpad E15 to PM deny list
      ALSA: sb: Don't allow changing the DMA mode during operations
      ALSA: sb: Force to disable DMAs once when DMA mode is changed

Tasos Sahanidis (2):
      ata: pata_via: Force PIO for ATAPI devices on VT6415/VT6330
      ata: libata-acpi: Do not assume 40 wire cable if no devices are enabl=
ed

Tatsuyuki Ishi (1):
      erofs: impersonate the opener's credentials when accessing backing fi=
le

Tejun Heo (3):
      sched_ext: Update mailing list entry in MAINTAINERS
      sched_ext: Make scx_group_set_weight() always update tg->scx.weight
      sched_ext, sched/core: Don't call scx_group_set_weight()
prematurely from sched_create_group()

Tengda Wu (1):
      arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_n=
th()

Thierry Reding (1):
      spi: tegra210-qspi: Remove cache operations

Thomas Zimmermann (2):
      drm/ast: Do not include <linux/export.h>
      drm/mgag200: Do not include <linux/export.h>

Thorsten Blum (1):
      ASoC: sdw_utils: Fix potential NULL pointer deref in
is_sdca_endpoint_present()

Tzung-Bi Shih (1):
      drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled

Uladzislau Rezki (Sony) (1):
      rcu: Return early if callback is not specified

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL

Vinay Belgaumkar (1):
      drm/xe/bmg: Update Wa_16023588340

Vitaliy Shevtsov (1):
      scsi: elx: efct: Fix memory leak in efct_hw_parse_filter()

Vitaly Lifshits (1):
      e1000e: set fixed clock frequency indication for Nahum 11 and Nahum 1=
3

Vivian Wang (1):
      gpio: spacemit: Add missing MODULE_DEVICE_TABLE

Vladimir Oltean (2):
      ptp: fix breakage after ptp_vclock_in_use() rework
      ptp: allow reading of currently dialed frequency to succeed on
free-running clocks

Wolfram Sang (1):
      i2c: use inclusive callbacks in struct i2c_algorithm

Xi Pardee (2):
      platform/x86/intel/pmc: Add Lunar Lake support to Intel PMC
SSRAM Telemetry
      platform/x86/intel/pmc: Add Panther Lake support to Intel PMC
SSRAM Telemetry

Xin Li (Intel) (2):
      x86/fred/signal: Prevent immediate repeat of single step trap on
return from SIGTRAP handler
      selftests/x86: Add a test to detect infinite SIGTRAP handler loop

Yang Shen (1):
      MAINTAINERS: Update HiSilicon GPIO driver maintainer

Yeoreum Yun (1):
      perf: Fix dangling cgroup pointer in cpuctx

Yihan Zhu (1):
      drm/amd/display: Fix RMCM programming seq errors

Zenghui Yu (1):
      KVM: arm64: selftests: Close the GIC FD in arch_timer_edge_cases

Zhang Yi (1):
      ASoC: codecs: ES8326: Modify initialization configuration

Zhi Wang (1):
      drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()

wangdicheng (1):
      ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the
KTMicro sound card

zhangjian (1):
      smb: client: fix first command failure during re-negotiation
