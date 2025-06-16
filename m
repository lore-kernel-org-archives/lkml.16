Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C302E7F08
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074862; cv=none; b=irktfL4b3Fxb+PUFtkunkOVJZGPK/bYiwKm/u45N9BgyDfOkLTtkq6eAeVxira9kjQWZpgQHoJqIsHRytLYtQxG97BNCFMZpRwrbiTtrtCZeSBYclC2UENLQGCzLjMeXUND9VSYJcMi00++4V/2UYvnkTSe1K7r9JfhJz/T4j1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074862; c=relaxed/simple;
	bh=W84ukinUJ51e433j/q7HBi699hZcbP1TxUuIsLTTSuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OT/v00NKIZlgvMyWGn2/RpxBcqhbZTzEecyN0tvsEEGQLavrNF4Dzyn5Yzuo7nIz3EKOFrfnCO6KIZp2ZxqkjKC3qwAphU2Vwt6npVz8nVPQgxRuH1JOx7tfGwt7G8rqAUV90e8wTgneAMPotJG8EjfR5sPmKoxNFkhBy2o/XdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agsKQr77; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agsKQr77"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450d08e662fso2245335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074859; x=1750679659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UW8DtABN+4gWLwcxZoGbouWonY/5+M3DyOMQmabf+s=;
        b=agsKQr77RMc1ryWO+oMeX3TE9IBI8mWIC1XlHgv0oeVQtO0v78hU/Ly2P6hXSd+DK1
         ErSBoMi6IzawMVpizvon8RQgxWPJgoY/Nyz1ZU5AFN6re1KcXJuGr9O3Can8kgKCEcfd
         G3lESaGeXv7fJ1ZSSAgDXrP2LMDuXOVWCNh1cuxgvUccpGSEjYFlw7zON4pcyiygD202
         A9dCjCFPfKWAM9FJA/IbmQPq9VqreqU5Kln0v4rK2ZgO+4tANySdvqfwdChxf5luQYBu
         sGLsDxaBrlI+xjWjZwbkf3gnuamO+dAAmJyoEbJ0ky/v8sueEG4GT5SuUnoQYLnrK6H3
         /gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074859; x=1750679659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UW8DtABN+4gWLwcxZoGbouWonY/5+M3DyOMQmabf+s=;
        b=FjykLXsUgclKJvrIH1Ee9JSOEKcJChr3beN0ETGCH1Kh1QlbCwW7owx6P1Wexezy8C
         fQv8aJPN9KmsvoIIXrZHA9cFzsbh1XjpB7f6OdOH61KAxAWB5NBVg+drTUnvIcoU+I7t
         WJjxMZcmVD7skG69aleuZkbzeoMa3uoFUJfc/s177I0KJFUQ/eCKVF5UAPW3OIWZ9Qs2
         XlCpLfxXcezS/q+HMIBjtTnD47iyMA6mbWH1ZwaAr+UiQKMSwXYlIG7r4U6EnDBhVOlv
         zcce5tYnxT/Nu0Hn6XnzMnqY4vuL9Oy19MvtYrZidoYovUL9vXRFnGo0pIzchkvjLOOS
         dn0g==
X-Forwarded-Encrypted: i=1; AJvYcCWfvVQqKUMH7AdCQemaWYVr+Bop4FuQmqUCUZ08MXFGI1uQ6VsE/gYasYotvHVA03LSUC+FokhWxqu1fmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BkJz9RCsEVZThmGF6EAtZhmmrFizFN/pdkig1g/c006NJHXP
	P82UkN0ohPqIgQV0aUSQEj2iOQS58eodc37k1OiXoCO+guKyXyrJQN+eM8FkATOMPaELxtTwT/M
	zZnswnxF0+w==
