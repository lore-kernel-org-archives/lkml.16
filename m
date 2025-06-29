Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8B8F54
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230992; cv=none; b=CSP3YDQtQENcHWKQmTu5yQ36/NEohvgXTD1kfAUYqFDtOaUiyTHhGg8HTNwNUvgJUjnrMP8rqBZdYgmDf0aMJRxFjlR1NohBG9HJZSitumPeFbXAe++GB3mHGxfrXprj+uajB41Q4m1NEk3Jr8h6QSWFfpreEF8h305UyeoygdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230992; c=relaxed/simple;
	bh=Bz222oPHBUJ4KvhFs/qFg4F7TNAvoIhuSkIGYlT+Gkg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CU8PTg4Q1r0vi1aAUXOO+8V7EJafSKzfsOILOnGCnIfPwNDQD2ok460RCu1GRPvnAroG1O4y+UYQpJMTyuzhWJQZbPKogtqp5RwDUeNe+8IFvgilhje+PJCtxMmiTyQ47b1AIq5Hft+I58nBW7ZNFKwpPtJwVNghBYw+Y+7gFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TUNWBNZM; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TUNWBNZM"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so6655060a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751230987; x=1751835787; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4VSLh4AJLpj8puqEQVUtHfGdJAYiJfYLoiqeobhNur8=;
        b=TUNWBNZMnOBipBhHxx28kOISLjBiLbc4rTOosqbLmVrC+cSurG5NZGeYLebJY93PH/
         YTDxN3bPuAmIoggjr4+FTY4z/FLDTfy7ovy8VKX8NNF+yuPibx4Gd80MFluh3wzYkL0V
         TlyXPscl0aVsiUlUDiAC6SI+IIYW0+Peo5Sc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751230987; x=1751835787;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VSLh4AJLpj8puqEQVUtHfGdJAYiJfYLoiqeobhNur8=;
        b=wXkJdd8dOSu9xb1vXx3533Z1Jp73XP44atAKfGtE9KzpKL+odLfq8RPnRJUg9K8ua2
         PF5HiQNyOtiBwnlxH0RCSK2x1dcFnfYG36s1ppdm4ZSe+Iej7RdfVqSjfghST08BQQn5
         Vh78q9vxlTypkcQbD18L/c1+aITbnx4vjzeVLvteyDfj78nJq6K5gytK65PQ96ORVfh/
         1MzHafUnTGjfRd26K+wAfkiyJtJfa08VVINmADK/RUSbUJG3CcdiiOeyV5k05B6xf8gH
         3tezwPiv/gCtS1NlDRIann7JPHG46zLIIIZz3ds2C/Bw7iHhBa6l9vQ2tcD0Uhtgdysr
         UUDQ==
X-Gm-Message-State: AOJu0YyOUYQdUcRwgnlZHjlqWHfnOx0seoZjKDSRulngGbY8jeXuBsG7
	xlqqdu1k6Y3nWcc0A77Kb/770HQM/dTfF17KGttVdxqK4iAu+FNcYMdPel10dPiXPCmx6n75inN
	DtcIwMM4=
X-Gm-Gg: ASbGncvvuNeipX0+ptCmXMDu9OvB4PAAiMAhTyp1fcQn2pbuuHji0kUL7mA3pR6qUPs
	PGIFfVhIAE6HrMFYSnBZErx5gG87YPM037zMOm/0bQd9LpxZG9fw+gGnj9jbd+rET/b0KPD5pNZ
	Q6lDmIOqW481qaLlAqBxxqYI+iuj5gd1auHnO7devJRdmGly+9F1WUtBXEAQpRJjQbWAIeoKqzd
	aaDuIvs8NxAebKpUfiHEjm0+gERYRvBM+0vTuLy8duGrJL+mGatyYp6zZ73s6s3d0k8PsSRDmlz
	mloYahrjlMi2yAbIByILr/hgoUQSEx98PYLIW1uGjVFQzcp++kV9gqjjJtdrkM8bwDoyEhLE7dZ
	w2LCU8ul0R7YZBtIxse/ILF7oqIWLGKKe3P0h
