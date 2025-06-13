Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AB3272809
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803163; cv=none; b=fI2SxZ5yImuNvbKFk+gxX4w27d9DEfLreXRuBg7iscjOWz17ZT7N8JdYGqJfyNhCRb8yK5z8absxZmEZEVSbpyEXH8DP/eCyvZvTxnyujHlObJcIS5UgEOhZGANUid//azGYtXqwKxXyCfTTfJ6mnRzoYvTGk5wXJg/UNjy/OY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803163; c=relaxed/simple;
	bh=CQHtbRddVHdiYqQgBqNDsuo0eE1o6GB+Zmr8xkLw3VE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R33txK+EIsBZheOnYV6Kvt7psOjCzAm7rB33THtOwkaAc0Da/3oI8gQEdXnPbbrvayPEQwMEb1Wuqoc5h4cEZUsrpgqHuPkEpCqfQ2IFOx4UIVQDdWIzSuGEm/wrGJIrNSSXGgP11M7QVd8ldLyDU7humShI4x2bQxQkaXEsiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3SWmCwi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3SWmCwi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso131401f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803159; x=1750407959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=;
        b=e3SWmCwitZxWFi1ossYbUibcvDGmzzOvXrUhtk7bolKkLcWsIySoeaCG3YaZAo69kJ
         wBF0A3+6jy1u41MkWJjwtXbSKezCEgQ4E+PkudmCu6VxJHRUlEjV0CtIoXmrYstOqGPq
         FL5N3GbG456vvVPjS/8oB3OjaEUE3MBk+4RVWA+laWH0gf5gq0+omujP9SVa5VXP9XHu
         W1739yWMV7Lw2ytPNJa8/JcuRzWEgn5qUGGgj0DSX1TB+MC9t4VmUBgqWF2dC0pDaBJT
         uosN3KQDn4DnyzSn5O3ODi2MPnOOfuzLUS0jKp8T0QpToz1egOZWVIOCatyG2UOx/Hf0
         xliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803159; x=1750407959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHH36GXGqix57B9/OvcMWpHmSiwmsvkt8HsllgPW6sI=;
        b=jJiSYmd7MG/C0ig4HUS1yBNAbZKJ62yZdeNvClR0mYU8Bm+ifI2Yzo67Tq0QczZLn2
         zrJO59AqAkenqExSe0HMzSvlmD9+yL8WER9I521qMXJ+JSEwNC5QFbhwhtQ760Zr99Sv
         1VCtE4oCQHtXCFs6Qnv1CZqVEULyjqvYTV9iokSWCRQtE99uUcJ5HQFBQXjnI1ppzeiW
         tNfwUo7uK7szH7H7LQPb8VoQ2he17pqbo2Vjpt6sNFGc8zyPFAY8SOXtsE3Hpwa5V5Ih
         Q9jsNz+e5syiSjOjh2xTtWZ6w7uHqQ1xvLIoXXIQk/pEEBOhIQw1SK1ri3rn+GQ8QFe5
         ouEg==
X-Forwarded-Encrypted: i=1; AJvYcCXgv4/G8xno1H3VQEJKlIwChmh3SdzhvahhXjwti5E7Kge3aXuNUQNG9fLZhidtl1OsC6rPqg3G+zxHFhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHBrxOuIUBWiE47loVDo2Vdxv1IU4ITIWhHt3Zjxxe8s7gmYs
	voJsaXhfKrSVFM1WGC94sh4IpYV72zbw1th588jpBgUGDZcUbIaOmI22919miCfxwvw4AkRete/
	rzrqdN+O6eMVM2rqFM/fhB5lsx4p0/U8=
X-Gm-Gg: ASbGncvtFlBN8tccwurftS7IC7isKDzzr9qpD4QxOFgEU/Abg4Rz0/7vGfE6a/8xJqg
	RwVYxl9ZXVqX/cGEWv9luTPn9euRXKcxH02CCUEciuXUv13VSjuZXSnuoKMUyIoj8+OLy9jhh+m
	muHO+S+UxpReyjOPYT0zkHzzb9YWSYsRkIv64OukvbNN8D
