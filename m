Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D72155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973615; cv=none; b=fIwyydQpbVRNRAq262jjhj6HRf8p+lrv8ySOUoSpo4g0FE8J7MWG2L6KWoSDsjs4SOig/NQkoMLNHRuSIWxP4Ugij8paY0b8z2OHGPZdAm6fsK0QJVLOoMc6bntuis9X6/GKwpnSrv6/Bz0N3HvYwXm45H1Ss4hJXapih6nB0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973615; c=relaxed/simple;
	bh=pc7P7aEUc/bEUEzvnStf8mWmTcv2+pCo+9uB41BUszI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpuuX5SQSrXXSy1vd8RefTvafvk2rcmurCBFQITZRT9U/ubWQXmUDcXqMAt1Fk2KE+CgQ51hynKLeZDvQodrux95/tBiuapdLPOviQZBaA+DGhWbnZ1ZAISP+YVvS2uLgI3d1XfFKJcUMRXjUbka+CzGC/W8qFFVgAxiRy6hRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=jBtcNLs3; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="jBtcNLs3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe574976so12458055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1744973611; x=1745578411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chicRdpt/RHl6Og52i4WwN8FqyTqPtr7pyE/vQ8o7sU=;
        b=jBtcNLs3FpGiHS1VVieb2b4BnhxaRCHOzvNXzvjz2OznuI2m1aqQqVQibhZ1xFeiY3
         0uhRMuh/5jWkbCpzfd3q3mJb/ebVYbGsbArsyi49UM/xMnuScFN3pI0iHQZHeF9adVGQ
         9ifA1uUqXJz3AQqgt/XaCNq6QbpO4nFVviQ/q+d0ADreWSbXYScUcKuzjXDuEZPQBaQq
         ZmMuWEU85IZNlraZhLZ0VLkK6YedNn9KzugGC1R4CtyfIuRD+z2gpz8wbKIV5Cj7YwWW
         zZ17NdGHGlobnW+wWn8mvgV0bo71vuOSaWTeJVHvXS1yFa72+M6jxZgi8XMS/ezEdYED
         HTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973611; x=1745578411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chicRdpt/RHl6Og52i4WwN8FqyTqPtr7pyE/vQ8o7sU=;
        b=dG77ixM/9WxFAhzDQtfos9F2e8IOvxav7rnLY6yqbwCf9IRcp6HzFY9HEMJp3du0Rc
         6r6ZbM7ztRD6PWJL/vWYRrRiSNkmM8zNCXGkq56WNdCqW2KgJn9eq+bArzc0tZ0ue5hn
         zRMEZkuTCeHkKoIUoxIx13QVtg959/n3dhH0SGOhNky+6WmBeDnmLyVDrxWjulQFN/Gv
         EmqF5jeEGuQHOwpSWs1sozb3bekPQI6xmQ9G/n10TyAzDed4gIr3IiAB0qQJTrygclU3
         30hH2FpJu+pIIk6wdbNBRWTn4w+U12PFiNuGK6A3AK8ZCTf8utNRvz3ymqhuvr/BULa9
         EAdg==
X-Forwarded-Encrypted: i=1; AJvYcCWw45+T0biMtDSbDZ8OKmG9B2uKWEKLbX8gxJwqkLDjLZN2xU4etGDV7NdbVDzYNEP/feC6Wkxe4jEZ0fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWeRJE/5a+384YGF3ejYImof7AIqNGVedlU0TdVHIuqvBQ2IJf
	LoGmsMOu4Z7bqW/TymOk8vDD7eu/mncP8cuUuJetIMasoelRvE2d10MLeuuMp+w=
