Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEEF2BE7A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151291; cv=none; b=CrLQht4SScwoyN44NmsLriNVJMqF4vRgW0ec0PlIGMT/b6Dw+BQOY/pWSI7hixjjGfaztKU/X+00Zn3A2roziiosgVeymALV03xDbtwvZ2jyjz3UJQxBwfVcdlh2oLPvrHy/U/mcmUoV7L3WRuxX5oHUzabmfrVZ+zOROkJj7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151291; c=relaxed/simple;
	bh=F++oKdlleNkqIzAyMkX2ficnHvCzzNPCUl+jvu3Ym3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPxM0/RaF0WPAuOpT3gVHQawxxwT3eSJDDzUpOI3yAhT6jvoj0tzHnf79YS+oPlLRNRfJkMgARuB0XHqbH/rxh9s6f4+H3W31MKSJ0SGjM8LCRnj13/+FlzLdoHfuxqaeCPOoGORUXgNCTRUTR8Z5N5xembUub580aR/kwxeunE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HFthmLFP; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HFthmLFP"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47666573242so404581cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747151289; x=1747756089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2wylvLG9Yiv6fQtmkfrtl0YoNU9Q/NZC3Did8qduYE=;
        b=HFthmLFPyCwEZhgnNIKsTu0h75uOyu/tioKz7XlnWQBGHheI1/zSYPhD+bK781UaMf
         hzQ0AUY64iFEmGOLk2+3HA/gREq3J1SRSjCvlvE8zBSC25nBR1Mz++05vkacRNf6/ROm
         7FWXf8jzo8gleYNEeVfHWCZAIbPmzIWlPEiB+k4CYD8Bs4PaQ6cXtkCxQ7z7rP7SsQaY
         Ol6lmS91bRVCLLnduDT9dyriJP+zaoVNMJp/sT8/wqhaHmv0eOGOu+KMh0odGucDg3Po
         8m4zg9Nv03iT7KafcKdeQwZv3txn3XNJ35NKp1SOXu5U4s+HxF2+fAjpRRoF3Mikqu5A
         SCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151289; x=1747756089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2wylvLG9Yiv6fQtmkfrtl0YoNU9Q/NZC3Did8qduYE=;
        b=CGp2yS1mZeOSF9r98hug2q4WJLmt0Q+ULfU1/UGz9NHtzSlWxEWM+1sM+8/YASTHCg
         kbEwIi/+Qm3Vhf8OgaUEpJr+CZt3LEvDQldEI+bMA0D+zCyHHLEoKZ0PTZZDcRla/8zr
         XrX+GM0b6hZlhsQfCIvQPx38M3aXGc44m/ujPs1NLaZZalqhujdu9Ol6Bg5f8/bawnGT
         eYLFIVcF/CSHSnIrjoOucIfpablitK84vAX0FrXLFcI3RVBfg6cioLLKkp5AoekwSjn7
         t6KGCocLlsKapGEvs+MxAR3WastBZlhDEkB8LMv6blLU/fIfVz8QPdnsjylxuVmlNp1S
         nZHw==
X-Forwarded-Encrypted: i=1; AJvYcCWPcasFNQzblPRwCCuYqa5bzA7ONTW9ccae0GzYceHgYts4gh0Eq9A6jfbNTAR2Yiy6DW5TmdhEE2IhF5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZl1gf8r+kASC+gAXq9DXN5cgP19+qzByntkYI+lxvUFQL051
	W0zryn+snfbIV9OQE/ZJclYbFZp0Px2rLU19h83ycVAhLYETzvUUCJVTMGlJZY8ItzO1Pf5qDYf
	xJA+Qk1Hy03wU1MxpEE8WQtXCuhRHAEeDqkv8eUuf
X-Gm-Gg: ASbGncvty1OiVQ3MkWn8P/DDdbHQG+05nzzX9Tw4ThwcHA2ZitqWm6lpoxZjRbR7XhQ
	6O1o6oZAqPJY413kr4pgc7If0lbYE0le0GtYhZPXBXO3vL5NYAHfTXWtroVmylqW2cTBlXetfRB
	QxmZoD0RQVwbin1D/L8DgOxn8CODY42loO3fSbd+sNW5R+EDxyMtBTeEl6OQ9U
