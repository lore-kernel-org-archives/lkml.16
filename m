Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8E24EAA9;
	Mon, 30 Jun 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276771; cv=none; b=gzpzKLIUvKie1AFg0lXHqqdGp+dmUdbbKisXfl63JsDytzPdE6KeSBtBO8wPWsn6iYrOn30MwzHYs5iMBp9wUZBOcUJ2sqqEVoDC+KeVFmw7ohCifeJRpV/9NFpYd2Zt9C5juTiq+7vr31OtFI8X6a6ht2WnG3nLm+mMgnYNcDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276771; c=relaxed/simple;
	bh=ALo3iKw06XVv1Pm9uWqUg3d1p+bWNnJREOI7P2wCxiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+6XSjntkrvgncJ3j0odQujtaeT01j6LhusU86WejPJBJ3bky9XDRobwAEPLtcOd2bitLFUYYg4ziCpa4rqBmhmzDAo/BfUYBY5qZUtI/fL0JybtztOJFRfnugGvtDtqv7qPZoVDIlpQm5ovNx+BxykalBBvgDjNe/8e/9xmSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=13tqCAC/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="13tqCAC/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=koTjVrT8QEmt2BSEA7nvrs29+/p5t8Ve9XmtU2/3bRY=; b=13tqCAC/6JGiYu5nRbjo7K+KA2
	OsYajqq7XRXW04kyPHhqA80PXwS0IJP1VaBCeFDThsISxLD10mRN+rleWNHNFsvVkgxRRC/e5yJ86
	HKRxNDYrL6rRbKy/XBMLqYp3Aq/dBuhIJZRk1ltdN0ZA8fVNdfWUV5+DsAkOQu/LwSIPH1fiAmANC
	8P972mu+ASOEubmaiO+gWR263BB9MidpMnqDP189tJ3uXpNDkrBs53j9iNT2z2BlsbKuUHjmSyBtH
	0+xdEBluQ8vrmB6cdIAvuks0Tg/UEoFLgMDVLT3jk6XSQxWA36YmVyalAEvf8d0OymTg0q7oVSAjG
	lq0tRo+A==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5K-0006Zc-JI; Mon, 30 Jun 2025 11:45:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add bluetooth support to ArmSoM Sige7
Date: Mon, 30 Jun 2025 11:45:45 +0200
Message-ID: <175127673173.138768.4135750757398834500.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621135319.61766-1-liujianfeng1994@gmail.com>
References: <20250621135319.61766-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 21:53:14 +0800, Jianfeng Liu wrote:
> ArmSoM Sige7 has onboard AP6275P Wi-Fi6 (PCIe) and BT5 (UART) module
> which is similar with Khadas Edge2. This commit enables bluetooth
> at uart6.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add bluetooth support to ArmSoM Sige7
      commit: 84fb79b8acca836898c5ebcfb1603c224a2c0f7b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
