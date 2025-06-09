Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7F4BA3D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749445315; cv=none; b=t4pW8DsQd4wuJDx/4JAvX9wYYSol0McU87tOWQAgBBlTklCnm+z4HHkpzYrMducQx2dsWKoYOIb6GYw1672NNyFjf/I03QDO+tePnvcc9YsjdcWjD2OClFrOQS533mjuE5iE1hKPpmh+1990Id2Y4fOYWKCKgos1dG38a6wTmAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749445315; c=relaxed/simple;
	bh=214bWXsIHzvejiOyV/5CdPsitlHUitA+jLfw21uktb0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o0QhC/NyH4ykBp4vZXWpO7Jxknm6fP8Ul0V2X6M4MYB1oJe7ra4fVivQ6j8nQFE92sygkOaYAKjDsL69+fp7p4G44PkL88zu2NKDuGWbtca9WU3gSWd255kuRWhYIeXWrm+U77Y5JUElK0P96r/qr+vfqbfgceRh7AUIXLwpwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b=n4VVD9o8; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b="n4VVD9o8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749445310; x=1750050110; i=efault@gmx.de;
	bh=XQ13ywpmDx4UjLk4A+NA5rDFaBUhxSfnVErEPZdR3NY=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n4VVD9o8RjN1YAFF9WHxT1gBXT2QYwzDmtaHD3cNVvn7i9ig74DsQL28QRjRVt3S
	 UZviLa0xnOKk5LHdbaO2CbVinfd3uLwmdXyIvzYP8mV52QwN8bzLYuTHg+HmHJUbB
	 8ulrzOeWe+mYTmOao6mDFhPkMV/sziIiErr2RRMmIRF2SgA2LiKIbwOpunJCVj5at
	 usPUMrAcsvVz9uPDG2l+m0KBAqTodZskjbhLVBvPhfiStYoocjVSCr0EO1dQYKz1w
	 ypNeudUH1DG2JnWnZHZaIkYd/KLNO0WBoE5ah0XaYpmPEgDAdwxcD7EfFOq4OBdd0
	 BpwZYMekK7dwIlTEIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.93]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mz9Un-1ukIkH1tSt-00xZrG; Mon, 09
 Jun 2025 07:01:50 +0200
Message-ID: <334e48ebbf34d853777672449cb29d5f06c751b7.camel@gmx.de>
Subject: Re: [RFC][PATCH 2/5] sched: Optimize ttwu() / select_task_rq()
From: Mike Galbraith <efault@gmx.de>
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, 
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,  rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com,  clm@meta.com
Cc: linux-kernel@vger.kernel.org
Date: Mon, 09 Jun 2025 07:01:47 +0200
In-Reply-To: <20250520101727.620602459@infradead.org>
References: <20250520094538.086709102@infradead.org>
	 <20250520101727.620602459@infradead.org>
Autocrypt: addr=efault@gmx.de; prefer-encrypt=mutual;
 keydata=mQGiBE/h0fkRBACJWa+2g5r12ej5DQZEpm0cgmzjpwc9mo6Jz7PFSkDQGeNG8wGwFzFPKQrLk1JRdqNSq37FgtFDDYlYOzVyO/6rKp0Iar2Oel4tbzlUewaYWUWTTAtJoTC0vf4p9Aybyo9wjor+XNvPehtdiPvCWdONKZuGJHKFpemjXXj7lb9ifwCg7PLKdz/VMBFlvbIEDsweR0olMykD/0uSutpvD3tcTItitX230Z849Wue3cA1wsOFD3N6uTg3GmDZDz7IZF+jJ0kKt9xL8AedZGMHPmYNWD3Hwh2gxLjendZlcakFfCizgjLZF3O7k/xIj7Hr7YqBSUj5Whkbrn06CqXSRE0oCsA/rBitUHGAPguJfgETbtDNqx8RYJA2A/9PnmyAoqH33hMYO+k8pafEgXUXwxWbhx2hlWEgwFovcBPLtukH6mMVKXS4iik9obfPEKLwW1mmz0eoHzbNE3tS1AaagHDhOqnSMGDOjogsUACZjCJEe1ET4JHZWFM7iszyolEhuHbnz2ajwLL9Ge8uJrLATreszJd57u+NhAyEW7QeTWlrZSBHYWxicmFpdGggPGVmYXVsdEBnbXguZGU+iGIEExECACIFAk/h0fkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEMYmACnGfbb41A4AnjscsLm5ep+DSi7Bv8BmmoBGTCRnAJ9oXX0KtnBDttPkgUbaiDX56Z1+crkBDQRP4dH5EAQAtYCgoXJvq8VqoleWvqcNScHLrN4LkFxfGkDdqTyQe/79rDWr8su+8TH1ATZ/k+lC6W+vg7ygrdyOK7egA5u+T/GBA1VN+KqcqGqAEZqCLvjorKVQ6mgb5FfXouSGvtsblbRMireEEhJqIQPndq3DvZbKXHVkKrUBcco4MMGDVucABAsEAKXKCwGVEVuYcM/KdT2htDpziRH4JfUn3Ts2EC6F7rXIQ4NaIA6gAvL6HdD3q
	y6yrWaxyqUg8CnZF/J5HR+IvRK+vu85xxwSLQsrVONH0Ita1jg2nhUW7yLZer8xrhxIuYCqrMgreo5BAA3+irHy37rmqiAFZcnDnCNDtJ4sz48tiEkEGBECAAkFAk/h0fkCGwwACgkQxiYAKcZ9tvgIMQCeIcgjSxwbGiGn2q/cv8IvHf1r/DIAnivw+bGITqTU7rhgfwe07dhBoIdz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:f4uYegIv2E9VMqhNCzSiWuwLYjXtfeNRw5GNosKEu8Rd3sYdc/+
 6IW66rtcDAjhy22FAZUdQg/VlMHW5GNt7SXIdz7Jm4eUC0Bk1RcoEqtFpa45/dMG4aW21ZG
 1L4WyBoXbKCTLO/7VaSONr9hIpSEpJ5HN5LCqufQjGPN/i+5CS5AlD5VgB+O3L9m2/Y3kHD
 xiIbxI0KBEF2IH82r5V/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qMfbhdxfJZo=;JCH/bSjvjgtO81TaVrdMdZtxEGx
 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

