Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681D11BDCF;
	Tue, 29 Apr 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961985; cv=none; b=mzYZx50PRcUpQ10hVzP2ceQax0epP2qe10s++DHCFgn1lKgji/+Q+ymEbU847blcUFSangQXUjA+iWTsOelDvK65i7E5hJk+FaxgeVOXbvXbjIq80eK8rkttDV8APxmWoyQ9FtWJsu72ZZupzmuPRM2tFKVtRJVGJgRIdwGe+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961985; c=relaxed/simple;
	bh=ibS+9LIGFeW58Se0f7UMaWoaVXJEMtdJbdWJFsQCYRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzqj5LrK4bb8lpyFFuCw7Xv4U8VfP0ew9K5N5EmzxgZRftJABnR3DWOA1ekwCtBGZPj4wUx1wlC1J5weMbi0cESqDPsfFPsTuoD4VFLIBcJpXTco/64GJFrj5lqNVODS5ckqkrVROkszFcOxV4pZNJO/2dK8RW9aogOZCM/m33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=g7xyMol7; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="g7xyMol7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=DNfNy6CmTrcklVHnHQd89U0p84ZEYhAgqOFVHom5Ua0=; b=g7xyMol7tyy9bVwY9WAg4TNOsj
	VsjnbhF8Y/z4zxhCKCdozKYSDbF3D3EResQFXBsRdrSEBJy0LjAniPc/YuC4V9W9O+b4c3o93KTZe
	PLjl753OO7cGalD23cvVT7RvlDtO1O1LKH2f1abwfzmmJrOb3+px5VJoRVgAXSDii4/wDp2bHKjjb
	anQ1nJvyG5wAviuyDnb+f+wI4ESJ47GsYQK3mcKu2ytlz9kj2pTwIGZ/hQHz/+ZC/U34Vptg25FM4
	Ts7UNJqaqOALW/NzSLyaBVfkse8E58woxYCmaUHkLFPn36tbtmhUcNGbeCng0C/PcEVms8ABHYUSq
	AdoFvTgw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u9sSs-0008Pg-Qh; Tue, 29 Apr 2025 23:26:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix Sige5 RTC interrupt pin
Date: Tue, 29 Apr 2025 23:25:49 +0200
Message-ID: <174596194659.227689.14787521084378492437.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429-sige5-rtc-oopsie-v1-1-8686767d0f1f@collabora.com>
References: <20250429-sige5-rtc-oopsie-v1-1-8686767d0f1f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Apr 2025 18:51:55 +0200, Nicolas Frattaroli wrote:
> Someone made a typo when they added the RTC to the Sige5 DTS, which
> resulted in it using interrupts from GPIO0 B0 instead of GPIO0 A0. The
> pinctrl entry for it wasn't typoed though, curiously enough.
> 
> The Sige5 v1.1 schematic was used to verify that GPIO0 A0 is the correct
> pin for the RTC wakeup interrupt, so let's change it to that.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix Sige5 RTC interrupt pin
      commit: 4bf593be2e462623c4c34c7e3b604eb3f8f9de45

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
