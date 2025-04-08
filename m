Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3BE23C8D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744135246; cv=none; b=lCW2k2D+lmY+qjoeDe8mDX6Uu37z4IWN472BQFl9LRF5MCt0CwPlOgcf0m0M3dUshzy8oZMRwktPAvcyEj/Dk0/wanNRWsXnoihC0T6AXGE203JjXVortT8ZGnieolOzCW8sOZq3SvUsG1OIDTze/scXrzAJcCTj7tFkQ8rox2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744135246; c=relaxed/simple;
	bh=LYQ/EYSTsD5+LXO9UJC/DMwBTnYSBqqhgEmMojUu3tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J72wkrCCZjROYtrnbDymz+7xvita5tjpbwP/P8Hol/GCVm8VmZAwf8cSC8FUn3+d041ziFP98nXwntgMHYCyPZaeGfYr6dMSZWn0LFKTJV4nkoPhvGWKT9jMmMDyRQ/tBOpT4K9mD8+pWrHmF9R4H2tIjDs2Ky19KkgU8EQlx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RtEsTnrq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RtEsTnrq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac297cbe017so1274359566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744135242; x=1744740042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHRGUg/zBzHIvr3agUopnqTNoN9X+n+lQuy6s3Pbdxs=;
        b=RtEsTnrqHRugeqIEYVu6Spc9prswzfffrcGJIqQpnu1XdBMIBicbuyegGgTszY/Zkp
         YBeaa3+BWT+pgBJcGv9TQZpJlV2bHZOii0xeZhlUhUVMclJecXrfb0W7j5IsG8Q3YS7S
         nGK0pO9HdrpUSWISlY/2sJpkOoQaj/lE0FXffia+xwSDpO7B94aYNzomOWNctqBVNelW
         prbwbE2Mu+FXVgDlQ0v691SWRmo9eOjQOunS8lpPFW0ikPzFeTr59mXW/s1SNHk+qpn1
         tveMnxapcnYTvzK2EPuJhz7vLt9EwRbWAMde5vk60YtKL/iO0wu7FpdHL/mq3keFpxuA
         4D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744135242; x=1744740042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHRGUg/zBzHIvr3agUopnqTNoN9X+n+lQuy6s3Pbdxs=;
        b=nNwqDXbWAZaKAmMMX/Je6oSnEADDn/aJVQ3W0FY6YA2YxgyM1gM9XdvzET//7onTcv
         4nDZaLoNYacEbHKDti63uJqOyfLPJGdyc+zD4qTWAy9aartC20cDUCMByI+OZxnLo5q/
         z0h2QdvxJjV0HKd8K9N9/ImlePE0ABK8odzC4o4cehU9krAweaCu4nmCaBmeiXITLp0O
         Ua6wgc0gxGo4EDB/c0nQQ5CQ9JriUWt+W904c/i75S6r1EvNh1vyiE2S17dCHG1BWGMZ
         S3hrKAErh6gWCqnxXWkv5OGJjPrN/GzJoq/v4A3AbmQZxUhfLaDNGdNHXDOyxcDn8a1b
         92EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUVzG4Kt3XYj1yLNASKrN91HFk60IxXwX5VLnwuuxdIl9vH1JfduvifrIKLI2sWBfsP1HckOeEJ9Ylbt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YydzOu9ZTLLwT6568aKFjq/kqbKcBA/GCTj895CxsqVwl/d2bux
	HIP5K1t9LzkExGGW7298uit7F9QadF0m7LAzNCXYPfK5c/9W4XudsyexuKH8Hb9c/WVguvOCvZQ
	OyEqANjjoHfoHIanNlCXUtsSH0U6AirU5DvGFkg==
X-Gm-Gg: ASbGncvPl1yDItwidiqvMw5PZa/iC+IRMg9YBp/6HOsmJSNvrBu657BhWnFw06GOhNa
	DeU7V/JDQjfQ1ghEU9hkfMa5pMeD707VqwWWq+qt3yFzGxc1B5yZZ3D06vfC7I/UFjPVrjL1I6F
	g2YPIhj1t8vzUqBwHiziKDAsoy
X-Google-Smtp-Source: AGHT+IEcQTZbBwEPToHhlhVm9O0fPdaEu7xjj5dpTlxIaVfShGey8YE5vjRJAMVy6gBWjJ82lj4ubqkYXigh1kL4XdI=
X-Received: by 2002:a17:907:3c93:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-aca9bdf067dmr4033966b.0.1744135242398; Tue, 08 Apr 2025
 11:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408122933.121056-1-frank.li@vivo.com> <CAL3q7H6ysGxpXs8P9iPY-Y1KNKPggGSFHR_tMv-34Q+Qf6PZTQ@mail.gmail.com>
 <CAPjX3Fem5E26+Fj537zcOXk9YZum2pDdcY9SAwCOr12wrGrroA@mail.gmail.com>
 <CAL3q7H40yF8q78vZgd2c92LZMzBxqvU3XTrWMu86th1mGsGYDg@mail.gmail.com>
 <CAPjX3Fd275aj0g5CWVKyX2wu0Sjn3a3UdZBaOR5MqUV55e4ZXw@mail.gmail.com> <CAL3q7H5BGF6cnLd3-fbp_Szq4_DSekbcM_nz_ZSGnS40w90X6Q@mail.gmail.com>
