Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A29241671;
	Fri,  2 May 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183855; cv=pass; b=j/9bs0Xvt/jpGSVQGZAHw9c3cHcW2I4Z6xjDRiLfc1aKvilr4Am7ieP8RYbDBOaq94mk36rWNEi6FSkHaeCTYRhsw3H0uX+3fCYtVMzsgq3Az7nQTyp96//AoN7RPXn6vWAnyYNn3WOT60csbXaq18ODjigenVpbwNtuT7BFa7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183855; c=relaxed/simple;
	bh=covocJwnQFZqbKmARe2ThKXzGz71Gx5euUnynQPmpGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAy/wrPROvoW5knk9Z18kjVxD4KtYTf0Ioqb0hbGxrLurTICpty52j7TwtxPH+izJGGHLgo4npReB7G9Jfq7fE7XVjUXZk5pwG1vdNZIs6DJS91w+WDLr6rUSPKEw7bH0AXpMyH1U64C2nTefPePfiE28X7vdwyQhxMK9YGMyj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ADSMl622; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ADSMl622"
ARC-Seal: i=1; a=rsa-sha256; t=1746183822; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9cRvNOWWbwsjRHHQC6ri9QUVCLzS1wKm0NLP+H5qLDWbI737nOubjS8mX8pYJdW0HNZN4AtvxQT1ShLYi+XiPjaMHvGFkek3gDJol7hjqU+I5cszxZlRq88irIhco7cV1kUHwt7PzhOMY4/tJdmlm8xVZ9ode4PnLI8jmnkjqE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746183822; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h9PathAa56N5+F3jnoIVpOGqg0k3SkVQkPYpt0C77ZI=; 
	b=mpGWJNCULOYAxhkE8XtrwALyuN9OXoRD1G85yOlYvTzwe9H7CPRBQ3g+ABBvNDZ1i+nZcwNaONdguwKKRoJRN43HJ6Uw+m1BDBaNyXRXAbeI8KimMsYA/JiPtuTEN30RSYU7te/8pq3Yz+ZcMgcbeTOCKyxt54XucrlwmVzRuAw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746183822;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=h9PathAa56N5+F3jnoIVpOGqg0k3SkVQkPYpt0C77ZI=;
	b=ADSMl622rjPGSrjnLbbmegpF3qoBVtnc4/YV0N0SCjD3L9gJtrxP63/oWnymWyqz
	IwUylz8MhF8vG/CkDULkpsjABIgJ5CBVC1bJ5yjqpa02AJuk3F2xChba2y+aqlf88R5
	FnnstU7UiTJPJtWbercVCTBVl1tBPLEd4otDRbk0=
Received: by mx.zohomail.com with SMTPS id 1746183820774731.4843414967964;
	Fri, 2 May 2025 04:03:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 02 May 2025 13:03:09 +0200
Subject: [PATCH v3 03/10] clk: rockchip: introduce GRF gates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-rk3576-sai-v3-3-376cef19dd7c@collabora.com>
References: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
In-Reply-To: <20250502-rk3576-sai-v3-0-376cef19dd7c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

Some rockchip SoCs, namely the RK3576, have bits in a General Register
File (GRF) that act just like clock gates. The downstream vendor kernel
simply maps over the already mapped GRF range with a generic clock gate
driver. This solution isn't suitable for upstream, as a memory range
will be in use by multiple drivers at the same time, and it leaks
implementation details into the device tree.

Instead, implement this with a new clock branch type in the Rockchip
clock driver: GRF gates. Somewhat akin to MUXGRF, this clock branch
depends on the type of GRF, but functions like a gate instead.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/rockchip/Makefile   |   1 +
 drivers/clk/rockchip/clk.c      |   9 +++-
 drivers/clk/rockchip/clk.h      |  20 ++++++++
 drivers/clk/rockchip/gate-grf.c | 105 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/Makefile b/drivers/clk/rockchip/Makefile
index e8ece20aebfdeffbdc5bfffd2c6f35f2cfcf74f6..f0e0b2c6e876a84610fb3ecf33cc1935b10058d9 100644
--- a/drivers/clk/rockchip/Makefile
+++ b/drivers/clk/rockchip/Makefile
@@ -14,6 +14,7 @@ clk-rockchip-y += clk-mmc-phase.o
 clk-rockchip-y += clk-muxgrf.o
 clk-rockchip-y += clk-ddr.o
 clk-rockchip-y += gate-link.o
+clk-rockchip-y += gate-grf.o
 clk-rockchip-$(CONFIG_RESET_CONTROLLER) += softrst.o
 
 obj-$(CONFIG_CLK_PX30)          += clk-px30.o
diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 0f029106d8aaa24ced78b2ef29726aa561ef6f0d..34d96aa7cd51b8bde380b4a81ce07ffdf24b8593 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -509,7 +509,7 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 		clk = NULL;
 
 		/* for GRF-dependent branches, choose the right grf first */
