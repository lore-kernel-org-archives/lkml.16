Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD752139C4;
	Wed, 16 Apr 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811683; cv=none; b=Eqix2OJXubiN/ScEt0/1QhBS5B6QPo4IAQDnVogekV3fp9JBn2bc74i+YvhXfNcQKyIUGrbb7q1Wde/yu3RaJVd0lVpbP0Z2It8BWJMOJYEzpajXVlOAnZ8VkExKWSyUc3sJK77RQl6+oXl3KJu9XvXSN0Kb0McQDPN3B4wyRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811683; c=relaxed/simple;
	bh=0TfnuVk3JuNdSQRmPF3HgxD+Ku/B4FyBYJxSffFdeEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZO3gQWuvZ0HdDfA37AsEBGDNM8O/QgeI4M35bPz2FlE9ZE94D4OQBncK34IMFSMy81rbOh655hIidMGemoqBHAbQ37Cs9fHm4wrYfAe/UhsdYiD6eisbsEnJ2tN1W++yB6vfe9kasdepiJ9S8XI+ASjsP/LkBuILUK1uV0iYR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=y8v12LoF; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=PGDPcXwq; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="y8v12LoF";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="PGDPcXwq"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 4E17D12FB451;
	Wed, 16 Apr 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811681; bh=0TfnuVk3JuNdSQRmPF3HgxD+Ku/B4FyBYJxSffFdeEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y8v12LoFkJ6OWeVxlzD6jlGrpjI0n4dP9xxbFoikVZLY+VK/QP14ZHMyY4eTco3HD
	 jTeMcqmI9wUjk4bQ6AoJAz+8woLMCDFZOmR1zNX/qQwFvDq0bw78WgfWwE7EIBJ6qE
	 lG+jq9y5jJ2nh9ujqwKx3zS6D/TO2QL1QcbdKQuA+rs4h+OyRvPaQMbNyWmdT8kyl0
	 Qzi9D+RhYzUZmWWOYjxxCgaZtRs2vF2t1ptrupzSbg+lOoj+9KDeBcpisYg4Bn5IvE
	 FA8zS4c6Ug+Z2DsBcTockIz57FKGGqBnz8JhCNYOLBZfqDEZcHwT3IVAueulOwD09+
	 1aCqyU7VCTwmg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4MgbncuCctj; Wed, 16 Apr 2025 06:54:39 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.80.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id B3AFA12FB435;
	Wed, 16 Apr 2025 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811679; bh=0TfnuVk3JuNdSQRmPF3HgxD+Ku/B4FyBYJxSffFdeEg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGDPcXwqBuVtWpWOn/qAj0fyGN8YgXTVL3k8LP7Yi+tIOUdmS2hG+sZItP2mx3BM9
	 e7Wa/6dThFtMcImxoe/ImX2yWPq4oMBZGUw7O8gk0/LIQdGpHObP22ZqBni9/5U5cZ
	 hURMAeLW5rGdzveBTv0XOse+4lWWEiDK/unbnIUEPYrY7boFUpNxdbaYFO7emjzeq/
	 5xSZPXGANeVaUxMMDnqEDmiMjhG9VJ/2jIxfjo0CoT7I7siIhB35Zvzn1IUuFC49fc
	 q5Rt/AXP8pEuUPnLbEBaHd/D6YErA8myJwTlQmjmtWOIL1DcSlmEh5BXzR0pBx0lmH
	 +qT0jqo+Sc+tg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v8 4/6] clk: spacemit: k1: Add TWSI8 bus and function clocks
Date: Wed, 16 Apr 2025 13:54:04 +0000
Message-ID: <20250416135406.16284-5-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
selection bits, reset assertion bit and enable bits for function and bus
clocks. It has a quirk that reading always results in zero.

As a workaround, let's hardcode the mux value as zero to select
pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
is combined from the real bus and function clocks to avoid the
write-only register being shared between two clk_hws, in which case
updates of one clk_hw zero the other's bits.

With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
controller could be brought up, which is essential for boards attaching
power-management chips to it.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 8a0dd8146dbd..cdde37a05235 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -328,6 +328,12 @@ CCU_MUX_GATE_DEFINE(twsi4_clk, twsi_parents, APBC_TWSI4_CLK_RST, 4, 3, BIT(1), 0
 CCU_MUX_GATE_DEFINE(twsi5_clk, twsi_parents, APBC_TWSI5_CLK_RST, 4, 3, BIT(1), 0);
 CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1), 0);
 CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1), 0);
+/*
+ * APBC_TWSI8_CLK_RST has a quirk that reading always results in zero.
+ * Combine functional and bus bits together as a gate to avoid sharing the
+ * write-only register between different clock hardwares.
+ */
+CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST, BIT(1) | BIT(0), 0);
 
 static const struct clk_parent_data timer_parents[] = {
 	CCU_PARENT_HW(pll1_d192_12p8),
@@ -412,6 +418,8 @@ CCU_GATE_DEFINE(twsi4_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI4_CLK_RST, BIT(0
 CCU_GATE_DEFINE(twsi5_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI5_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST, BIT(0), 0);
+/* Placeholder to workaround quirk of the register */
+CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
 
 CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(timers2_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS2_CLK_RST, BIT(0), 0);
@@ -896,6 +904,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TWSI5]		= &twsi5_clk.common.hw,
 	[CLK_TWSI6]		= &twsi6_clk.common.hw,
 	[CLK_TWSI7]		= &twsi7_clk.common.hw,
+	[CLK_TWSI8]		= &twsi8_clk.common.hw,
 	[CLK_TIMERS1]		= &timers1_clk.common.hw,
 	[CLK_TIMERS2]		= &timers2_clk.common.hw,
 	[CLK_AIB]		= &aib_clk.common.hw,
@@ -947,6 +956,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
 	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
 	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
+	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
 	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
 	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
 	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,
-- 
2.49.0

