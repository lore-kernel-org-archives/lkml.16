Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EFC8632B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057875; cv=none; b=O7bZX+X7/A/TVSRuT2rgxKl9/jWw1lRWcGeRotJqsb6N81dHcqvVTs3DKS4lrvEWZ/B3r0W8PeXCv3v8pllTgmyQpGIlDeDLa//qeH0tIn/3oQoBM7ojpNRn3kamF9JAyjpWKXP9p8gqRQO8GCCxfNunbhSz0RKe2DcsX47F3ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057875; c=relaxed/simple;
	bh=C82JNmBmQl6nDVtsLrlq7/LXhus7b0Co1S/FnhbyocA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D/HMDpYnOBqHYcGB15awd1X/VZoC70QO7Ormszxxw4HTk6l5/wxFyo7XHzY/wMuoD28LEDsZsnQY4TEkQExlrkoDOPVlk7UgUEiQeXNBOfvkCDXFiI6iM4ueTBkJiEL0pa4ZxeRT1CjF9yfzbGSdwonz/NMtgkp+utEMseBHIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TvmC/Pu+; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TvmC/Pu+"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85dac9728cdso114413739f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747057872; x=1747662672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbHfL50ZIpw0AwwIWTOCCssdnZ8GxKKWCXgL835qDjY=;
        b=TvmC/Pu+ZPH14cEDYxMiwt2bXGPBrjPObe/+H3Qe7YeZHi8QXcdzPQ8RvKJ51E6Amr
         viPgw4rM0RmeE1bTYiJLxo5vYJ9RShUU5xBY9hzeX+MhpY13U6czehslyTJkncd1v6dM
         vK2LBqXPzUNU76XqM8DbmzQkRCYZIWx/awPOPg3MlN7c24PmT6DSXE6IC/14TrSRviYJ
         uTxL6WDS9/vVF2q0h7ifu40YGPTSfI5CDd2SaXImHC4cC1dkvMFsWDPWPBnSDZNUB/Ju
         Tuls4fCpfyYm40JGh1KEumN8aRB2ertm6B9c9hmT4qTRb93NGIh1OppqsChZ7VRIVE9Z
         IDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057872; x=1747662672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbHfL50ZIpw0AwwIWTOCCssdnZ8GxKKWCXgL835qDjY=;
        b=K0xmoWcdozQ48DmDlz+2bCl3snnxDdof5RVg6tCDMjUSAiM7ttQH9/U+KUYnfzuORY
         NLF9G2xKqZwE0NvFKUamSUsiq+pxMXsMuBc0zgA3qnvrEIL2Sm+FqIw5WDrl9vqtzFmD
         O32Ir9m6PTEPk9oU22QaOE8tomR6urEnr8yG50NO32LUcdkQU82NYC7T5qIdGhrRhRHB
         ib7GKpY6bM8aAdaVkUsYVk+MOm6ASzWBth/sIL02GJDdNNDoKQ1zkdir3QmeydXBa3Xc
         TmuEsfv5DXBoul4gx8HxMN15RNm/iDziHCpIh8TOZiNexETdmMmFDABpnYLfFvLAqkK/
         /LhA==
X-Forwarded-Encrypted: i=1; AJvYcCVGlea5kWO3HGq3rPjP43nkol1oega6kvpasbzsPSaB5HelNsEF0TDbnC2rtwILzwEum4fE7c+TdranE+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEOF9+Xtu0dPnekvnxUBuikaczN+FsRoyuejvV4ieHsQ32hpI
	jw9RveKopUh9PyqzGBL7GONjEIUV0YhLfeUWYmMc4ktfg8sS4WNsVLYwIQlgsNA=
