Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE52FF466
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470065; cv=none; b=GXreLnOCBx77iFof4ZDElsUivHJEmp5+UQ9Z6KmOChUUAwoU+koNfpaaSyC89vIX0i5FOeXk5FExPT2fkuPuViCETeIJ/YZSUybcdntguF4BYjwZ093ZFQTk3YT46CncgkhuFBO5AhK4efVTMS+IIALJPM9+IV6E6rcQJ8X8VSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470065; c=relaxed/simple;
	bh=UjktwdRyVGsFy6U0LeiahV0EMG/NVFT7hHKNN0gErHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iE2484t3HlHKRPzxqPYkGOLfLUOWtHtxNHuxoSxHKVcFJ2724kR0O0AJFQDbxBre2SvfmZwpI7vtUSRgVpe6XITaVYhRLdHM1Y/RlCUJkpWd9ssNhyu2h5hO9HOc1lU1kMhZchxoNjBzfhMXFUw0zObMFeo5Z7RIFZ1wJUUw4as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=L/An8rEM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="L/An8rEM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso47043095e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470056; x=1752074856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmxcQ91zf2meP3ZiqVdkCTGbHErgxG67WorhFT8FRbs=;
        b=L/An8rEMo7aKbp6zLuM5c8Fol+KMgOwE2Se8y495sppvnVz2iRGiWxggzW8SVzourr
         7Z+/5mxcwcikkgHCRHnYMXmiKiPWsJ2Sh2wzayTr3yI2l3wZ3/rV0f0IvLQoKguf1Fu4
         JXNiF48IVpALsS6LXjacbmOCB8v4DS5rOIqyUYK3HIlKnk5jlnCeULxCC+sLK+qEreIe
         Bbz/7l3sXY+lQQ6vx4b55IVVHgxKYxD7MtngdWcm04DSvH12Ww3zBo4XC8jyLRjEK6Rg
         lyraeh4LuNKia20gjv557aeJy/pfFSnIPXxzLcbyE+fn1Zsym1gpmUVgnWRY0kvSfTW8
         HjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470056; x=1752074856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmxcQ91zf2meP3ZiqVdkCTGbHErgxG67WorhFT8FRbs=;
        b=hEriwX8CJAxLxfML5jd2TqHQDOB4f75xTTxqd6FZgMwDmvX2D/dFcNi0rWTq6nkTyt
         XEriVbYb2spn9FdpQe94JheHnQk1PdgTXhBH+FB9VMQswJEvf3/HAxyMdbN4PupXwjEm
         RhmRpzLRiG0dzdS079jkQs1WK1mjNnGtiA1fJjv7zGlWz9YXGlT1xo36kvGqWKyM+1Hd
         7vz8I5qQhM6HrCKr0d38dBufUnmdDyy5nYilIDALihs9Rsr4PbpxTA6G7TZz8T0zCjyy
         96hGaA8xHfTmmNY7Ws9aM/pv5Scvfzp1+T6jVYE991rPxAt5NKGa/OXEGbH4hc6vLLjN
         Jylg==
X-Forwarded-Encrypted: i=1; AJvYcCUdmXXCWcoG32Ffk/QHqZ+F5S5neWe4AgMkXD9U/kSZBe/kSYQ101onpDUbRWDJ5UB/iBFhJo+w0s/x6KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLYl1bDbHEJlcV9qzR6j81XDwRj2QOqlqaf75iHVupyGn2dScR
	P0s9SzA5YWAQszkC+sD8YChvvpIjU+mXYi1PBhs1L6zyn4xsixh9obhdblfTOkZK30s=
X-Gm-Gg: ASbGncuTxa8ics08ym1m03zMOUAL9Rjy3BHhIJqO0ME2ZXcyv7prOFnKBDy466StoQJ
	Ihk9yBXyKAi1KL+4oF4zt4iYSh/f1q3k5PR1fmcidAQJQ5cLrQZ4mo7mfTA1JctZPN3dd+Z1l0u
	URAYdRGtu0sXGzu2UUZcWo6AaW2/UpKKakYCKp4+IJD7vAIjQm2Vhsd1DI7/y4tiQ4SroP3Dvjn
	+WusPfI3/anMsWSWMpIxiNE5Oumgy/EgMRDDjiHNx8WYYyUTB4H7+h1HjbwiJB5WX6YkdSUKbxm
	cdGpCr/0WUbaguTa+oTaDgxmboX0b4R6qYZ8VdzTgDbN5SASrhwQrYThdM3TAmqNnd/wsAkD1bq
	WbcgTUXd/Wuk=
