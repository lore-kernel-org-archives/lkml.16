Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C812DE704;
	Wed,  2 Jul 2025 21:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493175; cv=none; b=V84SmCrcvL6rLA+iW3Ubrrl9KtgDDQUkXdRRRqrLMB6cp27U/1ofeFeW0//TkRrmVk6217lw4NX6mfCEFw3I4Goa2KTxaziuxgYtrWruZJLsP/BJ7a4nXHj2PbqV1PE9T5vEY+9/KGjp9ICd9bva4QBvFDatw6Hb1rjH+3PfESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493175; c=relaxed/simple;
	bh=ShsEDavPd03jdfDzFNPmnHwHd01LCCQlm08KJ1l6LqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRhjJTPhw5HBjhgT9f/UhnazWkwjMnyMdPWuL6kyYPZSmqLKjQkNiyBYqiQwXlWeyrrQpzNdgY2Ic3yN6aoOZEbvdz/muiqtm2Co4+lWrxivHjCq7bIULDmEttNc1hIpuM1WPwEKhe3TDsCwk26pb140FsCBL3UX1AypzPuHUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=NrnPD4Oi; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NrnPD4Oi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O2gzKkiuh/7XKQtv3DJDDajNDBRpKD1gmdPIiBKuNb0=; b=NrnPD4OiDyjcOqPJKQyfvjewYI
	YyS0T7bf7+dUxAxIu6E7hM8R3UNc3BFnHTEJEM7G0a0jIDcsIrHsdNtQuNMEFi1LFjJZ+DoRB4RYW
	6b4GWy+3OiY7sMDX8MDtZEeLCZZMOly4GlUB3LfoCVOvmE9QvQKCwPGGv8xP0s95SoOxUmqOBJzAq
	3UoBHMHJohQI1Qa9r7q/l2b0TQ5gIwQDwMHOZzSdfqhvGvKict8vlJQBIwj64ATUSRdEML5KX1agz
	D3TN9EOQeJUrKNgUdNlzZg3N5pjDqW7EWc9QfKpPYgAQedxo3WDatmcvsa3lwQ9NCdEO1F3NsZxik
	+ioV5jUw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45462)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uX5Ne-0008Gr-0D;
	Wed, 02 Jul 2025 22:52:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uX5Nb-0004QW-2f;
	Wed, 02 Jul 2025 22:52:35 +0100
Date: Wed, 2 Jul 2025 22:52:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
Message-ID: <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Jul 02, 2025 at 11:41:54PM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment heades mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

As Florian has already mentioned, the preferred format for the summary
for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
it's "ARM: dts: ...", not "arm: DT: ..."

Please ensure that *all* your submissions follow this preferred
format.

When in doubt, do a git log on the file(s) you are modifying to
discover what has been used in the past.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
