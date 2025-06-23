Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D82566
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696671; cv=none; b=NzgqpGJc5qQxwbKyNWz4ghk7X0wN9qOWGhmFU4/z0jb5XsRC/W+4G/m/uHr91tddXiVU92hvCKmtC/4ZhQlVep6uc+Y+iowhpu9i2IhgPegfBsiRnqbx67BZeEGEZ/IB895TT8jiZy7jzItlJUSHMJYEvM9DMiW+zJ9ZtecHxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696671; c=relaxed/simple;
	bh=haY78uNrJ4Ey96lQHgkTqTLRLQNigrpN7McUZ9yvUI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtkdT9AwRROVuYAWrrjn9Zb0wVinzE4KofwOCJ59qjIlp929nD8CZYq2FZgVZy+jHAikO1/fof1TBnpFZ2sU5fss4QTqmHnBP+iHjtNfBuWIXVRdhVFkou0no0r4qc7JbEzC/DwtiMPyMSOm4U7ebeVsxA5LKWuzYsRoqg1r3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bmjU6Epn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bmjU6Epn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so30646485e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750696667; x=1751301467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=;
        b=bmjU6EpnpHTn7GJgSq4SllHwSblvLgHVFRmyMAO3CajQlpwhRvs8omFbNLlBRQU2Qj
         4xxktHb7N5P8To3kDpKu0nLBbngmQxHf0xJgJIzw/RrFUdAjmu/e2yh8MfMHkwFKXkn9
         zpAmP8CwVspKdAuANWDKFIp4tifYyDsiRjnayv68a7WT+T2SwIlPmaErITXC/KdZVq0B
         K8YQ1woDl4LinPgldy5T/SqkzKKjHNn4t1yl+fEaJZyBEuETDehYa+mlPbAZltUWHtYM
         Znxn66xYXSz0Skk56nad1wcKBfZSbmJm9Vhz9j+7ubIInyNe6SOX7lO1vXHJ/V44/54r
         fThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696667; x=1751301467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwWclVah/YRkPJaFZHhqL/2zz+tz0AvliH2xKO7SDhw=;
        b=m3VW2ptoVP52ZxBxOgh/nUDtNFpZPunK6AAh3n+4xt0oyHAqPPnEtIFxzodFnf18nH
         xw/6ifpFeyYeNoym56a6XmqeGjItyB4rmqtU295bvPCjimzd5Z6981JI8+xxg812y5uD
         smzG4BNv5ZitWT1v38qCW1Po9BRjTo6NgPHpU7m4d6soxAHFXp21v5zt4lxDNHESldh3
         2eyo0w2yK0qEl18P1ykJHTVjANpoRwoLi24RGfU2ckaumzSqJpug6woOxetr3XQV37lQ
         MIF51eNerg7adLccMr7V52rCC3T2ko7qCbewmjmsLRTlZoagheHqoT/xME5LyvAM0ZAC
         bHSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkkyuWxk8e8SaVc3LOx3VmY5jl3gFiCtd5RaSclabUbyZBXgXOSdVnuGUfTmLBkyzaiZwSVstra8b4UAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUWxVRMXgAsFPe0HJm7v6afcn1tBbKOQonSgN0Q2u04PfC6bP
	SuWCnkkLkBteE+eRgpxdmCDgDlz0RJJ9/IxeZN6C94OvsLQeVj/ZOyrre1woJGW9iYs=
X-Gm-Gg: ASbGncv+RMdtmJ0jwBHC71TUkDJDnV2zrMafq61DF6CDSL7TybdNdKylZQ8XUW8Ko5b
	zGs8S4dFQ7Byy+vnufLIqV/3JiuqrL/Ryk/4QhCM3o6LndIAKeevp3C+vK/wyOPHFDscbUL3bCN
	TXrmgW3gM6CVBssFGToY+BszHFxsBuyId0sv94WnhDTRX2gKR34l9lVGKvP3VpZzylV4nJ1jyCq
	v7Z4/PE79Zh/YUgBsEiqIrW1ylgnPViogJj+ptd6M2HbLUKV73UYGKgf4RS7WIUscw7xQGMTTi/
	CRLQLkGhi3fzaG24rSNlHbCnPa3w/8Z+1thZSfwYygihWNn0j2WwePBeM9kL7VZc+tUnjwwqV+l
	k
