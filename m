Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16E212B28;
	Thu,  8 May 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729064; cv=none; b=VGz2jmKSKrwBUjnW1vh95/WT5VT/GfaAcwhnN88h1tdmmvEPRniTTpmljnROtCe15xXeAq0upzvk8DBbhAsnINZCSjXH6/Z3LimtJo9ViT5I8MpFdMb9/d7xuMV9l6TnK6MEqmalfDAGPE/539BgA5xaHZkStI0dsf7u3QExLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729064; c=relaxed/simple;
	bh=iqi0t3Ha1t0lG8RPc7T1tta1XB48HjAdibQR2crG0NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YA7rI3Yn5q2JrgvVHEsX8WHSSrCuwEfqxk/qEhr4MMUZiBsiOhqb87spFpZnvhgNkD/0Gu/X3vF+aft+8ixoh+bqiF2t2TSi6WS0quEe+9DcX+G7xtaEp/m5k+voR35lWHM/g6BBc9mDpej0//StnBjoGPe6ym3SVp5XnUVn1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tgYxyzAo; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tgYxyzAo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NVNg8W4i0W6hja2INdKL3BkLpr6NjK1WYIGNB9EYZTs=; b=tgYxyzAoFJIkQjDHxpq1IA2mKj
	QMmT3FjrrCGf1hmiQYDv4/FohIY9hi1jqzXV5qSNWTOMloLUICITIewfEAgiVQFGPVwrWe6N5Bzsy
	PN4WaQTebkuPHB1NaRWd3pbEvMrr5mR9D4IifUiuF/92htZ7wUI0p8wiEMB5DNHpLxi8g1uX7YCmi
	OtD3oxAl7zvNfnbGaTq/1NMb6A21ulTlxKGnZPL7NNRitvQ8DT4IOg8AseniXtvRLSm+lIYmEiePP
	C75ley7LqjytEywyqhlZPZeRbYfXxZAaOE7q/s5c/5xh0w9vR8/GvLyUA2YsLQ8kia/kW7XJT4Hik
	y46fSMFA==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD61K-0000vi-Hc; Thu, 08 May 2025 20:30:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Correctly implemet the usb480m clock on rk3036
Date: Thu,  8 May 2025 20:30:45 +0200
Message-ID: <174672902827.1927548.11178117072822465092.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503202532.992033-1-heiko@sntech.de>
References: <20250503202532.992033-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 03 May 2025 22:25:28 +0200, Heiko Stuebner wrote:
> In the original clock driver the usb480m clock was "stubbed" as a fixed
> factor clock, but instead it actually does have a mux-bit to switch
> between the 24MHz osciallator and the actual 480MHz clock supplied
> from the usb-phy.
> 
> Both the register layout, as well as the implementation is very similar
> to the rk3128, which seems to be some sort of cousin to the rk3036.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
      commit: 6e06b641ca96c232e0b13f9b44b118742986bcd5
[2/3] clk: rockchip: rk3036: fix implementation of usb480m clock mux
      commit: 897adaf536ab01f130ce0b53a635a592733c0f24
[3/3] clk: rockchip: rk3036: mark ddrphy as critical
      commit: 596a977b34a722c00245801a5774aa79cec4e81d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
