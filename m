Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFAA266B52;
	Tue,  8 Apr 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102067; cv=none; b=KiKT/Pgqbr+ccQgZ/Y9VqLRKWmccMldUBQqfowj4qJQaDCvNCmCtFqzwWltkirLli7iAhanSSh4MCmOJEbudkN5aruUwJbf+uTZnN5Z+ygCbGQ/pcmNzF5Ykl8x5x9oU3hymG0FSSWsqISM+6AkOjIlYM6ezDziIzV1ejJsvGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102067; c=relaxed/simple;
	bh=d3fTvX5BZTPRs8hQ2VMYCFfr+KnxtkagbC7FLYvrnHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GojSPCPwpwcWhWlMYCgd2EJZygXPw5x02nVd7LUh6C73+q55Czqt30U/Ekvzjjn4YoTQ8ZrpBJHJBvjTmdJukM/9MO9KJK1FoUEw2/4O6be7NEb2MqhBylwjTxnyN6VIKTSvvyWeZc+9WV5rI+Nfbz/MtodKPqmY64cYliDhEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe1N0b15; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe1N0b15"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so6324904e87.1;
        Tue, 08 Apr 2025 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744102064; x=1744706864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZjJJ3Y3msGY6Y5zjatg8PUOypRoSEmuipNZV0rAkh0=;
        b=Oe1N0b155UTrKWPX2tZPfB8MXtQJrSvJgBPuY48Pocwe50rSevkyfTa8qukSK2xa68
         +a5xPVAE2TCCw1L8cdZvh6GP+PClEW3iYS2dFTAzeBt7xp0tjx/lPehiNqo3CtnBwYhO
         TKDSYHOUt9a23XEjCmHMW1OnYc1HQrfTRluDTLwZAJO0exK/Sy7V7o8sHWndN63cuH+n
         2o/GenBoXKXVwlEe98ssVf87amA1R0KKJQYK06i+Ge07CNPP7MMClSP7YqOSfAnpklsm
         E45coJUTFtyfjrum1wX5gzM73RW0/i3k3nh9ceBUZ6xKwcFqmVz6vn6Xu+yqUOqa2gcT
         flUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102064; x=1744706864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZjJJ3Y3msGY6Y5zjatg8PUOypRoSEmuipNZV0rAkh0=;
        b=KrCj9f9jhl0kBpqb9tZz3QKEFYiUouA+9tucLiTg5F9oxVu091en8hzds4dFIpl/EV
         9xUlk3RHlB3ftPsiOcVXyBHmlWzGXMFIenM7PL1Q0pPJCiOxzTYU92BddVv2M8O4Fizf
         d0tpB9H/qUnZOTPEZ5CVn1QMJ3oaPMnm/PkC/IvYSI7HLN1d0zkDYZuWpLm/wB4mSmtZ
         XikzcfHhVg+qI0WJnwbrIAoVQu1dO+a9oZ74rUYE05aEFEedY+TsQDrWUh5BwfeBLMvJ
         JSAQCgKLCwF4rHFPDI9SAkXnvXxA4lmGh4oxIFEeaK8pjcLSauFgCIXwFZwM/wRUPAA2
         kaJg==
X-Forwarded-Encrypted: i=1; AJvYcCVHKjgJOhgQl39yMbCFsB2I++fSINewQvCriNFhDizTwPPGKtQYMn4h2Ao85mPGILx4bwGMhPiHi7zZ@vger.kernel.org, AJvYcCVqJDbMqwF/1ARxJHzOiNnjwH+rci96mp8lQj+fusyxwbkdPayUWQZxTxDqkT/4wdA4EyxsZdLzvOL0WnAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+oSvttQwuZifF07iwywCVjvK6IDnfURkXh9BJuM7gzh36EJx
	kQohehlkDQ2i8HxndJ+YkrK5VwfO1BZR9Z7OsYFdc+RGs66L5GKE
X-Gm-Gg: ASbGncsOFeqUajoFaykTJL0nRp5fbCceL4O12C8YHQFeHKaH7EjhoRYBe93DfDbZgAf
	lRO/tnsDnBC4n0ElLyDSPPODwzbcC6VgLKXOdF9aP8Wvi2v/UYhcj6vEW9omq7XO6x5vYC7m3nd
	mTL9Cr9+RkuwF9wKeEXDMvNHLwwBqJIyZ9YhXMstCPmznZERKfvwX3ebq4rZCqZwqbSAlePkexE
	l0Y0lBnfSR1RLxNtjUHIrlnx/Kzi2ScLj0MIqbyGCHPKaUxDEgzcLxK6upb3/CMaBHSAqKVzUKk
	UAN5YvT4xAK7gnf3s88GJukQWAhtNp5m8qNHcnLbf30vJL0=
X-Google-Smtp-Source: AGHT+IEspu9bvS8K6ymNPHWqVaXJQF1y6gERy0Ugs1WYod/RIPWOuIDKZQKk76TcgIgQ7OtQI6hyFA==
X-Received: by 2002:a05:6512:3d9f:b0:54a:cc76:1676 with SMTP id 2adb3069b0e04-54c227f8f37mr5156194e87.44.1744102063985;
        Tue, 08 Apr 2025 01:47:43 -0700 (PDT)
Received: from mva-rohm ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65ce3esm1459572e87.166.2025.04.08.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:47:43 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:47:39 +0300
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/14] MAINTAINERS: Add BD96802 specific header
Message-ID: <872fdf7c24d1ff4379d1234f03766bda64c5c5b4.1744090658.git.mazziesaccount@gmail.com>
References: <cover.1744090658.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oO1EjVqHxCEX0Gpx"
Content-Disposition: inline
In-Reply-To: <cover.1744090658.git.mazziesaccount@gmail.com>


--oO1EjVqHxCEX0Gpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add the include/linux/mfd/rohm-bd96802.h to the list of the ROHM PMIC
specific files maintained by the undersigned.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
v1 =3D> :
 - No changes
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..82f408e07e2b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21000,6 +21000,7 @@ F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
 F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-bd96801.h
+F:	include/linux/mfd/rohm-bd96802.h
 F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
=20
--=20
2.49.0


--oO1EjVqHxCEX0Gpx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmf04qsACgkQeFA3/03a
ocV7ywf/aQPC6wzuJuLhhN5ZGQPBcHH+gf8g80bKxpKgLVweaAMR988vYQ8g1oxJ
z7A87RgukgK8zNUrTuIR3qGWsaEw3giRcWhcIH5dLvCPktwI0tqSGgeXMKWxsBTz
j8InzAQedal7tQDwb/OowDkFMimM/zO4YL5nYzPLNonNRTfsWoFxGgMty8tKpaSN
Y4LskZbdE8hRaB+goTjwojKPkUhefloXOpZJWugf+LWYBYZYLXkG/aOBy9dmNRre
6UVTFYNYt/TMfMEd41J4SBWJH+Qs4he41oPBXz63KJVT/IUQM4Imw8v171Uq36I1
UEPBexl54xZ8dzIKlZgIWnhxcljHQw==
=JPNc
-----END PGP SIGNATURE-----

--oO1EjVqHxCEX0Gpx--
