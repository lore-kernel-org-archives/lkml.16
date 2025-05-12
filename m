Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FB9297132
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071910; cv=none; b=LuGfBppb9AszYKz9tTp7VndlHRlJC8PA8g38c0Pp0ICTXzaJpg0kvr7obXMCcTDJC4XNcWUkoYzw/lpiako8GjkIXb/dSP9L82OnMi2P7icttaWkTxbabTVn38VUuh7RvDXVTG0PHEsQ8Hpj0QlqtaTzBOxdUaMoy1tQ/pucGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071910; c=relaxed/simple;
	bh=UJ0Nv/tiHfH1BZi1bfwZryelsyB/d4J+P1i9rWpginM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVKNH71d18gVbKrPjhRA+EKIAU0sHpgPISOc3bGf3+F/tRo3ZiImQFLE2Oei0pckT3zC+Ts8amAUh2j6Vs3NSTwMKmuw4BYDux2YNiXGIyoYhlvlOY7r7e/V5N27/lURKHOdATE8QH/wrvXhL9bKzZHuVHRpdy3bvzepm0NsgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2AtkUz2j; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2AtkUz2j"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fc4fc27983so917a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747071907; x=1747676707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKyF5ivhB38O0n4mqcTC8jxtzKF2DnmCYoFt82pLoBo=;
        b=2AtkUz2jshsBEMPjN5PG6SyL1AwihceTLIY8CQqq4wJvjfH1uYMiD45BEHBTp3kCL1
         azCAQ6OajaoiCJd8t4Kg8qrxd4bEd6O5CMePYP797fK/zm/lL5O3/nJ7AYuuASv9Kq+l
         QJd1e7q3XIy976ZgMjRUubP8R2twDDSi7YkaC4whHIez61mstuT1q/EUIPxzm1za8mAu
         BIdLApHcSIuNIzR3ukunt8WaCRSRG1MpO/MiGo938xcMRqHezk1d5pfUnNATfVKBtsiv
         WZsYnFp8dt2Fgnzpj6U7/FcTaSFsg2CNem7qrztvgDMaiB/nQUDyD9QNXW5kU7X2X8vu
         13jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071907; x=1747676707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKyF5ivhB38O0n4mqcTC8jxtzKF2DnmCYoFt82pLoBo=;
        b=JLs2x3/0MMONDzB7Yu6AL5PZpeeTvLJ2cEVyNqnwj7oJogAgUyUr6KRqXz2kMLmSsY
         lE4t9RDmkeSGE2Xp3OWUniSHO30u38GP45jTCLxqERjs7oniAbasnGeLGaX+nXsGz4Rr
         pGdWKuKHHj/vQk0788Bplu7IvXnRe1QeIFJe7/xmwK19nnpxFeToDv5lv7LV8MVZU6Vt
         pDEG01BCq6J3JRTXKQiJi1nWLr2jBXNB4GQ6tDKqN86e3+fgWsLfnQbWyRa0mgck5Ur4
         4nEtuMgVNDU9D5kBWAhNWhQYxAaL2G3QM55w+JeWAqc9xwlSdfN4XuA3cQb6TrlfFPig
         aRQg==
X-Forwarded-Encrypted: i=1; AJvYcCUYJu2UT9CHQZvzlN3ELvvUlWzV1sXroq3aiaIVEKE5Oz4PrKBJKJmfie8f0Vd/uLud+V3lpsrKsgmhjeA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31RLO1rxWIaGS8MJKLLTdKMQNEd3NWWC/8TFdM3BzpE7USx1B
	N7j72Ak8Q9EL03fQD7/P0SGwNLKRusmhBpm0jxogJt8tMoGe/txLGP1jCXTFdd+m84Dq84PXAfj
	2JVWgU29rt/D+DQpGY63ym9UVRc/DB5iPIIB5
X-Gm-Gg: ASbGncs8wqebR+VrtV8Rrg8RJTZ2mSxD0bruP0QCL0Nz4pKV/B7VbnIWTHxYmpVSBnq
	AdTddpDB5D56H2777/+jm4dlxZfh62evUv4gOi6MF/rotqT+NMtUSZs9d6AX/NDttmGvWoSFAA9
	2IN91ODekQ8msM1aiaI0rmvBErGNzmbneQm2uQ9EwKq88857aRZLuioov4uLg=