In-Reply-To: <CAL3q7H5BGF6cnLd3-fbp_Szq4_DSekbcM_nz_ZSGnS40w90X6Q@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 8 Apr 2025 20:00:30 +0200
X-Gm-Features: ATxdqUGknCmHkBQq6L-NwppXDtR6YUeam5vq7FQztqmTQEykhuKHOi_GrvcO8jw
Message-ID: <CAPjX3FepgZqXJ5B1V2Msg4pZHjphqUTRR1K3w=RGeDWzVxaUCA@mail.gmail.com>
Subject: Re: [PATCH 1/4] btrfs: use BTRFS_PATH_AUTO_FREE in insert_balance_item()
To: Filipe Manana <fdmanana@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 at 19:52, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Tue, Apr 8, 2025 at 6:47=E2=80=AFPM Daniel Vacek <neelx@suse.com> wrot=
e:
> >
> > On Tue, 8 Apr 2025 at 19:41, Filipe Manana <fdmanana@kernel.org> wrote:
> > >
> > > On Tue, Apr 8, 2025 at 6:36=E2=80=AFPM Daniel Vacek <neelx@suse.com> =
wrote:
> > > >
> > > > On Tue, 8 Apr 2025 at 16:47, Filipe Manana <fdmanana@kernel.org> wr=
ote:
> > > > >
> > > > > On Tue, Apr 8, 2025 at 1:18=E2=80=AFPM Yangtao Li <frank.li@vivo.=
com> wrote:
> > > > > >
> > > > > > All cleanup paths lead to btrfs_path_free so we can define path=
 with the
> > > > > > automatic free callback.
> > > > > >
> > > > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > > > ---
> > > > > >  fs/btrfs/volumes.c | 7 ++-----
> > > > > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> > > > > > index c8c21c55be53..a962efaec4ea 100644
> > > > > > --- a/fs/btrfs/volumes.c
> > > > > > +++ b/fs/btrfs/volumes.c
> > > > > > @@ -3730,7 +3730,7 @@ static int insert_balance_item(struct btr=
fs_fs_info *fs_info,
> > > > > >         struct btrfs_trans_handle *trans;
> > > > > >         struct btrfs_balance_item *item;
> > > > > >         struct btrfs_disk_balance_args disk_bargs;
> > > > > > -       struct btrfs_path *path;
> > > > > > +       BTRFS_PATH_AUTO_FREE(path);
> > > > > >         struct extent_buffer *leaf;
> > > > > >         struct btrfs_key key;
> > > > > >         int ret, err;
> > > > > > @@ -3740,10 +3740,8 @@ static int insert_balance_item(struct bt=
rfs_fs_info *fs_info,
> > > > > >                 return -ENOMEM;
> > > > > >
> > > > > >         trans =3D btrfs_start_transaction(root, 0);
> > > > > > -       if (IS_ERR(trans)) {
> > > > > > -               btrfs_free_path(path);
> > > > > > +       if (IS_ERR(trans))
> > > > > >                 return PTR_ERR(trans);
> > > > > > -       }
> > > > > >
> > > > > >         key.objectid =3D BTRFS_BALANCE_OBJECTID;
> > > > > >         key.type =3D BTRFS_TEMPORARY_ITEM_KEY;
> > > > > > @@ -3767,7 +3765,6 @@ static int insert_balance_item(struct btr=
fs_fs_info *fs_info,
> > > > > >         btrfs_set_balance_sys(leaf, item, &disk_bargs);
> > > > > >         btrfs_set_balance_flags(leaf, item, bctl->flags);
> > > > > >  out:
> > > > > > -       btrfs_free_path(path);
> > > > > >         err =3D btrfs_commit_transaction(trans);
> > > > >
> > > > > This isn't a good idea at all.
> > > > > We're now committing a transaction while holding a write lock on =
some
> > > > > leaf of the tree root - this can result in a deadlock as the
> > > > > transaction commit needs to update the tree root (see
> > > > > update_cowonly_root()).
> > > >
> > > > I do not follow. This actually looks good to me.
> > >
> > > path->nodes[0] has a write locked leaf, returned by btrfs_insert_empt=
y_item().
> >
> > Well, the first return is before calling this function and the final
> > return is only after committing.
> >
> > Again, the function keeps it's former structure as it was before this
> > patch. I still don't see any logical or functional change.
>
> I don't know how to put it simpler to you. There's a path setup by
> btrfs_insert_empty_item(), with a leaf locked in write mode.
> You can't just do a transaction commit while holding it locked, as
> this can deadlock because updating the tree root is part of the
> critical section of a transaction commit.
> It seems trivial to me...

Nah, of course. I see. Simply put the btrfs_free_path() needs to be
called before btrfs_commit_transaction() due to need to
btrfs_tree_unlock_rw() in btrfs_release_path() first.

So the sequence matters. The path implicit destructor on return from
insert_balance_item() is only called too late.

Thanks for the details.

> >
> > I'm lost. This still looks to me just as a straightforward cleanup.
> >
> > > > Is there really any functional change? What am I missing?
> > >
> > > Yes there is, a huge one. Even if a transaction commit didn't need to
> > > update the root tree, it would be performance wise to commit a
> > > transaction while holding a lock on a leaf unnecessarily.
> > >
> > > >
> > > > --nX
> > > >
> > > > > Thanks.
> > > > >
> > > > >
> > > > > >         if (err && !ret)
> > > > > >                 ret =3D err;
> > > > > > --
> > > > > > 2.39.0
> > > > > >
> > > > > >
> > > > >
