Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562992FD590
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470061; cv=none; b=mKc9OHefoQ+TX2u0VJ9FhC66e/rY61goMSkL3H2KhAhsxuAfexzFJrrpkDGMUXyC3uoiZSl3FsF8LxJoOwMu86+AuRWBhmOXyvFKUcONyQoiF2EMdKhz+PzFhT6AMZp7NuAHY9CbxOvfKL0VUvVuQJ4/Ale8t/YmblJIgHQYHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470061; c=relaxed/simple;
	bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9fMkiRJvF4frrBhIIfHUQIUed955fUytuqLkDnMrTTildp1jBVtm/iJITNTTLExyGS2OwQKKnPYkVjVJChyq8+t3N80Lu5ljck/rHaXfVk2RdvA18xi+eWX7vACdjWlisOe4Ly+jQ19yM4mi1DDcU9LaHxvAQK5ScQcp3sJ6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y7lUA4ZS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y7lUA4ZS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a53359dea5so2643911f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470053; x=1752074853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=Y7lUA4ZSqhBtP+2TbjqM8dW0KKVMIjzQhgEOZ/rKu1guCZUjmbIewI7M/z18cEHE0x
         EWm9CTS1NpKOY8O/R5fpIAXy3pKCksNwX4E0KtX6JP5TvVWnU7lAFAKXDuuVssbngYWz
         hGqa4YF1JHFZfw4HQ9lmkgU5KKuhgUzYBO+M3NrvT1inxTuiK+tXxNrqdDxyL3HApazz
         zC3fF/4TlOjf9rQSlo7XWZkRvDDtU7y/pkdDxrc47qz5taLo+2JwNJ+3FpbGN9FefYV+
         r9e0YCuhWn7Gdaw1BeT15B9/MoXA1rNKgvuS0ZfTaEAnF65uU506DrslHkWb8QXfjbPU
         TbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470053; x=1752074853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=N4K2/4jZDz4Ky7qv/7r0AhF0Mn2c6/2Ft0O8imGgentnNCQisjtWUQn0tmMYjwgjRM
         i9iPIztsBizpIJsWmAcNCzx5fL5GOH4f9sBePmjYkoytfDkaqWr9jBcxkheKTxA7Xabz
         zZfYQGIQqFwfLyBlJ34GZ9GJ19XqbSyrHWSpP5vZBO4Lkn/1eNCD37PTRm+qi6uwvYHD
         5CZyAP3MzDY1ywr2nxrkLYLrB5swikavfRvgBCKf5Ydj96mhFQpbAP1PknYfH6xQoH3W
         hNOxkABnUG722XSiNtzkLf482ag/UZNhltMN9m42wGQY94C1ay5n2Dk1gKRX6Ag7ZXLS
         vSDw==
X-Forwarded-Encrypted: i=1; AJvYcCUjtnDM68LZKsm7CTmgV0uXuhrBWPuc/S8MY4sT1FEp34mxXXrDV/JxCqW+MyDCWCF+5CRXDJ/iKSA6ouY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZoVwXYf0BOez8YQw/TE0B1/HW7mjw0Ms0s9MCFUjIk3Ak7u6
	2gyzNc84hclfsvsL8II1NFJbFoHumLcmQZH5tWhHoPVLbK0p8MLHe/ib5qQBphlFDtcPIoJZ6Pc
	SdERe
X-Gm-Gg: ASbGncuyxCX3+3Jy28VMElQCSbLSkQ82dzuDhmAgr+Q8+2sxAODgP226MqY4Y507aTC
	haTRwjWpjphGGoywvYrKtgwWrsaWKDtwIwjgBaPamvZSgsKTgT18OSaOAiim6iwvyHFHA0eJTnq
	DLQJJ9KAW2q8pDyI1Crzvm+rWpK98E0rUU+CiS8MYNs1qi42M3L5NNNW+j3a8fiGGosXCyofFnB
	2Y0Zei+WCpXwtjbUUECVxzsLhGgGN+qowlvS0OVCMke8D/TSfBnTr7Sq+ZFmdyhfVoHNnQ9St7Q
	1OmVj9uuo/Ui5A9jlJemyxEfXAmIU9zSVdh7BSEQKOhXER9+0oTm9LDHSMVj5+f8tMImy1124em
	X
X-Google-Smtp-Source: AGHT+IEkrWJkT0jsE1v5Sbwsc1H2qjJUcmDvZLYQeK6P1AEgJPv+8a/qmcAydC68v1anXCkcKA0llQ==
X-Received: by 2002:a05:6000:2892:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b1fe5bf209mr2942390f8f.1.1751470053311;
        Wed, 02 Jul 2025 08:27:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:18 +0200
Subject: [PATCH 20/26] clk: amlogic: drop CLK_SET_RATE_PARENT from
 peripheral clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-20-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/IeRDPmxst5O+ATDGbnAky0+Ta4bbSx6FjZ
 33IFnNXNSOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPyAAKCRDm/A8cN/La
 hTqUD/402wWVc1/QpJrESo1iekdMPyOcCOngi36a+3w2IOCWeiaSJ5OmxFZTEqneuVl/ktn6/YB
 LQ8Q0HtYKDoo5oNEuUk26FVS/zHZw4MTQA4ZvuXszW5tN2MbBbmIouy5GJctPismKE/VJYanSXI
 kYTnEJWUcNNHj5N7vjLwm4gj1RkK3Fzijp14/Om/dLyXfa0yMKpWm1GA0CRa0ucSigkYruOjPPj
 xyD1eUXSFxkovtt1yyN+bCLneu7b0r//0JC0aT8pleORi/pW8tNqeNzX/E1+jClOlbe6AgjTlDI
 aBAkmX2ETqjuLstTtEvoL8Ky9DGblp1/5+f8AyIwTzBI2EOcJml604N/uJ2C6+4jznQ1rcrOFLW
 ISBBLyh6njHps/wpWkR48MQiYi4BLASafnqDPIQXUfda5/WdOHmLiEWA+cWLNPXMpbdasDCJy/M
 fH4Vl0UatF6Xl/MvwX2BK4rOJ+Cb0shVVOXlcQKrdQIi8nhZ5Ky+k3QTm0BA7oU0J24ourJz4m/
 GB6wnTo+3EOMUREoOAkAD3sccNGpJmj2zng3y++ceG1gA0Hf1zRC+MFunedrzJU2SRIma17R+HE
 xTcLYY2rqfOJYt9DF41rIeMQeaKk709jaBF1kZhfftq1eD63j/Q6YQtrSgiH1EQ2tZ73q/uORvG
 hSaSgQt8SpTbh9w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On Amlogic SoCs, the rate of a peripheral clock should not be changed,
let alone the rate of the parent PLL.

These clocks are meant to be used as provided by the parent PLL. Changing
the rate would be dangerous and would likely break a lot of devices running
from the same PLL.

Don't propagate any rate change request that may come from these clocks and
drop the corresponding flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 0c228a6723bb2bddc0b9a4f92515f05850a5613a..3e1fb7efe6da1f5d8e55993541d12d40464a47f5 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -38,7 +38,7 @@ struct clk_regmap _name = {						\
 		.ops = _ops,						\
 		.parent_hws = (const struct clk_hw *[]) { _pname },	\
 		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
 }
 

-- 
2.47.2

