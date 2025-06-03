Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B823C8BE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965407; cv=none; b=hGyTZZsNeahwJ8ftjyPsiGHcYO7r2Iks9Wf7f+UxVDnbu19JnLHu07O7bMM5kllC3JQ8dLn7IViWAjHpg5+j2mdztqca9/Sz+pnGb3xQLobM8IPJWTTtCQA7EhNS4aWysEwYuMKRVMqbnjpQZS6sLrnW1yc01c+s02ni+n3k3Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965407; c=relaxed/simple;
	bh=EkPTYV1qpD5I8FZtfNjsSjTt+gP3LGJ+qju8+Sz9SVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WIjFHgINECyGwQs+LZVeKd35rUb6e9OhI+PNXEMO/pDzPxMmPjSseYEApwhPqbC67mUfZYyc67lOL5PSTELivJPj0Sfxie3mliYDK6FvzJYQ+CEZb0SX1t8v+sJmwtjGEoXgDq03mVPZ2QlnsswAV5SUN0W3kl20zxxZf//95Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BxutIJ/d; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BxutIJ/d"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60462000956so9921889a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965403; x=1749570203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=BxutIJ/dVVDkhqTn+rJvrPb7YRQGvrzcANNN2JEvBYp4hUy0g9iZUXtuYKAgKeU0hb
         hq/jB6ehs+43rPfuWyv8aBOEtaUc83xRYBmYjAYjjElXC0s9PJx6PKWDvfgir7W12cEr
         8YxxBrcPIn9pWBb70sPeC5iw6VLEBUuwY+u4i46Z8bLWiCziydrlMQqalyL6N6E8a/By
         B/Fzk9iPHtpZIf2N8+K7q/WNZtDq6eZLGGRa1lV5HQ482Oq2Ix6a+nnTZTB3FsjGrei2
         oV+qhtAPDgyj4/oaTQbQdEK4DYP/KRjVjBz6sH7oGJvgO+yaNvanYQQXxP/elG9xj6ta
         gSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965403; x=1749570203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIaiXwYKVn8R6QIWY00MiAnh81IbvOV/xhrE7RJnhkc=;
        b=Bz72UyAhsG3NASyySZ2riM0P+W5z+f/e59nTGCoFvrXWD2lsLUhmbkQaHSHicXmDGi
         xlRfgyJGAFULlB+Qi0EIi3FW2d0JMyGVZrQH3/Sf0SSKTfXjNxYgcGiZ5TUIIBL8SZQM
         fxZRNvIMG2C9RyuqIghYIXL/HiYn8Ko9RJxYPqtxBrkJ1Y1iS4Fn5QXChVwLwdNFzsQJ
         MRmwkt1mt46DBDtchdohQSQrCNXnlw6k8GizyA9afWNWjQxwcj2C/h3c1N4qxim17zP3
         uAtBUcC5wNOqx+D+HNq5iVy/PwOMC6ZycmGlfkYF2JBx3SOGo56I+lF764wUY9VEVX3G
         FNTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXECOPO/es6lLHtuyH3uJ0hiL7aPQOMX/RVhvLH6dIZ1bxU6HtjF52eRgX7Hbw1gYOnp4eQv1CC6XOoVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4FvHrb6dtiVE1M6DqFmRRHwvJ1JrgPw6odaGoN348pG0IlAr
	dEH2PdfNCDXU5/7t74CNC5h6DTQfmfWpzHIFf501rujVp3OyD5Lge+LUWqP+O65uxXg=
X-Gm-Gg: ASbGncvkU41TRm0kNyUMsKQpBnZIolq77qYL9ZQkEhK6V0Wa7y+HrFaM8KHXRRJ3f/4
	MZfFzWwFENfDKdiqKLb0lq8CuMgU17Uoi9d8YKeRsTH43cx43aYSaqOgrCcUrVCw2ESsWlwviSI
	R2GVQ0nJQSPb8kBdpUtRGON0UWn9VY7pnoDhZYOqGqrR/9psLxmG0Xi4ks5XxS2IA8nC2NcNmSA
	bwS2hp/rl7ZLZidI9ZIzdAi6sb6fGWI+OGzUTRiZ3FOKzrHvMvMrvqfzu6PMzYrvTX6KpVOhuh+
	roswqTI0zbQAxuvxjJx3p6V164xjGVL9wfIC0GcPP9DX1bgWR3KTsXYjXW7/FXL7cti7JsiDc3i
	rUYsmb/yW+XYOc3rkHgVIcqVALB9SATWcbVE=
X-Google-Smtp-Source: AGHT+IHuYQHqV4Udvsmxd2a4zxZaKbBte+8oMefdUwG0LYe9b8Y64CtnGXRSZ5iS6KwNcCvJD1IEPw==
X-Received: by 2002:a17:907:db03:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-adb36c117ffmr1500580166b.51.1748965402578;
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Jun 2025 16:43:21 +0100
Subject: [PATCH 3/3] clk: samsung: exynos850: fix a comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250603-samsung-clk-fixes-v1-3-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

The code below the updated comment is for CMU_CPUCL1, not CMU_CPUCL0.

Fixes: dedf87341ad6 ("clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index cf7e08cca78e04e496703b565881bf64dcf979c8..56f27697c76b13276831b151db28074387293077 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -1360,7 +1360,7 @@ static const unsigned long cpucl1_clk_regs[] __initconst = {
 	CLK_CON_GAT_GATE_CLK_CPUCL1_CPU,
 };
 
-/* List of parent clocks for Muxes in CMU_CPUCL0 */
+/* List of parent clocks for Muxes in CMU_CPUCL1 */
 PNAME(mout_pll_cpucl1_p)		 = { "oscclk", "fout_cpucl1_pll" };
 PNAME(mout_cpucl1_switch_user_p)	 = { "oscclk", "dout_cpucl1_switch" };
 PNAME(mout_cpucl1_dbg_user_p)		 = { "oscclk", "dout_cpucl1_dbg" };

-- 
2.49.0.1204.g71687c7c1d-goog

