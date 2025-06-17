Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778272ECEA2;
	Tue, 17 Jun 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177515; cv=none; b=VqNBtULePPVSdFIKjXrHREwySu+sQ+ZY+63fItuMPXznaVHj1vdf65ZEjdLr+RBC/uaDHZU0COrRE1rXSR63caf4kciweL1MMyFre/5gi3/De7loLxvA7MW68ktOcY/fjFnG2vZlOQU+KpDAiwIN8yLzg1f26paVbPJt7bPZEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177515; c=relaxed/simple;
	bh=aW5yvpNvSkcVrVrORKxyIa2LVFmcbX7kq7M2CNVH9bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cq7KWAyw8ZNztEu+HC8oG51SeQxvLJijnFJtipZDJDnBS7Mnrgf17DC4PlUN7SbdcUijQTdMJ4vUGzFx/zxVU242zM0PAKdkdjOwtwWe13V+aZ555U1mONuYXMOMCB2J8ednaWhOXyd6Q42nuOxIJKSknm4ab0ITTzY6DwmNpC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VmOYfInl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VmOYfInl"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0A1B2258FA;
	Tue, 17 Jun 2025 18:25:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUxbmW2mupcO; Tue, 17 Jun 2025 18:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750177511; bh=aW5yvpNvSkcVrVrORKxyIa2LVFmcbX7kq7M2CNVH9bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VmOYfInlvA1Ys9OKyUHUqrupu3ZiTwputngASKRn5LDUlf7LCISFWlJwGMOtwJLzd
	 6nT2+xQap/KwYbx7DaYzObHW+aFCGHqX4+OzUxqdDZX8ebCz4eeVoXQIx8GlJaSHHs
	 5YjNmdP3h9BAr5IxARgokMbk2+pOeIHLA8Gpg9l27kNgumDlXg3HyLNpRj0QF8xidf
	 551Qv8nRm0Mibuv9GjD+EpYyyZKlQRpNwA9PdyYfBb85Bi67Q0lODysMkl8+weceUD
	 6WhGKqVBn2Dq3WuvtH0atYeu4difjSyE4SBB0PcRu+fPbytG8gK2g0knzAoWSdcrfT
	 Gaf+FWqyCBd1g==
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
Subject: [PATCH v2 2/8] clk: loongson2: Allow specifying clock flags for gate clock
Date: Tue, 17 Jun 2025 16:24:20 +0000
Message-ID: <20250617162426.12629-3-ziyao@disroot.org>
In-Reply-To: <20250617162426.12629-1-ziyao@disroot.org>
References: <20250617162426.12629-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some gate clocks need to be supplied with flags, e.g., it may be
required to specify CLK_IS_CRTICAL for CPU clocks.

Add a field to loongson2_clk_board_info for representing clock flags,
and specify it when registering gate clocks. A new helper macro,
CLK_GATE_FLAGS, is added to simplify definitions.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/clk-loongson2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 27e632edd484..cc3fb13e770f 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -50,6 +50,7 @@ struct loongson2_clk_board_info {
 	const char *name;
 	const char *parent_name;
 	unsigned long fixed_rate;
+	unsigned long flags;
 	u8 reg_offset;
 	u8 div_shift;
 	u8 div_width;
@@ -105,6 +106,18 @@ struct loongson2_clk_board_info {
 		.bit_idx	= _bidx,			\
 	}
 
+#define CLK_GATE_FLAGS(_id, _name, _pname, _offset, _bidx,	\
+		       _flags)					\
+	{							\
+		.id		= _id,				\
+		.type		= CLK_TYPE_GATE,		\
+		.name		= _name,			\
+		.parent_name	= _pname,			\
+		.reg_offset	= _offset,			\
+		.bit_idx	= _bidx,			\
+		.flags		= _flags			\
+	}
+
 #define CLK_FIXED(_id, _name, _pname, _rate)			\
 	{							\
 		.id		= _id,				\
@@ -332,7 +345,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 							  &clp->clk_lock);
 			break;
 		case CLK_TYPE_GATE:
-			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name, 0,
+			hw = devm_clk_hw_register_gate(dev, p->name, p->parent_name,
+						       p->flags,
 						       clp->base + p->reg_offset,
 						       p->bit_idx, 0,
 						       &clp->clk_lock);
-- 
2.49.0

