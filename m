Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306D846C
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748217221; cv=none; b=axs9BM/wBYUk0CMjouRCUcSWauuiShM1qEhwYTXkfgsK74II8i7znCfHPkjDIuffi2AGleJatN7UBPjWuLfFwP6QJkDv8CKJAEPLvUBCSx+2UBRSf9wJAje7Cb6wRL10BQROxNzlfQOALwgJHgcGP/+g1wdIA0CEYosihXmzxLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748217221; c=relaxed/simple;
	bh=vs3b4/7d39i9HigqJXPEyiSDJzmj8rXGwKRGHuMlc/o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nliTvGgMBjAgmPfaIYeFGxoqzGc7OZSkKU40b1R5mkTTNghbe+QanRdFd5T6OacbyzEqMw5cTjuR2HMcJ5wUcj5vx1eopX5Xb1x2ys18G9eJ33eZxLaQBdnB4Nc/IWUsc8CtP0GUtPD8KmVppCSX1j1FCQevVEQtuXWlyM4WMXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YJSkilVA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YJSkilVA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so765661a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748217216; x=1748822016; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgxhEAyAmmju3MyAChnVhPddtpGz5thijcu1KRfRPEo=;
        b=YJSkilVAZYOrxpOXWN8shjy56JiIr/KXOYSz1Bw5T/gaRXN2n7OgcxjwtzRryEdb3Z
         lFBqbsh27EkZkm2C6D/6RLZxIcDk6e2bV5hxyEoUmIZCmkYQpAjXwz6tjkW5CqrFAfWG
         nqjw2gj2WBOQAzHINQAyzFp9RyHJ3gmJoWpj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748217216; x=1748822016;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgxhEAyAmmju3MyAChnVhPddtpGz5thijcu1KRfRPEo=;
        b=iyBrteoizIF/1M34+tGjFZJ06doj0Thne/i62VPYbKWLlFpeKDjlX2Kc62BjBP5cHO
         SBNJtmffgvX83jWQjkyE15ybU32lCGuhdYXT9RT9oQwH+8+7kW6Z4l3jUSyRQRHMYhOF
         EWjsbmuNPmZG64bM4benvxgQ8zT3l5jSPjnA1sIHUvlyTMUCGFZgzXJ4oMZHPYf1Ki7g
         c/epPTSdbYOdxxDk+/2yvwOwjVLZKsidiSw4rcw50WH5QxbO7oP4590+X1soOjJOWPev
         K51lTqP8rWVqESeIv5SXRQZpdtDQPxyNHbDwQmW4XLf64kU8G71axIi2xyILgInwhXmZ
         oWXw==
X-Gm-Message-State: AOJu0YyIritFDu0hTcDmx7cZ43TGPwoFltr91CoZ78nF0/6aKuh1ZeLt
	h7qQIRIcz+LDQWFKMDGHPT7kb6dsWxsw3eKW9Aw72RG695KOskBV/WTPIYMcXdKJ0fgebOis3IJ
	eYShf8C0=
X-Gm-Gg: ASbGncsXpz5eb7eouHobsXgU3RiPXDRD45YnFJfRvqmHDd3yRUQSGcWDaF+uEnJKZt3
	S8zYyUyMfETYt0Wvv3WJ8ABoTCAWLOaayaKIDWFjNXZQxUQyjNf1SdPbTXp9uR39fdvyojkJZWE
	IpaDiPf9za1/hW+Vfumr1eX1aXhfGmiKVD2rmyTiECyyMF4ebMPSEalFpWDpQ7h8t9kMPGwFC2m
	pAaoY6i2fXfDo/RNnN2XvvlvFNuiJ+LgoO+0dflUyOVmuIFMgqEQs8/E3Mgl+xRMA5Iu0RHHxu6
	xGwUDZovradtzjkMcUT94WnlIby4PXKYKQepck/fCpxO3n4cPJgfeuTYaAkwwT9059sGPE7N6Gn
	pRPPTX8l9SBMD+fCQnpQqLkcGY+ZjVRSXO1Ck
X-Google-Smtp-Source: AGHT+IFrKNcUg2ECUUbFGA+HV6utoOTAvYvjduWt64sarKuhnWrL6vtS7GScIfzFbUFEr8p39gQX8A==
X-Received: by 2002:a17:906:f590:b0:ad4:c55e:ef8b with SMTP id a640c23a62f3a-ad85b20ad2cmr636737766b.48.1748217216511;
        Sun, 25 May 2025 16:53:36 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d442069sm1603357866b.103.2025.05.25.16.53.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 16:53:35 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6045b95d1feso2081965a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 16:53:35 -0700 (PDT)
