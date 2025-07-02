Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAE2FF465
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470063; cv=none; b=mqbCNDoBXOUMZJOuV79bbTy3zYm+i6N8T7qikXgJfFaYgwUgWzzJ527ZMm0d414BdpKKaK4koanNswXAA88gpCcu9l+xUWBocWybHAGQq5Ysuy+82gHmCjJLjM8cZ75lCzx0rxDQIUcZUcn0aLVSLeAJpJr0E+eGahkau47r4yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470063; c=relaxed/simple;
	bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hk2NrnkK1yXorBEIf0rgRyZqrTRWBub+UlxNkxv2ApmPRYoOYAEpklOVx+tdUXMKMsDs3IjoOuL64YdHb267J662C8SG4pHOtLuj3HUP24T0n+cJ9wO5vzB7Afr7yIOaJZX5dzUehfLuYMe0n/SH7Yy9kcXthHqLAPE26tE74xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qtiDelh9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qtiDelh9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso48015395e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470057; x=1752074857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=qtiDelh9NqjTxxHlWzrALoK8J83EEzK+Ir2/uS/s7YpW3zXg9XQe1j7W25/ZOk7G6v
         dmCDX70omxww/5fI6AdSGZIetp4+I9Kgwn/Re+bN5qOEuWgSJ3gdvYdD9oE6/xPnzU4f
         aebNl2ux7rE/cX5KeNkmNActMlQMuo2kWHAR6pAu7mfEKGlk2ApnycYJxPuTfl3nrx8z
         oK+xuNaBfvSh3o18XOKpAOUj82OZMzU+Rd9dfGNcq6dfykj5B+SLz2pfz3DfDl6g60PF
         YKPjLb2qSPQd/JHsNH7fu5jCE6ps3XhYBdvnF90nW4mxLPP61W2J1IVDz5rObSAouEm/
         a1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470057; x=1752074857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmj4+KeJRz5xK/o1A5pSjOswraJHwrE5iHoxwCs+mmQ=;
        b=arxHhaCYwc+hBMd2r/V6r/BI/88n+V+1UJ+r7GlhFYeM0C0k3M57CDjs+dzrfw7XNK
         R9dEc40tl4t09uOKNYNQZQFtmzpUkJBvFuaQZLOSWmr2oqXw/Ou3Gc8AviPoL2CobgXj
         zzz5OxlX+wY3sUVzul1O+MGPAzWSz5s10rx8nBk7q9L7Q+6nX4ya0sX9wmrwf2etetPk
         AeXjDbOzf57Yeb/ZKCaTrsBoec3daUqgzRtKO+uYo9TXI+c74PsXO8oKAgHW756lBiCe
         KWVkFvpt/UuMz17LCIsS+12xvYPCmhu8P/6R8ga7mOuyGWKnUGx9XdLVRx4o7rN+KLnV
         Pr2w==
X-Forwarded-Encrypted: i=1; AJvYcCX7o3DrjYe4dcrud3y4dURJwE4duDe9cXS2Uz7ij2T2glEvBjJaN9EkMOTuUjo8LoL/S92stZYWoT1Kk30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRPhbuLlx5j/k9CWwHW7B1+k7T9uU/v8iXjpa1IKRIYtKD37Zm
	wSOKN630GQtyuv6d3hvB/pJ66IHKKQ239i/G+7GWmlLNzh4ZlTGSG14MxFNOCX8MOHY=
X-Gm-Gg: ASbGncvP9DfRZrKfaK8WY/kkra5MnGrqQbkT9UoX4syFL74durWEqU9auwZIVcDZgor
	bq7aDeCd7J5s1MwBuBlCxuO1gMO1y4ycgDm1URlQP9BqaRhsok7Z0yy+oGgwUT6n1GN1+HK1pr3
	wV3W3naFYWklumadWi8jz2cJ7D9EJ9ity4Ra/ZJ7RNJJyamQxi2Z5Na0D4ZPyulvR4JkBjGQ2rG
	nZRfqj8L7AkS9Kp9srNK2Qwcietu4/CLGiMmSFrc0GsbB7jadS7Z6ZwkNC2uLWNOmvN3z5+auFn
	8Uy3skqUF+w20LiH+QLOykFZDZqtJp6MfU9WPV7cyTAJq+BqS4VLeLAq4VqUXsU3wIlBJhV29s2
	Q
