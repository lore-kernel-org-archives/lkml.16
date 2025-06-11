Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3D4C133;
	Wed, 11 Jun 2025 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624556; cv=none; b=f38DXC9Ck79739W+Z0spCmk9BT11/m5pcD+SAELkeqTedQwMFWK7sLczmxCNsi5Hd+frF0SnnRiWEefCDa3nqJgFQeIBUHh08gB8rIcuefocxsp0S4tNITcKlCwbhezxA+ad5zknHT9ET/ZHRiVMrNuJW0vXC/mGQnur7887cts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624556; c=relaxed/simple;
	bh=FMyO1EmovbumXEl+OiTYuyUzT9z/yCBH7rYczUz94gc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To; b=bRZf23RuBpPCIHwOgH63WMV3jXVsJgdU26MSGXZSuWivDfWs0dW60XBltsgrz3cKuYd/u+vU5R+3qFqWxh9Ru5Ft/jJWdiqPdiNLgkkgtiPmzHic6tc1ZC3ea+gdfqr+NMF2v1E9SCkPJjTxgMWBSq/pSaJBqt2s8nBdF6vChEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mU92wHiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mU92wHiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7566C4CEEE;
	Wed, 11 Jun 2025 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749624554;
	bh=FMyO1EmovbumXEl+OiTYuyUzT9z/yCBH7rYczUz94gc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=mU92wHiV8pQgRnuittKr8tyKpv+KRITKdjTXqVhUdCd1U6UGvNR5xKmCjUvnqsaN2
	 UncLT+z+CSgoqGV1i65FmgBZB+8HF90JOJEAjoz4b8zpOLdg88JfQKb80HxtJyge0k
	 RskP5bvywhh2BnOhmjiH+pOvJzrA6bZXDSN09gsAhPlBnYOclAvDSi5nDRK9LASQ5y
	 i2WfiVz1w4Vgdsz+1K6DVU8puXA6jvHKTVAhKUF/kvr1oA1Fgy6c/+T9VSOYhG+2Tq
	 RYXvHM7TG7U6mLZLJxbVDhtHTtj1E/NBYeB/yhKpxIH3e1cWdGZIkcMYftCSkqr/bk
	 rhKq6Zyn78hwA==
Content-Type: multipart/signed;
 boundary=092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 11 Jun 2025 08:49:09 +0200
Message-Id: <DAJI523999W0.GE2LHI6HQUPN@kernel.org>
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map
 and register EUI addresses into NVMEM framework
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Manikandan Muralidharan"
 <manikandan.m@microchip.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
 <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
In-Reply-To: <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 9, 2025 at 10:04 AM CEST, Tudor Ambarus wrote:
> Hi,
>
> On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
> >  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/spi-nor.h |   7 ++
> >  2 files changed, 168 insertions(+)
>
> Please find a way to move the vendor specific handling to a vendor file,
> don't pollute the core drivers.

IIRC I've suggested to move the handling into the core, but it
should be more generic, not handling any MAC address related things,
but more like a framework/helper functions to expose anything
related to SFDP.

-michael

> In what concerns the nvmem idea, I find
> it fine. Michael may comment more on it as I think he dealt with a
> similar use case in the past.
>
> Cheers,
> ta


--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaEkm5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iH1gGA6wzFs0xl83MYYXUgMyMJ+YgGxuhLeTQ1
qHmSAJKFMEM4cyx5fxuUV6FhRyQLNUA8AX9//HDdaQQEZBAfkBYcjQ/PXiEjSPFI
ONNVhbjpadS+iOl+ejT4Mx7vZOxG+bgHAVU=
=zgcm
-----END PGP SIGNATURE-----

--092bfdba70b2454870f72bac72348f01da7a4597ebda2c812354a0b1278b--
