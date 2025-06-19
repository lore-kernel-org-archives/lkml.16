Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AAAF9DA;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353031; cv=none; b=qTY9CXBwd4khoWUlvGNFLhU9MI9RX6edNnTRl0mi7V1RJIOkBc+oNUMCvvUSlQ3x970U7l9FjAsCxeiJ7OqFz+HSQ3TbGAoZbBgz/q1C4myxVdewcO0uXQMxvA6f+8GLm+powvDPWqRu5ggLDKyhL0ZDjk2c+kaMnJq/iG85Fy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353031; c=relaxed/simple;
	bh=1tM7lfGa2OX6upFSfSRNAvjF/6bzMIakzUVOukjfgp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cbOJFkCD6p1W2OmwKAh4T/wuRjkdwlMHa7fePfeJw3Cc41kwyNSptgfD69u3Fjnf0GaddxuZHhj8TeFIzjehcQr63CEAawSN5W5f9mbduHvgVyj/TuY6DvGq1woupzsPPdjroDrjpP3QLRhc0pqqSfrEvJGbj+KquPVmYAOgzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjyYMQ1B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjyYMQ1B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CBEC4CEEA;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=1tM7lfGa2OX6upFSfSRNAvjF/6bzMIakzUVOukjfgp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KjyYMQ1Be302kdviESang5cJb1yKX07PYqBpvNGpMtyiRA+F0DJVli2y2lUvUL1AJ
	 mg1uRLdqOSv9XpfshipGT4rCfCIKKYzL5EeAy5sB2WqeCHajR7KY+xtU6tmoZ+vW96
	 l6SqVsGDPti766CEhXkzPt9+f53H8EO2xWk0gElBGHTa/K8wY3JUSwWtrdDFhcqpLv
	 3vuwVXSG3MdhQR6VEWPLVTdi0+e2UMRP0rEoGoohU9MNWoZYoOI1U0bcGdP5u2G5Vs
	 YKvPjFQ50jcrAx1nwNOx5O1K5nTZ6HbDrfWpOtJimUAxZz592GYBq/rgRC8hnhCNUJ
	 ZerjfQ2poc2xg==
Received: by wens.tw (Postfix, from userid 1000)
	id 8E4075FF4F; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
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
Subject: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:25 +0800
Message-Id: <20250619171025.3359384-3-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
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
and if not configured, the system will hang when the PCK-600 registers
are accessed.

Add a reset entry for it at the end of the existing ones.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index b5464d8083c8..70ce0ca0cb7d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -204,6 +204,7 @@ static struct ccu_reset_map sun55i_a523_r_ccu_resets[] = {
 	[RST_BUS_R_IR_RX]	= { 0x1cc, BIT(16) },
 	[RST_BUS_R_RTC]		= { 0x20c, BIT(16) },
 	[RST_BUS_R_CPUCFG]	= { 0x22c, BIT(16) },
+	[RST_BUS_R_PPU0]	= { 0x1ac, BIT(16) },
 };
 
 static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc = {
-- 
2.39.5

