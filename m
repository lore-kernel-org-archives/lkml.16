Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701971FC0E6
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116411; cv=none; b=HK0W+xZzJRCZiw4R1kd5rvyz6PZHv/V3NSPIqDbE38BMNwzkbZyRJBDCYOlhmoSdrOnRMlc3NXJQby44M4NOHZuxOOVcXibcFxgTQPxWo+fxAynOFzNiFzPF2YD4cADttKtzUH+UwFKUsYDeVohV26Vz//48LjMxdnrE4D2xtGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116411; c=relaxed/simple;
	bh=37Arqy2BHs5dHLnhyh0SXncpjqTWtndVJ9WbNjPGYF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9j6xgwTJnKjwO8C0SzK/XYPeQHQg95xhdlOk/A4lTyV0EtYqZs1iZlrPXpWfHiWFhQNmT20lNXYM/Hc4NRJcUph9AngC2tC9YT0cQWv0lKtM1KaJrpweohrO13Rsr9kjTSulaoWC52w/O48XpVk9Oh3lK2m4x9QH24eI9h0LZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H9x+QY3Y; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H9x+QY3Y"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb39c45b4eso122959166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749116407; x=1749721207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KM55FHiiGw0ty5Vw0ggnMJ0P//GMDx7Mh10xK2QVjHM=;
        b=H9x+QY3YfVmQGs9Xx2InOZ01IZxaSoF1D6pdSfsKU7Vm6x+xyzd02AuFuCGEGJcbUB
         X1eI2NKqe0VTmlNNn9Rp8Eqay+0ZqUP1ILsFINLTYKGKGffGEc4pQUHH3KcBGV6c7AZD
         lYP55RueSwd9SPUesC5fdgjEeH7ITtUJDCv4cK+LtNZbBiaTE9oKsdif0web6wMksi1A
         +ujhh6nT1t/4NIlWW/gIi2fCiuheFaT0HswPlqcm5v+dFG2XgznO2GdhkeON053LLPm5
         7DysuvLp8VZrmn8w/MxMGTEES0QX/VTURtO84tZw0P9JA2/cLJ+iVePZAPIV+E6Mzj9j
         pnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116407; x=1749721207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM55FHiiGw0ty5Vw0ggnMJ0P//GMDx7Mh10xK2QVjHM=;
        b=IuKDqG6Sb37X9LxkPkDXKf1I/6Dy2aHo2ec/mjUGxoxzOQE3pCUNE+j8mfETfR6PdU
         JZ6Dum2lPOZKuReu3WzGlSeqB/zEqXGEH1itVW2OV7N6rFCzlgJVDyvTiYTmQMJQpLDB
         NO6LyyftZMookz6aEDPKqqah3dax3Tw+nPyJd9DwlGFzCQhVISwVNQOkgZO5InEMBrhe
         RuPpYWMBOiJmMz6XJobE2+2S+g8AR/kx+SCOyWKSRNtG15N690butidSIa1aXoMJMCcr
         ZiMwr8qXYRZbtrkEnc30VnIdfPb9GvpZA+rZmU+5EwqHaydjB+/yiLim0IER0HINJa86
         6y2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUsVk/6dWdrdPU22x5PASlcq/pcbV0UCBVTH14NpHlvmA58hZLw+rJnU2dZs2EiEaob5dE1eUO+KquKE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtSjGY+z2VRtDawcO3jx3rkhPI7w2Vptmj6oiGzbsneFYCkxP
	mb9JYf74hvPxBHAlrdbuiITmcUh/UoAlFGnSWp+QQyUhNvxCE7R9lzSEUfQTw0L7tUI=
X-Gm-Gg: ASbGncsJivnhFZMv3AAtYXL/UKUVgwRGicp2OTPiKc2dFOZaBLpgnJKVIkuulnSYqG+
	YIIGna1ob4VHfIvwfJhtkiXLyCA9qmH97rHFCufyrKcHroWWgmacw3oZUDlTIm6VbIUHGzbzlqz
	sKmDSCKxHv5QRLGcji/P9Pu7zsPXYf68R6qO59PbgAUc3+6/MQccwVICRLgDVayjDAHe5oHpOcz
	2E4BExswswT27Cvdv5zqweHMyFIFlOXRxgAAcF6M29hM6EFbHNgOLAhtEXPKmOHi9mmQhylw0p+
	zqlerOfJjzzoNs3b/AEaJtXbA55ST7fX/ieJstEjHqez8bNSBteVZQ==