X-Google-Smtp-Source: AGHT+IEP6ZPoDLWYbageCLDDfqTeXTLnPbckiWlmV17Myav0+cJQ4vKxIJ/ioeeFGIkkRkjelgPusA==
X-Received: by 2002:a05:600c:46c7:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-454a91ce35bmr8150905e9.25.1751470055761;
        Wed, 02 Jul 2025 08:27:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:20 +0200
Subject: [PATCH 22/26] clk: amlogic: introduce a common pclk definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-22-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10081; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UjktwdRyVGsFy6U0LeiahV0EMG/NVFT7hHKNN0gErHQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/KiklSh5+OYIADxksPwX+ASBwG2qM8bNl4h
 X4PLve0xWqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPygAKCRDm/A8cN/La
 hUMSD/wNZ6buCptDsfX0F7i6s82vCm79tI8uZ2m2yxe+zmY55pR1VfD+UyhZbtyqF6MC4NZ+mZg
 nzLJ+TUc5hG9Na6/g4bBg9dgYB3dukzQ2bR3a+L1H0aXOjwRPYgARIcXqZmmR/mtkBd84wtaEod
 Grn9PFmYwdBMStatLSZfzie0Cmm2YIS8trYBgsAvzTPgt3dUwCe0k21RRSwLLfuto0Kvi9aPhP8
 OmOgHSaz6/K+cI77ANRNX0k7D6X0cgk0Vr8w0EvB7a0LXczIACFYcLMnKLrtkUuYLyqrIzs4o2O
 6Op41WcdO8NpDk9pa8TEqqC1YpCrMUzzgkXySVEcFjtLxvpn0nlj0EgvMAuvgUkJqTaNv3K9ooC
 yCH8gNzS3bTq0gu3XUnl+ZoWR+zsU2RojkcYUrY/R/Sqeennsg7eWVVMUDlC3i/q7/ubjFzCKEu
 xm7Ik1V5px603IYf1Gyia4js97dqW0nZDI23+DZQvof8revLhFuZTVFgD/Bn9vGvXZqCeRDR2iz
 XcYaJKkBG3vVgZLqVVIkWYr0mnrG0avnp00OBMnW26rC4JQVulPRO3fHkgzX8XX+EioG0VSzwG7
 xtzOnJFdSAHtOFWoarmtmJRoJtn+gFeP4AsVBd0dThZI2DRBxXcuiqH3DwHyRV/XNSFyPmbIiKo
 79aXEVaYezfxGNQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

All Amlogic peripheral clocks are more or less the same. The only thing
that differs is the parent data.

Adapt the common pclk definition so it takes clk_parent_data and can be
used by all controllers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/a1-peripherals.c   |  4 +++-
 drivers/clk/meson/axg.c              |  4 +++-
 drivers/clk/meson/g12a.c             |  6 ++++--
 drivers/clk/meson/gxbb.c             | 26 +++++++++++++++++---------
 drivers/clk/meson/meson-clkc-utils.h | 12 ++++++------
 drivers/clk/meson/meson8b.c          | 31 ++++++++++++++++++-------------
 drivers/clk/meson/s4-peripherals.c   |  4 +++-
 7 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index a7bd3822df18f5e043e58e2d7bbcaa24345ea404..5e0d58c01405c1925a5c25ee6d0a547fd2e69911 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -1840,8 +1840,10 @@ static struct clk_regmap a1_cecb_32k_out = {
 	},
 };
 
+static const struct clk_parent_data a1_pclk_parents = { .hw = &a1_sys.hw };
+
 #define A1_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(a1_##_name, _reg, _bit, &a1_sys.hw, _flags)
