Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B795882866
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747603167; cv=none; b=gozTgGnlU7J9w+cBxWuNpxa9vVhmG/PhH1nuTl2G6f4F+YiCpysZ9A0LXQjcsd7lAC5i9xUJed97sC2hvAvm5ulxw4D0I8OY7Ow/J+sscAwGjevU+kffspfDfw+qgWrlGtyYnBj8JS9WCdSTYu2AZUevo0H6o04vqqKwxVgSTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747603167; c=relaxed/simple;
	bh=boA2K9PPDpONVjhErrCRukhYxnwxqWArRj4Co/EG9Uk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Z70NFseYyvz1aS4mMOHxhrCxNUHtA66hIEFr40wRu+F5LzfpPAXsKxsJhyfUUzTY+xn3i41uGtQ0xViXpPzslQchaOQw5Ua1dfCHvUi+USfcmWatfX0/dW/pHBYMpKj0uMTNQJ9+7DeWZc00//lNbUdoyPvTkJi/uJv7YBlRNZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E1dm7Dfc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E1dm7Dfc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb85ce788so785473366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747603162; x=1748207962; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p8BXshIZ8JHZnJbnORRoMAZUyNQysXpP/fAS5Zoxb0A=;
        b=E1dm7DfcZSMKvdKkfxfLpWNxIrffND2AgcEnZYNlIAmKU8UvN3Q83kNcHPd23SHXZr
         vvo50hzlESEya8hUvKN+E6Xd2CA1OEuMbZ3MVQMKYsnlQ1+lHeykzSUClZqDRwZLpKXX
         U5QMKar/t2IyaHKY3Vq2b+3HDQ4/8jp3PcAzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603162; x=1748207962;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8BXshIZ8JHZnJbnORRoMAZUyNQysXpP/fAS5Zoxb0A=;
        b=lwL5Q20MXPpAUcCTUL5jnXfvVWoLstwlaM/3Gyk1039MmaIe8cDD5QpeJm1psaiBsC
         Vu4Q5CPjQ1W50jgolLKQABP1qJ7z5/QvzgcX+gA95oDHKbjdLu88bUqF6v76UJDrmhLf
         VV3PC7XtHIqrMSMv/SQxS7ZbV3JLjLrUEPFLEhqbxFGVJB0MbRnw7/BIl0E9a8mFM7Cs
         +jcoIsFygysMYH2iXh86GLoG8nOg/Ay7TMUxrL/n+TEl7m9AlYw2gY3gQ8kaQ8/lxS7H
         44NjzXpPjVhH7qTK+a+uBxNFty7/Ypr3ANVjfzqlcQRrsmwpngzZXiUuKQ4xblhc/thC
         uIxw==
X-Gm-Message-State: AOJu0YwjgRq7Qg/z+3knPc/zpulvF8mrWMtLY1cT+sSmLbyPG4RO3ZXu
	0S2BpXHpxraCfqgjful7HyGkkp9hJ+rqX6YiQzQ5nenTVIM1pU2SbvV+sBMq69aZnoTeFdX27sQ
	6bnk+Xhc=
X-Gm-Gg: ASbGnctkWff9/ztUp95PW+GnOSHGegVY9sPsvFYHJqnKxXjP/O9Z7aiyDg+golKrR8l
	boJFASH3DMbFgefsUEEi0HcHWaJfN8rHeWKIioK2HKVsOjF1LkSunnSibOuA9wCOgVPHUa+kvW7
	zw5HSwcfe66lodK30Oy8mwhj6CQQDiQ3uR34tQ0Z11/1T5WCxt+14WrSU/P5xxosbzF9gkz21vc
	voe2vV2pP1SN0+SYYTcpwTILN69JyUeKN+HeSYXUwwD+r98KdT48ycKXvgvl4jFHUkc8cUKjfew
	fbB7OysifhTCGoc/2vRtVHkfKgvH1VO+J3VLjC4s6YgA6wjUASH5nsZKqZurUCZ0dGZA0EJ+1fJ
	I5H8/mo0/JYYGotiMb8zIBie/xJVVbZHdbE1C