X-Google-Smtp-Source: AGHT+IFfZz0P744bOsnBF6E91Obgl7tKJTaAFBjI47JryYDBZYPSFYJ+d3Cmj9oOH+5myxPp5fUDCg==
X-Received: by 2002:a17:907:7207:b0:ae3:6b52:f7dd with SMTP id a640c23a62f3a-ae36b52f88amr623705966b.46.1751230986419;
        Sun, 29 Jun 2025 14:03:06 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c011d1sm559318866b.95.2025.06.29.14.03.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 14:03:05 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso6415956a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:03:05 -0700 (PDT)
X-Received: by 2002:a05:6402:1e88:b0:604:e602:77a5 with SMTP id
 4fb4d7f45d1cf-60c88d61e27mr9513911a12.15.1751230984764; Sun, 29 Jun 2025
 14:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Jun 2025 14:02:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqJeFHs_CsO2MeFLi-qceFM7_dVfKBMH4B7oVJaH6tHQ@mail.gmail.com>
X-Gm-Features: Ac12FXw9MK2nKEfHvyZ5gIprUGTbeCIjW809Edf5cB6VU_sT-Ps-6FT_InGlO78
Message-ID: <CAHk-=wjqJeFHs_CsO2MeFLi-qceFM7_dVfKBMH4B7oVJaH6tHQ@mail.gmail.com>
Subject: Linux 6.16-rc4
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Despite a fairly large merge window, things continue to look fairly
calm on the rc front.

So rc4 is about one third filesystem updates (mostly bcachefs, but
some smb and btrfs too), one third drivers (all over, really, but
device mapper stands out mostly due to a couple of reverts due to
performance issues), and one third "miscellaneous". That last third is
pretty random: doc updates, arch fixes (loongarch, um, x86),
selftests, and just various random fixes all over.

Anyway, please do keep testing.

            Linus

---

Adin Scannell (1):
      libbpf: Fix possible use-after-free for externs

Aidan Stewart (1):
      serial: core: restore of_node information in sysfs

Akira Inoue (1):
      HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2

Al Viro (3):
      replace collect_mounts()/drop_collected_mounts() with a safer variant
      attach_recursive_mnt(): do not lock the covering tree when
sliding something under it
      userns and mnt_idmap leak in open_tree_attr(2)

Alan Huang (7):
      bcachefs: Don't allocate new memory when mempool is exhausted
      bcachefs: Fix alloc_req use after free
      bcachefs: Add missing EBUG_ON
      bcachefs: Delay calculation of trans->journal_u64s
      bcachefs: Move bset size check before csum check
      bcachefs: Fix pool->alloc NULL pointer dereference
      bcachefs: Don't unlock the trans if ret doesn't match
BCH_ERR_operation_blocked

Alex Deucher (3):
      drm/amdgpu/mes: add compatibility checks for set_hw_resource_1
      drm/amdgpu/sdma6: add ucode version checks for userq support
      drm/amdgpu/sdma7: add ucode version checks for userq support

Alexandre Ghiti (1):
      riscv: Fix sparse warning in vendor_extensions/sifive.c

Anand Jain (1):
      btrfs: scrub: add prefix for the error messages

Andrej Picej (1):
      dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix lvds-vod* war=
nings

Ankit Nautiyal (1):
      drm/i915/snps_hdmi_pll: Fix 64-bit divisor truncation by using div64_=
u64

Arnd Bergmann (5):
      lib/crypto: sha256: Mark sha256_choose_blocks as __always_inline
      net: qed: reduce stack usage for TLV processing
      wifi: iwlegacy: work around excessive stack usage on clang/kasan
      drm/i915: fix build error some more
      crashdump: add CONFIG_KEYS dependency

Avadhut Naik (1):
      EDAC/amd64: Fix size calculation for Non-Power-of-Two DIMMs

Bharadwaj Raju (1):
      bcachefs: don't return fsck_fix for unfixable node errors in __btree_=
err

Bibo Mao (6):
      LoongArch: KVM: Avoid overflow with array index
      LoongArch: KVM: Add address alignment check for IOCSR emulation
      LoongArch: KVM: Fix interrupt route update with EIOINTC
      LoongArch: KVM: Check interrupt route from physical CPU
      LoongArch: KVM: Check validity of "num_cpu" from user space
      LoongArch: KVM: Disable updating of "num_cpu" and "feature"

