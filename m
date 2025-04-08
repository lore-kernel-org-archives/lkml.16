Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF42AE69
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134456; cv=none; b=SSYxm3JZrsB8oTiVtmiYHerP0Y+VYA0OA30l0GXvkeIxjIinQ81fJRlZ0fFGUsPNNBFZEBSvQ6Y4jBjWKhpi6OiizeyUrt8XsHyKdty3jI0uE3ovLFw4nCr3WNJJGu5ZS2tE+GJUFhzfbXkgMjg7+DwMRfMfrtIq6n5nInVik6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134456; c=relaxed/simple;
	bh=6xnX5NUK57zOuUDC2r2Qt1QdSl2C7YJiwPptSlINKtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjgEEnafsN2ktYKhL0AQaFeFyr/fdaxpp8Wjc1BIlXUF8BLtVc56ZFCRIIjp1vbqoT5blXXeS34IS2I4TWvUhWN0q1vstdKkMMZnctpmZ0TF1uFNmjAgruTNT03gDloH8CWSTxxU5R5RT2CT7PWTzaCkeD8+LTW3ycEf/GhRwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y/qee6O+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y/qee6O+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso12671252a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744134452; x=1744739252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCbKSs5ZbNLa65xSwrJ8gawGsTAvmrtEZ4B0b2dQDs4=;
        b=Y/qee6O+0p+O7bfTDQXHhFg25/RfJKHPaG9zLU3NNVZ2F0Hr6pcW6CeCKCPirNWdmv
         yJm5+grV3IfoGkaRTP/S81sgix7UvHdOU1jtGBeQYCMkpobVXQo++qlpi/cAjUA+q5hz
         xAx7RdokCYFtK8pZb1uECTl5OWviPGOXdqphJ0k7+zShgwrF6PtN5+EKPbQG1nTcDbpd
         s53XDIMIJAW1jI+9iqPTju6ma5Cdnrxxx5EqgrjppVa/+NdTHcrv+UDqcy+Gj4Z3j142
         IbecdZ7BNFHZ6qQaqiyW7XhgJ73udP7SEZdVqwfPHcBsmR4gf3EfegCjnZGoW2pgEbsf
         MbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134452; x=1744739252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCbKSs5ZbNLa65xSwrJ8gawGsTAvmrtEZ4B0b2dQDs4=;
        b=wsiIL/I9t5gv/bFJVzAiEIklxTJ0PnO5Hh+4iXAZQ/cp+dnRR+sP6Xoa194GQVYw8k
         g6TGSbY4puW8UNDl/YwoEhJHAoXnFXvTRKsxyt8a6ehrrY2FqxNB9EV6ap14tPJAovZH
         gfXK9LDV52Dd467w6eQWi8hUNxaJgSfmMMEjk3ViVWiBrUUbsmMGwLzPI20ZmjKeosn7
         LHOzBR9DJ5i4uUR4nG+0AEdui3r+K0QRfpH4aSKhZ+qenCUJIKCx/KdDpzs6QpI7K2yg
         GyOQ1T3uplLXJtBaNI6Hbw1wwexvOKNDteVLi5T/K3/UxsD666PcBnDQmDKCppnZ7m8I
         L/dA==
X-Forwarded-Encrypted: i=1; AJvYcCU+8NpbgukDhSnyq3QcYR9WYoVR295qSjaJuok/FFWU//K+rNq8qjY4kdWnbXWg2UDiTquwRNQGSqTrtlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1lQWNVi9D0QqzpiDkuy4OirGAeNW1Ay923sydeiNS1oBrCXO
	Lg1OfZg3shQ+1vFED7qC0MkYKWe3wN0TsXPjQeafPsF/+sBNrsh+pZfuPlC3B/aPMzHY9W+wK2a
	UO8eBNDWTZc3BoN05FckzilfJHxbi3XiRP72SbQ==
X-Gm-Gg: ASbGncszkCQOS3Jp92ammleb+NbZUjf2paUrpyYDG/OxrGpJ3qSBlK6JHAebchVuk6q
	KXA8JH08tQGKaRg1wmV1pV1uXfnoTVqF7ltgp8HkmuZ5+0BYrv8C0tzRjM+p1RkN4FU51/X+6P4
	YbwIfCUahCD87ITrSBjcs4hhig
X-Google-Smtp-Source: AGHT+IHMMiRAydzAbwJa+Ye4XOnz9bIdvcLG9qlWjCjAcE2n1Ae1dSMKIpzsYeJBUticNHo0yFDd8FYuI/NOlq0Fa24=
X-Received: by 2002:a17:906:7cc5:b0:ac8:1bbe:1a5b with SMTP id
 a640c23a62f3a-ac81bbe1a82mr305167366b.9.1744134451946; Tue, 08 Apr 2025
 10:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408122933.121056-1-frank.li@vivo.com> <CAL3q7H6ysGxpXs8P9iPY-Y1KNKPggGSFHR_tMv-34Q+Qf6PZTQ@mail.gmail.com>
 <CAPjX3Fem5E26+Fj537zcOXk9YZum2pDdcY9SAwCOr12wrGrroA@mail.gmail.com> <CAL3q7H40yF8q78vZgd2c92LZMzBxqvU3XTrWMu86th1mGsGYDg@mail.gmail.com>
