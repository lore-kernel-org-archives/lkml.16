Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD001F1311
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164484; cv=none; b=I4eyWXcFISZTDtsFLGPlw+ISqwdUuqdSUg86dK7DGlMexjkB500yM/fJFw4ocQHyNsCE/I6z7NAjZnoMZdA9bTBk+f3/sYIK566YN9OYvLz03Pg/a6Ifs1bXXYVu6aIJtJLKwSeeDqtX+QBqFJQV542itj0+nOe3HS7iIFw88ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164484; c=relaxed/simple;
	bh=U0+A1lOtSox6LNSrWEe69AlsxRTU/WjvnlKjyZjOruA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fR9EMj7gasNyiwJjE6c5s4yuFFJm/1lpimlBJSXxEwlssVGEVOyKoFhySVb2y9zBEb7TgKsFshjjQGYnNd4+sO6HZWQsV4I9GpN2p4Z+4Sxh56I8vPByV8Eq29LBNtJGnf20Z6kHPSJHVwUcvEyEU+x/0WPFGvF5hwpxDOw/cLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Aw/V4pYk; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Aw/V4pYk"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso24235335ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750164481; x=1750769281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+NvbUmM4Qyku01Y5V+HBwrpgHLhxJzThOfuu9er8Zc=;
        b=Aw/V4pYk7cF8CBvXwey+ZIUD0xVGMXxJek4O2+m5f6CmsaNiLMqJWXtmHX2TOytdIY
         nNj6VvSDe9NVERT27IpflHtH+85LA9gsQTSFiqpqZu7pcgojryetGH3iu0+RnknRzykM
         S5RiC5/E/32FJ2A8ceUZeXz8GOUs2t3TAhku/CNNsho2CdfkbDLzF//nPy3+b/3E2sGy
         IMU95vvys2w95CbGoTMM30NUHW/KmYM3GYKY4FYUt/DflrXqRPflhuCX5nGMpTdg0M8d
         0TgDhfLLD46iU2T9esLPZopBnJfWf7JQb8G1GJvlcM+y+N16XuAhdjaosGHnxvRGouMg
         wY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164481; x=1750769281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+NvbUmM4Qyku01Y5V+HBwrpgHLhxJzThOfuu9er8Zc=;
        b=ilFkMG0+Y9K8wSPS2gzB/nW+PK3cusUEoTeo1KTCDRledRUvM1vZgESgeSkEMqHxPG
         tPj6/EiPHvTL560pp3ppJvaxIUMGR1wgfYEiqi1VS0OcyBv95SOTwWh72JppA5l6Tf/y
         /NJiIC/tJz64PLx6sBOv5sRUhzO672xrPjVTDVvJpLEc1/0NKkIOoR5R0ihCPKD5DXSw
         uN6sOsvb+OM0HlMItmy2vmesCJp17dwFGZW6rQhg5Ptkm+vKWn+sJPYwNnhJU8X7bnK3
         iJSSw5d6Knit/LyQ5gPCVRr5qygzlVL+Iu83zMp2UE1pjqGQQKnTDFmTSpSdaU4nuqe5
         chsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXedQszaR8RBGj08IO3CRPlXjIsAh2vIXUzJgbAtX67lNoMG5A6MN7u0cs8zTPR5JenyZylRCwwhrqMOH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CH3zLIuGi5VtGwuEO/4xUHSJ21Kwc6EFssWgafRSmLEe+461
	mj/KMU0/SMQXZW049TPBsD5+JRzYzu5eVkIqwZREwTd9qoRn27/Pm1sIWAbSI53zMFE=
X-Gm-Gg: ASbGncsp44BbkIog5CgEjF+VJIzirzghl7a73kf3AK0UGQIXaWr+tF49ZYyuR5D/wOT
	ngkZ3IhXefTBNEVSDMXJ28I7irJV/FzlmvoSPeo5VyTkqVuiVV447sJoTVFI/4AqdRUtntBthee
	2hBz7mopGElP3+LCb4eWi6wqdt6zxJrzg1upuJ+Vihjultftd/S56Oy1CwPFTHgqP4YH1D2UyPi
	2vHFjB8aku9OxlklAElXzBikJ15VtrVTHUbqadorr/Xf5rIVaY9I3o3YxDLIXoaft8Ad32oy0Wl
	Suu8oNnUmbE9u3vj/v29sqJsS82zMVqFD9BQxTvNEU6niB71uzFgN6ITqV0=
