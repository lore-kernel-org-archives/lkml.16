Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E1179A3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749074444; cv=none; b=HPZr89aWBwNOfFU12A8wSuOvHeEvWKbYscJ+3e0VLsVZsDwwf1Jwhf1s4y5M8/EgO4Wd81um/9p/7nMm3SgDQOT7OW4/sJ93MRK4kHzWZfTtU3fzAABVLXH5e2Go5qFkjdtnGKGhgh/NoGfTaVocIbcVgeEoSdBRcQI9y2Xkqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749074444; c=relaxed/simple;
	bh=1qWSa4d30td5vlTzjJs+wg9cW143Snb9rmQm0iaxAAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtil63RQRNydSoidp9XYFPtAc6tE7YhUY5BRvbJlP4OFi9N8WbuAhP5SmNGULUEaFFg1YeL7/q6HnYAhhClnsQqUbrYRYOrPHjLS2RN4IP9X5ygIHyVlFIgb35d1sq1eKFuZSOiRsbeF29udYG4uCKiynto4bvye0MMh4nqxdLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jVeSPsDN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jVeSPsDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XYsN
	0Mxu6kzOMZRM8G9bwLA57Ld88W2+ErglUKi5dak=; b=jVeSPsDNQqPEw3/xHqL+
	kx3vWv8851KBNbLrJXyvOKKPqL5amUiL3u0pPovHND+tjTeDpaUxenV6v5pQTKBx
	st94fRkYdI/JVwBetrw03cszeLPm2zqUm9VFwcU6IIpv75NAuiro9QqyizfKB5Qw
	WemovnvDZvU9r3sGEhkeQYFfYut1qwRsqBRCz7tY0KI6M9bSoi23JZU1QMBlEfgS
	nB7Hr+pxFlJZ7sCwZquw62o53QVNkL5sW286h2DoVgVr9HD+ECPtoFAueOvo2eFX
	ujUasmXp8KXzbwWd+zCAqnzleL5wwv5HLgwIyEcrlZ1Me1muLSp0IBuDna26z4BY
	8g==
Received: (qmail 838888 invoked from network); 5 Jun 2025 00:00:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jun 2025 00:00:34 +0200
X-UD-Smtp-Session: l3s3148p1@2VpNIMY2csEujnvc
Date: Thu, 5 Jun 2025 00:00:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aEDCATbPA9173lGI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
 <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2BXrAn6PXUNyIVW"
Content-Disposition: inline
In-Reply-To: <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>


--a2BXrAn6PXUNyIVW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

On Wed, Jun 04, 2025 at 03:10:13PM -0400, Frank Li wrote:
> On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> > Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> > core that supports I3C and I2C devices, multiple speed-grades and
> > I3C IBIs.
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Hmm, I didn't get the original patches. They are probably still in the
moderated queue?

> > +#define REG_VERSION			0x000
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define REG_CMD_FIFO			0x0d4
> > +#define REG_CMDR_FIFO			0x0d8
> > +#define REG_SDO_FIFO			0x0dc
> > +#define REG_SDI_FIFO			0x0e0
> > +#define REG_IBI_FIFO			0x0e4
> > +#define REG_FIFO_STATUS			0x0e8
> > +#define REG_OPS				0x100
> > +#define REG_IBI_CONFIG			0x140
> > +#define REG_DEV_CHAR			0x180

This register set has some 'cdns'-vibe to it. Maybe an earlier version?
Not sure merging this into the cdns-driver is a good idea, the register
set looks quite different to me. Note that I don't know cdns hardware, I
just grew a habit of comparing register sets of new drivers to avoid
duplicated drivers.

Happy hacking,

   Wolfram

--a2BXrAn6PXUNyIVW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhAwf0ACgkQFA3kzBSg
KbapNRAAmhvODM46QrZz2ghPGvdqckgqVY4/n7p1Ha0YrYzEDKmxOitwVpG0eK/j
E2GDaBu/UxPX9yEeML2K6saO0dyvPk+lebuPazJE2IHILYmXo4bBhkCXevYLz3zr
dX2/fii0I/ICPdT26BAbfMaoc5A+hbuyKhLBxK5NMxiosW1RNaOcRvRsXiiuiKhG
4HLFcOy2st2mhQ2O5rvz1bga3uFevGVX5gO1mcXMACaewmt1YveOg8jZMr3qKXS/
P/Dai25n/D4ADbDqw3kWiFBfFbVmQuT0OmGx/x1B8FHX3RsmDXmEpSR8cLV2/mpp
dg22jS9BMtPBjN6VUFHUFIcoaz3XTJ4DBLASU8oKVlRofVmdcf/1loQiqTQp20Oc
TZZj968JmKZxfP2OQP2xXI9ZqL3rlnU1/3dKkmuChmGSpy9VI5ln0eGSwwX3DTXd
RkGuhgNWP3m3qCCD1MCmHkrdyhUb9E5UTRxV68LZTDn5jc+J/RA+xaQb+euOeYiL
dv760TCCBMtMWUGeBQ8xCsNgAc7o1BwuXUb7byguXJBZAdlaJ14yyRNodA2HxVjr
FbPGADy9M14iTGSQFKM81EXHZxZuvPlW0UQEk1mfat1U5/ZI/+MJ6SGPK5QhLXwm
vZqyLU6pPihEucm8rAiOD7SP0j3nU6JLKnr1INxO7KfOqW3Jr/Y=
=QtfA
-----END PGP SIGNATURE-----

--a2BXrAn6PXUNyIVW--
