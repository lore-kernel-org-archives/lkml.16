Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D8237163
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133810; cv=none; b=Kp8ymKIQJrIREA7+5hw35poS+jRpDx57hGPE2fHfkpHBhKNhe4SHxbRY1VTIy+aiLSSgY2JvHXhuMAllu6L9rHhZy7KCB53DAujRMmMU94JO4DbovO49sJMp7GRJJjyUr3emuwqIuhKZm+Ex1tCJd2G8xQI66fdv3JrfN2YThEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133810; c=relaxed/simple;
	bh=Rv7zOuACo6PGkjONa/rGcG49ntJyvTgEc7rzdn4cZuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pgi10K71HNwk5TiRyhzl0Wh6boa6kNtNwfijWq/s9vd2Rqqt73g5/dj4+OkRizeNGf3NGeoPp+BsjxPWcx8TsTDufAgFwkKaC9oOlS8bbDJB7VQyYBpcumGtZHgH8Y19SQNFWVc7/b+uIwzSxMZOc9B88L3k7BLFjrLoPqJY3eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bUIFGgtY; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bUIFGgtY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3b12e8518so1074803666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744133806; x=1744738606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnCEslMdaS7r7+0ovfJH0qTPww6j0X72ov4ejqDicq4=;
        b=bUIFGgtYbf3w92ADjWQ4f7WRca6K3ZEY8UiXiXAXgloAfvSRiP8SsFjM0msy80a6VF
         0jWp6r1/MAUK1u8+6g6S+PNKcxtxU/lgmp4+mO8hYc556gh5Kj6XaAw4b3cSn+tKjPYX
         MYTsXnH8fl1NXgwqKSwf0IHi7EvP06D4h5m26TEkL3wJTV+7Eg7lehQctJTBVPabwhPo
         O3hAyO0sTV3Vvvhiwz1C+j7G9NdTEwv+5vUoBEG0njg2FNdLJnIV55kP93+tOLyl91C2
         055Kq9AD5GNYbtije4ZNJu1ifeb0FQTBwAtWCSCVcRFnVrBFEBxU70maAGD/vVr+WWAC
         V5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744133806; x=1744738606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnCEslMdaS7r7+0ovfJH0qTPww6j0X72ov4ejqDicq4=;
        b=AC0OJW/CbZFzvO2Zb/WgrIojc6YQxg3/G6QOeGe2G+4PYBUTBc56NJ2lHj4bvyQGh2
         wVRY/vxmDThuwLZ9s8M6DPfyhKTAL08BdWHcc9jiZCcmlQKBgxhL8b38LizokZDAgGTc
         lAmRPAJUff03ZQEkXPCJjm+OKrubr2K2Dstpw4Kr+SAHhO9Jhb0K31ZrzqU4tfqUATLr
         HM74dinjCKEG1Vj5Zcpiyc36hXWqvZd23oUiWCbsIoTLIWaGov50MAWPfqWop35XB0Zh
         62x6Cxc2Cseii+dV6rkezQp+y2x7Nu4nW2I+7SS9wc+QewfbKdaeQEz0G5XtLLjl1MXy
         d9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbM+UggTGIPPj5hX/7uwBcI0aNgSd7ZgG2gcqA9FIwIt/98kl4h4SGAaoTEuNm0HZgSRh7PVZRNZZJM8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcvigVvTLxSTrIQjiK1fy/dC4ZTO5tyy9lOeG2A7VyGC5Wi3l
	W441iD02wXGnqQa2+aY1II4GooaLliH+IZNh+okh+POH8xjyyyDBENoHWSf1OP2qjOkoyS5HZeO
	zDUaNGpVRDKHe4G/JurPLG7KBTA3gFsEqsZ8wPg==
X-Gm-Gg: ASbGnctjD11MS7S/AK0WRo0oqrqTOjmYLlJEH9XyDhVvgocvKT0fhhpZeFX2hmhrFHF
	yzubgB9EuL+EyfsJeMgzhmRl3xKq9Imnr0fhjG9ngu9YJ+FP25+XnXV7LHrZka2pZUuvR68zCOX
	N+NMnx4iB1P7c1AVmUt0u/kqVF