X-Google-Smtp-Source: AGHT+IEcZ7IWwbzk7Cr79F+9XAqiUrbefLCmZGtZDQW6QXzoOs2RilX/320awuYADG21Cf4HFNqMFg==
X-Received: by 2002:a05:6e02:370a:b0:3dd:a13c:603e with SMTP id e9e14a558f8ab-3de07d0cd09mr149833125ab.14.1750164480957;
        Tue, 17 Jun 2025 05:48:00 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a4ae11sm24255875ab.52.2025.06.17.05.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:48:00 -0700 (PDT)
Message-ID: <c655293b-b2da-497b-98a6-05399fd120f8@kernel.dk>
Date: Tue, 17 Jun 2025 06:47:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] WARNING: ODEBUG bug in io_sq_offload_create
To: syzbot <syzbot+763e12bbf004fb1062e4@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Penglei Jiang <superman.xpt@gmail.com>
References: <6851237a.a70a0220.395abc.0208.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <6851237a.a70a0220.395abc.0208.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/25 2:12 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8c6bc74c7f89 Merge tag 'v6.16-rc1-smb3-client-fixes' of gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1745710c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1ab5c40b21ee326a
> dashboard link: https://syzkaller.appspot.com/bug?extid=763e12bbf004fb1062e4
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ea3d70580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10c5710c580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-8c6bc74c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/b523997774df/vmlinux-8c6bc74c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/da5178f1b34a/bzImage-8c6bc74c.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+763e12bbf004fb1062e4@syzkaller.appspotmail.com
> 
> R13: 0000000000000002 R14: 00007fad89109ab1 R15: 00007fad8910601d
>  </TASK>
> ------------[ cut here ]------------
> ODEBUG: free active (active state 1) object: ffff888024813bd0 object type: rcu_head hint: 0x0
> WARNING: CPU: 0 PID: 5941 at lib/debugobjects.c:612 debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
> Modules linked in:
> CPU: 0 UID: 0 PID: 5941 Comm: syz-executor101 Not tainted 6.16.0-rc1-syzkaller-00236-g8c6bc74c7f89 #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
> Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 41 56 48 8b 14 dd 00 8a 15 8c 4c 89 e6 48 c7 c7 80 7e 15 8c e8 bf 33 99 fc 90 <0f> 0b 90 90 58 83 05 56 99 c6 0b 01 48 83 c4 18 5b 5d 41 5c 41 5d
> RSP: 0018:ffffc90003f8fa78 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffffff817ae248
> RDX: ffff88803cd0a440 RSI: ffffffff817ae255 RDI: 0000000000000001
> RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff8c158520
> R13: ffffffff8baeb4a0 R14: 0000000000000000 R15: ffffc90003f8fb78
> FS:  00007fad890686c0(0000) GS:ffff8880d6753000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fad8911b362 CR3: 0000000031b29000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
>  debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
>  slab_free_hook mm/slub.c:2312 [inline]
>  slab_free mm/slub.c:4643 [inline]
>  kmem_cache_free+0x2ac/0x4d0 mm/slub.c:4745
>  put_task_struct include/linux/sched/task.h:145 [inline]
>  put_task_struct include/linux/sched/task.h:132 [inline]
>  io_sq_offload_create+0xe4b/0x1330 io_uring/sqpoll.c:517
>  io_uring_create io_uring/io_uring.c:3747 [inline]
>  io_uring_setup+0x1514/0x2120 io_uring/io_uring.c:3830
>  __do_sys_io_uring_setup io_uring/io_uring.c:3864 [inline]
>  __se_sys_io_uring_setup io_uring/io_uring.c:3855 [inline]
>  __x64_sys_io_uring_setup+0xc2/0x170 io_uring/io_uring.c:3855
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xcd/0x4c0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fad890b6f99
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 31 1b 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fad89068208 EFLAGS: 00000246 ORIG_RAX: 00000000000001a9
> RAX: ffffffffffffffda RBX: 00007fad891393c8 RCX: 00007fad890b6f99
> RDX: 0000000000000000 RSI: 0000200000000200 RDI: 0000000000004d25
> RBP: 00007fad891393c0 R08: 00007fad89067fa6 R09: 0000000000003232
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007fad89068210
> R13: 0000000000000002 R14: 00007fad89109ab1 R15: 00007fad8910601d
>  </TASK>

Looks like fallout from a fix in the 6.16 kernel series, where:

commit ac0b8b327a5677dc6fecdf353d808161525b1ff0
Author: Penglei Jiang <superman.xpt@gmail.com>
Date:   Tue Jun 10 10:18:01 2025 -0700

    io_uring: fix use-after-free of sq->thread in __io_uring_show_fdinfo()

moves task_struct error handling to io_sq_thread(), but misses that
io_sq_offload_create() does it too for tctx allocation failure.

#syz test: git://git.kernel.dk/linux.git syztest

-- 
Jens Axboe