-		if (list->branch_type == branch_muxgrf &&
+		if ((list->branch_type == branch_muxgrf || list->branch_type == branch_grf_gate) &&
 				list->grf_type != grf_type_sys) {
 			hash_for_each_possible(ctx->aux_grf_table, agrf, node, list->grf_type) {
 				if (agrf->type == list->grf_type) {
@@ -588,6 +588,13 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				ctx->reg_base + list->gate_offset,
 				list->gate_shift, list->gate_flags, &ctx->lock);
 			break;
+		case branch_grf_gate:
+			flags |= CLK_SET_RATE_PARENT;
+			clk = rockchip_clk_register_gate_grf(list->name,
+				list->parent_names[0], flags, grf,
+				list->gate_offset, list->gate_shift,
+				list->gate_flags);
+			break;
 		case branch_composite:
 			clk = rockchip_clk_register_branch(list->name,
 				list->parent_names, list->num_parents,
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index c136ac54e6213490a995fff553730fa63694dd8f..ebaed429a30dc2c41c866f973f8cf78b32136311 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -647,6 +647,11 @@ struct clk *rockchip_clk_register_muxgrf(const char *name,
 				int flags, struct regmap *grf, int reg,
 				int shift, int width, int mux_flags);
 
+struct clk *rockchip_clk_register_gate_grf(const char *name,
+				const char *parent_name, unsigned long flags,
+				struct regmap *regmap, unsigned int reg,
+				unsigned int shift, u8 gate_flags);
+
 #define PNAME(x) static const char *const x[] __initconst
 
 enum rockchip_clk_branch_type {
@@ -656,6 +661,7 @@ enum rockchip_clk_branch_type {
 	branch_divider,
 	branch_fraction_divider,
 	branch_gate,
+	branch_grf_gate,
 	branch_linked_gate,
 	branch_mmc,
 	branch_inverter,
@@ -985,6 +991,20 @@ struct rockchip_clk_branch {
 		.gate_flags	= gf,				\
 	}
 
+#define GATE_GRF(_id, cname, pname, f, o, b, gf, gt)		\
+	{							\
+		.id		= _id,				\
+		.branch_type	= branch_grf_gate,		\
+		.name		= cname,			\
+		.parent_names	= (const char *[]){ pname },	\
+		.num_parents	= 1,				\
+		.flags		= f,				\
+		.gate_offset	= o,				\
+		.gate_shift	= b,				\
+		.gate_flags	= gf,				\
+		.grf_type	= gt,				\
+	}
+
 #define GATE_LINK(_id, cname, pname, linkedclk, f, o, b, gf)	\
 	{							\
 		.id		= _id,				\
diff --git a/drivers/clk/rockchip/gate-grf.c b/drivers/clk/rockchip/gate-grf.c
new file mode 100644
index 0000000000000000000000000000000000000000..8122f471f39134a7298be8daf0718cfa4f8852a7
--- /dev/null
+++ b/drivers/clk/rockchip/gate-grf.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ * Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ *
+ * Certain clocks on Rockchip are "gated" behind an additional register bit
+ * write in a GRF register, such as the SAI MCLKs on RK3576. This code
+ * implements a clock driver for these types of gates, based on regmaps.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include "clk.h"
+
+struct rockchip_gate_grf {
+	struct clk_hw		hw;
+	struct regmap		*regmap;
+	unsigned int		reg;
+	unsigned int		shift;
+	u8			flags;
+};
+
+#define to_gate_grf(_hw) container_of(_hw, struct rockchip_gate_grf, hw)
+
+static int rockchip_gate_grf_enable(struct clk_hw *hw)
+{
+	struct rockchip_gate_grf *gate = to_gate_grf(hw);
+	u32 val = !(gate->flags & CLK_GATE_SET_TO_DISABLE) ? BIT(gate->shift) : 0;
+	u32 hiword = ((gate->flags & CLK_GATE_HIWORD_MASK) ? 1 : 0) << (gate->shift + 16);
+	int ret;
+
+	ret = regmap_update_bits(gate->regmap, gate->reg,
+				 hiword | BIT(gate->shift), hiword | val);
+
+	return ret;
+}
+
+static void rockchip_gate_grf_disable(struct clk_hw *hw)
+{
+	struct rockchip_gate_grf *gate = to_gate_grf(hw);
+	u32 val = !(gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : BIT(gate->shift);
+	u32 hiword = ((gate->flags & CLK_GATE_HIWORD_MASK) ? 1 : 0) << (gate->shift + 16);
+
+	regmap_update_bits(gate->regmap, gate->reg,
+			   hiword | BIT(gate->shift), hiword | val);
+}
+
+static int rockchip_gate_grf_is_enabled(struct clk_hw *hw)
+{
+	struct rockchip_gate_grf *gate = to_gate_grf(hw);
+	bool invert = !!(gate->flags & CLK_GATE_SET_TO_DISABLE);
+	int ret;
+
+	ret = regmap_test_bits(gate->regmap, gate->reg, BIT(gate->shift));
+	if (ret < 0)
+		ret = 0;
+
+	return invert ? 1 - ret : ret;
+
+}
+
+static const struct clk_ops rockchip_gate_grf_ops = {
+	.enable = rockchip_gate_grf_enable,
+	.disable = rockchip_gate_grf_disable,
+	.is_enabled = rockchip_gate_grf_is_enabled,
+};
+
+struct clk *rockchip_clk_register_gate_grf(const char *name,
+		const char *parent_name, unsigned long flags,
+		struct regmap *regmap, unsigned int reg, unsigned int shift,
+		u8 gate_flags)
+{
+	struct rockchip_gate_grf *gate;
+	struct clk_init_data init;
+	struct clk *clk;
+
+	if (IS_ERR(regmap)) {
+		pr_err("%s: regmap not available\n", __func__);
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = flags;
+	init.num_parents = parent_name ? 1 : 0;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.ops = &rockchip_gate_grf_ops;
+
+	gate->hw.init = &init;
+	gate->regmap = regmap;
+	gate->reg = reg;
+	gate->shift = shift;
+	gate->flags = gate_flags;
+
+	clk = clk_register(NULL, &gate->hw);
+	if (IS_ERR(clk))
+		kfree(gate);
+
+	return clk;
+}

-- 
2.49.0

