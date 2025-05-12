Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00975298261
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074799; cv=none; b=VVz6a8vf3Baaa5dG6R2qj6bpU9rLdqzpJVVjcL3Ed5oC3MJVPND5AGcQ7t/zgb+P/cM41YG4tGcYs9S7k26uuzvxY2x3LaBqkggSOXD7SgQnTwridrIMECFJcvj6tb5gaf0312KyqDqE/YifLiVKNOGtLGHpHRQJmhAl+sRigKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074799; c=relaxed/simple;
	bh=Jfr+rPTF9YEL6CXsRLZkDVbD7zeE5o9vHdvBe29mjQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQJQ68DP54At8jQCr0POsSE99+XsVJPt2mmAAOWcrzJRNKswmD/M1cw1xACJz/eYFJPbqcl2Q0q7oNNjH1h861Bsx0sFw8v5wzWLVruUhuD+x85N6E2nitHwmjH7xvmWX9GGvKC3xcmdyyO9hs/hI0ukuwSYBC1EWjtUJ5AkUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dFz9Usrl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dFz9Usrl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1782a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747074794; x=1747679594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3p3BzNnsNOsVRctsx25cVwnAL8OxJuAKNOd3s8OQK4=;
        b=dFz9Usrlk6W0+4FfXN6+pCYVOjinjywuZ09QGRwLnyyNK3ZEyoZ68tT6j5iW0pps9y
         ercBWsyltBRjwGlivCDYfbjlPWnViU0OxYQEzKsr7DOETQ9HuHK80RwHnHvKuBCVQ7UO
         8NE9NQTCfrPzglw8S7/ZRdM9nHKb4YRzkYqinrxfqxQ2jUomP1mlduwhUFtusHS0PW9r
         TCu7P/sE7TEHNVZ5xWYS3cErV0kxUouEdumkMCsu278UpdNKxh9pu6UXz88m8VgSGp6K
         gxLBo+JfEC0oR8mbl+lsR+O7drKwjLnhbOj7UxiZA34FBO93uu+3RLSw6lxByB1azAWt
         LPxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074794; x=1747679594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3p3BzNnsNOsVRctsx25cVwnAL8OxJuAKNOd3s8OQK4=;
        b=KRSOg0dAbltp+eYvCp9mmB7gernvKBYr4KD5R01g+FGIrbv8UCf4tWcpD0p8POfCRP
         gFrafTynKZ5qo22xe/aRrRfV/lxfA+Pr8D3fNf8AgquaUqPmf4q5dagVeHezBC2qRkga
         faAkSDx0XXjAdL16Q2sVpt8wzEj4TY9N9T0nhXBxIuuoXHDFM/KUZJ9zyaynndiJ7Xgq
         RbVyiwAIvaRL75yeXb6/jnnLZBbaKrH03oKVv1NvisaRnpkLCWNiJqTEOZFAkj6sL6f4
         a3Q6Z58ARJHkS51LS5EZDeQY+oqMLHt6k0P7AQHfOEftKLLJINWCXv9mfhZWFoYmMD3f
         2Kpw==
X-Forwarded-Encrypted: i=1; AJvYcCVVSGYqjLvvlS00BC6D/1Y3qoAMTidSl+y0TgFnew2YBFH20+kmp44dDzEugc1/4ei0NvPmFzBXhhIDIJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyupe9hGAwvo332s3aiV8cl/imayOqNcWaGnpwlMUeVbsrVEvw9
	fWt50ca6a0lGjP2NyjRXuTLDYpa8wEfC4YI9/Wuh3Hg6g/r2xT/kpVoDyLRQl6Fof53WiWlcevA
	jY/O2E6YCFsPQaBaE5Oofv/QyQcr1807P+abNrf5b
X-Gm-Gg: ASbGncsDH/briQ0dGmjSHd9fd9xoUuYXFPEe5X95QZ/jzWHHtfsT/xIgNoNd7Z72eSc
	TWU/PMgo/Te+1cAkaHgHe0hFbWYILligeboozuDWEUw8uDi86JGB69zr97c+4qiKHtG0zQ4HcLH
	JDTyDfqqDzl2RmFZgN1hTauqEx1+wFcaaqUhFCXVAj3qDJkntUgMEcu8mk1pI=
X-Google-Smtp-Source: AGHT+IFdiDpC7ixGH7SkseAzHJ3JVL3BGJru908mNuJ0aTnwNHxNi+WZFqYvXJP8Y9CtGHbMSokBExFJQL+IShP4N3c=
X-Received: by 2002:aa7:c487:0:b0:5fb:eab6:cdb0 with SMTP id
 4fb4d7f45d1cf-5ff356e3dd6mr10105a12.4.1747074793804; Mon, 12 May 2025
 11:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6819bfbb.050a0220.a19a9.0007.GAE@google.com> <CAG48ez2pOt_Zf28CnLbVCzo1uBhWfqUjgh4fzDaQo+qceM6kSQ@mail.gmail.com>
