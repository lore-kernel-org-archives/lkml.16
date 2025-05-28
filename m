Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF441DE8BF;
	Wed, 28 May 2025 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748460565; cv=none; b=pbWWL3gdz6sgMrWFTzF8yj0fqgG12a1VFMJ4UqLapY52aAIuMiYmDKPJc0Cp/lAdIl4VaVkJSbXaAQmCHFgWxnABa2r1W1dqOFwkuiF0cQVLVNZ/g8NU+fLFnnpkweSLHOS4KS7od59qh2kqlanz8CCT+LCJ16ATCqH0lzo/etM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748460565; c=relaxed/simple;
	bh=QKP6SoGjO4v2gq30fTvkeERfjbeZFZhgst2i8HhtVo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT71QWBt33HCMZ114XgY2ilNbFrMeMFfk5SALuvCMyu4zgcymgLE2ZRwGcZov8HR3laOKhNRuCJc4u+vtpFo003lhBiyXOqkUkhfhVq6DtVpu/PR55UU7ngFVI2rhczEXUP7MeMZV4Avqd39fwZTmIoqww36w7KLliRy3d1c6Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=lBE+kqyk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="lBE+kqyk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=eIMRxx2z/H/hv+X7IBy+7KaPKFUi+WDhTEznPrst60o=; b=lB
	E+kqyk/fAQkQaqyyrB3YkBGt0V/CUid/pij6O7YgVshYuML1yg3A6XyCf5Jm0vIuKZ4BO0Y3VqecL
	iv7OKdEloi8q9gvaOozhhTRqQPlW5Mewd4SDlwAhfhB4WZXOd1+f3s8kx2LMxFK9tdb89Qnikv74q
	KVF1+p9irewtHT4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uKMSj-00ECkC-TM; Wed, 28 May 2025 21:29:17 +0200
Date: Wed, 28 May 2025 21:29:17 +0200
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
Message-ID: <5afa6d62-4a3f-4c28-8165-363075ac36d8@lunn.ch>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
 <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
 <34a4441d4b4ed8db7cac585ce93ec2357738cc11.camel@phytec.de>
 <7f6d7199-0a20-4370-a8b0-1d05326af052@gmx.net>
 <bf0eb48fc72f4b0abbf62077c2f1fe4438579746.camel@phytec.de>
 <967484d9-4165-4b75-bbb7-a203c36e8beb@gmx.net>
 <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <517be266ebc3b55da53372a76a139245f8945cd8.camel@phytec.de>

> Yes, that's what I measured. For analysis, I added some debug outputs
> to
> the phy reset and the 1st phy register access. And as I can see, the
> phy register access happens when userland sets up the network:

Please repeat the measurements with NFS root.

You will find that the kernel brings the interface up right have
register_netdev() is called, and starts transmitting. It can happen
before register_netdev() even returns.

	Andrew
