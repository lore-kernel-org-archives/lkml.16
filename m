Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1F253B71;
	Mon, 23 Jun 2025 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683439; cv=none; b=ZtF1+3KRRvFcU6/Ie7n3AFeLsG/pVg/SeIkrqMNCZOFcXPdDS4AOKIizzkhe6e2ugUQtfiX88hMdyPw/WzZ0+Kpd5fM1mJTPXn0rYNMkn0C1NcMWm4bqPeRHahUD+AwwFbgjz2yN+TiuBQeAYA5AcfR/zTzTrhHv48pESPXpkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683439; c=relaxed/simple;
	bh=EBH4dzV8nz2vAJt0ZF+dvJ35dmpskLhXzVZFwIge6PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9I7A084tz3OeDj4GSzPzujK7gqnnBuTUW/Bzv9HQjuS5AZP4SbqMam6rQD3MStvMQhvz5wN6e29i5kQ5BkkZ2wFnU8q5JmzCNOvvE+fDK3cU2afZj1j1WqGXZ3BZV3B8mmj97iyfuzJ39kEV81T+AobR/OyNQ6BbRL5j8tbzOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0HMbv30; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0HMbv30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFFAC4CEF0;
	Mon, 23 Jun 2025 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683439;
	bh=EBH4dzV8nz2vAJt0ZF+dvJ35dmpskLhXzVZFwIge6PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0HMbv30bAifkjQCDB+FedGI22m5DimtiAjSr+AeOFi0zwK0q9sYQUGdXQ+AILfWZ
	 NHgQzgyCpyilxiJdQ1FShPQobdXrKqJwHOjBaSfLpB5s0QdNv/BfIzVbi2ZExsY7lt
	 No7CvwtePWzcK3u+MLyAsvRUS6om50nDFYtqy6cAsd55fV3ZXniwz5vG4l0eEpSGc1
	 6Dk/VxITolD1ObayMh5KAY/OsyIDXmokM7Oi1yfOmOLJ7BDU3r1RqptTdj/hy3nbu3
	 JETQx+/lgbTe9Zw7MNYp7VNUFKBsWEC3DnQ2ywL/fQbzw9yOcWnJeAQ6Y0qycRmdZO
	 jtEx/sKYAkQEg==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/9] clk: divider, gate: create regmap-backed copies of gate and divider clocks
Date: Mon, 23 Jun 2025 13:56:22 +0100
Message-ID: <20250623-spleen-rambling-8bd898f2788e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22733; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6K4iy7GXKBlrb9HwCicSnDWt+XpYXCWJDy7A8bSesQ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfh9LZ929e/R68IuFX6omd5W7C767EKZVwhr2ofveZ mbX/ZPWd5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAixTaMDC0tZy7ucotNfzrt Hp9S6LnM+65XrIsO3v07Qzg7OO5D1ydGhr++3TGdp9uOxFf/Paj7Qmj2jdWiW01ynVY1H14u+df wIh8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Implement regmap-backed copies of gate and divider clocks by replacing
the iomem pointer to the clock registers with a regmap and offset
within.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/Kconfig              |   8 +
 drivers/clk/Makefile             |   2 +
 drivers/clk/clk-divider-regmap.c | 271 +++++++++++++++++++++++++++++++
 drivers/clk/clk-gate-regmap.c    | 254 +++++++++++++++++++++++++++++
 include/linux/clk-provider.h     | 120 ++++++++++++++
 5 files changed, 655 insertions(+)
 create mode 100644 drivers/clk/clk-divider-regmap.c
 create mode 100644 drivers/clk/clk-gate-regmap.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 19c1ed280fd7f..273154031325e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -33,6 +33,14 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_DIVIDER_REGMAP
+	bool
+	select REGMAP
+
+config COMMON_CLK_GATE_REGMAP
+	bool
+	select REGMAP
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 42867cd37c33d..6dbc1fe1e03e2 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -20,11 +20,13 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
+obj-$(CONFIG_COMMON_CLK_DIVIDER_REGMAP)	+= clk-divider-regmap.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-rate.o
 obj-$(CONFIG_CLK_FIXED_RATE_KUNIT_TEST)	+= clk-fixed-rate-test.o
 clk-fixed-rate-test-y		:= clk-fixed-rate_test.o kunit_clk_fixed_rate_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-gate.o
+obj-$(CONFIG_COMMON_CLK_GATE_REGMAP)	+= clk-gate-regmap.o
 obj-$(CONFIG_CLK_GATE_KUNIT_TEST) += clk-gate_test.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-multiplier.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-mux.o
