Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C3243387
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318108; cv=none; b=jM46Jy/rFjuI7Cok143PGvtknNtgZTXVCgertTgsV6ohu+epbxXZmFpw3W92Njfh7P2We3KM9Y8sPKxH9MrLKuC1OH9z9o5uocv4hxuXfbDgpz/lT7lOhvHPgv2tCjNm9XwYwlrOgDGDJK8tEJwDKoCF/tqYTPWCqs7hkVZ93lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318108; c=relaxed/simple;
	bh=R/16zujFisC9NdOslvjk65nWTatAJwCxTgv8elrO20o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOa2X2J8tHKPN2kDE2Fdns7SAeM0/FKKxcbi/9cUh1QDOX+eaJWGTKhHhIDHgFlBMQjg+JJBGzPR5T4SW69853VtDZxju2kzaOg54u9EsyqmfhH2MqUs4Hl6G0NIaumaraILfK3Dn0LlaHobMd+NoCSV82bM6W4rTzIEzy1Zq3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=KDDuBhtW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="KDDuBhtW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5068114b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1751318105; x=1751922905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUEvETXHTlKyXBMoL8O2NrqSNnjuNlXBT6Mz8VcsTmQ=;
        b=KDDuBhtWp9lB3rcXLkSVciLkDafO6Knaz1li4YQ+YqGO0R3aluie7MDyUrIAM+AqQ9
         k894xzvfpKhZpAQIq3EbWXZmjzZ2GCykd2ZfDMUOclTcGra1kVbPlZIsz/eAT9gzwVG9
         LRSNjy90DCB6LauChnfB56NsCxdnaeHFKuyKfZA2mvjvlG49mvZN+ubyicPt8LtelAv9
         qJSzXPr+6Z7c126BeGtKL2xsSyJzFSmNnqT3KjjKdZYCQoFY07yv1V5GjxgWQu4TDwY3
         7+qvgp8QoJQrM/MLWUpBbs9aTxLDZHOAZvzYyiKXdixFaRVKvhs/QFpLiAYQ6IkFjQp6
         bsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751318105; x=1751922905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUEvETXHTlKyXBMoL8O2NrqSNnjuNlXBT6Mz8VcsTmQ=;
        b=fAqbSC4nhQ/jHVu6qhu7UTkrE5dVb0tV2t58Snlpf5vA2eroupZaEXsqftZnTgpNgz
         njJkqQJgsKG7GSPyHHDGhNHeT+McjwIgrKaJxX73bITAvEOcWkM7YLl1MS11CXMVesHa
         0626voJMOTXw/+F+hTkZ/EGmWQeA01N8fzvrLKF0p/KILOVWMcsj0ixuj+BtdeLOF9RT
         2jI3DFyfSn3td2AivRUeNIp4GXGzE6TISkbMf3HY/KqauA2Ru9Gq3uDqGo+z06WV72pK
         xFBGubEEH2MXBUtV2C1kFNFH2onrmVEBPzRb4SYxh/2WwZJpg5eGoC6JX5AyPCI1pAtH
         80zQ==
X-Gm-Message-State: AOJu0YzGLHTLgXqwuaknaWlVuqHqb3MV0smAo8DvvT0naAYAzAqYTHYN
	W6FjZOTlXrajIzBqI04etRkiAo/NbZeAc957BzYbu2oGNTFWasQ+ezXey7MgzUUmip8=
X-Gm-Gg: ASbGncuw/tOUD0QNUr+0aB3P1clUqx69Z9LmPZOJdJwHuWJOYkO7eMIgZOjSYfwo5Al
	lw1nvFpHBsezBQtH8XuZgBW1HxVSS4NSCGFIdNxDtL/sARG7GsiwPAFnosdFJ7SCKE0he47aL57
	vq0S0J+PIJEJz7gjRo4OesOrNnL5z/vS9/9Fl+hPIubgEdc3+pDgYjokB2fyn0xyT+z/agnfMkZ
	4OXqmz2Wob65C8N12dUy/0ovATEyXwuo298fhR6hTeRsJ1Riot4SvXJo/ei9xz1sMhplZfIs9bc
	sSIzn7swzr/qi7aWvP42B2eWL0t/zXEqMdCRNIO8zvTzQTAsR/H4BJUsOY1SBPjzLaQRBzFUlg=
	=
X-Google-Smtp-Source: AGHT+IGL/SZf2y6jdZAAifdYJBwKcWDsEsUve+zOQkExo66Ml61nMbqpN6EBJpdG9Zp/Zyiqdnqxaw==
X-Received: by 2002:a05:6a00:3d11:b0:747:accb:773c with SMTP id d2e1a72fcca58-74af6f08200mr20130964b3a.13.1751318105082;
        Mon, 30 Jun 2025 14:15:05 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574604sm10227155b3a.86.2025.06.30.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:15:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:15:02 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-clk
 tree
Message-ID: <aGL+VmixzZNpfVpC@x1>
References: <20250630072422.4d30412f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hqjDcDDA25rk6M3"
Content-Disposition: inline
In-Reply-To: <20250630072422.4d30412f@canb.auug.org.au>


--2hqjDcDDA25rk6M3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 07:24:22AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   7bb23e0bdb6c ("clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUS=
ED")
>=20
> is missing a Signed-off-by from its committer.
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that and thanks for letting me know. I've now added my
Signed-off-by tag and updated thead-clk-for-next.

Thanks,
Drew

--2hqjDcDDA25rk6M3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaGL+TwAKCRDb7CzD2Six
DBv5AP9P/Mdni+PdO6gznrDG1cEkcSAPsjgWcBMdF4kOgsItaQEA4iMDSqzoJGRo
XofsFui8fMJz2ZNK9k3oZaDUciw/XwQ=
=8bt0
-----END PGP SIGNATURE-----

--2hqjDcDDA25rk6M3--
