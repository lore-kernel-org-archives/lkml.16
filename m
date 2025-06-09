Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73771253F07;
	Mon,  9 Jun 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464623; cv=none; b=eaE/uC0EANKurhZ+8j5G5XeYNKtu/yddNIQRCW+mbnmCe26DOEiBnQGlwZ2pVK1ZhhuQxktVWduesd870VF4HKJO4gPcrOz3OH1L5bIXMujnqb3rnpy46rBqrIQ4Uu7fj8mwAIUrfoGrB34O74EebUgL45GsOQtzPTiAYVtK7P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464623; c=relaxed/simple;
	bh=akIpDlWFQIzVchHSCAdAYH59RCG3cU1p17WoozIyBKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWKJ8StU23CZNpZuc4TDD9y7gvs2nnoys8iOMwwz1cfK3UBzAQKuqHQywYMs4bmzNTI50W7//370w+RY6t30bXbBZkzmnGrhcU8HHPM10X1z5Y7I3n5vBBeHgt1WW1bkc0TeG/+/ap5IghRXsmvVLiMSDts9CcJFyGOMqG3AIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PycMHKuU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PycMHKuU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZZM08u/ZwFdSTLKGSi2Lr532AuxtYKdqYqXMoYpFYrU=; b=PycMHKuUPgOEgJCKL6ls2H7MMb
	rFe3QS4Z21notXgNism+v5+qdJPdizCMa7FofzODGvhHdB4XbpNzdu91gnZHJRQs5frKHloSmm0I3
	pQwDwQJnfpMhsKklchVEZ21asy4okOXYqAz9mO9cEa+3PQeWKynJhCRxjZFRW8zX5m+aKJ7Ctkwke
	aJN/Wqxjk6d3atC2mbVGNrGH4Sh8yk/WRj2/ALmsGgSj4jqU5xbXMahdMuJv1k+D7kH/oy+PAikgN
	bOvoKteO7rEn/zCTDmrIsbPTGPQnDqEFM07tgNIbMJKElXbliYBcVfvmbPAHL+CShMMfqOCDH8kkx
	MaG929PA==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfF-0006Av-R4; Mon, 09 Jun 2025 12:23:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/4] Add RADXA ROCK 5T support
Date: Mon,  9 Jun 2025 12:23:05 +0200
Message-ID: <174946455542.762051.4819735721903497474.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 May 2025 20:50:07 +0200, Nicolas Frattaroli wrote:
> The ROCK 5T is quite similar to the ROCK 5B+ and the ROCK 5B, so to
> share as much DT boilerplate between them as we can, this series
> reorganises things a bit and then adds the ROCK 5T .dts.
> 
> 

Applied, thanks!

[1/4] dt-bindings: arm: rockchip: add RADXA ROCK 5T
      commit: ecf7114f818148df10f4e13b5e1087de2f5d687e
[2/4] arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
      commit: 8b76abf78321ea3361c01e849c8dc3a6793c05d6
[3/4] arm64: dts: rockchip: move common ROCK 5B/+ nodes into own tree
      commit: 988035f152709549a095b12fcdcb3cf26cbad63f
[4/4] arm64: dts: rockchip: add ROCK 5T device tree
      commit: 0ea651de9b79a17cbe410a69399877805c136b76

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
