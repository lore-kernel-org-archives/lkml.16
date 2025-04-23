Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EA264A6D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402353; cv=none; b=glLQlxnm0x+9KFb3Te2/f8DAsBhapVGghMwvkr1GwZ4f1P7c3HJU7PK39p1Ypn8LmHbBWhOdwKyIdTZ+2VsnBEpC2WMWkeCnEhmYN4EhsxFH7BrwbnZJTYy510OBemksrrTcF37ngUU9x3el5rDtWOLelM96duuD6Ehe4CuTj0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402353; c=relaxed/simple;
	bh=0CiPL5WEXEIJw+kxPu0f6F4ItVvgMBwlxGUF85waX2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rk3pWP4CIuiqN9ktlNkHP7COLI9ORMXPox5GU7fII0VReoRhUhvtt8KKQI1i5TTAjL2YajXZkyNT8UbyYmbR5LFoT/pnehQw5TPJBFQpc1FiniA2vSn3geg7hsCaiaKm43gMfypwklLeLb0p1a+1Hb8g2vDc9dFhEnwBFo9jVlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YJePJHWx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YJePJHWx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so10221753a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745402350; x=1746007150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUeZRj/zZ2ONVqjLiPNAcppJ2cQUlyShZe9TAmdB+wo=;
        b=YJePJHWxuTcG8DSzmAF/zIGBCiEL4hGZ2IhD236oW3X64b9zkukZCaaprRcYLz5aU5
         +EkLeejrXjauq+1h5gXUL/GvhoQOmt3WSM5LSHvRrnenEcJf9sOfef3ZMqUjd4U9Rxhw
         D3MnSaKy2IKa9aYp4j7J43wAAlF4zSr6K4dUp8SE/xs8PK3TQl4qDy2PMqzWsBHtKqCr
         PWFCMwHwZXSlgstUkt7PWEtlQ9EdIzvfMIWJPwYZHRmOrHkftWC50pukLvCZ5xx14Qhj
         v/p/1TBTsoQkaF34aibkJHTcpVlRpcO8VmypsgcPznS2YzNEJSziafI/G0bP8tbtsOPv
         0TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402350; x=1746007150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUeZRj/zZ2ONVqjLiPNAcppJ2cQUlyShZe9TAmdB+wo=;
        b=qG/m3eRAHqWrHLk+n+yOEAYz189AvHD/QEwLY3IlSphmRGfzIgGbJb8/Ect4vEzJVm
         4y4YvUU5P9UrmVEvOCWe7C21tTv4dlvBTzSOI7CS530HOze2wvtU7p1ZBnIvLTPnnm3s
         kqri0aui6+/ef8nblt7CqsGsXVyU/JmFZ6+kvfQBFdVu5RoX1jBHuV+hpzREZ+S8fSp4
         NEPHdv1NKVYi9NO2fG8S01uyc0jbZ7ko6iVjobvBtK0mXjFEYWDEwLhKC8NxySjoynix
         tfPNP7VobQ0gpD6UCNqy6GnQ4GE89lxQcF9BFTxgVJQYKSGKVtWDwqDwWldVX0asHxhD
         AeWw==
X-Forwarded-Encrypted: i=1; AJvYcCW5ZYXKS5slk0DpSuJM0veZkp2w2IIfYAGsxrCLfAmYuRCS9Qj2si3gTk+CvLpmtXZggyUNpABUg+m/r9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhSDxrlvK4MBL6IVpUOBpptTctwWt9FjPsheBZFMPhHFxI6aBZ
	75xT6SuMepN8PacYFkkTcYHdBdOM17CifK3SG0i3M0mEQ2e1TfTSMwz2+a70DzB7MV8nqsNzT2/
	piMsse8giOKs5oqDUR73l66nNdyjeA0zv29N84Q==
X-Gm-Gg: ASbGncvzVev/iS9MfaweKQ05jApG297OsCtY0MCx5F72vr5k7x8oWx8JCC5lOpDLH7h
	QgQkh+8PVnCJBXiUTlB9U5YFzgzslSyQeDgjdCi9uAcO5NM4a9MGXinT2/2F7RLKKxhJIqiOa6e
	tfFD8Cbpfj20qOWScqQ+4A
