Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1F127CCD7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858723; cv=none; b=dwjSJFOUYg8T+UG6Xnpu6zzT/am9ADsemMchuXjkBrSTto5xcu5LhtFUvvENyW2Zsjw3aDLEAExa9WZy0B1IC9CUyGBzVI5oWn8errX21vsfF24/kdrFmSwnAQaEH6oO/cjDEr+L+a9O3HHPcGFm/ODoGf0MnlSt9PExxOZ9Mgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858723; c=relaxed/simple;
	bh=Z5cQJUX1NbkXvQwgA7QujW9GmijALGJJ/RcgDNIxvyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OabLEJFWIn8K38r/ehge+bXwbLLAlazhKjsC5SFz6UtmqOeuKPNQbw3ECG0oTsqYDHmDcRPrix7HZqghh2c2l5TIdugiOkHkAI0+k9n+QkGega9xet2VOQmkI366DdKYYgO3tF3d6RkdomVlrD3SSa9uGY5N0XUIyKpDZirKBVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ph9KMfpE; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ph9KMfpE"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d93deba52fso12089195ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745858720; x=1746463520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MUWsMO8+zzeKqEoat3ch1kch4vWM2YGYaR6q5i5jRI=;
        b=ph9KMfpEirpCgXCJgHKtKO/gGSts2nuGaBIEMT6T0ojOiqku7tX31Ndhki+y8cx6sW
         3pa6kKG3OA76hQcGTvYY+pEr6S+WvSxuGwia1qOImhCoUAAh9a0SzazZpqKkUdbGsOCv
         i5gcQl9DzLw0v6jihs9096G2AD7EOaVVjFtZTHa33j8wPmBDjmnSmEWKRLCmhSCAvLK7
         mpcLQpgt7r2uRowKucyN13bDLI693xO8AYZG9gNKqNGuz1OMj1LhE2WIPVUP8+zR72hn
         v295p8EoyiKN7GgF0RJHE97I2XyEHZfEKcnKIcXTnt44W19bxjtua3cMQaVVmPEAyt1T
         BTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858720; x=1746463520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MUWsMO8+zzeKqEoat3ch1kch4vWM2YGYaR6q5i5jRI=;
        b=OOol6q8KHk6AE/rXmFTgQG0LSmNAqQoHMg2SX+PRYXShXc86vdLPR3peE6Lcv52bXU
         bKPAinWH/8fhDNMZujaNpHw1nVxIOprCYeNKfLaKJJpSHc8CX1AiQySLwgIFnJMvovgs
         8KeAWUfu5x43RDQ6Eai5AoBIpem8DLTGaSfJSO9ni8tjIYCDKfQ1VGvPp3/l0JnBvFk6
         jil2mamF+XlaN6RR2yWUnWFqaXcnFoVweJyNNsNXu+8dTzFatmCE9VYIxu2SVxphQgqL
         uTpxkI7gjbMU3CKgzEz8u/U2NmQniz17TbzTsOfcYCTnXKfNzJQDCorIUesIPSmUHUVG
         tF+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIg2vOnQCaTTpFhsxcoC6FxB25Sfrg0khuRmI+TlID9ItINNKCiw/WOytNWroq2yNim2KFV6DX8aPDhIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEfk0mMnrl3VZP/3FLLGaMQJppleysADwfT9+gaoIYIAR52vOh
	fektvfPx22rQ2F+RPfqzmeDBukt4BYN9G6xxRTk2GFJKP7f8D+fEO6xVoaOC7i0=
X-Gm-Gg: ASbGncvkmr4a249kH9FTO+FqXOUNK2WaNGnFDN9aBugO4pOdi9LcqxKj+w+0rjwfUvs
	5paUZM6cvW5wca84zuPgKgE9s4DbNGtpyq4VEtstBHvjsegfNfAXbxHPDAeCMNWG7LUPrqNGShE
	wqs8AGMDW5ZYHw3DeC/DteTEcUxIZcZkk8FfOaQWqlz7c6IFC71SPSXVIVtsHe+zKkxrz8tsXCp
	nHNdCzwa1qG3CzdjIpmEzfyAP0sBy18dlSLr/rRdYMyElcYXURELRbKnkHRNZtV+figIqKhcn/f
	B01oVrzII9Xz3JM3oasuCL2MiWWd02OsDLfzi3E1y377/kg=