X-Received: by 2002:a17:907:9496:b0:ad5:bf7:b801 with SMTP id
 a640c23a62f3a-ad85b0b88c8mr661821966b.19.1748217215221; Sun, 25 May 2025
 16:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 25 May 2025 16:53:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLRW8DN8-4jmeCZH0OpO8skXOC5e6FwMfsPwGMpQYmVQ@mail.gmail.com>
X-Gm-Features: AX0GCFs1za0PDG1DkN8jgU6Xie69SBCyMp5-TvdhdI-8tPIXx0u2dHlseAPgH9o
Message-ID: <CAHk-=wiLRW8DN8-4jmeCZH0OpO8skXOC5e6FwMfsPwGMpQYmVQ@mail.gmail.com>
Subject: Linux 6.15
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So this was delayed by a couple of hours because of a last-minute bug
report resulting in one new feature being disabled at the eleventh
hour, but 6.15 is out there now.

Apart from that final scramble, things looked pretty normal last week.
Various random small fixes all over, with drivers as usual accounting
for most of it.  But we've got some bcachefs fixes, some core
networking, and some mm fixes in there too. Nothing looks particularly
scary.

And this obviously means that the merge window opens tomorrow as
usual, and I see the usual people being proactive and having sent me
their pull requests. It's memorial day tomorrow here in the US, but
like the USPS, "neither snow nor rain nor heat nor gloom of night" -
nor memorial day - stops the merge window.

[ Actually, thinking back on the ice storm of last winter, sometimes
snow *does* stop the merge window. But only temporarily ]

Anyway, please keep testing,

            Linus

---

Alexander Gordeev (1):
      kasan: avoid sleepable page allocation from atomic context

Andre Przywara (2):
      clk: sunxi-ng: fix order of arguments in clock macro
      clk: sunxi-ng: d1: Add missing divider for MMC mod clocks

Andr=C3=A9 Draszik (1):
      clk: s2mps11: initialise clk_hw_onecell_data::num before
accessing ::hws[] in probe()

Arnd Bergmann (1):
      ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET

Axel Forsman (3):
      can: kvaser_pciefd: Force IRQ edge in case of nested IRQ
      can: kvaser_pciefd: Fix echo_skb race
      can: kvaser_pciefd: Continue parsing DMA buf after dropped RX

Bogdan-Gabriel Roman (1):
      spi: spi-fsl-dspi: Halt the module after a new message transfer

Breno Leitao (1):
      memcg: always call cond_resched() after fn()

Caleb Sander Mateos (1):
      io_uring/cmd: axe duplicate io_uring_cmd_import_fixed_vec() declarati=
on

Carlos Sanchez (1):
      can: slcan: allow reception of short error messages

Chris Chiu (1):
      ALSA: hda/realtek - Add new HP ZBook laptop with micmute led fixup

Christoph Hellwig (1):
      loop: don't require ->write_iter for writable files in loop_configure

Cong Wang (2):
      sch_hfsc: Fix qlen accounting bug when using peek in hfsc_enqueue()
      selftests/tc-testing: Add an HFSC qlen accounting test

Dan Carpenter (1):
      pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()

Dave Ertman (1):
      ice: Fix LACP bonds without SRIOV environment

David Wang (1):
      module: release codetag section when module load fails

Davidlohr Bueso (4):
      fs/buffer: use sleeping lookup in __getblk_slowpath()
      fs/buffer: avoid redundant lookup in getblk slowpath
      fs/buffer: remove superfluous statements
      fs/buffer: optimize discard_buffer()

Dmitry Baryshkov (2):
      gpiolib: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()

Dmitry Torokhov (1):
      Input: synaptics-rmi - fix crash with unsupported versions of F34

Dominik Grzegorzek (1):
      padata: do not leak refcount in reorder_work

