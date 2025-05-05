Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081C1E52D;
	Mon,  5 May 2025 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478304; cv=none; b=SLL562qE9+AWhFOeiqnF0yVwB6K5KVOEDvXyLm9H5+6kQWwoEDJirAWRHcNuVMKPM5MAapFN/5KJBV7gqD2bTmvJBzYnFFvLZiL9TQGtgqHJLjVThhx7bLekT+zknZX2oaffX0V3k3+ZJyTJHitggQ8qVpBn2QMndwvXqx/l0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478304; c=relaxed/simple;
	bh=IgTjNfi3VL3hIyePgRde0JnYRHqsl2LKqnBWsGSemao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+dH6OSiEJfVUVRteGdh5YJNpd946b8nRFtHZ9x4knNqZpjlaxsM6+17R+5RGjvGZaA12V+ltBGONs5U4XwgzwM4qPPrxDcvAJ4+jBYRTPWJRgShnfmLK6E7a/gQ8PdM0go8TCCjjG1ar5k1AgMJVVd6Eei1Co5wyfFmVmCX+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JnN3ESRP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JnN3ESRP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FVu8CAAOjGOH1bx9/sKXfRmnx7Hckvr5z5ZblQxIGao=; b=JnN3ESRPJSKijjzcvIYnDU+U0G
	fyhM3kIv5rXcDOEWBbvY4cGJy9nPTQJOoYlUx5XsU1bkdvh4KW12rO7du3DYglRPV7aofhjrGSw51
	M2OG/LUtOPMc0L2Uxuhz4JK3wIux8igRe8EHKJaubX3dga+wcSmMjkjli1sZ06GtR5F1UwzuM/9A2
	tP8ExaG/dI/JjAljgwqlWAdQAguBfD362qve2v5hZj8/OjmeRfA0wkY9kgTxa1xIdicoJWEJJx4I1
	LMgJIeux3XU0ahbTyuk+BCgDqTvtWJvmUamG2LftvgcqJYwqp7vDMRsj3Wad/Ur+eQYCpg3gX9M1Q
	Lt8GIWpA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uC2mc-0007Lg-OC; Mon, 05 May 2025 22:51:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 00/10] Add RK3576 SAI Audio Controller Support
Date: Mon,  5 May 2025 22:51:15 +0200
Message-ID: <174647826637.1329543.9602946046704845460.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 02 May 2025 13:03:06 +0200, Nicolas Frattaroli wrote:
> This series adds support for Rockchip's Serial Audio Interface (SAI)
> controller, found on SoCs such as the RK3576. The SAI is a flexible
> controller IP that allows both transmitting and receiving digital audio
> in the I2S, TDM and PCM formats. Instances of this controller are used
> both for externally exposed audio interfaces, as well as for audio on
> video interfaces such as HDMI.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: rk3576: add IOC gated clocks
        commit: 4210f21c004a18aad11c55bdaf552e649a4fd286
[02/10] clk: rockchip: introduce auxiliary GRFs
        commit: 70a114daf2077472e58b3cac23ba8998e35352f4
[03/10] clk: rockchip: introduce GRF gates
        commit: e277168cabe9fd99e647f5dad0bc846d5d6b0093
[04/10] clk: rockchip: add GATE_GRFs for SAI MCLKOUT to rk3576
        commit: 9199ec29f0977efee223791c9ee3eb402d23f8ba

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
