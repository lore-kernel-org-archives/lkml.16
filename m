Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92842FF467
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470064; cv=none; b=pTkh4j1vNPJo7gLKWK0qLM2JUXZw80vObZpyzhMEfRQhtJqwjDqNeUE0fiqBQ1EoBaDN/Vt+13iuKuFBOpLKAVwOCdzn0PvUpXO3hoVrloXGSZCRTwFY2j9m1EhhQWKmkT5ak9AHL9nZn7hlpwZ3qKRdH/sHWEFbLn63jGeaF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470064; c=relaxed/simple;
	bh=ssDaR4wz9jG+IVUW3bzaW/s+xN9zK8sGhakg0LDPY+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkKzEBAhDuHGMORd16uVnLNlyA2gzFt1fGzlne1oIlUi59WQHTIXsdg1U92GgJgay6FQPWgPBSuEViQK2K49cJeHt/tIvX4puGdBCM059I24sBBaa7e3uNxik+qOuytMwaGtDK5Q8TK9amlhjAG752nPUB2PAy/OVmKKNfJHmkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jn9DVSyw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jn9DVSyw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3898075f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470057; x=1752074857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=jn9DVSywx7o50rqReqZqXdwtdYO4oyMt0i64l9L1HSg8lX2FqS5H7JC3sRa6KLhWzt
         xtdC4cc7kOxIYDA+m3mFrv+MIMsWaXW5PfOhUmUvvihnkPp5m7vO/B8ZJTXuWJLQGRI3
         yClN+AH9ad/+CZV33MpZ1ADo+XzmCKOVk8xIrVAC0LSSdiC9ItYynk/ZVmDcJuNSF4oc
         nAyuuKUBDgXlqPMRcCvnKL7UZEZq0qMgCBQ39BE3Ppi7t6kTHxnrLc1/OCoB1XgQQkOp
         mep3hUI5Zq71rEhrIb0Rw00t1ZFSV4EBZMY1lAxQao6GHf0eytXejIcDm6Bh0UFgl52e
         oy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470057; x=1752074857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZFizNzZeDwxlG4/SOUoWjAfRTsGu/AR5Ui24dmicOw=;
        b=cz+ulwCrNwA99mXPoOjKpji6/FeB3prWadp8jr/sXh4h3p9nRXd9Tn4Z2vbYK4aKDz
         hGq8vwA5UNm0P/fnc4FrxYY4jC+uyIZ948XH+d7P8t04CWjSn5H+WYOs2TpHVtLasyjy
         Hasw1KmnOXnaFzPJY3lytxFZFgi422j3oSjbVJH22yskRC/J3I7/u/La7u0sYMfP+7TN
         yI2zOsM0EF89fJan3fWRWeyYfungmgO2m9hRaT8WzZ+rb8amI3XlTTHn0zqxRuK90Q7H
         aSs6t8qv13bu2ODzbkY+OOqa0tvheXJ36CH7NcwIY3x2EvBI2gEa7WElU6fTI3rg7k3z
         TcDw==
X-Forwarded-Encrypted: i=1; AJvYcCVmqiNdPUHbep8uEg16QtMsXl56Upk6dm7KZOMsMNZKwcqviYaUjcfVbJbqRggoyIwE5xnVprel8uvWT14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU+hugI1E5HLAErq0qs8+NOsc+CvJ7tEvSXi49uEDDHJftbhxa
	iXXWi2Z0cWBBKN/HACxI8S0mUIQO/akoqto08fGTZsIZLk4ynisFkxASFXzwTx1de5c=
X-Gm-Gg: ASbGncvZ2pAAagTgLXkS9tVbH88ebNCHGKpdf/mGHozlNsUCUQzm8VZQYJc/1H9F+4Q
	y0HfxJTXahmCYA1773XS/piDA3/RzRetLav3NGJ+MzRUggnHMKiF36utrdwM5fZ5/NXVEo8W+M5
	m1x4OD20PfTiOOQ/q4DvYPFcmijMV/AxgVw2tMf3kIt4omMhjQ02S5gy3oN2wa4MwZMMrvgukXH
	UQFgktHJcRlAfPo8Nlauc/Hk7Bi+hBsgz1ekcLJJAJ+GApEslH9/ECTaAZWE5hqykCC2MpDsBrP
	Q99R3PEFl/nzX7bCbzBmmcF+lE5HcgvU3B+VMsdezOGiHcDr5CFI+YB0T+B8Vt10JeRPy+m2ge3
	T
X-Google-Smtp-Source: AGHT+IF24IwkUpTRhOzSih3Uk3Xy9Ey1JQd9FnEQ32rPMPJHNrcWp9J2a3eLo2t/S0yOg0DJBYaVKg==
X-Received: by 2002:a5d:64c4:0:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3b2018c241bmr2829917f8f.52.1751470056666;
        Wed, 02 Jul 2025 08:27:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:21 +0200