In-Reply-To: <CAL3q7H40yF8q78vZgd2c92LZMzBxqvU3XTrWMu86th1mGsGYDg@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 8 Apr 2025 19:47:20 +0200
X-Gm-Features: ATxdqUGZ91u223X10tzq9NgOGLqvLsNRF_lv_kEhVEqSVkZaOP4gLp8OkuuPRv0
Message-ID: <CAPjX3Fd275aj0g5CWVKyX2wu0Sjn3a3UdZBaOR5MqUV55e4ZXw@mail.gmail.com>
Subject: Re: [PATCH 1/4] btrfs: use BTRFS_PATH_AUTO_FREE in insert_balance_item()
To: Filipe Manana <fdmanana@kernel.org>
Cc: Yangtao Li <frank.li@vivo.com>, clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Apr 2025 at 19:41, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Tue, Apr 8, 2025 at 6:36=E2=80=AFPM Daniel Vacek <neelx@suse.com> wrot=
e:
> >
> > On Tue, 8 Apr 2025 at 16:47, Filipe Manana <fdmanana@kernel.org> wrote:
> > >
> > > On Tue, Apr 8, 2025 at 1:18=E2=80=AFPM Yangtao Li <frank.li@vivo.com>=
 wrote:
> > > >
> > > > All cleanup paths lead to btrfs_path_free so we can define path wit=
h the
> > > > automatic free callback.
> > > >
> > > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > > ---
> > > >  fs/btrfs/volumes.c | 7 ++-----
> > > >  1 file changed, 2 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
> > > > index c8c21c55be53..a962efaec4ea 100644
> > > > --- a/fs/btrfs/volumes.c
> > > > +++ b/fs/btrfs/volumes.c
> > > > @@ -3730,7 +3730,7 @@ static int insert_balance_item(struct btrfs_f=
s_info *fs_info,
> > > >         struct btrfs_trans_handle *trans;
> > > >         struct btrfs_balance_item *item;
> > > >         struct btrfs_disk_balance_args disk_bargs;
> > > > -       struct btrfs_path *path;
> > > > +       BTRFS_PATH_AUTO_FREE(path);
> > > >         struct extent_buffer *leaf;
> > > >         struct btrfs_key key;
> > > >         int ret, err;
> > > > @@ -3740,10 +3740,8 @@ static int insert_balance_item(struct btrfs_=
fs_info *fs_info,
> > > >                 return -ENOMEM;
> > > >
> > > >         trans =3D btrfs_start_transaction(root, 0);
> > > > -       if (IS_ERR(trans)) {
> > > > -               btrfs_free_path(path);
> > > > +       if (IS_ERR(trans))
> > > >                 return PTR_ERR(trans);
> > > > -       }
> > > >
> > > >         key.objectid =3D BTRFS_BALANCE_OBJECTID;
> > > >         key.type =3D BTRFS_TEMPORARY_ITEM_KEY;
> > > > @@ -3767,7 +3765,6 @@ static int insert_balance_item(struct btrfs_f=
s_info *fs_info,
> > > >         btrfs_set_balance_sys(leaf, item, &disk_bargs);
> > > >         btrfs_set_balance_flags(leaf, item, bctl->flags);
> > > >  out:
> > > > -       btrfs_free_path(path);
> > > >         err =3D btrfs_commit_transaction(trans);
> > >
> > > This isn't a good idea at all.
> > > We're now committing a transaction while holding a write lock on some
> > > leaf of the tree root - this can result in a deadlock as the
> > > transaction commit needs to update the tree root (see
> > > update_cowonly_root()).
> >
> > I do not follow. This actually looks good to me.
>
> path->nodes[0] has a write locked leaf, returned by btrfs_insert_empty_it=
em().

Well, the first return is before calling this function and the final
return is only after committing.

Again, the function keeps it's former structure as it was before this
patch. I still don't see any logical or functional change.

I'm lost. This still looks to me just as a straightforward cleanup.

> > Is there really any functional change? What am I missing?
>
> Yes there is, a huge one. Even if a transaction commit didn't need to
> update the root tree, it would be performance wise to commit a
> transaction while holding a lock on a leaf unnecessarily.
>
> >
> > --nX
> >
> > > Thanks.
> > >
> > >
> > > >         if (err && !ret)
> > > >                 ret =3D err;
> > > > --
> > > > 2.39.0
> > > >
> > > >
> > >