X-Google-Smtp-Source: AGHT+IH8DMTILSvUJoMpGb18mZ8byfPhh+/ztyC7r2/4+jBrcA5yV1p/g99cmuYDsGVIgLwAQ/QHAzoIZ7A5XPCW53E=
X-Received: by 2002:ac8:7f4c:0:b0:48a:1291:d7df with SMTP id
 d75a77b69052e-4948802ac85mr4207271cf.12.1747151288360; Tue, 13 May 2025
 08:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513140126.4fc4de8b@yea> <aCNFHVG_l2Pfs8Gs@harry>
In-Reply-To: <aCNFHVG_l2Pfs8Gs@harry>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 May 2025 08:47:57 -0700
X-Gm-Features: AX0GCFvTIDtqi4IAmnqzZ7bYUIfFhIBu2DkFl4AaYAVeH7cIJLJGLjOSAS6O6hQ
Message-ID: <CAJuCfpGbk+xKskvhCkc79uUJhoG1UsLfD2WsPmWMcHDxxrJKQw@mail.gmail.com>
Subject: Re: prepare_slab_obj_exts_hook, zs_handle-zram2: Failed to create
 slab extension vector! (v6.12.28, amd64)
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 6:12=E2=80=AFAM Harry Yoo <harry.yoo@oracle.com> wr=
ote:
>
> On Tue, May 13, 2025 at 02:01:26PM +0200, Erhard Furtner wrote:
> > Greetings!
> >
> > Got that during building on my Thinkpad T495 on following zram disk:
> > NAME       ALGORITHM DISKSIZE   DATA COMPR TOTAL STREAMS MOUNTPOINT
> > /dev/zram2 lz4            32G 138.7M 16.1M 41.2M       8 /var/tmp
> >
> > [...]
> > ------------[ cut here ]------------
> > prepare_slab_obj_exts_hook, zs_handle-zram2: Failed to create slab exte=
nsion vector!
> > WARNING: CPU: 6 PID: 17975 at mm/slub.c:2076 prepare_slab_obj_exts_hook=
+0x152/0x190
>
> Hi, thanks for the report!
>
> I think there is not much the kernel can do when it failed to allocate
> the slab extension vector. Memory allocations can fail under pressure.
>
> In this case, the memory is not accounted by memory cgroup or memory
> allocation profiling subsystems.
>
> But it's not the end of world and I think this is not a bug.
>
> Maybe WARN() is too much here?

Yeah, perhaps pr_warn() is more appropriate. Having a call stack
serves no purpose here IMO. If others agree I'll add that to my TODO
list.

>
> > Modules linked in: cifs dns_resolver cifs_arc4 nls_ucs2_utils cifs_md4 =
snd_hrtimer snd_seq snd_seq_device rfcomm fuse zram lz4_decompress lz4_comp=
ress af_packet ccm algif_aead crypto_null des3_ede_x86_64 cbc des_generic l=
ibdes md5 cmac bnep nls_iso8859_15 nls_cp437 vfat fat dm_crypt nhpoly1305_a=
vx2 nhpoly1305 chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 =
algif_skcipher dm_mod btusb btrtl btmtk think_lmi btbcm btintel joydev edac=
_mce_amd wmi_bmof firmware_attributes_class snd_ctl_led bluetooth amdgpu in=
put_leds evdev iwlmvm snd_hda_codec_realtek thinkpad_acpi mfd_core snd_hda_=
codec_generic mac80211 snd_hda_scodec_component drm_buddy libarc4 kvm_amd p=
kcs8_key_parser nvram drm_suballoc_helper platform_profile acpi_cpufreq spa=
rse_keymap snd_hda_codec_hdmi led_class drm_exec battery k10temp i2c_algo_b=
it video snd_hda_intel ac drm_display_helper snd_intel_dspcfg iwlwifi snd_h=
da_codec backlight snd_hwdep gpu_sched snd_hda_core amdxcp snd_pcm drm_ttm_=
helper i2c_scmi snd_timer ttm cfg80211 wmi snd
> >  soundcore hwmon rfkill button processor efivarfs hid_generic usbhid hi=
d sha512_ssse3 sha256_ssse3 sha1_ssse3 xhci_pci sha1_generic ehci_pci aesni=
_intel xhci_hcd ehci_hcd gf128mul crypto_simd cryptd ccp usbcore ucsi_acpi =
typec_ucsi roles typec usb_common
> > CPU: 6 UID: 0 PID: 17975 Comm: kworker/u32:11 Not tainted 6.12.28-gento=
o-Zen1 #1
> > Hardware name: LENOVO 20NKS2PE00/20NKS2PE00, BIOS R12ET64W(1.34 ) 02/23=
/2024
> > Workqueue: writeback wb_workfn (flush-252:2)
> > RIP: 0010:prepare_slab_obj_exts_hook+0x152/0x190
> > Code: 31 f6 e9 51 49 75 00 cc 48 ff ca 48 89 d0 e9 3b ff ff ff 49 8b 56=
 58 48 c7 c7 c9 6f ea a0 48 c7 c6 d2 1b f4 a0 e8 46 7c e4 ff <0f> 0b e9 c8 =
