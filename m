Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA68136358;
	Mon,  7 Jul 2025 00:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848677; cv=none; b=WxJr/UpbhZJ2i4jVjimSxHpbGNCoq8JBj1jNhvTzha5BUyzC55eZea80FgcawzRwQp+C1M7VFcCwakQJwN7id8X5lyrcQFMQrpqKGy9AkYPed4GqcSOpMc+szAQ3W26qw55xrr0afAXUcagSybHOa5AAmBiAR7kSfHxf06E3wYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848677; c=relaxed/simple;
	bh=zAnUD9KtCJdNRwlr1SsPM7CZkTkJgzljdGQmPM3CqN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVDGk38ihPdNhsCWf8JNMGOHvCUCWqcC0WqE5YklDzOCouPywqjEUs/UJdb71mt6ImeKCWxzwp7Izy/CJ2aMM+7XEwAfgYEyg7zZbbzlMn5UQzpvPEMY3fBXcRaOvRyzGw5agGLFFcbIrjNRDv+Py9+mkO8rCDhnU+hO6o9PGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsM+Yw0M; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsM+Yw0M"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235d6de331fso32868655ad.3;
        Sun, 06 Jul 2025 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848676; x=1752453476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNrY6+ZLRlzOSHk4+O9s1mEcFxQam/2i0Kz8lDYIBZs=;
        b=SsM+Yw0MzBasgc4aobcyD3VnFYssQLEJHDFEegv26FgNZw5oFs7Uo8mGFs5uDa0L0W
         Ytug6CjN4Mx2v/EBgEoT1Zo5dme+ycnGeY1BGlzr2IT7g2CQkHuQUIl1fcqeTQYi+oeK
         BUOEynqW+kinUmc/fDCZeCOei9+H3uAWviqnomMNtJlYwVgcKBpaacpxqOoEJwCTK/Q+
         eEJwtsXobkhzjm7BnQuA3y4emvKdt2iENqQZY+9izUsMCoeWdvzcg9CLo3VAGP7ay7XG
         /EmGtybAty11nqKhPRUnvPvw1VO/TywErcZlpvLBZZbbFpmjUxTOOnw3EIEBCgKyZiSQ
         nSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848676; x=1752453476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNrY6+ZLRlzOSHk4+O9s1mEcFxQam/2i0Kz8lDYIBZs=;
        b=qMAYsNzFwfLSqCEl5/hRd+pvE1TZZs6Wm2GjszETs9TZ5hX3jxR444L3YSrKFo1qbB
         7vSr+l54Cio5SKhgSPcoB4elRBvXDnZ133uJawllsmFpOWkkH03RLsmpy1zy5eEuZjht
         +tDvWdrfu1BRtSfwUatn0VRbRKY9dArS+jar8l7tYD0GtjvWf/8Tdt8Wfl6I1BIWYBiQ
         fjJ1DTPTE5NM7s51K0vHclXFYbmjtD4LKDxFVveiThqmYx/iYOedGtV+idzZc6+Zu76t
         PArtTtiYap9uWn1uteTH6pXNnEk2D42bLBLcWaFc6MIa1tZ+DGz9OM3rJjD6kC6EMEy7
         JQmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnIPWSUtIRTi1yHbfHb0SXW/Jpwz3yMZM4y6qgbP26BZT+ovIc4+39m9tBA62LBMWzro++NpvgYWKiT1DN@vger.kernel.org, AJvYcCWsgHNkfIVJGg477V1IrC/FGUGU123YwUW8OpVpa5PWHp7nFC8VoRvpRiuNShRPi9ALVROWdgfUKxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvuiiByuqbLudE2JKJY5KHDnq8fxc0OT1rOEmrwiPfLGwQFR7s
	D0eBC+vxQakkm9tBZCnIaCwcx7a4m6V+r/1ysRRfxwAztmqUa1PW8MCs
X-Gm-Gg: ASbGncuPB8xknE8YOB2Ek2GHpsncRsY2WDvdyPdujiU+1ET7mh9vJ23Ipp9qHMO/OTw
	+dw45SWFHiC5bMWKmoILpjWM55PeeQy5In38i45S8980Dd4cmpAaELxHKBjju7Skq823o68qMmV
	K/b5o2t2eIeOmZ7wWLTO4IibDPlqkYnqWgvDod1ppQTTai59sMTDfK4hTfnIA69M6Px7+PHqb/d
	Y7t6fRRIeuH0MWw+kxPFCgaSllgTeaXGjPDZvdu6z05zOmYaw7m/dxY16iflsH897KCIVJ+Ncb/
	T4kUgQHuCumSP2VHGLz/fy+wPfW67vW/DTddpKuJoGFnTm8T3zm1Z1bGNfTpdA==
X-Google-Smtp-Source: AGHT+IFqomMaiUQx6xYBx+Zyx0hS82T5d9OB6cahVs0Ec9X40/os2hjqeigS7zEq32CZ+7/p+NVoKg==
X-Received: by 2002:a17:903:903:b0:234:9092:9dda with SMTP id d9443c01a7336-23c85e7467amr162174815ad.24.1751848675469;
        Sun, 06 Jul 2025 17:37:55 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8434f0d8sm72070865ad.82.2025.07.06.17.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:37:54 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 30BAD424C00D; Mon, 07 Jul 2025 07:37:52 +0700 (WIB)
Date: Mon, 7 Jul 2025 07:37:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Pavel Pisa <pisa@fel.cvut.cz>,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Cc: corbet@lwn.net, alexandre.belloni@bootlin.com, ondrej.ille@gmail.com,
	mkl@pengutronix.de, James.Bottomley@hansenpartnership.com,
	martin.petersen@oracle.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin =?utf-8?B?SmXFmcOhYmVr?= <martin.jerabek01@gmail.com>,
	=?utf-8?B?SmnFmcOtIE5vdsOhaw==?= <jnovak@fel.cvut.cz>
Subject: Re: [PATCH] docs: Fix kernel-doc indentation errors in multiple
 drivers
Message-ID: <aGsW36iFMyp4ojdf@archie.me>
References: <20250703023511.82768-1-luis.hernandez093@gmail.com>
 <202507052123.55236.pisa@fel.cvut.cz>
 <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvQgmq81vnV3ZCt/"
Content-Disposition: inline
In-Reply-To: <b56b9602-d715-4de8-903e-7c97423bf5bb@infradead.org>


--XvQgmq81vnV3ZCt/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 05, 2025 at 02:36:45PM -0700, Randy Dunlap wrote:
> It needs something to turn True and False into a bullet list
> (non-numbered), as documented in Documentation/doc-guide/kernel-doc.rst:
>=20
>      So, in order to produce the desired line breaks, you need to use a
>      ReST list, e. g.::
>=20
>       * Return:
>       * * %0		- OK to runtime suspend the device
>       * * %-EBUSY	- Device should not be runtime suspended
>=20
>=20
>=20
> I don't see any of these kernel-doc warnings. I would guess that
> either Pavel or I am using some older/newer version of whatever
> software is causing this.
>=20
=20
I think Sphinx reported these warnings on docs-next tree.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--XvQgmq81vnV3ZCt/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGsW2QAKCRD2uYlJVVFO
oyJzAQDzJppB4DCZsSu+JdRPBcJe+R+YinxYKNBSIlfdgfoYUwD+PExPXFKqdPM5
7tHoiUykp70vT1eue9L+N9Xa4D3WMg8=
=jk7j
-----END PGP SIGNATURE-----

--XvQgmq81vnV3ZCt/--
