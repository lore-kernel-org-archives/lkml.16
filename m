Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6E1E7C23
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836382; cv=none; b=ai5hqNf7wBmYkx+2nhxFLo0JSdn42AtaXIkTxoZAb+ffzOCduJODFvZTi/QTJxHfNN7gAv/QQSaNyKJ9M4hHhG9W1Z9nfPkU71VdM3xGhrvyXln+ouGRn4RM9C+D2XbdBEQN+cQq6DTqkxdfX/LJG1/TrMv7ufXXWz4ZoozsPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836382; c=relaxed/simple;
	bh=CJw+02rnSQnLx6hCq8gFTaebWcz76PaUzi0RQsakTGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuJC0huR7rgdfR1nWgWgIN0qPU/4LutK9GD+KH/P/wZjbfaI/53eA2mibudjU/dl+BorKix/wEQoWsIJKEAjwz1hxB0lThWsmAVEd8EDoJWHIudTVRiqa8tIMID8lLXhBsfOtdxy9bnqCwg/m069BjxavgrJ9lGToLNCE0SKhNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JkQktgIw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JkQktgIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ggHW
	2tGXUpjDd3Eq6i8DXWy8N5KdCD87GNfxMzC0698=; b=JkQktgIwJEK8ksTB5Tcy
	+Q6LheG+7zZU1jFD9/0ryhCA9m7m0vLgslEUK3Bqj0Vi2VAg/0Dhvo05LPnU7f6M
	7UTPfcF8JKolEMectzcauz9oaeAIXLRGxT02fRsXnd6vCt2aGE7gqZfDuWhVmPTY
	/nAH22ieDjVsZjv4U2Vef3UjdGYgz1GokhJNjmXXu1Du3kltVVpQ5xMS9SKO52EZ
	X/G+Xu/zm4oW2R7iXJo5ZNfwSXXLq7ca7HOlVzWj2HoMaom6FBJZaLuMVnOQONzt
	LufIe77/A/CsWxNuCgoUEpZm7sWA03GOAtjyW7mn0Hgv1aTdI+T1If4btK/CC8zS
	pQ==
Received: (qmail 547658 invoked from network); 25 Jun 2025 09:26:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 09:26:17 +0200
X-UD-Smtp-Session: l3s3148p1@155GXGA4HrJtKLNf
Date: Wed, 25 Jun 2025 09:26:16 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] i3c: master: cdns: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Message-ID: <aFukmFhJUCeRWLU9@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeTz2P++3ECJKrVD"
Content-Disposition: inline
In-Reply-To: <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>


--SeTz2P++3ECJKrVD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
>  					  const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + TX_FIFO, &tmp, 1);
> -	}
> +	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
>  }

What about getting rid of the surrounding function and use the helper
directly?


--SeTz2P++3ECJKrVD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbpJQACgkQFA3kzBSg
KbaAog//TEjzg+Dg7YzE6khvyli0iHrL/OE/JvSH5WnH+VKEVxqVMjTEETFQYY7S
CL6IUwveSAit75VPrCNlnUCrOQnqpZ7rTnhHocR415otKxBbfj45yE/DE4FZdnjZ
pK8oEaXrGvoYqywh7fHakBXhwxpT7oWNVzQW6DxNLkHIthRBVBJwKqZPMN74m6MD
JBRM5V9wxn1/eoMAH9kMCT8F6KKG7tqbcWDaPsfYlw6Bi7cwyNIVdXQ4IjJTXJLw
kHqay5CJtwjrpajfjtbF+sagQ75JuV6OBNP2Nsk02O5Tc+vxNlRnllbn3unPFBLr
ylLrcTlV0m1gsHQ1KGsjXovWHpq0p6bk+iYk8Hdy9900rUg87gegLHkj35DDnXmA
mNm8PCZqSNJ+tEg1SPTNvDhflnQdyP7ARb1qVGKEyN8pBECX8lm7quxUKB1cL2be
ewMJDQ8G8ADgHNtq4jzbQS+TkyavGrDt/ndqgMIpZCloIss99PcmIo8O+QAmpXQC
NuLQRAAk7buatljx93D+gkntY27Ttooyyl0+M1vcIGoFox4CGZQMUNiOEwmU/DGk
G4eF2DSFFoiTpkaE+QZhg4tN0m5yBkZM+VBPLzNTzTScD24stk4P9tBus/6J13z6
Vmaf0FnkMdey/JwSei19SbeipZH3K6fJ2fcMChkL2rEr1pCzoOQ=
=SX2G
-----END PGP SIGNATURE-----

--SeTz2P++3ECJKrVD--