Breno Leitao (1):
      net: netpoll: Initialize UDP checksum field before checksumming

Caleb Sander Mateos (2):
      ublk: fix narrowing warnings in UAPI header
      ublk: update UBLK_F_SUPPORT_ZERO_COPY comment in UAPI header

Chao Yu (1):
      f2fs: fix to zero post-eof page

Chaoyi Chen (1):
      drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()

Charles Mirabile (1):
      riscv: fix runtime constant support for nommu kernels

Chen Yu (1):
      scsi: megaraid_sas: Fix invalid node index

Chia-Lin Kao (AceLan) (1):
      HID: quirks: Add quirk for 2 Chicony Electronics HP 5MP Cameras

Chris Chiu (1):
      ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 6 G1a

Christoph Hellwig (2):
      nvme: refactor the atomic write unit detection
      nvme: fix atomic write size validation

Christophe JAILLET (1):
      i2c: omap: Fix an error handling path in omap_i2c_probe()

Chunyan Zhang (1):
      raid6: riscv: Fix NULL pointer dereference caused by a missing clobbe=
r

Dan Carpenter (1):
      cxl: fix return value in cxlctl_validate_set_features()

Dan Williams (1):
      cxl/ras: Fix CPER handler device confusion

Daniel J. Ogorchock (1):
      HID: nintendo: avoid bluetooth suspend/resume stalls

David Hildenbrand (2):
      mm/gup: revert "mm: gup: fix infinite loop within __get_longterm_lock=
ed"
      fs/proc/task_mmu: fix PAGE_IS_PFNZERO detection for the huge zero fol=
io

David Howells (2):
      cifs: Fix the smbd_response slab to allow usercopy
      cifs: Fix reading into an ITER_FOLIOQ from the smbdirect code

Dev Jain (2):
      selftests/mm: add configs to fix testcase failure
      selftests/mm: fix validate_addr() helper

Drew Fustini (1):
      MAINTAINERS: Update Drew Fustini's email address

Duje Mihanovi=C4=87 (1):
      mailmap: update Duje Mihanovi=C4=87's email address

Edward Adam Davis (1):
      tracing: Fix filter logic error

Eric Dumazet (1):
      atm: clip: prevent NULL deref in clip_push()

Even Xu (1):
      HID: Intel-thc-hid: Intel-quicki2c: Enhance QuickI2C reset flow

Fabio Estevam (1):
      serial: imx: Restore original RXTL for console to fix data loss

Faisal Bukhari (1):
      Fix typo in marvell octeontx2 documentation

Fangrui Song (1):
      riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment

Fedor Pchelkin (1):
      s390/pkey: Prevent overflow in size calculation for memdup_user()

Fengnan Chang (1):
      io_uring: make fallocate be hashed work

Filipe Manana (7):
      btrfs: include root in error message when unlinking inode
      btrfs: fix a race between renames and directory logging
      btrfs: fix double unlock of buffer_tree xarray when releasing subpage=
 eb
      btrfs: fix invalid inode pointer dereferences during log replay
      btrfs: don't silently ignore unexpected extent type when replaying lo=
g
      btrfs: fix assertion when building free space tree
      btrfs: fix race between async reclaim worker and close_ctree()

Florian Fainelli (1):
      scripts/gdb: fix dentry_name() lookup

Fr=C3=A9d=C3=A9ric Danis (1):
      Bluetooth: L2CAP: Fix L2CAP MTU negotiation

Ge Yang (1):
      mm/hugetlb: remove unnecessary holding of hugetlb_lock

Haiyue Wang (1):
      fuse: fix runtime warning on truncate_folio_batch_exceptionals()

Han Gao (1):
      riscv: vector: Fix context save/restore with xtheadvector

Hao Ge (1):
      mm/alloc_tag: fix the kmemleak false positive issue in the
allocation of the percpu variable tag->counters

Haoxiang Li (1):
      drm/xe/display: Add check for alloc_ordered_workqueue()

Harshit Mogalapalli (1):
      ALSA: qc_audio_offload: Fix missing error code in prepare_qmi_respons=
e()

