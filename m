Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29C14C9F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738309146; cv=none; b=Ufc0dXb1gDdFI2LjoezC7HquzeG4urm6PGsDvrkoT4B3U2Dzc9WoINkh73B5Csuc6c0vxmc/HE9UVckDJ+hqBdMs5Cq/nIUSLCkx4DmFl72Y6aRST3J4ceIh4ygHbngzOxEDdknPmN8cRZDJSAlo6vAjneFWwGO4dM/ssmcBux0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738309146; c=relaxed/simple;
	bh=anB6fol8vgKe5NDr4vNvJ6oPf4eqFVcIgjE7uKsJKyI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JVDg0qKBJZ7XbVXU62XmrZh4Wztx9Ysn/0hcBZqjhMTkNT4DEbNIERMYYD1j4TDmMcGVHllm2+zbLvwFL5hDifBm6Yj+hF0lCm6Pr6RSTJ/keSXRo720p7pyvrNaueAV7E+mrAVOf6OlSTSjb0pArqD+C/1FwDmTGn7Vjf1/I2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a7e0d7b804so13364205ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738309144; x=1738913944;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWsFPQyEx/hAYdeHGsllq8FsZszrNdIm2/YwWGireZw=;
        b=aD4mvteWjzMFaRFyw/pX/+ebU5id8WDJWEFNOJPBtPLR2bbJCukrfJ4hB5h/emawpv
         3GJRY30shaBDVxg60v0wX7NrobJnrSVOiP8V1uCBBj4UDwlppjbS5BUEf0zpRxHN9Y9V
         iKIgmRYfeqdTjpqm9gvIS5dp7zyNdJqhJ2Q5PCs5jjdKoz4bk2ZWN72tmvbDZye3rv/i
         wZX/fCOc+f/MsWteT1q5u7J52KRrCRug9kb0rg2qQ6Zcx8rTyI2824Wm8sGhmPuaNsPt
         HW4lwd725u9QXaAAuQPp9O1BVveLVVZgZi5jJIslSo4MZgZHtrSjo15vXmSkjerdtBzh
         Jwyg==
X-Gm-Message-State: AOJu0YwCjpyZMTjWzhRjk5VptFv45FqULmRJjmf2bu79uzozEKxd7O8C
	sRs55dLhFHJ9pCsTJSORUxb//EQc0c5LzQYlAgNYX8RoSZSJcSvnRTBWXvRrvSaQ3cHoWFlwD1R
	oNDZst+lMBgvwwsW+VZZZXVKGU1v0OlZc2RNE/F+1yy+upKIC0RpEmEk=
X-Google-Smtp-Source: AGHT+IFqrVUWQ9Vfq7VeVHG5ItkglJGQZ9ZhA1lf8a9q7TThkKMmGvzPlGqfkEbEhvAuXNBcNdaqKRdmu8yLU9QUzC+oDuO8pbOy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13aa:b0:3cf:c8ff:b5e with SMTP id
 e9e14a558f8ab-3cffe38c011mr97228815ab.2.1738309143922; Thu, 30 Jan 2025
 23:39:03 -0800 (PST)
