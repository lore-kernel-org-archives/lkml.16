Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE92BD593;
	Thu,  3 Jul 2025 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529860; cv=none; b=TZH61rbP75C/8aLiunBVKo75qhjotQZLUl7OvxraX9WGjZDEqBsirVGcJyo+k85m4mcfeDY5bZygnE9E2uwm25kh52l2Lyc3PSE35LKpUyNYZEaJ0nxJ2fEfKikmNlcU8nt7yLz5+Mze+5SeatMl6EG5plzmxz1Sp93P4bDjGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529860; c=relaxed/simple;
	bh=qck+zoSNbDS+1fzZEFSAxmGXpteaQLljB30Wp0QvAnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjAGUGEeM5Vg/MzJ1SNyIzbupscSdMSl08Bv9sSrTE7/SkC43DCgAjMvKYQ7TXHa1jcYle6IuPiZKmuZbCi6LvTttQ8J+6YquWG/+qSt6RtbaTZ+IOfEhq3jRpbFpROV4IymZM3br77OUS3bnfFNw7mQQ2h+bnareME3Q31hHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=m+X8rmO7; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="m+X8rmO7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iurUCQkQ6NU0bD6+V+iw118TmNVywv06hQqDSqml8f4=; b=m+X8rmO7ABcAgVme6uM4LHj+d1
	WYzvhrViBMOPIoPNblfxEgNGO1uvQRItO3AdLJWOPy/k531y5YFuyWth71nC4/ByK1iCWgfsXPQDo
	neP4KP+lu27yO8zDeTTWNAVX9bc+j7qY2mq0JEfsLBNbTdoggQOvaV8QBLyLBkb9epgEpsTT06H+u
	qs9ZlY+I2wofvcd3cJkxEYiTH/fsjrQ1NzuDfyGbRhKaoszL0GPVYwyjZ1wJVKrHgYOjUNoS4bozz
	PtmhstF51mhw2k+kO4PEAA4il2AJFsIrVErP5Q7YN5KViW1Fl6oO5MQo8e+tn0DhuIURCSvJ9lQwD
	BUwEH+bQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56566)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uXEvK-0000MI-0j;
	Thu, 03 Jul 2025 09:04:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uXEvI-0004vN-04;
	Thu, 03 Jul 2025 09:04:00 +0100
Date: Thu, 3 Jul 2025 09:03:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
Message-ID: <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
 <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jul 02, 2025 at 11:56:20PM +0200, Csókás Bence wrote:
> Hi,
> 
> On 2025. 07. 02. 23:52, Russell King (Oracle) wrote:
> > On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
> > > Replace verbatim license text with a `SPDX-License-Identifier`.
> > > 
> > > The comment heades mis-attributes this license to be "X11", but the
> > > license text does not include the last line "Except as contained in this
> > > notice, the name of the X Consortium shall not be used in advertising or
> > > otherwise to promote the sale, use or other dealings in this Software
> > > without prior written authorization from the X Consortium.". Therefore,
> > > this license is actually equivalent to the SPDX "MIT" license (confirmed
> > > by text diffing).
> > > 
> > > Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
> > 
> > As Florian has already mentioned, the preferred format for the summary
> > for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
> > it's "ARM: dts: ...", not "arm: DT: ..."
> 
> Ohh, I misread it, I thought it was just about `imx6: board:` ->
> `imx6-board:`... Ok, I will re-format it for v2.

Note that it applies to _all_ patches to arch/arm/boot/dts.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