Greetings,

This patch gives RT builds terminal heartburn.  This particular boot
survived long/well enough to trigger it with LTP sched tests and still
be able to crash dump the hung box.

(is_migration_disabled() confirmation thingy below gripe)

[   44.379563] WARNING: CPU: 6 PID: 4468 at kernel/sched/core.c:3354 set_ta=
sk_cpu+0x1c1/0x1d0
[   44.379569] Modules linked in: af_packet nft_fib_inet nft_fib_ipv4 nft_f=
ib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nf=
t_ct nft_chain_nat nf_tables ebtable_nat ebtable_broute ip6table_nat ip6tab=
le_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf=
_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security bri=
dge stp llc iscsi_ibft iscsi_boot_sysfs rfkill ip_set nfnetlink ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter binfmt_misc intel_ra=
pl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm=
_intel snd_hda_codec_realtek nls_iso8859_1 nls_cp437 snd_hda_codec_generic =
snd_hda_codec_hdmi snd_hda_scodec_component snd_hda_intel at24 iTCO_wdt snd=
_intel_dspcfg r8169 regmap_i2c snd_intel_sdw_acpi intel_pmc_bxt kvm mei_pxp=
 mei_hdcp iTCO_vendor_support realtek snd_hda_codec i2c_i801 mdio_devres sn=
