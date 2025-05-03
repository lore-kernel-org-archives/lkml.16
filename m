Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381341E51E7
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746270667; cv=none; b=tnHh+L94UrQHdYrQLqLX9tVkORBvZomNMdnD4+7ys0+3yBhd0aBIB2IrZ9dwNVQcVBJaSJ9NMXnhW8GwBmETawKybbCwlza3SdsDKe8x0zXVmN++xr7swFHu9/XAfkYJPEAQqANwaJUf9/TnvAvgXlcWnvlrQa0blXa/HBeFiNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746270667; c=relaxed/simple;
	bh=Ohm4EX9WW8lsaYKGqRawPQMv8dGNS1eAL9Di3qauiMw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aj70cPo7CV7bfDK1ckbysVg8/9FgiCnZDsyM0eYJLxplkjGQt8UnetUn5o3bc2w1NzpqwkuJKlnSteFjKR+EBZEh2gcvrEE0hTJoKhUZvtYsu2RjcgsW4ry5CegJrDX94t9ozH14b9I2XXEHiw+GWx88xXb1J6qQPdht7sTUFzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85b3888569bso273926039f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746270663; x=1746875463;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFnUYSNbrEw9knsQeKQlTPLMgEPfdfa6aqnomOS1iLg=;
        b=V2OVlX5QZ8yuimcCMHStINRFcktX4KOuFaOEkZwbrp1Gk/JM9BejrLWPl4glVUGKbV
         OC8+wSH+qSYqnmrZ2O53+Vg/WgNo7uPNgPhDZe6M1cEmz/k1WqqHB+Zw07BfMqAPFUTS
         y0YFageQK7VyzjSzgP/m1/F09GmoZzrq7xH8ayh8nnA2W9SqjGvdKPuR/6PFCh3d36aJ
         /G9uCZKeifqZHoAULHAjpoccDxKIb7Cw8KjfIKGmHSKy7gLm17HxLvRmL4C8ELN5ewkv
         U4rbMkhoGYIuvMMPoeajHdzdnnNMUQeIvgsdo0/qT2qaM3FvVWEfbdeC0ojJeQloo9tN
         CnSw==
X-Forwarded-Encrypted: i=1; AJvYcCWxl48mHN6hMD0HSBpkvGiJgDN1HAUw1oXY36a53zeJdL133HJVxz0VTkPaXl6HQeyse3A8qfqStdQHIDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33feqmFda/8TY/ajOa/Axq1rQB4GJy7xfEFjAVXVlWxftUJXH
	wYmwiMEZPDnQ3U4f8RQDgtdhIzt6DmjP82rLUqCl9hKwGtrPpsp0lkwL+bt2jBmda+zDQTDLqRT
	CWRfVhtFO+A5y3XCx7sAdODiSFEmvrehdyUVi2H0O0NdblOSygkjSY1w=
X-Google-Smtp-Source: AGHT+IE1tqoNBKvRGTpgW5ttndbh/65NW3Xcf8+wxw21OiM0c+Rb9ED87djMVduLScJ2mkDRFMr97SQKbkCuSEapzvz6IDLAbKwi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:9e0d:0:b0:85e:73da:c56a with SMTP id
 ca18e2360f4ac-864a3d2789amr996007739f.3.1746270663246; Sat, 03 May 2025
 04:11:03 -0700 (PDT)
Date: Sat, 03 May 2025 04:11:03 -0700
In-Reply-To: <20250503102133.1547-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6815f9c7.a70a0220.254cdc.0019.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad page state in page_cache_ra_order
From: syzbot <syzbot+7b3842775c9ce6b69efc@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

EXEC (disabled)
[   22.481730][    T1] evm: security.SMACK64TRANSMUTE (disabled)
[   22.485666][    T1] evm: security.SMACK64MMAP (disabled)
[   22.489224][    T1] evm: security.apparmor (disabled)
[   22.492684][    T1] evm: security.ima
[   22.495141][    T1] evm: security.capability
[   22.498056][    T1] evm: HMAC attrs: 0x1
[   22.504042][    T1] PM:   Magic number: 9:345:23
[   22.507301][    T1] video4linux vbi43: hash matches
[   22.510770][    T1] gadget gadget.32: hash matches
[   22.515003][    T1] printk: legacy console [netcon0] enabled
[   22.518877][    T1] netconsole: network logging started
[   22.523237][    T1] gtp: GTP module loaded (pdp ctx size 128 bytes)
[   22.532220][    T1] rdma_rxe: loaded
[   22.536188][    T1] cfg80211: Loading compiled-in X.509 certificates for=
 regulatory database