X-Google-Smtp-Source: AGHT+IEXAjvH2zAlv9GtYKAcrlRuefB5G0wPoME06kubs8x8USrSVlKV/uqYoLN1zCBBu1d/yvPWvA==
X-Received: by 2002:a17:907:d644:b0:ad2:2fe3:7074 with SMTP id a640c23a62f3a-addf8c87b91mr542476566b.14.1749116406549;
        Thu, 05 Jun 2025 02:40:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d773sm1243900166b.61.2025.06.05.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 02:40:06 -0700 (PDT)
Date: Thu, 5 Jun 2025 11:40:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
	Liam.Howlett@oracle.com, akpm@linux-foundation.org,
	jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, pfalcato@suse.de,
	syzkaller-bugs@googlegroups.com,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
Message-ID: <aEFl9FWQHEJqnl2Q@pathway.suse.cz>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
 <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>

On Wed 2025-06-04 09:52:24, Vlastimil Babka wrote:
> On 5/29/25 17:40, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    d7fa1af5b33e Merge branch 'for-next/core' into for-kernelci
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> > console output: https://syzkaller.appspot.com/x/log.txt?x=12bbdad4580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=89c13de706fbf07a
> > dashboard link: https://syzkaller.appspot.com/bug?extid=23de6daeb71241d36a18
> > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > userspace arch: arm64
> > 
> > Unfortunately, I don't have any reproducer for this issue yet.
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/da97ad659b2c/disk-d7fa1af5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/659e123552a8/vmlinux-d7fa1af5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/6ec5dbf4643e/Image-d7fa1af5.gz.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com
> > 
> > SQUASHFS error: zstd decompression failed, data probably corrupt
> > SQUASHFS error: Failed to read block 0x60: -5
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 6.15.0-rc7-syzkaller-gd7fa1af5b33e #0 Not tainted
> > ------------------------------------------------------
> > syz.1.261/8150 is trying to acquire lock:
> > ffff0000d7ffcbc8 (vm_lock){++++}-{0:0}, at: __vma_start_write+0x34/0x158 mm/memory.c:6497
> > 
> > but task is already holding lock:
> > ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock include/linux/mmap_lock.h:128 [inline]
> > ffff0000d572df50 (&mm->mmap_lock){++++}-{4:4}, at: exit_mmap+0x200/0xbec mm/mmap.c:1292
> > 
> > which lock already depends on the new lock.
> > 
> > 
> > the existing dependency chain (in reverse order) is:
> > 
> > -> #6 (&mm->mmap_lock){++++}-{4:4}:
> >        __might_fault+0xc4/0x124 mm/memory.c:7151
> >        drm_mode_get_lease_ioctl+0x2bc/0x53c drivers/gpu/drm/drm_lease.c:673
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
> >        el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
> >        el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> >
> > -> #5 (&dev->mode_config.idr_mutex){+.+.}-{4:4}:
> >        __mutex_lock_common+0x1d0/0x2190 kernel/locking/mutex.c:601
> >        __mutex_lock kernel/locking/mutex.c:746 [inline]
> >        mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:798
> >        __drm_mode_object_add+0xa8/0x1f0 drivers/gpu/drm/drm_mode_object.c:47
> >        drm_framebuffer_init+0x14c/0x2bc drivers/gpu/drm/drm_framebuffer.c:875
> >        drm_gem_fb_init drivers/gpu/drm/drm_gem_framebuffer_helper.c:82 [inline]
> >        drm_gem_fb_init_with_funcs+0xa60/0xda4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:202
> >        drm_gem_fb_create_with_funcs drivers/gpu/drm/drm_gem_framebuffer_helper.c:245 [inline]
> >        drm_gem_fb_create+0x84/0xd4 drivers/gpu/drm/drm_gem_framebuffer_helper.c:286
> >        drm_internal_framebuffer_create+0xfcc/0x19dc drivers/gpu/drm/drm_framebuffer.c:304
> >        drm_mode_addfb2+0xac/0x2a0 drivers/gpu/drm/drm_framebuffer.c:338
> >        drm_client_buffer_addfb drivers/gpu/drm/drm_client.c:386 [inline]
> >        drm_client_framebuffer_create+0x2d0/0x55c drivers/gpu/drm/drm_client.c:428
> >        drm_fbdev_shmem_driver_fbdev_probe+0x180/0x70c drivers/gpu/drm/drm_fbdev_shmem.c:151
> >        drm_fb_helper_single_fb_probe drivers/gpu/drm/drm_fb_helper.c:1649 [inline]
> >        __drm_fb_helper_initial_config_and_unlock+0xf94/0x159c drivers/gpu/drm/drm_fb_helper.c:1829
> >        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
> >        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
> >        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
> >        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
> >        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
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
> >        __drm_fb_helper_restore_fbdev_mode_unlocked+0x74/0x198 drivers/gpu/drm/drm_fb_helper.c:228
> >        drm_fb_helper_set_par+0xa4/0x108 drivers/gpu/drm/drm_fb_helper.c:1359
> >        fbcon_init+0xe4c/0x1d18 drivers/video/fbdev/core/fbcon.c:1112
> >        visual_init+0x27c/0x540 drivers/tty/vt/vt.c:1011
> >        do_bind_con_driver+0x7b8/0xdd8 drivers/tty/vt/vt.c:3831
> >        do_take_over_console+0x824/0x97c drivers/tty/vt/vt.c:4397
> >        do_fbcon_takeover+0x158/0x25c drivers/video/fbdev/core/fbcon.c:548
> >        do_fb_registered drivers/video/fbdev/core/fbcon.c:2989 [inline]
> >        fbcon_fb_registered+0x354/0x4c8 drivers/video/fbdev/core/fbcon.c:3009
> >        do_register_framebuffer drivers/video/fbdev/core/fbmem.c:449 [inline]
> >        register_framebuffer+0x44c/0x5ec drivers/video/fbdev/core/fbmem.c:515
> >        __drm_fb_helper_initial_config_and_unlock+0x103c/0x159c drivers/gpu/drm/drm_fb_helper.c:1851
> >        drm_fb_helper_initial_config+0x3c/0x58 drivers/gpu/drm/drm_fb_helper.c:1916
> >        drm_fbdev_client_hotplug+0x154/0x22c drivers/gpu/drm/clients/drm_fbdev_client.c:52
> >        drm_client_register+0x13c/0x1d4 drivers/gpu/drm/drm_client.c:140
> >        drm_fbdev_client_setup+0x194/0x3d0 drivers/gpu/drm/clients/drm_fbdev_client.c:159
> >        drm_client_setup+0x78/0x140 drivers/gpu/drm/clients/drm_client_setup.c:39
> >        vkms_create drivers/gpu/drm/vkms/vkms_drv.c:218 [inline]
> >        vkms_init+0x4b8/0x5ac drivers/gpu/drm/vkms/vkms_drv.c:242
> >        do_one_initcall+0x250/0x990 init/main.c:1257
> >        do_initcall_level+0x154/0x214 init/main.c:1319
> >        do_initcalls+0x84/0xf4 init/main.c:1335
> >        do_basic_setup+0x8c/0xa0 init/main.c:1354
> >        kernel_init_freeable+0x2dc/0x444 init/main.c:1567
> >        kernel_init+0x24/0x1dc init/main.c:1457
> >        ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847

