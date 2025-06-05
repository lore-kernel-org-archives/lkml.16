Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B721136E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096481; cv=none; b=apCXsN/Uu4OrFA8cznRdjtP28tnDQ54kV0G6jUlVRXjmhvJH1GSifetcg0yD0qI4eFemzFWpGkyczv9jHWCprxl1qU1rfo+B9rRyEn/EPnQmuaoZEecP/hPsgps1RwjIIxirzs/o5nk69YFmBQObmhnlDEXBP1/OzhPktCKcrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096481; c=relaxed/simple;
	bh=JlZa1MR3jqRKxiFr4tenQ3861maa561Y0IEGxPqSOQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsz5yMGGizSOyUVZdXs0VgGZdB6kq+Z9+n2yh7EWGKkd9aUHt70lo0WIPn7SR5T57303BDdtZX4GxOPZjED1x8xtzgche3LXu9+iXAmKquEOdPv82ToMk7JnP7LsshhxH9F27IB2S8/RfGiJKdvF8E6TmQslnZgd0n/BBobb36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UI2nK91j; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UI2nK91j"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so70101f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749096478; x=1749701278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=;
        b=UI2nK91jNhT3GAH6zFkxdkHfzxRw49msTpfjsPQEmzFq69OdFDzvI18snk/Eg3SDYb
         M2/IoJEMmTRg2CLRwM1rWmmxtOHMzyWjzePqNsD7ktVRvMP6c6V/DqAy59uAopb8oHFa
         qw7EGx/k2FbDA5GXn+1DYqKhyZdLdCE3sVwVd+gMQkSVhvLwpwB6OS2zB7UbagB4qwvf
         uTaMmndVccDmTKD+Mi0im+w0EHCF1aUTzuNHdfkkk/TFnySxyGkYn+mSLDXohRbJfYQ4
         eHUlRmL/12BrDSBNZFmnjgrkwHLDQJ+XqRRCOQx/J3OO1THe1ighQ+wP89so+1JgzP4j
         ZUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096478; x=1749701278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJhyl/czqq/y4sUsvxlz8289DMHwxFEsMSCXaocVBpY=;
        b=Xg3eEQSEwwx0hTnjZ5ZMnXBFNKSo9/uWf+xNCdPh6dqHauJGpT4VOqecpKQv0lUh2E
         lgTdLHJVfBO7F7P/HnAfzjx7eBOsXLXx481dyv7Mzv7NUsH2VVOcs99MO4sXpWfNNYv4
         IuSd53LkCR+9TfdB2vxz+7+LZigFK1m4xaWsT2s4NbaKScLlJ1AEDbMkypidpDLih52Z
         z+Z5XTmnvxmxyP585JxjZXGGHKb/C0OQo8tSOL1+MTKjWrS3axHFtVFZ3Y9m7W7uO1Ab
         bCWGeoEmuwAMaj1poqoe8MDNJdFsN96gGJTpzedPlzSgPtp4ssWwDuVahqq+b6i63ZXf
         RzXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhERcFd3p7iEu1IYMGhshSeG2+tLlnixNUJuxzNAKLeZoPAW5ajyjfRrSDXU1jkvVi6a5zngY3qfz9x/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsT3/BPNUKfC+p+Y3MN5Qw9KUXIvg4K2yDeaGRa2BeFhkl+deO
	t79nRpevgUPfpJMP8TFw2Y10pcGkBG5p9Z8PNJ/bpIL1T6Z/8+MnbVK+XVQ+npQXCfGR28UnQe0
	HHBWp5LsNw4fYbxx0BkajBa8VKleqcnk=
X-Gm-Gg: ASbGncuOqCvZQPwvN4iz/llmp60n3WR2SJ+sAX/CldA2/6NQOD0gsWj/MrkcsbR+8PA
	RM9XuYnyIXOaZbdd5crhZqMcTPjPSRQ/vlp++OmGac/OelcFGNTs3YoJCEcExXjfL5F2x7DPZna
	CKtsjSA2uZ9EcMp05/GXGK7buRZEIoIahAlg==