X-Google-Smtp-Source: AGHT+IGEecZKdUrI4TPXWcW0ROqZszFyPMmn7YKGv8m8nGY5NZX4FtUA3aY7KOWD8zMGZqMAmw0CdLNPjLgipDDD6mc=
X-Received: by 2002:a5d:5f8f:0:b0:3a4:d4a0:1315 with SMTP id
 ffacd0b85a97d-3a56869d570mr771547f8f.6.1749803158868; Fri, 13 Jun 2025
 01:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f1b9209e-c2fb-4a53-8d15-a3e42dea8bca@kernel.org> <20250612123444.1779509-1-wangzijie1@honor.com>
In-Reply-To: <20250612123444.1779509-1-wangzijie1@honor.com>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 13 Jun 2025 16:25:47 +0800
X-Gm-Features: AX0GCFsVSnrsE293JjoIJZ4IbML9sSsMb82uoVfJnJkHnNN0Qp0HRhEhyEf5fq0
Message-ID: <CAHJ8P3LSxzSbdz_ONUKy8dyDjLGsNJ08Aq724CUwYdOJ=m_2eA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: continue to allocate pinned section when
 gc happens EAGAIN
To: wangzijie <wangzijie1@honor.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, feng.han@honor.com, 
	linux-kernel@vger.kernel.org, bo.wu@vivo.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wangzijie <wangzijie1@honor.com> =E4=BA=8E2025=E5=B9=B46=E6=9C=8812=E6=97=
