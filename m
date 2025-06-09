Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754FD2571B8;
	Mon,  9 Jun 2025 10:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464633; cv=none; b=qAEwPJwzwX0keksX+OpKBN0al2ONHnPcm8g4lhye7ZiNELA2vhpDA/ubyimM9IYu/4qtxD5LVks2N9ZVlHwzRM7SykZGdHLBMVW5MSaiheR4Hd6p9u4+ks9mwcadzwFivHssalWNNexILASdq4hWuBDnAtIsdWsh8vNATIGiBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464633; c=relaxed/simple;
	bh=bUFHrN+kYoh9Jw74vJgnwI32cWP3sCcpAQjhYR2YSxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaenkpoI2auiMmB6OSPhDMtbEGC4Xwe78JOQB9iv0isVcgrDlsi4D8ZhexlMUfvsf/8NjzDHii3XkK0nXdTLjhYa7C8bPZKzZj9Utxp7eqJxMlCtyDZplOfAzSc0DU2+51w/flDUcWNyOGSWreXodq1O14huxauXyYiewDDqRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=fj0L94Pz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="fj0L94Pz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6nx3PTDw7aNdyY1bOCfE7raQ5NlwbfEpTbQqELls0VU=; b=fj0L94Pz6IA1q1yJ+28NspxjCs
	ss1vG+22sASQArb7JSFLEnxY/jVr67CtMuOJZRUABz5fvlceMwxW2xPgtz2y+f2kRs6PlAjRdsPz0
	v5ZONxp1/7KKopnI7TtLcAvKf44ub0Vy0aYwjMyVKXx9T049grUC0HLmdDlYSCZBSCbezy4MzNt4x
	kxaCSIlNy1D6b6CydVDjoRROmrglRUQZTqSOHPrmJ3PBLqLEPpdZFn0aqIsF1O15Jro41kmr0XRj4
	UL/Gvje8ypA9twUDbmSHdWtCWz44EBX3dBHQz/muixaqI4UgjB6W+nn3IqsNLydaFMEOt3ZiW8uCD
	HIE7JkHQ==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfD-0006Av-TH; Mon, 09 Jun 2025 12:23:35 +0200
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
Subject: Re: [PATCH v4 0/3] Add support for Sakura Pi RK3308B
Date: Mon,  9 Jun 2025 12:23:01 +0200
Message-ID: <174946455539.762051.14386974894605199498.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250521131108.5710-1-i@chainsx.cn>
References: <20250521131108.5710-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 May 2025 21:11:05 +0800, Hsun Lai wrote:
> This series add support for Sakura Pi RK3308B.
> 
> Info of device can be found at:
> https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce
> 
> Changes in v4:
> - Fix vendor prefixes error (Krzysztof Kozlowski v2)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
      commit: 281bf6e619fc637282288a3a087e2b2ed3150cd5
[2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
      commit: bc099a4f5b7d08d97684648abe58d236cb7afa4f
[3/3] arm64: dts: rockchip: add DTs for Sakura Pi RK3308B
      commit: 79f2a17024412fd6f62208ab3fd6814e52588a31

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