[   22.544732][    T1] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   22.550553][    T1] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06=
c7248db18c600'
[   22.557101][  T838] platform regulatory.0: Direct firmware load for regu=
latory.db failed with error -2
[   22.563921][    T1] clk: Disabling unused clocks
[   22.563938][  T838] platform regulatory.0: Falling back to sysfs fallbac=
k for: regulatory.db
[   22.567256][    T1] ALSA device list:
[   22.575868][    T1]   #0: Dummy 1
[   22.578140][    T1]   #1: Loopback 1
[   22.580682][    T1]   #2: Virtual MIDI Card 1
[   22.587838][    T1] md: Waiting for all devices to be available before a=
utodetect
[   22.590848][    T1] md: If you don't use raid, use raid=3Dnoautodetect
[   22.593626][    T1] md: Autodetecting RAID arrays.
[   22.595734][    T1] md: autorun ...
[   22.597177][    T1] md: ... autorun DONE.
[   22.638506][    T1] EXT4-fs (sda1): mounted filesystem b4773fba-1738-4da=
0-8a90-0fe043d0a496 ro with ordered data mode. Quota mode: none.
[   22.644832][    T1] VFS: Mounted root (ext4 filesystem) readonly on devi=
ce 8:1.
[   22.650043][    T1] devtmpfs: mounted
[   22.741058][    T1] Freeing unused kernel image (initmem) memory: 27132K
[   22.744578][    T1] Write protecting the kernel read-only data: 212992k
[   22.768906][    T1] Freeing unused kernel image (text/rodata gap) memory=
: 1000K
[   22.779726][    T1] Freeing unused kernel image (rodata/data gap) memory=
: 1336K
[   22.935360][    T1] x86/mm: Checked W+X mappings: passed, no W+X pages f=
ound.
[   22.944857][    T1] Failed to set sysctl parameter 'max_rcu_stall_to_pan=
ic=3D1': parameter not found
[   22.949433][    T1] Run /sbin/init as init process
[   22.969151][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   22.972476][    T1] BUG: KASAN: user-memory-access in lru_add+0x192/0xd7=
0
[   22.975136][    T1] Read of size 8 at addr 00000000320bb7c0 by task init=
/1
[   22.977923][    T1]=20
[   22.978936][    T1] CPU: 2 UID: 0 PID: 1 Comm: init Not tainted 6.15.0-r=
c4-syzkaller-g95d3481af6dc-dirty #0 PREEMPT(full)=20
[   22.978958][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[   22.978968][    T1] Call Trace:
[   22.978975][    T1]  <TASK>
[   22.978982][    T1]  dump_stack_lvl+0x116/0x1f0
[   22.979046][    T1]  kasan_report+0xe0/0x110
[   22.979061][    T1]  ? lru_add+0x192/0xd70
[   22.979078][    T1]  kasan_check_range+0xef/0x1a0
[   22.979097][    T1]  lru_add+0x192/0xd70
[   22.979114][    T1]  folio_batch_move_lru+0x112/0x3b0
[   22.979131][    T1]  ? __pfx_lru_add+0x10/0x10
[   22.979148][    T1]  ? __pfx_folio_batch_move_lru+0x10/0x10
[   22.979165][    T1]  ? __pfx___filemap_add_folio+0x10/0x10
[   22.979186][    T1]  __folio_batch_add_and_move+0x369/0xc90
[   22.979225][    T1]  ? __pfx_lru_add+0x10/0x10
[   22.979240][    T1]  ? const_folio_flags+0x5b/0x100
[   22.979257][    T1]  filemap_add_folio+0x1bb/0x220
[   22.979274][    T1]  ? __pfx_filemap_add_folio+0x10/0x10
[   22.979292][    T1]  ? page_cache_ra_unbounded+0x3fb/0x750
[   22.979309][    T1]  page_cache_ra_unbounded+0x305/0x750
[   22.979328][    T1]  page_cache_ra_order+0x961/0xcb0
[   22.979348][    T1]  page_cache_async_ra+0x5cb/0x8a0
[   22.979365][    T1]  filemap_readahead.isra.0+0x11c/0x190
[   22.979390][    T1]  ? __pfx_filemap_readahead.isra.0+0x10/0x10
[   22.979425][    T1]  filemap_get_pages+0x2c1/0x1c20
[   22.979444][    T1]  ? __lock_acquire+0x5ca/0x1ba0
[   22.979469][    T1]  ? __pfx_filemap_get_pages+0x10/0x10
[   22.979488][    T1]  ? atime_needs_update+0x8b/0x710
[   22.979508][    T1]  ? __pfx___might_resched+0x10/0x10
[   22.979531][    T1]  filemap_read+0x3d2/0xe90
[   22.979552][    T1]  ? __pfx_filemap_read+0x10/0x10
[   22.979576][    T1]  ? _raw_spin_unlock_irqrestore+0x3b/0x80
[   22.979593][    T1]  ? stack_depot_save_flags+0x3e6/0xa50
[   22.979616][    T1]  generic_file_read_iter+0x344/0x450
[   22.979634][    T1]  ? kasan_save_stack+0x33/0x60
[   22.979657][    T1]  ? kasan_save_track+0x14/0x30
[   22.979680][    T1]  ext4_file_read_iter+0x1d6/0x6a0
[   22.979705][    T1]  __kernel_read+0x3f0/0xb60
[   22.979728][    T1]  ? __pfx___kernel_read+0x10/0x10
[   22.979755][    T1]  integrity_kernel_read+0x7e/0xb0
[   22.979773][    T1]  ? __pfx_integrity_kernel_read+0x10/0x10
[   22.979790][    T1]  ? __local_bh_enable_ip+0xa4/0x120
[   22.979809][    T1]  ? kernel_fpu_end+0x5e/0x70
[   22.979827][    T1]  ? _sha256_update+0xc8/0xf0
[   22.979846][    T1]  ima_calc_file_hash_tfm+0x2c7/0x3d0
[   22.979868][    T1]  ? __pfx_ima_calc_file_hash_tfm+0x10/0x10
[   22.979899][    T1]  ? ext4_getattr+0x33d/0x8b0
[   22.979923][    T1]  ? ima_alloc_tfm+0x21a/0x2e0
[   22.979943][    T1]  ? ext4_file_getattr+0x25f/0x380
[   22.979958][    T1]  ima_calc_file_hash+0x1ba/0x490
[   22.979981][    T1]  ima_collect_measurement+0x897/0xa40
[   22.980006][    T1]  ? __pfx_ima_collect_measurement+0x10/0x10
[   22.980030][    T1]  ? __pfx___up_read+0x10/0x10
[   22.980049][    T1]  ? __pfx_ext4_xattr_get+0x10/0x10
[   22.980070][    T1]  ? xattr_resolve_name+0x27b/0x3f0
[   22.980094][    T1]  ? vfs_getxattr_alloc+0xec/0x340
[   22.980119][    T1]  ? ima_get_hash_algo+0x27c/0x400
[   22.980137][    T1]  ? __pfx_ima_get_hash_algo+0x10/0x10
[   22.980157][    T1]  ? process_measurement+0x11fa/0x23e0
[   22.980175][    T1]  process_measurement+0x11fa/0x23e0
[   22.980196][    T1]  ? avc_has_perm_noaudit+0x149/0x3b0
[   22.980211][    T1]  ? __pfx_process_measurement+0x10/0x10
[   22.980233][    T1]  ? __pfx_avc_has_perm+0x10/0x10
[   22.980246][    T1]  ? avc_has_perm+0x11a/0x1c0
[   22.980260][    T1]  ? __pfx_avc_has_perm+0x10/0x10
[   22.980284][    T1]  ? file_map_prot_check+0x1eb/0x360
[   22.980301][    T1]  ima_file_mmap+0x1a8/0x1d0
[   22.980321][    T1]  ? __pfx_ima_file_mmap+0x10/0x10
[   22.980342][    T1]  security_mmap_file+0x88c/0x990
[   22.980365][    T1]  vm_mmap_pgoff+0xec/0x450
[   22.980384][    T1]  ? __pfx_vm_mmap_pgoff+0x10/0x10
[   22.980406][    T1]  vm_mmap+0x8e/0xc0
[   22.980429][    T1]  elf_load+0x19a/0x890
[   22.980457][    T1]  load_elf_binary+0x35e7/0x4f80
[   22.980491][    T1]  ? __pfx_load_elf_binary+0x10/0x10
[   22.980514][    T1]  ? find_held_lock+0x2b/0x80
[   22.980531][    T1]  ? bprm_execve+0x8a2/0x1650
[   22.980554][    T1]  bprm_execve+0x8c0/0x1650
[   22.980577][    T1]  ? __pfx_bprm_execve+0x10/0x10
[   22.980598][    T1]  ? copy_strings_kernel+0x153/0x190
[   22.980620][    T1]  kernel_execve+0x2ef/0x3b0
[   22.980640][    T1]  ? __pfx_kernel_init+0x10/0x10
[   22.980664][    T1]  kernel_init+0x14a/0x2b0
[   22.980685][    T1]  ? __pfx_kernel_init+0x10/0x10
[   22.980706][    T1]  ret_from_fork+0x45/0x80
[   22.980720][    T1]  ? __pfx_kernel_init+0x10/0x10
[   22.980741][    T1]  ret_from_fork_asm+0x1a/0x30
[   22.980768][    T1]  </TASK>
[   22.980774][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   23.168879][    T1] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   23.171855][    T1] CPU: 2 UID: 0 PID: 1 Comm: init Not tainted 6.15.0-r=
c4-syzkaller-g95d3481af6dc-dirty #0 PREEMPT(full)=20
[   23.176379][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
[   23.180688][    T1] Call Trace:
[   23.182122][    T1]  <TASK>
[   23.183403][    T1]  dump_stack_lvl+0x3d/0x1f0
[   23.185409][    T1]  panic+0x71c/0x800
[   23.187090][    T1]  ? __pfx_panic+0x10/0x10
[   23.188969][    T1]  ? __pfx__printk+0x10/0x10
[   23.190938][    T1]  ? end_report+0x4c/0x170
[   23.192832][    T1]  ? check_panic_on_warn+0x1f/0xb0
[   23.194953][    T1]  ? lru_add+0x192/0xd70
[   23.196745][    T1]  check_panic_on_warn+0xab/0xb0
[   23.198798][    T1]  end_report+0x107/0x170
[   23.200620][    T1]  kasan_report+0xee/0x110
[   23.202514][    T1]  ? lru_add+0x192/0xd70
[   23.204296][    T1]  kasan_check_range+0xef/0x1a0
[   23.206317][    T1]  lru_add+0x192/0xd70
[   23.208019][    T1]  folio_batch_move_lru+0x112/0x3b0
[   23.210132][    T1]  ? __pfx_lru_add+0x10/0x10
[   23.212067][    T1]  ? __pfx_folio_batch_move_lru+0x10/0x10
[   23.214409][    T1]  ? __pfx___filemap_add_folio+0x10/0x10
[   23.216747][    T1]  __folio_batch_add_and_move+0x369/0xc90
[   23.219103][    T1]  ? __pfx_lru_add+0x10/0x10
[   23.221059][    T1]  ? const_folio_flags+0x5b/0x100
[   23.223259][    T1]  filemap_add_folio+0x1bb/0x220
[   23.225339][    T1]  ? __pfx_filemap_add_folio+0x10/0x10
[   23.227645][    T1]  ? page_cache_ra_unbounded+0x3fb/0x750
[   23.229983][    T1]  page_cache_ra_unbounded+0x305/0x750
[   23.232345][    T1]  page_cache_ra_order+0x961/0xcb0
[   23.234487][    T1]  page_cache_async_ra+0x5cb/0x8a0
[   23.236650][    T1]  filemap_readahead.isra.0+0x11c/0x190
[   23.238986][    T1]  ? __pfx_filemap_readahead.isra.0+0x10/0x10
[   23.241621][    T1]  filemap_get_pages+0x2c1/0x1c20
[   23.243762][    T1]  ? __lock_acquire+0x5ca/0x1ba0
[   23.245838][    T1]  ? __pfx_filemap_get_pages+0x10/0x10
[   23.248105][    T1]  ? atime_needs_update+0x8b/0x710
[   23.250285][    T1]  ? __pfx___might_resched+0x10/0x10
[   23.252510][    T1]  filemap_read+0x3d2/0xe90
[   23.254388][    T1]  ? __pfx_filemap_read+0x10/0x10
[   23.256516][    T1]  ? _raw_spin_unlock_irqrestore+0x3b/0x80
[   23.258926][    T1]  ? stack_depot_save_flags+0x3e6/0xa50
[   23.261292][    T1]  generic_file_read_iter+0x344/0x450
[   23.263521][    T1]  ? kasan_save_stack+0x33/0x60
[   23.265545][    T1]  ? kasan_save_track+0x14/0x30
[   23.267568][    T1]  ext4_file_read_iter+0x1d6/0x6a0
[   23.269722][    T1]  __kernel_read+0x3f0/0xb60
[   23.271661][    T1]  ? __pfx___kernel_read+0x10/0x10
[   23.273820][    T1]  integrity_kernel_read+0x7e/0xb0
[   23.275991][    T1]  ? __pfx_integrity_kernel_read+0x10/0x10
[   23.278446][    T1]  ? __local_bh_enable_ip+0xa4/0x120
[   23.280677][    T1]  ? kernel_fpu_end+0x5e/0x70
[   23.282652][    T1]  ? _sha256_update+0xc8/0xf0
[   23.284695][    T1]  ima_calc_file_hash_tfm+0x2c7/0x3d0
[   23.286936][    T1]  ? __pfx_ima_calc_file_hash_tfm+0x10/0x10
[   23.289425][    T1]  ? ext4_getattr+0x33d/0x8b0
[   23.291389][    T1]  ? ima_alloc_tfm+0x21a/0x2e0
[   23.293368][    T1]  ? ext4_file_getattr+0x25f/0x380
[   23.295493][    T1]  ima_calc_file_hash+0x1ba/0x490
[   23.297597][    T1]  ima_collect_measurement+0x897/0xa40
[   23.299865][    T1]  ? __pfx_ima_collect_measurement+0x10/0x10
[   23.302357][    T1]  ? __pfx___up_read+0x10/0x10
[   23.304358][    T1]  ? __pfx_ext4_xattr_get+0x10/0x10
[   23.306502][    T1]  ? xattr_resolve_name+0x27b/0x3f0
[   23.308664][    T1]  ? vfs_getxattr_alloc+0xec/0x340
[   23.310837][    T1]  ? ima_get_hash_algo+0x27c/0x400
[   23.312976][    T1]  ? __pfx_ima_get_hash_algo+0x10/0x10
[   23.315246][    T1]  ? process_measurement+0x11fa/0x23e0
[   23.317504][    T1]  process_measurement+0x11fa/0x23e0
[   23.319690][    T1]  ? avc_has_perm_noaudit+0x149/0x3b0
[   23.321944][    T1]  ? __pfx_process_measurement+0x10/0x10
[   23.324293][    T1]  ? __pfx_avc_has_perm+0x10/0x10
[   23.326158][    T1]  ? avc_has_perm+0x11a/0x1c0
[   23.327938][    T1]  ? __pfx_avc_has_perm+0x10/0x10
[   23.330041][    T1]  ? file_map_prot_check+0x1eb/0x360
[   23.332243][    T1]  ima_file_mmap+0x1a8/0x1d0
[   23.334106][    T1]  ? __pfx_ima_file_mmap+0x10/0x10
[   23.336153][    T1]  security_mmap_file+0x88c/0x990
[   23.338258][    T1]  vm_mmap_pgoff+0xec/0x450
[   23.340181][    T1]  ? __pfx_vm_mmap_pgoff+0x10/0x10
[   23.342347][    T1]  vm_mmap+0x8e/0xc0
[   23.343995][    T1]  elf_load+0x19a/0x890
[   23.345725][    T1]  load_elf_binary+0x35e7/0x4f80
[   23.347891][    T1]  ? __pfx_load_elf_binary+0x10/0x10
[   23.350128][    T1]  ? find_held_lock+0x2b/0x80
[   23.352067][    T1]  ? bprm_execve+0x8a2/0x1650
[   23.354013][    T1]  bprm_execve+0x8c0/0x1650
[   23.355923][    T1]  ? __pfx_bprm_execve+0x10/0x10
[   23.357981][    T1]  ? copy_strings_kernel+0x153/0x190
[   23.360182][    T1]  kernel_execve+0x2ef/0x3b0
[   23.362124][    T1]  ? __pfx_kernel_init+0x10/0x10
[   23.364188][    T1]  kernel_init+0x14a/0x2b0
[   23.366047][    T1]  ? __pfx_kernel_init+0x10/0x10
[   23.368110][    T1]  ret_from_fork+0x45/0x80
[   23.369970][    T1]  ? __pfx_kernel_init+0x10/0x10
[   23.372037][    T1]  ret_from_fork_asm+0x1a/0x30
[   23.374051][    T1]  </TASK>
[   23.376076][    T1] Kernel Offset: disabled
[   23.377924][    T1] Rebooting in 86400 seconds..


syzkaller build log:
go env (err=3D<nil>)
GO111MODULE=3D'auto'
GOARCH=3D'amd64'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFLAGS=3D''
GOHOSTARCH=3D'amd64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-=
go1.23.7.linux-amd64'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/syzkaller/jobs/linux/gopath/pkg/mod/golang.org/toolchain@v0.0=
.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.23.7'
GODEBUG=3D''
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build3760460994=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at c6b4fb399
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sy=
s/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dc6b4fb399236b655a39701fd51c33522caa06811 -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20250425-123509'" -o ./b=
in/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH=
_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"c6b4fb399236b655a39701fd51c33522ca=
a06811\"
/usr/bin/ld: /tmp/ccqfTbRm.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D160920f4580000


Tested on:

commit:         95d3481a Merge tag 'spi-fix-v6.15-rc4' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dca17f2d2ba38f7a=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D7b3842775c9ce6b69=
efc
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D160e20f45800=
00

