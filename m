Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4BD241CA5
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036560; cv=pass; b=bt+erHt1Cl/RHuYu/PgWZkAwPV7NxjinDQbe8l8OxRLslmgnW9HQb8yPisTl+F5o9DAp56VYJpgofbLKBV1TnvK4ovFe9DSJy0ZFuzDb/0eaBunnfVC8WLd/trxLoAI5rcR0CK8Ho9YN088GcqmvS4dzU7gPnT+n7dusIF1zNKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036560; c=relaxed/simple;
	bh=mLhayLuyDboOz2U+qDH9S41X7NRkERNLxZ3NKgGpHjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9Pejp+j6BPRFfpc5SVjYNsSsYMSuoLJlc/bnmZB/D7Xcutgxzq4UW4h+wCz6nC0LESwE71gfyfgP1kGUcDBNHGMXHSZvYX8B/wvfIjFtfpA3jRrQfgo1q4L0kCBq0RKU7ebEnKXYJFMvyMER0kHMgqZkCvZmPqzCIBsPKvnPVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=BGoKbXlp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="BGoKbXlp"
ARC-Seal: i=1; a=rsa-sha256; t=1739036548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UU7rJaTHqPrCdz5Idv7lA3EBmHqjRi14c+xNk1voSq3JxSqdvWJGePirDgC3aT1Yg0GeIT6fxlf9F9h0hp12YUld/HLpOmyeBR+Ih8BNtq8OhQRAsDLICk7gCRVU1z4axpzuMA6J4vQy4BKBU7aC6igxLqmlgE2PQq5GT+oBtC0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739036548; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i54Z1kYi2errV6FSjAGuXOU36ICII1ivXcH5Kd0r3Gg=; 
	b=WcVPaxtexvcF1UxeGQAd1YPpKKbF+d6vInVpQNzKjisZwQPmGVK54r5c4nEKLnhBR1XN62JGbJ4N96gE45m+FseqJ3YgjP9UC7ocTGFDee4jQBqTbRXFgIBmnz3oSq8VHcaKpt1JRTGkAe3s+Xbhphz9A1FwOMgc8t5A4fFY/aA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739036548;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=i54Z1kYi2errV6FSjAGuXOU36ICII1ivXcH5Kd0r3Gg=;
	b=BGoKbXlp+yNo4SjaKn54/gPox0Jqb3ZkhKgsRhFSW5rMgB22zBOkRn90cf26aUP+
	n7N7vK4BsYbukm9nfvGc7K2CrlLRKEVssH4rdgbGeBwUW7pMbds1H8H5Fnlyg7ELv8b
	6gXAuXTUndA0G26TkzpB6HGf3GcTKAcslNan7Puk=
Received: by mx.zohomail.com with SMTPS id 1739036545342717.44347943493;
	Sat, 8 Feb 2025 09:42:25 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id B9721180616; Sat, 08 Feb 2025 18:42:21 +0100 (CET)
Date: Sat, 8 Feb 2025 18:42:21 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Zack Rusin <zack.rusin@broadcom.com>
Subject: Re: [PATCH v2 17/45] power: supply: ab8500_chargalg: Switch to use
 hrtimer_setup()
Message-ID: <roiad6zbj4z2zizl6muhvlstwu4mvsh6f6g2tf2feps7ihut3g@aknn232lzqo6>
References: <cover.1738746904.git.namcao@linutronix.de>
 <fa0bf7376ce8f124c8285a52d9f55d0ab4c42988.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwgnexoc53fzo4i3"
Content-Disposition: inline
In-Reply-To: <fa0bf7376ce8f124c8285a52d9f55d0ab4c42988.1738746904.git.namcao@linutronix.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/232.189.87
X-ZohoMailClient: External


--rwgnexoc53fzo4i3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 17/45] power: supply: ab8500_chargalg: Switch to use
 hrtimer_setup()
MIME-Version: 1.0

Hi,

On Wed, Feb 05, 2025 at 11:46:05AM +0100, Nam Cao wrote:
> hrtimer_setup() takes the callback function pointer as argument and
> initializes the timer completely.
>=20
> Replace hrtimer_init() and the open coded initialization of
> hrtimer::function with the new setup mechanism.
>=20
> Patch was created by using Coccinelle.
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Zack Rusin <zack.rusin@broadcom.com>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/supply/ab8500_chargalg.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/power/supply/ab8500_chargalg.c b/drivers/power/suppl=
y/ab8500_chargalg.c
> index 7a8d1feb8e90..dc6c8b0dd1cf 100644
> --- a/drivers/power/supply/ab8500_chargalg.c
> +++ b/drivers/power/supply/ab8500_chargalg.c
> @@ -1787,13 +1787,12 @@ static int ab8500_chargalg_probe(struct platform_=
device *pdev)
>  	psy_cfg.drv_data =3D di;
> =20
>  	/* Initilialize safety timer */
> -	hrtimer_init(&di->safety_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	di->safety_timer.function =3D ab8500_chargalg_safety_timer_expired;
> +	hrtimer_setup(&di->safety_timer, ab8500_chargalg_safety_timer_expired, =
CLOCK_MONOTONIC,
> +		      HRTIMER_MODE_REL);
> =20
>  	/* Initilialize maintenance timer */
> -	hrtimer_init(&di->maintenance_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -	di->maintenance_timer.function =3D
> -		ab8500_chargalg_maintenance_timer_expired;
> +	hrtimer_setup(&di->maintenance_timer, ab8500_chargalg_maintenance_timer=
_expired,
> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> =20
>  	/* Init work for chargalg */
>  	INIT_DEFERRABLE_WORK(&di->chargalg_periodic_work,
> --=20
> 2.39.5
>=20
>=20

--rwgnexoc53fzo4i3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmenl30ACgkQ2O7X88g7
+pr6kRAAqjGtVpLEURDXAQF1ghHM6vgpwW3UqR+iCv8NZ5VkMsP/45jyVKcMny5J
CmyyBPmTf94bYANnUFHIAZqFJ7IWRRpQpUKwKzsBTACwcqq4ykM8BQ93xgcwHzCl
SaNQtncDSQau+DDF3zC6U//zktSi+RVSlE8SOmtI7aSyJC5npuEZvINUQDQfnJee
im03kyfIRV8n+ANkaPFlUuSbMae1JDyxXZMVDu4t3p148FtZOZb9FSE2UKj0YGWB
xlBHT/ziS8s2dwdnJLKdJumoXGT1cuZXm7CzS5xvz4x3DBaWwwfUBEnwZwJ2NmP7
E1mRqGNGolpbjZnIGe0e+U+otrEIUTxlQ48WpI9EGs8P9pzCVJkqk0VfgxDylZrJ
zscFHaWc7PCFoW9ZpHkBr8eieMNenawIcRxYnp4cUP+nCqSl0umWVKJc4+pQNTmU
VaTRsNX1vk/jwzOt2lG9aFESP4rNZmhETxZicD1QL0vCC1qDfBRPfkSTLGUjfX6t
BEWhemqZIuXGPnYA6YwaQcEUS6AOv1GSWT6hz+Q1Ktjm66trvWSQl8YA7MR5/0Da
8uw2jnl5teWeggfG7TSFkf1XEnBbj9y/Q7LUny3TNa5BreboNdD5OnJCL466g8uA
QbOtCpp79MP0SEv9OVHJ0LeBMXgz0+zn/er9usweHObO7UgEQnc=
=V+1s
-----END PGP SIGNATURE-----

--rwgnexoc53fzo4i3--