=A5=E5=91=A8=E5=9B=9B 20:38=E5=86=99=E9=81=93=EF=BC=9A
>
> > On 6/12/25 11:27, wangzijie wrote:
> > > Wu Bo once mentioned a fallocate fail scenario in this link[1].
> > > After commit 3fdd89b452c2("f2fs: prevent writing without fallocate()
> > > for pinned files"), we cannot directly generate 4K size file and
> > > pin it, but we can still generate non-segment aligned pinned file:
> > >
> > > touch test_file
> > > ./f2fs_io pinfile set test_file
> > > ./f2fs_io fallocate 0 0 8192 test_file
> > > truncate -s 4096 test_file
> >
> > Well, shouldn't we avoid such case by adding check condition in setattr=
?
>
> Maybe like this?
>
> ---
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..2f6537d9c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1027,6 +1027,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct de=
ntry *dentry,
>         struct inode *inode =3D d_inode(dentry);
>         struct f2fs_inode_info *fi =3D F2FS_I(inode);
>         int err;
> +       struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> +       block_t sec_blks =3D CAP_BLKS_PER_SEC(sbi);
>
>         if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>                 return -EIO;
> @@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct d=
entry *dentry,
>                         !IS_ALIGNED(attr->ia_size,
>                         F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>                         return -EINVAL;
> +               if (f2fs_is_pinned_file(inode) &&
> +                       attr->ia_size < i_size_read(inode) &&
> +                       !IS_ALIGNED(attr->ia_size,
> +                       F2FS_BLK_TO_BYTES(sec_blks)));
> +                       return -EINVAL;
Hi Chao and zijie,
Excuse me ,I'm a bit confused about this:
when a pin file size is not alinged with size of "section", it can not
be truncated?
thanks=EF=BC=81
>         }
>
>         err =3D setattr_prepare(idmap, dentry, attr);
> ---
>
> > >
> > > By doing this, pin+fallocate failure(gc happens EAGAIN but f2fs shows
> > > enough spare space) may occurs.
> > >
> > > From message in commit 2e42b7f817ac("f2fs: stop allocating pinned sec=
tions
> > > if EAGAIN happens"), gc EAGAIN doesn't guarantee a free section, so w=
e stop
> > > allocating. But after commit 48ea8b200414 ("f2fs: fix to avoid panic =
once
> > > fallocation fails for pinfile"), we have a way to avoid panic caused =
by
> > > concurrent pinfile allocation run out of free section, so I think tha=
t we
> > > can continue to allocate pinned section when gc happens EAGAIN. Even =
if we
> > > don't have free section, f2fs_allocate_pinning_section() can fail wit=
h ENOSPC.
> >
> > What do you think of introduce /sys/fs/f2fs/<dev>/reserved_pin_section =
to
> > tune @needed parameter of has_not_enough_free_secs()? If we configure i=
t
> > w/ zero, it can avoid f2fs_gc() before preallocation.
> >
> > ---
> >  fs/f2fs/f2fs.h  | 3 +++
> >  fs/f2fs/file.c  | 5 ++---
> >  fs/f2fs/super.c | 3 +++
> >  fs/f2fs/sysfs.c | 9 +++++++++
> >  4 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 785537576aa8..ffb15da570d7 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1731,6 +1731,9 @@ struct f2fs_sb_info {
> >       /* for skip statistic */
> >       unsigned long long skipped_gc_rwsem;            /* FG_GC only */
> >
> > +     /* free sections reserved for pinned file */
> > +     unsigned int reserved_pin_section;
> > +
> >       /* threshold for gc trials on pinned files */
> >       unsigned short gc_pin_file_threshold;
> >       struct f2fs_rwsem pin_sem;
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 696131e655ed..a909f79db178 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -1887,9 +1887,8 @@ static int f2fs_expand_inode_data(struct inode *i=
node, loff_t offset,
> >                       }
> >               }
> >
> > -             if (has_not_enough_free_secs(sbi, 0, f2fs_sb_has_blkzoned=
(sbi) ?
> > -                     ZONED_PIN_SEC_REQUIRED_COUNT :
> > -                     GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)=
))) {
> > +             if (has_not_enough_free_secs(sbi, 0,
> > +                             sbi->reserved_pin_section)) {
> >                       f2fs_down_write(&sbi->gc_lock);
> >                       stat_inc_gc_call_count(sbi, FOREGROUND);
> >                       err =3D f2fs_gc(sbi, &gc_control);
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 57adeff5ef25..48b97a95fd63 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -4975,6 +4975,9 @@ static int f2fs_fill_super(struct super_block *sb=
, struct fs_context *fc)
> >       sbi->last_valid_block_count =3D sbi->total_valid_block_count;
> >       sbi->reserved_blocks =3D 0;
> >       sbi->current_reserved_blocks =3D 0;
> > +     sbi->reserved_pin_section =3D f2fs_sb_has_blkzoned(sbi) ?
> > +                     ZONED_PIN_SEC_REQUIRED_COUNT :
> > +                     GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)=
);
> >       limit_reserve_root(sbi);
> >       adjust_unusable_cap_perc(sbi);
> >
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 75134d69a0bd..51be7ffb38c5 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >               return count;
> >       }
> >
> > +     if (!strcmp(a->attr.name, "reserved_pin_section")) {
> > +             if (t > GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)=
))
> > +                     return -EINVAL;
> > +             *ui =3D (unsigned int)t;
> > +             return count;
> > +     }
> > +
> >       *ui =3D (unsigned int)t;
> >
> >       return count;
> > @@ -1130,6 +1137,7 @@ F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec)=
;
> >  F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
> >  #endif
> >  F2FS_SBI_GENERAL_RW_ATTR(carve_out);
> > +F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
> >
> >  /* STAT_INFO ATTR */
> >  #ifdef CONFIG_F2FS_STAT_FS
> > @@ -1323,6 +1331,7 @@ static struct attribute *f2fs_attrs[] =3D {
> >       ATTR_LIST(last_age_weight),
> >       ATTR_LIST(max_read_extent_count),
> >       ATTR_LIST(carve_out),
> > +     ATTR_LIST(reserved_pin_section),
> >       NULL,
> >  };
> >  ATTRIBUTE_GROUPS(f2fs);
> > --
> > 2.49.0
>
> I think it's a good way to solve this problem. Thank you!
>
>
> > >
> > > [1] https://lore.kernel.org/linux-f2fs-devel/20231030094024.263707-1-=
bo.wu@vivo.com/t/#u
> > >
> > > Signed-off-by: wangzijie <wangzijie1@honor.com>
> > > ---
> > >  fs/f2fs/file.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 6bd3de64f..05c80d2b5 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -1859,7 +1859,7 @@ static int f2fs_expand_inode_data(struct inode =
*inode, loff_t offset,
> > >                     f2fs_down_write(&sbi->gc_lock);
> > >                     stat_inc_gc_call_count(sbi, FOREGROUND);
> > >                     err =3D f2fs_gc(sbi, &gc_control);
> > > -                   if (err && err !=3D -ENODATA) {
> > > +                   if (err && err !=3D -ENODATA && err !=3D -EAGAIN)=
 {
> > >                             f2fs_up_write(&sbi->pin_sem);
> > >                             goto out_err;
> > >                     }
> >
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
