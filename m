Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436777DA9C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086144; cv=none; b=gSXBlTv2nRDMWvD4MZHJ73u/pdq+9bWsxFiLR1XN13sCd1idhQPAR5DqcHxqKfrIVc5Z+k62Uxsf04kIHXPCh5QZcvt1m2DB77AglAPiu1ZRuLpt3uxfWh0gKTZxjljz8GB/kRY3VbnA5BHML+V2yoqsheG5wmFtSQJsQLBfOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086144; c=relaxed/simple;
	bh=GYMg85uC4AdKSm2Eiqazm43c0gUd12jPdjvb3RaZyjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmvAewKClioHhavsvY11t/wgxyZeIlolw2vii26Low164IRc31AJy6WbrkM/uWfvuKc6cRXE5baxUPmWb9D/Ha7f+RYTx+e5b6H4berwx3QDvsS/yqEXgqvSWrdCTlkDlBjHW+ebhzG3zvLenfw2nNPXhW1SgtyBDgz/tm+Cw8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQo1xYk5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQo1xYk5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ddb35583so591605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 18:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749086140; x=1749690940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=;
        b=FQo1xYk5cJB2CBkpmKq2svtuRG2FL69VeELuTW6YZCMORJAyP4cRyvNm5iYMNwiUs7
         2k9BlrrnDds1O49nzgs7SdXRS0K51y3xVoEhOIFZmfdDARYAeOpaFLav0wlRhW/60jcS
         t3D/TuTekfujkB4XxcTf+tVuZbjHx3OjH7Xpr/6ug4wwmSWcQMhuKWkmY3b9Av1si6pD
         vQ1tr2GRZIw/s+VtRXfcc5NHS5rFfPVKSjXKwMRgVkL9FnmSExo4v0ykrjWKoQyUzvFe
         zd7fN06v2uIsMkmS2HScEgBMq+3eGUDAREbne7/Mx+Cyehybs9rdpOHua0mZ9rC1zorI
         uSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749086140; x=1749690940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=;
        b=maPJBSTs3sH5LlPCCmIZ+XUHFfwkcOqbSRKPMYRj79oYm7q1GpcfUZV2/U0c8llj8Q
         YrXYPDVLHER74PlPG+Sgfk6frZwn98Xfd67fOMhAjyQNwRT80R9o/iFaH8aHoNJ6p3aZ
         A2RJOObfuIJHipXnVShtv8oSuzIIWllQn2mAQlfGvqhMRloL9Ue2/jYXU4cl8Iq0G7Vm
         14XFFZv8ZAfiEuNBgm4E7aTNpTG92kGbCuMUcWp838PIzjotJfLi33p7HQMHECFI9m9m
         +jObSYjLgy6yLz9XO3UbKXi8bQdjEKXozfpbu9IhIiIrDaXcl4yjTiZ45z5u9vq3iK4o
         3ORg==
X-Forwarded-Encrypted: i=1; AJvYcCUDrKeF+mO8XY9W0dkXIwbZjXQ/paTdI9MtTEHYf+BDzN+rEeIKSrQBpPA/e1UBloJs8HvePvi9PNYaqUs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw75f570TOFFz1fvsSXlog4/O3SSDr05ZZmxLBLQsxfCwhuQuo
	zkSnNexGakwOZt8i0cHb4xjG/OGE/gIhMd22SFXDmMfPSRbRt+oKQNSS/fBXznNHCwCi274eJzH
	k5BIgUnxptq8j29NdknuLarsmEqPh9t3+P5K0
X-Gm-Gg: ASbGnctIQoW/R6hWGxgmlyL0cB4ceP7MRJ0hJ2OC7cYWfT8ZPIorj0t4UbIL9WkyB0B
	8JK5WXI8GkEy3/qKVSbUqL13tflG8RV4BYXh3VvtTTZtZQ3HhlRPos7MiBR18ma8SXxk9WZANHo
	fjY0O6LWvAc/rE4dgTe+ITXPl1OnN8Gsk0ZA==
X-Google-Smtp-Source: AGHT+IFOv3cxIGhg6XydehDxtKJHQb0TYHVmegO4c/fhHhapPb0fBZJ0JyDbC9mtlVtiDtD9Aa2MNoxVJIGq7SFc/r8=
X-Received: by 2002:a05:600c:8b23:b0:450:d5ed:3c20 with SMTP id
 5b1f17b1804b1-451f0b33452mr16474005e9.6.1749086140318; Wed, 04 Jun 2025
 18:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604085700.2454694-1-chao@kernel.org>
In-Reply-To: <20250604085700.2454694-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 09:15:29 +0800
X-Gm-Features: AX0GCFunATjmE-Apl3YtLj-4r7yYwysLxV6JvJRBuEX71CccePVVeXbo7AjYETA
Message-ID: <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to zero post-eof page
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B46=E6=9C=884=E6=97=A5=E5=91=A8=E4=B8=89 17:01=E5=86=99=
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
> The root cause is user can update post-eof page via mmap, however, f2fs m=
issed
> to zero post-eof page in below operations, so, once it expands i_size, th=
en it
> will include dummy data locates previous post-eof page, so during below
> operations, we need to zero post-eof page.
>
> Operations which can include dummy data after previous i_size after expan=
ding
> i_size:
> - write
> - mapwrite
> - truncate
> - fallocate
>  * preallocate
>  * zero_range
>  * insert_range
>  * collapse_range
> - clone_range (doesn=E2=80=99t support in f2fs)
> - copy_range (doesn=E2=80=99t support in f2fs)
>
> Cc: stable@kernel.org
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - cover f2fs_zero_post_eof_page w/ invalidate_lock
>  fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f2a8..ee5e662d2a4c 100644
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
> +       if (old_size > new_size)
Hi Chao,
should it be old_size >=3D new_size?

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
> +                       f2fs_zero_post_eof_page(inode, old_size);
I'm a little suspicious about the logic here=EF=BC=8C here old_size is from
i_size_read(inode),
and it will compare with the "old_size" in f2fs_zero_post_eof_page, it
is also from i_size_read(inode),
so is this actually meaningless?
Thanks!
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
