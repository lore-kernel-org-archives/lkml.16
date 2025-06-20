Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE5482F2;
	Fri, 20 Jun 2025 20:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750453114; cv=none; b=myWHxRQOUoPZn5hgFBtgvn9LjUmdVHC1VZmnZAO9R6Z/GAGR9GYC9fR8ElBRD21GWPGl6Ay6OLdQFmp/FjxVffa5Ko5zoqmhiaSn2ErKmSArliG86SbrIxItB/ZR7NUY/TDdjcVOajYnMXbacjZFQAvFgdBLzlRxA982+41oDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750453114; c=relaxed/simple;
	bh=Cjpuh5vjBPzLcu+hsyVvSelBCLA41PZZRQOTCXqBOhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCHNnyXSiabKSgD/MjflZ4sw6RwSyp8W6THSG3s9mRp/Jt1/uQ0UpwoQPUTrl8UXEwmTMaCWvjfobFUtKe7B4G1q3TJiYyf6VLj8uZEKb/zqczR3X3+adlRoNw5AWFfQGAms50b4XBIHLFQncoGygs1xquACWhD84X89o2rGIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ISdXrzz2; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ISdXrzz2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RmxX3GcEAqirVX2xL3JmZWN/yrXriImaULmWLhDXmS8=; b=ISdXrzz2QewK1kgmY3GyFg++AM
	/6qLB8uUlYUyKOF6vEmVu4PkYV1YU9zFWU6/5+u3ruI2VhbjQ/vvKep6buGqhREZwFnUwn8rHkWNr
	pOEMuAdZXTOe7kwoLzLgXcrDUxvdojBE5aH0cuyjcY/ZWPFELOafQQhBlhaXpBM65ogxfw4VyYVMq
	Q9ADmHPsdKuLYUz0rgw6+BFnP7AAm+HP8QxiVXjiA4ARcUToS5kmBFrsQoJS7tfbikZM1VNQuNcW1
	UkOyJxRLekQrw3O850Ik4Tp8M1UvubhqAbKvS1mC7wHJoA2kP3JFB3gukvY0D4uV827oJy1r8dYnG
	3fumYUYw==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSioS-0005nr-Ra; Fri, 20 Jun 2025 22:58:16 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hsun Lai <i@chainsx.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RESEND PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Fri, 20 Jun 2025 22:58:06 +0200
Message-ID: <175045307845.1579770.12394851384194838033.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250609113044.8846-1-i@chainsx.cn>
References: <20250609113044.8846-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Jun 2025 19:30:42 +0800, Hsun Lai wrote:
> This series add support for Firefly Station-M3/ROC-RK3588S-PC.
> 
> Info of device can be found at:
> https://wiki.t-firefly.com/en/Station-M3/index.html
> 
> Changes in v5:
> - Make led-1 off by default (Chukun Pan, v4)
> - Add color settings for led (Chukun Pan, v4)
> - Remove vcc5v0_usbdcin
> - Put enable/gpio before regulator (Chukun Pan, v4)
> - Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
> - Update the name of vbus_typec (Chukun Pan, v4)
> - Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
> - Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
> - Remove usb_con node
> - Remove extra blank lines (Chukun Pan, v4)
> - Add phy-supply for u2phy3_host (Chukun Pan, v4)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
      commit: 4734c93b5032a3a28ab2313fd9e2a792204de2fe
[2/2] arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC
      commit: 471f0718c815767c2c7f6ce66880f1acb9515581

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