X-Google-Smtp-Source: AGHT+IGy75VjGEHLl9L92gjtpxHnDAKqCXvh3BdhaqBM6g+JLJIwomlz0Po0McxGID64jwsgMdiwyw==
X-Received: by 2002:a17:907:9615:b0:ad5:4cd5:2b32 with SMTP id a640c23a62f3a-ad54cd52d0emr524799066b.1.1747603161455;
        Sun, 18 May 2025 14:19:21 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cc7a8sm494219866b.171.2025.05.18.14.19.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 14:19:20 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-601968db16bso3055633a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:19:20 -0700 (PDT)
X-Received: by 2002:aa7:da1a:0:b0:601:89d4:969f with SMTP id
 4fb4d7f45d1cf-60189d49957mr5643467a12.32.1747603160044; Sun, 18 May 2025
 14:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 18 May 2025 14:19:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whtwpdL9e_5j1oq8C=1EZud_cXerZeHqe5L8y7wG+34EA@mail.gmail.com>
X-Gm-Features: AX0GCFtsKywK3hOoUtPdFlPvW8BEssoVSDydfJfodc-bDF3o-h3LD2C97esGUEM
Message-ID: <CAHk-=whtwpdL9e_5j1oq8C=1EZud_cXerZeHqe5L8y7wG+34EA@mail.gmail.com>
Subject: Linux 6.15-rc7
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So last week was reasonably uneventful, although I do wish we had a
bit less churn. In particular, we had another run of CPU bug
mitigations, which always adds some fun to the workday. Not. But the
fallout seems to have been fairly well contained this time.

Aside from that, some drm Xe fixes stand out, and there's a slightly
bigger patch for sched-ext. The rest looks quite small and harmless.

So while I wish we hadn't had some of the excitement of last week, on
the whole it all still looks pretty solid, and unless something
strange happens I'll do the final 6.15 release next weekend.

             Linus

---

Aaron Kling (1):
      spi: tegra114: Use value to check for invalid delays

Abdun Nihaal (1):
      qlcnic: fix memory leak in qlcnic_sriov_channel_cfg_cmd()

Aditya Garg (1):
      HID: hid-appletb-kbd: Fix wrong date and kernel version in sysfs
interface docs

Adrian Hunter (1):
      perf/x86/intel: Fix segfault with PEBS-via-PT with sample_freq

Ahmad Fatoum (1):
      arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive mode

Alan Adamson (2):
      nvme: multipath: enable BLK_FEAT_ATOMIC_WRITES for multipathing
      nvme: all namespaces in a subsystem must adhere to a common
atomic write size

Alan Huang (1):
      bcachefs: Fix self deadlock

Alessandro Grassi (1):
      spi: spi-sun4i: fix early activation

Alexey Makhalov (1):
      MAINTAINERS: Update Alexey Makhalov's email address

Algea Cao (1):
      phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output 50.25MHz error

Andrea Righi (4):
      sched_ext: Track currently locked rq
      sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()
      sched_ext: Remove duplicate BTF_ID_FLAGS definitions
      sched_ext: Fix rq lock state in hotplug ops

Andrew Bresticker (1):
      irqchip/riscv-imsic: Start local sync timer on correct CPU

Andrew Jeffery (1):
      net: mctp: Ensure keys maintain only one ref to corresponding dev

Aradhya Bhatia (1):
      drm/xe/xe2hpg: Add Wa_22021007897

Asahi Lina (1):
      mailmap: Update email for Asahi Lina

Ashish Kalra (2):
      x86/sev: Do not touch VMSA pages during SNP guest memory kdump
      x86/sev: Make sure pages are not skipped during kdump

Aurabindo Pillai (1):
      drm/amd/display: check stream id dml21 wrapper to get plane_id

Barry Song (1):
      mm: userfaultfd: correct dirty flags set for both present and swap pt=
e

Basavaraj Natikar (1):
      dmaengine: ptdma: Move variable condition check to the first
place and remove redundancy

Bo-Cun Chen (1):
      net: ethernet: mtk_eth_soc: fix typo for declaration MT7988 ESW capab=
ility

Boris Burkov (1):
      btrfs: fix folio leak in submit_one_async_extent()

Breno Leitao (1):
      tracing: fprobe: Fix RCU warning message in list traversal

Carlos Maiolino (2):
      xfs: Fix a comment on xfs_ail_delete
      xfs: Fix comment on xfs_trans_ail_update_bulk()

Carolina Jubran (1):
      net/mlx5e: Disable MACsec offload for uplink representor profile

Charles Keepax (1):
      soundwire: bus: Fix race on the creation of the IRQ domain