Date: Thu, 30 Jan 2025 23:39:03 -0800
In-Reply-To: <20250131071306.19555-1-n.zhandarovich@fintech.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <679c7e17.050a0220.163cdc.0003.GAE@google.com>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in usbhid_parse
From: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, n.zhandarovich@fintech.ru, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:debugfs=
_t tclass=3Ddir permissive=3D1
[   63.252248][   T29] audit: type=3D1400 audit(1738309108.737:112): avc:  =
denied  { mounton } for  pid=3D5825 comm=3D"syz-executor" path=3D"/root/syz=
kaller.4uglaD/syz-tmp/newroot/proc/sys/fs/binfmt_misc" dev=3D"proc" ino=3D4=
883 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:sysctl_f=
s_t tclass=3Ddir permissive=3D1
[   63.279716][   T29] audit: type=3D1400 audit(1738309108.737:113): avc:  =
denied  { unmount } for  pid=3D5825 comm=3D"syz-executor" scontext=3Droot:s=
ysadm_r:sysadm_t tcontext=3Dsystem_u:object_r:fs_t tclass=3Dfilesystem perm=
issive=3D1
[   63.299322][   T29] audit: type=3D1400 audit(1738309108.757:114): avc:  =
denied  { mounton } for  pid=3D5825 comm=3D"syz-executor" path=3D"/dev/bind=
erfs" dev=3D"devtmpfs" ino=3D2723 scontext=3Droot:sysadm_r:sysadm_t tcontex=
t=3Droot:object_r:device_t tclass=3Ddir permissive=3D1
[   63.322245][   T29] audit: type=3D1400 audit(1738309108.757:115): avc:  =
denied  { mount } for  pid=3D5825 comm=3D"syz-executor" name=3D"/" dev=3D"b=
inder" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t tcontext=3Dsystem_u:object=
_r:unlabeled_t tclass=3Dfilesystem permissive=3D1
[   63.345302][   T29] audit: type=3D1400 audit(1738309108.757:116): avc:  =
denied  { mounton } for  pid=3D5825 comm=3D"syz-executor" path=3D"/sys/fs/f=
use/connections" dev=3D"fusectl" ino=3D1 scontext=3Droot:sysadm_r:sysadm_t =
tcontext=3Dsystem_u:object_r:fusefs_t tclass=3Ddir permissive=3D1
[   63.349349][ T5825] soft_limit_in_bytes is deprecated and will be remove=
d. Please report your usecase to linux-mm@kvack.org if you depend on this f=
unctionality.
[   63.601832][ T5830] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   63.609917][ T5830] BUG: KASAN: slab-use-after-free in binder_add_device=
+0xa4/0xb0
[   63.617631][ T5830] Write of size 8 at addr ffff888033fc6c08 by task syz=
-executor/5830
[   63.625684][ T5830]=20
[   63.628098][ T5830] CPU: 0 UID: 0 PID: 5830 Comm: syz-executor Not taint=
ed 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
[   63.628112][ T5830] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   63.628121][ T5830] Call Trace:
[   63.628126][ T5830]  <TASK>
[   63.628134][ T5830]  dump_stack_lvl+0x116/0x1f0
[   63.628154][ T5830]  print_report+0xc3/0x620
[   63.628166][ T5830]  ? __virt_addr_valid+0x5e/0x590
[   63.628178][ T5830]  ? __phys_addr+0xc6/0x150
[   63.628188][ T5830]  kasan_report+0xd9/0x110
[   63.628198][ T5830]  ? binder_add_device+0xa4/0xb0
[   63.628212][ T5830]  ? binder_add_device+0xa4/0xb0
[   63.628226][ T5830]  binder_add_device+0xa4/0xb0
[   63.628238][ T5830]  binderfs_binder_device_create.isra.0+0x95f/0xb70
[   63.628255][ T5830]  binderfs_fill_super+0x8d6/0x1360
[   63.628271][ T5830]  ? __pfx_binderfs_fill_super+0x10/0x10
[   63.628290][ T5830]  ? shrinker_register+0x1a8/0x260
[   63.628305][ T5830]  ? sget_fc+0x808/0xc20
[   63.628320][ T5830]  ? __pfx_set_anon_super_fc+0x10/0x10
[   63.628335][ T5830]  ? __pfx_binderfs_fill_super+0x10/0x10
[   63.628349][ T5830]  get_tree_nodev+0xda/0x190
[   63.628364][ T5830]  vfs_get_tree+0x8b/0x340
[   63.628377][ T5830]  path_mount+0x14e6/0x1f10
[   63.628389][ T5830]  ? kmem_cache_free+0x2e2/0x4d0
[   63.628399][ T5830]  ? __pfx_path_mount+0x10/0x10
[   63.628410][ T5830]  ? putname+0x13c/0x180
[   63.628423][ T5830]  __x64_sys_mount+0x28f/0x310
[   63.628434][ T5830]  ? __pfx___x64_sys_mount+0x10/0x10
[   63.628446][ T5830]  do_syscall_64+0xcd/0x250
[   63.628461][ T5830]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   63.628476][ T5830] RIP: 0033:0x7f5c0fd816ba
[   63.628486][ T5830] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   63.628499][ T5830] RSP: 002b:00007ffc2db5bbc8 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   63.628510][ T5830] RAX: ffffffffffffffda RBX: 00007f5c0fdf3d49 RCX: 000=
07f5c0fd816ba
[   63.628517][ T5830] RDX: 00007f5c0fdff2fa RSI: 00007f5c0fdf3d49 RDI: 000=
07f5c0fdff2fa
[   63.628524][ T5830] RBP: 00007f5c0fdf3f58 R08: 0000000000000000 R09: 000=
00000000001ff
[   63.628531][ T5830] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f5c0fdde068
[   63.628537][ T5830] R13: 00007f5c0fdde048 R14: 0000000000000009 R15: 000=
0000000000000
[   63.628546][ T5830]  </TASK>
[   63.628550][ T5830]=20
[   63.855639][ T5830] Allocated by task 5825:
[   63.859939][ T5830]  kasan_save_stack+0x33/0x60
[   63.864593][ T5830]  kasan_save_track+0x14/0x30
[   63.869241][ T5830]  __kasan_kmalloc+0xaa/0xb0
[   63.873802][ T5830]  binderfs_binder_device_create.isra.0+0x17a/0xb70
[   63.880372][ T5830]  binderfs_fill_super+0x8d6/0x1360
[   63.885551][ T5830]  get_tree_nodev+0xda/0x190
[   63.890132][ T5830]  vfs_get_tree+0x8b/0x340
[   63.894529][ T5830]  path_mount+0x14e6/0x1f10
[   63.899013][ T5830]  __x64_sys_mount+0x28f/0x310
[   63.903753][ T5830]  do_syscall_64+0xcd/0x250
[   63.908236][ T5830]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   63.914106][ T5830]=20
[   63.916406][ T5830] Freed by task 5825:
[   63.920358][ T5830]  kasan_save_stack+0x33/0x60
[   63.925013][ T5830]  kasan_save_track+0x14/0x30
[   63.929663][ T5830]  kasan_save_free_info+0x3b/0x60
[   63.934667][ T5830]  __kasan_slab_free+0x51/0x70
[   63.939409][ T5830]  kfree+0x2c4/0x4d0
[   63.943291][ T5830]  binderfs_evict_inode+0x1e0/0x250
[   63.948494][ T5830]  evict+0x409/0x960
[   63.952454][ T5830]  iput+0x52a/0x890
[   63.956240][ T5830]  dentry_unlink_inode+0x29c/0x480
[   63.961341][ T5830]  __dentry_kill+0x1d0/0x600
[   63.965923][ T5830]  shrink_dentry_list+0x140/0x5d0
[   63.970955][ T5830]  shrink_dcache_parent+0xe2/0x530
[   63.976049][ T5830]  shrink_dcache_for_umount+0xa1/0x3e0
[   63.981488][ T5830]  generic_shutdown_super+0x6c/0x390
[   63.986757][ T5830]  kill_litter_super+0x70/0xa0
[   63.991514][ T5830]  binderfs_kill_super+0x3b/0xa0
[   63.996437][ T5830]  deactivate_locked_super+0xbe/0x1a0
[   64.001818][ T5830]  deactivate_super+0xde/0x100
[   64.006607][ T5830]  cleanup_mnt+0x222/0x450
[   64.011006][ T5830]  task_work_run+0x14e/0x250
[   64.015574][ T5830]  do_exit+0xad8/0x2d70
[   64.019705][ T5830]  do_group_exit+0xd3/0x2a0
[   64.024189][ T5830]  get_signal+0x24ed/0x26c0
[   64.028671][ T5830]  arch_do_signal_or_restart+0x90/0x7e0
[   64.034189][ T5830]  syscall_exit_to_user_mode+0x150/0x2a0
[   64.039798][ T5830]  do_syscall_64+0xda/0x250
[   64.044368][ T5830]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   64.050240][ T5830]=20
[   64.052537][ T5830] The buggy address belongs to the object at ffff88803=
3fc6c00
[   64.052537][ T5830]  which belongs to the cache kmalloc-512 of size 512
[   64.066582][ T5830] The buggy address is located 8 bytes inside of
[   64.066582][ T5830]  freed 512-byte region [ffff888033fc6c00, ffff888033=
fc6e00)
[   64.080181][ T5830]=20
[   64.082483][ T5830] The buggy address belongs to the physical page:
[   64.088873][ T5830] page: refcount:0 mapcount:0 mapping:0000000000000000=
 index:0x0 pfn:0x33fc4
