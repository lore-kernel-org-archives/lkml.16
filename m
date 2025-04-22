Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E0E202F7B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328191; cv=none; b=WZJafK9pGb1F4v2fuogV19edjaC9hcF6W2gehaJo5xpLYDhjCX8oU4rczk6oOZMI+pwO/uca2KD/b/mD7F+tMPRBIyfpI8MhZKKvjL5J60LHIdSVHyQMbnpTpGH37zRHnY5KsCh1tg3eV0SMtYG9ai83IRYiw195/OmuKuDBwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328191; c=relaxed/simple;
	bh=T6BFpCZl9AoINT6Ex02mRD3Ooy8AIElkY/zLbH4XYRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k64KWMzPU4EaC3092iU6CTCNQ3u0abVRrRy9byQVH9Z3hjU1nKV6LloSAcODkqbtXytnH5sYyMSzl0eRmz/qK9HizgtvUVbOS0Ws6f1QSaz5TsusdXbDXq8iiddMmAEMNXQ6uIQRx9J0rOZQb/3tlZV8+tgdo0e83eE0tS7qB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=T52X9DK5; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="T52X9DK5"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3B3D81C01AA; Tue, 22 Apr 2025 15:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745328179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TMAbiJYVJtJSr+YFUaxSCd6f4+Ss/TwS1JUmpuPhtZU=;
	b=T52X9DK5t5NL+dAKUgdl37zrkup3G+Q9hS394OKU/ZtaSMtq558NYlkc3kifsf1WsIwxWo
	2bLf/uUdzQwQD3vQLw3XEBAMxRqI77fOpMlv5gVihohF4Ii7eh2/nJND7sthN9pK/b+gSx
	ktEPyha32+aJxlj8pMue+ENVuSXYg78=
Date: Tue, 22 Apr 2025 15:22:58 +0200
From: Pavel Machek <pavel@ucw.cz>
To: batumete1011@gmail.com
Cc: linux-kernel@vger.kernel.org,
	CheeseSpace <167085599+CheeseSpace@users.noreply.github.com>
Subject: Re: [PATCH] Signed-off-by: CheeseSpace
 <167085599+CheeseSpace@users.noreply.github.com>
Message-ID: <aAeYMqigWJLWx66i@duo.ucw.cz>
References: <20250417134430.16580-1-batumete1011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8zthca2yzNjmng6"
Content-Disposition: inline
In-Reply-To: <20250417134430.16580-1-batumete1011@gmail.com>


--K8zthca2yzNjmng6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-04-17 15:44:30, batumete1011@gmail.com wrote:
> From: CheeseSpace <167085599+CheeseSpace@users.noreply.github.com>
>=20
> removed unnecessary quotes in readme fille

NAK duo to strange name / noreply address.

BR,
								Pavel


> ---
>  README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/README b/README
> index fd903645e6de..beff112b72eb 100644
> --- a/README
> +++ b/README
> @@ -5,8 +5,8 @@ There are several guides for kernel developers and users.=
 These guides can
>  be rendered in a number of formats, like HTML and PDF. Please read
>  Documentation/admin-guide/README.rst first.
> =20
> -In order to build the documentation, use ``make htmldocs`` or
> -``make pdfdocs``.  The formatted documentation can also be read online a=
t:
> +In order to build the documentation, use make htmldocs or make pdfdocs.
> +The formatted documentation can also be read online at:
> =20
>      https://www.kernel.org/doc/html/latest/
> =20

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--K8zthca2yzNjmng6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaAeYMgAKCRAw5/Bqldv6
8r0kAKC39kDon9qrq9auMH+UGqG/6VmlUACfXG935+5SiQFgjqo0a3nQ2rQrTEY=
=Ya0S
-----END PGP SIGNATURE-----

--K8zthca2yzNjmng6--