X-Google-Smtp-Source: AGHT+IEfJIOq6PpViVZntMAYxqQT9hb8IZS/Kw+/z79+/jBSekGm/D61mLq5WCt9qsSzlLbCd68PyjgJrbOtsNTWh3E=
X-Received: by 2002:a17:906:ef0e:b0:ac8:1798:c2e7 with SMTP id
 a640c23a62f3a-acb74d8313amr1935478966b.41.1745402349786; Wed, 23 Apr 2025
 02:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423080940.4025020-1-neelx@suse.com> <CAL3q7H7A_OnTQviZpCgzrGUFe1K=VfMiWXaba56E3ucPHnVkNg@mail.gmail.com>
 <CAPjX3Fdor0TgkQtb2meJD4PFerOQV1Qcjs5HEyBCt5TNt8-vsA@mail.gmail.com> <CAL3q7H7g3xvs8TnSsYwaBP1n_EyRn1eC6SgeMP41G7BT=VZ2-A@mail.gmail.com>
In-Reply-To: <CAL3q7H7g3xvs8TnSsYwaBP1n_EyRn1eC6SgeMP41G7BT=VZ2-A@mail.gmail.com>
From: Daniel Vacek <neelx@suse.com>
Date: Wed, 23 Apr 2025 11:58:57 +0200
X-Gm-Features: ATxdqUFRj1_ZF5gUhGpIkRBitM3OA1UsB5IThJag95jwC9GGk-DxPyDzvsiVd3c
Message-ID: <CAPjX3FcVq3FTBxmQkr3QZR3GL6AG7DkKH1SeZ5hQ1JXBN=fo=g@mail.gmail.com>
Subject: Re: [PATCH] btrfs: fiemap: make the assert more explicit after
 handling the error cases
To: Filipe Manana <fdmanana@kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Apr 2025 at 11:55, Filipe Manana <fdmanana@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 10:48=E2=80=AFAM Daniel Vacek <neelx@suse.com> wr=
ote:
> >
> > On Wed, 23 Apr 2025 at 11:04, Filipe Manana <fdmanana@kernel.org> wrote=
:
> > >
> > > On Wed, Apr 23, 2025 at 9:10=E2=80=AFAM Daniel Vacek <neelx@suse.com>=
 wrote:
> > > >
> > > > Let's not assert the errors and clearly state the expected result o=
nly
> > > > after eventual error handling. It makes a bit more sense this way.
> > >
> > > It doesn't make more sense to me...
> > > I prefer to assert expected results right after the function call.
> >
> > Oh well, if an error is expected then I get it. Is an error likely
> > here?
>
> The assertion serves to state what is never expected, and not what is
> likely or unlikely.
> It's about stating that an exact match shouldn't happen, i.e. ret =3D=3D =
0.
>
> We do this sort of asserts in many places, and I find it more clear this =
way.

I see. Forget it then.

Thanks.

> > I understood the comment says there can't be a file extent item
> > at offset (u64)-1 which implies a strict return value of 1 and not an
> > error or something >1. So that's why. And it's still quite after the
> > function call.
> >
> > But I'm happy to scratch it if you don't like it.
> >
> > > Thanks.
> > >
> > > >
> > > > Signed-off-by: Daniel Vacek <neelx@suse.com>
> > > > ---
> > > >  fs/btrfs/fiemap.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/fs/btrfs/fiemap.c b/fs/btrfs/fiemap.c
> > > > index b80c07ad8c5e7..034f832e10c1a 100644
> > > > --- a/fs/btrfs/fiemap.c
> > > > +++ b/fs/btrfs/fiemap.c
> > > > @@ -568,10 +568,10 @@ static int fiemap_find_last_extent_offset(str=
uct btrfs_inode *inode,
> > > >          * there might be preallocation past i_size.
> > > >          */
> > > >         ret =3D btrfs_lookup_file_extent(NULL, root, path, ino, (u6=
4)-1, 0);
> > > > -       /* There can't be a file extent item at offset (u64)-1 */
> > > > -       ASSERT(ret !=3D 0);
> > > >         if (ret < 0)
> > > >                 return ret;
> > > > +       /* There can't be a file extent item at offset (u64)-1 */
> > > > +       ASSERT(ret =3D=3D 1);
> > > >
> > > >         /*
> > > >          * For a non-existing key, btrfs_search_slot() always leave=
s us at a
> > > > --
> > > > 2.47.2
> > > >
> > > >
