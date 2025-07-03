Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E112BE623;
	Thu,  3 Jul 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529558; cv=none; b=DOOjOAgIYR1GROHVIcKbGeppIAmxkOxBgdiqHCHwWzvJW+JjGt5IBYFoBgpsIyi1OLnjhS7ElP61lSAEGHvv4l+LgUPMJ9ViqQ6sCeAX8DJGBHqfbBNleBUO1SHO/ptHIkL4IaJS0MNXjuGg4PdjoqFWqloPnr6EqgemTdVFiiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529558; c=relaxed/simple;
	bh=xNnIhUC6HsPaqT99aO8dy/nD1WjYYLwoDetXBCTWASM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K83qCrB0hA2oQm51JeazqmU/5QDVYjjIzcwIaT72r4oo83PPgSh6RAlCoCp8fp9p4ffqZCRtOMxJFYurJeizpMdITxmT89OxHT7LNH8GLxrknUEyAgWn1qumIP0gH42gPHC/PaDt/XymJdUM2hsFtXW1HAV/lD10x7IQ0ZVXU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0vNq3pOW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0vNq3pOW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tGLHPn31SBnvlRKtDGgofPJ9xwIi/cPbYqUokOekMHk=; b=0vNq3pOW8vaihoEQMlxVNi/Qem
	4KzOjTIY110+8Y30tKn/LO2jaEPbeM7CI0jQ1pfrU2QzaNaWOExTp+OfyYJvMBHoeDNHcH9qwRzyS
	qfx2xx2Qx/XBg4vC7sKrMjQyRpSHQexJ+E+zwNtpaATvXsCSsr8sz+Umhp88dbEGKQDE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXEqG-0004W2-E6; Thu, 03 Jul 2025 09:58:48 +0200
Date: Thu, 3 Jul 2025 09:58:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGW8Nm8ZWMwRYVOo@localhost.localdomain>

> > How do RGMII delays work? Connections to switches have to be handled
> > different to PHYs, to avoid double delays. But is there extra long
> > clock lines? Or are you expecting the switch to add the delays?
> > 
> >       Andrew
> 
> Hi Andrew,
> 
> The delays are introduced in BMC MAC by setting SCU control registers in
> u-boot. The delays on the switch side are disabled.

Sorry, but not acceptable. This is something i've been NACKing Aspeed
DT patches for. You need the MAC driver to interpret the phy-mode and
program the SCU control register as needed.

Since you have the MAC introducing the delays, you want phy-mode
'rgmii-id'.

If you want to submit some DT now, drop the ethernet node. This is
what others have been doing while waiting for Aspeed to fix their MAC
driver. Having said that, i've not seen any progress from Aspeed, so
it either needs their customers to apply more pressure, or somebody in
the community to just fix it and submit patches.

    Andrew

---
pw-bot: cr