d_hda_core ums_realtek libphy i2c_mux irqbypass pcspkr i2c_smbus snd_hwdep =
snd_pcm usblp mdio_bus mei_me lpc_ich mfd_core mei snd_timer
[   44.379621]  snd soundcore thermal fan joydev intel_smartconnect tiny_po=
wer_button nfsd auth_rpcgss nfs_acl lockd sch_fq_codel grace sunrpc fuse co=
nfigfs dmi_sysfs ip_tables x_tables uas usb_storage hid_logitech_hidpp hid_=
logitech_dj hid_generic usbhid nouveau drm_ttm_helper ttm gpu_sched xhci_pc=
i i2c_algo_bit xhci_hcd ahci drm_gpuvm ehci_pci ehci_hcd libahci drm_exec m=
xm_wmi libata polyval_clmulni usbcore ghash_clmulni_intel drm_display_helpe=
r sha512_ssse3 sha1_ssse3 cec rc_core video wmi button sd_mod scsi_dh_emc s=
csi_dh_rdac scsi_dh_alua sg scsi_mod scsi_common vfat fat ext4 crc16 mbcach=
e jbd2 loop msr efivarfs aesni_intel
[   44.379663] CPU: 6 UID: 0 PID: 4468 Comm: sandbox_ipc_thr Kdump: loaded =
Not tainted 6.15.0.ge271ed52-master-rt #19 PREEMPT_{RT,(lazy)}  e4f2516a9b8=
5ac19222adb94a538ef0c57343c1c
[   44.379666] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/=
23/2013
[   44.379668] RIP: 0010:set_task_cpu+0x1c1/0x1d0
[   44.379670] Code: 0f 0b e9 8f fe ff ff 80 8b 8c 05 00 00 04 e9 f5 fe ff =
ff 0f 0b e9 7c fe ff ff 0f 0b 66 83 bb 40 04 00 00 00 0f 84 8b fe ff ff <0f=
> 0b e9 84 fe ff ff 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
[   44.379672] RSP: 0018:ffffcd844ef77668 EFLAGS: 00010002
[   44.379673] RAX: 0000000000000200 RBX: ffff896da1e8c700 RCX: 00000000000=
00000
[   44.379675] RDX: ffff896da1e8cb30 RSI: 0000000000000000 RDI: ffff896da1e=
8c700
[   44.379676] RBP: 0000000000000000 R08: 0000000000000206 R09: 00000000000=
2361d
[   44.379677] R10: fbfffffffffff79d R11: 0000000000000004 R12: 00000000000=
00000
[   44.379678] R13: 0000000000000000 R14: 0000000000000028 R15: ffff896da1e=
8d030
[   44.379679] FS:  0000000000000000(0000) GS:ffff8970f15d8000(0000) knlGS:=
0000000000000000
[   44.379681] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.379682] CR2: 00007f4c297c4688 CR3: 000000011b9de002 CR4: 00000000001=
726f0
[   44.379683] Call Trace:
[   44.379686]  <TASK>
[   44.379688]  try_to_wake_up+0x245/0x810
[   44.379692]  rt_mutex_slowunlock+0x1d2/0x2d0
[   44.379696]  ? __pfx_lru_activate+0x10/0x10
[   44.379700]  folio_batch_move_lru+0xc7/0x100
[   44.379704]  ? __pfx_lru_activate+0x10/0x10
[   44.379706]  __folio_batch_add_and_move+0xf2/0x110
[   44.379710]  folio_mark_accessed+0x80/0x1b0
[   44.379711]  unmap_page_range+0x176b/0x1a60
[   44.379717]  unmap_vmas+0xae/0x1a0
[   44.379720]  exit_mmap+0xe5/0x3c0
[   44.379725]  mmput+0x6e/0x150
[   44.379729]  do_exit+0x23c/0xa20
[   44.379732]  do_group_exit+0x33/0x90
[   44.379735]  get_signal+0x85d/0x8b0
[   44.379738]  arch_do_signal_or_restart+0x2d/0x240
[   44.379743]  ? place_entity+0x1b/0x130
[   44.379745]  ? __x64_sys_poll+0x47/0x1a0
[   44.379749]  exit_to_user_mode_loop+0x86/0x150
[   44.379753]  do_syscall_64+0x1ba/0x8e0
[   44.379756]  ? wakeup_preempt+0x40/0x70
[   44.379758]  ? ttwu_do_activate+0x84/0x210
[   44.379760]  ? _raw_spin_unlock_irqrestore+0x22/0x40
[   44.379763]  ? try_to_wake_up+0xab/0x810
[   44.379765]  ? preempt_count_add+0x4b/0xa0
[   44.379768]  ? futex_hash_put+0x43/0x90
[   44.379772]  ? futex_wake+0xb2/0x1c0
[   44.379775]  ? do_futex+0x125/0x190
[   44.379776]  ? __x64_sys_futex+0x10b/0x1c0
[   44.379779]  ? do_syscall_64+0x7f/0x8e0
[   44.379781]  ? __do_sys_prctl+0xbe/0xee0
[   44.379783]  ? do_syscall_64+0x7f/0x8e0
[   44.379786]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   44.379789] RIP: 0033:0x7f4c3571fdef
[   44.379803] Code: Unable to access opcode bytes at 0x7f4c3571fdc5.
[   44.379803] RSP: 002b:00007f4c0c9fe700 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000007
[   44.379805] RAX: fffffffffffffdfc RBX: 00007f4c0c9fe730 RCX: 00007f4c357=
1fdef
[   44.379806] RDX: 00000000ffffffff RSI: 0000000000000002 RDI: 00007f4c0c9=
fe730
[   44.379807] RBP: 00007f4c0c9fe920 R08: 0000000000000000 R09: 00000000000=
00007
[   44.379808] R10: 00005587485bf1d0 R11: 0000000000000293 R12: 00005587485=
a7fc0
[   44.379809] R13: 0000000000000000 R14: 0000000000001174 R15: 00007f4c0c1=
ff000
[   44.379812]  </TASK>

---
 kernel/sched/core.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4313,7 +4313,10 @@ int try_to_wake_up(struct task_struct *p
 		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
 			break;
=20
-		cpu =3D select_task_rq(p, p->wake_cpu, &wake_flags);
+		if (is_migration_disabled(p))
+			cpu =3D -1;
+		else
+			cpu =3D select_task_rq(p, p->wake_cpu, &wake_flags);
=20
 		/*
 		 * If the owning (remote) CPU is still in the middle of schedule() with
@@ -4326,6 +4329,9 @@ int try_to_wake_up(struct task_struct *p
 		 */
 		smp_cond_load_acquire(&p->on_cpu, !VAL);
=20
+		if (cpu =3D=3D -1)
+			cpu =3D select_task_rq(p, p->wake_cpu, &wake_flags);
+
 		if (task_cpu(p) !=3D cpu) {
 			if (p->in_iowait) {
 				delayacct_blkio_end(p);


