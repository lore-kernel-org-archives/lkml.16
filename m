Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C61149C7B;
	Wed, 25 Jun 2025 01:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814827; cv=pass; b=I5t2V/svYq/fKgNOv4YLtkdt3ZE1fGJILBUcIq9MSxHd4JVqzvhgcTsFCyuIqN96dJq1R+rxx+r+vOX5My39p5P5Lf0ADFli8kISDiM/CWV5U5C+k4+lDkvPgnqnlShH7ICkqxRgDfxGut9MPrcPwN8q96kME+YsvYGP7EuNzlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814827; c=relaxed/simple;
	bh=vQB/W2IkJNqXCMaS9Cmyrzf7dYHr7eR9DcU/CwYCrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrOh8+3SI60R+hwD06isEQyCpxpjBf5Jz99Qq0olc5ljDj7qQBj6tN5IRm4vBNwEvSLW1gtTEQdrJby3pvZ5tjJnnEVfzvf4EmBorCE0lYdib6cS1/xPRHxTK0Os5vuP5XQED9knIhWitdyepgc+9aDjzXyQ1XbaXPaW5hGZUsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=LahF0Ho6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="LahF0Ho6"
ARC-Seal: i=1; a=rsa-sha256; t=1750814804; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CY915g0J9dwjK/VuSxR3Ffb2t1N38ldg0Jy+2nyRBgZNhBed6yO5jhUrmOXr/QaA5NvXAItDUu/Cj80vNjRC2OiC4I5rSHa1vyZC0898ca22VdJC7pkWPV7Iuc9/efdnUIZFKykJ3hV9wL6elXVUTkT7q/CzgEcmF7SlZkYsg6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750814804; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dqqXtvz4DGOvWCpKBme8+JTNyTNkM/rvX9pTimfD8GY=; 
	b=lzp4Uqo4vMKzwljxxWSslksGnaQBzYt2u7eNQ6QY5jPXFdz4KcueMKnI7PRJShbhBG7LOXzQ022afliCV+oaodps0kewlIqW3oItZauEnMenl0TbubjrYtbmz9hgxM+4p2xXZ/CMYsPLrrJnfekxu8ZJ8KAQlAFKGnH5jwxSqek=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750814804;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=dqqXtvz4DGOvWCpKBme8+JTNyTNkM/rvX9pTimfD8GY=;
	b=LahF0Ho6qrRFiBpniTx85Y2OsPAc3ydS7skuSodBj2tnsf/Kdb/3KOauk3+N+R6+
	D5FwuUYG/IkZdjbKbT3m7rHIpShXP2NnEAGkj4ephBMxNPvqiGD7w8356EQpLjDJ8y9
	x/sj4IxY7JVNo/95Kynr3zAi8Wb6BTfA16HmjWPQ=
Received: by mx.zohomail.com with SMTPS id 1750814803177217.20995854983448;
	Tue, 24 Jun 2025 18:26:43 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 118841809B8; Wed, 25 Jun 2025 03:26:38 +0200 (CEST)
Date: Wed, 25 Jun 2025 03:26:37 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, Daniel Semkowicz <dse@thaumatec.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
Message-ID: <nja7c4ikyoxpoque62c52eboa22gt4zt72vaseaoo5bbzyrlor@gte3jm2sbecv>
References: <20250618-rk8xx-rst-fun-v3-0-081f02d3d348@cherry.de>
 <20250618-rk8xx-rst-fun-v3-3-081f02d3d348@cherry.de>
 <t3wbjpbw7phqvip4yvxm5kux6hor5pehzamrw6hjv3hq2b3j3n@zuf2vuhgpdpp>
 <7149b6a8-7715-4920-829d-5b416d40fc16@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lor23qymgpuiul5d"
Content-Disposition: inline
In-Reply-To: <7149b6a8-7715-4920-829d-5b416d40fc16@cherry.de>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/250.326.2
X-ZohoMailClient: External


--lor23qymgpuiul5d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/5] arm64: dts: rockchip: add header for RK8XX PMIC
 constants
MIME-Version: 1.0

Hi,

On Mon, Jun 23, 2025 at 11:48:27AM +0200, Quentin Schulz wrote:
> On 6/19/25 5:51 PM, Sebastian Reichel wrote:
> > On Wed, Jun 18, 2025 at 12:32:42PM +0200, Quentin Schulz wrote:
> > > From: Quentin Schulz <quentin.schulz@cherry.de>
> > >=20
> > > To make it easier to read the device tree, let's add constants for the
> > > rockchip,reset-mode property values that are currently only applicable
> > > to RK806 PMIC.
> > >=20
> > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > ---
> > >   arch/arm64/boot/dts/rockchip/rk8xx.h | 18 ++++++++++++++++++
> >=20
> > I think this header should be in include/dt-bindings/, otherwise the
>=20
> v2 did that and the feedback from dt-binding people was they didn't want =
(as
> far as I understood) unused constants as ABI[1][2].
>=20
> [1]
> https://lore.kernel.org/all/704d75df-a484-4da3-9bcb-85b480e2ecf0@kernel.o=
rg/
> [2]
> https://lore.kernel.org/all/a9baf6b0-b668-4d10-b9de-b63eb3fd8f23@kernel.o=
rg/

I wonder if it would be considered an ABI, if the drivers would use
the values like this:

switch (value_from_dt) {
case RK806_RESTART:
case RK806_RESET:
case RK806_RESET_NOTIFY:
    program_register(...);
    break;
default:
    return dev_err_probe(dev, -EINVAL, "invalid restart setting");
}

IMHO register values not being an ABI is kind of weird, as this is a
very strong ABI from my POV - it's just not defined by us. But I don't
intent to fight for this, so ignore my comment :)

Greetings,

-- Sebastian

--lor23qymgpuiul5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhbUEoACgkQ2O7X88g7
+prfGRAAhMwSZGvBSU4k92HD+ibNltYMwuzkm2IBNQ3+JJq/HlqKZcpbwMSWr/+y
sjFgtalHlfR40P0lGMaXHuYW/cxy95VVa4Qmh+PQHgiijyWwdxFoHtHmvm+OHBCQ
pV3ifwm6n6GdzEE3CbnAWlk8FnidWYjLTOwsQYkFPhX/4YL/A+cmkn/2HcBhK24v
EI1n09NHzS9Q3pHXrNDuhkVYLWME8mdTDeje3rp9lJ8w5MA5a1aYU5AjDw6nobNf
Didji/DO+WsQPX2TQ4PogSft9RPMx8HeXA0KO0kFguGfdKMcRoOfE6R9dvd4Xe9+
JEOj6XQI0fl2Ql1eBIdh5uEzcTmnzbWgq15BXFpHOWYeg62eCM3QVOQDh3bkkDFE
lXITizn3MmrsQ0w+xHKskAekDtIArt2gKB+HVrwXmd6eFPniH1WNbD6ZUsDq3sjX
7DmXoN34UE1Sj9H7vheZGBS7bzNyxk/CGUnoZ6GQTGAVJ99E9WwqCGsK9GNwx57w
k7uqOmIVt4dzbj9c47i80FQc7Ipp1OiZyhsBMlGjMSzEgg1q62O4GtAl4UI5qACh
UEjAGubnqSOgfES9lhZ3sG1pnqV/KOGA9lZA78POC0oqFENuH5krigAazYNZ55tN
9KZbpmolU2/lakgWt49Zcq8yPohbfgJYeOtM9Bz3ByUq6FvLmds=
=ovhb
-----END PGP SIGNATURE-----

--lor23qymgpuiul5d--