Heiko Carstens (1):
      s390/ptrace: Fix pointer dereferencing in regs_get_kernel_stack_nth()

Heinz Mauelshagen (1):
      dm-raid: fix variable in journal device check

Herbert Xu (2):
      crypto: wp512 - Use API partial block handling
      dm-crypt: Extend state buffer size in crypt_iv_lmk_one

Huacai Chen (1):
      LoongArch: Fix build warnings about export.h

Ido Schimmel (1):
      bridge: mcast: Fix use-after-free during router port configuration

Imre Deak (1):
      drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS

Iusico Maxim (1):
      HID: lenovo: Restrict F7/9/11 mode to compact keyboards only

Jack Yu (1):
      ASoC: rt721-sdca: fix boost gain calculation error

Jakub Kicinski (11):
      netlink: specs: nfsd: replace underscores with dashes in names
      netlink: specs: fou: replace underscores with dashes in names
      netlink: specs: ethtool: replace underscores with dashes in names
      netlink: specs: dpll: replace underscores with dashes in names
      netlink: specs: devlink: replace underscores with dashes in names
      netlink: specs: ovs_flow: replace underscores with dashes in names
      netlink: specs: mptcp: replace underscores with dashes in names
      netlink: specs: rt-link: replace underscores with dashes in names
      netlink: specs: tc: replace underscores with dashes in names
      netlink: specs: enforce strict naming of properties
      net: selftests: fix TCP packet checksum

Jayesh Choudhary (1):
      drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type

Jens Axboe (2):
      io_uring/net: mark iov as dynamically allocated even for single segme=
nts
      io_uring/kbuf: flag partial buffer mappings

Jerome Marchand (2):
      bpf: Specify access type of bpf_sysctl_get_name args
      selftests/bpf: Convert test_sysctl to prog_tests

Jiawen Wu (1):
      net: libwx: fix the creation of page_pool

Johannes Berg (2):
      wifi: mac80211: finish link init before RCU publish
      i2c: scx200_acb: depends on HAS_IOPORT

Johannes Thumshirn (1):
      btrfs: zoned: fix alloc_offset calculation for partly
conventional block groups

Josef Bacik (1):
      btrfs: don't drop a reference if btrfs_check_write_meta_pointer() fai=
ls

Kairui Song (2):
      mm/shmem, swap: fix softlockup with mTHP swapin
      mm: userfaultfd: fix race of userfaultfd_move and swap cache

Karan Tilak Kumar (4):
      scsi: fnic: Fix crash in fnic_wq_cmpl_handler when FDMI times out
      scsi: fnic: Turn off FDMI ACTIVE flags on link down
      scsi: fnic: Add and improve logs in FDMI and FDMI ABTS paths
      scsi: fnic: Set appropriate logging level for log message

Karthik Poosa (1):
      drm/xe/hwmon: Fix xe_hwmon_power_max_write

Kees Cook (1):
      LoongArch: Handle KCOV __init vs inline mismatches

Keith Busch (1):
      nvme: reset delayed remove_work after reconnect

