Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210E2192EC;
	Mon,  2 Jun 2025 12:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867219; cv=none; b=gocjaS3MPm/zfxkaEapXkeiITAMCdfvBaaoFsPgRH+ox+RfSkLojrPE2MLa8fxXZF5QM1E4fYSQBSoX6UaxwoDubr4em9IgEu2gOb0tLuGmHl5rZd+Sjkx6EzKNO2rR7c1s0QAXF7ioKwKHXytT67ecwn7xd1UvmA5mhuHttLFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867219; c=relaxed/simple;
	bh=kILwxbA4feAy6G/FB0TXOwKAYb/2jC7u5uf564QQ5yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwO7m3yUV8IrfJA2+jVObZxBtnjNEc/XX6UagGmVxHcl1AIXJHqCfRz8meNAG98PGnl62UxP11yeEA4B57hP2pMZdrTLciuPI/ZdUmNeN0e7rlp5/Vesu4bn5zqzsZJbEnifQVfhP8J0BRZcw+/Po9kiwljM/nyoeT+6xv7wPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=SRKJ7gEk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="SRKJ7gEk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DoXTw3y1WZb6kUZwfppvYhZWgShbh4hkC/pckhm4nPo=; b=SRKJ7gEkMMCxuG9Oqpzr9Bzdj2
	zDXbd5hxeym30p6fcPMATstXSAGFqKZ3jhJm6zi0FYlu8lTqMloZTZnb0vEwJFvX+DxMD/V8aQnZp
	s7liJX3gjUlGarj8UK7Pdi1CRVgFowN4A13msDkYIzCwkX/Yv7aEsxdXdL7PF2R2ItQw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uM4Fc-00EV7z-UN; Mon, 02 Jun 2025 14:26:48 +0200
Date: Mon, 2 Jun 2025 14:26:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christoph Stoidner <C.Stoidner@phytec.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Message-ID: <739f93d0-4cb4-4f1a-8792-84502d4beefe@lunn.ch>
References: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
 <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
 <a948b903766a82897e5fc17a840ab40e29f5eda4.camel@phytec.de>
 <8e448625-b4ad-4bf1-8930-6fecdedb1d8d@lunn.ch>
 <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78ec24d09d129d52d3442f6319cf1ef5b6ce7f3d.camel@phytec.de>

> > I agree it is long enough, but i'm also surprised how slow the kernel
> > was. Are you using a fixed IP address, or dhcp?
> 
> I use a fixed IP address.
> 
> But isn't the bringup of ethernet+phy interface one of the last things
> that happens during the kernel boot-up?

Mounting the rootfs is somewhat towards the end of the core
kernel. But if you have an initramfs, there can be modules loaded both
before and afterwards, and once the rootfs has been mounted, yet more
modules can be loaded.

> However, what timing would you expect?

I've seen interfaces configured up from deep within
register_netdev(). I don't remember the exact configuration, but i
thought it was NFS root. It might be in combination with initramfs. If
you have the Ethernet driver as a module in the initramfs, and are
using the "rootwait" option, it could be that you are already past the
point it would first mount the rootfs, and with every new device
popping into existence it is trying to see if the just created device
allows it to do the mount. At that point, register_netdev() is going
to trigger actions.

	Andrew