[   64.097612][ T5830] head: order:2 mapcount:0 entire_mapcount:0 nr_pages_=
mapped:0 pincount:0
[   64.106608][ T5830] flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastc=
pupid=3D0x7ff)
[   64.114131][ T5830] page_type: f5(slab)
[   64.118088][ T5830] raw: 00fff00000000040 ffff88801b041c80 ffffea0000d64=
600 dead000000000002
[   64.126660][ T5830] raw: 0000000000000000 0000000000100010 00000000f5000=
000 0000000000000000
[   64.135218][ T5830] head: 00fff00000000040 ffff88801b041c80 ffffea0000d6=
4600 dead000000000002
[   64.143878][ T5830] head: 0000000000000000 0000000000100010 00000000f500=
0000 0000000000000000
[   64.152610][ T5830] head: 00fff00000000002 ffffea0000cff101 ffffffffffff=
ffff 0000000000000000
[   64.161253][ T5830] head: 0000000000000004 0000000000000000 00000000ffff=
ffff 0000000000000000
[   64.169911][ T5830] page dumped because: kasan: bad access detected
[   64.176303][ T5830] page_owner tracks the page as allocated
[   64.182001][ T5830] page last allocated via order 2, migratetype Unmovab=
le, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COM=
P|__GFP_NOMEMALLOC), pid 5204, tgid 5204 (udevd), ts 19812150758, free_ts 1=
9804332293
[   64.202759][ T5830]  post_alloc_hook+0x181/0x1b0
[   64.207510][ T5830]  get_page_from_freelist+0xfce/0x2f80
[   64.212945][ T5830]  __alloc_frozen_pages_noprof+0x221/0x2470
[   64.218837][ T5830]  alloc_pages_mpol+0x1fc/0x540
[   64.223678][ T5830]  new_slab+0x23d/0x330
[   64.227813][ T5830]  ___slab_alloc+0xc5d/0x1720
[   64.232469][ T5830]  __slab_alloc.constprop.0+0x56/0xb0
[   64.237817][ T5830]  __kmalloc_cache_noprof+0xfa/0x410
[   64.243092][ T5830]  kernfs_fop_open+0x28b/0xdb0
[   64.247841][ T5830]  do_dentry_open+0x735/0x1c40
[   64.252589][ T5830]  vfs_open+0x82/0x3f0
[   64.256632][ T5830]  path_openat+0x1e88/0x2d80
[   64.261192][ T5830]  do_filp_open+0x20c/0x470
[   64.265666][ T5830]  do_sys_openat2+0x17a/0x1e0
[   64.270318][ T5830]  __x64_sys_openat+0x175/0x210
[   64.275142][ T5830]  do_syscall_64+0xcd/0x250
[   64.279635][ T5830] page last free pid 5198 tgid 5198 stack trace:
[   64.285933][ T5830]  free_frozen_pages+0x6db/0xfb0
[   64.290843][ T5830]  qlist_free_all+0x4e/0x120
[   64.295415][ T5830]  kasan_quarantine_reduce+0x195/0x1e0
[   64.300872][ T5830]  __kasan_slab_alloc+0x69/0x90
[   64.305697][ T5830]  __kmalloc_node_noprof+0x1d0/0x510
[   64.310962][ T5830]  __kvmalloc_node_noprof+0xad/0x1a0
[   64.316225][ T5830]  seq_read_iter+0x82a/0x12b0
[   64.320886][ T5830]  kernfs_fop_read_iter+0x414/0x580
[   64.326074][ T5830]  vfs_read+0x886/0xbf0
[   64.330216][ T5830]  ksys_read+0x12b/0x250
[   64.334453][ T5830]  do_syscall_64+0xcd/0x250
[   64.338943][ T5830]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   64.344831][ T5830]=20
[   64.347142][ T5830] Memory state around the buggy address:
[   64.352755][ T5830]  ffff888033fc6b00: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   64.360791][ T5830]  ffff888033fc6b80: fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc fc fc
[   64.368826][ T5830] >ffff888033fc6c00: fa fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   64.376859][ T5830]                       ^
[   64.381176][ T5830]  ffff888033fc6c80: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   64.389211][ T5830]  ffff888033fc6d00: fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb
[   64.397245][ T5830] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   64.407234][ T5830] Kernel panic - not syncing: KASAN: panic_on_warn set=
 ...