Christian Heusel (1):
      ALSA: usb-audio: Add sample rate quirk for Audioengine D1

Christian Hewitt (1):
      arm64: dts: amlogic: dreambox: fix missing clkc_audio node

Christoph Hellwig (1):
      xfs: fix zoned GC data corruption due to wrong bv_offset

Christophe JAILLET (1):
      i2c: designware: Fix an error handling path in i2c_dw_pci_probe()

Claudiu Beznea (5):
      phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
      phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
      phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
driver data
      phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
      phy: renesas: rcar-gen3-usb2: Set timing registers only once

Cong Wang (2):
      net_sched: Flush gso_skb list too during ->change()
      selftests/tc-testing: Add qdisc limit trimming tests

Cosmin Ratiu (2):
      tests/ncdevmem: Fix double-free of queue array
      net: Lock lower level devices when updating features

Cosmin Tanislav (1):
      regulator: max20086: fix invalid memory access

Damien Le Moal (5):
      nvmet: pci-epf: clear completion queue IRQ flag on delete
      nvmet: pci-epf: do not fall back to using INTX if not supported
      nvmet: pci-epf: cleanup nvmet_pci_epf_raise_irq()
      nvmet: pci-epf: improve debug message
      nvmet: pci-epf: remove NVMET_PCI_EPF_Q_IS_SQ

Dan Carpenter (3):
      phy: rockchip-samsung-dcphy: Add missing assignment
      ice, irdma: fix an off by one in error handling code
      phy: tegra: xusb: remove a stray unlock

Daniel Sneddon (2):
      x86/bpf: Call branch history clearing sequence on exit
      x86/bpf: Add IBHF call at end of classic BPF

Dave Jiang (1):
      dmaengine: idxd: Fix ->poll() return value

David (Ming Qiang) Wu (1):
      drm/amdgpu: read back register after written for VCN v4.0.5

David Hildenbrand (1):
      kernel/fork: only call untrack_pfn_clear() on VMAs duplicated for for=
k()

David Wang (1):
      mm/codetag: move tag retrieval back upfront in __free_pages()

Dragan Simic (1):
      arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dts=
i

Emanuele Ghidoli (1):
      gpio: pca953x: fix IRQ storm on system wake up

Eric Biggers (1):
      x86/its: Fix build errors when CONFIG_MODULES=3Dn

Fabio Estevam (1):
      drm/tiny: panel-mipi-dbi: Use drm_client_setup_with_fourcc()

Fedor Pchelkin (1):
      wifi: mt76: disable napi on driver removal

Filipe Manana (1):
      btrfs: fix discard worker infinite loop after disabling discard

Gabe Teeger (1):
      Revert: "drm/amd/display: Enable urgent latency adjustment on DCN35"

Geert Uytterhoeven (3):
      phy: can-transceiver: Re-instate "mux-states" property presence check
      spi: loopback-test: Do not split 1024-byte hexdumps
      ALSA: sh: SND_AICA should depend on SH_DMA_API

George Shen (1):
      drm/amd/display: fix link_set_dpms_off multi-display MST corner case

Gerhard Engleder (1):
      tsnep: fix timestamping with a stacked DSA driver

Hal Feng (1):
      phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection fail=
ure

Hangbin Liu (1):
      tools/net/ynl: ethtool: fix crash when Hardware Clock info is missing

Hans de Goede (1):
      platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection

Hariprasad Kelam (2):
      octeontx2-pf: Fix ethtool support for SDP representors
      octeontx2-af: Fix CGX Receive counters

Henry Martin (1):
      HID: uclogic: Add NULL check in uclogic_input_configured()

Himal Prasad Ghimiray (1):
      drm/gpusvm: Introduce devmem_only flag for allocation

Himanshu Bhavani (1):
      arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing SD card timeout

Huacai Chen (3):
      LoongArch: Fix MAX_REG_OFFSET calculation
      LoongArch: Move __arch_cpu_idle() to .cpuidle.text section
      LoongArch: Save and restore CSR.CNTC for hibernation

Hyejeong Choi (1):
      dma-buf: insert memory barrier before updating num_fences

I Hsin Cheng (1):
      drm/meson: Use 1000ULL when operating with mode->clock

Ido Schimmel (1):
      mlxsw: spectrum_router: Fix use-after-free when deleting GRE net devi=
ces