Kent Overstreet (43):
      bcachefs: trace_extent_trim_atomic
      bcachefs: btree iter tracepoints
      bcachefs: Fix bch2_journal_keys_peek_prev_min()
      bcachefs: btree_iter: fix updates, journal overlay
      bcachefs: better __bch2_snapshot_is_ancestor() assert
      bcachefs: pass last_seq into fs_journal_start()
      bcachefs: Fix "now allowing incompatible features" message
      bcachefs: Fix snapshot_key_missing_inode_snapshot repair
      bcachefs: fsck: fix add_inode()
      bcachefs: fsck: fix extent past end of inode repair
      bcachefs: opts.journal_rewind
      bcachefs: Kill unused tracepoints
      bcachefs: mark more errors autofix
      bcachefs: fsck: Improve check_key_has_inode()
      bcachefs: Call bch2_fs_init_rw() early if we'll be going rw
      bcachefs: Fix __bch2_inum_to_path() when crossing subvol boundaries
      bcachefs: fsck: Print path when we find a subvol loop
      bcachefs: fsck: Fix remove_backpointer() for subvol roots
      bcachefs: fsck: Fix reattach_inode() for subvol roots
      bcachefs: fsck: check_directory_structure runs in reverse order
      bcachefs: fsck: additional diagnostics for reattach_inode()
      bcachefs: fsck: check_subdir_count logs path
      bcachefs: fsck: Fix check_path_loop() + snapshots
      bcachefs: Fix bch2_read_bio_to_text()
      bcachefs: Fix restart handling in btree_node_scrub_work()
      bcachefs: fsck: Fix check_directory_structure when no check_dirents
      bcachefs: fsck: fix unhandled restart in topology repair
      bcachefs: fsck: Fix oops in key_visible_in_snapshot()
      bcachefs: fix spurious error in read_btree_roots()
      bcachefs: Fix missing newlines before ero
      bcachefs: Fix *__bch2_trans_subbuf_alloc() error path
      bcachefs: Don't log fsck err in the journal if doing repair elsewhere
      bcachefs: Add missing key type checks to check_snapshot_exists()
      bcachefs: Add missing bch2_err_class() to fileattr_set()
      bcachefs: fix spurious error_throw
      bcachefs: Fix range in bch2_lookup_indirect_extent() error path
      bcachefs: Check for bad write buffer key when moving from journal
      bcachefs: Use wait_on_allocator() when allocating journal
      bcachefs: fix bch2_journal_keys_peek_prev_min() underflow
      bcachefs: btree_root_unreadable_and_scan_found_nothing should
not be autofix
      bcachefs: Ensure btree node scan runs before checking for scanned nod=
es
      bcachefs: Ensure we rewind to run recovery passes
      bcachefs: Plumb correct ip to trans_relock_fail tracepoint

Khairul Anuar Romli (1):
      spi: spi-cadence-quadspi: Fix pm runtime unbalance

Kiran K (1):
      Bluetooth: btintel_pcie: Fix potential race condition in firmware dow=
nload

Klara Modin (1):
      riscv: export boot_cpu_hartid

Kuan-Wei Chiu (3):
      Revert "bcache: update min_heap_callbacks to use default builtin swap=
"
      Revert "bcache: remove heap-related macros and switch to generic min_=
heap"
      bcache: remove unnecessary select MIN_HEAP

Kuniyuki Iwashima (6):
      Bluetooth: hci_core: Fix use-after-free in vhci_flush()
      af_unix: Don't leave consecutive consumed OOB skbs.
      af_unix: Add test for consecutive consumed OOB.
      af_unix: Don't set -ECONNRESET for consumed OOB skb.
      selftest: af_unix: Add tests for -ECONNRESET.
      atm: Release atm_dev_mutex after removing procfs in atm_dev_deregiste=
r().

Lachlan Hodges (1):
      wifi: mac80211: fix beacon interval calculation overflow

Leo Martins (2):
      btrfs: fix delayed ref refcount leak in debug assertion
      btrfs: warn if leaking delayed_nodes in btrfs_put_root()

Leo Yan (1):
      perf/aux: Fix pending disable flow when the AUX ring buffer overruns

Li Ming (4):
      cxl/edac: Fix the min_scrub_cycle of a region miscalculation
      cxl/Documentation: Add more description about min/max scrub cycle
      cxl/edac: Fix potential memory leak issues
      cxl/edac: Fix using wrong repair type to check dram event record

Liam R. Howlett (1):
      maple_tree: fix MA_STATE_PREALLOC flag in mas_preallocate()

Linus Torvalds (1):
      Linux 6.16-rc4

Long Li (1):
      net: mana: Record doorbell physical address in PF mode

Lorenzo Stoakes (9):
      MAINTAINERS: add missing mm/workingset.c file to mm reclaim section
      MAINTAINERS: add missing test files to mm gup section
      MAINTAINERS: add further init files to mm init block
      MAINTAINERS: add hugetlb_cgroup.c to hugetlb section
      MAINTAINERS: add stray rmap file to mm rmap section
      MAINTAINERS: add memfd, shmem quota files to shmem section
      MAINTAINERS: add additional mmap-related files to mmap section
      MAINTAINERS: add missing files to mm page alloc section
      MAINTAINERS: add Lorenzo as THP co-maintainer

Louis Chauvet (1):
      drm: writeback: Fix drm_writeback_connector_cleanup signature

