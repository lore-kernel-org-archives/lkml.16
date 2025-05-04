Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AA187346
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746392987; cv=none; b=MZ+72CsHpu2A0wlklPPCxyFQDmHMZtvJj7+8rNnXjKnkssEDJ3mZXTg9pwHGB1E/BY9PlDz16H/aYmg9B+s42zmVMId5ruiyl+kewXb72Sahm0YZ30zd//0o2rrZXSMpY7VSwG1lYoW1Qz7GUasvzzIrY3oji6c0XGA3rltciC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746392987; c=relaxed/simple;
	bh=FEEZcL+HMGKdCWn9TI6D3jaBKLRKXxMQ86Zs7A6wtM4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=lAYTxOtn7FJrcqAk7PqOAaQGQ4dHNvFn3r9a/YLj4ZAzZ3GrHXc3GyyR1DuabQ7OMdKzSaRIgA0h2EYLVEhLtO+IuUnje/paQ2ElGu/ax0xkBwOJ/JaeVXaRRNrcYVqH5U/sayot1c28PiWV3qp1hjK0FNBGduxLFhiWHRbNVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dZvk8mZd; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dZvk8mZd"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso604970666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746392979; x=1746997779; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bD0ctIK8KMoxlVeLj4yxlCUc7VoZQf5IVQ2+KWXE37I=;
        b=dZvk8mZdlDpZW2rnD5zw0YMpwfRSy9pfi+n+X9CS7RlbkOPaBs76ZqTtoXmSrrb9j0
         5EyrchRv4TD++y4tF5f1b+M+Pte6mE/ME0kTJciF2HyUAFGBtlZgIi3z+lUmOrUKp7g8
         BnYFnS4gyb2x/wYhAHf7bVpLlvzz7417n8tHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392979; x=1746997779;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bD0ctIK8KMoxlVeLj4yxlCUc7VoZQf5IVQ2+KWXE37I=;
        b=p7iapM9dj0gRTae7k7AVBfnYl3wTOySPIk1hekhXWHATPjxw2ySEIMlcO9r9X0W1PY
         K2fMHdTGBBug/6c/e1g3m3uLYmrpzCNaxBubJkc0efDPuQs3G0XotjrhyDfYkc+QOWxE
         eUGSM4N+WLzJ1f8l7RN+DZ41YEn4WQksPWhn7vTrLMzlTTszGQO2S4ftGUk0jZY3W17q
         mQkfAon7pdtTQbo6U1BZBKyvsMcEl31UIDgktbhCTOYFgjcl1y3GAXlSTK/jIO+dYwis
         xM8QN2FwBNbNIvF39ejdrG2eLfdKYj+AniWT30EaZJBULScKcyNS1+diWMAHdVNPr1Mw
         1aJg==
X-Gm-Message-State: AOJu0YzHC1PzjPZVUapO0jSgzqLTcq7TyckMdn5qLPgIba3h+hJLrPNd
	9QIxU8vjGn5sXa6sSm017S5LQ46wdj+t3scqf0SS4hekKsrWMB8ts0wdfXFj1ind9zfpoMr31Qh
	F238=
X-Gm-Gg: ASbGncsZ5YYeoRlHgV2CL7TzRUcZ7u9kMUQ3R0jJjtZ90d2nx4FCvjrRWcLRmy1RRkW
	mx3kPD8HzNVSRnXbYaBUY1Oi3tderk+aPr7Wt6BYeMlHnWa9HtTaJH+PDzZQVs5knZP+EoWv0d1
	/6ZJpdOiX0J0sQiyECLO/UX8BMX1s98LokzxyO1Tpe3xN2g5pedg4DWuK3uOC21p1OMuiCi32JP
	jUB5uFyEVgT134TBlnmLYrbYlVacEDV48MrF7Ko7ChB+MP/60GcdQQHRR40oT5SNbYJLKDGUm4B
	QtFUaOmYzSgpIPDK6Sa8uqI7hAHQLAM3SlRZ7vqzhF5S3nHeH7kpQVW5jfXzTpnwotAYcaAXdb0
	JkVYPDzrlFUIWhvlX1U+V3N9dSQ==
X-Google-Smtp-Source: AGHT+IGsfEV5ByuJHXBN//Y3wM9Rv4ZhAVJo1yJdS5CbgO5w+MikENVu0grPdmhglS5TF9v0fbfYTw==
X-Received: by 2002:a17:907:8e15:b0:acb:5070:dd19 with SMTP id a640c23a62f3a-ad1a4b40997mr428571266b.61.1746392978763;
        Sun, 04 May 2025 14:09:38 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fc0sm376969166b.19.2025.05.04.14.09.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 14:09:37 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso6943752a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:09:37 -0700 (PDT)