X-Google-Smtp-Source: AGHT+IGAt5JaqbdFh4BbIml93Yq1HshC6NamUyp60cmO4+k32Myv7A2N/ioGnh73m5I74idOIRyUww==
X-Received: by 2002:a05:600c:3acd:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-453654ce6famr106759915e9.23.1750696667135;
        Mon, 23 Jun 2025 09:37:47 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:7b0f:c522:cad6:acd1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1011fsm9852947f8f.7.2025.06.23.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:37:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 23 Jun 2025 18:37:37 +0200
Subject: [PATCH v4 1/3] clk: amlogic: get regmap with clk_regmap_init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-1-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12558; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=haY78uNrJ4Ey96lQHgkTqTLRLQNigrpN7McUZ9yvUI8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoWYLWTStrX8Vq0C/y4WEwnMx+xzJ5bfzACITN4
 BpgCtCZtEyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaFmC1gAKCRDm/A8cN/La
 hTlQD/9zJ+YCaovCXEkERY3jqQOHRcOj8CZlJLBlVLIMWBuSEZohaMnVLPoZO/6z+2YfLIaIMGd
 +Slj2ZL3/PSgkq5dUXXBmEkFpFG4FP1/XvYK+CE2TrYI7nQbQRPND/SIbI+zCEr/1JxxGkglv6L
 S5wXeLXASQdpxjV/09qhNtiEhwEZQdfdzzpGcMCCecaoQNYFapZpvOlmHzTltU2RcmPxatiAuCB
 4mSVE4wXTI0B3O1OkxIqt/1NOjvaPPtV1QT1zL8O3Lu58EMNmdtV1D0wlkt7sxPCl0T/fTf+5Am
 iGiVSXm3LgRtlOR01wIbpiG+Xz0D18nAffHOEFB/DJ7buW4CUvzmVstx5cGPa6Y3bpgG1M4kv3i
 xl7RyF/M/w0j/PY57U5TLBaESDb7pd/aSZwpb0wxEFSrZjYYxQ3RtYZnaCLym6CpQu8T0h09ljv
 efHN7BczdaHu4JdnZrCCOZHlYPXImTtaiOqcKzhJKH9mEYAc8EOqSLpO/wmptMEkLetONiIZcW2
 74W6m6/dPSNoX0SpLE/TA0b7BRxPx2F372y54B+s6y1Vx5kpwinZx5XLNuzY1+IN/FYCGNuLtPK
 Cf+HyrKUDt4Zt1evjChZobTrXcZ6w6DsLdroTSpTtT8NxVk2S6nvSB251E311mQN0ocd1SHUNhT
 jJmsJleg1esgoRg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add clk_regmap_init() and use it with all clock types which derive from
clk_regmap. This helps initialise clk_regmap clocks without requiring
tables to keep track of the clock using this type.

The way it is done couples clk_regmap with the controllers, which is not
ideal. This is a temporary solution to get rid of the tables. The situation
will eventually be improved.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig          |  1 +
 drivers/clk/meson/clk-cpu-dyndiv.c |  1 +
 drivers/clk/meson/clk-dualdiv.c    |  2 ++
 drivers/clk/meson/clk-mpll.c       |  6 +++++
 drivers/clk/meson/clk-phase.c      | 11 +++++++++
 drivers/clk/meson/clk-pll.c        |  7 ++++++
 drivers/clk/meson/clk-regmap.c     | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clk-regmap.h     |  4 ++++
 drivers/clk/meson/sclk-div.c       |  5 ++++
 drivers/clk/meson/vclk.c           |  2 ++
 drivers/clk/meson/vid-pll-div.c    |  1 +
 11 files changed, 89 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 5c669b2e2f268c7608c8d9c64bba3c5b54da39b2..7197d23543b8bb8a9020cde316170b50bc359a6c 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -5,6 +5,7 @@ menu "Clock support for Amlogic platforms"
 config COMMON_CLK_MESON_REGMAP
 	tristate
 	select REGMAP
