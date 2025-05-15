Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EEB298CA9;
	Thu, 15 May 2025 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314301; cv=none; b=V4nRv4IAAuksxc6f47El43MooGxnsezeaIYfMSx0shZ3HfaorJLGwiKUNno9+fiqYRGm/TnDLysPiALivjnz0a+y36rV3WDq36ioQpO54QdmNH4h/Bv8hF5fvVQDtqLKMnaA3HM7oXW00VM8HWANd/9tT4wupXCGbFsXYMvq5KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314301; c=relaxed/simple;
	bh=NckZ//pGAP0yLtArNp3RIXaCq9tjR28RVyFRM6jiu4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHBCvV8dKSyaScL5ePPvauMkQh/Bm8Le2e8GF9IGTsnKtZWUsVeH73vuvgrSn6vgnRzz1yHUFVV8Hy/7it60//GE4T1Yqc+xPnaAiE3Cb8McQ+SnyIHqe7MsvJKTqGf5c4EL/0X6yLbjCz4RRq98IZ6wRq8CAFKI98rdjzfNlsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ujSmV3Dn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ujSmV3Dn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0v9rGU/IjXsIwKAmPbAgcZ06mZDfCq6fUIVYFXp6dyA=; b=ujSmV3DnKfKbSdlpuqnVHKTIYj
	y9w7RqunMmk/kXfndhmzifAaDSy86IT8l9MTtYRWffuG1+qmuykO+LGfU+5IJrs86mOc56th/KKxB
	KuV3c0HhUwjy0gr2fDlBH5cCUFXG13tts51pmObzSJoYV0smxxpk9SBCj4+9f00iNk1tpxu2DJdD7
	BetMbAXR06iF3uwM1JuiIql99eHq5ljjlbXOdHl2u7RF4KhLxdNggfO83ET9bjgxOEiVq8JnGhcmR
	R73ExhYsquDjtwckI1ajFJYJ8mbUbAk2o5MRhPh7/0dS57FWup5HF8/NB7P1e8HLAkzyr2UbBabo8
	xKYQMz9Q==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFYGV-000595-88; Thu, 15 May 2025 15:04:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Improve LED config for NanoPi R5S
Date: Thu, 15 May 2025 15:04:37 +0200
Message-ID: <174731427168.2526275.12891764403399603559.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513170056.96259-1-didi.debian@cknow.org>
References: <20250513170056.96259-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 13 May 2025 18:57:27 +0200, Diederik de Haas wrote:
> The NanoPi R5S has 4 GPIO LEDs, a RED one for SYStem power and 3 green
> LEDs meant to indicate that a cable is connected to either of the
> 2.5GbE LAN ports or the 1GbE WAN port.
> 
> In the NanoPi R5S schematic (2204; page 19) as well as on the PCB and on
> the case, SYS is used and not POWER. So replace 'power' with 'sys'.
> But keep the 'power_led' label/phandle even though the kernel doesn't
> use it, but it may be used outside of it.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Improve LED config for NanoPi R5S
      commit: 1631cbdb808963354ef6b6454bc617cd15f90718

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