X-Received: by 2002:a05:6402:1e89:b0:5f6:44de:d99c with SMTP id
 4fb4d7f45d1cf-5fab057d7b2mr3858955a12.20.1746392977002; Sun, 04 May 2025
 14:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 May 2025 14:09:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
X-Gm-Features: ATxdqUF3o9pODYDxBAIFm_DkhNuDCWT8RqdPc4X23cSuOGx8v-HFb12WIYJTvMg
Message-ID: <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
Subject: Linux 6.15-rc5
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So we may have had a larger merge window than usual, but the rc
releases continue to look pretty regular.

Because once again, this rc is right in the middle of our usual stats
for the rc5 timeframe, both in number of commits and in lines changed.
The diffstat also looks mostly nice and flat (ie mostly small one- and
few-liners). There's a couple of drivers with more than a few lines of
changes (and on the filesystem side we have some bcachefs and smb
client fixes), but most of it looks very nice and small.

I think the biggest patches in here are for some selftest updates, and
in fact about a fifth of the diff overall is just selftests.

Not counting the selftests, the rest is mostly drivers (networking
dominates, and for once gpu is tiny), with the already mentioned
filesystem changes coming in second. The rest is a mix of networking
and just random small fixes (arch, tracing, some minor core fixes).

So it all feels like things are just continuing to go well this
release. Let's hope I didn't jinx it by saying so,

            Linus

---

Aaron Kling (1):
      spi: tegra114: Don't fail set_cs_timing when delays are zero

Alan Huang (1):
      bcachefs: Remove incorrect __counted_by annotation

Alexander Stein (1):
      ASoC: simple-card-utils: Fix pointer check in
graph_util_parse_link_direction

Alistair Francis (3):
      nvme-tcp: select CONFIG_TLS from CONFIG_NVME_TCP_TLS
      nvmet-tcp: select CONFIG_TLS from CONFIG_NVME_TARGET_TCP_TLS
      nvmet-tcp: don't restore null sk_state_change

Amir Goldstein (2):
      fanotify: fix flush of mntns marks
      selftests/fs/mount-notify: test also remove/flush of mntns marks

Andrew Jones (1):
      genirq/msi: Prevent NULL pointer dereference in msi_domain_debug_show=
()

Andrzej Kacprowski (1):
      accel/ivpu: Fix the D0i2 disable test mode

Andy Shevchenko (1):
      dm table: Fix W=3D1 build warning when mempool_needs_integrity is unu=
sed

Aneesh Kumar K.V (Arm) (1):
      iommu/arm-smmu-v3: Add missing S2FWB feature detection

Anthony Iliopoulos (1):
      powerpc64/ftrace: fix module loading without patchable function entri=
es

Ard Biesheuvel (1):
      x86/boot/sev: Support memory acceptance in the EFI stub under SVSM

Arnd Bergmann (2):
      mmc: renesas_sdhi: add regulator dependency
      ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format

Balbir Singh (1):
      iommu/arm-smmu-v3: Fix pgsize_bit for sva domains

Bard Liao (1):
      ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]

Benjamin Berg (1):
      wifi: iwlwifi: mld: only create debugfs symlink if it does not exist

Benjamin Marzinski (1):
      dm: always update the array size in realloc_argv on success

Chad Monroe (1):
      net: ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM

Charles Keepax (1):
      ASoC: cs42l43: Disable headphone clamps during type detection

Chen Linxuan (1):
      drm/i915/pxp: fix undefined reference to
