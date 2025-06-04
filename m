Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31964AEE0;
	Wed,  4 Jun 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050028; cv=none; b=hSHmEopB1tiMCrcFnX0n/qOqD6pva4eQoi9nf8/DtdIuoVw+AgqHgVDrLrX9GS+rrsjKo3F9wbJ9u1V4IUF3vO1MvL1XLpfs72v7HFb05Uk/WbARoHUnf0XJlOzqsvsjHB+bQD2E5AINn9wJR3lOl8dYjOqlr9pL1Bxs7SlOWd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050028; c=relaxed/simple;
	bh=8dAZHusb5t2w59SgkutsFjrgtEw1nAA1a6Jg2vrQV5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3ZBPqRAUOEHLLLhWX1TNY9IE29KLagfdoY1aGxhyNGDx2W2emvYdviCeNKwHmSpEmi4IXq2LK4S2kwOm6qC1a3p+MljCBLilQZsv6mItQxsukriw1/Chw2p39J20erHvfBjkYtULkfrIgsb6Pjx3r/3E4kU6/NrRoS8yrCtCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=m38/as1G; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="m38/as1G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q6OKa9Bkbeq4QpUjqQVjbZ+Iqs4t8ntQfpdJAOPX7Vc=; b=m38/as1GRwuEE/yLC+KrimAYLN
	p5Up5uPCb0ci1r27PA7kzZouknOp+tn2vZc+nNydEmWtumnypEZYwYvZ8Hhl/Ii4/+/m08Jx5yO8c
	q/uzfxVyk1WbcynBj15QrlowY7Ez2XH//58JJL9eZHAw+FxgORYT/5ir59n/UledaC6Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uMpoF-00Egtl-Pm; Wed, 04 Jun 2025 17:13:43 +0200
Date: Wed, 4 Jun 2025 17:13:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
Message-ID: <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch>
 <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch>
 <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>

On Wed, Jun 04, 2025 at 03:08:09PM +0200, Stefano Radaelli wrote:
> Hi Andrew,
> 
> To clarify more precisely: hw team told me that the required 2 ns
> RGMII delays are
> implemented directly in hardware inside the SOM itself, through passive delay
> elements (filters) placed on the RX and TX lines. There is no reliance on PHY
> strap settings or any kind of delay configuration via registers.
> 
> This means:
> - The delays are fixed and cannot be changed via software.
> - From the point of view of any carrier board, the interface is
> already timing-compliant.

Great. Please add a comment in the DT explaining this. 99% of the time
'rgmii' is wrong, but this is the 1%. We should make it clear this is
not just another cut/paste error, but very intentional and correct
because of the PCB design.

There is a patch to checkpatch.pl i want to introduce in the next
development cycle which will look for 'rgmii', and if found, look on
the line before for a comment including the word 'PCB'. If it finds
'rgmii' without such a comment it will issue a warning. So it would be
nice to avoid that in your correct case.

     Andrew