I just wanted to better understand what was going on here ;-)
Let me share my thoughts.

First, the deadlock might happen only when all these (or similar) code
paths might be called in parallel.

The two backtraces, right above, are from initcalls. It is possible
that the code path in the 1st backtrace can't be called before
the device is initialized. So, it is possible that the deadlock
can't happen in the real life.

I guess that this is the reason why people say that the deadlock
is very unlikely.


Second. if we wanted to remove the cyclic dependency then we would
need to break the chain somewhere.

I am not familiar with th fbcon code. But my guess is that we take
console_lock() here to prevent using the graphical console by printk()
while we are switching the driver behind the console.

I am afraid that we might have similar problem even after removing
console_lock. It just would be replaced by another tty-specific lock or so.

Just an idea. A solution would be to temporary pause the related
console. I mean to do something like:

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index ac3c99ed92d1..12ec99b69068 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3002,14 +3002,14 @@ int fbcon_fb_registered(struct fb_info *info)
 	int ret;
 
 	if (!lockless_register_fb)
-		console_lock();
+		pause_tty_console();
 	else
 		atomic_inc(&ignore_console_lock_warning);
 
 	ret = do_fb_registered(info);
 
 	if (!lockless_register_fb)
-		console_unlock();
+		unpause_tty_console();
 	else
 		atomic_dec(&ignore_console_lock_warning);
 

Where pause_tty_console()/unpause_tty_console() would just set a flag
or manipulate a counter in struct console.

The trick is that do_fb_registered() could then be called
without console_lock(). I hope that it might broke the chain.

Is it worth investigating this approach?
Does it make any sense?

Best Regards,
Petr