X-Gm-Gg: ASbGnctgwV3Hj/VDi/5U1zEhhWr5FGAlimctQLa8Ky+zeWPZQu4DosOM9a+Duq4m3ZE
	8Kaok8b755eZmK+mCc9q1D4FcEWb3nS7D6eieFEbp2POy7rG/pabzuZSXaZqSRMs0PDX0TRKa7i
	HM5mi4DBr89thMmRWFK14CrVIBpLX0L2llh2QDGoR/HF+3GN9fQdClmEWLrKpkopg870NHof6Y4
	J4TjjytrhJdgr/U8lU6dFOANkDxg9QvpivqQzIIPXm7jbgotO/Cu6UVCyhexaMxJjrTR98WoNQv
	rciqS+G0uPySMBn2HL//gq/8v7d3NH20M+esVVYEEt3Uq1yVpOFEQyqTN4n4aGWsvNBXWeMMgeR
	Azlae1Uly
X-Google-Smtp-Source: AGHT+IFRGae/w+LSe2Wb9xwhXf4HEpT8dkNYJ3tTEo4SBBzlp0BYf8M0aTZt7D6qMJek4Sctywyk2g==
X-Received: by 2002:a05:600c:1c81:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4406ab970bfmr16426115e9.12.1744973611145;
        Fri, 18 Apr 2025 03:53:31 -0700 (PDT)
Received: from somecomputer (84-115-238-41.cable.dynamic.surfer.at. [84.115.238.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d712esm17389405e9.36.2025.04.18.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 03:53:30 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at
Subject: Re: [RFC PATCH] nvmet: Make blksize_shift configurable
Date: Fri, 18 Apr 2025 12:53:28 +0200
Message-ID: <6281253.5x4bddO4Km@anvil>
In-Reply-To: <9f8fdcc0-53ae-4255-b221-b4e787320c44@kernel.org>
References:
 <20250418090834.2755289-1-richard@nod.at> <8418057.aG60p0z9Xu@anvil>
 <9f8fdcc0-53ae-4255-b221-b4e787320c44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Freitag, 18. April 2025 12:23 Damien Le Moal wrote:
> On 4/18/25 18:56, Richard Weinberger wrote:
> > On Freitag, 18. April 2025 11:37 'Damien Le Moal' via upstream wrote:
> >>> +	if (!ns->blksize_shift)
> >>> +		ns->blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bde=
v));
> >>
> >> If the user set logical block size is smaller than the block dev logic=
al block
> >> size, this is not going to work... No ? Am I missing something ?
> >=20
> > Likely, yes.
> > TBH, I'm not sure whether it makes actually sense for the bdev case to =
make
> > blksize_shift configurable.
>=20
> Probably not... I do understand the value for the file case though.

The use case is exposing ready-to-use cloud images like:
https://cloud.debian.org/images/cloud/bookworm/20250416-2084/debian-12-gene=
ric-amd64-20250416-2084.raw

via NVme-of TCP.
Yesterday I did so and figured that no GPT partitions got detected because =
of different block sizes.
Setting the block size in nvmet to 512 made it work.

If there are better ways to achieve the same, I'm open for suggestions.

>=20
> > The case I see most benefit is the backing file case.
> >=20
> >>> +	if (!ns->blksize_shift) {
> >>> +		/*
> >>> +		 * i_blkbits can be greater than the universally accepted
> >>> +		 * upper bound, so make sure we export a sane namespace
> >>> +		 * lba_shift.
> >>> +		 */
> >>> +		ns->blksize_shift =3D min_t(u8,
> >>> +				file_inode(ns->file)->i_blkbits, 12);
> >>
> >> This will work for any block size, regardless of the FS block size, bu=
t only if
> >> ns->buffered_io is true. Doesn't this require some more checks with re=
gards to
> >> O_DIRECT (!ns->buffered_io case) ?
> >=20
> > Good catch. I'll add a check.
>=20
> And by the way, you need to check for STATX_DIOALIGN since some FS (e.g. =
xfs)
> can handle direct IOs that are not aligned to the FS block size. See the =
recent
> changes in drivers/block/loop.c to improve direct IO handling, specifical=
ly, the
> function loop_query_min_dio_size().

Ok!

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