diff --git a/drivers/clk/clk-divider-regmap.c b/drivers/clk/clk-divider-regmap.c
new file mode 100644
index 0000000000000..43b8f3dedb9e1
--- /dev/null
+++ b/drivers/clk/clk-divider-regmap.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+
+static inline u32 clk_div_regmap_readl(struct clk_divider_regmap *divider)
+{
+	u32 val;
+
+	regmap_read(divider->regmap, divider->map_offset, &val);
+
+	return val;
+}
+
+static inline void clk_div_regmap_writel(struct clk_divider_regmap *divider, u32 val)
+{
+	regmap_write(divider->regmap, divider->map_offset, val);
+
+}
+
+static unsigned long clk_divider_regmap_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct clk_divider_regmap *divider = to_clk_divider_regmap(hw);
+	unsigned int val;
+
+	val = clk_div_regmap_readl(divider) >> divider->shift;
+	val &= clk_div_mask(divider->width);
+
+	return divider_recalc_rate(hw, parent_rate, val, divider->table,
+				   divider->flags, divider->width);
+}
+
+static long clk_divider_regmap_round_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long *prate)
+{
+	struct clk_divider_regmap *divider = to_clk_divider_regmap(hw);
+
+	/* if read only, just return current value */
+	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
+		u32 val;
+
+		val = clk_div_regmap_readl(divider) >> divider->shift;
+		val &= clk_div_mask(divider->width);
+
+		return divider_ro_round_rate(hw, rate, prate, divider->table,
+					     divider->width, divider->flags,
+					     val);
+	}
+
+	return divider_round_rate(hw, rate, prate, divider->table,
+				  divider->width, divider->flags);
+}
+
+static int clk_divider_regmap_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct clk_divider_regmap *divider = to_clk_divider_regmap(hw);
+
+	/* if read only, just return current value */
+	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
+		u32 val;
+
+		val = clk_div_regmap_readl(divider) >> divider->shift;
+		val &= clk_div_mask(divider->width);
+
+		return divider_ro_determine_rate(hw, req, divider->table,
+						 divider->width,
+						 divider->flags, val);
+	}
+
+	return divider_determine_rate(hw, req, divider->table, divider->width,
+				      divider->flags);
+}
+
+static int clk_divider_regmap_set_rate(struct clk_hw *hw, unsigned long rate,
+				unsigned long parent_rate)
+{
+	struct clk_divider_regmap *divider = to_clk_divider_regmap(hw);
+	int value;
+	unsigned long flags = 0;
+	u32 val;
+
+	value = divider_get_val(rate, parent_rate, divider->table,
+				divider->width, divider->flags);
+	if (value < 0)
+		return value;
+
+	if (divider->lock)
+		spin_lock_irqsave(divider->lock, flags);
+	else
+		__acquire(divider->lock);
+
+	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
+		val = clk_div_mask(divider->width) << (divider->shift + 16);
+	} else {
+		val = clk_div_regmap_readl(divider);
+		val &= ~(clk_div_mask(divider->width) << divider->shift);
+	}
+	val |= (u32)value << divider->shift;
+	clk_div_regmap_writel(divider, val);
+
+	if (divider->lock)
+		spin_unlock_irqrestore(divider->lock, flags);
+	else
+		__release(divider->lock);
+
+	return 0;
+}
+
+const struct clk_ops clk_divider_regmap_ops = {
+	.recalc_rate = clk_divider_regmap_recalc_rate,
+	.round_rate = clk_divider_regmap_round_rate,
+	.determine_rate = clk_divider_regmap_determine_rate,
+	.set_rate = clk_divider_regmap_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_divider_regmap_ops);
+
+const struct clk_ops clk_divider_regmap_ro_ops = {
+	.recalc_rate = clk_divider_regmap_recalc_rate,
+	.round_rate = clk_divider_regmap_round_rate,
+	.determine_rate = clk_divider_regmap_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_divider_regmap_ro_ops);
+
+struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock)
+{
+	struct clk_divider_regmap *div;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret;
+
+	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
+		if (width + shift > 16) {
+			pr_warn("divider value exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the divider */
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	if (clk_divider_flags & CLK_DIVIDER_READ_ONLY)
+		init.ops = &clk_divider_regmap_ro_ops;
+	else
+		init.ops = &clk_divider_regmap_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_divider assignments */
+	div->regmap = regmap;
+	div->map_offset = map_offset;
+	div->shift = shift;
+	div->width = width;
+	div->flags = clk_divider_flags;
+	div->lock = lock;
+	div->hw.init = &init;
+	div->table = table;
+
+	/* register the clock */
+	hw = &div->hw;
+	ret = clk_hw_register(dev, hw);
+	if (ret) {
+		kfree(div);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_divider_regmap);
+
+struct clk *clk_register_divider_regmap_table(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw =  __clk_hw_register_divider_regmap(dev, NULL, name, parent_name, NULL,
+					       NULL, flags, regmap, map_offset,
+					       shift, width, clk_divider_flags,
+					       table, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_divider_regmap_table);
+
+void clk_unregister_divider_regmap(struct clk *clk)
+{
+	struct clk_divider_regmap *div;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	div = to_clk_divider_regmap(hw);
+
+	clk_unregister(clk);
+	kfree(div);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_divider_regmap);
+
+/**
+ * clk_hw_unregister_divider_regmap - unregister a clk divider
+ * @hw: hardware-specific clock data to unregister
+ */
+void clk_hw_unregister_divider_regmap(struct clk_hw *hw)
+{
+	struct clk_divider_regmap *div;
+
+	div = to_clk_divider_regmap(hw);
+
+	clk_hw_unregister(hw);
+	kfree(div);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_divider_regmap);
+
+static void devm_clk_hw_release_divider_regmap(struct device *dev, void *res)
+{
+	clk_hw_unregister_divider_regmap(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_divider_regmap, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_divider_regmap(dev, np, name, parent_name, parent_hw,
+					      parent_data, flags, regmap, map_offset,
+					      shift, width, clk_divider_flags, table,
+					      lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_divider_regmap);
diff --git a/drivers/clk/clk-gate-regmap.c b/drivers/clk/clk-gate-regmap.c
new file mode 100644
index 0000000000000..05d61c1c3c3df
--- /dev/null
+++ b/drivers/clk/clk-gate-regmap.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+/**
+ * DOC: basic gatable clock which can gate and ungate its output
+ *
+ * Traits of this clock:
+ * prepare - clk_(un)prepare only ensures parent is (un)prepared
+ * enable - clk_enable and clk_disable are functional & control gating
+ * rate - inherits rate from parent.  No clk_set_rate support
+ * parent - fixed parent.  No clk_set_parent support
+ */
+
+static inline u32 clk_gate_regmap_readl(struct clk_gate_regmap *gate)
+{
+	u32 val;
+
+	regmap_read(gate->map, gate->map_offset, &val);
+
+	return val;
+}
+
+static inline void clk_gate_regmap_writel(struct clk_gate_regmap *gate, u32 val)
+{
+	regmap_write(gate->map, gate->map_offset, val);
+
+}
+
+/*
+ * It works on following logic:
+ *
+ * For enabling clock, enable = 1
+ *	set2dis = 1	-> clear bit	-> set = 0
+ *	set2dis = 0	-> set bit	-> set = 1
+ *
+ * For disabling clock, enable = 0
+ *	set2dis = 1	-> set bit	-> set = 1
+ *	set2dis = 0	-> clear bit	-> set = 0
+ *
+ * So, result is always: enable xor set2dis.
+ */
+static void clk_gate_regmap_endisable(struct clk_hw *hw, int enable)
+{
+	struct clk_gate_regmap *gate = to_clk_gate_regmap(hw);
+	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
+	unsigned long flags;
+	u32 reg;
+
+	set ^= enable;
+
+	if (gate->lock)
+		spin_lock_irqsave(gate->lock, flags);
+	else
+		__acquire(gate->lock);
+
+	if (gate->flags & CLK_GATE_HIWORD_MASK) {
+		reg = BIT(gate->bit_idx + 16);
+		if (set)
+			reg |= BIT(gate->bit_idx);
+	} else {
+		reg = clk_gate_regmap_readl(gate);
+
+		if (set)
+			reg |= BIT(gate->bit_idx);
+		else
+			reg &= ~BIT(gate->bit_idx);
+	}
+
+	clk_gate_regmap_writel(gate, reg);
+
+	if (gate->lock)
+		spin_unlock_irqrestore(gate->lock, flags);
+	else
+		__release(gate->lock);
+}
+
+static int clk_gate_regmap_enable(struct clk_hw *hw)
+{
+	clk_gate_regmap_endisable(hw, 1);
+
+	return 0;
+}
+
+static void clk_gate_regmap_disable(struct clk_hw *hw)
+{
+	clk_gate_regmap_endisable(hw, 0);
+}
+
+int clk_gate_regmap_is_enabled(struct clk_hw *hw)
+{
+	u32 reg;
+	struct clk_gate_regmap *gate = to_clk_gate_regmap(hw);
+
+	reg = clk_gate_regmap_readl(gate);
+
+	/* if a set bit disables this clk, flip it before masking */
+	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
+		reg ^= BIT(gate->bit_idx);
+
+	reg &= BIT(gate->bit_idx);
+
+	return reg ? 1 : 0;
+}
+EXPORT_SYMBOL_GPL(clk_gate_regmap_is_enabled);
+
+const struct clk_ops clk_gate_regmap_ops = {
+	.enable = clk_gate_regmap_enable,
+	.disable = clk_gate_regmap_disable,
+	.is_enabled = clk_gate_regmap_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_gate_regmap_ops);
+
+struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		struct regmap *map, u8 map_offset, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_gate_regmap *gate;
+	struct clk_hw *hw;
+	struct clk_init_data init = {};
+	int ret = -EINVAL;
+
+	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
+		if (bit_idx > 15) {
+			pr_err("gate bit exceeds LOWORD field\n");
+			return ERR_PTR(-EINVAL);
+		}
+	}
+
+	/* allocate the gate */
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_gate_regmap_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.parent_hws = parent_hw ? &parent_hw : NULL;
+	init.parent_data = parent_data;
+	if (parent_name || parent_hw || parent_data)
+		init.num_parents = 1;
+	else
+		init.num_parents = 0;
+
+	/* struct clk_gate_regmap assignments */
+	gate->map = map;
+	gate->map_offset = map_offset;
+	gate->bit_idx = bit_idx;
+	gate->flags = clk_gate_flags;
+	gate->lock = lock;
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	if (dev || !np)
+		ret = clk_hw_register(dev, hw);
+	else if (np)
+		ret = of_clk_hw_register(np, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+
+}
+EXPORT_SYMBOL_GPL(__clk_hw_register_gate_regmap);
+
+struct clk *clk_register_gate_regmap(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags, struct regmap *map,
+		u8 map_offset, u8 bit_idx, u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_hw *hw;
+
+	hw = __clk_hw_register_gate_regmap(dev, NULL, name, parent_name, NULL,
+					   NULL, flags, map, map_offset, bit_idx,
+					   clk_gate_flags, lock);
+	if (IS_ERR(hw))
+		return ERR_CAST(hw);
+	return hw->clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_gate_regmap);
+
+void clk_unregister_gate_regmap(struct clk *clk)
+{
+	struct clk_gate_regmap *gate;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	gate = to_clk_gate_regmap(hw);
+
+	clk_unregister(clk);
+	kfree(gate);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_gate_regmap);
+
+void clk_hw_unregister_gate_regmap(struct clk_hw *hw)
+{
+	struct clk_gate_regmap *gate;
+
+	gate = to_clk_gate_regmap(hw);
+
+	clk_hw_unregister(hw);
+	kfree(gate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_unregister_gate_regmap);
+
+static void devm_clk_hw_release_gate_regmap(struct device *dev, void *res)
+{
+	clk_hw_unregister_gate_regmap(*(struct clk_hw **)res);
+}
+
+struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags, struct regmap *map,
+		u8 map_offset, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock)
+{
+	struct clk_hw **ptr, *hw;
+
+	ptr = devres_alloc(devm_clk_hw_release_gate_regmap, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	hw = __clk_hw_register_gate_regmap(dev, np, name, parent_name, parent_hw,
+					   parent_data, flags, map, map_offset,
+					   bit_idx, clk_gate_flags, lock);
+
+	if (!IS_ERR(hw)) {
+		*ptr = hw;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return hw;
+}
+EXPORT_SYMBOL_GPL(__devm_clk_hw_register_gate_regmap);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b74934..6f5cf6670b48d 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -8,6 +8,7 @@
 
 #include <linux/of.h>
 #include <linux/of_clk.h>
+#include <linux/regmap.h>
 
 /*
  * flags used across common struct clk.  these flags should only affect the
@@ -526,6 +527,7 @@ void of_fixed_clk_setup(struct device_node *np);
 struct clk_gate {
 	struct clk_hw hw;
 	void __iomem	*reg;
+	u8		map_offset;
 	u8		bit_idx;
 	u8		flags;
 	spinlock_t	*lock;
@@ -538,6 +540,37 @@ struct clk_gate {
 #define CLK_GATE_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_gate_ops;
+
+#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
+/**
+ * struct clk_gate_regmap - gating clock via regmap
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @map:	regmap controlling gate
+ * @map_offset:	register offset within the regmap controlling gate
+ * @bit_idx:	single bit controlling gate
+ * @flags:	hardware-specific flags
+ * @lock:	register lock
+ *
+ * Clock which can gate its output.  Implements .enable & .disable
+ *
+ * Flags:
+ * See clk_gate
+ */
+struct clk_gate_regmap {
+	struct clk_hw hw;
+	struct regmap	*map;
+	u8		map_offset;
+	u8		bit_idx;
+	u8		flags;
+	spinlock_t	*lock;
+};
+
+#define to_clk_gate_regmap(_hw) container_of(_hw, struct clk_gate_regmap, hw)
+
+extern const struct clk_ops clk_gate_regmap_ops;
+#endif
+
 struct clk_hw *__clk_hw_register_gate(struct device *dev,
 		struct device_node *np, const char *name,
 		const char *parent_name, const struct clk_hw *parent_hw,
@@ -663,6 +696,31 @@ void clk_unregister_gate(struct clk *clk);
 void clk_hw_unregister_gate(struct clk_hw *hw);
 int clk_gate_is_enabled(struct clk_hw *hw);
 
+#ifdef CONFIG_COMMON_CLK_GATE_REGMAP
+struct clk_hw *__clk_hw_register_gate_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		struct regmap *map, u8 map_offset, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+struct clk_hw *__devm_clk_hw_register_gate_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data,
+		unsigned long flags,
+		struct regmap *map, u8 map_offset, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+struct clk *clk_register_gate_regmap(struct device *dev, const char *name,
+		const char *parent_name, unsigned long flags,
+		struct regmap *map, u8 map_offset, u8 bit_idx,
+		u8 clk_gate_flags, spinlock_t *lock);
+
+void clk_unregister_gate_regmap(struct clk *clk);
+void clk_hw_unregister_gate_regmap(struct clk_hw *hw);
+int clk_gate_regmap_is_enabled(struct clk_hw *hw);
+#endif
+
 struct clk_div_table {
 	unsigned int	val;
 	unsigned int	div;
@@ -736,6 +794,41 @@ struct clk_divider {
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
 
+#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
+/**
+ * struct clk_divider_regmap - adjustable divider clock via regmap
+ *
+ * @hw:		handle between common and hardware-specific interfaces
+ * @map:	regmap containing the divider
+ * @map_offset:	register offset within the regmap containing the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ * @lock:	register lock
+ *
+ * Clock with an adjustable divider affecting its output frequency.  Implements
+ * .recalc_rate, .set_rate and .round_rate
+ *
+ * @flags:
+ * See clk_divider
+ */
+struct clk_divider_regmap {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	u8		map_offset;
+	u8		shift;
+	u8		width;
+	u8		flags;
+	const struct clk_div_table	*table;
+	spinlock_t	*lock;
+};
+
+#define to_clk_divider_regmap(_hw) container_of(_hw, struct clk_divider_regmap, hw)
+
+extern const struct clk_ops clk_divider_regmap_ops;
+extern const struct clk_ops clk_divider_regmap_ro_ops;
+#endif
+
 unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
 		unsigned int val, const struct clk_div_table *table,
 		unsigned long flags, unsigned long width);
@@ -972,6 +1065,33 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 void clk_unregister_divider(struct clk *clk);
 void clk_hw_unregister_divider(struct clk_hw *hw);
 
+#ifdef CONFIG_COMMON_CLK_DIVIDER_REGMAP
+struct clk_hw *__clk_hw_register_divider_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock);
+
+struct clk_hw *__devm_clk_hw_register_divider_regmap(struct device *dev,
+		struct device_node *np, const char *name,
+		const char *parent_name, const struct clk_hw *parent_hw,
+		const struct clk_parent_data *parent_data, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock);
+
+struct clk *clk_register_divider_regmap_table(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		struct regmap *regmap, u8 map_offset, u8 shift, u8 width,
+		u8 clk_divider_flags, const struct clk_div_table *table,
+		spinlock_t *lock);
+
+void clk_unregister_divider_regmap(struct clk *clk);
+void clk_hw_unregister_divider_regmap(struct clk_hw *hw);
+#endif
+
 /**
  * struct clk_mux - multiplexer clock
  *
-- 
2.45.2

