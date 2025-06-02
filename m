Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777422DF92
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873816; cv=none; b=ALIhuZXTbbi96W5KX9k0ex6mQumVWXiVciZNfv/V+QSgKTcaUgSkoiRU6ATbClxAcG3NIwiHpjuba53t0Y5soL+IQMyd3+q+3sIuvmotfxCrwa6pSvLOkWv7YZsZWfJypRdTeiGDxjF2LHgtdaWE3GNNzRSSaZF8bc8XinRyvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873816; c=relaxed/simple;
	bh=iC/SEeyz6BKexaitCntBVFd/dRp6eAZT4ijYfE545FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHfl/pITJBdvoZsqcxPY47x2M+S1xSrSBbCFz9rXQ5/9azNQr77UEtE//TwTY3SD4RHjAwAEBeuge5Tn+n/+7H8CGkiqnmUsrtpkn7783th2VZWxIPUJwqxP2iG+kmz9/tiQl5DSBNLK0XFYZA1dGaz/rsSBYmc9qoyIZQB70sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w5F2+/Ew; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w5F2+/Ew"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo769851cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748873813; x=1749478613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4e944oS5ojsq9HML27nJLAnlFPd9We9E2LvWxmWj7Y=;
        b=w5F2+/EwmtBjWBPgzbBVMXwhgPSS6lGUe9VN5RjrArg5kwtTF1plbc+7OSPjd5PEw7
         dZ62+BFvBWNXRWZt4A14mwsdUqlb0j62dhMWz8ujJNaTL3X6UiB8oJCc9f6Mv1moa3R9
         dZVuYeY+TKDF2pkap3OO3ygKDB548mHCBEIO8074ACYTmMmtnGVJszmAPfpxCa8Ew3zN
         +ddgcx0rO49jmJAytlx+y2rodkSCmQmOL5gKP1/pjqAh/IeaqeJdu6JpGM9uzWe0pMhx
         bLkLWZJN0tqRH739NeYG3sHnLmOizSyD6wdYc8TCwvF9GLe6CUsMonaNZ8kRXYVn47hM
         g9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748873813; x=1749478613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4e944oS5ojsq9HML27nJLAnlFPd9We9E2LvWxmWj7Y=;
        b=gbobTatJcptmp5xHFLlp0KyfcEqT946uthKe4jsbqke9fm4gOSBQq4MoONliCtGfYd
         9wqdcdq0m46cFZ8whwYQ1khdsNvTmVfiUfUyViojttq4N9YFrTDJJuotdNphVlebbrjl
         G1TWQiAqTJzPK0+/RSN9wP0nzCXJaLGebH86D2o+wazVxAbaeeEr2LM9kkPuU/R+l3AN
         ihbtV2dCorlWDrY7rRNMI35spAsVhpE7JlfFCDdx2yflisw6AEZMuyHTrovSBVxug/w/
         aa8/BLXNYKbeQjGWxbLHdVgDp9S0AP1+vjoFwfa7VNbNPtRNJ/OYqHO93UsZtCFs7wM7
         AmCg==
X-Forwarded-Encrypted: i=1; AJvYcCU9qkNBBcDLjQgjh0voZbOGVQAhKVQtX7YH4AIk+xmkhIkT+feGcbRYjeAiG5nFhl4sSxRsteOYAWQ7eLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IeR/KYHXzsNQq61SydiG15kln0vPr5MQxXi0xkL8vU3w8G0S
	ZAqAW4aDkzaSC6o2uaYI5jUof9lwJSgs6uzeftx9Z1kYb36QzxrpnSEbhRhg1ywd+ieMXRdh8NE
	p6vEFGtTJ9GKtfFanscPsjIyrW4AUmlpwGeaV5H2p
X-Gm-Gg: ASbGncsu9VUUpdrZU5bgrN5qgqao13cNkPbAM6u0imdBaRKgLR2JDx4hSK0+gR8+ySG
	W6I11znSOQCdCWymIqlJ31eFEcFx7J6hLFF9mKJfQg0WrvR7MU/KKIfR6DK3D0HspYudRrie4Ia
	7U7HqNrtkZlneEoEX14pNnXwY7ETUHffPpzHKMabt0lw==