Luca Weiss (1):
      ASoC: qcom: sm8250: Fix possibly undefined reference

Lukasz Kucharczyk (1):
      i2c: imx: fix emulated smbus block read

Maarten Lankhorst (1):
      drm/xe: Move DSB l2 flush to a more sensible place

Manivannan Sadhasivam (1):
      PCI/PTM: Build debugfs code only if CONFIG_DEBUG_FS is enabled

Mario Limonciello (3):
      HID: input: lower message severity of 'No inputs registered,
leaving' to debug
      drm/amd: Adjust output for discovery error handling
      drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value

Mark Harmstone (1):
      btrfs: update superblock's device bytes_used when dropping chunk

Matthew Auld (1):
      drm/xe: move DPT l2 flush to a more sensible place

Matthew Wilcox (Oracle) (1):
      f2fs: Fix __write_node_folio() conversion

Michal Hocko (1):
      mm: add OOM killer maintainer structure

Michal Wajdeczko (2):
      drm/xe/guc: Explicitly exit CT safe mode on unwind
      drm/xe: Process deferred GGTT node removals on device unwind

Mike Rapoport (Microsoft) (1):
      MAINTAINERS: add tree entry to mm init block

Ming Lei (3):
      ublk: build batch from IOs in same io_ring_ctx and io task
      selftests: ublk: don't take same backing file for more than one
ublk devices
      ublk: setup ublk_io correctly in case of ublk_get_data() failure

Ming Wang (1):
      LoongArch: Reserve the EFI memory map region

Miri Korenblit (1):
      wifi: iwlwifi: mvm: assume '1' as the default mac_config_cmd version

Nam Cao (2):
      Revert "riscv: misaligned: fix sleeping function called during
misaligned access handling"
      Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"

Nathan Chancellor (1):
      staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher()

Nicolas Pitre (1):
      vt: add missing notification when switching back to text mode

Niklas Cassel (1):
      ata: ahci: Use correct DMI identifier for ASUSPRO-D840SA LPM quirk

Oliver Schramm (1):
      ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15

Oscar Salvador (1):
      MAINTAINERS: update maintainers for HugeTLB

Palmer Dabbelt (1):
      RISC-V: uaccess: Wrap the get_user_8 uaccess macro

Paulo Alcantara (2):
      smb: client: fix regression with native SMB symlinks
      smb: client: fix potential deadlock when reconnecting channels

Pavel Begunkov (3):
      io_uring/rsrc: fix folio unpinning
      io_uring/rsrc: don't rely on user vaddr alignment
      io_uring: don't assume uaddr alignment in io_vec_fill_bvec

Pedro Falcato (1):
      selftests/mm: skip uprobe vma merge test if uprobes are not enabled

Pei Xiao (1):
      ALSA: usb: qcom: fix NULL pointer dereference in qmi_stop_session

Penglei Jiang (1):
      io_uring: fix resource leak in io_import_dmabuf()

Pratap Nirujogi (3):
      i2c: designware: Initialize adapter name only when not set
      i2c: amd-isp: Initialize unique adapter name
      platform/x86: Use i2c adapter name to fix build errors

Pratyush Yadav (2):
      MAINTAINERS: add linux-mm@ list to Kexec Handover
      kho: initialize tail pages for higher order folios properly

Qasim Ijaz (4):
      HID: wacom: fix memory leak on kobject creation failure
      HID: wacom: fix memory leak on sysfs attribute creation failure
      HID: wacom: fix kobject reference count leak
      HID: appletb-kbd: fix "appletb_backlight" backlight device
reference counting

Qu Wenruo (1):
      btrfs: handle csum tree error with rescue=3Dibadroots correctly

Randy Dunlap (1):
      vt: fix kernel-doc warnings in ucs_get_fallback()

Rob Herring (Arm) (3):
      dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
      dt-bindings: serial: Convert altr,juart-1.0 to DT schema
      dt-bindings: serial: Convert altr,uart-1.0 to DT schema

Ronnie Sahlberg (1):
      ublk: sanity check add_dev input for underflow

Salvatore Bonaccorso (1):
      ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X507UAR

Sebastian Andrzej Siewior (1):
      futex: Initialize futex_phash_new during fork().

