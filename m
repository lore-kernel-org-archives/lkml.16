Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591141DF97D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454126; cv=none; b=s+UuaQYER9sG7Jr7NoKxflnHLkhnlNTR99RV2Z74mMNZDNzznahS994T6Z0rrY0rUjXSSCURMgI+Hu5cU1S72KR2uVl4PDg5genrqYZwE0cUuMO6u5hH35Nfio/Ur7orlYKf5mBIq5dPce2L4cLACWV5TUio7k8diaGUbto41X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454126; c=relaxed/simple;
	bh=8lxuUdfMEVpUA9WKW783Zvq4WYwtwx/QH0Hphie6PRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5M9YLQdt8L+XL/VKNWn6gIO8KR4F6escw3W0Id+PWL7YcCgptS2x48w9Fl8oygyKmXWeuSnAP6ZCPbGTiFI3iPUKBoarPKFuejSEivoiDm+iW/ePOY6055hIjoJhAjVRu2QhafS83PbOTVmLCIPTYM2M5f3Sd3derNIw6y4tXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZSQZ9Jyb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZSQZ9Jyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8lxu
	UdfMEVpUA9WKW783Zvq4WYwtwx/QH0Hphie6PRQ=; b=ZSQZ9JybRyzcQ89/64X+
	at9LtTjr/uZxjaZw+vYYPZ8hPzVUHcgk7kZ3w7vAlQCHPZFvg+JBSSNmNzlLN6bl
	HJh02D+eua8XD9f/HbCFuFziyXay/5JU95JUUFk0Da9Y1S5rUEZkE6aTeS5KrHe+
	LtD/KzBWfvZLBpbG8mslGuTwVW+UexCrd/x5SQlg5cdplLGo4Fqwt0e2WJBXiQDY
	jxxq8n7dwNxoGG8ZOsA5uPXPDJ+/D5KF3jm+bjHfJl2VTUSEgN9CtZtrDElv2w+X
	UKkQ8Yiji2VmMBCE1wBtsy/TK5f9sf6unxLqepIOqPsUe7WwJ1tGhAH6FcbXNK75
	Zg==
Received: (qmail 2837631 invoked from network); 20 Jun 2025 23:15:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2025 23:15:11 +0200
X-UD-Smtp-Session: l3s3148p1@StF1Wwc4UMeySS9C
Date: Fri, 20 Jun 2025 23:15:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <aFXPXTUSvgj-a2zC@shikoro>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r1jy/dUWgI+dUiEi"
Content-Disposition: inline
In-Reply-To: <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>


--r1jy/dUWgI+dUiEi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> + * i3c_master_writesl- Write bytes to long memory region from byte array

Frank proposed the name 'i3c_writel_fifo' which I like a tad better.
Opinions?


--r1jy/dUWgI+dUiEi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhVz1gACgkQFA3kzBSg
KbYCYw//Si5wvbmKRsavLRhwf93Y+rnT2QVv88eLVA+Ze2BBsONMdNTYFLoleuXZ
Rsxe4n0FSB5YUXZcme4/AAVMD7ONaush2WnaQyJCb9u361WqqtJt7i14u5sTtlP2
WdtICzW8U0LqzI8uQN875Jrls1f1vkfteENskR3SAIttvEogn/OLfjRUhoklAzqL
or1zlT1MHyKDU/OJHTwhiFcFOH4aKmTnN8KjufgHx9BuvnjxeNh46rwusGPwyG61
kiV1+RCIJ776Aqto0Ll+33C+MUsKH7eb+XnVZjCL0ZCly+OzkEsYZRZC7rCRqIBI
2/dHX0gpy62iNPODFJtJZzQsihED6doXlwF080kVYVIn9MedPzpx+MWp+qj+z5SJ
UXc2yYL2ll8u6VRQ4ObumwtHXU3Z3UbGUsBLNervPbP4Yqx3QAJ7cmv1tRFSHLmC
3iahXiag8+BFPUG3w9BjERF7DIt53GIu3w8Q1VcRtyrDP3qjPqlMXaFRt/xRwNFO
BPB7SL7e3oVnTiG86X9ztl5fGlQYlEJU7wIMblF3LepdmFZ6UvZ7xOJWUq388WgD
0GF8tLemP7inKHpHbzG0LLIlDezZcVntd5hYgIRTR26XrxloKgHU2m7iT+LKWKov
s1SiiW8LlD55Y0zxZednF3p8CEvh/imIdfUtBLPEWq3dNhJngP4=
=3QT3
-----END PGP SIGNATURE-----

--r1jy/dUWgI+dUiEi--