X-Google-Smtp-Source: AGHT+IGbl1F1cUH6nf9BBcpiFNRpZn2CU1ifUqPcjIHOYvYUa+dtrSo9uTKSI/Oz01SwGaVcaNI4aWN7E+J/35DmyW4=
X-Received: by 2002:ac8:5449:0:b0:4a4:fdf7:becc with SMTP id
 d75a77b69052e-4a4fdf7c587mr4663101cf.6.1748873812462; Mon, 02 Jun 2025
 07:16:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com> <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
In-Reply-To: <04c893fe-0498-4847-a525-9efb6d9306da@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Jun 2025 07:16:40 -0700
X-Gm-Features: AX0GCFvCzpb_LBo38VATBiHJhS7E7Wie17mpY3JOUcdHmQFdgBPhOLbdrUaddNg
Message-ID: <CAJuCfpGRaP2H8S6ZEr4PmxktL1tVdGM-18QyQ_N54S=RwE5tvA@mail.gmail.com>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>, 
	Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:04=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Suren
>
> Suren - could you take a look at this please?

Sure. I'll take a look today or tomorrow once I sort out my email
backlog. I was away for 10 days and have 2K emails to go through.

>
> I can't for the life of me figure out why this implies a deadlock, there'=
s
> a might_fault() on the drm stuff, it's kind of sketchy they managed to ge=
t
> that to trigger (maybe short window between mmap_read_lock() and
> mmap_write_lock() in exit_mmap()?) immediately before free page table
> teardown.
>
> I don't think __vma_start_write() can possibly block no? So the alleged
> 'trying to acquire lock' bit should always succeed, even if
> dev->mode_config.idr_mutex is held in another thread waiting to be able t=
o
> possibly fault.
>
> I mean it's a screwy situation in _general_ but maybe we need to tweak th=
e
> lockdep here? Or maybe I'm missing something... :)
>
> Thanks!
>
> On Thu, May 29, 2025 at 08:40:27AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kern=
elci
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/lin=
ux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12bbdad4580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D89c13de706f=
bf07a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D23de6daeb7124=
1d36a18
> > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07=
757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > userspace arch: arm64
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/d=
isk-d7fa1af5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmli=
nux-d7fa1af5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e=
/Image-d7fa1af5.gz.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com
> >
> > SQUASHFS error: zstd decompression failed, data probably corrupt
> > SQUASHFS error: Failed to read block 0x60: -5
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > WARNING: possible circular locking dependency detected
> > 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 Not tainted
> > ------------------------------------------------------
> > syz.1.261/8150 is trying to acquire lock:
> > ffff0000d7ffcbc8 (vm_lock){++++}-{0:0}, at: __vma_start_write+0x34/0x15=
8 mm/memory.c:6497
>
> We're execve'ing the process, so we call exit_mmap() which eventually cal=
ls
> free_pgtables() to tear down the VMA in question in free_pgtables().
>
> In doing so, we write-lock the VMA:
>
>                 /*
>                  * Hide vma from rmap and truncate_pagecache before freei=
ng
>                  * pgtables
>                  */
>                 if (mm_wr_locked)
>                         vma_start_write(vma);
>
> >
> > but task is already holding lock:
> > ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock incl=
ude/linux/mmap_lock.h:128 [inline]
>
> Presumably refers to the __might_fault() case.
>
> > ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbe=
c mm/mmap.c:1292
>
> This is the mmap write lock we hold to be able to hold the VMA write lock
> on page table tear down.
>
> >
> > which lock already depends on the new lock.
> >
> >
> > the existing dependency chain (in reverse order) is:
> >
> > -> #6 (&mm->mmap_lock){++++}-{4:4}:
> >        __might_fault+0xc4/0x124 mm/memory.c:7151
>
> This invokes:
>
>         if (current->mm)
>                 might_lock_read(&current->mm->mmap_lock);
>
> That indicates we might try to acquire a read lock on the mmap lock.
>
> I guess since RCU-obtained VMA read locks fall back to mmap read locks th=
is is
> valid.
>
> This invokes might_lock_read() which triggers the lockdep report (we will=
 need
> to obtain the mmap read or VMA lock to fault, neither or which we can do =
because
> we hold the write lock).
>
> >        drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c=
:673
>
>
> This holds the dev->mode_config.idr_mutex lock...
>
> Seems like an ioctl to get lease state but we invoke put_user() on each o=
bject:
>
>                 if (count_objects > count) {
>                         drm_dbg_lease(dev, "adding object %d\n", object);
>                         ret =3D put_user(object, object_ids + count);
>                         if (ret)
>                                 break;
>                 }
>
> And put_user() -> __put_user() -> __put_user_error() invokes might_fault(=
).
>
>
> >        drm_ioctl_kernel+0x238/0x310 drivers/gpu/drm/drm_ioctl.c:796
> >        drm_ioctl+0x65c/0xa5c drivers/gpu/drm/drm_ioctl.c:893
> >        vfs_ioctl fs/ioctl.c:51 [inline]
> >        __do_sys_ioctl fs/ioctl.c:906 [inline]
> >        __se_sys_ioctl fs/ioctl.c:892 [inline]
> >        __arm64_sys_ioctl+0x14c/0x1c4 fs/ioctl.c:892
> >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> >        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
> >        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c=
:786
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > -> #5 (&dev->mode_config.idr_mutex){+.+.}-{4:4}:
> >        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
> >        __mutex_lock kernel/locking/mutex.c:746 [inline]
> >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
> >        __drm_mode_object_add+0xa8/0x1f0 drivers/gpu/drm/drm_mode_object=
.c:47
> >        drm_framebuffer_init+0x14c/0x2bc drivers/gpu/drm/drm_framebuffer=
.c:875
> >        drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 =
[inline]
> >        drm_gem_fb_init_with_funcs+0xa60/0xda4 drivers/gpu/drm/drm_gem_f=
ramebuffer_helper.c:202
> >        drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer=
_helper.c:245 [inline]
> >        drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_=
helper.c:286
> >        drm_internal_framebuffer_create+0xfcc/0x19dc drivers/gpu/drm/drm=
_framebuffer.c:304
> >        drm_mode_addfb2+0xac/0x2a0 drivers/gpu/drm/drm_framebuffer.c:338
> >        drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:386 [inline=
]
> >        drm_client_framebuffer_create+0x2d0/0x55c drivers/gpu/drm/drm_cl=
ient.c:428
> >        drm_fbdev_shmem_driver_fbdev_probe+0x180/0x70c drivers/gpu/drm/d=
rm_fbdev_shmem.c:151
> >        drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:16=
49 [inline]
> >        __drm_fb_helper_initial_config_and_unlock+0xf94/0x159c drivers/g=
pu/drm/drm_fb_helper.c:1829
> >        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_he=
lper.c:1916
> >        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm=
_fbdev_client.c:52
> >        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
> >        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_f=
bdev_client.c:159
> >        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_s=
etup.c:39
> >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
> >        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
> >        do_one_initcall+0x250/0x990 init/main.c:1257
> >        do_initcall_level+0x154/0x214 init/main.c:1319
> >        do_initcalls+0x84/0xf4 init/main.c:1335
> >        do_basic_setup+0x8c/0xa0 init/main.c:1354
> >        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
> >        kernel_init+0x24/0x1dc init/main.c:1457
> >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
> >
> > -> #4 (&helper->lock){+.+.}-{4:4}:
> >        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
> >        __mutex_lock kernel/locking/mutex.c:746 [inline]
> >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
> >        __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/g=
pu/drm/drm_fb_helper.c:228
> >        drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c=
:1359
> >        fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
> >        visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
> >        do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
> >        do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
> >        do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:5=
48
> >        do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
> >        fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c=
:3009
> >        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [in=
line]
> >        register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.=
c:515
> >        __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/=
gpu/drm/drm_fb_helper.c:1851
> >        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_he=
lper.c:1916
> >        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm=
_fbdev_client.c:52
> >        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
> >        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_f=
bdev_client.c:159
> >        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_s=
etup.c:39
> >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
> >        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
> >        do_one_initcall+0x250/0x990 init/main.c:1257
> >        do_initcall_level+0x154/0x214 init/main.c:1319
> >        do_initcalls+0x84/0xf4 init/main.c:1335
> >        do_basic_setup+0x8c/0xa0 init/main.c:1354
> >        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
> >        kernel_init+0x24/0x1dc init/main.c:1457
> >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
> >
> > -> #3 (console_lock){+.+.}-{0:0}:
> >        console_lock+0x194/0x1ec kernel/printk/printk.c:2849
> >        __bch2_print_string_as_lines fs/bcachefs/util.c:267 [inline]
> >        bch2_print_string_as_lines+0x34/0x150 fs/bcachefs/util.c:286
> >        bucket_ref_update_err+0x1c8/0x21c fs/bcachefs/buckets.c:417
> >        bch2_bucket_ref_update+0x3d8/0x888 fs/bcachefs/buckets.c:-1
> >        __mark_pointer fs/bcachefs/buckets.c:572 [inline]
> >        bch2_trigger_pointer fs/bcachefs/buckets.c:618 [inline]
> >        __trigger_extent+0xd90/0x35fc fs/bcachefs/buckets.c:763
> >        bch2_trigger_extent+0x3e4/0x78c fs/bcachefs/buckets.c:881
> >        run_one_trans_trigger fs/bcachefs/btree_trans_commit.c:-1 [inlin=
e]
> >        bch2_trans_commit_run_triggers fs/bcachefs/btree_trans_commit.c:=
550 [inline]
> >        __bch2_trans_commit+0x7e8/0x62d0 fs/bcachefs/btree_trans_commit.=
c:990
> >        bch2_trans_commit fs/bcachefs/btree_update.h:195 [inline]
> >        bch2_extent_update+0x2d8/0x7e8 fs/bcachefs/io_write.c:353
> >        bch2_write_index_default fs/bcachefs/io_write.c:401 [inline]
> >        __bch2_write_index+0x570/0xfec fs/bcachefs/io_write.c:591
> >        bch2_write_data_inline fs/bcachefs/io_write.c:1630 [inline]
> >        bch2_write+0xacc/0x112c fs/bcachefs/io_write.c:1698
> >        closure_queue include/linux/closure.h:270 [inline]
> >        closure_call include/linux/closure.h:432 [inline]
> >        bch2_writepage_do_io fs/bcachefs/fs-io-buffered.c:494 [inline]
> >        bch2_writepages+0x1fc/0x2cc fs/bcachefs/fs-io-buffered.c:677
> >        do_writepages+0x2c0/0x6a8 mm/page-writeback.c:2656
> >        filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
> >        __filemap_fdatawrite_range mm/filemap.c:419 [inline]
> >        filemap_write_and_wait_range+0x1ac/0x29c mm/filemap.c:691
> >        bchfs_truncate+0x574/0xa70 fs/bcachefs/fs-io.c:-1
> >        bch2_setattr+0x198/0x20c fs/bcachefs/fs.c:1245
> >        notify_change+0x9a4/0xc50 fs/attr.c:552
> >        do_truncate+0x178/0x1f0 fs/open.c:65
> >        vfs_truncate+0x398/0x444 fs/open.c:115
> >        do_sys_truncate+0xe4/0x1a8 fs/open.c:138
> >        __do_sys_truncate fs/open.c:150 [inline]
> >        __se_sys_truncate fs/open.c:148 [inline]
> >        __arm64_sys_truncate+0x5c/0x74 fs/open.c:148
> >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> >        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
> >        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c=
:786
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > -> #2 (bcachefs_btree){+.+.}-{0:0}:
> >        trans_set_locked+0x94/0x200 fs/bcachefs/btree_locking.h:198
> >        bch2_trans_begin+0x6f8/0xa40 fs/bcachefs/btree_iter.c:3288
> >        bch2_read_err_msg_trans+0x64/0x298 fs/bcachefs/io_read.c:346
> >        __bch2_read_extent+0x21fc/0x3694 fs/bcachefs/io_read.c:975
> >        bch2_read_extent fs/bcachefs/io_read.h:140 [inline]
> >        bchfs_read+0x1178/0x17dc fs/bcachefs/fs-io-buffered.c:226
> >        bch2_readahead+0xa18/0xd88 fs/bcachefs/fs-io-buffered.c:316
> >        read_pages+0x13c/0x4c8 mm/readahead.c:160
> >        page_cache_ra_order+0x7b8/0xb34 mm/readahead.c:515
> >        do_sync_mmap_readahead+0x2f0/0x660 mm/filemap.c:-1
> >        filemap_fault+0x600/0x1278 mm/filemap.c:3403
> >        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
> >        __do_fault+0xf8/0x498 mm/memory.c:5098
> >        do_read_fault mm/memory.c:5518 [inline]
> >        do_fault mm/memory.c:5652 [inline]
> >        do_pte_missing mm/memory.c:4160 [inline]
> >        handle_pte_fault mm/memory.c:5997 [inline]
> >        __handle_mm_fault mm/memory.c:6140 [inline]
> >        handle_mm_fault+0x2cb0/0x4d18 mm/memory.c:6309
> >        faultin_page mm/gup.c:1193 [inline]
> >        __get_user_pages+0x1dd4/0x30d8 mm/gup.c:1491
> >        populate_vma_page_range+0x218/0x2e8 mm/gup.c:1929
> >        __mm_populate+0x208/0x330 mm/gup.c:2032
> >        mm_populate include/linux/mm.h:3487 [inline]
> >        vm_mmap_pgoff+0x378/0x43c mm/util.c:584
> >        ksys_mmap_pgoff+0x394/0x5b8 mm/mmap.c:607
> >        __do_sys_mmap arch/arm64/kernel/sys.c:28 [inline]
> >        __se_sys_mmap arch/arm64/kernel/sys.c:21 [inline]
> >        __arm64_sys_mmap+0xf8/0x110 arch/arm64/kernel/sys.c:21
> >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> >        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
> >        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c=
:786
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > -> #1 (mapping.invalidate_lock#4){.+.+}-{4:4}:
> >        down_read+0x58/0x2f8 kernel/locking/rwsem.c:1524
> >        filemap_invalidate_lock_shared include/linux/fs.h:922 [inline]
> >        filemap_fault+0x564/0x1278 mm/filemap.c:3391
> >        bch2_page_fault+0x2cc/0x700 fs/bcachefs/fs-io-pagecache.c:594
> >        __do_fault+0xf8/0x498 mm/memory.c:5098
> >        do_shared_fault mm/memory.c:5582 [inline]
> >        do_fault mm/memory.c:5656 [inline]
> >        do_pte_missing mm/memory.c:4160 [inline]
> >        handle_pte_fault mm/memory.c:5997 [inline]
> >        __handle_mm_fault mm/memory.c:6140 [inline]
> >        handle_mm_fault+0x1a08/0x4d18 mm/memory.c:6309
> >        do_page_fault+0x428/0x1554 arch/arm64/mm/fault.c:647
> >        do_translation_fault+0xc4/0x114 arch/arm64/mm/fault.c:783
> >        do_mem_abort+0x70/0x194 arch/arm64/mm/fault.c:919
> >        el0_da+0x64/0x160 arch/arm64/kernel/entry-common.c:627
> >        el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c=
:789
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > -> #0 (vm_lock){++++}-{0:0}:
> >        check_prev_add kernel/locking/lockdep.c:3166 [inline]
> >        check_prevs_add kernel/locking/lockdep.c:3285 [inline]
> >        validate_chain kernel/locking/lockdep.c:3909 [inline]
> >        __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
> >        lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
> >        __vma_enter_locked+0x184/0x354 mm/memory.c:6473
> >        __vma_start_write+0x34/0x158 mm/memory.c:6497
> >        vma_start_write include/linux/mm.h:829 [inline]
> >        free_pgtables+0x1e0/0x63c mm/memory.c:369
> >        exit_mmap+0x394/0xbec mm/mmap.c:1295
> >        __mmput+0xec/0x3dc kernel/fork.c:1380
> >        mmput+0x70/0xac kernel/fork.c:1402
> >        free_bprm+0x11c/0x398 fs/exec.c:1493
> >        do_execveat_common+0x6b8/0x834 fs/exec.c:1970
> >        do_execveat fs/exec.c:2053 [inline]
> >        __do_sys_execveat fs/exec.c:2127 [inline]
> >        __se_sys_execveat fs/exec.c:2121 [inline]
> >        __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
> >        __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >        invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> >        el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> >        do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> >        el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
> >        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c=
:786
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > other info that might help us debug this:
> >
> > Chain exists of:
> >   vm_lock --> &dev->mode_config.idr_mutex --> &mm->mmap_lock
> >
> >  Possible unsafe locking scenario:
> >
> >        CPU0                    CPU1
> >        ----                    ----
> >   lock(&mm->mmap_lock);
> >                                lock(&dev->mode_config.idr_mutex);
> >                                lock(&mm->mmap_lock);
> >   lock(vm_lock);
>
> Yeah I don't see it... CPU1 might try to do a read lock, wait, while CPU0
> holds an mmap write lock and acquires a VMA write lock, I don't see how i=
t
> could be unsuccessful. Then CPU1 could carry on (possibly disasterously
> under the circumstances but still...)
>
> >
> >  *** DEADLOCK ***
> >
> > 2 locks held by syz.1.261/8150:
> >  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: prepare=
_bprm_creds fs/exec.c:1469 [inline]
> >  #0: ffff0000d0fee3d0 (&sig->cred_guard_mutex){+.+.}-{4:4}, at: bprm_ex=
ecve+0xa8/0x10dc fs/exec.c:1842
> >  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock=
 include/linux/mmap_lock.h:128 [inline]
