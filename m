Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9B2DCBF3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747971373; cv=none; b=eAE/cRlOZp7aGVBLmyr+5OwaC7zpjREaz57Asd6t8r/3PLaLP7kqKTThx5fVR5Hbb413dHj+J3sHJIU0a+V8i+h+5n+2e2ETMPcrL8NLtCKa2ivXYRlpuB4HLb6lzn795QRR7Dw9k7Y+NZ+qIc5lnB4M+EPhjGjKtSziscU9PxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747971373; c=relaxed/simple;
	bh=azZRr4LBOgLYXx6bWZOfDQZuffYt4ZV2A6L6e7dWokA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYwSSEKaAJ1UyZtm+kGoR/UYks8+bDEl4jTlKhRRSkCEcajlPUo6LqNituk4xebxv/knUSWuv+JY/vvvg+0ZRI881Sm08cTNnZU14YrciZ1tD43MCrfBUr6v1dBIp/cpArg+g6pbaCgfDwrR/++wHIWIphg2kXAc42ekJMMV4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3kcP0UM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3kcP0UM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a368259589so932725f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747971368; x=1748576168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=;
        b=E3kcP0UMQe7XQwWDaq9eI5i7JMwF2xAMfO6ldadTCxp7Dr8fXEGRWnKROzRhFa/g6Y
         YMusaQW3GuSH38Y4y/m7bb63I4OCIbfe9u0/mhT4UDmFFS9vJg59I+DcYK1lMPzOp4h0
         v5RWzfgZSVMW+7H+VrfcGz09yt2AEq9j5GNo0G2G66TEHDAuo9ReWchvdO/MPJGb3lqp
         2FCNPkVxCWkzM+7be0ot5glLKQGeGFER81mEzxtXUGsbFyb/3HElhXut5y6EmjC6nNSQ
         fw0+Qhi/BrRDgw8EiZK6hOU2N35DH4VkJfxGBem+kEv/WmkkznlAMDlDBHaPoqCtvXfm
         jtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747971368; x=1748576168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMXqaCL87KXZTQ02q/1XgBkXjy1duBgR+/XofIDFZrk=;
        b=v3pPqiRhGf3KLWspgcdnvjxdeYj4/D7iN/SHiXaQ/EP9kHAO1lvJy74lzd9DXpEBxa
         1M0RtVqhQ8MYqIncuoIw5Bpjsk+iN2QrHYgevpzMZFH0ZJSxsiIZe2kbdb0tw+UkY+Z7
         /Q14nz4rp6JNZLt7hu9OVtPUXTl4AH0qLO9uqmb/ariLvo93xXRP3GBAA02i11ElOMRr
         7bHajWKQ4268mdXWwl2Vfy/ZrbyZouQc1dkP/wCOW3YclHBXb2wZS5EhHeFk/dgQkwCQ
         bHaukmpdDL5jZwhOjok2e/Bx+MLnpVjeDHjRF+Kf75YTYicrhXGjNg/ErP2FsmuaKzkw
         5qcg==
X-Forwarded-Encrypted: i=1; AJvYcCWC3IwoSKQ2YfbYS8xeU9DLtgOsf42yHxqXeDburMF5vMIRPTsNMeH9ANDSwwkHLwzSytadOI5u84cOY2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbF0KJJBWgOxxXD2Tm5zSc6EQ4bOtdtiHAYe0o/MQkjt4VJRX0
	G1rC+AMpyCxZ+lacyEkxqOLHR6qZX1o9VKSgLlnrNdE0ngngUzbaLpQlUErjaJomT3o+CXHcq/y
	lQaYpixKOsmmpuu42AgODzuQZnE6R1+Q=
X-Gm-Gg: ASbGnctkdenhftgp3fX5ofDI3XUK9Pg6E6oQ/h0uDfrxBXo7Kcr1q/6NEDQic3iWjBy
	el1kDrZgiZAzUPreroDG6idTANzIpTfwZ9imCrsu2c6uJ1zSmEK6UFmbtz35MeZPXe0M44QKCRl
	bBZ/60TxoemqJbHc2gcKJ0AKB3Ay9N0JTCrA==
