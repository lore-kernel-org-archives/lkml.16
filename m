Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91391748D;
	Fri,  6 Jun 2025 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749168032; cv=none; b=LyYv3ll0ffa3KaYrT1v6xNnVGFBwqdqCEpkSMsHJ0k/cq0ecD+KcE86RYflZKHZqv8a5Ljv0BwUIlebA2o3xrBlrEg4l0ylwGmvvezwsxg8YyGfBhGYsA3zRVaDsBSIwLq8oBaIFYEzT2UbyJLdKjGIgeLEsIcLxc8gB7yYxRv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749168032; c=relaxed/simple;
	bh=i1fo8KK1l12kjw+1lrsG4tKTdOSN7YyfHw8ekJVWU7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+DFhiGDcz0S93yD9c6si/gnOIZYP2JO71AA9OwqKWtVWldYI89eF5NCebdDGSjeuN4UlnmMXn1T2LFgO6kZZWTwYHvOlMo7Nw+YlOsDPgO825mDAoSxivaFAX6ByUidndA/T8SRYJU/Kw34JUQHZZL/x0kXv9+t5hGx+6zRkmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHxeEuQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHxeEuQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B33C4CEE7;
	Fri,  6 Jun 2025 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168032;
	bh=i1fo8KK1l12kjw+1lrsG4tKTdOSN7YyfHw8ekJVWU7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHxeEuQ1MV9Y2sRt4iidYqkA5pxcqxlrxODdAYPbbwNNZUJFu6LeFJyjPkjBMdezZ
	 06UsblnFcJ+HdYgeWSi+E6uMC85D+0DGcw+F3PiNunHl4/z4/uvG+Ip0yo6nN4EjO+
	 5/W3lg+ejWfEA1QyJAu00x0+EhjQNDRr/ZZui4dIz98YwVDUQZl6uplz7sh4n2YuF7
	 apV1gdy8jX87jG38iOnbiYAL8lO5tiKOYeyfHT9YLtmz5wHzQfmIPgGsE98dlhwZvx
	 61dPC9dgMvTdyGfcxQ4ZS3qStMYswVTFWbTPFkuKsk60/TOiwekrYmxpiLziHg0FsH
	 2k+F4RCijbfMg==
Date: Thu, 5 Jun 2025 19:00:30 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <20250606000030.GA3487132-robh@kernel.org>
References: <20250602140613.940785-1-Frank.Li@nxp.com>
 <618490ca-cde1-4e13-8638-f5cb65606c6d@mleia.com>
 <aD3Lg+LRUThzm2ce@lizhi-Precision-Tower-5810>
 <09089071-57fc-4495-b6ee-159c59d59650@mleia.com>
 <aD4hEJYbFIrqtEXX@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD4hEJYbFIrqtEXX@lizhi-Precision-Tower-5810>

On Mon, Jun 02, 2025 at 06:09:20PM -0400, Frank Li wrote:
> On Mon, Jun 02, 2025 at 08:17:06PM +0300, Vladimir Zapolskiy wrote:
> > On 6/2/25 19:04, Frank Li wrote:
> > > On Mon, Jun 02, 2025 at 06:34:14PM +0300, Vladimir Zapolskiy wrote:
> > > > On 6/2/25 17:06, Frank Li wrote:
> > > > > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
> > > > > warnings:
> > > > > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
> > > > >
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > >    .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
> > > > >    1 file changed, 23 insertions(+)
> > > >
> > > > I prefer to see NXP SoC powered boards under Documentation/devicetree/bindings/arm/nxp/
> > > >
> > > > LPC18XX/LPC43XX SoCs are not Freescale.
> > >
> > > Generally, we don't distingiush that, new s32g chip also in this files.
> > > All nxp/fsl was maintained by one person and everyone know these are one
> > > company now.
> >
> > Well, my concern is actually not about the companies, but these two SoC
> > families are totally different, the peripherals or core controllers are
> > all different, it makes little sense to mix them up.
> 
> This just collect board level compatible string, like trivial-devices.yaml,
> which collect variance devices.
> 
> Shawn:
> 	Do you like create a nxp.yaml for LPC18xx/LPC43xx boards?

Please do. We have things like PXA2xx under intel, but PXA9xx/MNP under 
marvell as that's the companies that created the lines and there's no 
overlap. In the end, aligning the lineage is more important than 
companies.

We already have nxp/lpc32xx.yaml. This should probably be merged with 
that?

Rob