In-Reply-To: <CAG48ez2pOt_Zf28CnLbVCzo1uBhWfqUjgh4fzDaQo+qceM6kSQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 12 May 2025 20:32:37 +0200
X-Gm-Features: AX0GCFuNzImgrwkQ8XRKQ84YMx3R5FRAZw32CIxRTGh4nx36LK_p_qKSG8M7NiE
Message-ID: <CAG48ez1BGFn7jw+FYZJxRyyjnR+rrqx1AtNQoR_Jup3tZ-dADQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_extended
To: syzkaller <syzkaller@googlegroups.com>, 
	syzbot <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 7:44=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Tue, May 6, 2025 at 9:52=E2=80=AFAM syzbot
> <syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com> wrote:
> > HEAD commit:    01f95500a162 Merge tag 'uml-for-linux-6.15-rc6' of git:=
//g..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D17abbb68580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6154604431d=
9aaf9
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D189d4742d07e9=
37d68ea
> > compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89=
dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> [...]
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+189d4742d07e937d68ea@syzkaller.appspotmail.com
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KCSAN: data-race in copy_page_from_iter_atomic / pagecache_isize_e=
xtended
>
> I think this is a problem with the KCSAN implementation.
>
> This is a race between writing to a userspace-owned page and reading
> from a userspace-owned page.
>
> This kind of pattern should be fairly trivial to trigger: If userspace
> tells the kernel to read from a GUP'd page or pagecache on one thread,
> and simultaneously tells the kernel to write to the same page on
> another thread, we'll get a data race. This is not really a kernel
> data race; it is more like a userspace race whose memory accesses
> happen to go through the kernel.
>
> So I think the fix would be for KCSAN to ignore anything in such
> pages. The hard part is, I'm not sure how to tell what kind of page
> we're dealing with from the kernel, some MM people might know...

Or alternatively, if we really do want data_race() operations around
any memset() or memcpy() on userspace-controlled pages, I guess we'd
have to pepper a lot of those around the kernel.

Also, I didn't really think about some of what I wrote here - we
certainly wouldn't want to ignore unannotated accesses to some struct
located in pagecache that userspace can concurrently write to.

Maybe it would actually make sense to do the opposite of what I said
to some extent, special-case userspace-mapped pages such that KCSAN
_always_ alerts on plain access to them...

> distinguishing normal pagecache/anon pages from other pages might be
> doable, but I guess it probably gets hard when thinking about
> driver-allocated pages that were mapped into userspace vs
> driver-allocated pages that are used internally in the driver...


> > read to 0xffff88811d47e000 of 2048 bytes by task 37 on cpu 0:
> >  memcpy_from_iter lib/iov_iter.c:73 [inline]
> >  iterate_bvec include/linux/iov_iter.h:123 [inline]
> >  iterate_and_advance2 include/linux/iov_iter.h:304 [inline]
> >  iterate_and_advance include/linux/iov_iter.h:328 [inline]
> >  __copy_from_iter lib/iov_iter.c:249 [inline]
> >  copy_page_from_iter_atomic+0x77f/0xff0 lib/iov_iter.c:483
> >  copy_folio_from_iter_atomic include/linux/uio.h:210 [inline]
> >  generic_perform_write+0x2c2/0x490 mm/filemap.c:4121
> >  shmem_file_write_iter+0xc5/0xf0 mm/shmem.c:3464
> >  lo_rw_aio+0x5f7/0x7c0 drivers/block/loop.c:-1
> >  do_req_filebacked drivers/block/loop.c:-1 [inline]
> >  loop_handle_cmd drivers/block/loop.c:1866 [inline]
> >  loop_process_work+0x52d/0xa60 drivers/block/loop.c:1901
> >  loop_workfn+0x31/0x40 drivers/block/loop.c:1925
> >  process_one_work kernel/workqueue.c:3238 [inline]
> >  process_scheduled_works+0x4cb/0x9d0 kernel/workqueue.c:3319
> >  worker_thread+0x582/0x770 kernel/workqueue.c:3400
> >  kthread+0x486/0x510 kernel/kthread.c:464
> >  ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >
> > write to 0xffff88811d47e018 of 4072 bytes by task 4432 on cpu 1:
> >  zero_user_segments include/linux/highmem.h:278 [inline]
> >  folio_zero_segment include/linux/highmem.h:635 [inline]
> >  pagecache_isize_extended+0x26f/0x340 mm/truncate.c:850
> >  ext4_alloc_file_blocks+0x4ad/0x720 fs/ext4/extents.c:4545
> >  ext4_do_fallocate fs/ext4/extents.c:4694 [inline]
> >  ext4_fallocate+0x2b8/0x660 fs/ext4/extents.c:4750
> >  vfs_fallocate+0x410/0x450 fs/open.c:338
> >  ksys_fallocate fs/open.c:362 [inline]
> >  __do_sys_fallocate fs/open.c:367 [inline]
> >  __se_sys_fallocate fs/open.c:365 [inline]
> >  __x64_sys_fallocate+0x7a/0xd0 fs/open.c:365
> >  x64_sys_call+0x2b88/0x2fb0 arch/x86/include/generated/asm/syscalls_64.=
h:286
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xd0/0x1a0 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