[   64.414448][ T5830] CPU: 0 UID: 0 PID: 5830 Comm: syz-executor Not taint=
ed 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
[   64.424947][ T5830] Hardware name: Google Google Compute Engine/Google C=
ompute Engine, BIOS Google 12/27/2024
[   64.434979][ T5830] Call Trace:
[   64.438234][ T5830]  <TASK>
[   64.441141][ T5830]  dump_stack_lvl+0x3d/0x1f0
[   64.445803][ T5830]  panic+0x71d/0x800
[   64.449679][ T5830]  ? __pfx_panic+0x10/0x10
[   64.454073][ T5830]  ? irqentry_exit+0x3b/0x90
[   64.458641][ T5830]  ? lockdep_hardirqs_on+0x7c/0x110
[   64.463817][ T5830]  ? preempt_schedule_thunk+0x1a/0x30
[   64.469166][ T5830]  ? preempt_schedule_common+0x44/0xc0
[   64.474602][ T5830]  ? check_panic_on_warn+0x1f/0xb0
[   64.479709][ T5830]  check_panic_on_warn+0xab/0xb0
[   64.484639][ T5830]  end_report+0x117/0x180
[   64.488943][ T5830]  kasan_report+0xe9/0x110
[   64.493336][ T5830]  ? binder_add_device+0xa4/0xb0
[   64.498264][ T5830]  ? binder_add_device+0xa4/0xb0
[   64.503177][ T5830]  binder_add_device+0xa4/0xb0
[   64.507917][ T5830]  binderfs_binder_device_create.isra.0+0x95f/0xb70
[   64.514492][ T5830]  binderfs_fill_super+0x8d6/0x1360
[   64.519674][ T5830]  ? __pfx_binderfs_fill_super+0x10/0x10
[   64.525314][ T5830]  ? shrinker_register+0x1a8/0x260
[   64.530418][ T5830]  ? sget_fc+0x808/0xc20
[   64.534643][ T5830]  ? __pfx_set_anon_super_fc+0x10/0x10
[   64.540095][ T5830]  ? __pfx_binderfs_fill_super+0x10/0x10
[   64.545718][ T5830]  get_tree_nodev+0xda/0x190
[   64.550288][ T5830]  vfs_get_tree+0x8b/0x340
[   64.554683][ T5830]  path_mount+0x14e6/0x1f10
[   64.559166][ T5830]  ? kmem_cache_free+0x2e2/0x4d0
[   64.564081][ T5830]  ? __pfx_path_mount+0x10/0x10
[   64.568905][ T5830]  ? putname+0x13c/0x180
[   64.573125][ T5830]  __x64_sys_mount+0x28f/0x310
[   64.577872][ T5830]  ? __pfx___x64_sys_mount+0x10/0x10
[   64.583142][ T5830]  do_syscall_64+0xcd/0x250
[   64.587624][ T5830]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   64.593497][ T5830] RIP: 0033:0x7f5c0fd816ba
[   64.597888][ T5830] Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1=
a 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0=
f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
[   64.617482][ T5830] RSP: 002b:00007ffc2db5bbc8 EFLAGS: 00000246 ORIG_RAX=
: 00000000000000a5
[   64.625976][ T5830] RAX: ffffffffffffffda RBX: 00007f5c0fdf3d49 RCX: 000=
07f5c0fd816ba
[   64.633954][ T5830] RDX: 00007f5c0fdff2fa RSI: 00007f5c0fdf3d49 RDI: 000=
07f5c0fdff2fa
[   64.641918][ T5830] RBP: 00007f5c0fdf3f58 R08: 0000000000000000 R09: 000=
00000000001ff
[   64.649864][ T5830] R10: 0000000000000000 R11: 0000000000000246 R12: 000=
07f5c0fdde068
[   64.657812][ T5830] R13: 00007f5c0fdde048 R14: 0000000000000009 R15: 000=
0000000000000
[   64.665767][ T5830]  </TASK>
[   64.668899][ T5830] Kernel Offset: disabled
[   64.673206][ T5830] Rebooting in 86400 seconds..


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
GOMODCACHE=3D'/syzkaller/jobs-2/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs-2/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_amd64'
GOVCS=3D''
GOVERSION=3D'go1.22.7'
GCCGO=3D'gccgo'
GOAMD64=3D'v1'
AR=3D'ar'
CC=3D'gcc'
CXX=3D'g++'
CGO_ENABLED=3D'1'
GOMOD=3D'/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.=
mod'
GOWORK=3D''
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
PKG_CONFIG=3D'pkg-config'
GOGCCFLAGS=3D'-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=3D0=
 -ffile-prefix-map=3D/tmp/go-build2275386146=3D/tmp/go-build -gno-record-gc=