Subject: [PATCH 23/26] clk: amlogic: use the common pclk definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-23-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9875; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ssDaR4wz9jG+IVUW3bzaW/s+xN9zK8sGhakg0LDPY+Q=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/LBSs116AIECGxYGVG9zbAYzeZGrNC4zYz8
 y9OqUR0oMSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPywAKCRDm/A8cN/La
 hapdEAC0txIhiAF5JVyixaFEUIvo6bO+P+U90UBDfyetIF0ahvgGCX9D7yRl7QeavIOaoMwag4Q
 3UVKrs+4527yuN15JKV9Bdv62cRJFTP8NMDRBgPOKCk4sPTB5IlUKLQt6+OmSdJB0FeSfP5y+00
 rnU0APno9EV0jtAJx72G9wfEJfftNp6UrWDgx0Zxoa+ATLVNGENCMP2OcCuf/yh+xGcepRvOC8V
 ikEoH59ya9+veFEAOt+EnuMx6iqecfmSGl+UmNjSgrV6EHOvuYec7GyckTw549CprnUntPlp9EW
 /5zCr9ZgH7+pdNVXhULoQ3tlRhAJuHP0y6ejhABQxCP8BFOshv0YtLMdlLa9VKgYba7evpiINxt
 sPgwLPVt4fUajoqpA9z3zlUW2osawSj51HSiZ1FOjZdh/nEIJ5WtWl9KbPPY5FShMhg9vZqn7de
 6YbSJfW5hxkOReT2LJv5QR+IJmcWOu8pjkdLbjzU2qTfyKwMOYcq0tDKhltET3RBFG2YUZmGNeD
 kJ6biBSRt7ok0/WdQvn0V7g9iA+LYy6cg7qOL3jhlxjxjCkum8qnVNm+iYdIDhLLgaFXSviDXUY
 eOVqItzszrIivJ6dDfkEYcVu1wX6oFwyXwr2UZELeJluQ6FQj3YDx92/dsKJLZZNIHE5fgI9LBt
 wf8vo+kqhrOiGOQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Replace marcros defining pclks with the common one, reducing code
duplication.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c      | 35 +++++++++-----------------
 drivers/clk/meson/c3-peripherals.c | 34 +++++++-------------------
 drivers/clk/meson/g12a-aoclk.c     | 50 +++++++++++++++-----------------------
 drivers/clk/meson/gxbb-aoclk.c     | 33 +++++++++----------------
 4 files changed, 51 insertions(+), 101 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 74c2f51424f11cc04a80a3a4918e4de0a5d11d08..902fbd34039cc06d512f1237a1e5d9050fd00b4b 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -34,30 +34,19 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define AXG_AO_GATE(_name, _bit, _flags)				\
-static struct clk_regmap axg_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = (AO_RTI_GEN_CNTL_REG0),			\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name =  "axg_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data axg_ao_pclk_parents = { .fw_name = "mpeg-clk" };
 