X-Google-Smtp-Source: AGHT+IG8tDj9VUbVSSZCdOnpRLycP6PESNY5fDQ2iVNmW7wMk4wsbP81qGjQ8GGsn73OHPv2MraJUKNDkTFYkZxZCak=
X-Received: by 2002:a05:600c:138c:b0:43b:c844:a4ba with SMTP id
 5b1f17b1804b1-44b8ab9b6d3mr2394265e9.3.1747971367970; Thu, 22 May 2025
 20:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523032545.1392641-1-chao@kernel.org>
In-Reply-To: <20250523032545.1392641-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 23 May 2025 11:35:56 +0800
X-Gm-Features: AX0GCFs4AKTY9dD6cR9VFip4Is95mD1bH4fpqPkJIkd07O28bhyoBRQiQCkif7I
Message-ID: <CAHJ8P3KVFDbOsSjdbA=LqcT2PGNbgNOibWEn6Y6cqGOgvkjO6Q@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com, 
	Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B45=E6=9C=8823=E6=97=A5=E5=91=A8=E4=BA=94 11:30=E5=86=
=99=E9=81=93=EF=BC=9A
>
> Syzbot reports a f2fs bug as below:
>
> INFO: task syz-executor328:5856 blocked for more than 144 seconds.
>       Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826  =
 task_flags:0x400040 flags:0x00004006
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5382 [inline]
>  __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
>  __schedule_loop kernel/sched/core.c:6845 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6860
>  io_schedule+0x81/0xe0 kernel/sched/core.c:7742
>  f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
>  f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
>  f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
>  f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
>  vfs_fallocate+0x6a0/0x830 fs/open.c:338
>  ioctl_preallocate fs/ioctl.c:290 [inline]
>  file_ioctl fs/ioctl.c:-1 [inline]
>  do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
>  __do_sys_ioctl fs/ioctl.c:904 [inline]
>  __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> The root cause is after commit 84b5bb8bf0f6 ("f2fs: modify
> f2fs_is_checkpoint_ready logic to allow more data to be written with the
> CP disable"), we will get chance to allow f2fs_is_checkpoint_ready() to
> return true once below conditions are all true:
> 1. checkpoint is disabled
> 2. there are not enough free segments
> 3. there are enough free blocks
>
> Then it will cause f2fs_balance_fs() to trigger foreground GC.
>
> void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
> ...
>         if (!f2fs_is_checkpoint_ready(sbi))
>                 return;
>
> And the testcase mounts f2fs image w/ gc_merge,checkpoint=3Ddisable, so d=
eadloop
> will happen through below race condition:
>
> - f2fs_do_shutdown              - vfs_fallocate                         -=
 gc_thread_func
>                                  - file_start_write
>                                   - __sb_start_write(SB_FREEZE_WRITE)
>                                  - f2fs_fallocate
>                                   - f2fs_expand_inode_data
>                                    - f2fs_map_blocks
>                                     - f2fs_balance_fs
>                                      - prepare_to_wait
>                                      - wake_up(gc_wait_queue_head)
>                                      - io_schedule
>  - bdev_freeze
>   - freeze_super
>    - sb->s_writers.frozen =3D SB_FREEZE_WRITE;
>    - sb_wait_write(sb, SB_FREEZE_WRITE);
>                                                                          =
- if (sbi->sb->s_writers.frozen >=3D SB_FREEZE_WRITE) continue;
>                                                                          =
: cause deadloop
>
> This patch fix to add check condition in f2fs_balance_fs(), so that if
> checkpoint is disabled, we will just skip trigger foreground GC to
> avoid such deadloop issue.
>
> Meanwhile let's remove f2fs_is_checkpoint_ready() check condition in
> f2fs_balance_fs(), since it's redundant, due to the main logic in the
> function is to check:
> a) whether checkpoint is disabled
> b) there is enough free segments
>
> f2fs_balance_fs() still has all logics after f2fs_is_checkpoint_ready()'s
> removal.
>
> Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26=
.0289.GAE@google.com
> Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allo=
w more data to be written with the CP disable")
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v3:
> - clean up the codes
>  fs/f2fs/segment.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5ff0111ed974..24b4bb2a4b9b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -433,7 +433,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool n=
eed)
>         if (need && excess_cached_nats(sbi))
>                 f2fs_balance_fs_bg(sbi, false);
>
> -       if (!f2fs_is_checkpoint_ready(sbi))
> +       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>                 return;

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
thanks!
>
>         /*
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
