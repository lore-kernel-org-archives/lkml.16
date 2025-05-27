Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BB327F74B;
	Tue, 27 May 2025 16:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362727; cv=none; b=PWvC3c6ZDCzQTcOJsPWx3hN5XDwHp9u6wH8FOpZsH1fQpMrmvv+XZ6y2VayyoE0d03ysX3X93rtK1SDtJcuXSNMyAaIDjFNWFycuTA2QfomGUR4CYD5N5uN+bPNL8Scv9/1+7WhuJXVKe2O2hChPnHCHgRY+u9rKQaNWYKNq0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362727; c=relaxed/simple;
	bh=3KcY+pI/8IXoMtOyw7VbVSfdzIq3MHBE8BiRGJzyTBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiaZAwtqVC5zylMx0aFOXphhcYyYAoQVuYxyzUWCIVti9W+wxHhBxrMWuiQGwJq6ZFB+XPNiwpqjEVgYGHXq4hzRS5PQVBp36/8qP5qLhjyVMOI6hdQPbQLRDrvlAOOqLvD0ys40BqA/C9B+XtTe20fctkHi9O2ECRMhAamkO04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cUegHvYd; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cUegHvYd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9rNlK/XBcvxaY6HC+BzHK/m/yi4kBfY4FGCOEbvM3Jk=; b=cUegHvYd7VyL7dPW+3g+aWWXae
	g4mkfYFK+DZFozxxITith4TlCR4ZCaeMCzSs/CoC3VY6rf8iHdzZ6SuF2cqWR9sBAAz4CbGi7eRC4
	yZUYo5+J3eJh73/1irhNoqcOwip0Fv7a0ULF1Hb0aL6GL5INzpHQtGMXbF0gcCa7Dqk8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJx0g-00E5r4-I7; Tue, 27 May 2025 18:18:38 +0200
Date: Tue, 27 May 2025 18:18:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: foss+kernel@0leil.net, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>

On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > should do the trick to disable the circuitry according to the TRM?
> 
> I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> 
> 	Setting	Decimal	Actual TXCLK delay (ps)
> 	00	0	47
> 	0a	10	283
> 	10	16	440
> 	20	32	893
> 	30	48	1385
> 	40	64	1913
> 	50	80	2514
> 	60	96	3077
> 	70	112	3565
> 	7f	127	4009
> 
> 	off	x	-315
> 
> Setting = tx_delay (hex)
> Decimal = tx_delay (dec)
> Actual TXCLK delay (ps) = Measurement from oscilloscope
> 
> Plotting this we can deduce that one tx_delay unit is about 31ps.

Nice to see somebody actually do the measurements. Based on this, it
would be good to implement:

        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.

For the moment, please limit it to just the device you measured it on.

	Andrew
