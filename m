Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B00218AE2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747964376; cv=none; b=NsYAmjpn6NcwSLyElLdZEQ1gbV7QYKwojS9CU6jXY1mZVTSmmz2sTNBvLqpRZNdxZ+4F9XW/8df3tAxSccQFS4mVj1LgIsoxYOc9VC8mKlEL1MR7dLt8zRIk0azVS0clvb0+dNSVRt6O/dQ8VHj/DRmfBq1uzv0Ioh9gISyXT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747964376; c=relaxed/simple;
	bh=tKftijF168l+HTSinxzDVuhgh9/R7akDYh/qoqL2Y+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kzkFbU/n3T94pXtkjeaYsCga81wVii4vbyBk8dlK48KRK7gcFer9CIOEoTqTwNiTuyA3XO1QMWFAeV5qdK9Bh0qPveiwIbIU+nh38AGG2qaWrTg86dbK3BGhxLgnmmA/vPlZOCgoDPnL6cvonyQQMpF/tNJCwRoB4cPPxhdaTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOyyMFGd; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOyyMFGd"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4c2e42ce0so19866f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747964373; x=1748569173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=;
        b=SOyyMFGdbMdus/GFRSwcBIRRLvo3eSfVOzh6WFuTW0N3MHGWlUjmlJsAju6jnVH6qB
         Zq6ebZX2uCOcsBIS4YLq9JGvOk4vIVRhya5YhnCGvVUeIYttgeyJ2TtG3G1xTMiCtTvw
         8uMLBznByHAZYU3ri+DZK0aXfLLQL0tDfd8WF0Vc1PjBnQ2gJroqxS7Ij586F0lePj7e
         ucVJx9BE2zv3RKIpNEmhl/O+5Y/TdjM/g5BWxL2fCJ6j281MKF9XYG3AHq43XB87g5wm
         wmISgrmXEyWizhlrmBNT2Np6jFCsbd7DNp+87CP7GwSHEwI+OXIN+nhk7ZWxefRVirkz
         IqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747964373; x=1748569173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+g5V9tAyig6HI/i/tRhLAzkeAnoyfZecTy+ex1U9OrM=;
        b=qKglw0MkaaYJBwsMJn7PAwab843A3cKEZKPG1cWRY7hxcDJsw4NjBtag6k+RuNYiGk
         IVBzmgGWqQdaUtKnGKUZiYG1B1/G9uRrZ6KuOTY73L5gfwQO+XOuO+WcyZso4PWKbnwL
         27mqf+kUhBceXo2J1xuW3CHQG4FbSFT0r/Pcn7bXTH+6xPQf2739rwDBsmNOxIakArRu
         uy6fFo+pLn9nGrzqr/77I/cJewvSuvN5Wci2EK5/hirsztjKdJKsoaG6pDLCB0YzdbKf
         gdCZ5a+Em7BMT4eaMtvYBtwIFZ9sezoz/OgqPQK+goy/1JO7VRQ2u6EAiuQOwwzje3au
         tncQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3NmnVK7GhlsVsEOSv3nxPxIjTqttf6ZRFJGj0ZNaYhobZwwvltkY+HXPQOweG0++vMcacs2QN+aLXrp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7Lc7Kpbn23EJMLY5iXOiNqDk6ErUtl/EpEXLDFc9GNXQnHix
	h/4ul1LRpQJE+QMWRoXSnxSVaBq/5aj1+zdKFvNJGK+WuQ6vCOfdE1LNrjPDm76kZNB8hY9YlKe
	A/+VypoAk5k7rzF7KBqrkjwMwTQWWfaA=
X-Gm-Gg: ASbGncvG4GiJWKtogyBcQ0FyDSawJ8gsVwAblKlyJiEsbsA6VspZl1LcTB0ELS4/vMv
	NPy0z+pyvdvrJYD2YU27vvRZjxyOzCGbn1TOI+OxXk/HVdMaCAPl86zCMi70b4MKlhEWc55rqMv
	DtJ2CzMS1GF6eyVLxGIVQBR7NjW6FAhxSnHA==
X-Google-Smtp-Source: AGHT+IFn5VlX2x+YOnwSuaERMnEdXbA0mh6MF1d5tUr0x7cCS6P9dtLC+f2hMvCPr3qzJvc+zfD0iwuhkxAbgG0/mNo=
X-Received: by 2002:a5d:64cb:0:b0:3a3:6ab0:8863 with SMTP id
 ffacd0b85a97d-3a36ab089b0mr6439541f8f.16.1747964372704; Thu, 22 May 2025
 18:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521115635.829744-1-chao@kernel.org>
In-Reply-To: <20250521115635.829744-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 23 May 2025 09:39:21 +0800
X-Gm-Features: AX0GCFu_rZ5QZoXdxMeB6B3Dsd7sOUL2vHTMib5OtRC-a0lpjVZ5PG13BL8-YCo
Message-ID: <CAHJ8P3J8cX5+pVkE4TT24zh+wvW06KrpKXT2-7cRx3i8XzBbNw@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com, 
	Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B45=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 20:02=E5=86=
=99=E9=81=93=EF=BC=9A
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
> And it mounts f2fs image w/ gc_merge,checkpoint=3Ddisable, so below deadl=
oop
> will happen:
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
> avoid above deadloop issue.
>
> Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26=
.0289.GAE@google.com
> Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allo=
w more data to be written with the CP disable")
> Cc: Qi Han <hanqi@vivo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - add missing Closes line
> - fix to use git commit description style
>
>  fs/f2fs/segment.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5ff0111ed974..19b716fda72a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -433,6 +433,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool n=
eed)
>         if (need && excess_cached_nats(sbi))
>                 f2fs_balance_fs_bg(sbi, false);
>
> +       if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
> +               return;
>         if (!f2fs_is_checkpoint_ready(sbi))
>                 return;
Hi Chao,
When I read this patch, I feel that it is somewhat redundant with the
following checking about SBI_CP_DISABLED in f2fs_is_checkpoint_ready.
Can we reorganize these checks for the f2fs_balance_fs case?
This will make the code easier to read and understand.
thanks!
>
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