+	select MFD_SYSCON
 
 config COMMON_CLK_MESON_DUALDIV
 	tristate
diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index cb043b52b65d8a6ae0933935f07fb14c40855700..83aedbfd2891d1099d4fb5e25d2306a8328f29db 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -61,6 +61,7 @@ static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
 };
 
 const struct clk_ops meson_clk_cpu_dyndiv_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_clk_cpu_dyndiv_recalc_rate,
 	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index c896cf29b318ca3debf7447a9c44be01523abe47..787df6cdf841641982f20eed7dd276669e7b7b6e 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -126,6 +126,7 @@ static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops meson_clk_dualdiv_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
@@ -133,6 +134,7 @@ const struct clk_ops meson_clk_dualdiv_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_dualdiv_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, "CLK_MESON");
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index ee91e32b4050bf40cf6f19c8152ae11c2ab4ec11..7f8dada66e16fd33cb5d0e628577c39fba5e4e25 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -128,6 +128,11 @@ static int mpll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	if (mpll->init_count)
 		regmap_multi_reg_write(clk->map, mpll->init_regs,
@@ -151,6 +156,7 @@ static int mpll_init(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= mpll_recalc_rate,
 	.determine_rate	= mpll_determine_rate,
 };
diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index 7012111206107a25ca77a5c51cb5b19d9755f3c1..58dd982e6878afd481cdf6634f70a69d5d2b5e5b 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -58,6 +58,7 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
 }
 
 const struct clk_ops meson_clk_phase_ops = {
+	.init		= clk_regmap_init,
 	.get_phase	= meson_clk_phase_get_phase,
 	.set_phase	= meson_clk_phase_set_phase,
 };
@@ -83,6 +84,11 @@ static int meson_clk_triphase_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase 0 and sync it to phase 1 and 2 */
 	val = meson_parm_read(clk->map, &tph->ph0);
