Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1BE25F78C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091843; cv=none; b=H7lhFIwzCzWx5/rdvkQ8+CDx340Zi3gpynj7Q5aR+WCvq7m9mecSSlzuoh2nYKAQglLwITc1oxqI4zN22raQo+fjC5ksIZat2EJmWfWVCsj2mNIAy+wVjNuaXuE7VYayGhQ/QhAvOg7BCM8jvNSKl466Jlat0u+e37x+4/cCJjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091843; c=relaxed/simple;
	bh=8doy6BPiTFR/YKQpo3lR/yUwQX15c/frOMlav3ozNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdqmsNihdLMGg/q9hdTXdKmWEMH6DD3lYSPmvRBU+rPPnjFB5HDNYAcALW4noXyq0ljNqC+qpr7AcZxOVy+N7EGWzPwKrDjB2kAVGK/VWsGj545XpuU2gC+mXiA0bJ3N+mpV509jdQz5Hy0cRzHQMZiruj/gtWlJkOBCsdoaPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5rDNOzu; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5rDNOzu"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3014ae35534so4233551a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=Z5rDNOzuBQvyuDNrKy2P269s0ejKtK6vbzQo/y23vsVY9AKPkpowPYhA5tFknWCqAY
         B7sIQZbDXW05/zjt4SfDYqDz1DliHNyGLxRkqzUYO2EXT2DHol2D4VRapZR1bP2cTDne
         p2MydcPR29d1bIxXN1VKP+QVnfX6iuFhiwcQRDU9HGImPXbSMJPU8b/Ps8V7U7IafxCf
         B2DsQWdMj54gu7EKUVF+FxdAwOGYzsjPEVNVfQtiMf9cuaVNeQhEdEiBEd5u+9/IIVDu
         caPXVsvTU9x5gFQ/tRuIoQpLZIeKmG9SFRvxS4U53laRJmLiGpq3lMNg6oVJ+u7Xyb3k
         T5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=Fqa1Vzr59NXTSxDvfNGxxRF/bfOp9LJOoKxDxvAe+0aZIvKhywHo/nCCTDYVqO1/Eu
         JDuq0l84ibEJjud9QoNubsir9+4Lr2r1U1FTwA5Rr7Ez3xzDU75Rc4BDgF8+Wnho7gp3
         LRZGwRafufdjM60qWlSWRFffKGhTvMqXcTtSKsoJ7DbOUJV9aMZ4ThWJHURdY2gVqwuJ
         NFyVwkzTbVZsVv6QyD4ViPLwF3zZxk+b4x22WDg2O/AxB9eUvuLH0C3xGpw7nbZ8FLM7
         6wndMT9MbfCtFlm+7jezTwBS2eAwIwjV/9F7TmmXVPTALA1XLSEnTfLVbyy9kAimn9H2
         IXIA==
X-Forwarded-Encrypted: i=1; AJvYcCXIRjRpAQd9kATxpaX0N8eCYHNMgLu/ZIOM8kzyyF4CcjVgFbcXmHMioeIqClmXVx/R6EfEQJtj1kmHbis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++vaT7+hpFBG+kt0jX/cAiCir8CO00izfYwuAH5r47KfQmU7W
	FJwxLAMtWwBMfUy2n/UhHAPIFEsOjJPZeRL40J6Tl+4yzrHpZPsxSMjuVDsRW1g=
X-Gm-Gg: ASbGncvbHwWfzVhb2irPgs/SsPOXNCL62DZxJyAJqZBnNdD/wfnIl3LIAhPNrX2bOYk
	r+qmreWJIPrCPaGv7wfvMhtne0l3x3uF5pI1dIDh/vD5eG0BRPF7fblAOjY5Mi+ssO3tjRpcgkR
	HAVOWHCCCwaNDUiE0uPYikyiUzHoHKPgrLOX1U50aW8l4SNCMq2/MibeHeZEre1f1kTiU96PO07
	BWXi7xGQ5QEy4cl87/wspZVWiwKQfgjyprlAmt6sOTfgayxawYxs8tFEK5qTlkchWXsTParK/ca
	/T3OLR0AJWQrepsU4PZnvHGwDbHJqvJfYzrBgoxn8Wx3yQ==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
