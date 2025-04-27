Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B112356B1;
	Sun, 27 Apr 2025 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734951; cv=none; b=Pi3UyCmV2Vx5ACSYuZ24arZmssG4PY4u1svmOLuevfrL/k5AIfMLNTL9VMI3iiuarmljaj7MWk8Bj1e5+QtRBUMRdK4u1kfc7DxqfsfWAFJeWV4Ri6uadnvv13uNZQHDVgETBm2UBoFGRA0Xkop/6pT15g2H5Cm6Ky9OWl0q+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734951; c=relaxed/simple;
	bh=itdZrROFNx35soGWq/pj0GL9QSGP3At6MZSrFX7eNFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lZKxwqEfS1Ooh5mvaVBA5zx/rOl+QEtL0A/UFO2b6V02lJ7vNda/IKXI0Di/M3HB4P5gZhPFWUlXweckxAr6HhjzVSg8+/kcw0rXCjv23eGK14jt75g6zrifnMzgj8i0ygUQxj1jnsD1vlzbhF85NIWBnnWGelw5bPZM/Qz0DCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF02C4CEE3;
	Sun, 27 Apr 2025 06:22:31 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B822D5F71D;
	Sun, 27 Apr 2025 14:22:28 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174573494872.940990.8317443409308272836.b4-ty@csie.org>
Date: Sun, 27 Apr 2025 14:22:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 04 Apr 2025 13:56:56 +0200, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.
> 
> No dependencies, can be picked by individual maintainers.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to clk-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[4/5] clk: sunxi-ng: Do not enable by default during compile testing
      commit: 115bd1f1ec2b6b7f925752a85dd43e9909757f9a
[5/5] clk: sunxi: Do not enable by default during compile testing
      commit: f06a610cb17468a3098be1e401c4b29623b99d0a

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

