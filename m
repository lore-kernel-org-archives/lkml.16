Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E662E7BB3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470057; cv=none; b=N3r7LwhbLuqNIgiAnLm46DJxZrLQ+dUcy9vvhVOuGiJQOChEjaOgJ0mptNma2xzRUWwdMHBGuUgSD2tY30VYAxmyXSzDcPHSGK+JNXIRbbs68saL/YOmebs47NxcEd1fZc0V4jyDenSt2XXdBqm6Dpdn47eEIcNRt3btDOzwX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470057; c=relaxed/simple;
	bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nLaGkVH6mlVeWgAUSxUpj/KgTEavu53KRhPrRX58PjQWHBhmLxtgn65mEQFmss1HMYc+Dcem0h7DVj76lGkZttbfGdF2XHfIjLCi2phnA6k1phpKuNv++QfnOBsz0r7gWPWvtobd6x2YFxgcLft4eeRNFyi97HJdeUl3h4nNTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BpfgNidm; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BpfgNidm"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so46837775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470052; x=1752074852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=BpfgNidmmgsuo7NKDkn23yhe6nx4tdEOWInQWOOqjwF1FJ9dwBD7PfjKqs1ysMLLcL
         xH4rTtmOXXpH1XbEY0zD2O8rNAI7envV99Cds/rXBUOPjvwZ9gvxnWAEnFHjn2av2zEX
         ceYyfLJjTAqjou40QtviGFtgXocIX16qZ/Pjd5MQGvtPSp5PkIdvjIybuVptt0XwJqhX
         zZr4MUTHd8DZfMGTmcLf5Pwnd2NPueMYExqnFP0paUYmxOKLinIfTlAkUhre+iCmnHpn
         Ii3HVYTDY5WhnHorlLAWwrm8Nu8jCgXR644P2ICPSJiHlXhOdYZ8XlT6eF4AGuj06h4n
         7tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470052; x=1752074852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2GKlTQ+1w74j9oubIC+GWZcqnBFxLSwzSHXC6Ex1dU=;
        b=MEzp3XaG38P3gRMhZHPuqgpFOgpEdK6Y/H2FO7Z+vziDE4YRAYDmQNOs6v18OpyZ/H
         rZlx2QjcW/V/1LvfFqZKVtYgS53Lep5JpXwZ+n0WmxjKWqGXCpTGgOEFlu0g8Ki2F0DP
         m8JYFcb0bo1deoWzjZ0BSLUUGcxBRKheJSVrk74ATf5m0LHiyot9xSAiGGQ0qmJNpiLU
         e8//LE0cycbYQgxD/A3YNMsOmau8JNyGmQmA0xQQkXUOj8MaSQksYb+zmmCLHYjERZFN
         Jv/TVYWI63EdTBnMrYRGuwZLTJ3bcBWrkR0gyeoO/tvQoWwd21ji8V1YNuRfohnPBU68
         GvGw==
X-Forwarded-Encrypted: i=1; AJvYcCXZv3vN88rz8ZjvJHudvGnd8kJVSijr0K9Id/qsdwCYq3+/EdfohO4U8y0EmJzIi7uXBgtMqqujh+7cwHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrUxjIJh/sQREXtlNHU2W6VCK1HP+fAPh8Q5Q+JxxSlbxW0Dbw
	tS/pXWejQ3vWIwDlX9i2Y05aU91ur65rqUrspLNuZhygnQSyLHF1L1vLwWx0bk2I/h8=
X-Gm-Gg: ASbGnctsLD8GwW8MAKPll4q8Sk/c/XYhbT3KsbgeWS4pYD8bIEr13e5eu5eVPmYeCM7
	BScmukqlvXXe5BYTqxWHwOWF/BIZc0zULmcsQPVxIaSALgN6ztUnDvSu/2VCoXoH/79EHdJBL1o
	x9x9TLwiLv2rCnsWC5Dgud9ZfZU6rba4JlEChZvSPylg6DnBh4etIyYih7CqUMbZA5eRpRRpX9U
	2iEtyssyQiEfjKFpfVSHruJkehcii53t6wBG3zI0rIpyNNhW9Q0KjeFXbCUD3cnb0M14LWiQHwE
	lCeS73pDinJNyHl3CzjQOWOwbZX85Egakah0C0QdsvV084zqSvFSzRUMIvi2vFnophowKIP0bYq
	9VUH+4j00xlE=
