Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A8225410
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831794; cv=none; b=IbVf8B0Cad9NI6VLXS8RJlkcKcDIRbhi+Ulrlcu61Tbkh6/KQVQp/OzJ18uCpE0AfWZrIgrWYjliqxezgFiFJ9Z50eLROFBWaMDmUKT2QaMv6MeTAWjSl49azQFRhiBy/KIVkQhhkI9ebjk13wEAJMxsdWgU63qnxtSNcK9gcJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831794; c=relaxed/simple;
	bh=jPsZI5mGjV5SQeDpUeZhPHMKEgxep0dBQJt2kniVRtM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L1EctL37IpCEvc9AnXJajL6Uzpe2af+zQ5MYurbeSc4e2KaflxCkpkF4A9Zqc8tMAx8BIZyqkXChVUa2GKIvzDjWHN7MyFn76vsNDdrDk0RFGiFkwyBbNvzRmI+laMUKTgoTM1iyQrLXmfq07Vvf2lLSQCuBLHtQz8AyO+7u0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=XvnhSuSY; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="XvnhSuSY"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 766E4240028
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:49:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1738831784; bh=jPsZI5mGjV5SQeDpUeZhPHMKEgxep0dBQJt2kniVRtM=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=XvnhSuSYP3uxhXGn95VrOxPpqGPwqmUkY75ZNofPQYZuTrj22hNekG8OrQ7uMmHTS
	 6N8mS2odtbKmtu+srTLPagVb/4ttB/F7USNiPfPwmdj3ITZFe4Z+ljziYicHLrK95f
	 CDYDbJZM5fsCxrukh2Pvn+Yw0Q49P1fPw94O29bJNlZvEZwrEzv3UvEfHGw7a8z3X5
	 En7t/uPA40U4kLCiRGivC16gaTBqwwjqEK7moy3dblkR3d7DZ5+D1blFBUrrelQZ5J
	 80QSfyDxZ8AaisIDyyVTh3QfQlMvw+tl4KLDmY2Ft5ZsC2NyWxZfc1/hcQzFp7AzAq
	 K0xB7xwhCYacQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YpW4k32JTz9rxF;
	Thu,  6 Feb 2025 09:49:42 +0100 (CET)
Message-ID: <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
From: Martin Kepplinger <martink@posteo.de>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 shawnguo@kernel.org,  s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 08:49:37 +0000
In-Reply-To: <20250205172957.182362-1-martink@posteo.de>
References: <20250205172957.182362-1-martink@posteo.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin Kepplinger-
Novakovi=C4=87:
> media_pad_remote_pad_first() return NULL if "no enabled link has been
> found".
> Check for that.
>=20
> backstory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12
> now and
> I know the hardware works on an ancient nxp-kernel),
> I tried to enable the sensor link, set formats and stream:
>=20

btw, that's roughly the
driver:=C2=A0https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
that might need additions to with recent mainline kernels. Will the
sensor be the reason for the link not being found here?

                         martin