Ed Burcher (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10

En-Wei Wu (1):
      Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump han=
dling

Eric Dumazet (1):
      idpf: fix idpf_vport_splitq_napi_poll()

Fabio Estevam (1):
      arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected

Florent Revest (1):
      mm: fix VM_UFFD_MINOR =3D=3D VM_SHADOW_STACK on USERFAULTFD=3Dy && AR=
M64_GCS=3Dy

Gabor Juhos (1):
      arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs

Ge Yang (1):
      mm/hugetlb: fix kernel NULL pointer dereference when replacing
free hugetlb folios

Geert Uytterhoeven (1):
      pmdomain: renesas: rcar: Remove obsolete nullify checks

Geetha sowjanya (1):
      octeontx2-af: Fix APR entry mapping based on APR_LMT_CFG

Greg Kroah-Hartman (1):
      spi: use container_of_cont() for to_spi_device()

Heiko Stuebner (1):
      clk: rockchip: rk3576: define clk_otp_phy_g

Ido Schimmel (1):
      bridge: netfilter: Fix forwarding of fragmented packets

Ignacio Moreno Gonzalez (1):
      mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is enabled

Ilia Gavrilov (1):
      llc: fix data loss when reading from a socket in llc_ui_recvmsg()

Ivan Pravdin (1):
      crypto: algif_hash - fix double free in hash_accept

Ivaylo Ivanov (1):
      soc: samsung: usi: prevent wrong bits inversion during unconfiguring

Jacob Keller (1):
      ice: fix vf->num_mac count with port representors

Jakob Unterwurzacher (1):
      net: dsa: microchip: linearize skb for tail-tagging switches

Jarkko Sakkinen (1):
      mailmap: add Jarkko's employer email address

Jens Axboe (1):
      io_uring/net: only retry recv bundle for a full transfer

Jernej Skrabec (1):
      Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection=
"

Jijie Shao (2):
      net: hibmcge: fix incorrect statistics update issue
      net: hibmcge: fix wrong ndo.open() after reset fail issue.

Judith Mendez (1):
      mmc: sdhci_am654: Add SDHCI_QUIRK2_SUPPRESS_V1P8_ENA quirk to
am62 compatible

Kai Vehmanen (1):
      ASoc: SOF: topology: connect DAI to a single DAI link

Kailang Yang (1):
      ALSA: hda/realtek - restore auto-mute mode for Dell Chrome platform

Kees Cook (2):
      mm: vmalloc: actually use the in-place vrealloc region
      mm: vmalloc: only zero-init on vrealloc shrink

Kent Overstreet (6):
      bcachefs: Fix bch2_btree_path_traverse_cached() when paths realloced
      bcachefs: fix extent_has_stripe_ptr()
      bcachefs: mkwrite() now only dirties one page
      bcachefs: Fix casefold opt via xattr interface
      bcachefs: Fix bch2_dirent_create_snapshot() for casefolding
      bcachefs: Check for casefolded dirents in non casefolded dirs

Lance Yang (1):
      MAINTAINERS: add hung-task detector section

Larisa Grigore (2):
      spi: spi-fsl-dspi: restrict register range for regmap access
      spi: spi-fsl-dspi: Reset SR flags before sending a new message

Linus Torvalds (2):
      Disable FOP_DONTCACHE for now due to bugs
      Linux 6.15

Lorenzo Bianconi (1):
      net: airoha: Fix page recycling in airoha_qdma_rx_process()

Lorenzo Stoakes (4):
      MAINTAINERS: update page allocator section
      MAINTAINERS: add mm reclaim section
      MAINTAINERS: add mm ksm section
      MAINTAINERS: add mm memory policy section

Luiz Augusto von Dentz (1):
      Bluetooth: L2CAP: Fix not checking l2cap_chan security level

Mario Limonciello (1):
      Revert "drm/amd: Keep display off while going into S4"

Mark Pearson (2):
      platform/x86: thinkpad_acpi: Ignore battery threshold change
event notification
      platform/x86: think-lmi: Fix attribute name usage for non-compliant i=
tems

Matt Atwood (1):
      drm/xe/ptl: Update the PTL pci id table

Matthew Wilcox (Oracle) (1):
      highmem: add folio_test_partial_kmap()

Matti Lehtim=C3=A4ki (1):
      remoteproc: qcom_wcnss: Fix on platforms without fallback regulators

Michael Chan (1):
      bnxt_en: Fix netdev locking in ULP IRQ functions

Mike Marshall (1):
      orangefs: adjust counting code to recover from 665575cf

Mike Rapoport (Microsoft) (1):
      mm/cma: make detection of highmem_start more robust

Namjae Jeon (3):
      ksmbd: fix stream write failure
      ksmbd: fix rename failure
      ksmbd: use list_first_entry_or_null for opinfo_get_list()

Nicolas Frattaroli (1):
      mmc: sdhci-of-dwcmshc: add PD workaround on RK3576

Nilay Shroff (1):
      nvme: avoid creating multipath sysfs group under namespace path devic=
es

Nishanth Menon (1):
      net: ethernet: ti: am65-cpsw: Lower random mac address error print to=
 info

N=C3=ADcolas F. R. A. Prado (1):
      ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET set or disable=
d

Oliver Hartkopp (2):
      can: bcm: add locking for bcm_op runtime updates
      can: bcm: add missing rcu read protection for procfs content

Paolo Abeni (1):
      mr: consolidate the ipmr_can_free_table() checks.

Paul Barker (1):
      MAINTAINERS: Drop myself to reviewer for ravb driver

Paul Chaignon (1):
      xfrm: Sanitize marks before insert

Paul Kocialkowski (1):
      net: dwmac-sun8i: Use parsed internal PHY address instead of 1

Pavan Kumar Linga (1):
      idpf: fix null-ptr-deref in idpf_features_check

Pavel Begunkov (1):
      io_uring: fix overflow resched cqe reordering

Peter Ujfalusi (3):
      ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_e=
xt
      ASoC: SOF: ipc4-pcm: Delay reporting is only supported for
playback direction
      ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms

Ricardo Ca=C3=B1uelo Navarro (1):
      mm: fix copy_vma() error handling for hugetlb mappings

Rob Herring (Arm) (1):
      dt-bindings: can: microchip,mcp2510: Fix $id path

Ronak Doshi (1):
      vmxnet3: update MTU after device quiesce

Sabrina Dubroca (3):
      espintcp: fix skb leaks
      espintcp: remove encap socket caching to avoid reference leak
      xfrm: ipcomp: fix truesize computation on receive

Sagi Maimon (1):
      ptp: ocp: Limit signal/freq counts in summary output functions

Samiullah Khawaja (1):
      xsk: Bring back busy polling support in XDP_COPY

Shuicheng Lin (1):
      drm/xe: Use xe_mmio_read32() to read mtcfg register

Stanislav Fomichev (1):
      team: grab team lock during team_change_rx_flags

Stefan Binding (1):
      ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA

Subbaraya Sundeep (1):
      octeontx2-af: Set LMT_ENA bit for APR table entries

Suman Ghosh (1):
      octeontx2-pf: Avoid adding dcbnl_ops for LBK and SDP vf

Suren Baghdasaryan (1):
      alloc_tag: allocate percpu counters for module tags dynamically

Takashi Iwai (1):
      ALSA: pcm: Fix race of buffer access at PCM OSS layer

Tavian Barnes (1):
      ASoC: SOF: Intel: hda: Fix UAF when reloading module

Tejas Upadhyay (1):
      drm/xe/mocs: Check if all domains awake

Thangaraj Samynathan (1):
      net: lan743x: Restore SGMII CTRL register on resume

Tianyang Zhang (1):
      mm/page_alloc.c: avoid infinite retries caused by cpuset race

Tobias Brunner (1):
      xfrm: Fix UDP GRO handling for some corner cases

Todd Brandt (1):
      platform/x86/intel/pmc: Fix Arrow Lake U/H NPU PCI ID

Tudor Ambarus (1):
      firmware: exynos-acpm: check saved RX before bailing out on empty RX =
queue

Tushar Dave (1):
      iommu: Skip PASID validation for devices without PASID capability

Uladzislau Rezki (Sony) (1):
      MAINTAINERS: add myself as vmalloc co-maintainer

Valtteri Koskivuori (1):
      platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys

Vicki Pfau (1):
      Input: xpad - add more controllers

Vladimir Moskovkin (1):
      platform/x86: dell-wmi-sysman: Avoid buffer overflow in
current_password_store()

Wang Liang (1):
      net/tipc: fix slab-use-after-free Read in tipc_aead_encrypt_done

Wang Yaxin (1):
      taskstats: fix struct taskstats breaks backward compatibility
since version 15

Wang Zhaolong (2):
      smb: client: Fix use-after-free in cifs_fill_dirent
      smb: client: Reset all search buffer pointers when releasing buffer

Zhang Rui (1):
      thermal: intel: x86_pkg_temp_thermal: Fix bogus trip temperature

Zhang Yi (1):
      mm/truncate: fix out-of-bounds when doing a right-aligned split

feijuan.li (1):
      drm/edid: fixed the bug that hdr metadata was not reset
