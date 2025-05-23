Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBF226D0A;
	Fri, 23 May 2025 10:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997226; cv=none; b=i/oCeR0QxaGi93ZOEFjX+QzJaYK0dneyTcBul+Q3UdU0lPPVQVxP7TStQoroeEKBR2y6IB6h/BJ1tTXuo15JlwF4KTXm0Ib/qlLLD1hCGdIH6kONTgXMg1MSI8SNv4E+j72JdqdTt2OMH3IWDf/TqZMOSaUangbhOmz67i0Rb/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997226; c=relaxed/simple;
	bh=UelRARJ4L5EQo961j7oIIU5hjPjnKWR1JwdiW487Osg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZpz0/Ic18AuYNEmIoIyhkUSbLdB9Dyy7F0ColVRPWuV8W3HUmwvt0jOd/YAvrFqJD3tZMeySFBlQko2rFRiPLlvLxh3iMhHEfS7Gr063tKfvDbWnceVLB3m3sErkUZd0lnpPQA//9l6IaKfmh1GRu8BeMlmOLnQW9cBrLG+yQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CD49Pr7Z; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CD49Pr7Z"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 203A0259BB;
	Fri, 23 May 2025 12:47:03 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdtLwuN3TYsn; Fri, 23 May 2025 12:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747997221; bh=UelRARJ4L5EQo961j7oIIU5hjPjnKWR1JwdiW487Osg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CD49Pr7ZCxTXKrNW7TEz5QaD9tAw6E5drLC8r9TK6pLYqcpvOLiw22agLHj5onGXW
	 iExqOboTeOu2n9w7e9Kzu/amuunt4HmGP4+JOtFslE98fxYZlgVFJ0eGzUusOivxko
	 1qAJBO1zpa/ZdIIXuUza6wkerri2akjtc2I1BtLeqEBUQPekM9feQV9X3dcRnDlWQz
	 zs9xjDPbZ7c1W7CgyGyLLkrw2oKLwixSu+cPqt1WVloUKDlFuwOjz0ONdWmpfsuM16
	 9tcg9RTG/5dztVjJuhXkqOh3XGY6WU8cJbh4P/7FP5VXS0rfXTRwhMcUo6h+hLk4kp
	 QW0UJzCVJb2Sw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/8] clk: loongson2: Support scale clocks with an alternative mode
Date: Fri, 23 May 2025 10:45:47 +0000
Message-ID: <20250523104552.32742-4-ziyao@disroot.org>
In-Reply-To: <20250523104552.32742-1-ziyao@disroot.org>
References: <20250523104552.32742-1-ziyao@disroot.org>
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

