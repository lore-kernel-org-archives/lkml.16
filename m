Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B128C87D;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353031; cv=none; b=Knt9EG+XEFYhVgJjcYYhe1qqzGkZodL4aiRQIfdx4LytAUXdCHqeJM1M2yfI8rFa7Fwxehb5UASoVIUu8GwuSEBq172E7abFoCk2chLQ5x8ICWM/J1QW01i+lbrQpGPHWdqXo5Rf6VWj10uZe3nPuAFJAWq6D/oiOvC8RMfk7II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353031; c=relaxed/simple;
	bh=8hxDZ0YSUK5GNrtuai7MmCbxc9EplTXFmwAHYdeKd2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oypZFTNjNQgqhl185anS9j3XfZfDq2Jnr+lB9Osrhvz5EOw4kM6LT6jqN2b1RbvzK6OZL2+AfYCqqwpnhPlgOZCbBe0fWbETThCLvbkXNEWkN1ubuUa6suEOWMf88WFPAvyINcRpjrlYMmScBGBVY1oWybZJNTge8XxNqs8In9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KToOsjIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KToOsjIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFD5C4CEF0;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=8hxDZ0YSUK5GNrtuai7MmCbxc9EplTXFmwAHYdeKd2E=;
	h=From:To:Cc:Subject:Date:From;
	b=KToOsjICUEUoTbUKv8eO/Zl1IVmaG/KZnNYKRiwpw2a4YFz2QenEUH2zE38mmY42E
	 DTetmPdRhFGWLKWEyl+Z/YuhhNN4YDmwfoGfOvvtwjBNMCyFTjCGyxuULi6P9iqry9
	 YJ34CU9/nNHhF3KAYtLFB2N8NafC7bsa+6hmVMf78eyIa2wSF1VKHr029LlSxH6GMJ
	 h8hBlRwdg8IdbT31lsU1xuiz1L95zSmySdV1ipqG1JJxMVtJmXEM6xHDgNKXH0hb5N
	 8Qgk3sYIfzJiP5ZH7o+rDf2W4Xhq6t++WP7P9CRU/Wpc0OtOwala9jmdmblqxZeRgK
	 xz5uWUol/cg4g==
Received: by wens.tw (Postfix, from userid 1000)
	id 72BED5FEF5; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:23 +0800
Message-Id: <20250619171025.3359384-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

There is a PPU0 reset control bit in the same register as the PPU1
reset control. This missing reset control is for the PCK-600 unit
in the SoC. Manual tests show that the reset control indeed exists,
and if not configured, the system will hang when the PCK-600
registers are accessed.

This series adds a reset entry for it at the end of the existing ones,
in both the DT binding header file and the driver.

I will take both patches through the sunxi trees since I need the
header file change for a subsequent patch series.

Please have a look.


ChenYu


Chen-Yu Tsai (2):
  dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
  clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c      | 1 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.39.5

