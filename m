Received: from smtpa35.poczta.onet.pl (smtpa35.poczta.onet.pl [213.180.142.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8528436B
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.142.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746347227; cv=none; b=qn33ylvvlojQLiB/D5hQEnoMgn0t1ip7ywLl+IVZ3vTHhogE9aezyYOeJNu3XmpZ+S+xCMJbsCZMvL6XXg+15E+ab0/SXep1ZQUFQcVIoJGTPu/ZYAXUXXC2ZGK0z4Pa39vyUhbudx32eKD+x2hTtO2zxp7d/w/zRzw15Cu69IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746347227; c=relaxed/simple;
	bh=Y8x1cGBM83YS1OYshQDtXujVjbTi9cgefnEjsnb64eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YneuFnYNl8RWSlorg1r0FaXWFIeLRIjnOX4lOoON4XZBVpN4HCL17ATccPyEQDGewzOCcYkB+FfgeMygAil9Buz+H4zqtXoj3iTlPAcM4aB/qRUyG9OqReFT+o60lWTz0xQZLv7v6f0IeoqZRX7w9r9CSyhY+1FD+TAcBJt2Jvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl; spf=pass smtp.mailfrom=op.pl; dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b=qHy+3c8V; arc=none smtp.client-ip=213.180.142.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=op.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b="qHy+3c8V"
Received: from [192.168.88.101] (unknown [185.127.22.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: dragonn@op.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4ZqyQq4FGmzlgMqZ;
	Sun,  4 May 2025 10:25:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
	t=1746347146; bh=UnYj5MH920U0WGeVlFcY/sfuuxkPyX2618eh+yGiFe8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qHy+3c8VmhbzCvnZ/oNptrvCzqidNdiIfWhlepzIa9hkKPXQWYPYDMzp1R05IhutT
	 G9fsr+VOzOQIAKcXbjSW0qeDnIEoZiklFP88Y9VUSmogMfSsnB+9K3USVwY88PdvPq
	 6foGax5sa6NK5qRviVxkMB65KAB7LQgx2i8e66nQ=
Message-ID: <4db60fd6-ffd7-43d8-967b-38d6dae5be71@op.pl>
Date: Sun, 4 May 2025 10:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mei: vsc: Fix fortify-panic caused by invalid
 counted_by() use
To: Hans de Goede <hdegoede@redhat.com>, Wentong Wu <wentong.wu@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250318141203.94342-1-hdegoede@redhat.com>
 <20250318141203.94342-2-hdegoede@redhat.com>
Content-Language: en-US
From: Mateusz Schyboll <dragonn@op.pl>
In-Reply-To: <20250318141203.94342-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

found this patch while searching for a I think a similar bug on 6.14.4 
compiled with gcc 15:

[  121.966267] memcpy: detected buffer overflow: 3 byte read of buffer 
size 18446744073709551615
[  121.966273] WARNING: CPU: 7 PID: 3709 at lib/string_helpers.c:1032 
__fortify_report+0x49/0x50
[  121.966277] Modules linked in: xt_addrtype ip_set_hash_net ip_set 
xt_connmark xt_MASQUERADE xt_mark xt_conntrack iptable_nat nf_nat 
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle nf_tables 
iptable_filter wireguard curve25519_x86_64 libchacha20poly1305 
chacha_x86_64 poly1305_x86_64 libcurve25519_generic libchacha 
ip6_udp_tunnel udp_tunnel snd_seq_dummy snd_hrtimer rfcomm snd_seq qrtr 
ccm algif_aead crypto_null des3_ede_x86_64 cbc des_generic libdes uhid 
cmac md4 algif_hash algif_skcipher af_alg bnep sch_cake zram 
842_decompress 842_compress pkcs8_key_parser bcachefs lz4hc_compress 
nls_iso8859_1 lz4_compress vfat fat snd_usb_audio snd_usbmidi_lib 
snd_ump snd_rawmidi snd_seq_device mc amd_atl intel_rapl_msr 
intel_rapl_common iwlmvm snd_hda_codec_realtek kvm_amd 
snd_hda_codec_generic snd_hda_scodec_component mac80211 kvm 
snd_hda_intel nvidia_drm(OE) libarc4 snd_intel_dspcfg irqbypass ptp 
snd_intel_sdw_acpi polyval_clmulni pps_core btusb snd_hda_codec 
polyval_generic btrtl ghash_clmulni_intel snd_hda_core
[  121.966340]  nvidia_modeset(OE) sha512_ssse3 btintel snd_hwdep 
sha256_ssse3 iwlwifi spd5118 btbcm sha1_ssse3 snd_pcm r8169 btmtk 
aesni_intel sp5100_tco snd_timer crypto_simd drm_ttm_helper realtek 
bluetooth mousedev joydev ttm snd cryptd mdio_devres i2c_piix4 cfg80211 
wmi_bmof rapl ccp soundcore libphy pcspkr i2c_smbus mac_hid 
nvidia_uvm(OE) nvidia(OE) it87(OE) hwmon_vid i2c_dev sg crypto_user 
k10temp acpi_call(OE) dm_mod loop nfnetlink ip_tables x_tables 
hid_generic nvme nvme_core nvme_auth hid_asus usbhid asus_wmi video wmi 
sparse_keymap i8042 platform_profile rfkill atkbd libps2 serio vivaldi_fmap
[  121.966389] CPU: 7 UID: 1000 PID: 3709 Comm: Wonderlands.exe Tainted: 
G           OE      6.14.4-arch1-1.2-g14 #1 
57caf87d4589a112ce1dd9d12091033e815c0f73
[  121.966392] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[  121.966393] Hardware name: Micro Computer (HK) Tech Limited 
MotherBoard Series/DRFXL, BIOS 1.09 09/29/2024
[  121.966394] RIP: 0010:__fortify_report+0x49/0x50
[  121.966396] Code: d0 48 0f 47 c2 83 e7 01 4c 89 ca 48 8b 34 c5 e0 ef 
6f 9b 48 c7 c0 b0 15 e2 9b 48 c7 c7 f0 15 d5 9b 48 0f 44 c8 e8 27 98 80 
ff <0f> 0b e9 0b 6b 5b ff 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
[  121.966398] RSP: 0018:ffffb73e0663f880 EFLAGS: 00010246
[  121.966399] RAX: 0000000000000000 RBX: ffffb73e0663f8f0 RCX: 
0000000000000027
[  121.966401] RDX: ffff96c6bd3a1908 RSI: 0000000000000001 RDI: 
ffff96c6bd3a1900
[  121.966401] RBP: ffffb73e0663f988 R08: 0000000000000000 R09: 
00000000ffffdfff
[  121.966402] R10: ffffffff9d240820 R11: ffffb73e0663f718 R12: 
ffff96b9ceb4c000
[  121.966403] R13: 0000000000000003 R14: ffff96b8fc79e290 R15: 
ffff96bad2e81b40
[  121.966404] FS:  00007860a69c0f80(0000) GS:ffff96c6bd380000(0000) 
knlGS:000000007ffc0000
[  121.966406] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  121.966407] CR2: 0000000081f2d31c CR3: 000000030f1ae000 CR4: 
0000000000f50ef0
[  121.966408] PKRU: 55555554
[  121.966409] Call Trace:
[  121.966411]  <TASK>
[  121.966412]  __fortify_panic+0xd/0xf
[  121.966416]  bch2_xattr_get_trans.cold+0xe/0xe [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966446]  ? __bch2_time_stats_update+0xfc/0x340 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966471]  bch2_xattr_get_handler+0x85/0x150 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966488]  __vfs_getxattr+0x91/0xd0
[  121.966492]  do_getxattr+0xb5/0x190
[  121.966494]  path_getxattrat+0x12f/0x190
[  121.966500]  do_syscall_64+0x7f/0x190
[  121.966505]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966507]  ? switch_fpu_return+0x5d/0xe0
[  121.966510]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966511]  ? arch_exit_to_user_mode_prepare.isra.0+0x7c/0xa0
[  121.966514]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966515]  ? syscall_exit_to_user_mode+0x45/0x1d0
[  121.966517]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966519]  ? __bch2_fs_usage_read_short+0x1cb/0x200 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966538]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966540]  ? bch2_fs_usage_read_short+0x56/0xe0 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966553]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966555]  ? do_statfs_native+0x38/0x70
[  121.966558]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966560]  ? __do_sys_fstatfs+0x5e/0x70
[  121.966561]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966562]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966564]  ? cp_new_stat+0x131/0x170
[  121.966568]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966569]  ? __do_sys_newfstat+0x6a/0x80
[  121.966572]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966573]  ? syscall_exit_to_user_mode+0x45/0x1d0
[  121.966575]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966576]  ? do_syscall_64+0x8b/0x190
[  121.966578]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966579]  ? do_syscall_64+0x8b/0x190
[  121.966581]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966582]  ? irqentry_exit_to_user_mode+0x3a/0x1d0
[  121.966584]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  121.966586] RIP: 0033:0x7860a6e8df9e
[  121.966608] Code: 48 89 e5 48 83 ec 08 6a 4b e8 8e 30 f8 ff c9 c3 66 
2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 49 89 ca b8 c1 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 42 6d 0d 00 f7 d8 64 89 01 48
[  121.966610] RSP: 002b:00000001000ff318 EFLAGS: 00000246 ORIG_RAX: 
00000000000000c1
[  121.966611] RAX: ffffffffffffffda RBX: 00000001000ff434 RCX: 
00007860a6e8df9e
[  121.966612] RDX: 00000001000ff330 RSI: 00007860a5439317 RDI: 
00000000000003e6
[  121.966613] RBP: 00000001000ff3f0 R08: 0000000000001460 R09: 
00007860a548f5c0
[  121.966614] R10: 0000000000000040 R11: 0000000000000246 R12: 
0000000000000000
[  121.966615] R13: 00000001000ff330 R14: 00000001000ff440 R15: 
00000000000003e6
[  121.966618]  </TASK>
[  121.966619] ---[ end trace 0000000000000000 ]---
[  121.966623] ------------[ cut here ]------------
[  121.966623] kernel BUG at lib/string_helpers.c:1040!
[  121.966629] Oops: invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  121.966631] CPU: 7 UID: 1000 PID: 3709 Comm: Wonderlands.exe Tainted: 
G        W  OE      6.14.4-arch1-1.2-g14 #1 
57caf87d4589a112ce1dd9d12091033e815c0f73
[  121.966634] Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[  121.966635] Hardware name: Micro Computer (HK) Tech Limited 
MotherBoard Series/DRFXL, BIOS 1.09 09/29/2024
[  121.966636] RIP: 0010:__fortify_panic+0xd/0xf
[  121.966638] Code: e9 bc 22 90 00 0f 1f 84 00 00 00 00 00 90 90 90 90 
90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 43 50 90 
00 <0f> 0b 48 8b 54 24 18 48 8b 74 24 10 4d 89 d0 4c 89 e1 48 c7 c7 cc
[  121.966640] RSP: 0018:ffffb73e0663f888 EFLAGS: 00010246
[  121.966641] RAX: 0000000000000000 RBX: ffffb73e0663f8f0 RCX: 
0000000000000027
[  121.966642] RDX: ffff96c6bd3a1908 RSI: 0000000000000001 RDI: 
ffff96c6bd3a1900
[  121.966644] RBP: ffffb73e0663f988 R08: 0000000000000000 R09: 
00000000ffffdfff
[  121.966645] R10: ffffffff9d240820 R11: ffffb73e0663f718 R12: 
ffff96b9ceb4c000
[  121.966646] R13: 0000000000000003 R14: ffff96b8fc79e290 R15: 
ffff96bad2e81b40
[  121.966647] FS:  00007860a69c0f80(0000) GS:ffff96c6bd380000(0000) 
knlGS:000000007ffc0000
[  121.966648] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  121.966649] CR2: 0000000081f2d31c CR3: 000000030f1ae000 CR4: 
0000000000f50ef0
[  121.966651] PKRU: 55555554
[  121.966652] Call Trace:
[  121.966653]  <TASK>
[  121.966654]  bch2_xattr_get_trans.cold+0xe/0xe [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966673]  ? __bch2_time_stats_update+0xfc/0x340 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966693]  bch2_xattr_get_handler+0x85/0x150 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966710]  __vfs_getxattr+0x91/0xd0
[  121.966712]  do_getxattr+0xb5/0x190
[  121.966715]  path_getxattrat+0x12f/0x190
[  121.966721]  do_syscall_64+0x7f/0x190
[  121.966724]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966725]  ? switch_fpu_return+0x5d/0xe0
[  121.966727]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966728]  ? arch_exit_to_user_mode_prepare.isra.0+0x7c/0xa0
[  121.966730]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966731]  ? syscall_exit_to_user_mode+0x45/0x1d0
[  121.966733]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966735]  ? __bch2_fs_usage_read_short+0x1cb/0x200 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966755]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966756]  ? bch2_fs_usage_read_short+0x56/0xe0 [bcachefs 
b5391e24358551d6754989dda9ec90add2ece543]
[  121.966770]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966772]  ? do_statfs_native+0x38/0x70
[  121.966775]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966776]  ? __do_sys_fstatfs+0x5e/0x70
[  121.966778]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966779]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966781]  ? cp_new_stat+0x131/0x170
[  121.966784]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966786]  ? __do_sys_newfstat+0x6a/0x80
[  121.966789]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966791]  ? syscall_exit_to_user_mode+0x45/0x1d0
[  121.966792]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966794]  ? do_syscall_64+0x8b/0x190
[  121.966796]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966797]  ? do_syscall_64+0x8b/0x190
[  121.966799]  ? srso_alias_return_thunk+0x5/0xfbef5
[  121.966801]  ? irqentry_exit_to_user_mode+0x3a/0x1d0
[  121.966803]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  121.966805] RIP: 0033:0x7860a6e8df9e
[  121.966807] Code: 48 89 e5 48 83 ec 08 6a 4b e8 8e 30 f8 ff c9 c3 66 
2e 0f 1f 84 00 00 00 00 00 66 90 f3 0f 1e fa 49 89 ca b8 c1 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 42 6d 0d 00 f7 d8 64 89 01 48
[  121.966808] RSP: 002b:00000001000ff318 EFLAGS: 00000246 ORIG_RAX: 
00000000000000c1
[  121.966810] RAX: ffffffffffffffda RBX: 00000001000ff434 RCX: 
00007860a6e8df9e
[  121.966811] RDX: 00000001000ff330 RSI: 00007860a5439317 RDI: 
00000000000003e6
[  121.966812] RBP: 00000001000ff3f0 R08: 0000000000001460 R09: 
00007860a548f5c0
[  121.966814] R10: 0000000000000040 R11: 0000000000000246 R12: 
0000000000000000
[  121.966815] R13: 00000001000ff330 R14: 00000001000ff440 R15: 
00000000000003e6
[  121.966818]  </TASK>
[  121.966819] Modules linked in: xt_addrtype ip_set_hash_net ip_set 
xt_connmark xt_MASQUERADE xt_mark xt_conntrack iptable_nat nf_nat 
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle nf_tables 
iptable_filter wireguard curve25519_x86_64 libchacha20poly1305 
chacha_x86_64 poly1305_x86_64 libcurve25519_generic libchacha 
ip6_udp_tunnel udp_tunnel snd_seq_dummy snd_hrtimer rfcomm snd_seq qrtr 
ccm algif_aead crypto_null des3_ede_x86_64 cbc des_generic libdes uhid 
cmac md4 algif_hash algif_skcipher af_alg bnep sch_cake zram 
842_decompress 842_compress pkcs8_key_parser bcachefs lz4hc_compress 
nls_iso8859_1 lz4_compress vfat fat snd_usb_audio snd_usbmidi_lib 
snd_ump snd_rawmidi snd_seq_device mc amd_atl intel_rapl_msr 
intel_rapl_common iwlmvm snd_hda_codec_realtek kvm_amd 
snd_hda_codec_generic snd_hda_scodec_component mac80211 kvm 
snd_hda_intel nvidia_drm(OE) libarc4 snd_intel_dspcfg irqbypass ptp 
snd_intel_sdw_acpi polyval_clmulni pps_core btusb snd_hda_codec 
polyval_generic btrtl ghash_clmulni_intel snd_hda_core
[  121.966863]  nvidia_modeset(OE) sha512_ssse3 btintel snd_hwdep 
sha256_ssse3 iwlwifi spd5118 btbcm sha1_ssse3 snd_pcm r8169 btmtk 
aesni_intel sp5100_tco snd_timer crypto_simd drm_ttm_helper realtek 
bluetooth mousedev joydev ttm snd cryptd mdio_devres i2c_piix4 cfg80211 
wmi_bmof rapl ccp soundcore libphy pcspkr i2c_smbus mac_hid 
nvidia_uvm(OE) nvidia(OE) it87(OE) hwmon_vid i2c_dev sg crypto_user 
k10temp acpi_call(OE) dm_mod loop nfnetlink ip_tables x_tables 
hid_generic nvme nvme_core nvme_auth hid_asus usbhid asus_wmi video wmi 
sparse_keymap i8042 platform_profile rfkill atkbd libps2 serio vivaldi_fmap
[  121.966899] ---[ end trace 0000000000000000 ]---
[  121.966900] RIP: 0010:__fortify_panic+0xd/0xf
[  121.966902] Code: e9 bc 22 90 00 0f 1f 84 00 00 00 00 00 90 90 90 90 
90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 43 50 90 
00 <0f> 0b 48 8b 54 24 18 48 8b 74 24 10 4d 89 d0 4c 89 e1 48 c7 c7 cc
[  121.966903] RSP: 0018:ffffb73e0663f888 EFLAGS: 00010246
[  121.966905] RAX: 0000000000000000 RBX: ffffb73e0663f8f0 RCX: 
0000000000000027
[  121.966906] RDX: ffff96c6bd3a1908 RSI: 0000000000000001 RDI: 
ffff96c6bd3a1900
[  121.966907] RBP: ffffb73e0663f988 R08: 0000000000000000 R09: 
00000000ffffdfff
[  121.966908] R10: ffffffff9d240820 R11: ffffb73e0663f718 R12: 
ffff96b9ceb4c000
[  121.966909] R13: 0000000000000003 R14: ffff96b8fc79e290 R15: 
ffff96bad2e81b40
[  121.966910] FS:  00007860a69c0f80(0000) GS:ffff96c6bd380000(0000) 
knlGS:000000007ffc0000
[  121.966912] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  121.966913] CR2: 0000000081f2d31c CR3: 000000030f1ae000 CR4: 
0000000000f50ef0
[  121.966914] PKRU: 55555554