X-Google-Smtp-Source: AGHT+IEkTbXSqpjpy5g2WeVo6FwMfmliuiqhfm7k8iUa3JhTvmOLLVbJgYSK1ykiL/VVL+p8TiSkmAgbb7pJBrb9HcM=
X-Received: by 2002:a17:907:6e8e:b0:ac2:a4ec:46c2 with SMTP id
 a640c23a62f3a-aca9b739f8dmr6478466b.49.1744133806505; Tue, 08 Apr 2025
 10:36:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408122933.121056-1-frank.li@vivo.com> <CAL3q7H6ysGxpXs8P9iPY-Y1KNKPggGSFHR_tMv-34Q+Qf6PZTQ@mail.gmail.com>
In-Reply-To: <CAL3q7H6ysGxpXs8P9iPY-Y1KNKPggGSFHR_tMv-34Q+Qf6PZTQ@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 8 Apr 2025 19:36:35 +0200
X-Gm-Features: ATxdqUGLRfmMmZczeT5xlV_PYtK4N7BX4DdaIbSfYs5obzYvbCGTwKIxP6LDtmA
Message-ID: <CAPjX3Fem5E26+Fj537zcOXk9YZum2pDdcY9SAwCOr12wrGrroA@mail.gmail.com>
Subject: Re: [PATCH 1/4] btrfs: use BTRFS_PATH_AUTO_FREE in insert_balance_item()
To: Filipe Manana <fdmanana@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 at 16:47, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Tue, Apr 8, 2025 at 1:18=E2=80=AFPM Yangtao Li <frank.li@vivo.com> wro=
te:
> >
> > All cleanup paths lead to btrfs_path_free so we can define path with th=
e
> > automatic free callback.
> >
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >  fs/btrfs/volumes.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> > index c8c21c55be53..a962efaec4ea 100644
> > --- a/fs/btrfs/volumes.c
> > +++ b/fs/btrfs/volumes.c
> > @@ -3730,7 +3730,7 @@ static int insert_balance_item(struct btrfs_fs_in=
fo *fs_info,
> >         struct btrfs_trans_handle *trans;
> >         struct btrfs_balance_item *item;
> >         struct btrfs_disk_balance_args disk_bargs;
> > -       struct btrfs_path *path;
> > +       BTRFS_PATH_AUTO_FREE(path);
> >         struct extent_buffer *leaf;
> >         struct btrfs_key key;
> >         int ret, err;
> > @@ -3740,10 +3740,8 @@ static int insert_balance_item(struct btrfs_fs_i=
nfo *fs_info,
> >                 return -ENOMEM;
> >
> >         trans =3D btrfs_start_transaction(root, 0);
> > -       if (IS_ERR(trans)) {
> > -               btrfs_free_path(path);
> > +       if (IS_ERR(trans))
> >                 return PTR_ERR(trans);
> > -       }
> >
> >         key.objectid =3D BTRFS_BALANCE_OBJECTID;
> >         key.type =3D BTRFS_TEMPORARY_ITEM_KEY;
> > @@ -3767,7 +3765,6 @@ static int insert_balance_item(struct btrfs_fs_in=
fo *fs_info,
> >         btrfs_set_balance_sys(leaf, item, &disk_bargs);
> >         btrfs_set_balance_flags(leaf, item, bctl->flags);
> >  out:
> > -       btrfs_free_path(path);
> >         err =3D btrfs_commit_transaction(trans);
>
> This isn't a good idea at all.
> We're now committing a transaction while holding a write lock on some
> leaf of the tree root - this can result in a deadlock as the
> transaction commit needs to update the tree root (see
> update_cowonly_root()).

I do not follow. This actually looks good to me.
Is there really any functional change? What am I missing?

--nX

> Thanks.
>
>
> >         if (err && !ret)
> >                 ret =3D err;
> > --
> > 2.39.0
> >
> >
>