X-Google-Smtp-Source: AGHT+IG5Nvg+4XJUXbEmvNpTdwBa6VKhe/U9qpL2tS5X8/kLxbQUPadTzNBqGqY2Pp9MJ0NtvGPYvQ==
X-Received: by 2002:a05:600c:c4a5:b0:453:6150:de50 with SMTP id 5b1f17b1804b1-454a9cd94e6mr346715e9.28.1751470057461;
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:22 +0200
Subject: [PATCH 24/26] clk: amlogic: add composite clock helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=suncESI2oSW1jGwgW8HALT/gxYfqW5NYgFG0TK2ZRwc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/M8MpgauqMch296c/UgbjKdCbz6RmqaG7+f
 uOBnQ9nC0yJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPzAAKCRDm/A8cN/La
 hWnsEACSnG22dz/mQvVC16u619+gXbE7D/A+OD2TuY4CL7XBrH7HphO3oVze0AeyGJ9+rVtJiVX
 ssivYxqO2B7DNqkWcJovuYcX8hyDwe8UYGhQQeD5mVekxQZR7I4wRvydAqCm1BSxYzP8P3vjCk+
 lBF95dmWTj0knQsem7xahxacMQMvGJDZFQ2LgXv1pz4Q4S+8H4xkSJYRIbtugP3eHNID+Y2amyi
 XvNA04JFI0bOG0FkToEcxsLHHn99qTf7Dle566H2NHgOneBNZWVCvCaaYAW0lIRn7ZoFYN1R7qs
 3UEQL9IoK2qtEGynnokTneFzeD6z8U/KcJBk48osJBcAT+asMQQmREI0bYt/jq3DcNQY1Cm2cHT
 /T9DItBlCT3FVsTMib1JVK7RgHRvg8tZInVzXQoY2yCWM2s6i+KvFDT6doqHLuyh9Hr3Gj/6CjP
 waFGuO6dxHv5dB3vEtKtiQ5tyKkagvQ6c3ha900qhiGD/Kle2ZWK52DDairL3wXJb6d0+phn1Uf
 7T4l8gXupb1X08JGdOrqZ1xYjV9uKUNECM9K4TYjF7yn7QD24AjllGAPIx5eTECYmEzTHZG8zEE
 1YPty6nC3eOBIsatncgY27yluN5J+LVZprK7yvi40UNAtlMSsYrTkkr8cWVKD6a9SI6IqSMVwEA
 HZkuxOWcI66bCVw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Device composite clocks tend to reproduce the usual sel/div/gate
arrangement.

Add macros to help define simple composite clocks in the system.

The idea is _not_ to replace all instances of mux, div or gate with those
macros. It is rather to use it for recurring and/or simple composite
clocks, reducing controller verbosity where it makes sense. This should
help reviews focus on the tricky parts.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -48,4 +48,61 @@ struct clk_regmap _name = {						\
 #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)		\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
 
+/* Helpers for the usual sel/div/gate composite clocks */
+#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,	\
+		       _table, _dflags, _iflags)			\
+struct clk_regmap _prefix##_name##_sel = {				\
+	.data = &(struct clk_regmap_mux_data) {				\
+		.offset = (_reg),					\
+		.mask = (_mask),					\
+		.shift = (_shift),					\
+		.flags = (_dflags),					\
+		.table = (_table),					\
+	},								\
+	.hw.init = &(struct clk_init_data){				\
+		.name = #_name "_sel",					\
+		.ops = &clk_regmap_mux_ops,				\
+		.parent_data = _pdata,					\
+		.num_parents = ARRAY_SIZE(_pdata),			\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,		\
+		       _dflags, _iflags)				\
+struct clk_regmap _prefix##_name##_div = {				\
+	.data = &(struct clk_regmap_div_data) {				\
+		.offset = (_reg),					\
+		.shift = (_shift),					\
+		.width = (_width),					\
+		.flags = (_dflags),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_regmap_divider_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_sel.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
+#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)		\
+struct clk_regmap _prefix##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&_prefix##_name##_div.hw			\
+		},							\
+		.num_parents = 1,					\
+		.flags = (_iflags),					\
+	},								\
+}
+
 #endif

-- 
2.47.2