X-Google-Smtp-Source: AGHT+IEmSPI8KqN59ZHEnT3BHsvJbXgMvTKfY3B5/UO28d/mt5dsmTQN6OMmkCQtPB+7dk8uSTqbIiCnW/RzrE4TtXw=
X-Received: by 2002:a05:600c:1382:b0:439:9a40:aa1a with SMTP id
 5b1f17b1804b1-451f0b27b92mr16707885e9.6.1749096477341; Wed, 04 Jun 2025
 21:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605032633.2744434-1-chao@kernel.org>
In-Reply-To: <20250605032633.2744434-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 12:07:46 +0800
X-Gm-Features: AX0GCFvpfdoBjZVRPiDxdtYK7pUi7tY4Ahdm2d2v_lWBBaFvMYKpaLHo_lYMFKs
Message-ID: <CAHJ8P3KmB+TocruTThpTe-YE3LH-uZ7_w_GrHqSV0B-PWwwMjg@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to zero post-eof page
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B46=E6=9C=885=E6=97=A5=E5=91=A8=E5=9B=9B 11:29=E5=86=99=
=E9=81=93=EF=BC=9A
>
> fstest reports a f2fs bug:
>
> generic/363 42s ... [failed, exit status 1]- output mismatch (see /share/=
git/fstests/results//generic/363.out.bad)
>     --- tests/generic/363.out   2025-01-12 21:57:40.271440542 +0800
>     +++ /share/git/fstests/results//generic/363.out.bad 2025-05-19 19:55:=
58.000000000 +0800
>     @@ -1,2 +1,78 @@
>      QA output created by 363
>      fsx -q -S 0 -e 1 -N 100000
>     +READ BAD DATA: offset =3D 0xd6fb, size =3D 0xf044, fname =3D /mnt/f2=
fs/junk
>     +OFFSET      GOOD    BAD     RANGE
>     +0x1540d     0x0000  0x2a25  0x0
>     +operation# (mod 256) for the bad data may be 37
>     +0x1540e     0x0000  0x2527  0x1
>     ...
>     (Run 'diff -u /share/git/fstests/tests/generic/363.out /share/git/fst=
ests/results//generic/363.out.bad'  to see the entire diff)
> Ran: generic/363
> Failures: generic/363
> Failed 1 of 1 tests
>
> The root cause is user can update post-eof page via mmap [1], however, f2=
fs
> missed to zero post-eof page in below operations, so, once it expands i_s=
ize,
> then it will include dummy data locates previous post-eof page, so during
> below operations, we need to zero post-eof page.
>
> Operations which can include dummy data after previous i_size after expan=
ding
> i_size:
> - write
> - mapwrite [1]
> - truncate
> - fallocate
>  * preallocate
>  * zero_range
>  * insert_range
>  * collapse_range
> - clone_range (doesn=E2=80=99t support in f2fs)
> - copy_range (doesn=E2=80=99t support in f2fs)
>
> [1] https://man7.org/linux/man-pages/man2/mmap.2.html 'BUG section'
>
> Cc: stable@kernel.org
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Thanks!
> ---
> v3:
> - fix check condition in f2fs_zero_post_eof_page()
> - fix wrong parameter passed from f2fs_setattr() to
> - add a reference
> f2fs_zero_post_eof_page()
>  fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f2a8..696131e655ed 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -35,6 +35,17 @@
>  #include <trace/events/f2fs.h>
>  #include <uapi/linux/f2fs.h>
>
> +static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size=
)
> +{
> +       loff_t old_size =3D i_size_read(inode);
> +
> +       if (old_size >=3D new_size)
> +               return;
> +
> +       /* zero or drop pages only in range of [old_size, new_size] */
> +       truncate_pagecache(inode, old_size);
> +}
> +
>  static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>  {
>         struct inode *inode =3D file_inode(vmf->vma->vm_file);
> @@ -103,8 +114,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fau=
lt *vmf)
>
>         f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>
> +       filemap_invalidate_lock(inode->i_mapping);
> +       f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT);
> +       filemap_invalidate_unlock(inode->i_mapping);
> +
>         file_update_time(vmf->vma->vm_file);
>         filemap_invalidate_lock_shared(inode->i_mapping);
> +
>         folio_lock(folio);
>         if (unlikely(folio->mapping !=3D inode->i_mapping ||
>                         folio_pos(folio) > i_size_read(inode) ||
> @@ -1109,6 +1125,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>                 f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>                 filemap_invalidate_lock(inode->i_mapping);
>
> +               if (attr->ia_size > old_size)
> +                       f2fs_zero_post_eof_page(inode, attr->ia_size);
>                 truncate_setsize(inode, attr->ia_size);
>
>                 if (attr->ia_size <=3D old_size)
> @@ -1227,6 +1245,10 @@ static int f2fs_punch_hole(struct inode *inode, lo=
ff_t offset, loff_t len)
>         if (ret)
>                 return ret;
>
> +       filemap_invalidate_lock(inode->i_mapping);
> +       f2fs_zero_post_eof_page(inode, offset + len);
> +       filemap_invalidate_unlock(inode->i_mapping);
> +
>         pg_start =3D ((unsigned long long) offset) >> PAGE_SHIFT;
>         pg_end =3D ((unsigned long long) offset + len) >> PAGE_SHIFT;
>
> @@ -1510,6 +1532,8 @@ static int f2fs_do_collapse(struct inode *inode, lo=
ff_t offset, loff_t len)
>         f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>         filemap_invalidate_lock(inode->i_mapping);
>
> +       f2fs_zero_post_eof_page(inode, offset + len);
> +
>         f2fs_lock_op(sbi);
>         f2fs_drop_extent_tree(inode);
>         truncate_pagecache(inode, offset);
> @@ -1631,6 +1655,10 @@ static int f2fs_zero_range(struct inode *inode, lo=
ff_t offset, loff_t len,
>         if (ret)
>                 return ret;
>
> +       filemap_invalidate_lock(mapping);
> +       f2fs_zero_post_eof_page(inode, offset + len);
> +       filemap_invalidate_unlock(mapping);
> +
>         pg_start =3D ((unsigned long long) offset) >> PAGE_SHIFT;
>         pg_end =3D ((unsigned long long) offset + len) >> PAGE_SHIFT;
>
> @@ -1762,6 +1790,8 @@ static int f2fs_insert_range(struct inode *inode, l=
off_t offset, loff_t len)
>         /* avoid gc operation during block exchange */
>         f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>         filemap_invalidate_lock(mapping);
> +
> +       f2fs_zero_post_eof_page(inode, offset + len);
>         truncate_pagecache(inode, offset);
>
>         while (!ret && idx > pg_start) {
> @@ -1819,6 +1849,10 @@ static int f2fs_expand_inode_data(struct inode *in=
ode, loff_t offset,
>         if (err)
>                 return err;
>
> +       filemap_invalidate_lock(inode->i_mapping);
> +       f2fs_zero_post_eof_page(inode, offset + len);
> +       filemap_invalidate_unlock(inode->i_mapping);
> +
>         f2fs_balance_fs(sbi, true);
>
>         pg_start =3D ((unsigned long long)offset) >> PAGE_SHIFT;
> @@ -4860,6 +4894,10 @@ static ssize_t f2fs_write_checks(struct kiocb *ioc=
b, struct iov_iter *from)
>         err =3D file_modified(file);
>         if (err)
>                 return err;
> +
> +       filemap_invalidate_lock(inode->i_mapping);
> +       f2fs_zero_post_eof_page(inode, iocb->ki_pos + iov_iter_count(from=
));
> +       filemap_invalidate_unlock(inode->i_mapping);
>         return count;
>  }
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