X-Gm-Gg: ASbGncv+PCU7QjztbTn5fryqvbYBKF+sUa7ktY/t1gdqiFXXnzJbSsWxi7TpYGdwPmH
	tw9jFPCwlPrwPEpTk56iYELMZS2MlNTmAcci4Gc9YiuEcytniX1NIouie2T8RdIDK0cfBSaNHTE
	39fep8RBGvMpCSZozWD8XePsnqU3UyWmLko6HmR5P3Yy+N4l5cf8aP15NaFkDN1bePf9y3c3f2q
	X3KT9MCLe8pAnahET7eHLXuyWqUldT5G4umKn8OIYDPOzrBkHwA5i5Rbd29w0Scgoer2kDu6OBx
	guL4dIevouokgVmVVincWvuukaP3CJI7+Qlx8YUKFWYUBEY=
X-Google-Smtp-Source: AGHT+IGe7PYh1BarNM3QwA7lUBGDLJIk/X9Q5I71uCCD1EP/LavNJSCXLZMijyLjXK6KPxsyQurmMA==
X-Received: by 2002:a05:6e02:1fc5:b0:3d6:cbed:3305 with SMTP id e9e14a558f8ab-3da7e1e7608mr142451495ab.10.1747057871986;
        Mon, 12 May 2025 06:51:11 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10472fsm22357855ab.28.2025.05.12.06.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:51:11 -0700 (PDT)
Message-ID: <81a0d2da-d863-4a6e-8d3b-b899d38ea605@kernel.dk>
Date: Mon, 12 May 2025 07:51:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring] KCSAN: data-race in copy_mm /
 percpu_counter_destroy_many
To: syzbot <syzbot+8be9bf36c3cf574426c8@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 dennis@kernel.org
References: <682196ed.050a0220.f2294.0053.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <682196ed.050a0220.f2294.0053.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 12:36 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    3ce9925823c7 Merge tag 'mm-hotfixes-stable-2025-05-10-14-2..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14ff74d4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6154604431d9aaf9
> dashboard link: https://syzkaller.appspot.com/bug?extid=8be9bf36c3cf574426c8
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/afdc6302fc05/disk-3ce99258.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/fc7f98d3c420/vmlinux-3ce99258.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ea7ca2da2258/bzImage-3ce99258.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8be9bf36c3cf574426c8@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KCSAN: data-race in copy_mm / percpu_counter_destroy_many
> 
> write to 0xffff8881045e19d8 of 8 bytes by task 2123 on cpu 0:
>  __list_del include/linux/list.h:195 [inline]
>  __list_del_entry include/linux/list.h:218 [inline]
>  list_del include/linux/list.h:229 [inline]
>  percpu_counter_destroy_many+0xc7/0x2b0 lib/percpu_counter.c:244
>  __mmdrop+0x22e/0x350 kernel/fork.c:947
>  mmdrop include/linux/sched/mm.h:55 [inline]
>  io_ring_ctx_free+0x31e/0x360 io_uring/io_uring.c:2740
>  io_ring_exit_work+0x529/0x560 io_uring/io_uring.c:2962
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0x4cb/0x9d0 kernel/workqueue.c:3319
>  worker_thread+0x582/0x770 kernel/workqueue.c:3400
>  kthread+0x486/0x510 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> read to 0xffff8881045e1600 of 1344 bytes by task 5051 on cpu 1:
>  dup_mm kernel/fork.c:1728 [inline]
>  copy_mm+0xfb/0x1310 kernel/fork.c:1786
>  copy_process+0xcf1/0x1f90 kernel/fork.c:2429
>  kernel_clone+0x16c/0x5b0 kernel/fork.c:2844
>  __do_sys_clone kernel/fork.c:2987 [inline]
>  __se_sys_clone kernel/fork.c:2971 [inline]
>  __x64_sys_clone+0xe6/0x120 kernel/fork.c:2971
>  x64_sys_call+0x2c59/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:57
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 5051 Comm: syz.1.494 Not tainted 6.15.0-rc5-syzkaller-00300-g3ce9925823c7 #0 PREEMPT(voluntary) 

This doesn't look like an io_uring issue, it's successive setup and teardown
of a percpu counter. Adding some relevant folks.

#syz set subsystems: kernel

-- 
Jens Axboe

