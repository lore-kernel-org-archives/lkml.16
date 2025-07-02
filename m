Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE363219A8D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439420; cv=none; b=EQxppiTIjFMR63HY/H9Rv1U/m4sy0o4P8SVi/ONc0dUQkh7gKq3NQJLEJKxXhGDyAsglN6Tzqz4DF4OJ3AfiZG1IRBRQf+JNa4IWfCey3ZzYNO08cSXyv5O1vle+501hXwYR/X+EBbpe4dUGattGkAmyorFv4gtVAqoxyc+g77o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439420; c=relaxed/simple;
	bh=9eFrBc3CS0s5eRZe4TX90lJvu9nv4qiEyGC/5tT/NJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0SkxRsWcZAS6RBt7mMtmoWgN4TG7FqeEqoQSyh1xPrgxymx6SzkJlV59GQ1MkixdYYncM+8PV3o/dSI41lhodaU3LqaRNs++TMa+ERrgeGItw2qNtN5tolJeCOF3fEueWYm50hkeDX/3zhPshG9/z00GDA3bATVi2cADHOfLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LwiNaZiM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LwiNaZiM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so1050919566b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751439416; x=1752044216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOe6l+hnnDWpgVQ5T2IRCQobbWufOXU+GDUIqrC5HMg=;
        b=LwiNaZiMzHhn2KFZckUaLewPH9CeLnf7H8fAHswS8PAbQMmmlA0U7tqphTWKEl8pjS
         WfdGVoOY68s95unSQSu/2R/YBnFUDRCoGFMRPTkwwlGCg/QQjkYf0RUVB8AacvX613IH
         D9zGCtEyYbcAckUxBV4sBLnQLVKmhZ8rbU8l3oV82GBktlnUOhvy9QWK6TYJJQyS8IoY
         Epg0SK1NTQCSB0DDphWVs7WR3DtiZWZQX10n000OGxyJTv/qFOERZCEpCu90f3dzQtQR
         RUzrr8xiYi54WuUv5e/jeVTWo3NKAyT2ERTyhsi9wb0jmac6kAifg+l3eY98o9bt0rJP
         3OnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439416; x=1752044216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOe6l+hnnDWpgVQ5T2IRCQobbWufOXU+GDUIqrC5HMg=;
        b=nUbAR2DRG4dsZZd6rM7UHPU3dQ+1uFHU8wg9GGs4SyWg6PysWfghcQUdgM6gT3nJl+
         E94Hr7vgdSu+wjj5ZgKvQUoZl23iCqxuAZSEiPx0CJjSNKnUEeULaM3iwtnkw64mwwwM
         jOH0iZq9lVqfTvaWAtTJmQlV3tILkd0c5JolCPjFERxj1HpmQP9bQJwsGGggLq3xkOUd
         u6bduSLV2QfCj1iusVKsDT9NJp7WbIPkadD7HYzEgNCKyiTkJ+4fttcgfBJlYWN5MUHs
         cmsxJwYntaqMB4xXJBsDc6QP8DqZRgIKrZb7YRx4vEEiFIBOTFzE2OJPY53YkyQ+5N4b
         CrTw==
X-Forwarded-Encrypted: i=1; AJvYcCW8a6smGhxtUJYecq/mShMzUqxMH/lXLreYUIsqr9zA2ILCLDNW4fjMPmxR1siJ2d5zLoyTM8JddoLzlHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YycaC/zIAwKa5wk7xxy4OhXNqj5CSqq85fCFwhxjScAacydYiWH
	PH2nLjW35KD7AUWjrk+SYBeMdV2STzuQu9Z2lb7ZGZGYiMO89d/bFP91UrQBI5fO6/IzdWsRPgi
	xueeW
X-Gm-Gg: ASbGncvES/S9T0u6z/JhMm9eVo+MgJ3XCkw/TZvpTfDM36Eu8xjFxjR8ploZYciU0qu
	Ld8quGYxbTl7lPTY7UjQlxu+GQhq2qENwUuyTv9KkyYEDvJy5SoSI2H5XLbs8VkBg4Goj0s6ON3
	cI9EfaG98OOQou7+1phHfNCyLmAr8959fYC0mmbr0+q7iLmGrWYhxoKRNVqOuDyj4VJH21ExaiM
	F747QOw9AiT6HVn1k97v9wqUTe7DZyqHomfb81OdFISruDHyJe/uM7AGib0fTVsqQEiD0WwVnpD
	XlRErCO/NndfCHurzZEtU9b32UMpPVjMgydJmm8zw3U6iYVGYR+nSe6ECY9TwMGcCIvo4P6WD/B
	QUWvWWID/DNHPhV/Nji1sgGoVCzQF
X-Google-Smtp-Source: AGHT+IFoKsJw94/wzTydj11IzCh3YDjPAxZ2CqM2G/p7cByZKvSoN+eZ45qdXfS7kzmYtM3eR/AecA==
X-Received: by 2002:a17:907:944e:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ae3c2c8b851mr173206666b.29.1751439416184;
        Tue, 01 Jul 2025 23:56:56 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353c01237sm1039763466b.98.2025.07.01.23.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:56:55 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:56:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: ad7124: drop use of chip info array
Message-ID: <iqs5ktvnz7rkskwgnsdanhezfztdzckcr3e34afk5ece7ap7e6@my2rms6gcrkb>
References: <20250628-iio-const-data-5-v1-1-9e56c2f77979@baylibre.com>
 <20250629182531.6666f690@jic23-huawei>
 <pmqc36lr7filq6gu6bplg62qb4bx7cc7nx3ylsjuczv52cdlxr@2bdgzwobw3mv>
 <20250701183751.5701fb7e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vfbpqpdlkxekel6h"
Content-Disposition: inline
In-Reply-To: <20250701183751.5701fb7e@jic23-huawei>


--vfbpqpdlkxekel6h
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] iio: adc: ad7124: drop use of chip info array
MIME-Version: 1.0

Hello Jonathan,

On Tue, Jul 01, 2025 at 06:37:51PM +0100, Jonathan Cameron wrote:
> On Mon, 30 Jun 2025 10:15:14 +0200
> Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> wrote:
>=20
> > [...]
> > The patch looks fine for me. I remember having considered creating such
> > a patch, too.
> >=20
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> Applied.  Thanks

Huh, I'm surprised. Did you address "Current title kind of sounds like
you stopped using any chip info at all!" while applying?

Best regards
Uwe

--vfbpqpdlkxekel6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhk2DMACgkQj4D7WH0S
/k6ldgf8D5R6jn04kD9601IWxrhm0/1ydI1jKkdQJVXQg0urrnxnfosugDc9C00b
w05kCnwGWQ6zTd9bRe1Hah8aG8amdMNqZM4e/GlzPniEz1Gyr4Fc4RmZkrfGCZH4
3z7bjTtN5fGFxYRm+eEbIn8fLE/Xlxsui2jQP4HhKCXKSaj7U86aCraYXN5P0pRe
nnSEFudaUUZPzsEJVLDCIG/iAW3Fqt+OmXTuRE0wtrQhgJ1vZcFsr1TO0+eIpNJe
Nmdc4cR2mHhhoo4xNl/xSCiI+iRkQSnYvzRcRmZHpJ6Uve/oYJ16THMsJbk1swKy
XmOtdaXQXVbqdEyuGDqBOT9SblXazg==
=jPAf
-----END PGP SIGNATURE-----

--vfbpqpdlkxekel6h--
