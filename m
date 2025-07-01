Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457127A454
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382014; cv=none; b=Uc532swcG+MwmYl5No8z6IrNGRky8fzlVkkCxnqQD2YfRyRjWal9MlyVt1gFr5ueztbri6VViSClWRlW0ZYwWgbof5T46JLLsp7pSiR0oJ+z80K1k0Aun1neu9kBkqG02hItxWq6DT7CPpfTOvwbspwmtC8ycjEaLBFjSi0b+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382014; c=relaxed/simple;
	bh=Dv8SFnw4QHK9Vp9igw/V0WvSsJQ688rKknXP7/SQp5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijf9DIbBB2e2Ybw1lg+p8GT0X48QdR0rBj2qee5U8FybxFp70NenInqnPkSSA3zE4cQZVFBXnxfX/uHQe+yNwaQLsku9i70Yq82ub1/0EEw1klmbGB+iPI2ZHZ95FvaQ+j9Cq5hfnVUh2U9E0hhhh+UrwLCZKlrPXtiSK+XZ8ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=fe7/8dQ0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="fe7/8dQ0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so1000247666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1751382008; x=1751986808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv8SFnw4QHK9Vp9igw/V0WvSsJQ688rKknXP7/SQp5k=;
        b=fe7/8dQ09R5YoRIODKMgtqvdgEPNi8JYRIogAhncN7w1xprjXSetH4oDco37CSn7nQ
         +dtyA9ciPda5Dgnu/akgsL8ErbhnUGayKcoeyhCASaXhSx8GcVl5MnBwKJPq9trUBwfP
         oCr6eoF0IfVDpKTXSBMAlr74sLkQRQGjWt7ovGZ8oj0bvT1u6Xs986KR6BdmApBqvtod
         isUySaOAF/J6p+eKehFnwEWowLPIPCjuAyhiQkE3oPXQQd/2cmIB62EimtjMoX0YJ04I
         uh1RYfZl9IZZ+AV3sXB1Yq2oNvUpvw51vTuHg2LKWqZn31tluSmeZNM4P5HfZaRvAel9
         wiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382008; x=1751986808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dv8SFnw4QHK9Vp9igw/V0WvSsJQ688rKknXP7/SQp5k=;
        b=f9ZCaxhlw/BjJpb+SE5ArIld8P6oQoyMzm7iuNsGth1868jCbdjKudChSV80T+71HB
         PUoRNmzAYCpbODEx4SOlOEaSc1Y8SdZbKZkRHps35edg+HT2bF/r+mi1IyrlMswMpJbl
         HEHDCXRtI2Iz1wLH6lnkclV0u2qRtXQxIf5Bo5XfHHpnQ2orDLhFvH4YAonitWIxndoy
         aXZsmhp9PP1DVa0tSZTvjHFL0eZo8HoBlnEJCb9KV5nZF78GofVHHWI+vXZVERC0+ELy
         JCFYKb8CKahGtlbLFLXkPICuVZsL9KfK9VpER46mIcmHPXW6DCapkkMigOTgqwZ4Vvvy
         g8Dw==
X-Gm-Message-State: AOJu0YyWwTzMPG9A9ZZN7/CxF0aBj2eHHCc3LBeEH3WoHhmmNcN2TkhM
	ZR6darTsRE4dtb0MbaAnTIiqtZqTpSgaHPJUk3yqtuWNrIz5w2ALLbBENKflvJSZcUS3By5Gb+K
	LHSeC
X-Gm-Gg: ASbGncvLhNCxT5BOmEwNnw7ppX/nmqj+8W+BXP3uA8D1NTPQQjOisJ4XpzLBeMRwySd
	pUbkpBGTg+ZEQ6EPt604vrSgg19+9WH/ZFocNuUEw4g0erdui7v1SQ89KjTXd5RDuX33sVmR7Ow
	w9L+LVUsp+DcU2eMlZrEzL6ETm+KaL1/2BL9aZcS5NgnRcVVo5DvGAsGJ/j8L52OJgCURXaB/kY
	bKVbFR9Iuu3CtlU8U63OW9OyltVlR3VOIZ1BVgjSE5Asku4pKtMyoo3enMQiPzLCSRL2xAZsPFF
	5SnNchLqHiSyaKuGUDlzVfVl4Jsi3uPlLeal0oXrVMga6vGmRi6ftSi3aTaAvEGjhqtO8robedJ
	rldphS9AqPyrMkIv+UjGLcqgiCOk=
X-Google-Smtp-Source: AGHT+IGLFOb6fzmYCObV2ho5rVZPNSLZ/sa1I8TTloyJ53XBAnONtInDSsIdE/gqk3mJlbCtA06oVQ==
X-Received: by 2002:a17:907:9d17:b0:ae3:5784:2b44 with SMTP id a640c23a62f3a-ae357842c32mr1267444766b.33.1751382008065;
        Tue, 01 Jul 2025 08:00:08 -0700 (PDT)
Received: from somecomputer (85-127-104-84.dsl.dynamic.surfer.at. [85.127.104.84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b244sm883840266b.30.2025.07.01.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:00:07 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org,
 upstream@sigma-star.at, Damien Le Moal <dlemoal@kernel.org>
Cc: linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at
Subject: Re: [PATCH v2] nvmet: Make blksize_shift configurable
Date: Tue, 01 Jul 2025 17:00:06 +0200
Message-ID: <3078386.UTt5R2Mg1o@nailgun>
In-Reply-To: <7c5b852d-4f29-41c7-a171-c0069771a5e0@kernel.org>
References:
 <20250630191341.1263000-1-richard@nod.at> <2920993.eCsiYhmirv@nailgun>
 <7c5b852d-4f29-41c7-a171-c0069771a5e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Dienstag, 1. Juli 2025 09:32 Damien Le Moal wrote:
> > The initial intention of this patch was exposing the blksize_shift prop=
erty.
> > If we want to expose this as more user friendly, I'm fine with it.
> > Maybe "minimum_io_size"?
>=20
> That likely will be confusing with the existing device limit io_min. I th=
ink
> block_size is clear.

Ok!

> >=20
> >> Also, if the backend is an HDD, do we want to allow the user to config=
ure a
> >> block size that is less than the *physical* block size ? Performance w=
ill
> >> suffer on regular HDDs and writes may fail with SMR HDDs.
> >=20
> > I'm not sure whether it's worth putting more smartness into this logic.
>=20
> This may be nice to avoid users shooting themselves in the foot with a bad
> setup and us having to deal with bad performance complaints...
> If we do not do anything special, we will be stuck with it as a more
> restrictive setup later may break some (bad) user setups. That is why I r=
aised
> the point :)

Detecting whether the backend is an HDD should work via bdev_nonrot().
So, we could issue a warning if bdev_nonrot() is true and the configured
block size is less than bdev_physical_block_size()?

> >> I am confused... This is going to check both... But if you got STATX_D=
IOALIGN
> >> and it is OK, you do not need (and probably should not) do the second =
if, no ?
> >=20
> > I was not sure about that.
> > Is it guaranteed that STATX_DIOALIGN returns something sane?
>=20
> If it is defined by the FS, yes. But it may not be defined, so in that ca=
se,
> you have to use the fallback of the bdev block size.

Ok!

LG,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