SeongJae Park (1):
      mm/damon/sysfs-schemes: free old
damon_sysfs_scheme_filter->memcg_path on write

Shannon Nelson (1):
      CREDITS: Add entry for Shannon Nelson

Shivank Garg (1):
      selftests/mm: increase timeout from 180 to 900 seconds

Shuai Zhang (1):
      driver: bluetooth: hci_qca:fix unable to load the BT driver

Simon Horman (1):
      net: enetc: Correct endianness handling in _enetc_rd_reg64

Song Liu (1):
      bpf: Mark dentry->d_inode as trusted_or_null

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx9: Add Cleaner Shader Support for GFX9.x GPUs

Stefan Metzmacher (2):
      smb: client: let smbd_post_send_iter() respect the peers
max_send_size and transmit all data
      smb: client: remove \t from TP_printk statements

Stefano Garzarella (1):
      vsock/uapi: fix linux/vm_sockets.h userspace compilation errors

Stephen Smalley (1):
      selinux: change security_compute_sid to return the ssid or tsid on ma=
tch

Takashi Iwai (2):
      ALSA: hda/realtek: Add mic-mute LED setup for ASUS UM5606
      drm/amd/display: Add sanity checks for drm_edid_raw()

Tamura Dai (1):
      ASoC: SOF: Intel: hda: Use devm_kstrdup() to avoid memleak.

Thomas Fourier (3):
      scsi: fnic: Fix missing DMA mapping error in fnic_send_frame()
      ethernet: ionic: Fix DMA mapping tests
      atm: idt77252: Add missing `dma_map_error()`

Thomas Huth (1):
      LoongArch: Replace __ASSEMBLY__ with __ASSEMBLER__ in headers

Thomas Zeitlhofer (1):
      HID: wacom: fix crash in wacom_aes_battery_handler()

Tim Crawford (1):
      ALSA: hda/realtek: Add quirks for some Clevo laptops

Tiwei Bie (4):
      um: ubd: Add missing error check in start_io_thread()
      um: vfio: Prevent duplicate device assignments
      um: Use correct data source in fpregs_legacy_set()
      um: vector: Reduce stack usage in vector_eth_configure()

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for soundwire failures during hibernation exit seq=
uence

Willem de Bruijn (2):
      bpf: Adjust free target to avoid global starvation of LRU map
      selftests/bpf: adapt one more case in test_lru_map to the new target_=
free

Wolfram Sang (2):
      i2c: robotfuzz-osif: disable zero-length read messages
      i2c: tiny-usb: disable zero-length read messages

Xi Ruoyao (1):
      RISC-V: vDSO: Correct inline assembly constraints in the
getrandom syscall wrapper

Xiaowei Li (1):
      net: usb: qmi_wwan: add SIMCom 8230C composition

Xin Li (Intel) (2):
      x86/traps: Initialize DR6 by writing its architectural reset value
      x86/traps: Initialize DR7 by writing its architectural reset value

Yan Zhai (1):
      bnxt: properly flush XDP redirect lists

Yao Zi (1):
      dt-bindings: serial: 8250: Make clocks and clock-frequency exclusive

Yasmin Fitzgerald (1):
      ALSA: hda/realtek - Enable mute LED on HP Pavilion Laptop 15-eg100

Youngjun Lee (1):
      ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_ua=
c3()

Yu Kuai (2):
      lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
      block: fix false warning in bdev_count_inflight_rw()

Yuan Chen (1):
      libbpf: Fix null pointer dereference in btf_dump__free on
allocation failure

Yuzuru10 (1):
      ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic

Zhang Heng (1):
      HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY

Zhang Lixu (2):
      hid: intel-ish-hid: Use PCI_DEVICE_DATA() macro for ISH device table
      HID: intel-ish-hid: ipc: Add Wildcat Lake PCI device ID

Zhe Qiao (1):
      Revert "PCI/ACPI: Fix allocated memory release on error in
pci_acpi_scan_root()"

Zijun Hu (2):
      mailmap: add entries for Zijun Hu
      mailmap: correct name for a historical account of Zijun Hu

anvithdosapati (1):
      scsi: ufs: core: Fix clk scaling to be conditional in reset and resto=
re