Ilya Guterman (1):
      nvme-pci: add NVME_QUIRK_NO_DEEPEST_PS quirk for SOLIDIGM P44 Pro

Jakub Kicinski (2):
      netlink: specs: tc: fix a couple of attribute names
      netlink: specs: tc: all actions are indexed arrays

James Morse (6):
      arm64: insn: Add support for encoding DSB
      arm64: proton-pack: Expose whether the platform is mitigated by firmw=
are
      arm64: proton-pack: Expose whether the branchy loop k value
      arm64: bpf: Add BHB mitigation to the epilogue for cBPF programs
      arm64: bpf: Only mitigate cBPF programs loaded by unprivileged users
      arm64: proton-pack: Add new CPUs 'k' values for branch mitigation

Jan Kara (1):
      udf: Make sure i_lenExtents is uptodate on inode eviction

Janne Grunau (1):
      arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on

Jarkko Sakkinen (1):
      tpm: Mask TPM RC in tpm2_start_auth_session()

Jeff Layton (2):
      nfs: don't share pNFS DS connections between net namespaces
      nfs: move the nfs4_data_server_cache into struct nfs_net

Jens Axboe (2):
      io_uring/memmap: don't use page_address() on a highmem page
      io_uring/fdinfo: grab ctx->uring_lock around io_uring_show_fdinfo()

Jeremy Bongio (1):
      fs: Remove redundant errseq_set call in mark_buffer_write_io_error.

Jeremy Linton (1):
      ACPI: PPTT: Fix processor subtable walk

Jethro Donaldson (1):
      smb: client: fix memory leak during error handling for POSIX mkdir

Jiapeng Chong (1):
      HID: hid-steam: Remove the unused variable connected

Jiawen Wu (3):
      net: txgbe: Fix to calculate EEPROM checksum for AML devices
      net: libwx: Fix FW mailbox reply timeout
      net: libwx: Fix FW mailbox unknown command

John Chau (1):
      platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS

John Olender (1):
      drm/amd/display: Defer BW-optimization-blocked DRR adjustments

Jonas Gorski (1):
      net: dsa: b53: prevent standalone from trying to forward to other por=
ts

Kairui Song (1):
      mm/memory: fix mapcount / refcount sanity check for mTHP reuse

Kees Cook (3):
      binfmt_elf: Move brk for static PIE even if ASLR disabled
      nvme-pci: make nvme_pci_npages_prp() __always_inline
      wifi: mac80211: Set n_channels after allocating struct
cfg80211_scan_request

Keith Busch (2):
      block: always allocate integrity buffer when required
      nvme-pci: acquire cq_poll_lock in nvme_poll_irqdisable

Kent Overstreet (8):
      bcachefs: Don't strip rebalance_opts from indirect extents
      bcachefs: Fix broken btree_path lock invariants in next_node()
      bcachefs: Fix livelock in journal_entry_open()
      bcachefs: Don't set btree nodes as accessed on fill
      bcachefs: Fix set_should_be_locked() call in peek_slot()
      bcachefs: Fix accidental O(n^2) in fiemap
      bcachefs: Fix missing commit in backpointer to missing target
      bcachefs: fix wrong arg to fsck_err()

Kirill A. Shutemov (2):
      mm/page_alloc: ensure try_alloc_pages() plays well with unaccepted me=
mory
      mm/page_alloc: fix race condition in unaccepted memory handling

Konstantin Shkolnyy (1):
      vsock/test: Fix occasional failure in SIOCOUTQ tests

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Align wifi node name with bindings in CB2

Kyoji Ogasawara (1):
      btrfs: add back warning for mount option commit values exceeding 300

Li Lingfeng (1):
      nfs: handle failure of nfs_get_lock_context in unlock path

Linus Torvalds (1):
      Linux 6.15-rc7

Lorenzo Stoakes (1):
      MAINTAINERS: add mm GUP section

Luis Chamberlain (1):
      swapfile: disable swapon for bs > ps devices

Luiz Augusto von Dentz (2):
      Bluetooth: MGMT: Fix MGMT_OP_ADD_DEVICE invalid device flags
      Bluetooth: hci_event: Fix not using key encryption size when its know=
n

Lukas Bulwahn (1):
      x86/mm: Remove duplicated word in warning message

Lukas Wunner (1):
      tools: ynl-gen: Allow multi-attr without nested-attributes again

Ma Ke (1):
      phy: Fix error handling in tegra_xusb_port_init

