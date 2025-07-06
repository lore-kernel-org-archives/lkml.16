Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A2199230;
	Sun,  6 Jul 2025 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751792824; cv=none; b=O0jZ3t3GI7FSwQZQRObIHL3uWmjr3Bu/LBg7/EQXkrFc9Yn+TivUyrcxXzLRK12jRCfonDWHgn3HzvvQV5bXoPQ8HvXBBdkGpIfM1ReU8Nd+JrdiKCfuov9oB1fd8jrKEeQam0zwDzp3CvhrdLHo+d4yy+lbPRsPkgTM0+ZF10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751792824; c=relaxed/simple;
	bh=RT4KaCOpxpPxhU+0CxbKj0+VmeZqaPtuLJG2kAASxcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjCGo9lWZ7zO7SCvEB8CRkzILRjse3w1bM9FdTS183BWa9bzhsoPBTOwBTPDNJKXawQLiHKXTo1iWcwTW3RKeJsVdJ/xmhyx7IPNpiumUK06b0uClfXvKgdfmLCTpu/0QFw6bWRsIEcTuNN753MADr3yKqqpPbe7Nspumw5ML+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=Z+kPol28; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="Z+kPol28"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=f9YbyZd/VkquKLsCeJc+buXmeOWhQCLEKhQGAUaZYVE=;
	b=Z+kPol288sL8JofDkheKNemupUD5VjzDMljyelMvIg7rb/xmGurWDWWn3QNgp0+NZoKBpussttaylwyqA8IT+4bxMji0HCCqI3KgTg51cmyRuVaz8EAGiZNkyOGOJBl0MFp9qGuAwLdeGarfV76vtqAovbkArMqHglR2XTjPpPo=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 11:06:35 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:
 Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems Nagami
 SoM
Date: Sun, 06 Jul 2025 11:06:34 +0200
Message-ID: <5023306.31r3eYUQgx@lukas-hpz440workstation>
In-Reply-To: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
References:
 <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
 <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4662866.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4662866.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 06 Jul 2025 11:06:34 +0200
Message-ID: <5023306.31r3eYUQgx@lukas-hpz440workstation>
In-Reply-To: <b2351675-cba2-4d8c-af6c-f341f5c77ee7@lunn.ch>
MIME-Version: 1.0

On Sonntag, 6. Juli 2025 09:38:00 CEST Andrew Lunn wrote:
> > +&mdio {
> > +	lan8720a: ethernet-phy@1 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <1>;
> > +	};
> > +};
> 
> Just for clarification: The PHY is on the SOM? I've seen systems where
> the PHY is on the SOM, and the magnetics and RJ45 on the carrier
> board. I've also seen systems where the PHY, magnetics and RJ45 are on
> the carrier.

Yes that' the case here. The PHY is located on the SoM and the MDI signals
before any magnetics are on the SoM's Card-Edge. The magnetics are required
on the Carrier board (e.g. a MagJack or dedicated Transformer)
> 
>     Andrew


--nextPart4662866.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqPJoACgkQJnN+drMV
RtiE8Af9ESLIraKnrfQi55OimnR0w4/F/EGAOF6naWZtJ2WLGLsJtRxz4XtvmJg5
uTMGqjm/hF8f7xVSadaMBGnF1ZUEN13CxXoWiqE/uggNB4/9c4AxdgjlLjFeeAD0
A1pDHXHJJQykUpbNHtMqhNE3rLrAthy1PW/f2MG3ALh8VkFnOY5ZraFuTaxYZzA9
wiL5UBJw6XneItZUlr7BpFweH8H7kMusHg8eoOo2XKfj4REmQn1fj4FN1XEtGR+z
Q5N7/o6ccDVHruZve7BXIwpGXCnOOl7AmXZ1zT+FWNAI16QRm7/a8TkmP70Na67V
MvcLoylwZbp4U4SiH11wHuENj4rIdQ==
=pi6Q
-----END PGP SIGNATURE-----

--nextPart4662866.LvFx2qVVIh--




