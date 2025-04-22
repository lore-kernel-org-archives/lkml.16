Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F92417C3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312179; cv=none; b=JxjgWLm9iR8wibqRfJ5slj8Uf1+VtUIpOdF44lAYINhSXSXdA2YFlJyc1v/0m4G2WCW8KQfL1OYyl+sx35bNskXhwd3ZY/sghb4En9wGd+6dVO7/z5I4biNweKhI1/ua7RvzpQJXc+U7phKrHb0zgzvRhK4AwpZzX8th62Rxvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312179; c=relaxed/simple;
	bh=KfrcJp90mLH/oPioQRdtTME45LSOkSzp3PFEGOdY9Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3KimO7kSa0R725lXTUhGx7+PkETguld5gOR7We3dIQz9RL/2Q6ih7IXAzdJv0Hganp6CjrCQtQCrgePkwizsrhf0yPhUnn4YW2T6zAgIryod7UyyFu0F4R+OeOa+0kG3tucUBjzOe00pcmI17iOFvCzVeMGgZIz1oC/0FSEhNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 22 Apr 2025 04:56:01 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, Zhang Wei <zw@zh-kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Message-ID: <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, 
	Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wop522mmefnoma4a"
Content-Disposition: inline
In-Reply-To: <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT


--wop522mmefnoma4a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
MIME-Version: 1.0

On Tue, Apr 22, 2025 at 09:59:42AM -0500, Arnd Bergmann wrote:
> On Tue, Apr 22, 2025, at 09:12, Ben Collins wrote:
> > On Tue, Apr 22, 2025 at 08:34:55AM -0500, Arnd Bergmann wrote:
> >>=20
> >> - SoCs that don't set a dma-ranges property in the parent bus
> >>   are normally still capped to 32 bit DMA. I don't see those
> >>   properties, so unless there is a special hack on those chips,
> >>   you get 32 bit DMA regardless of what DMA mask the driver
> >>   requests
> >
> > I've yet to see a dma-ranges property in any of the Freescale PowerPC
> > device trees.
>=20
> Right, but this could just mean that they end up using SWIOTLB
> to bounce the high DMA pages or use an IOMMU rather than actually
> translating the physical address to a dma address.

There's a few things going on. The Local Address Window can shift
anywhere in the 64-bit address space and be as wide as the physical
address (40-bit on T4240, 36-bit on P4080). I think this is mainly for
IO to PCIe and RapidIO, though.

> The only special case I see for freescale powerpc chips is the
> PCI dma_set_mask() handler that does
>=20
> static void fsl_pci_dma_set_mask(struct device *dev, u64 dma_mask)
> {
>         /*
>          * Fix up PCI devices that are able to DMA to the large inbound
>          * mapping that allows addressing any RAM address from across PCI.
>          */
>         if (dev_is_pci(dev) && dma_mask >=3D pci64_dma_offset * 2 - 1) {
>                 dev->bus_dma_limit =3D 0;
>                 dev->archdata.dma_offset =3D pci64_dma_offset;
>         }
> }
>=20
> but that should not apply here because this is not a PCI device.

Right.

> > I'll check on this, but I think it's a seperate issue. The main thing is
> > just to configure the dma hw correctly.
>=20
> I think it's still important to check this before changing the
> driver: if the larger mask doesn't actually have any effect now
> because the DT caps the DMA at 4GB, then it might break later
> when someone adds the correct dma-ranges properties.

I'm adding dma-ranges to my dt for testing.

> > So a little research shows that these 3 compatible strings in
> > the fsldma are:
> >
> > fsl,elo3-dma:		40-bit
> > fsl,eloplus-dma:	36-bit
> > fsl,elo-dma:		32-bit
> >
> > I'll rework it so addressing is based on the compatible string.
>=20
> Sounds good, yes. Just to clarify: where did you find those
> limits? Are you sure those are not just the maximum addressable
> amounts of physical RAM on the chips that use the respective
> controllers?

This is where things might be more interesting. The P4080RM and T4240RM
is where I got this information. Register "cdar" in the fsldma code. This
makes up 0x08 and 0x0c registers.

In the RM 0x08 is the extended address register. On P4080 it says this
holds the top 4 bits of the 36-bit address, and on T4240 it says the top
8 bits of the 40-bit address. So the asynx_tx physical address needs to
be masked to the 36-bit or 40-bit.

--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--wop522mmefnoma4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgHWaEACgkQXVpXxyQr
Is+YXA//ZCVfP2Vcf2wN9DmzGexCKVQoLJGySna4HgS0fL7x+pMQusccWOqf4rUs
eLipGkYQXlTr5X+iW0SU7x6xWaHjXbaqXNgvypoGEdI/SGCd4rP5JbDmCgGcl197
L3L3aSkaC7Ofo2ACXQKAubuhtoC7g9R29+0QEyxCOk5nX8BVKHk0lq/IxpVxNzGo
2P72w9dVpryukut3bjsrvyVxJVwow49W/v2K9nzB+YIyEy+1XApkd2pnMgeeLLwV
PqobZumgvDp/sDFFl2eUsNR+vjJxw2Z4d799D8df5s6YhvUEkRcZWNnNr4iLLGg4
IikePsfOFFRPPIElGi4JCVlRfvxm4rElJh1dR0OyK6JvzNvBbEEQWm0afaE/oCmi
7uuH1hbCMr/6Ynfdvw4Br7HzMN4A2uK9v/gui/7rM3JcXUOSHClEZIcKxOKoINsh
qe7cRXa7ZYVa14c+DLhl5rbmc3/PHZUzyeYA1V1hL3eITH7iOo+ud3AXzXLnM+ZT
BGhf1OGz+QRXV6bCx8q5onrMggRPOD+J4/nh4eYgAI34Tn5rNSbarh9kqx5U7NqY
7BPd8k6q9DTTiApN9imyOhoyksIHl14kCmvDQLGalFX/KtGmsElgyxtujEjLR9Mu
s7vMBCzPu6G2TIe0f9xyWhu8iHVvrry+JiYOszwFEMjFlLmFr6o=
=IUWG
-----END PGP SIGNATURE-----

--wop522mmefnoma4a--
