Received: from prime.voidband.net (prime.voidband.net [199.247.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423F367
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 22:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.247.17.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746396097; cv=none; b=APwHJp6iX+fpuAwRMXI0rOXGxEbDWpltrcPDo5RXQx75xcdSjN9GT7IrMdhqOqJgvFr5LRKgEyWufAydt1r9xqoGSpeArwwjFOgNJpOyKPaRyOyb/AI91s30bcYFS/K29g0Jh9teQN9BS09gvbv2o5DvU25NNn9KDPTO9OSGBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746396097; c=relaxed/simple;
	bh=KcPynP0EivO/1WgSbKnsduphucBTwMhogB30kSRyr3Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=URqytnv08Bik1OKdcM0mqeDA4+K4yaMdFaO2hB9LE3hTUzrWB+QdEbMYD+yPsyCzmStVqs3Bjnw8UZl4ik1AqQ8eOQuNMZ3Npvp392AZen4eEENpWRejgXbuaMKamAAReEfbp+0y7DaVFPCXYq4hSWM9wFElvZ0H6lKlEZsgnxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name; spf=pass smtp.mailfrom=natalenko.name; dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b=RNHtRGxV; arc=none smtp.client-ip=199.247.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=natalenko.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalenko.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=natalenko.name header.i=@natalenko.name header.b="RNHtRGxV"
Received: from spock.localnet (unknown [212.20.115.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id 3A0CA603D6F2;
	Sun, 04 May 2025 23:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1746395581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp0sNEaoyQCvFSc6wz4fAi6HZ8/lhf1neF+Dl8IQvjw=;
	b=RNHtRGxVWZEEu/1HDiqvjQFRAX1rW8PtXItzsIJwhHtRCadApLdoyJwbPBE37MKjKG9uWt
	yu1zFoCWBkNI9tb2Yg31ZFFZ9WsA4ii0EhB2v9vcwBflhkAOoKU3uAGNDlCAI09CtQ6FzY
	FNjixnNnVQUIi9s/X7pS0+QpTZundkQ=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 6.15-rc5
Date: Sun, 04 May 2025 23:52:47 +0200
Message-ID: <2778372.mvXUDI8C0e@natalenko.name>
In-Reply-To:
 <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
References:
 <CAHk-=wgjwfsyPf3SfjrPhAMJqN6brBpajQ3F9qp_TatwOs56YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12656949.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart12656949.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: Linux 6.15-rc5
Date: Sun, 04 May 2025 23:52:47 +0200
Message-ID: <2778372.mvXUDI8C0e@natalenko.name>
MIME-Version: 1.0

Hello.

On ned=C4=9Ble 4. kv=C4=9Btna 2025 23:09:20, st=C5=99edoevropsk=C3=BD letn=
=C3=AD =C4=8Das Linus Torvalds wrote:
> So we may have had a larger merge window than usual, but the rc
> releases continue to look pretty regular.

Appreciate pushing the actual tag please.

Thank you.
=20
> Because once again, this rc is right in the middle of our usual stats
> for the rc5 timeframe, both in number of commits and in lines changed.
> The diffstat also looks mostly nice and flat (ie mostly small one- and
> few-liners). There's a couple of drivers with more than a few lines of
> changes (and on the filesystem side we have some bcachefs and smb
> client fixes), but most of it looks very nice and small.
>=20
> I think the biggest patches in here are for some selftest updates, and
> in fact about a fifth of the diff overall is just selftests.
>=20
> Not counting the selftests, the rest is mostly drivers (networking
> dominates, and for once gpu is tiny), with the already mentioned
> filesystem changes coming in second. The rest is a mix of networking
> and just random small fixes (arch, tracing, some minor core fixes).
>=20
> So it all feels like things are just continuing to go well this
> release. Let's hope I didn't jinx it by saying so,
>=20
>             Linus
>=20
> ---
>=20
> Aaron Kling (1):
>       spi: tegra114: Don't fail set_cs_timing when delays are zero
>=20
> Alan Huang (1):
>       bcachefs: Remove incorrect __counted_by annotation
>=20
> Alexander Stein (1):
>       ASoC: simple-card-utils: Fix pointer check in
> graph_util_parse_link_direction
>=20
> Alistair Francis (3):
>       nvme-tcp: select CONFIG_TLS from CONFIG_NVME_TCP_TLS
>       nvmet-tcp: select CONFIG_TLS from CONFIG_NVME_TARGET_TCP_TLS
>       nvmet-tcp: don't restore null sk_state_change
>=20
> Amir Goldstein (2):
>       fanotify: fix flush of mntns marks
>       selftests/fs/mount-notify: test also remove/flush of mntns marks
>=20
> Andrew Jones (1):
>       genirq/msi: Prevent NULL pointer dereference in msi_domain_debug_sh=
ow()
>=20
> Andrzej Kacprowski (1):
>       accel/ivpu: Fix the D0i2 disable test mode
>=20
> Andy Shevchenko (1):
>       dm table: Fix W=3D1 build warning when mempool_needs_integrity is u=
nused
>=20
> Aneesh Kumar K.V (Arm) (1):
>       iommu/arm-smmu-v3: Add missing S2FWB feature detection
>=20
> Anthony Iliopoulos (1):
>       powerpc64/ftrace: fix module loading without patchable function ent=
ries
>=20
> Ard Biesheuvel (1):
>       x86/boot/sev: Support memory acceptance in the EFI stub under SVSM
>=20
> Arnd Bergmann (2):
>       mmc: renesas_sdhi: add regulator dependency
>       ASoC: Intel: catpt: avoid type mismatch in dev_dbg() format
>=20
> Balbir Singh (1):
>       iommu/arm-smmu-v3: Fix pgsize_bit for sva domains
>=20
> Bard Liao (1):
>       ASoC: soc-acpi-intel-ptl-match: add empty item to ptl_cs42l43_l3[]
>=20
> Benjamin Berg (1):
>       wifi: iwlwifi: mld: only create debugfs symlink if it does not exist
>=20
> Benjamin Marzinski (1):
>       dm: always update the array size in realloc_argv on success
>=20
> Chad Monroe (1):
>       net: ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM
>=20
> Charles Keepax (1):
>       ASoC: cs42l43: Disable headphone clamps during type detection
>=20
> Chen Linxuan (1):
>       drm/i915/pxp: fix undefined reference to
> `intel_pxp_gsccs_is_ready_for_sessions'
>=20
> Chen-Yu Tsai (1):
>       pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers
>=20
> Chenyuan Yang (2):
>       ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_=
of()
>       ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()
>=20
> Chris Bainbridge (1):
>       drm/amd/display: Fix slab-use-after-free in hdcp
>=20
> Chris Chiu (2):
>       ALSA: hda: Apply volume control on speaker+lineout for HP EliteStud=
io AIO
>       ALSA: hda/realtek - Add more HP laptops which need mute led fixup
>=20
> Chris Lu (2):
>       Bluetooth: btmtksdio: Check function enabled before doing close
>       Bluetooth: btmtksdio: Do close if SDIO card removed without close
>=20
> Chris Mi (1):
>       net/mlx5: E-switch, Fix error handling for enabling roce
>=20
> Christian Heusel (1):
>       Revert "rndis_host: Flag RNDIS modems as WWAN devices"
>=20
> Christian Marangi (1):
>       pinctrl: airoha: fix wrong PHY LED mapping and PHY2 LED defines
>=20
> Christophe JAILLET (1):
>       spi: stm32-ospi: Fix an error handling path in stm32_ospi_probe()
>=20
> Clark Wang (1):
>       i2c: imx-lpi2c: Fix clock count when probe defers
>=20
> Claudiu Beznea (1):
>       ASoC: renesas: rz-ssi: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
>=20
> Colin Ian King (2):
>       scsi: myrb: Fix spelling mistake "statux" -> "status"
>       ftrace: Fix NULL memory allocation check
>=20
> Cosmin Ratiu (1):
>       net/mlx5e: Fix lock order in mlx5e_tx_reporter_ptpsq_unhealthy_reco=
ver
>=20
> Da Xue (1):
>       net: mdio: mux-meson-gxl: set reversed bit when using internal phy
>=20
> Dafna Hirschfeld (1):
>       drm/gpusvm: set has_dma_mapping inside mapping loop
>=20
> Dan Carpenter (1):
>       pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
>=20
> Daniel Borkmann (1):
>       vmxnet3: Fix malformed packet sizing in vmxnet3_process_xdp
>=20
> Daniel Golle (1):
>       net: ethernet: mtk_eth_soc: sync mtk_clks_source_name array
>=20
> Dave Chen (1):
>       btrfs: fix COW handling in run_delalloc_nocow()
>=20
> Donet Tom (1):
>       book3s64/radix : Align section vmemmap start address to PAGE_SIZE
>=20
> Emmanuel Grumbach (2):
>       wifi: iwlwifi: don't warn if the NIC is gone in resume
>       wifi: iwlwifi: fix the check for the SCRATCH register upon resume
>=20
> En-Wei Wu (1):
>       Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
>=20
> Felix Fietkau (1):
>       net: ipv6: fix UDPv6 GSO segmentation with NAT
>=20
> Felix Kuehling (1):
>       drm/amdgpu: Fail DMABUF map of XGMI-accessible memory
>=20
> Gabor Juhos (2):
>       spi: spi-qpic-snand: propagate errors from qcom_spi_block_erase()
>       spi: spi-qpic-snand: fix NAND_READ_LOCATION_2 register handling
>=20
> Ga=C5=A1per Nemgar (1):
>       platform/x86: ideapad-laptop: add support for some new buttons
>=20
> Geoffrey D. Bennett (1):
>       ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()
>=20
> Hannes Reinecke (1):
>       nvmet-auth: always free derived key data
>=20
> Hao Chang (1):
>       pinctrl: mediatek: Fix new design debounce issue
>=20
> Hao Lan (1):
>       net: hns3: fixed debugfs tm_qset size
>=20
> Harish Chegondi (2):
>       drm/xe/eustall: Resolve a possible circular locking dependency
>       drm/xe/eustall: Do not support EU stall on SRIOV VF
>=20
> Harshit Mogalapalli (1):
>       drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_all=
oc()
>=20
> Helge Deller (1):
>       parisc: Fix double SIGFPE crash
>=20
> Hui Wang (1):
>       pinctrl: imx: Return NULL if no group is matched and found
>=20
> Ido Schimmel (1):
>       vxlan: vnifilter: Fix unlocked deletion of default FDB entry
>=20
> Itamar Shalev (1):
>       wifi: iwlwifi: restore missing initialization of async_handlers_list
>=20
> Jacob Keller (1):
>       igc: fix lock order in igc_ptp_reset
>=20
> James Clark (2):
>       perf tools: Fix arm64 build by generating unistd_64.h
>       perf tools: Fix in-source libperf build
>=20
> Janne Grunau (5):
>       drm: adp: Use spin_lock_irqsave for drm device event_lock
>       drm: adp: Handle drm_crtc_vblank_get() errors
>       drm: adp: Enable vblank interrupts in crtc's .atomic_enable
>       drm: adp: Remove pointless irq_lock spin lock
>       drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>=20
> Jens Axboe (1):
>       io_uring/fdinfo: annotate racy sq/cq head/tail reads
>=20
> Jeongjun Park (1):
>       tracing: Fix oob write in trace_seq_to_buffer()
>=20
> Jethro Donaldson (1):
>       smb: client: fix zero length for mkdir POSIX create context
>=20
> Jian Shen (2):
>       net: hns3: store rx VLAN tag offload state for VF
>       net: hns3: defer calling ptp_clock_register()
>=20
> Jianbo Liu (1):
>       net/mlx5e: TC, Continue the attr process even if encap entry is inv=
alid
>=20
> Jibin Zhang (1):
>       net: use sock_gen_put() when sk_state is TCP_TIME_WAIT
>=20
> Joachim Priesner (1):
>       ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
>=20
> Johannes Berg (3):
>       wifi: mac80211: restore monitor for outgoing frames
>       wifi: iwlwifi: back off on continuous errors
>       wifi: iwlwifi: mld: fix BAID validity check
>=20
> John Harrison (1):
>       drm/xe/guc: Fix capture of steering registers
>=20
> Josef Bacik (1):
>       btrfs: adjust subpage bit start based on sectorsize
>=20
> Justin Lai (1):
>       rtase: Modify the condition used to detect overflow in
> rtase_calc_time_mitigation
>=20
> Kailang Yang (1):
>       ALSA: hda/realtek - Enable speaker for HP platform
>=20
> Kalesh AP (1):
>       bnxt_en: Fix ethtool selftest output in one of the failure cases
>=20
> Kan Liang (3):
>       perf/x86/intel: Only check the group flag for X86 leader
>       perf/x86/intel: Check the X86 leader for pebs_counter_event_group
>       perf/x86/intel/ds: Fix counter backwards of non-precise events
> counters-snapshotting
>=20
> Karol Wachowski (1):
>       accel/ivpu: Correct DCT interrupt handling
>=20
> Kashyap Desai (2):
>       bnxt_en: call pci_alloc_irq_vectors() after bnxt_reserve_rings()
>       bnxt_en: delay pci_alloc_irq_vectors() in the AER path
>=20
> Keith Busch (1):
>       nvme-pci: fix queue unquiesce check on slot_reset
>=20
> Kent Overstreet (21):
>       bcachefs: Fix losing return code in next_fiemap_extent()
>       bcachefs: Use generic_set_sb_d_ops for standard casefolding d_ops
>       bcachefs: Emit unicode version message on startup
>       bcachefs: Add missing utf8_unload()
>       bcachefs: Run BCH_RECOVERY_PASS_reconstruct_snapshots on missing
> subvol -> snapshot
>       bcachefs: Add upgrade table entry from 0.14
>       bcachefs: fix bch2_dev_buckets_resize()
>       bcachefs: Improve bch2_dev_bucket_missing()
>       bcachefs: Don't generate alloc updates to invalid buckets
>       bcachefs: btree_node_data_missing is now autofix
>       bcachefs: btree_root_unreadable_and_scan_found_nothing autofix
> for non data btrees
>       bcachefs: More informative error message when shutting down due to =
error
>       bcachefs: Use bch2_kvmalloc() for journal keys array
>       bcachefs: Topology error after insert is now an ERO
>       bcachefs: improve missing journal write device error message
>       bcachefs: readdir fixes
>       bcachefs: Kill ERO in __bch2_i_sectors_acct()
>       bcachefs: check for inode.bi_sectors underflow
>       bcachefs: Kill ERO for i_blocks check in truncate
>       bcachefs: Fix __bch2_dev_group_set()
>       bcachefs: add missing sched_annotate_sleep()
>=20
> Keoseong Park (1):
>       scsi: ufs: core: Remove redundant query_complete trace
>=20
> Kiran K (2):
>       Bluetooth: btintel_pcie: Avoid redundant buffer allocation
>       Bluetooth: btintel_pcie: Add additional to checks to clear TX/RX pa=
ths
>=20
> Kory Maincent (1):
>       netlink: specs: ethtool: Remove UAPI duplication of phy-upstream en=
um
>=20
> Kurt Borja (2):
>       platform/x86: alienware-wmi-wmax: Fix uninitialized variable due
> to bad error handling
>       platform/x86: alienware-wmi-wmax: Add support for Alienware m15 R7
>=20
> Larysa Zaremba (1):
>       idpf: protect shutdown from reset
>=20
> Lijo Lazar (1):
>       drm/amdgpu: Fix offset for HDP remap in nbio v7.11
>=20
> Linus Torvalds (1):
>       Linux 6.15-rc5
>=20
> LongPing Wei (1):
>       dm-bufio: don't schedule in atomic context
>=20
> Louis-Alexis Eyraud (2):
>       net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/t=
x poll
>       net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only
> when advised
>=20
> Lu Baolu (1):
>       iommu/vt-d: Revert ATS timing change to fix boot failure
>=20
> Lucas De Marchi (1):
>       drm/xe/hwmon: Fix kernel version documentation for temperature
>=20
> Luiz Augusto von Dentz (2):
>       Bluetooth: hci_conn: Fix not setting conn_timeout for Broadcast Rec=
eiver
>       Bluetooth: hci_conn: Fix not setting timeout for BIG Create Sync
>=20
> Madhavan Srinivasan (3):
>       powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE
>       powerpc/boot: Check for ld-option support
>       powerpc/boot: Fix dash warning
>=20
> Madhu Chittim (1):
>       idpf: fix offloads support for encapsulated packets
>=20
> Maor Gottlieb (1):
>       net/mlx5: E-Switch, Initialize MAC Address for Default GID
>=20
> Mario Limonciello (1):
>       platform/x86/amd: pmc: Require at least 2.5 seconds between HW
> sleep cycles
>=20
> Martin Blumenstingl (1):
>       pinctrl: meson: define the pull up/down resistor value as 60 kOhm
>=20
> Mattias Barthel (1):
>       net: fec: ERR007885 Workaround for conventional TX
>=20
> Maulik Shah (1):
>       pinctrl: qcom: Fix PINGROUP definition for sm8750
>=20
> Maxime Ripard (1):
>       drm/tests: shmem: Fix memleak
>=20
> Michael Chan (1):
>       bnxt_en: Fix ethtool -d byte order for 32-bit values
>=20
> Michael Kelley (1):
>       Drivers: hv: Fix bad ref to hv_synic_eventring_tail when CPU goes o=
ffline
>=20
> Michael Liang (1):
>       nvme-tcp: fix premature queue removal and I/O failover
>=20
> Michal Swiatkowski (1):
>       idpf: fix potential memory leak on kcalloc() failure
>=20
> Mikulas Patocka (1):
>       dm-integrity: fix a warning on invalid table line
>=20
> Ming Lei (4):
>       selftests: ublk: fix UBLK_F_NEED_GET_DATA
>       ublk: decouple zero copy from user copy
>       ublk: enhance check for register/unregister io buffer command
>       ublk: remove the check of ublk_need_req_ref() from
> __ublk_check_and_get_req
>=20
> Mingcong Bai (1):
>       iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
>=20
> Miri Korenblit (4):
>       Revert "wifi: iwlwifi: add support for BE213"
>       Revert "wifi: iwlwifi: make no_160 more generic"
>       wifi: iwlwifi: mld: properly handle async notification in op mode s=
tart
>       wifi: iwlwifi: mld: inform trans on init failure
>=20
> Murad Masimov (1):
>       wifi: plfxlc: Remove erroneous assert in plfxlc_mac_release
>=20
> Namjae Jeon (1):
>       ksmbd: fix use-after-free in ksmbd_session_rpc_open
>=20
> Nathan Chancellor (1):
>       kbuild: Properly disable -Wunterminated-string-initialization for c=
lang
>=20
> Nico Pache (1):
>       firmware: cs_dsp: tests: Depend on FW_CS_DSP rather then enabling it
>=20
> Nicolin Chen (2):
>       iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated str=
eam ids
>       iommu: Fix two issues in iommu_copy_struct_from_user()
>=20
> Niravkumar L Rabara (2):
>       EDAC/altera: Test the correct error reg offset
>       EDAC/altera: Set DDR and SDMMC interrupt mask before registration
>=20
> Nuno Das Neves (1):
>       Drivers: hv: Fix bad pointer dereference in hv_get_partition_id
>=20
> Olaf Hering (1):
>       tools/hv: update route parsing in kvp daemon
>=20
> Olivier Moysan (2):
>       ASoC: stm32: sai: skip useless iterations on kernel rate loop
>       ASoC: stm32: sai: add a check on minimal kernel frequency
>=20
> Pali Roh=C3=A1r (2):
>       cifs: Fix and improve cifs_query_path_info() and cifs_query_file_in=
fo()
>       cifs: Fix changing times and read-only attr over SMB1
> smb_set_file_info() function
>=20
> Paul Greenwalt (1):
>       ice: fix Get Tx Topology AQ command error on E830
>=20
> Pauli Virtanen (1):
>       Bluetooth: L2CAP: copy RX timestamp to new fragments
>=20
> Paulo Alcantara (1):
>       smb: client: ensure aligned IO sizes
>=20
> Pavel Nikulin (1):
>       platform/x86: asus-wmi: Disable OOBE state after resume from hibern=
ation
>=20
> Pavel Paklov (1):
>       iommu/amd: Fix potential buffer overflow in parse_ivrs_acpihid
>=20
> Penglei Jiang (1):
>       btrfs: fix the inode leak in btrfs_iget()
>=20
> Philipp Stanner (1):
>       drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
>=20
> Rafael J. Wysocki (2):
>       cpufreq: Fix setting policy limits when frequency tables are used
>       soundwire: intel_auxdevice: Fix system suspend/resume handling
>=20
> Raju Rangoju (1):
>       spi: spi-mem: Add fix to avoid divide error
>=20
> Richard Fitzgerald (3):
>       kunit: configs: Add some Cirrus Logic modules to all_tests
>       ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
>       ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS
>=20
> Ritesh Harjani (IBM) (1):
>       book3s64/radix: Fix compile errors when
> CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=3Dn
>=20
> Robin Murphy (1):
>       iommu/arm-smmu-v3: Fail aliasing StreamIDs more gracefully
>=20
> Ruslan Piasetskyi (1):
>       mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
>=20
> Russell Cloran (1):
>       drm/mipi-dbi: Fix blanking for non-16 bit formats
>=20
> Sabrina Dubroca (1):
>       crypto: scompress - increment scomp_scratch_users when already allo=
cated
>=20
> Sagi Maimon (1):
>       ptp: ocp: Fix NULL dereference in Adva board SMA sysfs operations
>=20
> Salah Triki (1):
>       smb: server: smb2pdu: check return value of xa_store()
>=20
> Saranya Gopal (1):
>       platform/x86/intel: hid: Add Pantherlake support
>=20
> Sathesh B Edara (2):
>       octeon_ep_vf: Resolve netdevice usage count issue
>       octeon_ep: Fix host hang issue during device reboot
>=20
> Sean Christopherson (1):
>       perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's =
value.
>=20
> Sean Heelan (2):
>       ksmbd: fix use-after-free in kerberos authentication
>       ksmbd: fix use-after-free in session logoff
>=20
> Shannon Nelson (1):
>       pds_core: remove write-after-free of client_id
>=20
> Sheetal (1):
>       ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence
>=20
> Shouye Liu (1):
>       platform/x86/intel-uncore-freq: Fix missing uncore sysfs during
> CPU hotplug
>=20
> Shravya KN (1):
>       bnxt_en: Fix error handling path in bnxt_init_chip()
>=20
> Shruti Parab (2):
>       bnxt_en: Fix coredump logic to free allocated buffer
>       bnxt_en: Fix out-of-bound memcpy() during ethtool -w
>=20
> Shyam Saini (4):
>       kernel: param: rename locate_module_kobject
>       kernel: refactor lookup_or_create_module_kobject()
>       kernel: globalize lookup_or_create_module_kobject()
>       drivers: base: handle module_kobject creation
>=20
> Simon Horman (1):
>       net: dlink: Correct endianness handling of led_mode
>=20
> Somnath Kotur (1):
>       bnxt_en: Add missing skb_mark_for_recycle() in bnxt_rx_vlan()
>=20
> Sonny Jiang (1):
>       drm/amdgpu: Add DPG pause for VCN v5.0.1
>=20
> Srinivas Pandruvada (1):
>       cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode
>=20
> Stefan Binding (2):
>       ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
>       ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers
>=20
> Stefan Wahren (4):
>       net: vertexcom: mse102x: Fix possible stuck of SPI interrupt
>       net: vertexcom: mse102x: Fix LEN_MASK
>       net: vertexcom: mse102x: Add range check for CMD_RTS
>       net: vertexcom: mse102x: Fix RX error handling
>=20
> Stephan Gerhold (1):
>       irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs
>=20
> Steven Rostedt (2):
>       tracing: Fix trace_adjust_address() when there is no modules in
> scratch area
>       tracing: Do not take trace_event_sem in print_event_fields()
>=20
> Sunil Khatri (1):
>       drm/ttm: fix the warning for hit_low and evict_low
>=20
> Takashi Iwai (5):
>       ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
>       ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
>       ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
>       ALSA: usb-audio: Fix duplicated name in MIDI substream names
>       ALSA: hda/realtek: Fix built-mic regression on other ASUS models
>=20
> Thangaraj Samynathan (1):
>       net: lan743x: Fix memleak issue when GSO enabled
>=20
> Tvrtko Ursulin (1):
>       drm/fdinfo: Protect against driver unbind
>=20
> Vadim Fedorenko (2):
>       bnxt_en: improve TX timestamping FIFO configuration
>       bnxt_en: fix module unload sequence
>=20
> Venkata Prasad Potturu (3):
>       ASoC: amd: acp: Fix NULL pointer deref on acp resume path
>       ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
>       ASoC: amd: acp: Fix devm_snd_soc_register_card(acp-pdm-mach) failure
>=20
> Victor Nogueira (5):
>       net_sched: drr: Fix double list add in class with netem as child qd=
isc
>       net_sched: hfsc: Fix a UAF vulnerability in class with netem as
> child qdisc
>       net_sched: ets: Fix double list add in class with netem as child qd=
isc
>       net_sched: qfq: Fix double list add in class with netem as child qd=
isc
>       selftests: tc-testing: Add TDC tests that exercise reentrant
> enqueue behaviour
>=20
> Vijendar Mukunda (1):
>       ASoC: amd: ps: fix for irq handler return status
>=20
> Viresh Kumar (1):
>       cpufreq: ACPI: Re-sync CPU boost state on system resume
>=20
> Vishal Badole (1):
>       amd-xgbe: Fix to ensure dependent features are toggled with RX
> checksum offload
>=20
> Vlad Dogaru (1):
>       net/mlx5e: Use custom tunnel header for vxlan gbp
>=20
> Vladimir Oltean (6):
>       net: mscc: ocelot: delete PVID VLAN when readding it as non-PVID
>       selftests: net: bridge_vlan_aware: test untagged/8021p-tagged
> with and without PVID
>       net: dsa: felix: fix broken taprio gate states after clock jump
>       selftests: net: tsn_lib: create common helper for counting
> received packets
>       selftests: net: tsn_lib: add window_size argument to isochron_do()
>       selftests: net: tc_taprio: new test
>=20
> Wei Yang (3):
>       mm/memblock: pass size instead of end to memblock_set_node()
>       mm/memblock: repeat setting reserved region nid if array is doubled
>       memblock tests: add test for memblock_set_node
>=20
> Wentao Guan (2):
>       nvme-pci: add quirks for device 126f:1001
>       nvme-pci: add quirks for WDC Blue SN550 15b7:5009
>=20
> Wentao Liang (1):
>       wifi: brcm80211: fmac: Add error handling for brcmf_usb_dl_writeima=
ge()
>=20
> Will Deacon (1):
>       arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
>=20
> Wolfram Sang (1):
>       mmc: renesas_sdhi: disable clocks if registering regulator failed
>=20
> Xuanqiang Luo (1):
>       ice: Check VF VSI Pointer Value in ice_vc_add_fdir_fltr()
>=20
> Yonglong Liu (1):
>       net: hns3: fix an interrupt residual problem
>=20
> Zhenhua Huang (1):
>       mm, slab: clean up slab->obj_exts always
>=20
> Zixian Zeng (2):
>       spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
>       spi: dt-bindings: snps,dw-apb-ssi: Add compatible for SOPHGO SG2042=
 SoC
>=20
> e.kubanski (2):
>       xsk: Fix race condition in AF_XDP generic RX path
>       xsk: Fix offset calculation in unaligned mode
>=20
>=20


=2D-=20
Oleksandr Natalenko, MSE
--nextPart12656949.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmgX4a8ACgkQil/iNcg8
M0uGuA/+OuatBiwMym0vrYIu0g1eU5TKCBAqUdbl2kSggzS9uKh9bX9tKmdKtNNq
5PrNmIE5mFyVfdcRPI7EXNq30OL10TSHEpHNHjvx9CuiRCDjyUtqyCCXym92C83e
X4TtZX3jGo9FM6DFRWopNBJFq3VRfJM5BeO3tpmULbtE05kRRR1mEAuFKw11N0CU
9QWbCQgJlFHxNyPDQYzozPrZ6n1UZIF8Pm8XbNuefHHzgiwDe9bbVXkXzfbOQRHO
IZQOGxMidqFweXy/DN6o/lKV41I8PO/CtTlU9bY8kUGhJENX2VAXjlG+NGLuXgoy
8t/7bFKY8RuD8e5lxeJld/9m0w+PRXvqLvLuT2FEy5iLXyVGASfdXYjYBQ9+86GF
CZY8cuw5r5HdCgsoFPThwwbHQ6MctNfYnJWw/QAkd7f7d0VQoY55SxpPLa3jpTm2
ycw2G6MZulUTTRG+GNbLS4APLqjovjz1ndGV/b3B8wgLltEqJ0rJdLUQiH0mEjep
98I+Lw94xkj0fl1XfeYNxYpaCCIhtEmScoaii3JuB+G7mB2o7NT/K9ij+vnCkT8B
BpcsATeo3dGXHIQaUiglICjTdHk4jVJjm15PsSPZ1vSIEC0vi/QnUI+k/RiFD95t
Aiq5vrkPEZiVNkR5/kvnax4i8c/fgL43FgyLkYvoVuj/tlhVH5M=
=hLC4
-----END PGP SIGNATURE-----

--nextPart12656949.O9o76ZdvQC--



