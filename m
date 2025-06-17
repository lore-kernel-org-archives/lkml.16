Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D722EE287;
	Tue, 17 Jun 2025 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177564; cv=none; b=ot/cVbF8AqaPQ0HyZY06PW1B7ocKtGqSvHKbuL7NORbQPzY6VEn2FY2BpIdA/3LXCWRUqJMNsQFrAvypI+d3W4KQ56wsCty09VZJGYZZmXjNYeOi2ix675ijO24sB7LW2hi2ohCevPsq6zqFI1acSivY2dFy3KBVUFZ4JxJ2jiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177564; c=relaxed/simple;
	bh=hVpvRGbKFKtFx1BRcVBUOZPuHWI/E7Qle7Kn2K+uayU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9yao3NXxXnqqys3+s/RC8tEavsvvXyn9gqXOwQOK44eqQCGiWEFriiY3zmuLiMEH4alONpzJtIXHxTQOPhRXLO34ovPiCY0CXT/qbRa99+vAhhKjf1NPwqXWU3klId4wPPKaYizd5VRLZm746V5446/knJlDNDhdfrArlJm+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XQaWgLdg; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XQaWgLdg"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3E47425CE1;
	Tue, 17 Jun 2025 18:26:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6U7ouOmMD5_m; Tue, 17 Jun 2025 18:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177560; bh=hVpvRGbKFKtFx1BRcVBUOZPuHWI/E7Qle7Kn2K+uayU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XQaWgLdgMX6bWjB9ziBBD1yJ0zBnIbfl7hw/2+XwS7fpl6En3RrW1/rd+Sm3tnllb
	 uhdsNIByUGzPJpaynwq0+94VcbZAyT2Xnh24kdApGFRh/IFJklCisnumA0NHDp6gUh
	 sJPrEilrSEzjCz/ZoCH1Jpg9VRY+D1lQ2+MpsHzO+pjuZWfL92B/s1R4ZpR0J9bl9g
	 HDC2JOL0HJQLBEecaUETuNAQSn1Qf2q7S9ED2P2J69tEVly1EN/PdjtIcGz2BjKxVE
	 Ehh/dmx0KA5WmvRsfLG/FWLLKaKr01VhxbO8rDnhyf0eM9L1P17Uurv70ubc3mdWxb
	 KdLhJf89s0NvA==
From: Yao Zi <ziyao@disroot.org>
To: Yinbo Zhu <zhuyinbo@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 4/8] clk: loongson2: Allow zero divisors for dividers
Date: Tue, 17 Jun 2025 16:24:22 +0000
Message-ID: <20250617162426.12629-5-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson 2K0300 and 2K0500 ship divider clocks which allows zero
divisors, in which case the divider acts the same as one is specified.

Let's pass CLK_DIVIDER_ALLOW_ZERO when registering divider clocks to
prepare for future introduction of these clocks.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index bba97270376c..7a916c7d2718 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -361,7 +361,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  p->parent_name, 0,
 							  clp->base + p->reg_offset,
 							  p->div_shift, p->div_width,
-							  CLK_DIVIDER_ONE_BASED,
+							  CLK_DIVIDER_ONE_BASED |
+							  CLK_DIVIDER_ALLOW_ZERO,
 							  &clp->clk_lock);
 			break;
 		case CLK_TYPE_GATE:
-- 
2.49.0