Marc Zyngier (1):
      irqchip: Drop MSI_CHIP_FLAG_SET_ACK from unsuspecting MSI drivers

Mario Limonciello (4):
      HID: amd_sfh: Fix SRA sensor when it's the only sensor
      HID: amd_sfh: Avoid clearing reports for SRA sensor
      drivers/platform/x86/amd: pmf: Check for invalid sideloaded
Smart PC Policies
      drivers/platform/x86/amd: pmf: Check for invalid Smart PC Policies

Markus Burri (2):
      accel/ivpu: Use effective buffer size for zero terminator
      gpio: virtuser: fix potential out-of-bound write

Martin Blumenstingl (4):
      ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM cloc=
k
      ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM clo=
ck
      arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
      arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock

Masahiro Yamada (4):
      um: let 'make clean' properly clean underlying SUBARCH as well
      init: remove unused CONFIG_CC_CAN_LINK_STATIC
      kbuild: fix dependency on sorttable
      kbuild: fix typos "module.builtin" to "modules.builtin"

Masami Hiramatsu (Google) (1):
      tracing: probes: Fix a possible race in trace_probe_log APIs

Mathieu Othacehe (1):
      net: cadence: macb: Fix a possible deadlock in macb_halt_tx.

Matt Johnston (1):
      net: mctp: Don't access ifa_index when missing

Matthew Brost (3):
      drm/xe: Strict migration policy for atomic SVM faults
      drm/gpusvm: Add timeslicing support to GPU SVM
      drm/xe: Timeslice GPU on atomic SVM fault

Matthias Schiffer (1):
      batman-adv: fix duplicate MAC address check

Max Kellermann (1):
      fs/eventpoll: fix endless busy loop after timeout has expired

Melissa Wen (2):
      drm/amd/display: Fix null check of pipe_ctx->plane_state for
update_dchubp_dpp
      Revert "drm/amd/display: Hardware cursor changes color when
switched to software cursor"

Michael Chan (1):
      bnxt_en: bring back rtnl_lock() in the bnxt_open() path

Michael Kelley (5):
      Drivers: hv: Allow vmbus_sendpacket_mpb_desc() to create multiple ran=
ges
      hv_netvsc: Use vmbus_sendpacket_mpb_desc() to send VMBus messages
      hv_netvsc: Preserve contiguous PFN grouping in the page buffer array
      hv_netvsc: Remove rmsg_pgcnt
      Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()

Michal Suchanek (1):
      tpm: tis: Double the timeout B to 4s

Michal Swiatkowski (1):
      irdma: free iwdev->rf after removing MSI-X

Micka=C3=ABl Sala=C3=BCn (2):
      landlock: Remove KUnit test that triggers a warning
      landlock: Improve bit operations in audit code

Milton Barrera (1):
      HID: quirks: Add ADATA XPG alpha wireless mouse support

Ming Lei (1):
      ublk: fix dead loop when canceling io command

Ming Yen Hsieh (1):
      wifi: mt76: mt7925: fix missing hdr_trans_tlv command for broadcast w=
tbl

Nathan Chancellor (2):
      net: qede: Initialize qede_ll_ops with designated initializer
      kbuild: Disable -Wdefault-const-init-unsafe

Nathan Lynch (1):
      dmaengine: Revert "dmaengine: dmatest: Fix dmatest waiting less
when interrupted"

Nicolas Chauvet (1):
      ALSA: usb-audio: Add sample rate quirk for Microdia JP001 USB Camera

Nicolas Frattaroli (1):
      arm64: dts: rockchip: fix Sige5 RTC interrupt pin

Nirjhar Roy (IBM) (1):
      xfs: Fail remount with noattr2 on a v5 with v4 enabled

Nitin Rawat (1):
      phy: qcom-qmp-ufs: check for mode type for phy setting

Oleksij Rempel (2):
      net: dsa: microchip: let phylink manage PHY EEE configuration on
KSZ switches
      net: phy: micrel: remove KSZ9477 EEE quirks now handled by phylink

Paul Cacheux (1):
      tracing: add missing trace_probe_log_clear for eprobes

Paulo Alcantara (1):
      smb: client: fix zero rsize error messages