c-switches'

git status (err=3D<nil>)
HEAD detached at b50eb251af
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
go fmt ./sys/... >/dev/null
touch .descriptions
GOOS=3Dlinux GOARCH=3Damd64 go build "-ldflags=3D-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Db50eb251af3b122fb1b2c574dde0c3d16f6a8cfd -X '=
github.com/google/syzkaller/prog.gitRevisionDate=3D20241203-163055'" "-tags=
=3Dsyz_target syz_os_linux syz_arch_amd64 " -o ./bin/linux_amd64/syz-execpr=
og github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_amd64
g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wfr=
ame-larger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-forma=
t-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -=
static-pie -std=3Dc++17 -I. -Iexecutor/_include -fpermissive -w -DGOOS_linu=
x=3D1 -DGOARCH_amd64=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"b50eb251af3b122fb1b2c574dde0c3d16f=
6a8cfd\"
/usr/bin/ld: /tmp/ccVVKqYN.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applicat=
ions requires at runtime the shared libraries from the glibc version used f=
or linking


Error text is too large and was truncated, full error text is at:
https://syzkaller.appspot.com/x/error.txt?x=3D14b5e5f8580000


Tested on:

commit:         69e858e0 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd1d4677fc8e4506=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc52569baf0c843f35=
495
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40

Note: no patches were applied.