`intel_pxp_gsccs_is_ready_for_sessions'

Chen-Yu Tsai (1):
      pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers

Chenyuan Yang (2):
      ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of=
()
      ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()

Chris Bainbridge (1):
      drm/amd/display: Fix slab-use-after-free in hdcp

Chris Chiu (2):
      ALSA: hda: Apply volume control on speaker+lineout for HP EliteStudio=
 AIO
      ALSA: hda/realtek - Add more HP laptops which need mute led fixup

Chris Lu (2):
      Bluetooth: btmtksdio: Check function enabled before doing close
      Bluetooth: btmtksdio: Do close if SDIO card removed without close

Chris Mi (1):
      net/mlx5: E-switch, Fix error handling for enabling roce

Christian Heusel (1):
      Revert "rndis_host: Flag RNDIS modems as WWAN devices"

Christian Marangi (1):
      pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines

Christophe JAILLET (1):
      spi: stm32-ospi: Fix an error handling path in stm32_ospi_probe()

Clark Wang (1):
      i2c: imx-lpi2c: Fix clock count when probe defers

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()

Colin Ian King (2):
      scsi: myrb: Fix spelling mistake "statux" -> "status"
      ftrace: Fix NULL memory allocation check

Cosmin Ratiu (1):
      net/mlx5e: Fix lock order in mlx5e_tx_reporter_ptpsq_unhealthy_recove=
r

Da Xue (1):
      net: mdio: mux-meson-gxl: set reversed bit when using internal phy

Dafna Hirschfeld (1):
      drm/gpusvm: set has_dma_mapping inside mapping loop

Dan Carpenter (1):
      pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()

Daniel Borkmann (1):
      vmxnet3: Fix malformed packet sizing in vmxnet3_process_xdp

Daniel Golle (1):
      net: ethernet: mtk_eth_soc: sync mtk_clks_source_name array

Dave Chen (1):
      btrfs: fix COW handling in run_delalloc_nocow()

Donet Tom (1):
      book3s64/radix : Align section vmemmap start address to PAGE_SIZE

Emmanuel Grumbach (2):
      wifi: iwlwifi: don't warn if the NIC is gone in resume
      wifi: iwlwifi: fix the check for the SCRATCH register upon resume

En-Wei Wu (1):
      Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()

Felix Fietkau (1):
      net: ipv6: fix UDPv6 GSO segmentation with NAT

Felix Kuehling (1):
      drm/amdgpu: Fail DMABUF map of XGMI-accessible memory

Gabor Juhos (2):
      spi: spi-qpic-snand: propagate errors from qcom_spi_block_erase()
      spi: spi-qpic-snand: fix NAND_READ_LOCATION_2 register handling

Ga=C5=A1per Nemgar (1):
      platform/x86: ideapad-laptop: add support for some new buttons

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()

Hannes Reinecke (1):
      nvmet-auth: always free derived key data

Hao Chang (1):
      pinctrl: mediatek: Fix new design debounce issue

Hao Lan (1):
      net: hns3: fixed debugfs tm_qset size

Harish Chegondi (2):
      drm/xe/eustall: Resolve a possible circular locking dependency
      drm/xe/eustall: Do not support EU stall on SRIOV VF

Harshit Mogalapalli (1):
      drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc=
()

Helge Deller (1):
      parisc: Fix double SIGFPE crash

Hui Wang (1):
      pinctrl: imx: Return NULL if no group is matched and found

Ido Schimmel (1):
      vxlan: vnifilter: Fix unlocked deletion of default FDB entry

Itamar Shalev (1):
      wifi: iwlwifi: restore missing initialization of async_handlers_list

Jacob Keller (1):
      igc: fix lock order in igc_ptp_reset

James Clark (2):
      perf tools: Fix arm64 build by generating unistd_64.h
      perf tools: Fix in-source libperf build

Janne Grunau (5):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock
      drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS

Jens Axboe (1):
      io_uring/fdinfo: annotate racy sq/cq head/tail reads

Jeongjun Park (1):
      tracing: Fix oob write in trace_seq_to_buffer()

Jethro Donaldson (1):
      smb: client: fix zero length for mkdir POSIX create context

Jian Shen (2):
      net: hns3: store rx VLAN tag offload state for VF
      net: hns3: defer calling ptp_clock_register()

Jianbo Liu (1):
      net/mlx5e: TC, Continue the attr process even if encap entry is inval=
id

Jibin Zhang (1):
      net: use sock_gen_put() when sk_state is TCP_TIME_WAIT

Joachim Priesner (1):
      ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset

Johannes Berg (3):
      wifi: mac80211: restore monitor for outgoing frames
      wifi: iwlwifi: back off on continuous errors
      wifi: iwlwifi: mld: fix BAID validity check

John Harrison (1):
      drm/xe/guc: Fix capture of steering registers

Josef Bacik (1):
      btrfs: adjust subpage bit start based on sectorsize

Justin Lai (1):
      rtase: Modify the condition used to detect overflow in
rtase_calc_time_mitigation

Kailang Yang (1):
      ALSA: hda/realtek - Enable speaker for HP platform

Kalesh AP (1):
      bnxt_en: Fix ethtool selftest output in one of the failure cases

Kan Liang (3):
      perf/x86/intel: Only check the group flag for X86 leader
      perf/x86/intel: Check the X86 leader for pebs_counter_event_group
      perf/x86/intel/ds: Fix counter backwards of non-precise events
counters-snapshotting

Karol Wachowski (1):
      accel/ivpu: Correct DCT interrupt handling

Kashyap Desai (2):
      bnxt_en: call pci_alloc_irq_vectors() after bnxt_reserve_rings()
      bnxt_en: delay pci_alloc_irq_vectors() in the AER path

Keith Busch (1):
      nvme-pci: fix queue unquiesce check on slot_reset

Kent Overstreet (21):
      bcachefs: Fix losing return code in next_fiemap_extent()
      bcachefs: Use generic_set_sb_d_ops for standard casefolding d_ops
      bcachefs: Emit unicode version message on startup
      bcachefs: Add missing utf8_unload()
      bcachefs: Run BCH_RECOVERY_PASS_reconstruct_snapshots on missing
subvol -> snapshot
      bcachefs: Add upgrade table entry from 0.14
      bcachefs: fix bch2_dev_buckets_resize()
      bcachefs: Improve bch2_dev_bucket_missing()
      bcachefs: Don't generate alloc updates to invalid buckets
      bcachefs: btree_node_data_missing is now autofix
      bcachefs: btree_root_unreadable_and_scan_found_nothing autofix
for non data btrees
      bcachefs: More informative error message when shutting down due to er=
ror
      bcachefs: Use bch2_kvmalloc() for journal keys array
      bcachefs: Topology error after insert is now an ERO
      bcachefs: improve missing journal write device error message
      bcachefs: readdir fixes
      bcachefs: Kill ERO in __bch2_i_sectors_acct()
      bcachefs: check for inode.bi_sectors underflow
      bcachefs: Kill ERO for i_blocks check in truncate
      bcachefs: Fix __bch2_dev_group_set()
      bcachefs: add missing sched_annotate_sleep()

Keoseong Park (1):
      scsi: ufs: core: Remove redundant query_complete trace

Kiran K (2):
      Bluetooth: btintel_pcie: Avoid redundant buffer allocation
      Bluetooth: btintel_pcie: Add additional to checks to clear TX/RX path=
s

Kory Maincent (1):
      netlink: specs: ethtool: Remove UAPI duplication of phy-upstream enum

Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Fix uninitialized variable due
to bad error handling
      platform/x86: alienware-wmi-wmax: Add support for Alienware m15 R7

Larysa Zaremba (1):
      idpf: protect shutdown from reset

Lijo Lazar (1):
      drm/amdgpu: Fix offset for HDP remap in nbio v7.11

Linus Torvalds (1):
      Linux 6.15-rc5

LongPing Wei (1):
      dm-bufio: don't schedule in atomic context

Louis-Alexis Eyraud (2):
      net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx =
poll
      net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only
when advised

Lu Baolu (1):
      iommu/vt-d: Revert ATS timing change to fix boot failure

Lucas De Marchi (1):
      drm/xe/hwmon: Fix kernel version documentation for temperature

Luiz Augusto von Dentz (2):
      Bluetooth: hci_conn: Fix not setting conn_timeout for Broadcast Recei=
ver
      Bluetooth: hci_conn: Fix not setting timeout for BIG Create Sync

Madhavan Srinivasan (3):
      powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
      powerpc/boot: Check for ld-option support
      powerpc/boot: Fix dash warning

Madhu Chittim (1):
      idpf: fix offloads support for encapsulated packets

Maor Gottlieb (1):
      net/mlx5: E-Switch, Initialize MAC Address for Default GID

Mario Limonciello (1):
      platform/x86/amd: pmc: Require at least 2.5 seconds between HW
sleep cycles

Martin Blumenstingl (1):
      pinctrl: meson: define the pull up/down resistor value as 60 kOhm

Mattias Barthel (1):
      net: fec: ERR007885 Workaround for conventional TX

Maulik Shah (1):
      pinctrl: qcom: Fix PINGROUP definition for sm8750

Maxime Ripard (1):
      drm/tests: shmem: Fix memleak

Michael Chan (1):
      bnxt_en: Fix ethtool -d byte order for 32-bit values

Michael Kelley (1):
      Drivers: hv: Fix bad ref to hv_synic_eventring_tail when CPU goes off=
line

Michael Liang (1):
      nvme-tcp: fix premature queue removal and I/O failover

Michal Swiatkowski (1):
      idpf: fix potential memory leak on kcalloc() failure

Mikulas Patocka (1):
      dm-integrity: fix a warning on invalid table line

Ming Lei (4):
      selftests: ublk: fix UBLK_F_NEED_GET_DATA
      ublk: decouple zero copy from user copy
      ublk: enhance check for register/unregister io buffer command
      ublk: remove the check of ublk_need_req_ref() from
__ublk_check_and_get_req

Mingcong Bai (1):
      iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)

Miri Korenblit (4):
      Revert "wifi: iwlwifi: add support for BE213"
      Revert "wifi: iwlwifi: make no_160 more generic"
      wifi: iwlwifi: mld: properly handle async notification in op mode sta=
rt
      wifi: iwlwifi: mld: inform trans on init failure

Murad Masimov (1):
      wifi: plfxlc: Remove erroneous assert in plfxlc_mac_release

Namjae Jeon (1):
      ksmbd: fix use-after-free in ksmbd_session_rpc_open

Nathan Chancellor (1):
      kbuild: Properly disable -Wunterminated-string-initialization for cla=
ng

Nico Pache (1):
      firmware: cs_dsp: tests: Depend on FW_CS_DSP rather then enabling it

Nicolin Chen (2):
      iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated strea=
m ids
      iommu: Fix two issues in iommu_copy_struct_from_user()

Niravkumar L Rabara (2):
      EDAC/altera: Test the correct error reg offset
      EDAC/altera: Set DDR and SDMMC interrupt mask before registration

Nuno Das Neves (1):
      Drivers: hv: Fix bad pointer dereference in hv_get_partition_id

Olaf Hering (1):
      tools/hv: update route parsing in kvp daemon

Olivier Moysan (2):
      ASoC: stm32: sai: skip useless iterations on kernel rate loop
      ASoC: stm32: sai: add a check on minimal kernel frequency

Pali Roh=C3=A1r (2):
      cifs: Fix and improve cifs_query_path_info() and cifs_query_file_info=
()
      cifs: Fix changing times and read-only attr over SMB1
smb_set_file_info() function

Paul Greenwalt (1):
      ice: fix Get Tx Topology AQ command error on E830

Pauli Virtanen (1):
      Bluetooth: L2CAP: copy RX timestamp to new fragments

Paulo Alcantara (1):
      smb: client: ensure aligned IO sizes

Pavel Nikulin (1):
      platform/x86: asus-wmi: Disable OOBE state after resume from hibernat=
ion

Pavel Paklov (1):
      iommu/amd: Fix potential buffer overflow in parse_ivrs_acpihid

Penglei Jiang (1):
      btrfs: fix the inode leak in btrfs_iget()

Philipp Stanner (1):
      drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()

Rafael J. Wysocki (2):
      cpufreq: Fix setting policy limits when frequency tables are used
      soundwire: intel_auxdevice: Fix system suspend/resume handling

Raju Rangoju (1):
      spi: spi-mem: Add fix to avoid divide error

Richard Fitzgerald (3):
      kunit: configs: Add some Cirrus Logic modules to all_tests
      ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
      ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS

Ritesh Harjani (IBM) (1):
      book3s64/radix: Fix compile errors when
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=3Dn

Robin Murphy (1):
      iommu/arm-smmu-v3: Fail aliasing StreamIDs more gracefully

Ruslan Piasetskyi (1):
      mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe

Russell Cloran (1):
      drm/mipi-dbi: Fix blanking for non-16 bit formats

Sabrina Dubroca (1):
      crypto: scompress - increment scomp_scratch_users when already alloca=
ted

Sagi Maimon (1):
      ptp: ocp: Fix NULL dereference in Adva board SMA sysfs operations

Salah Triki (1):
      smb: server: smb2pdu: check return value of xa_store()

Saranya Gopal (1):
      platform/x86/intel: hid: Add Pantherlake support

Sathesh B Edara (2):
      octeon_ep_vf: Resolve netdevice usage count issue
      octeon_ep: Fix host hang issue during device reboot

Sean Christopherson (1):
      perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's va=
lue.

Sean Heelan (2):
      ksmbd: fix use-after-free in kerberos authentication
      ksmbd: fix use-after-free in session logoff

Shannon Nelson (1):
      pds_core: remove write-after-free of client_id

Sheetal (1):
      ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence

Shouye Liu (1):
      platform/x86/intel-uncore-freq: Fix missing uncore sysfs during
CPU hotplug

Shravya KN (1):
      bnxt_en: Fix error handling path in bnxt_init_chip()

Shruti Parab (2):
      bnxt_en: Fix coredump logic to free allocated buffer
      bnxt_en: Fix out-of-bound memcpy() during ethtool -w

Shyam Saini (4):
      kernel: param: rename locate_module_kobject
      kernel: refactor lookup_or_create_module_kobject()
      kernel: globalize lookup_or_create_module_kobject()
      drivers: base: handle module_kobject creation

Simon Horman (1):
      net: dlink: Correct endianness handling of led_mode

Somnath Kotur (1):
      bnxt_en: Add missing skb_mark_for_recycle() in bnxt_rx_vlan()

Sonny Jiang (1):
      drm/amdgpu: Add DPG pause for VCN v5.0.1

Srinivas Pandruvada (1):
      cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode

Stefan Binding (2):
      ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
      ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers

Stefan Wahren (4):
      net: vertexcom: mse102x: Fix possible stuck of SPI interrupt
      net: vertexcom: mse102x: Fix LEN_MASK
      net: vertexcom: mse102x: Add range check for CMD_RTS
      net: vertexcom: mse102x: Fix RX error handling

Stephan Gerhold (1):
      irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs

Steven Rostedt (2):
      tracing: Fix trace_adjust_address() when there is no modules in
scratch area
      tracing: Do not take trace_event_sem in print_event_fields()

Sunil Khatri (1):
      drm/ttm: fix the warning for hit_low and evict_low

Takashi Iwai (5):
      ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
      ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
      ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
      ALSA: usb-audio: Fix duplicated name in MIDI substream names
      ALSA: hda/realtek: Fix built-mic regression on other ASUS models

Thangaraj Samynathan (1):
      net: lan743x: Fix memleak issue when GSO enabled

Tvrtko Ursulin (1):
      drm/fdinfo: Protect against driver unbind

Vadim Fedorenko (2):
      bnxt_en: improve TX timestamping FIFO configuration
      bnxt_en: fix module unload sequence

Venkata Prasad Potturu (3):
      ASoC: amd: acp: Fix NULL pointer deref on acp resume path
      ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
      ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure

Victor Nogueira (5):
      net_sched: drr: Fix double list add in class with netem as child qdis=
c
      net_sched: hfsc: Fix a UAF vulnerability in class with netem as
child qdisc
      net_sched: ets: Fix double list add in class with netem as child qdis=
c
      net_sched: qfq: Fix double list add in class with netem as child qdis=
c
      selftests: tc-testing: Add TDC tests that exercise reentrant
enqueue behaviour

Vijendar Mukunda (1):
      ASoC: amd: ps: fix for irq handler return status

Viresh Kumar (1):
      cpufreq: ACPI: Re-sync CPU boost state on system resume

Vishal Badole (1):
      amd-xgbe: Fix to ensure dependent features are toggled with RX
checksum offload

Vlad Dogaru (1):
      net/mlx5e: Use custom tunnel header for vxlan gbp

Vladimir Oltean (6):
      net: mscc: ocelot: delete PVID VLAN when readding it as non-PVID
      selftests: net: bridge_vlan_aware: test untagged/8021p-tagged
with and without PVID
      net: dsa: felix: fix broken taprio gate states after clock jump
      selftests: net: tsn_lib: create common helper for counting
received packets
      selftests: net: tsn_lib: add window_size argument to isochron_do()
      selftests: net: tc_taprio: new test

Wei Yang (3):
      mm/memblock: pass size instead of end to memblock_set_node()
      mm/memblock: repeat setting reserved region nid if array is doubled
      memblock tests: add test for memblock_set_node

Wentao Guan (2):
      nvme-pci: add quirks for device 126f:1001
      nvme-pci: add quirks for WDC Blue SN550 15b7:5009

Wentao Liang (1):
      wifi: brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage=
()

Will Deacon (1):
      arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays

Wolfram Sang (1):
      mmc: renesas_sdhi: disable clocks if registering regulator failed

Xuanqiang Luo (1):
      ice: Check VF VSI Pointer Value in ice_vc_add_fdir_fltr()

Yonglong Liu (1):
      net: hns3: fix an interrupt residual problem

Zhenhua Huang (1):
      mm, slab: clean up slab->obj_exts always

Zixian Zeng (2):
      spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
      spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042 S=
oC

e.kubanski (2):
      xsk: Fix race condition in AF_XDP generic RX path
      xsk: Fix offset calculation in unaligned mode
