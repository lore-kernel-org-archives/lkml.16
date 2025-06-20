Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8D1264A97;
	Fri, 20 Jun 2025 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750416293; cv=none; b=gNmmGRy5alATQBT50cp4MU69D4jUaTUVExomc4eatNfQNySNMKYOiO4DBuCXGC+l9PhepfECzeyUC7gXdBRBvQb05OeNlgLnFXY1BjHIM9MVSZ7n94Ia50insJHLLDvZTE5GEENhRrOCznl0b+ZRNryuJkOKEjvfgWDZx+iJwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750416293; c=relaxed/simple;
	bh=sn/hyt1c0VCkcr8vXMO+BQcUYCwSDgiHcd4pafoMzBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U9k7rtVcFwgprw+0RGUvkBG8aVEg8zMbzou80yyt4d43lOKR1Q48d7+pcmw7aDBBWMkJKueznKN33V7ePQJWH0wC3p3fdJHO1sL9Ku0oZuu5+psX3+2Wp4UgmVrkoUlhY1CXHfMs0gmNplvp/QVlgd6LuRFUpEnU8JRc02e6Yus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Gjpy6Q0s; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Gjpy6Q0s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=E6NpiPrYTwALDtKz4Xo4CAOrnjqTcZtEQ2HVXqcTS0c=; b=Gjpy6Q0sKwh6AFiY4TGtAC7cU/
	JUK0+UG0Mjnp2hEHiNtteiPOxf9cdPvx5YRDNYhTrh2Ci2Z/AYju00OGsjM1MFDXw5KpIM2s9qLoz
	4Hxc3Ld9HeT7SmrgLOUC7/ej1VJ3wHaO6mgK9zqMkAhichj9AKUuyxVLLJyyUXDBZSqkVgmRjUJjI
	3FfZSwItxTBhu8JAyI253+5EPjYrMu7ViqAwOJedra7bBNkKFbOL6LNgK3WxTsveh6A04KJnspgKI
	PyK+sUriknvtIHUiSnNPcJBCq+lFOfOfH0535EAnyrfdCqnGZSID66W1J7YepvUimT7tYz/DCkr/8
	aPVeyuZA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSZEi-00015m-Bw; Fri, 20 Jun 2025 12:44:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: support camera module on Haikou Video Demo on PX30 Ringneck
Date: Fri, 20 Jun 2025 12:44:34 +0200
Message-ID: <175041626982.1561125.14591843219943750860.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 18:22:15 +0200, Quentin Schulz wrote:
> The first patch is fixing dtc warnings related to the ISP on PX30.
> Sadly there's still one due to there only be one port in PX30's ISP and
> still address-cells and size-cells properties set. The "issue" is that
> there are actually two ports (see binding) so we shouldn't really remove
> it, but the binding requires a bus-type property (either parallel or
> bt656 mode) for the port@1, which we cannot know from the SoC PoV.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: fix endpoint dtc warning for PX30 ISP
      commit: 5ddb2d46852997a28f8d77153e225611a8268b74
[2/3] arm64: dts: rockchip: px30: add label to first port of ISP
      commit: 9ad8e83d8abd083c701e75d7fe664c706daf6d56
[3/3] arm64: dts: rockchip: support camera module on Haikou Video Demo on PX30 Ringneck
      commit: 99680fd394b912bf133b5b1e45aced1b7aea1d2e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