X-Google-Smtp-Source: AGHT+IFCn7amhlgcqtX+UD8IcMW9MxbWI9v5wNTP+g8n4cqZhj8+Pbn365refzLH0EBKrHJrQ0uuPw==
X-Received: by 2002:a05:600c:3e8e:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-454a372586emr32398255e9.23.1751470052525;
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:17 +0200
Subject: [PATCH 19/26] clk: amlogic: move PCLK definition to clkc-utils
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-19-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2901; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5iKLGNRbAiiV7znNVkmV2nYu93DQzEVzWcxt59v2OQ4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/IIiBMGn9iqSHruxarbiEawriZEm/qe7t+Q
 kko/xVpz8qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPyAAKCRDm/A8cN/La
 hfRJEACtLVmX7LKvp41w3fFN9EJyDm5mhKNqdEki0DLX7q6IYxCHvILikQ9NZU80YF15KiipS8/
 w/3epbrRge1V82kBLqqvuC1/pJxDujsaPZx6eRdq9GcPsLOZZ1VL9U5yabv1Nb5xcyyiZpouYPI
 53hAIDeHXy2UYczA4biFJ4oug+DetAqhUM0Bf65uuzTJhdOpwlGozDBk90jdWJ4hhgshAc7VNpU
 mHhYJPtY2JGHDjKAyJA6TtmP2DjO0djhWexJ+7Vgbu6AuaehSJE4+1KmQ82Eij/SE8e/1tVrU3X
 M95ATbRRZKGB+qGBaIpttNg0iP7nB+RlcQVESGJw07dlFcUU355FV6C1xkF1QzB9xDL4PmrtyUl
 7eGDV+bEV6c6q/RwkUjR9OGLHXUpzsL1OZePKS5cNICwXWe0EfZs2s9PnrpCc/P65VaPtgyvd0E
 jDVrxv5ADLPtUIulVHsRXLeSti4Doezo5r7grQOW9321qOEHx1Zi7NnyeOocLj8WeiZlyv9BsZg
 kbOhbRbOgHbZfp0z/WEX2uxsb85tX1Ta290MKTgtV3kPWQhphtZZcxfOymbdgSbXk6m8T1EAa+0
 E+8Kd2aE384jfEKW9wvFohfi1fsEyNmIuAeVbWV12cFuTFEecKtAitUhTSjsN5IRNst6hrJuQSr
 mNYj563CodTwicA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

clk-regmap was always meant to stay generic, without any amlogic specifics.
The hope was that it could move out of the amlogic directory one day.
Even if this may actually not become true, it should remain generic.

Move the amlogic peripheral clock definition out of clk-regmap header.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-regmap.h       | 20 --------------------
 drivers/clk/meson/meson-clkc-utils.h | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index f8cac2df5755b0f894570305604485f54c17ea49..8e5c39b023e1334e37d5a9e0594436727f16c4f2 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -118,24 +118,4 @@ clk_get_regmap_mux_data(struct clk_regmap *clk)
 extern const struct clk_ops clk_regmap_mux_ops;
 extern const struct clk_ops clk_regmap_mux_ro_ops;
 
-#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
-struct clk_regmap _name = {						\
-	.data = &(struct clk_regmap_gate_data){				\
-		.offset = (_reg),					\
-		.bit_idx = (_bit),					\
-	},								\
-	.hw.init = &(struct clk_init_data) {				\
-		.name = #_name,						\
-		.ops = _ops,						\
-		.parent_hws = (const struct clk_hw *[]) { _pname },	\
-		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
-	},								\
-}
-
-#define MESON_PCLK(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
-
-#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
-	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
 #endif /* __CLK_REGMAP_H */
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index b45f85f630d7190fb6509b088f05f17ca91fa1c8..0c228a6723bb2bddc0b9a4f92515f05850a5613a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -27,4 +27,25 @@ struct meson_clkc_data {
 int meson_clkc_syscon_probe(struct platform_device *pdev);
 int meson_clkc_mmio_probe(struct platform_device *pdev);
 
+#define __MESON_PCLK(_name, _reg, _bit, _ops, _pname)			\
+struct clk_regmap _name = {						\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = _ops,						\
+		.parent_hws = (const struct clk_hw *[]) { _pname },	\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+	},								\
+}
+
+#define MESON_PCLK(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+
+#define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
 #endif

-- 
2.47.2

