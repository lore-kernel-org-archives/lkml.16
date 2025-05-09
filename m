Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282D276032;
	Fri,  9 May 2025 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777002; cv=none; b=YspvDw1KMcWQynaoQZ+GHwieFjGzaGrBwsR+2V1VYJ9AwwsDFUxcjNCZ4eJ5SJ8yLu3LEiNM4+xn3dN+04VlHkQqjsfn9zJEZaB8X7BjDLY9aUCXP6EVIb3gUeWyZHo7njvxW6pILhwb5vDDGD05pVy1w2RuWnaYNYkd1rUU8cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777002; c=relaxed/simple;
	bh=FUHr1fNZGlyvZ80U9qySC2Y/AXiAhJTOGPsiaT0YTcY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdYT7xSWNchFxysSu5jLsz/bOVQeg0y6aKAOvTtjLnIemoaTHXCI1HcKKIu9mTGtUQ3vCjrDLgmYbC+5cpq9X9EbTv+WVCCIjN+mtqW5Q22NK8zB4CIuJNVBZNdn1jzxj1E6v0+DKbVtyuCRjOlbNNG/k1TkZmo1L8JSQocc5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 9 May 2025
 15:49:56 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
Date: Fri, 9 May 2025 07:48:23 +0000
Message-ID: <20250509074825.1933254-6-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250509074825.1933254-1-jian.hu@amlogic.com>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
is an SCMI clock. It belongs to another clock controller, and the parent
configuration is different from  that of MESON_PCLK. This avoids new macro
definition in the peripheral clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54e..61b8fc2d875f 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -134,4 +134,28 @@ struct clk_regmap _name = {						\
 
 #define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
+#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)		\
+struct clk_regmap _name = {						\
+	.data = &(struct clk_regmap_gate_data){				\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = _ops,						\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = #_pname,				\
+		},							\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+	},								\
+}
+
+#define MESON_PCLK_V2(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+
+#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
 #endif /* __CLK_REGMAP_H */
-- 
2.47.1

