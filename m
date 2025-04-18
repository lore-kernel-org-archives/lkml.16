Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887426FA7D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970197; cv=none; b=PTF1IpvZ+IlSj+jN5+RCs2Uy2bzrVPUaUZDOdfgWpWkTNpszf7fUFbxs3efa02E21Gl5nEBzVtF1nD2KXeiXGoqiusShOp8Xk7mLOIZKyluXz8T8pLZ1gBdkcsQcIJ9xbeuCvI0mmHvZ+TArLRbAcetUry6vWaUbTK1aLOtMsDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970197; c=relaxed/simple;
	bh=hM1nua8IMu7YUoSgs1TX0rQTKLFRsIjo49Zlk4QyWcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JS1DoxQ/9zGjcdK4Zs2S4AWoFPsJy07fQdLslIj8Z4NiO8IgHzv3QJUZH+7fq0Q7rKLVZHSfsO9yQywwDvaxg0jGRlSdc+xR0/FAyHsGBEldLLQ/n9fcsykrVMfK0jyTzfikM5llDTnBbEPm3qWBRSoT21tohns3eaM1IUvzhUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=eQYHPr/f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="eQYHPr/f"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0782d787so12047865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1744970192; x=1745574992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKwnVUZzWyLWE8JyyGAoHutnjyrjVjeY7Q2Qvd5+NgI=;
        b=eQYHPr/ftDkNpgn41kCCRqmwO7GpyO9TE1asGYnHyzOmIKzsv3i0Vp52o/2M/93yTn
         NaCBp+9jLdgm7bn8xeXow7IJMxJbmoaLEwAaPtR0UNKDdQWRsEXOvBoKcwrAGguC7cKg
         zHNnXxreTyDXmed0Lq+ULpZF9F6miRrPtlOn9tsRhRCwLjYGMfq6dPm28nAIYWq2VIXP
         RWrO13RibQorbDa3wbDP+CcSs/IYF3HeoevPH4CP1jmc2g437epN4UvpqhtTb5OB041H
         HHTP+XTdk9LyrTGgX7XBjpV6tB2U5/QDeWJYXfF0ZXu/zFmwDENe5xvyfPeabLYf96Sf
         cPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744970192; x=1745574992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKwnVUZzWyLWE8JyyGAoHutnjyrjVjeY7Q2Qvd5+NgI=;
        b=SQWm++3VUTYqm8tfFNyYgpU7y+2LTZApCOFabO9dLGEz7fl+B530FRpPIGo1yb2qQm
         VviCKJumsMpbubJZxk/CfWNZ5lrV0MJqkwrX/NcijJeoWqvaxQMfS2xWQ6roCzSlBKB9
         TkWOisiKmzgrjORPBpObpe2m+n6SVVjatE+yNM9YYCzGeJRXRo/92FPC4AuVftelJegB
         N5wUnjsFl0o1bDRkx8MEEf/xvfIyXJoFldL2H5xoA+mtcNSb/gpX+ZyvPvJLidr5ssQJ
         4GAqskGA9A3HQY+v1bjJDUaSz8A6vCKiudwkJJnDYSOX64NdY8ZxIScERKoy1Z3tBBz6
         1oDA==
X-Forwarded-Encrypted: i=1; AJvYcCXvRjiJfpXDsyp91IIUmrpkfcMSId2FMEer84Qm621RBW7OB48PrUpwT0TkTP5OqZimBjiy7pTlzv8p8u0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDUstcycAbFz5+HBanNqkR9oKycZpinuxIj/NdWbGygRevG2K
	MrDlO7WBQn7/b+NtRdf96zr/OvPhRoSflYXTxAtinoO1NlItj3LTzXwathGYCv0=
X-Gm-Gg: ASbGncvzjLVyxqVE2lD/bHq6F2OvAKOKRotea7m9fessWvV6PIUQ1WBW8Ryb7BEEUmD
	ROTACF8M1wJhqEF163qLuJnYJZSnh+tKcSewzmohM1Z2CaWy/bKdmYZHo+H8YPgNFe9uHcFcx6X
	HFyY1jkFyvtDx2f1CC7t2RBqpaEEN3irAfQq6PWN2rzxE6xJRojd92SKi2tuyKmi0x4kBptQLjI
	5sNfI0O2WByyFluLVzGFKg5Zcww34TheHAQRiNEqgdzNR+8ORS0mmhUEE10hrwApKTnHGJTauR5
	Fkztl4iSmW/vG+vnnl/Fk1JuDHPHkgeZwdOAUYG+Ro9QIp63rD5RjVkNoBTE6reHwdxZmCv2hgd
	dbDuWHglwJ6pUHbz4aDw=
X-Google-Smtp-Source: AGHT+IG9b1OB3VsBXUNUUdwj0UHGJGJRVzsWYf3XpNWMufy6eEpIMx2UZrm1XP7AbfDFr7UroQvA0A==
X-Received: by 2002:a5d:6d88:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39efbad7d40mr1549867f8f.43.1744970192344;
        Fri, 18 Apr 2025 02:56:32 -0700 (PDT)
Received: from somecomputer (84-115-238-41.cable.dynamic.surfer.at. [84.115.238.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493124sm2269912f8f.68.2025.04.18.02.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:56:32 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, kch@nvidia.com, sagi@grimberg.me,
 hch@lst.de, upstream+nvme@sigma-star.at, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [RFC PATCH] nvmet: Make blksize_shift configurable
Date: Fri, 18 Apr 2025 11:56:30 +0200
Message-ID: <8418057.aG60p0z9Xu@anvil>
In-Reply-To: <0e61c6e9-10bc-4272-b446-31e0d67547ce@kernel.org>
References:
 <20250418090834.2755289-1-richard@nod.at>
 <0e61c6e9-10bc-4272-b446-31e0d67547ce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Freitag, 18. April 2025 11:37 'Damien Le Moal' via upstream wrote:
> > +	if (!ns->blksize_shift)
> > +		ns->blksize_shift =3D blksize_bits(bdev_logical_block_size(ns->bdev)=
);
>=20
> If the user set logical block size is smaller than the block dev logical =
block
> size, this is not going to work... No ? Am I missing something ?

Likely, yes.
TBH, I'm not sure whether it makes actually sense for the bdev case to make
blksize_shift configurable.
The case I see most benefit is the backing file case.

> > +	if (!ns->blksize_shift) {
> > +		/*
> > +		 * i_blkbits can be greater than the universally accepted
> > +		 * upper bound, so make sure we export a sane namespace
> > +		 * lba_shift.
> > +		 */
> > +		ns->blksize_shift =3D min_t(u8,
> > +				file_inode(ns->file)->i_blkbits, 12);
>=20
> This will work for any block size, regardless of the FS block size, but o=
nly if
> ns->buffered_io is true. Doesn't this require some more checks with regar=
ds to
> O_DIRECT (!ns->buffered_io case) ?

Good catch. I'll add a check.

It's also worth discussing whether we should limit blksize_shift to a speci=
fic
range. Right now, any shift is accepted, and it is up to the user to
use a sane value.

Thanks,
//richard

=2D-=20
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8Bsigma star gmbh | Eduard-Bodem=
=2DGasse 6, 6020 Innsbruck, AUT UID/VAT Nr:
ATU 66964118 | FN: 374287y