+	MESON_PCLK(a1_##_name, _reg, _bit, &a1_pclk_parents, _flags)
 
 /*
  * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index d83482d5da6ddc09b3dfaf77c6898456ef9f0d39..e41d1ead28ce2e949cb65955fc9ae9dc0d788c08 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -1915,8 +1915,10 @@ static struct clk_regmap axg_gen_clk = {
 	},
 };
 
+static const struct clk_parent_data axg_pclk_parents = { .hw = &axg_clk81.hw };
+
 #define AXG_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(axg_##_name, _reg, _bit, &axg_clk81.hw, _flags)
+	MESON_PCLK(axg_##_name, _reg, _bit, &axg_pclk_parents, _flags)
 
 /*
  * Everything Else (EE) domain gates
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 7a737bfde4e62ec3d18db570e62cc77fb415676c..edd70b1d5df8a0581ef930d599e633171434e34e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4384,11 +4384,13 @@ static struct clk_regmap sm1_nna_core_clk = {
 	},
 };
 
+static const struct clk_parent_data g12a_pclk_parents = { .hw = &g12a_clk81.hw };
+
 #define G12A_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(_name, _reg, _bit, &g12a_clk81.hw, _flags)
+	MESON_PCLK(_name, _reg, _bit, &g12a_pclk_parents, _flags)
 
 #define G12A_PCLK_RO(_name, _reg, _bit, _flags) \
-	MESON_PCLK_RO(_name, _reg, _bit, &g12a_clk81.hw, _flags)
+	MESON_PCLK_RO(_name, _reg, _bit, &g12a_pclk_parents, _flags)
 
 /*
  * Everything Else (EE) domain gates
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index e2a88dc29901fe4617427907b382e878ae6ff7ae..4c253d001be9c0604fc87bb3d6ea5241b489948b 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2721,8 +2721,10 @@ static struct clk_regmap gxbb_gen_clk = {
 	},
 };
 
+static const struct clk_parent_data gxbb_pclk_parents = { .hw = &gxbb_clk81.hw };
+
 #define GXBB_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(_name, _reg, _bit, &gxbb_clk81.hw, _flags)
+	MESON_PCLK(_name, _reg, _bit, &gxbb_pclk_parents, _flags)
 
 /*
  * Everything Else (EE) domain gates
@@ -2817,14 +2819,20 @@ static GXBB_PCLK(gxbb_ao_iface,		HHI_GCLK_AO, 3, CLK_IGNORE_UNUSED);
 static GXBB_PCLK(gxbb_ao_i2c,		HHI_GCLK_AO, 4, CLK_IGNORE_UNUSED);
 
 /* AIU gates */
-static MESON_PCLK(gxbb_aiu_glue,	HHI_GCLK_MPEG1,  6, &gxbb_aiu.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_iec958,		HHI_GCLK_MPEG1,  7, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_i2s_out,		HHI_GCLK_MPEG1,  8, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_amclk,		HHI_GCLK_MPEG1,  9, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_aififo2,		HHI_GCLK_MPEG1, 10, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_mixer,		HHI_GCLK_MPEG1, 11, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_mixer_iface,	HHI_GCLK_MPEG1, 12, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
-static MESON_PCLK(gxbb_adc,		HHI_GCLK_MPEG1, 13, &gxbb_aiu_glue.hw, CLK_IGNORE_UNUSED);
+static const struct clk_parent_data gxbb_aiu_glue_parents = { .hw = &gxbb_aiu.hw };
+static MESON_PCLK(gxbb_aiu_glue, HHI_GCLK_MPEG1,  6, &gxbb_aiu_glue_parents, CLK_IGNORE_UNUSED);
+
+static const struct clk_parent_data gxbb_aiu_pclk_parents = { .hw = &gxbb_aiu_glue.hw };
+#define GXBB_AIU_PCLK(_name, _bit, _flags) \
+	MESON_PCLK(_name, HHI_GCLK_MPEG1, _bit, &gxbb_aiu_pclk_parents, _flags)
+
+static GXBB_AIU_PCLK(gxbb_iec958,	 7, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_i2s_out,	 8, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_amclk,	 9, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_aififo2,	10, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_mixer,	11, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_mixer_iface,	12, CLK_IGNORE_UNUSED);
+static GXBB_AIU_PCLK(gxbb_adc,		13, CLK_IGNORE_UNUSED);
 
 /* Array of all clocks provided by this provider */
 
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 03e38992c4c73ff4ee24f0fa99b7c34134376992..95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -27,7 +27,7 @@ struct meson_clkc_data {
 int meson_clkc_syscon_probe(struct platform_device *pdev);
 int meson_clkc_mmio_probe(struct platform_device *pdev);
 
-#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname, _flags)		\
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pdata, _flags)		\
 struct clk_regmap _name = {						\
 	.data = &(struct clk_regmap_gate_data) {			\
 		.offset = (_reg),					\
@@ -36,16 +36,16 @@ struct clk_regmap _name = {						\
 	.hw.init = &(struct clk_init_data) {				\
 		.name = #_name,						\
 		.ops = _ops,						\
-		.parent_hws = (const struct clk_hw *[]) { _pname },	\
+		.parent_data = (_pdata),				\
 		.num_parents = 1,					\
 		.flags = (_flags),					\
 	},								\
 }
 
-#define MESON_PCLK(_name, _reg, _bit, _pname, _flags)			\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname, _flags)
+#define MESON_PCLK(_name, _reg, _bit, _pdata, _flags)			\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pdata, _flags)
 
-#define MESON_PCLK_RO(_name, _reg, _bit, _pname, _flags)		\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname, _flags)
+#define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)		\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
 
 #endif
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a16ebbbf664cdd56b2c74db4f88a8d0a22d2ddc3..95d0b9cbd90404ee1c7ec551a2748665b4ef9ccd 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2701,8 +2701,10 @@ static struct clk_regmap meson8b_cts_i958 = {
 	},
 };
 
+static const struct clk_parent_data meson8b_pclk_parents = { .hw = &meson8b_clk81.hw };
+
 #define MESON8B_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(_name, _reg, _bit, &meson8b_clk81.hw, _flags)
+	MESON_PCLK(_name, _reg, _bit, &meson8b_pclk_parents, _flags)
 
 /*
  * Everything Else (EE) domain gates
@@ -2785,18 +2787,21 @@ static MESON8B_PCLK(meson8b_vclk2_other,	HHI_GCLK_OTHER, 26, CLK_IGNORE_UNUSED);
 static MESON8B_PCLK(meson8b_edp,		HHI_GCLK_OTHER, 31, CLK_IGNORE_UNUSED);
 
 /* AIU gates */
-static MESON_PCLK(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6, &meson8b_aiu.hw, CLK_IGNORE_UNUSED);
-
-#define MESON_AIU_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(_name, _reg, _bit, &meson8b_aiu_glue.hw, _flags)
-
-static MESON_AIU_PCLK(meson8b_iec958,		HHI_GCLK_MPEG1,  7, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_i2s_out,		HHI_GCLK_MPEG1,  8, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_amclk,		HHI_GCLK_MPEG1,  9, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_aififo2,		HHI_GCLK_MPEG1, 10, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_mixer,		HHI_GCLK_MPEG1, 11, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_mixer_iface,	HHI_GCLK_MPEG1, 12, CLK_IGNORE_UNUSED);
-static MESON_AIU_PCLK(meson8b_adc,		HHI_GCLK_MPEG1, 13, CLK_IGNORE_UNUSED);
+static const struct clk_parent_data meson8b_aiu_glue_parents = { .hw = &meson8b_aiu.hw };
+static MESON_PCLK(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6,
+		  &meson8b_aiu_glue_parents, CLK_IGNORE_UNUSED);
+
+static const struct clk_parent_data meson8b_aiu_pclk_parents = { .hw = &meson8b_aiu_glue.hw };
+#define MESON8B_AIU_PCLK(_name, _bit, _flags) \
+	MESON_PCLK(_name, HHI_GCLK_MPEG1, _bit, &meson8b_aiu_pclk_parents, _flags)
+
+static MESON8B_AIU_PCLK(meson8b_iec958,		  7, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_i2s_out,	  8, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_amclk,		  9, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_aififo2,	 10, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_mixer,		 11, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_mixer_iface,	 12, CLK_IGNORE_UNUSED);
+static MESON8B_AIU_PCLK(meson8b_adc,		 13, CLK_IGNORE_UNUSED);
 
 /* Always On (AO) domain gates */
 
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 23b51d84d8de40aa540dbc6dd5db9fb627e579de..3e048e645b080f9e5982ef908e3f9c43578a0b5f 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3165,8 +3165,10 @@ static struct clk_regmap s4_gen_clk = {
 	},
 };
 
+static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
+
 #define S4_PCLK(_name, _reg, _bit, _flags) \
-	MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw, _flags)
+	MESON_PCLK(_name, _reg, _bit, &s4_pclk_parents, _flags)
 
 /*
  * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons

-- 
2.47.2

