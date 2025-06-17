Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603472F9484;
	Tue, 17 Jun 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177558; cv=none; b=itvaviJCcDzMylGr2jWaJ/9OHU7nNH0mQYHflmlrWchtkWSAdY3sOAC4P1Wnn9feRzMc/km6uoK2A5w4CKbfQZ5mDYY7n3v386WEjG+eiRXEfKVdUs89U5wCsly6IujeVtNnobbkVx4m3Dz48+u5JG16Pa6IGaq4W0/4kx3dCV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177558; c=relaxed/simple;
	bh=UelRARJ4L5EQo961j7oIIU5hjPjnKWR1JwdiW487Osg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHcrClBUda4EoAN6qIAxIe9yWB175+G+bjE9E6A3/+G/+HRiu2izZcU/vFcpRrYU5grXjfQx2aPDWRS2QtjLmCKd9616d69xImcg3+GVHVpX4K1bAGeQP2GuvpjDXXYRD94hMxB4XSzD9mVRgjvzzTMhGcxEQx4i3fVREj1MjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IX9D2c+8; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IX9D2c+8"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D013125C75;
	Tue, 17 Jun 2025 18:25:55 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbyVTrkJiCPk; Tue, 17 Jun 2025 18:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177554; bh=UelRARJ4L5EQo961j7oIIU5hjPjnKWR1JwdiW487Osg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IX9D2c+8JDAc2C4muJAewfDy3vqSzWa96Zga3OOIqdLGQKgcgiqAe8WLi3yQsN62V
	 HaghMZXr/jZbJfwf2vYa1FReI6lXla3bLnh6IP/H+KMby1Dcs+NifvGIVBi55ERy2L
	 QDk8nm+et2vRuJJLsea1FwLI0QL7jFHTJony4eo6wjckQp9Q/YikGOKRNcybjPMjx7
	 Ty7Yp/CG6RJFdnkHPTURT3FIBpiXxSRMDuCkyVHScgIXM6phtwAbnAJNS2FEqRcht4
	 YyRk1KNEVe5hm63SHAoe1ndhs24awjtD5l7jpphzKlVJnlO3/BuCzmin+E3jCkpcJr
	 8ou8Vn0G/LG7A==
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
Subject: [PATCH v2 3/8] clk: loongson2: Support scale clocks with an alternative mode
Date: Tue, 17 Jun 2025 16:24:21 +0000
Message-ID: <20250617162426.12629-4-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Loongson 2K0300 and 2K1500 ship scale clocks with an alternative mode.
There's one mode bit in clock configuration register indicating the
operation mode.

When mode bit is unset, the scale clock acts the same as previous
generation of scale clocks. When it's set, a different equation for
calculating result frequency, Fout = Fin / (scale + 1), is used.

This patch adds frequency calculation support for the scale clock
variant. A helper macro, CLK_SCALE_MODE, is added to simplify
definitions.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index cc3fb13e770f..bba97270376c 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -42,6 +42,7 @@ struct loongson2_clk_data {
 	u8 div_width;
 	u8 mult_shift;
 	u8 mult_width;
+	u8 bit_idx;
 };
 
 struct loongson2_clk_board_info {
@@ -96,6 +97,19 @@ struct loongson2_clk_board_info {
 		.div_width	= _dwidth,			\
 	}
 
+#define CLK_SCALE_MODE(_id, _name, _pname, _offset,		\
+		  _dshift, _dwidth, _midx)			\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_SCALE,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.div_shift	= _dshift,			\
+		.div_width	= _dwidth,			\
+		.bit_idx	= _midx + 1,			\
+	}
+
 #define CLK_GATE(_id, _name, _pname, _offset, _bidx)		\
 	{							\
 		.id		= _id,				\
@@ -243,13 +257,18 @@ static const struct clk_ops loongson2_pll_recalc_ops = {
 static unsigned long loongson2_freqscale_recalc_rate(struct clk_hw *hw,
 						     unsigned long parent_rate)
 {
-	u64 val, mult;
+	u64 val, scale;
+	u32 mode = 0;
 	struct loongson2_clk_data *clk = to_loongson2_clk(hw);
 
 	val  = readq(clk->reg);
-	mult = loongson2_rate_part(val, clk->div_shift, clk->div_width) + 1;
+	scale = loongson2_rate_part(val, clk->div_shift, clk->div_width) + 1;
+
+	if (clk->bit_idx)
+		mode = val & BIT(clk->bit_idx - 1);
 
-	return div_u64((u64)parent_rate * mult, 8);
+	return mode == 0 ? div_u64((u64)parent_rate * scale, 8) :
+			   div_u64((u64)parent_rate, scale);
 }
 
 static const struct clk_ops loongson2_freqscale_recalc_ops = {
@@ -284,6 +303,7 @@ static struct clk_hw *loongson2_clk_register(struct loongson2_clk_provider *clp,
 	clk->div_width	= cld->div_width;
 	clk->mult_shift	= cld->mult_shift;
 	clk->mult_width	= cld->mult_width;
+	clk->bit_idx	= cld->bit_idx;
 	clk->hw.init	= &init;
 
 	hw = &clk->hw;
-- 
2.49.0