X-Google-Smtp-Source: AGHT+IGvMCe4UX2v40Wz0FcaErsAvKW/7NlqcD/ZBMDCMO69M78kxAQz8sfib4Hq6eaEsqNDdbg8QghyEiwUeyppcKw=
X-Received: by 2002:a50:f693:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5fcde51c45dmr145972a12.7.1747071906474; Mon, 12 May 2025
 10:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6819bfbb.050a0220.a19a9.0007.GAE@google.com>
In-Reply-To: <6819bfbb.050a0220.a19a9.0007.GAE@google.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 12 May 2025 19:44:30 +0200
X-Gm-Features: AX0GCFsE_2EekYWSD9aNjGjOJGZK506gVTcilLvXgUiO8MBDAgL7EhpH3qmKF5E
Message-ID: <CAG48ez2pOt_Zf28CnLbVCzo1uBhWfqUjgh4fzDaQo+qceM6kSQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended
To: syzkaller <syzkaller@googlegroups.com>, 
	syzbot <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 9:52=E2=80=AFAM syzbot
<syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com> wrote:
> HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of git://=
g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D17abbb6858000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6154604431d9a=
af9
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D189d4742d07e937=
d68ea
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd=
6-1~exp1~20250402004600.97), Debian LLD 20.1.2
[...]
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_ext=
ended

I think this is a problem with the KCSAN implementation.

This is a race between writing to a userspace-owned page and reading
from a userspace-owned page.

This kind of pattern should be fairly trivial to trigger: If userspace
tells the kernel to read from a GUP'd page or pagecache on one thread,
and simultaneously tells the kernel to write to the same page on
another thread, we'll get a data race. This is not really a kernel
data race; it is more like a userspace race whose memory accesses
happen to go through the kernel.

So I think the fix would be for KCSAN to ignore anything in such
pages. The hard part is, I'm not sure how to tell what kind of page
we're dealing with from the kernel, some MM people might know...
distinguishing normal pagecache/anon pages from other pages might be
doable, but I guess it probably gets hard when thinking about
driver-allocated pages that were mapped into userspace vs
driver-allocated pages that are used internally in the driver...

> read to 0xffff88811d47e000 of 2048 bytes by task 37 on cpu 0:
>  memcpy_from_iter lib/iov_iter.c:73 [inline]
>  iterate_bvec include/linux/iov_iter.h:123 [inline]
>  iterate_and_advance2 include/linux/iov_iter.h:304 [inline]
>  iterate_and_advance include/linux/iov_iter.h:328 [inline]
>  __copy_from_iter lib/iov_iter.c:249 [inline]
>  copy_page_from_iter_atomic+0x77f/0xff0 lib/iov_iter.c:483
>  copy_folio_from_iter_atomic include/linux/uio.h:210 [inline]
>  generic_perform_write+0x2c2/0x490 mm/filemap.c:4121
>  shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3464
>  lo_rw_aio+0x5f7/0x7c0 drivers/block/loop.c:-1
>  do_req_filebacked drivers/block/loop.c:-1 [inline]
>  loop_handle_cmd drivers/block/loop.c:1866 [inline]
>  loop_process_work+0x52d/0xa60 drivers/block/loop.c:1901
>  loop_workfn+0x31/0x40 drivers/block/loop.c:1925
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0x4cb/0x9d0 kernel/workqueue.c:3319
>  worker_thread+0x582/0x770 kernel/workqueue.c:3400
>  kthread+0x486/0x510 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> write to 0xffff88811d47e018 of 4072 bytes by task 4432 on cpu 1:
>  zero_user_segments include/linux/highmem.h:278 [inline]
>  folio_zero_segment include/linux/highmem.h:635 [inline]
>  pagecache_isize_extended+0x26f/0x340 mm/truncate.c:850
>  ext4_alloc_file_blocks+0x4ad/0x720 fs/ext4/extents.c:4545
>  ext4_do_fallocate fs/ext4/extents.c:4694 [inline]
>  ext4_fallocate+0x2b8/0x660 fs/ext4/extents.c:4750
>  vfs_fallocate+0x410/0x450 fs/open.c:338
>  ksys_fallocate fs/open.c:362 [inline]
>  __do_sys_fallocate fs/open.c:367 [inline]
>  __se_sys_fallocate fs/open.c:365 [inline]
>  __x64_sys_fallocate+0x7a/0xd0 fs/open.c:365
>  x64_sys_call+0x2b88/0x2fb0 arch/x86/include/generated/asm/syscalls_64.h:=
286
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