-AXG_AO_GATE(remote,	0, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(i2c_master,	1, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(i2c_slave,	2, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(uart1,	3, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(uart2,	5, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(ir_blaster,	6, CLK_IGNORE_UNUSED);
-AXG_AO_GATE(saradc,	7, CLK_IGNORE_UNUSED);
+#define AXG_AO_GATE(_name, _bit, _flags)		       \
+	MESON_PCLK(axg_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
+		   &axg_ao_pclk_parents, _flags)
+
+static AXG_AO_GATE(remote,	0, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(i2c_master,	1, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(i2c_slave,	2, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(uart1,	3, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(uart2,	5, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(ir_blaster,	6, CLK_IGNORE_UNUSED);
+static AXG_AO_GATE(saradc,	7, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap axg_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index e9c1ef99be13d0542b8a972ceffe69c8a9977118..02c9820cd98655e57a290859b595cf09d39e5fe3 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -164,30 +164,13 @@ static struct clk_regmap c3_rtc_clk = {
 	},
 };
 
-#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)		\
-struct clk_regmap c3_##_name = {					\
-	.data = &(struct clk_regmap_gate_data){				\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = "c3_" #_name,					\
-		.ops = _ops,						\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = (_fw_name),				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data c3_sys_pclk_parents = { .fw_name = "sysclk" };
 
-#define C3_SYS_PCLK(_name, _reg, _bit, _flags)				\
-	C3_PCLK(_name, _reg, _bit, "sysclk",				\
-		&clk_regmap_gate_ops, _flags)
+#define C3_SYS_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, _flags)
 
-#define C3_SYS_PCLK_RO(_name, _reg, _bit)				\
-	C3_PCLK(_name, _reg, _bit, "sysclk",				\
-		&clk_regmap_gate_ro_ops, 0)
+#define C3_SYS_PCLK_RO(_name, _reg, _bit) \
+	MESON_PCLK_RO(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, 0)
 
 static C3_SYS_PCLK(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
 static C3_SYS_PCLK(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
@@ -290,9 +273,10 @@ static C3_SYS_PCLK(sys_vc9000e,		SYS_CLK_EN0_REG2, 2, 0);
 static C3_SYS_PCLK(sys_pwm_mn,		SYS_CLK_EN0_REG2, 3, 0);
 static C3_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG2, 4, 0);
 
-#define C3_AXI_PCLK(_name, _reg, _bit, _flags)				\
-	C3_PCLK(_name, _reg, _bit, "axiclk",				\
-		&clk_regmap_gate_ops, _flags)
+static const struct clk_parent_data c3_axi_pclk_parents = { .fw_name = "axiclk" };
+
+#define C3_AXI_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(c3_##_name, _reg, _bit, &c3_axi_pclk_parents, _flags)
 
 /*
  * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 45e4df393feb6f916b6e035ad71e379e6e30ee99..96981da271fa1453ebbe433e36cff4409661fa6a 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -37,22 +37,10 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define G12A_AO_PCLK(_name, _reg, _bit, _flags)				\
-static struct clk_regmap g12a_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name =  "g12a_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data g12a_ao_pclk_parents = { .fw_name = "mpeg-clk" };
+
+#define G12A_AO_PCLK(_name, _reg, _bit, _flags) \
+	MESON_PCLK(g12a_ao_##_name, _reg, _bit, &g12a_ao_pclk_parents, _flags)
 
 /*
  * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
@@ -63,22 +51,22 @@ static struct clk_regmap g12a_ao_##_name = {				\
  *  - add a comment explaining why the use of CLK_IGNORE_UNUSED is desirable
  *    for a particular clock.
  */
-G12A_AO_PCLK(ahb,	AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ir_in,	AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(i2c_m0,	AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(i2c_s0,	AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(uart,	AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(prod_i2c,	AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(uart2,	AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ir_out,	AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(saradc,	AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ahb,	AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ir_in,	AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(i2c_m0,	AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(i2c_s0,	AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(uart,	AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(prod_i2c,	AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(uart2,	AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ir_out,	AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(saradc,	AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
 
-G12A_AO_PCLK(mailbox,	AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m3,	AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(ahb_sram,	AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(rti,	AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m4_fclk,	AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
-G12A_AO_PCLK(m4_hclk,	AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(mailbox,	AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m3,		AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(ahb_sram,	AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(rti,	AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m4_fclk,	AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
+static G12A_AO_PCLK(m4_hclk,	AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap g12a_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 2bf45fd7fe4ba0783e736fbbb126209870985b22..c7dfb3a06cb5f70c98f65bb91b937e1b870b34fe 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -23,29 +23,18 @@
 #define AO_RTC_ALT_CLK_CNTL0	0x94
 #define AO_RTC_ALT_CLK_CNTL1	0x98
 
-#define GXBB_AO_PCLK(_name, _bit, _flags)					\
-static struct clk_regmap gxbb_ao_##_name = {				\
-	.data = &(struct clk_regmap_gate_data) {			\
-		.offset = AO_RTI_GEN_CNTL_REG0,				\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = "gxbb_ao_" #_name,				\
-		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "mpeg-clk",				\
-		},							\
-		.num_parents = 1,					\
-		.flags = (_flags),					\
-	},								\
-}
+static const struct clk_parent_data gxbb_ao_pclk_parents = { .fw_name = "mpeg-clk" };
 
-GXBB_AO_PCLK(remote,		0, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(i2c_master,	1, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(i2c_slave,		2, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(uart1,		3, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(uart2,		5, CLK_IGNORE_UNUSED);
-GXBB_AO_PCLK(ir_blaster,	6, CLK_IGNORE_UNUSED);
+#define GXBB_AO_PCLK(_name, _bit, _flags)			\
+	MESON_PCLK(gxbb_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
+		   &gxbb_ao_pclk_parents, _flags)
+
+static GXBB_AO_PCLK(remote,	0, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(i2c_master,	1, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(i2c_slave,	2, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(uart1,	3, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(uart2,	5, CLK_IGNORE_UNUSED);
+static GXBB_AO_PCLK(ir_blaster,	6, CLK_IGNORE_UNUSED);
 
 static struct clk_regmap gxbb_ao_cts_oscin = {
 	.data = &(struct clk_regmap_gate_data){

-- 
2.47.2

