Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFA92750F0;
	Fri, 25 Apr 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595268; cv=none; b=sVPn7m2uu7BykWiPMCcZQ8NSOORkpugagkYYa9mZjqV1whOYl5hQk3ovMz3D94AMoqn0EcsZXVxgGCAaOW5qnZpVLxJ7Hsw4qdx0qGiolEJKMPHdx6gO9MVT0YNSTxK0o4yvoJBSkOwT3Wdw3bJsEUFOPRmZf4CDzu2OPyTTgY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595268; c=relaxed/simple;
	bh=k3vp6sSm8LMWEWl2AFRH7X14DTiBMybYPojlKq60GJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2mQdRQhJhQjXDS1UlPHqyvLR6EPWhffl+jI52uEVD/ps8hRQ8amtXuhujT05HQ/5BZH5OD3GenFVWTaD/zjPdGYp0Wok+JMoNjfblK3FR5MdE3rzGhhvo5/eKDPYKMpnlmIYgGVlmOozuHH1tUxww/J9uhUYC08T0BEDFkMekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4HP5JZt4; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4HP5JZt4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rygg94K3zvEB+ZzHbtjPNTtEtK0krqj/Y+/TH56unmc=; b=4HP5JZt4ncDGeyZcYm6V8Dec6w
	Wr/Mo6FR4kV+wIEU9CKCkRLuQNLvG5qwXnFXUKM/8J8zTas35rghKLKrFq47A6OfiQnLaNv2cvB6V
	y9n4qz7IKwY4mJysU9CWJpDIuraGQMBjH55GaBg7aKxvOzEODCBGkquxQS/U/SVFFYxw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u8L4A-00AalX-JR; Fri, 25 Apr 2025 17:34:14 +0200
Date: Fri, 25 Apr 2025 17:34:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-3-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135429.174a1871@donnerap.manchester.arm.com>

> > +&emac {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&ext_rgmii_pins>;
> > +	phy-mode = "rgmii-rxid";
> 
> So relating to what Andrew said earlier today, should this read rgmii-id
> instead? Since the strap resistors just set some boot-up value, but we
> want the PHY driver to enable both RX and TX delay programmatically?

Yes.

There is a checkpatch.pl patch working its way through the system
which will add warning about any rgmii value other than rgmii-id. Such
values need a comment that the PCB has extra long clock
lines. Hopefully that will make people actually stop and think about
this, rather than just copy broken vendor code.

	Andrew
