Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FFD23ABB5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751324557; cv=none; b=WHMusFqVpU3V7M2ASbaMAw1PAJWzNc5clzgQ55LvA8XQFl7CWyrbor6pcTt+DTdH4v33vdDA+sZW2ieYYgLu48FxzlMns6Ebupj28ntBGB5nmRRK3K2vJ+R7ysStyoX3BTjpIK+uNzm3WaDJcR2a1mLDB2+sFgW2sSLcA/zosMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751324557; c=relaxed/simple;
	bh=hwtZs/WGUT3Y7iYGgULmVMdUiB+5NtljGQeMNYIR6Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kac2RP/fvAQGcIfqW07RA+wDIowCfdZ9mpx5PK8EaLdL/p2GSua/z1AXZHd+lYjRtmco2PjokJLBdVkL3IOSY5cFDlkf8Tgai+n7ol2hpXgCIxbj3MJq6c0o9FqK6UavA7eoQcRwi95ewj6o2O7GMulHxLry1aXcJDBeAK5NU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGXhKyS/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGXhKyS/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so1995a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751324553; x=1751929353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=;
        b=BGXhKyS/XZosubbljqIJiL42QxA4LlXCEBc2xwjP4bgj/cvk1VK8Vw6rKZ4s57er8t
         vnj9rwoDjHm+PcNoNqVP8P5saut0QmqB4GmsMdNsDBFsXuEIvG+Z+YwpRin94Pfihcfm
         oHYKWEcmYsCWym9xUOqZWGoMVE1CNA2PLUf7EnCUlrxO4rMKnx2I0q3rHt9vWfTwoudu
         +xfmfBWY6+6D2bqDBlzSWAf147GjQV7YiC314YUM8+JVBF+kctXBXx35LKzsGg5j+8jV
         vQNl5zR3Q/BKTrQPrkqilLc9avbMNEoGaCVIFodXTQarkpKeyHuPg2m/bxrd6puLYuEo
         gzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751324553; x=1751929353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qLMLP3Ske3Nf/leK3GVL8kkxjqArizAC4Coyy9U/9k=;
        b=YhnGqF4EsaGYSZPkTrU9SCAdR2smXr4IAW2B3OP4o92apcyGAMQ/HnyTmTX24/pKk9
         b2tGQVkazV6HVXCUUBOo5tdtZqkyiy3cxbPhPIF/ArRaet91NTcNtnCvdiU8vtf9qiPT
         2Z9gOVepIQEVlsMK2N7KFkdRyzo1zE9w6bzXqGec3c/K4XKY0akCWr/eoMqJ6Z3mOPqZ
         6j3b2ZovS89lMqkcIxHhc2IninMNiT+4VB2LKejMgdI2yEecalzVfbwmNpUHi4srB+kh
         jF53YXHnye2LnDJqaPVnHhDAFJgSIvS+oU93NbxJQy7Olzrczx77P0n0l+qRUJRawNMg
         LYQw==
X-Forwarded-Encrypted: i=1; AJvYcCWhsNyqx9QH/sp9NhV+FMBJ2g3O0hxvCl6et2Ly1IZAzGZS4xghqZ6WPpdrVETveOTmedsPeQKV0IKdwJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWwdH+rwto0C8xdEvSXJaqo377uwi4aRLz2mmFyLYiMKLr4YU
	jcSkNLLxU9gboE6zurV8ZdoPdxSWYoJ1Z8pNmqHK/0YDeOzmfFLOOnNhZ4GWyrNf2MjgCkcgMyn
	GfawGoRL6TGUQY5ToyPc0AV9E+Ie79NUnEBMxatsAvE/4aIbTQmoBUHyiRlo=
X-Gm-Gg: ASbGncvokyDwnY5K1jZYhwEM2Q8BBU1E15eoUAlvQiBMs8KDpvQvvaUFGXiwArsXWCq
	qKVZWEJWrnzW5NCmwWcRoXdOhQV2+iJK6mY+L8TvyUlXyzy/n9j81Tx2WLC8NtvjNZKV8cus8cm
	sPspZUgLPcqBLuANZQhzBsBsm7YUO+mt0b6aeHpZx9mo06chtUWROiAQH/DYsCTNEsv9W2cA/Ad
	lo8NIMMbrkJ
X-Google-Smtp-Source: AGHT+IFS0q55gmlJO1hey+/BYI7FeaCTIrlOqFtFfHKgmIhIAMpK39dpsalABFCEMDB/+CBiks2Od8jLmmLp43XyJeE=
X-Received: by 2002:a50:fc10:0:b0:607:30a0:12f4 with SMTP id
 4fb4d7f45d1cf-60e38a75510mr3647a12.5.1751324552596; Mon, 30 Jun 2025 16:02:32
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com> <20250615144235.1836469-2-chullee@google.com>
 <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
