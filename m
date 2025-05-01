Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D8A34545;
	Thu,  1 May 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746101217; cv=none; b=Cs2GhqjN6aEtgwxuNWtmsABdthdTyUy4Bd1UmJ+JTAXoWvLvuFv7/CL7l87WEVLzB3WrbpZK62D3v4AWG9vNUQ0nSnOYZxtwKGSeQ2NjKle1OAjg4Rz+XBWWbW4ENCneS/2xJBK8916x5k8S1Wg/u2wxc0n2kET8y9Y5ggAo5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746101217; c=relaxed/simple;
	bh=uBtS6QK15OEKP+SzxR9LZEbF075qtLuvzQ1wAFAppWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nEh/bQa0TsuL7UAGw3PdMb5SgzEDvEqatqHWbnni3cVhThhC/xxlhpfiXXiyZCt2Z87+S8WE+0cOCzBRw5mMHlzrIOjJYYY7ZchrEe11ptvblD72a3xHFR8gYKG10azVDdZY+iXNFuIHFDgq3pHErZAKEBPy5s9mh53iY9kV/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3B71D14;
	Thu,  1 May 2025 05:06:46 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4690A3F673;
	Thu,  1 May 2025 05:06:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
Date: Thu,  1 May 2025 13:06:31 +0100
Message-Id: <20250501120631.837186-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The D1/R528/T113 SoCs have a hidden divider of 2 in the MMC mod clocks,
just as other recent SoCs. So far we did not describe that, which led
to the resulting MMC clock rate to be only half of its intended value.

Use a macro that allows to describe a fixed post-divider, to compensate
for that divisor.

This brings the MMC performance on those SoCs to its expected level,
so about 23 MB/s for SD cards, instead of the 11 MB/s measured so far.

Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
Reported-by: Kuba Szczodrzyński <kuba@szczodrzynski.pl>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this v2 does away with the extra patch to introduce a generic wrapper,
instead just introduce its own special wrapper just for the MMC clocks.
Rebased on top of v6.15.
Tested on an T113-s3 board and shown to double SD card read performance.

Cheers,
Andre

Changelog v1 .. v2:
- rebased on v6.15-rc1
- drop extra wrapper patch (somewhat obsoleted by A523 clock changes)
- add specific wrapper for just those clocks (postdiv + parent_data)

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 44 ++++++++++++++++------------
 drivers/clk/sunxi-ng/ccu_mp.h        | 22 ++++++++++++++
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
index bb66c906ebbb6..e83d4fd40240f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
@@ -412,19 +412,23 @@ static const struct clk_parent_data mmc0_mmc1_parents[] = {
 	{ .hw = &pll_periph0_2x_clk.common.hw },
 	{ .hw = &pll_audio1_div2_clk.common.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc0_mmc1_parents, 0x830,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
-
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc0_mmc1_parents, 0x834,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_POSTDIV(mmc0_clk, "mmc0",
+					       mmc0_mmc1_parents, 0x830,
+					       0, 4,		/* M */
+					       8, 2,		/* P */
+					       24, 3,		/* mux */
+					       BIT(31),		/* gate */
+					       2,		/* post-div */
+					       0);
+
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_POSTDIV(mmc1_clk, "mmc1",
+					       mmc0_mmc1_parents, 0x834,
+					       0, 4,		/* M */
+					       8, 2,		/* P */
+					       24, 3,		/* mux */
+					       BIT(31),		/* gate */
+					       2,		/* post-div */
+					       0);
 
 static const struct clk_parent_data mmc2_parents[] = {
 	{ .fw_name = "hosc" },
@@ -433,12 +437,14 @@ static const struct clk_parent_data mmc2_parents[] = {
 	{ .hw = &pll_periph0_800M_clk.common.hw },
 	{ .hw = &pll_audio1_div2_clk.common.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc2_parents, 0x838,
-				       0, 4,	/* M */
-				       8, 2,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_POSTDIV(mmc2_clk, "mmc2", mmc2_parents,
+					       0x838,
+					       0, 4,		/* M */
+					       8, 2,		/* P */
+					       24, 3,		/* mux */
+					       BIT(31),		/* gate */
+					       2,		/* post-div */
+					       0);
 
 static SUNXI_CCU_GATE_HWS(bus_mmc0_clk, "bus-mmc0", psi_ahb_hws,
 			  0x84c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index 8fc7fdb7ef494..90cf876855eea 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -52,6 +52,28 @@ struct ccu_mp {
 		}							\
 	}
 
+#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE_POSTDIV(_struct, _name, _parents, \
+						_reg,			\
+						_mshift, _mwidth,	\
+						_pshift, _pwidth,	\
+						_muxshift, _muxwidth,	\
+						_gate, _postdiv, _flags)\
+	struct ccu_mp _struct = {					\
+		.enable	= _gate,					\
+		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
+		.p	= _SUNXI_CCU_DIV(_pshift, _pwidth),		\
+		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.fixed_post_div	= _postdiv,				\
+		.common	= {						\
+			.reg		= _reg,				\
+			.features	= CCU_FEATURE_FIXED_POSTDIV,	\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
+							_parents,	\
+							&ccu_mp_ops,	\
+							_flags),	\
+		}							\
+	}
+
 #define SUNXI_CCU_MP_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
 				   _mshift, _mwidth,			\
 				   _pshift, _pwidth,			\
-- 
2.25.1