Pawan Gupta (11):
      x86/bhi: Do not set BHI_DIS_S in 32-bit mode
      Documentation: x86/bugs/its: Add ITS documentation
      x86/its: Enumerate Indirect Target Selection (ITS) bug
      x86/its: Add support for ITS-safe indirect thunk
      x86/its: Add support for ITS-safe return thunk
      x86/its: Enable Indirect Target Selection mitigation
      x86/its: Add "vmexit" option to skip mitigation on some CPUs
      x86/its: Add support for RSB stuffing mitigation
      x86/its: Align RETs in BHB clear sequence to avoid thunking
      x86/ibt: Keep IBT disabled during alternative patching
      selftest/x86/bugs: Add selftests for ITS

Pengtao He (1):
      net/tls: fix kernel panic when alloc_page failed

Peter Hutterer (1):
      HID: bpf: fix BTN_STYLUS for the XP Pen ACK05 remote

Peter Ujfalusi (1):
      ALSA/hda: intel-sdw-acpi: Correct sdw_intel_acpi_scan() function para=
meter

Peter Zijlstra (3):
      mm/execmem: Unify early execmem_cache behaviour
      x86/its: Use dynamic thunks for indirect branches
      x86/its: FineIBT-paranoid vs ITS

Philip Yang (1):
      drm/amdgpu: csa unmap use uninterruptible lock

Purva Yeshi (2):
      dmaengine: idxd: cdev: Fix uninitialized use of sva in idxd_cdev_open
      char: tpm: tpm-buf: Add sanity check fallback in read helpers

Qasim Ijaz (4):
      HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
      HID: wacom: handle kzalloc() allocation failure in wacom_wac_queue_fl=
ush()
      HID: wacom: fix memory leak on size mismatch in wacom_wac_queue_flush=
()
      HID: wacom: fix shift OOB in kfifo allocation for zero pktlen

Qiu-ji Chen (1):
      dmaengine: mediatek: Fix a possible deadlock error in
mtk_cqdma_tx_status()

Randy Dunlap (1):
      usr/include: openrisc: don't HDRTEST bpf_perf_event.h

Rob Herring (Arm) (3):
      arm64: dts: rockchip: Use "regulator-fixed" for btreg on
px30-engicam for vcc3v3-btreg
      arm64: dts: rockchip: Fix mmc-pwrseq clock name on rock-pi-4
      arm64: dts: amazon: Fix simple-bus node name schema warnings

Ronald Wahl (1):
      dmaengine: ti: k3-udma: Add missing locking

Rong Zhang (1):
      HID: bpf: abort dispatch if device destroyed

Runhua He (1):
      platform/x86/amd/pmc: Declare quirk_spurious_8042 for MECHREVO
Wujie 14XA (GX4HRXL)

Sam Edwards (1):
      arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down

Sami Tolvanen (1):
      kbuild: Require pahole <v1.28 or >v1.29 with GENDWARFKSYMS on X86

Seongman Lee (1):
      x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro

Sergey Senozhatsky (1):
      zsmalloc: don't underflow size calculation in zs_obj_write()

Sergey Shtylyov (2):
      nfs: direct: drop useless initializer in nfs_direct_write_completion(=
)
      nfs: nfs3acl: drop useless assignment in nfs3_get_acl()

Shuai Xue (9):
      dmaengine: idxd: fix memory leak in error handling path of idxd_setup=
_wqs
      dmaengine: idxd: fix memory leak in error handling path of
idxd_setup_engines
      dmaengine: idxd: fix memory leak in error handling path of
idxd_setup_groups
      dmaengine: idxd: Add missing cleanup for early error out in
idxd_setup_internals
      dmaengine: idxd: Add missing cleanups in cleanup internals
      dmaengine: idxd: fix memory leak in error handling path of idxd_alloc
      dmaengine: idxd: fix memory leak in error handling path of idxd_pci_p=
robe
      dmaengine: idxd: Add missing idxd cleanup to fix memory leak in
remove call
      dmaengine: idxd: Refactor remove call with idxd_cleanup() helper

Stefan Wahren (1):
      dmaengine: fsl-edma: Fix return code for unhandled interrupts

Stephen Smalley (1):
      fs/xattr.c: fix simple_xattr_list to always include security.* xattrs

Steve Siwinski (1):
      scsi: sd_zbc: block: Respect bio vector limits for REPORT ZONES buffe=
r

Steven Rostedt (2):
      tracing: samples: Initialize trace_array_printk() with the
correct function
      ring-buffer: Fix persistent buffer when commit page is the reader pag=