In-Reply-To: <0f09a845-fbaf-4ddf-b684-a1182f85a9ff@kernel.org>
From: Daniel Lee <chullee@google.com>
Date: Mon, 30 Jun 2025 16:02:20 -0700
X-Gm-Features: Ac12FXyYd5KOlSBFKj1urp028eA0EYYBuMW47qdrBBYTKnM3VCqPKVInYiuw36Y
Message-ID: <CALBjLoDVk976imbZ8-G97jD0aHE2yzL5y-covCmp7V-97aEg6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] f2fs: Apply bio flags to direct I/O
To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:41=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 6/15/25 22:42, Daniel Lee wrote:
> > Bio flags like REQ_PRIO, REQ_META, and REQ_FUA, determined by
> > f2fs_io_flags(), were not being applied to direct I/O (DIO) writes.
> > This meant that DIO writes would not respect filesystem-level hints
> > (for REQ_META/FUA) or inode-level hints (like F2FS_IOPRIO_WRITE).
> >
> > This patch refactors f2fs_io_flags() to use a direct inode pointer
> > instead of deriving it from a page. The function is then called from
> > the DIO write path, ensuring that bio flags are handled consistently
> > for both buffered and DIO writes.
> >
> > Signed-off-by: Daniel Lee <chullee@google.com>
> > ---
> >  fs/f2fs/data.c | 10 +++++-----
> >  fs/f2fs/f2fs.h |  1 +
> >  fs/f2fs/file.c | 11 +++++++++++
> >  3 files changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 31e892842625..71dde494b892 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -416,10 +416,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *=
sbi, block_t blkaddr)
> >       return 0;
> >  }
> >
> > -static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
> > +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)
> >  {
> >       unsigned int temp_mask =3D GENMASK(NR_TEMP_TYPE - 1, 0);
> > -     struct folio *fio_folio =3D page_folio(fio->page);
> >       unsigned int fua_flag, meta_flag, io_flag;
> >       blk_opf_t op_flags =3D 0;
> >
> > @@ -446,8 +445,8 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info =
*fio)
> >       if (BIT(fio->temp) & fua_flag)
> >               op_flags |=3D REQ_FUA;
> >
> > -     if (fio->type =3D=3D DATA &&
> > -         F2FS_I(fio_folio->mapping->host)->ioprio_hint =3D=3D F2FS_IOP=
RIO_WRITE)
> > +     if (inode && fio->type =3D=3D DATA &&
> > +         F2FS_I(inode)->ioprio_hint =3D=3D F2FS_IOPRIO_WRITE)
> >               op_flags |=3D REQ_PRIO;
> >
> >       return op_flags;
> > @@ -459,10 +458,11 @@ static struct bio *__bio_alloc(struct f2fs_io_inf=
o *fio, int npages)
> >       struct block_device *bdev;
> >       sector_t sector;
> >       struct bio *bio;
> > +     struct inode *inode =3D fio->page ? fio->page->mapping->host : NU=
LL;
>
> fio->page will always be true now? We can pass fio->page->mapping->host t=
o f2fs_io_flags()
> directly?
>
> Thanks,

Thanks for the insight. Since fio->page is always non-null here, I'll
remove the unnecessary code.

>
> >
> >       bdev =3D f2fs_target_device(sbi, fio->new_blkaddr, &sector);
> >       bio =3D bio_alloc_bioset(bdev, npages,
> > -                             fio->op | fio->op_flags | f2fs_io_flags(f=
io),
> > +                             fio->op | fio->op_flags | f2fs_io_flags(f=
io, inode),
> >                               GFP_NOIO, &f2fs_bioset);
> >       bio->bi_iter.bi_sector =3D sector;
> >       if (is_read_io(fio->op)) {
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9333a22b9a01..3e02687c1b58 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3972,6 +3972,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *=
fio);
> >  struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
> >               block_t blk_addr, sector_t *sector);
> >  int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr=
);
> > +blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio, struct inode *inode)=
;
> >  void f2fs_set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
> >  void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkadd=
r);
> >  int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 696131e655ed..3eb40d7bf602 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -5015,6 +5015,17 @@ static void f2fs_dio_write_submit_io(const struc=
t iomap_iter *iter,
> >       enum log_type type =3D f2fs_rw_hint_to_seg_type(sbi, inode->i_wri=
te_hint);
> >       enum temp_type temp =3D f2fs_get_segment_temp(sbi, type);
> >
> > +     /* if fadvise set to hot, override the temperature */
> > +     struct f2fs_io_info fio =3D {
> > +             .sbi =3D sbi,
> > +             .type =3D DATA,
> > +             .op =3D REQ_OP_WRITE,
> > +             .temp =3D file_is_hot(inode) ? HOT : temp,
> > +             .op_flags =3D bio->bi_opf,
> > +             .page =3D NULL,
> > +     };
> > +     bio->bi_opf |=3D f2fs_io_flags(&fio, inode);
> > +
> >       bio->bi_write_hint =3D f2fs_io_type_to_rw_hint(sbi, DATA, temp);
> >       submit_bio(bio);
> >  }
>