> >  #1: ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200=
/0xbec mm/mmap.c:1292
> >
> > stack backtrace:
> > CPU: 1 UID: 0 PID: 8150 Comm: syz.1.261 Not tainted 6.15.0-rc7-syzkalle=
r-gd7fa1af5b33e #0 PREEMPT
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 02/12/2025
> > Call trace:
> >  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
> >  __dump_stack+0x30/0x40 lib/dump_stack.c:94
> >  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
> >  dump_stack+0x1c/0x28 lib/dump_stack.c:129
> >  print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2079
> >  check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2211
> >  check_prev_add kernel/locking/lockdep.c:3166 [inline]
> >  check_prevs_add kernel/locking/lockdep.c:3285 [inline]
> >  validate_chain kernel/locking/lockdep.c:3909 [inline]
> >  __lock_acquire+0x1728/0x3058 kernel/locking/lockdep.c:5235
> >  lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5866
> >  __vma_enter_locked+0x184/0x354 mm/memory.c:6473
> >  __vma_start_write+0x34/0x158 mm/memory.c:6497
> >  vma_start_write include/linux/mm.h:829 [inline]
> >  free_pgtables+0x1e0/0x63c mm/memory.c:369
> >  exit_mmap+0x394/0xbec mm/mmap.c:1295
> >  __mmput+0xec/0x3dc kernel/fork.c:1380
> >  mmput+0x70/0xac kernel/fork.c:1402
> >  free_bprm+0x11c/0x398 fs/exec.c:1493
> >  do_execveat_common+0x6b8/0x834 fs/exec.c:1970
> >  do_execveat fs/exec.c:2053 [inline]
> >  __do_sys_execveat fs/exec.c:2127 [inline]
> >  __se_sys_execveat fs/exec.c:2121 [inline]
> >  __arm64_sys_execveat+0xd0/0xec fs/exec.c:2121
> >  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
> >  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
> >  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
> >  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
> >  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
> >  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
> >  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> >
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> >
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> >
> > If you want to undo deduplication, reply with:
> > #syz undup
