Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9B2857C3;
	Mon, 19 May 2025 16:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747671704; cv=none; b=bltwMfCoUClc5xaFkv2/YvcsJMQIbKCRWV5/QSxTJ0tvQwAWXVNrfYLZ1ZvIn1LpkYvxx71aizLvrOSEiKaPcZQ7dlEbnB8ImEVFM1vSpEiolisRJd7MTywb7Fq4xgBkapcLJ5C2lHh7llHr9ZyqKFq2u+i7L38aGoWS73WUkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747671704; c=relaxed/simple;
	bh=VInuVxcHwPkz/3rVki/CCNmblsxxZS2pzFG4ZLTvkfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjmMF95V+TLegD/o7DxjNJuxBsBheoIBRWyBWGQ6M0lapeL9Pb76JiA41gcyZiz3HL3Coe90cZcF9uA0mB0s7j+//v9E7ESO3MdmxxXL3kUfL3F4EAF0s1GqqbnV+53+x/VRLelp2Yxy/2XpvPbhTl2xE2z7+EWP2r2UqKuWK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=DoYgTQGj; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="DoYgTQGj"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B628F1C00B7; Mon, 19 May 2025 18:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1747671697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HWwaHvjFJlGD6FtSXE8yeGvDNlM+86IPHd8IM0I6STQ=;
	b=DoYgTQGjzUXSkEY6XQuM9kyyEqs1fCYu2uTIpvz2cXpMTDhr5fiO0JzeuiVkxz8N4liub5
	czyLLH2mJ/pOLZsvIggNpu9HpmrV/chQl1/Nm51wkTyGJf3IbB/vn4yeX0GvUiztDGV6yk
	NOvMiePUvb+7cEhKtCFyuBHN7sRISF0=
Date: Mon, 19 May 2025 18:21:37 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <aCtakfXonUfWZmgp@duo.ucw.cz>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0vljEvlxngayie8T"
Content-Disposition: inline
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>


--0vljEvlxngayie8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Every time I open Documentation/CodingStyle it says the party moved
> somewhere else. :-(
>=20
> Of course, I forget where it moved to by the next time.

Yes please. I was hiting this way too often, too.

Best regards,
								Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--0vljEvlxngayie8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaCtakQAKCRAw5/Bqldv6
8mgdAJ9rHUrToat27+SEFf6kl9TlywAW+wCfaXNHCQN0uMAdBJ9vspHCowwaK/w=
=69lp
-----END PGP SIGNATURE-----

--0vljEvlxngayie8T--