X-Google-Smtp-Source: AGHT+IG5qV/mX+wlx/OUaoyJ42BYYbyU09yi/RjQzH4juW3GMl5ZeowBow5Cy/cY5c60VK0rkXq88A==
X-Received: by 2002:a05:6e02:1527:b0:3d8:20fb:f060 with SMTP id e9e14a558f8ab-3d942d1ddc2mr100354175ab.4.1745858720085;
        Mon, 28 Apr 2025 09:45:20 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824a41dedsm2336055173.50.2025.04.28.09.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:45:19 -0700 (PDT)
Message-ID: <c70692b8-4026-4ba7-b6a6-561bbb887001@kernel.dk>
Date: Mon, 28 Apr 2025 10:45:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring] KMSAN: uninit-value in putname
To: syzbot <syzbot+9b12063ba8beec94f5b8@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, brauner@kernel.org, io-uring@vger.kernel.org,
 jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
References: <680f4c94.050a0220.2b69d1.035b.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <680f4c94.050a0220.2b69d1.035b.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 3:38 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a33b5a08cbbd Merge tag 'sched_ext-for-6.15-rc3-fixes' of g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13f77fac580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fca45111586bf9a6
> dashboard link: https://syzkaller.appspot.com/bug?extid=9b12063ba8beec94f5b8
> compiler:       Debian clang version 15.0.6, Debian LLD 15.0.6
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e23fd3b01d5c/disk-a33b5a08.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d39e4ee184b3/vmlinux-a33b5a08.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d4117549249f/bzImage-a33b5a08.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9b12063ba8beec94f5b8@syzkaller.appspotmail.com
> 
> =====================================================
> BUG: KMSAN: uninit-value in putname+0x8f/0x1d0 fs/namei.c:285
>  putname+0x8f/0x1d0 fs/namei.c:285
>  io_statx_cleanup+0x57/0x80 io_uring/statx.c:70
>  io_clean_op+0x154/0x690 io_uring/io_uring.c:411
>  io_free_batch_list io_uring/io_uring.c:1424 [inline]
>  __io_submit_flush_completions+0x1b00/0x1cd0 io_uring/io_uring.c:1465
>  io_submit_flush_completions io_uring/io_uring.h:165 [inline]
>  io_fallback_req_func+0x28e/0x4e0 io_uring/io_uring.c:260
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0xc1d/0x1e80 kernel/workqueue.c:3319
>  worker_thread+0xea3/0x1500 kernel/workqueue.c:3400
>  kthread+0x6ce/0xf10 kernel/kthread.c:464
>  ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> Uninit was created at:
>  slab_post_alloc_hook mm/slub.c:4167 [inline]
>  slab_alloc_node mm/slub.c:4210 [inline]
>  kmem_cache_alloc_noprof+0x926/0xe20 mm/slub.c:4217
>  getname_flags+0x102/0xa20 fs/namei.c:146
>  getname_uflags+0x3a/0x50 fs/namei.c:222
>  io_statx_prep+0x26f/0x430 io_uring/statx.c:39
>  io_init_req io_uring/io_uring.c:2140 [inline]
>  io_submit_sqe io_uring/io_uring.c:2187 [inline]
>  io_submit_sqes+0x10c1/0x2f50 io_uring/io_uring.c:2342
>  __do_sys_io_uring_enter io_uring/io_uring.c:3402 [inline]
>  __se_sys_io_uring_enter+0x410/0x4db0 io_uring/io_uring.c:3336
>  __x64_sys_io_uring_enter+0x11f/0x1a0 io_uring/io_uring.c:3336
>  x64_sys_call+0x2dbb/0x3c80 arch/x86/include/generated/asm/syscalls_64.h:427
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xcd/0x1b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> CPU: 0 UID: 0 PID: 10442 Comm: kworker/0:3 Tainted: G        W           6.15.0-rc3-syzkaller-00008-ga33b5a08cbbd #0 PREEMPT(undef) 
> Tainted: [W]=WARN
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> Workqueue: events io_fallback_req_func
> =====================================================

I took a look at this and there should be no way for this to happen.
Then I looked at the dmesg log, and there's a ton of failures prior
to this, including what looks like memory corruption due to UAF
on other pages.

#syz invalid

-- 
Jens Axboe

