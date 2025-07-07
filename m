Received: from mxo1.dft.dmz.twosigma.com (mxo1.dft.dmz.twosigma.com [208.77.212.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FB01E22FC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.77.212.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894743; cv=none; b=BBHLeNY3s5BG9Y6TBSrSZ6AuruNmPAQztIwZxmzc7qFmVVnTG4HIigMCf74GJYq2Q3qSI+z8xRGtoJWs1V4T9NEVMWR+yeaAhCK3hqWA1Ofg33ED023Kk2tD3KBqafpXBpr1PGPP+CbYtvxNpssX/CJvGfTopKA43RaV6+SEt9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894743; c=relaxed/simple;
	bh=5+TOCvYeaJxWPrfmRTjs2ARhB4VPpz309QFH2xI12v0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rl9P4WRCImxodp+zSnlitbDZ3nOEIhIKQG2+6bmRKbFPgrVtkQw9oJxE9gOZpqhk2X4AEbcdDtGVzWw2e/GDE3QzfUFyF6Z7EMTENbVqynoDQTw+DgH8EMUqZYKt848LZgb1UeG96dfWi0w50nDAHVoqhSLkj97WT48m4dOc+WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=twosigma.com; spf=pass smtp.mailfrom=twosigma.com; dkim=pass (2048-bit key) header.d=twosigma.com header.i=@twosigma.com header.b=BjdMN9To; arc=none smtp.client-ip=208.77.212.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=twosigma.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=twosigma.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=twosigma.com header.i=@twosigma.com header.b="BjdMN9To"
Received: from localhost (localhost [127.0.0.1])
	by mxo1.dft.dmz.twosigma.com (Postfix) with ESMTP id 4bbPw84WYSzBslN
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=twosigma.com;
	s=202008; t=1751894360;
	bh=plXFavDQH65EWu2VaxclA8kgZR1LWcTNgtglg5W7Ns0=;
	h=Date:From:To:Subject:From;
	b=BjdMN9TobPt9SfNQU2Sn3VdlHMmeZY059PkAZP1FgFs/NTRt4VYdaeVQNM8Fx/Kpx
	 j0c6GcLhddVZnWeF1vcUkth6wk3pcEqHkVogfiBGvI5kThN5/9iKcSn8jv7BpcaOrT
	 LakJJ6RGuDLvsAn2T8ayEERyaZ0SSId7XG3J9/F92iH2lEfi+K1slsLFGPgKPwpHmb
	 KrtZ1rSlNvYOhI9geX8asipuvQawvR0K2UG1BQNdeDOKbajE+D2cG15NVRRlWIfkF3
	 HLy8TsLXPGTKEVlNU/U30YdrPGly/JsimmWiBjm+QiW9yItGToPzCc52+/gnjUeb4D
	 JMzxQJHs3Kpqw==
X-Virus-Scanned: Debian amavisd-new at twosigma.com
Received: from mxo1.dft.dmz.twosigma.com ([127.0.0.1])
	by localhost (mxo1.dft.dmz.twosigma.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVgVx9oOmjD9 for <linux-kernel@vger.kernel.org>;
	Mon,  7 Jul 2025 13:19:20 +0000 (UTC)
Received: from gsnje-exhy04.ad.twosigma.com (gsnje-exhy04.ad.twosigma.com [172.20.16.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxo1.dft.dmz.twosigma.com (Postfix) with ESMTPS id 4bbPw83tNQzBrLm
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:19:20 +0000 (UTC)
Received: from gsnje-exhy04.ad.twosigma.com (172.20.16.88) by
 gsnje-exhy04.ad.twosigma.com (172.20.16.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 7 Jul 2025 09:19:20 -0400
Received: from slctms-stg-build-1.dft.twosigma.com (172.20.188.122) by
 gsnje-exhy04.ad.twosigma.com (172.20.16.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10 via Frontend Transport; Mon, 7 Jul 2025 09:19:20 -0400
Date: Mon, 7 Jul 2025 09:19:19 -0400
From: Thomas Walker <Thomas.Walker@twosigma.com>
To: <linux-kernel@vger.kernel.org>
Subject: rq->clock_update_flags < RQCF_ACT_SKIP in dl_rq_change_utilization()
Message-ID: <xdt2jn3c26vekaf7y66xqjcveae4f65c7gquxolsgdbtf3wwfu@iljfgue43ns2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, we have a couple of workloads running on 6.12 kernels that showed some =
slightly increased latency tails with fair_server enabled, so we disable it=
 on boot on some number of isolated (nohz_full, etc) cores.

$ echo -1 | sudo tee /proc/sys/kernel/sched_rt_runtime_us
$ for f in $(seq 2 2 16); do echo 0 | sudo tee /sys/kernel/debug/sched/fair=
_server/cpu${f}/runtime ; done

Which works as expected but, more often than not, triggers the following WA=
RN_ON.  Any suggestions for debugging further would be greatly appreciated.

[  653.430659] rq->clock_update_flags < RQCF_ACT_SKIP
[  653.430663] WARNING: CPU: 87 PID: 14185 at kernel/sched/sched.h:1649 dl_=
rq_change_utilization+0x225/0x250
[  653.430671] Modules linked in: uas usb_storage tcp_diag inet_diag tls nv=
me_fabrics nvme_keyring dell_rbu xfs dm_crypt rpcrdma sunrpc rdma_ucm ib_is=
er rdma_cm iw_cm xt_conntrack ib_cm nf_conntrack libiscsi scsi_transport_is=
csi nf_defrag_ipv6 intel_rapl_msr nf_defrag_ipv4 intel_rapl_common xt_comme=
nt intel_uncore_frequency xt_set intel_uncore_frequency_common intel_ifs xt=
_tcpudp i10nm_edac ipt_REJECT skx_edac_common nf_reject_ipv4 nfit xt_LOG nf=
_log_syslog libnvdimm nft_compat nf_tables x86_pkg_temp_thermal intel_power=
clamp coretemp kvm_intel irdma libcrc32c kvm i40e ib_uverbs ip_set_hash_net=
 irqbypass crct10dif_pclmul ghash_clmulni_intel sha512_ssse3 ip_set_bitmap_=
port sha256_ssse3 sha1_ssse3 ip_set aesni_intel gf128mul crypto_simd cryptd=
 binfmt_misc nfnetlink ib_core ipmi_ssif snd_pcm rapl intel_cstate drm_shme=
m_helper snd_timer deflate drm_kms_helper iaa_crypto intel_uncore snd dell_=
pc nls_ascii idxd pmt_telemetry nls_cp437 evdev intel_sdsi mei_me pmt_class=
 dell_smbios vfat platform_profile iTCO_wdt dax_hmem dcdbas
[  653.430731]  fat soundcore mei intel_pmc_bxt ipmi_si cxl_acpi dell_wmi_d=
escriptor pcspkr wmi_bmof iTCO_vendor_support isst_if_mbox_pci isst_if_mmio=
 acpi_power_meter watchdog acpi_ipmi i2c_algo_bit ipmi_devintf isst_if_comm=
on idxd_bus intel_vsec ipmi_msghandler sg button tcp_scalable drm loop dm_m=
od efi_pstore configfs efivarfs ip_tables x_tables autofs4 ext4 crc32c_gene=
ric crc16 mbcache jbd2 sd_mod xhci_pci sfc xhci_hcd mpi3mr ahci nvme libahc=
i ice libata usbcore scsi_transport_sas nvme_core tg3 mtd i2c_i801 crc32_pc=
lmul gnss scsi_mod libphy i2c_ismt nvme_auth crc32c_intel usb_common mdio l=
ibie i2c_smbus wmi scsi_common pinctrl_emmitsburg
[  653.430774] CPU: 87 UID: 0 PID: 14185 Comm: tee Not tainted 6.12.35 #2
[  653.430776] Hardware name: Dell Inc. PowerEdge R660/XXXXXX, BIOS 2.6.3 0=
3/26/2025
[  653.430778] RIP: 0010:dl_rq_change_utilization+0x225/0x250
[  653.430782] Code: 09 00 00 72 d2 e9 7d fe ff ff 80 3d c2 55 cf 01 00 0f =
85 9f fe ff ff 48 c7 c7 28 88 11 a2 c6 05 ae 55 cf 01 01 e8 9b 64 f9 ff <0f=
> 0b e9 85 fe ff ff e8 bf 1e f9 ff e9 e6 fd ff ff 48 c7 c7 88 8d
[  653.430784] RSP: 0018:ff70e427e8b0fbf0 EFLAGS: 00010082
[  653.430786] RAX: 0000000000000000 RBX: ff169e20be6b5e40 RCX: 00000000000=
00027
[  653.430787] RDX: ff169e60bf5a1748 RSI: 0000000000000001 RDI: ff169e60bf5=
a1740
[  653.430788] RBP: ff169e20be6b67a8 R08: 0000000000000000 R09: ff70e427e8b=
0fa70
[  653.430789] R10: ff169e60bdf3ffa8 R11: 0000000000000003 R12: ff169e20be6=
a1680
[  653.430790] R13: 0000000000000000 R14: ffffffffa0d3fe50 R15: ff169e21c6a=
3f800
[  653.430792] FS:  00007facf3351740(0000) GS:ff169e60bf580000(0000) knlGS:=
0000000000000000
[  653.430794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  653.430795] CR2: 000055c54ae470b8 CR3: 00000040e3f92004 CR4: 0000000000f=
73ef0
[  653.430797] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  653.430797] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 00000000000=
00400
[  653.430799] PKRU: 55555554
[  653.430800] Call Trace:
[  653.430801]  <TASK>
[  653.430805]  dl_server_apply_params+0x282/0x320
[  653.430809]  sched_fair_server_write.isra.0+0x11a/0x1d0
[  653.430813]  full_proxy_write+0x4e/0x90
[  653.430816]  vfs_write+0xf5/0x450
[  653.430819]  ? vfs_write+0x28d/0x450
[  653.430822]  ksys_write+0x6d/0xf0
[  653.430824]  do_syscall_64+0x82/0x190
[  653.430828]  ? do_syscall_64+0x8e/0x190
[  653.430830]  ? syscall_exit_to_user_mode+0x4d/0x210
[  653.430832]  ? do_syscall_64+0x8e/0x190
[  653.430833]  ? __memcg_slab_free_hook+0xf7/0x140
[  653.430836]  ? __x64_sys_close+0x3c/0x80
[  653.430839]  ? kmem_cache_free+0x3ee/0x440
[  653.430841]  ? syscall_exit_to_user_mode+0x4d/0x210
[  653.430843]  ? do_syscall_64+0x8e/0x190
[  653.430845]  ? exc_page_fault+0x7e/0x180
[  653.430847]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  653.430850] RIP: 0033:0x7facf344c300
[  653.430852] Code: 40 00 48 8b 15 01 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff =
ff ff ff eb b7 0f 1f 00 80 3d e1 22 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[  653.430853] RSP: 002b:00007ffefcf68c88 EFLAGS: 00000202 ORIG_RAX: 000000=
0000000001
[  653.430855] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007facf34=
4c300
[  653.430857] RDX: 0000000000000002 RSI: 00007ffefcf68da0 RDI: 00000000000=
00003
[  653.430857] RBP: 00007ffefcf68da0 R08: 0000000000000004 R09: 00000000000=
00001
[  653.430858] R10: 00007facf3368f18 R11: 0000000000000202 R12: 00000000000=
00002
[  653.430859] R13: 000055c54ae45470 R14: 0000000000000002 R15: 00007facf35=
229e0
[  653.430862]  </TASK>
[  653.430863] ---[ end trace 0000000000000000 ]---
[  653.430865] Fair server disabled in CPU 2, system may crash due to starv=
ation.
[  653.480471] Fair server disabled in CPU 4, system may crash due to starv=
ation.
[  653.533134] Fair server disabled in CPU 6, system may crash due to starv=
ation.
[  653.586481] Fair server disabled in CPU 8, system may crash due to starv=
ation.
[  653.636169] Fair server disabled in CPU 10, system may crash due to star=
vation.
[  653.685718] Fair server disabled in CPU 12, system may crash due to star=
vation.
[  653.737015] Fair server disabled in CPU 14, system may crash due to star=
vation.
[  653.787139] Fair server disabled in CPU 16, system may crash due to star=
vation.