fe ff ff 48 89 c1 48 c1 e1 34 0f 85 10 ff ff ff 48 f7
> > RSP: 0018:ffffaa7728fb33a0 EFLAGS: 00010246
> > RAX: 0000000000000000 RBX: ffff99a3e8ec67c8 RCX: 0000000000000000
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > RBP: 0000000000002800 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000000 R12: ffff99a3e8ec67c8
> > R13: ffffffffa029dbe8 R14: ffff99a490b5b800 R15: ffffe7c681a3b180
> > FS:  0000000000000000(0000) GS:ffff99a76fd00000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f288f146000 CR3: 0000000104f8f000 CR4: 00000000003506f0
> > Call Trace:
> >  <TASK>
> >  kmem_cache_alloc_noprof+0x141/0x278
> >  zs_malloc+0x50/0x1e8
> >  zram_submit_bio+0x1b9/0x898 [zram]
> >  __submit_bio+0x122/0x1a0
> >  submit_bio_noacct_nocheck+0x19b/0x2d8
> >  ext4_io_submit+0x23/0x38
> >  ext4_bio_write_folio+0x313/0x348
> >  mpage_submit_folio+0x63/0x90
> >  mpage_process_page_bufs+0x10a/0x160
> >  mpage_prepare_extent_to_map+0x2fb/0x410
> >  ext4_do_writepages+0x2bc/0xaf0
> >  ? zram_submit_bio+0x81f/0x898 [zram]
> >  ? srso_return_thunk+0x5/0x5f
> >  ? xas_load+0x9/0xf8
> >  ? srso_return_thunk+0x5/0x5f
> >  ? filemap_get_entry+0x160/0x178
> >  ? srso_return_thunk+0x5/0x5f
> >  ? __filemap_get_folio+0x22a/0x2b8
> >  ? srso_return_thunk+0x5/0x5f
> >  ? srso_return_thunk+0x5/0x5f
> >  ? __find_get_block+0x262/0x2a8
> >  ext4_writepages+0x91/0x148
> >  do_writepages+0xe3/0x2a8
> >  ? srso_return_thunk+0x5/0x5f
> >  ? __ext4_get_inode_loc_noinmem+0x22/0x70
> >  ? srso_return_thunk+0x5/0x5f
> >  ? ext4_write_inode+0x115/0x148
> >  __writeback_single_inode+0x2c/0x180
> >  writeback_sb_inodes+0x223/0x430
> >  __writeback_inodes_wb+0x59/0xf0
> >  wb_writeback+0x117/0x1a0
> >  wb_workfn+0x230/0x318
> >  process_scheduled_works+0x215/0x380
> >  worker_thread+0x1bf/0x288
> >  ? __cfi_worker_thread+0x8/0x8
> >  kthread+0xf4/0x118
> >  ? __cfi_kthread+0x8/0x8
> >  ret_from_fork+0x48/0x58
> >  ? __cfi_kthread+0x8/0x8
> >  ret_from_fork_asm+0x11/0x20
> >  </TASK>
> > ---[ end trace 0000000000000000 ]---
> >
> >
> > Apart from that the machine kept running. So far that also occured once=
 only.
> >
> > Kernel .config and full dmesg attached.
> >
> > Regards,
> > Erhard
>
> --
> Cheers,
> Harry / Hyeonggon