e

Subbaraya Sundeep (2):
      octeontx2-pf: macsec: Fix incorrect max transmit size in TX secy
      octeontx2-pf: Do not reallocate all ntuple filters

Suma Hegde (1):
      platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually
exclusive drivers

Taehee Yoo (1):
      net: devmem: fix kernel panic when netlink socket close after
module unload

Takashi Iwai (2):
      ALSA: seq: Fix delivery of UMP events to group ports
      ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info

Tejun Heo (1):
      sched_ext: bpf_iter_scx_dsq_new() should always initialize iterator

Thomas Hellstr=C3=B6m (1):
      drm/xe: Fix the gem shrinker name

Thomas Wei=C3=9Fschuh (2):
      Revert "kbuild: make all file references relative to source root"
      Revert "kbuild, rust: use -fremap-path-prefix to make paths relative"

Tianyang Zhang (1):
      LoongArch: Prevent cond_resched() occurring within kernel-fpu

Tiezhu Yang (2):
      LoongArch: uprobes: Remove user_{en,dis}able_single_step()
      LoongArch: uprobes: Remove redundant code about resume_era

Tim Huang (1):
      drm/amdgpu: fix incorrect MALL size for GFX1151

Tom Vincent (1):
      arm64: dts: rockchip: Assign RT5616 MCLK rate on
rk3588-friendlyelec-cm3588

Trond Myklebust (7):
      NFSv4: Handle fatal ENETDOWN and ENETUNREACH errors
      NFSv4/pnfs: Layoutreturn on close must handle fatal networking errors
      pNFS/flexfiles: Record the RPC errors in the I/O tracepoints
      NFS/localio: Fix a race in nfs_local_open_fh()
      NFSv4/pnfs: Reset the layout state after a layoutreturn
      NFS/pnfs: Fix the error path in pnfs_layoutreturn_retry_later_locked(=
)
      NFS: Avoid flushing data while holding directory locks in nfs_rename(=
)

Umesh Nerlige Ramappa (3):
      drm/xe: Save CTX_TIMESTAMP mmio value instead of LRC value
      drm/xe: Save the gt pointer in lrc and drop the tile
      drm/xe: Add WA BB to capture active context utilization

Uwe Kleine-K=C3=B6nig (1):
      arm64: dts: rockchip: Add pinmuxing for eMMC on QNAP TS433

Vinicius Costa Gomes (1):
      dmaengine: idxd: Fix allowing write() from different address spaces

Vinod Koul (1):
      dmaengine: mediatek: drop unused variable

Vladimir Oltean (2):
      net: dsa: sja1105: discard incoming frames in BR_STATE_LISTENING
      docs: networking: timestamping: improve stacked PHC sentence

Waiman Long (1):
      cgroup/cpuset: Extend kthread_is_per_cpu() check to all
PF_NO_SETAFFINITY tasks

WangYuli (2):
      kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
      kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to BuildRequires

Wayne Chang (1):
      phy: tegra: xusb: Use a bitmask for UTMI pad power state tracking

Wayne Lin (2):
      drm/amd/display: Correct the reply value when AUX write incomplete
      drm/amd/display: Avoid flooding unnecessary info messages

Wengang Wang (1):
      xfs: free up mp->m_free[0].count in error case

Wentao Liang (1):
      ALSA: es1968: Add error handling for snd_pcm_hw_constraint_pow2()

Wolfram Sang (2):
      MAINTAINERS: delete email for Shiraz Hashim
      MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer

Wupeng Ma (1):
      mm: hugetlb: fix incorrect fallback for subpool

Yazen Ghannam (1):
      x86/CPU/AMD: Add X86_FEATURE_ZEN6

Yemike Abhilash Chandra (1):
      dmaengine: ti: k3-udma: Use cap_mask directly from dma_device
structure instead of a local copy

Ze Huang (1):
      riscv: dts: sophgo: fix DMA data-width configuration for CV18xx

Zhu Yanjun (2):
      RDMA/rxe: Fix slab-use-after-free Read in rxe_queue_cleanup bug
      RDMA/core: Fix "KASAN: slab-use-after-free Read in
ib_register_device" problem

hexue (1):
      io_uring/uring_cmd: fix hybrid polling initialization issue

pengdonglin (2):
      ftrace: Fix preemption accounting for stacktrace trigger command
      ftrace: Fix preemption accounting for stacktrace filter command
