Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82899475;
	Mon, 12 May 2025 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059142; cv=none; b=XkZvaOwK53eKrJzDc6g+jtduwjOEjCRrj0tT4oXJlqobnC4uA1WNtZq8jAQEEBS58ZFeY3qmZ0pIHSesoGyik9BpH0ejlsEiInaagNV4XwXUQ4xgOukwVv61/wYCqTlaFAkJ1KajpHzChc4OdOG50a+skRxt89uJSrjQFGgTodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059142; c=relaxed/simple;
	bh=lEjopDmJ45b2jh+CxOfurwes08Z4xyMnTZAP+o23E0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwPmzFNBC9ajuodMOhttfP9Ho+zkE56GvFO5+n7iSXBssyRtHzEa7RZV7q0A757h5lz3EL2j7tkzcrnyz7BUMw/rApEeHJOoSJEOlHnGMJD5CQh8m9m93FmPPxADG/DwQLKrmStMMW/v4heAQZvGtba4VGN5gpCIC6cCwtYe37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fnjp1Dab; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fnjp1Dab"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Bze3a/JOPk45eJ7Lh92/3/o7MFlz1ZNCNXNC/pYynXQ=; b=fnjp1DabeiPSvaolRzf3cHYblO
	J6Glucad8ZfG+GzT4h/Re4yZxiSnix1g5n0FEcLpqVR11CuHeGwZP5XO5ZgMyy2LLa7ur1wdKUpZR
	Tqyz+fjeWMwSvardh7aNDFCFGg8ilSedebDoaHd4/Sa2aRNHYXwKGkIZbRUTB71NFWjg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uETso-00CLR0-Ae; Mon, 12 May 2025 16:11:54 +0200
Date: Mon, 12 May 2025 16:11:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: chainsx@foxmail.com
Cc: f.blogs@napier.co.nz, conor+dt@kernel.org, heiko@sntech.de,
	krzk+dt@kernel.org, robh@kernel.org, sfr@canb.auug.org.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: add DTs for Firefly
 ROC-RK3588S-PC
Message-ID: <e85ca75a-b4e0-4dc7-b6ce-ca827cc9d447@lunn.ch>
References: <tencent_173762F0D99C15A5751D2777C0061E75FF0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_173762F0D99C15A5751D2777C0061E75FF0A@qq.com>

> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-handle = <&rgmii_phy1>;
> +	phy-mode = "rgmii-rxid";

This is probably wrong. Please see:

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

	Andrew
