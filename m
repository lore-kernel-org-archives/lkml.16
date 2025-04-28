Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD21AD3E1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859623; cv=none; b=i3QMw0O9KE1zCi14dDEumEHPLnKOdOQ/OQ3tMgjAH6R3UFve/E6qdT9NoLq+Ev3DDwvIZx3stxLpOvWaDveMDJeOgHVu5sGzQwrZuV9SzubYLx+ANT5JJ0ZshezWQr8PvMzm8l0BX5neLYyQI3HXmKupYnIiMWrWtMFuY8h7emQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859623; c=relaxed/simple;
	bh=w4x84lODS+QAHRN8EMLjw/p/t7a91E/LLtSBryDL7eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unFiuEaprg9c2nEEgx3ZbUrtfsXtNBgeMnkfbJ4l68B1BAaqppvm75JxbSTJG1aQ6wkKWFHvCBUH1H6ftmD+Lm2xf18kdGdS6M1Chx5qEaZLwnvPQPGyoLWX223qIxGWSqx4TPs9liBgnQXNiz/hLzqMmDW6oOscSqjfujFzSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fQkUyCoK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fQkUyCoK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c14016868so4952222f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745859620; x=1746464420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8PGEVntBYwExNM5jR5HyOMl7n0XplmYVb/kJff+sOo=;
        b=fQkUyCoK48BIxU+avdaTls9h8P1nEwfJ2ILef9Y4Q8ccniS6aEaQaCFEg9P6IJIT+D
         E54jsjJN0sw7YWqvbmcWveSbp4mlce/3+imyOzFIdD1XiaMQnRuA6zImN2c6K0br44Fx
         BGLTiBReeE7wnKr1ji1cCeS88+DpBKzIt/fa9vhJUxbCd2EzmFk/cScXADrE49ZF/uKO
         iLNOIp2pIzH3HyOLT2NRi1cHXItGV0kOMul6baVZjBha3pEpcHHaDPO8tIXb4ZpZuQKn
         Vf31G7GCcX3QyAEqPjZyV2guByoSVDoKkjhoTt5QzPshksdN7Nd/6w04udeO5djRz8wx
         eqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859620; x=1746464420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8PGEVntBYwExNM5jR5HyOMl7n0XplmYVb/kJff+sOo=;
        b=LRegSjLx8RS4jKWGCqa7Klliiy4A+42wS+/o+o8n+ywsCQZYo7i5jB8RxRhvDHY9Cr
         ybunr7kVd499infGw1H2CiDy3TZX1vjvfY8nK0qbBHZ+H06tJWCIM7Th/husPSmpGy6I
         epI8YlQsh9UXDNFqHw8V5UrRA1uEUxwFx0V/3GCqbFbgGM9McBS2dJmV6PoiLtjmNLYv
         LICKg8y3tn+V4yUVrzfholvVZPeuz1d/bBhl8dgwudKZH/LEyayj2p8GK6TwAsGxWqJ+
         tVIl60QWU88EfyYNQnpky24ZxBNxPOMopIJNpZFVOF9W2HiKqmHR4CDOBpQ4EFp7DFzr
         7mBw==
X-Forwarded-Encrypted: i=1; AJvYcCXZvm+u/fXF0gXPyzFjCOP5+cyWOHiirRd7lF78hZs19IpxCvyZPjLAW8MJxaBrrDeH4MiwtL+fyMgzvJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhABVrfwLU4Z3LW+n/mW1rVd6xZfXbEmQwcFoB+6NJMaoR57Pv
	4W8YxIdfq/a5s48tUy+P2bJTiHHbwR6ZW74V2gkvYX1yFCW9ePshmgdbcf/Wy3U=
X-Gm-Gg: ASbGncsABuh+faVUHvzLlIyorT+XxiMOSu+PbSwI9ZiaRZ7iVkkPyhVSMGjDwCxUqgb
	ZXnJQRzM7DveREERovi8YswTGorDI6d5wbM+9ugyq6qEcb/IxNBn4geBFiOJ7ip/zGpjadt0mJ7
	zjg3c9VijO6obBHU9n/YN5cwHJI2wfN/Yz93w5mTXUWCHv4WEfvbUaD/Z2Z/MT58zUbhAt9ytB9
	hFXxd/bPVnh4BVMgpqWzX7W3+nD8hpoSY2OzICo9pQlSmVebZi9WiBgnHuaFBt5QJ+oDCeAe7vT
	xABhiizmaPZ9SeHIXUZdCreYjqaSh4wnItg0B6N50i/ncdPW0CNOgNS9ieuM9BmxCiEfmd1Uoj2
	4yvgeJKQ=
X-Google-Smtp-Source: AGHT+IFVZLb8kJuqkDFjP154IUhR+bkr5kl34F/44rfPGoLzIVhDYQRN05232S1PIENpaWF7X00Ssg==
X-Received: by 2002:adf:f048:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-3a0894a1978mr411147f8f.50.1745859619771;
        Mon, 28 Apr 2025 10:00:19 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a089edeca6sm183876f8f.40.2025.04.28.10.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:00:19 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:00:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] rtc: Fix offset calculation for .start_secs < 0
Message-ID: <yhcdgillcnlwditdmitklbhkfd2lh5on7ibvuqdxnhricjoele@c246pnf4uc42>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
 <20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ja36ara4ddswchsp"
Content-Disposition: inline
In-Reply-To: <20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com>


--ja36ara4ddswchsp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] rtc: Fix offset calculation for .start_secs < 0
MIME-Version: 1.0

Hello,

On Mon, Apr 28, 2025 at 12:06:48PM +0200, Alexandre Mergnat wrote:
> The comparison
>=20
>         rtc->start_secs > rtc->range_max
>=20
> has a signed left-hand side and an unsigned right-hand side.
> So the comparison might become true for negative start_secs which is
> interpreted as a (possibly very large) positive value.
>=20
> As a negative value can never be bigger than an unsigned value
> the correct representation of the (mathematical) comparison
>=20
>         rtc->start_secs > rtc->range_max
>=20
> in C is:
>=20
>         rtc->start_secs >=3D 0 && rtc->start_secs > rtc->range_max
>=20
> Use that to fix the offset calculation currently used in the
> rtc-mt6397 driver.
>=20
> Fixes: 989515647e783 ("rtc: Add one offset seconds to expand RTC range")
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--ja36ara4ddswchsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgPtB8ACgkQj4D7WH0S
/k4BbQf8CaVnrNVi6ALQx0pdjBVRl4aZiV8PktMUnlHkY8JSNIN278Iv1Mutq7Ed
wrgvm+tuqXDlFvKXApQnnRnokZVh0uYQ18ES80Qu/YuSzp2MantS38qlFBNOQ8ns
Xwg3q2+VrwFjgMRTKuK+rwyjpUXt8HN3TFiy1bapwvQMHFXoCCHdKbYxOGVRPUrv
0ztn65TRmEKjipGpQr/E7g1xiNMVKXR0jfKlUi2U5fM/TEoK6XLq+tfssgvseNNM
Cas0rfDR/ifOqCWuoyUronLpRdRpCP88k/29K1riZzRUbW5bWlbmgZjbXKW1VjrZ
7xBwGCBsnrfHdQMO0XXap0jNbpybEQ==
=MS12
-----END PGP SIGNATURE-----

--ja36ara4ddswchsp--
