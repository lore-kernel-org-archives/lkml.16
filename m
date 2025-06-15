Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528671A5BAE;
	Sun, 15 Jun 2025 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749982791; cv=none; b=XsZt+rZIyddcH3y3NYKJej2AG1jCVMhxPT8qNiYDbFcArfLgBXd7XwD3/1KW4rUp+RWkFKhR+0xbQefsBnnPDcnUum8X46/H7swo4M7++sVWWj6vGaqUnH8aUgDDtqH3Y/xQOS6W8FcgBmPHsJhmtivBv6+pquuQWU1oGvVH7Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749982791; c=relaxed/simple;
	bh=n5YFmX8Kx6Xtc0SvzMHgsnvUv3eO8FtDVpzatVckm9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSyw6GZebNrrpvwHhfr4bY72jzd/qlEDVoMXp8YbNgWcnnUjSi5zOZtkTVmTVWHAIx0A2D6ueo0zc9tmXnQ3yNbwlLhAHmZlK5BTNrLNaQRKjDi1sDkfB3SMjOs0nwCTYnuy07FUR2JSX1ZYwA1DTQyH4BbyNdxSBkPAH9EMmdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dNHhuG3W; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dNHhuG3W"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2068C1F8C9;
	Sun, 15 Jun 2025 12:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1749982225;
	bh=yjEYyViJRSEj7gukJzhLaZCQ3u2E2O6CsjLJYxe6OF0=; h=From:To:Subject;
	b=dNHhuG3WxeG6pI0ITcz6MLyZScfDasujY8HDnZ5HauVkxkHyjh5UVqoLj0vlbbbuJ
	 w+v0rfmRDLVSngtTJE7MsYorPv4mmkjFE5jMoAMgsEJCp5V2bv/EtErNJ0vJfIfNJi
	 P729hpsYnZftR+plkHMmKN/Eko8NbDFs8GnebT3X7jpbYw4ea6iZDiT0o+hLKwqsYU
	 K5dtpDfTX+KV6zVJ0qn07iSvAbv0bM1FddRYsk9WwjwKAWWJRBC5r1vsCydBTxZGro
	 n/BRGJxkDQG+Upi6ZA7Gzn3HRH1xW9PygfmIPSeaKO19MWk2qC66jTB8eZBtziFLfP
	 fAySC2tmR1/eg==
Date: Sun, 15 Jun 2025 12:10:19 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-toradex-smarc: add fan
 cooling levels
Message-ID: <20250615101019.GA7480@francesco-nb>
References: <20250613-tdx-smarc-imx8mp-fan-cooling-level-v1-1-59aae8fee2db@toradex.com>
 <aEyaNEFl3gD6snOP@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEyaNEFl3gD6snOP@lizhi-Precision-Tower-5810>

On Fri, Jun 13, 2025 at 05:37:56PM -0400, Frank Li wrote:
> On Fri, Jun 13, 2025 at 01:35:04PM -0300, João Paulo Gonçalves wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> >
> > The fan controller on this board cannot work in automatic mode, and
> > requires software control, the reason is that it has no temperature
> > sensor connected.
> 
> why not use built-in temperature sensor

This comment is about the amc6821 temperature sensor input, it's about
the way the HW is designed and it's specific of the amc6821 fan
controller.

Francesco