@@ -142,6 +148,11 @@ static int meson_sclk_ws_inv_sync(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/* Get phase and sync the inverted value to ws */
 	val = meson_parm_read(clk->map, &tph->ph);
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index e8e53855b00a81bc8eaa4213173948c964debc8a..1ea6579a760f35fd669b5e7260df8edfa083bf29 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -311,6 +311,11 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	/*
 	 * Keep the clock running, which was already initialized and enabled
@@ -468,6 +473,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
  * the other ops except set_rate since the rate is fixed.
  */
 const struct clk_ops meson_clk_pcie_pll_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.determine_rate	= meson_clk_pll_determine_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
@@ -488,6 +494,7 @@ const struct clk_ops meson_clk_pll_ops = {
 EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_pll_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index f3e504f6757152868e60d5a9fac5c5e5bf3e2e56..1ed56fe63caedc16a332b28f211d8b0a7663aaa5 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -4,9 +4,52 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
+#include <linux/mfd/syscon.h>
 #include "clk-regmap.h"
 
+int clk_regmap_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct device_node *np, *parent_np;
+	struct device *dev;
+
+	/* Allow regmap to be preset as it was historically done */
+	if (clk->map)
+		return 0;
+
+	/*
+	 * FIXME: what follows couples the controller implementation
+	 * and clk_regmap clock type. This situation is not desirable
+	 * but temporary, until the controller is able to register
+	 * a hook to initialize a clock type
+	 */
+
+	/* Check the usual dev enabled controller with an basic IO regmap */
+	dev = clk_hw_get_dev(hw);
+	if (dev) {
+		clk->map = dev_get_regmap(dev, NULL);
+		if (clk->map)
+			return 0;
+	}
+
+	/* Move on to early and syscon based controllers */
+	np = clk_hw_get_of_node(hw);
+	if (np) {
+		parent_np = of_get_parent(np);
+		clk->map = syscon_node_to_regmap(parent_np);
+		of_node_put(parent_np);
+
+		if (!IS_ERR_OR_NULL(clk->map))
+			return 0;
+	}
+
+	/* Bail out if regmap can't be found */
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(clk_regmap_init, "CLK_MESON");
+
 static int clk_regmap_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
@@ -45,6 +88,7 @@ static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops clk_regmap_gate_ops = {
+	.init		= clk_regmap_init,
 	.enable = clk_regmap_gate_enable,
 	.disable = clk_regmap_gate_disable,
 	.is_enabled = clk_regmap_gate_is_enabled,
@@ -52,6 +96,7 @@ const struct clk_ops clk_regmap_gate_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_gate_ro_ops = {
+	.init		= clk_regmap_init,
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, "CLK_MESON");
@@ -121,6 +166,7 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
 /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
 
 const struct clk_ops clk_regmap_divider_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
@@ -128,6 +174,7 @@ const struct clk_ops clk_regmap_divider_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 };
@@ -170,6 +217,7 @@ static int clk_regmap_mux_determine_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops clk_regmap_mux_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 	.set_parent = clk_regmap_mux_set_parent,
 	.determine_rate = clk_regmap_mux_determine_rate,
@@ -177,6 +225,7 @@ const struct clk_ops clk_regmap_mux_ops = {
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_mux_ro_ops = {
+	.init		= clk_regmap_init,
 	.get_parent = clk_regmap_mux_get_parent,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, "CLK_MESON");
diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54ece08098293b1a831c803415db814..f8cac2df5755b0f894570305604485f54c17ea49 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -7,6 +7,7 @@
 #ifndef __CLK_REGMAP_H
 #define __CLK_REGMAP_H
 
+#include <linux/device.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
@@ -31,6 +32,9 @@ static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
 	return container_of(hw, struct clk_regmap, hw);
 }
 
+/* clk_regmap init op to get and cache regmap from the controllers */
+int clk_regmap_init(struct clk_hw *hw);
+
 /**
  * struct clk_regmap_gate_data - regmap backed gate specific data
  *
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index 9c4945234f2682ea4c4e9c2fc2158fe37dc46f74..4ba3d82810e8f2f456c349b3e56e6b48e1c7290b 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -222,6 +222,11 @@ static int sclk_div_init(struct clk_hw *hw)
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
 	unsigned int val;
+	int ret;
+
+	ret = clk_regmap_init(hw);
+	if (ret)
+		return ret;
 
 	val = meson_parm_read(clk->map, &sclk->div);
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
index 6a167ebdc8d74b9e5371100c6461ae395b7cc8af..009bd11930427f1f6465bf70acc35cd7de68d358 100644
--- a/drivers/clk/meson/vclk.c
+++ b/drivers/clk/meson/vclk.c
@@ -45,6 +45,7 @@ static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_gate_ops = {
+	.init = clk_regmap_init,
 	.enable = meson_vclk_gate_enable,
 	.disable = meson_vclk_gate_disable,
 	.is_enabled = meson_vclk_gate_is_enabled,
@@ -127,6 +128,7 @@ static int meson_vclk_div_is_enabled(struct clk_hw *hw)
 }
 
 const struct clk_ops meson_vclk_div_ops = {
+	.init = clk_regmap_init,
 	.recalc_rate = meson_vclk_div_recalc_rate,
 	.determine_rate = meson_vclk_div_determine_rate,
 	.set_rate = meson_vclk_div_set_rate,
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 965ed7281f57edf3c5d550dfdbe0c61b016e4684..2a3cdbe6d86a828a31724c49c59e300ec5b1fa54 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -90,6 +90,7 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 }
 
 const struct clk_ops meson_vid_pll_div_ro_ops = {
+	.init		= clk_regmap_init,
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
 EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, "CLK_MESON");

-- 
2.47.2