Unfortunately even with this patch the bug still shows up, so I am not 
100% sure this is exactly the same , the call trace is diffirent so 
maybe a similar bug but in a diffirent subsystem?

The behavior from user space is that I am trying to launch Tiny Tina's 
Wonderlands and that pops up after the optimizing shaders finishes and 
the game never launches, it gets stuck after that.

W dniu 18.03.2025 o 15:12, Hans de Goede pisze:
> gcc 15 honors the __counted_by(len) attribute on vsc_tp_packet.buf[]
> and the vsc-tp.c code is using this in a wrong way. len does not contain
> the available size in the buffer, it contains the actual packet length
> *without* the crc. So as soon as vsc_tp_xfer() tries to add the crc to
> buf[] the fortify-panic handler gets triggered:
>
> [   80.842193] memcpy: detected buffer overflow: 4 byte write of buffer size 0
> [   80.842243] WARNING: CPU: 4 PID: 272 at lib/string_helpers.c:1032 __fortify_report+0x45/0x50
> ...
> [   80.843175]  __fortify_panic+0x9/0xb
> [   80.843186]  vsc_tp_xfer.cold+0x67/0x67 [mei_vsc_hw]
> [   80.843210]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
> [   80.843229]  ? lockdep_hardirqs_on+0x7c/0x110
> [   80.843250]  mei_vsc_hw_start+0x98/0x120 [mei_vsc]
> [   80.843270]  mei_reset+0x11d/0x420 [mei]
>
> The easiest fix would be to just drop the counted-by but with the exception
> of the ack buffer in vsc_tp_xfer_helper() which only contains enough room
> for the packet-header, all other uses of vsc_tp_packet always use a buffer
> of VSC_TP_MAX_XFER_SIZE bytes for the packet.
>
> Instead of just dropping the counted-by, split the vsc_tp_packet struct
> definition into a header and a full-packet definition and use a fixed
> size buf[] in the packet definition, this way fortify-source buffer
> overrun checking still works when enabled.
>
> Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
> Cc: stable@kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/misc/mei/vsc-tp.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
> index 7be1649b1972..fa553d4914b6 100644
> --- a/drivers/misc/mei/vsc-tp.c
> +++ b/drivers/misc/mei/vsc-tp.c
> @@ -36,20 +36,24 @@
>   #define VSC_TP_XFER_TIMEOUT_BYTES		700
>   #define VSC_TP_PACKET_PADDING_SIZE		1
>   #define VSC_TP_PACKET_SIZE(pkt) \
> -	(sizeof(struct vsc_tp_packet) + le16_to_cpu((pkt)->len) + VSC_TP_CRC_SIZE)
> +	(sizeof(struct vsc_tp_packet_hdr) + le16_to_cpu((pkt)->hdr.len) + VSC_TP_CRC_SIZE)
>   #define VSC_TP_MAX_PACKET_SIZE \
> -	(sizeof(struct vsc_tp_packet) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
> +	(sizeof(struct vsc_tp_packet_hdr) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
>   #define VSC_TP_MAX_XFER_SIZE \
>   	(VSC_TP_MAX_PACKET_SIZE + VSC_TP_XFER_TIMEOUT_BYTES)
>   #define VSC_TP_NEXT_XFER_LEN(len, offset) \
> -	(len + sizeof(struct vsc_tp_packet) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
> +	(len + sizeof(struct vsc_tp_packet_hdr) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
>   
> -struct vsc_tp_packet {
> +struct vsc_tp_packet_hdr {
>   	__u8 sync;
>   	__u8 cmd;
>   	__le16 len;
>   	__le32 seq;
> -	__u8 buf[] __counted_by(len);
> +};
> +
> +struct vsc_tp_packet {
> +	struct vsc_tp_packet_hdr hdr;
> +	__u8 buf[VSC_TP_MAX_XFER_SIZE - sizeof(struct vsc_tp_packet_hdr)];
>   };
>   
>   struct vsc_tp {
> @@ -158,12 +162,12 @@ static int vsc_tp_dev_xfer(struct vsc_tp *tp, void *obuf, void *ibuf, size_t len
>   static int vsc_tp_xfer_helper(struct vsc_tp *tp, struct vsc_tp_packet *pkt,
>   			      void *ibuf, u16 ilen)
>   {
> -	int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet);
> +	int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet_hdr);
>   	int next_xfer_len = VSC_TP_PACKET_SIZE(pkt) + VSC_TP_XFER_TIMEOUT_BYTES;
>   	u8 *src, *crc_src, *rx_buf = tp->rx_buf;
>   	int count_down = VSC_TP_MAX_XFER_COUNT;
>   	u32 recv_crc = 0, crc = ~0;
> -	struct vsc_tp_packet ack;
> +	struct vsc_tp_packet_hdr ack;
>   	u8 *dst = (u8 *)&ack;
>   	bool synced = false;
>   
> @@ -280,10 +284,10 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void *obuf, size_t olen,
>   
>   	guard(mutex)(&tp->mutex);
>   
> -	pkt->sync = VSC_TP_PACKET_SYNC;
> -	pkt->cmd = cmd;
> -	pkt->len = cpu_to_le16(olen);
> -	pkt->seq = cpu_to_le32(++tp->seq);
> +	pkt->hdr.sync = VSC_TP_PACKET_SYNC;
> +	pkt->hdr.cmd = cmd;
> +	pkt->hdr.len = cpu_to_le16(olen);
> +	pkt->hdr.seq = cpu_to_le32(++tp->seq);
>   	memcpy(pkt->buf, obuf, olen);
>   
>   	crc = ~crc32(~0, (u8 *)pkt, sizeof(pkt) + olen);