X-Gm-Gg: ASbGncuWQNZDEMIAAARmtau14ERhKHIvIG1lpqOKvUk/Gmn6Wj7X30ehBUwr6ksnb3J
	KpphZe9YwBJ1h92cyxxarDvqTeVWyHWysNTvPmACjf1otix+wsu4PfShoiURkGNEN9WZYNqroxw
	cJI1DJ/PcUyb+f0PS6eylXO8bTM9R8SZqQaQZY9OxLBug9kVwmAppnDyJa9yAOv70i+raxI82FK
	Wa9wGF/JnRh1goSpscj39OkDSOpTWsPqAds/n2s+zmFZdsMrtvXUPyEIc5P40HerjjKj9A4aEmd
	LyYx1Lq7RUNG7h3vH17eJ4w/NDvKfvkjMESVu9XY2FL7m+zTAvTpA2ZRhEczvbf3saewQAwvs/F
	ZgVFigCs=
X-Google-Smtp-Source: AGHT+IGOeVJ7hItLg5CQ32p4wI1JoyTJsXl9AjQIR/wzWxC9zhhxkEHKpKD3ExHNiskXVW2Tx2rErA==
X-Received: by 2002:a05:600c:a48:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4533ca57522mr30136775e9.3.1750074858974;
        Mon, 16 Jun 2025 04:54:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 13:54:08 +0200
Subject: [PATCH 1/4] ASoC: codecs: wcd937x: Use simple defines for chipid
 register value
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-asoc-wcd93xx-enum-v1-1-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=W84ukinUJ51e433j/q7HBi699hZcbP1TxUuIsLTTSuw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXk+l067ic4pERy8pOXfmZc2SFP5Zk3PoJq7
 81En4HhsT2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF5AAKCRDBN2bmhouD
 16FOD/0ZTGSCOltZ9CPLHSVGrcrND9/EAZxYyYNKS7n2lwRXCdv711TKFzklJGyEOPKtlhjNgGH
 /Dvjfbtx6vHTFEcz5MdZGN9vSVgRoWKl55pbOzxB6inkSdEUojs3/CSdYjlcyEJh4AR3er1ZG5r
 HuXK+5YFt3IQX/sbmhUodNP1jZP11zeA8stiggC/eIPv/HJXDbU1A8B9PM+8L/tn38UcrqpQ3B3
 3RtYNcrgcvgQd7PlbVB9t2YubgMjwUFC0gC/ag+/y/eYMns1eKw5q3kPXngqHwRbSBUqsUzRXad
 1keaiM89EaRst8l1pqPtK54hCrEHb19vmQFMDT0Pfu6QTiNJrIjVpdnoY6n9qKvo4/UR/4V+jmc
 qEj/8MW3s2K85Q4dgaVmNHXMgr0Rw7IbV16vzyt8xf2LZ1sUxdo4brq/+d2IsVZDhhveLdDB/EY
 bsn2JZBw1bfG1RmIRAHtXh5iBjNV2MsfoWeTjJd+miGNWkz9uYDdDUOimLyxsF4p0b7P8yj9v/P
 We+/G9qBHJkRJe2Z47wCLnBy7n8OUUU+jrAL+panlciAG+rHLNoFcQVoeaWpN5SrMe7OWXMS34e
 xOPNIw5Ctq00Oi5fBNUhuIjM8J94FSfEWMxlZkEkUqHki0CPveVOQDlRz7jZ95ytObU+dNHDeGw
 Pn9HC4FYijI5U2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The value used to identify chip variant is not an enumeration, but raw
value used to compare registers with.  The 'enum' is not used in the
code at all, so simplify and make it a raw hex value define, so
intention will be explicit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index a5cf6015122cc9d30526dd4415a2b28353868d74..3b0a8cc314e05934bbffd38876b7ad7e0f444965 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -24,10 +24,8 @@
 #include "wcd-mbhc-v2.h"
 #include "wcd937x.h"
 
-enum {
-	CHIPID_WCD9370 = 0,
-	CHIPID_WCD9375 = 5,
-};
+#define CHIPID_WCD9370			0x0
+#define CHIPID_WCD9375			0x5
 
 /* Z value defined in milliohm */
 #define WCD937X_ZDET_VAL_32		(32000)

-- 
2.45.2

