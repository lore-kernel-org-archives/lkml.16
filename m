Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B16221547
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969042; cv=none; b=VDPuwWNHlczY3KGZP2Fg2RDEyS+x24esvoGpDeoTG4jvaj3SmbhDg+YBNk+3oDom0l3oJGzrfsm/N7vRh8udbfxx3LwH7EgLVQTBBcj3u7NSI3oysdamHyymxwQu7DroeNKRYLF5fh+MPj7GW2w41EwyqZy/23W/+CRhpb7nzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969042; c=relaxed/simple;
	bh=qgwnfNaPgh28TeCWIJFlF1vcUDQSOH8u0MAvqLNbbtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNtnQXXFJNLlVncPdGP3CqEUuySXf127iKEdMfn9k/voFZp5AbcPXIsFSHNmSqZAI0j6pZefJngpCrVpIaktRZKbvtyu4qwdarB2Mixhb4xFBSEgXBarJoiz0afgovahky5KyQ1uDzAcNJursLocyTj/J3Y79bIg5RJf8e9RRUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySB+csN5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySB+csN5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912622c9c0so390159f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969039; x=1744573839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuTrfYAeGVce5bHvq1EVj+HtLFV5THzxv9MGSXWz3uE=;
        b=ySB+csN5wKr2wURugssVX18mRUCK5FCjrN3jD+XXdYYS5dTGvoBFOquUWreUL7imDO
         cGpNBaGATn4Ue0tHhdFnL6BgmiOadtOWV44L1d8sROkQ5gwbQVV7gcGrkVUmUhm/5o13
         R+MKk94/Zws+sNwDaQscpDzOqtVBZiSEwcnlmz6fR38TmpeijofJh+wEQ3fOwSoq9bL6
         Ag6dFW07aJ+49VKRRApZ6eBFZyI3yaQCDFDD2YzzkthrdDxWE8XEuwMCpb/qjTlufYXh
         /Dv5LIDVKgomLOv65GFZ+R9WiONGA2flKbWrujiLpfCIjs08mlxx+hVYKeQoOCvQJx9q
         8IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969039; x=1744573839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuTrfYAeGVce5bHvq1EVj+HtLFV5THzxv9MGSXWz3uE=;
        b=j2cQiMd9fj5KrawBs9eYYz8GWEo8zvvt6iwbQU0JctsD1dGwXnoMk/Nj5uz5zICpIR
         aadztFMOrFblc+3Tf28PAMI17fdJ6j264TawRo7/FG2HXP3yYL6PoKA9Bv3wXjgKQXGr
         v0kif+NBR5wXxDywnlpn78zYpPfe4FSmSHVhy/ZSS53WF2EwQcVx2aLSVr89yN1AVRqB
         2La5k2GI9H2OM7sRmfctX+Lcb0Tvc+tDzklqsI+6SpBRE4Q2Wzw4WWEV9cWt2Q5HF4VX
         l9h9xWBuBU0CpoRSK+hs3BYgIHUFN69eJ1S4swTdBbHy+uYp7Bup5TSQmYFGMaOOu787
         qz5w==
X-Gm-Message-State: AOJu0YwpbatgBJf661d93F3n8h4Pq14fSFBaMEyGcPBhMIfNdGo7WWy1
	Kx0Zvt0v0bJHHfiqRJf6MUN8BjtSjxekbdbbzel5oJKavfKccXcIQ7dblK4kqU1Q6D7Y/4NMynN
	B
X-Gm-Gg: ASbGncvWabZ7hf0cXQexG0myGhGqmJh63k+3mCAHFR8cSypb1E/GJV9KGKKaDPg1hZv
	voPTVdBVH/JcJBV70OT2oCXv/tv37rzvSWIEdxvu+EVx+GEvZKqILULOyJtYNk7OTpxZAOyd1fq
	iwliQhGBJH5r15PjtHzhUpQ3DzDN42PajfQHrFirO6iLQL5l+cDqtuE96BXvKXbJE7Nmzdq9C8p
	MtwX2B4wrEtvrt0QIgEqPftDo7yIiljPhFJ0KYk+6g5sfGaGvroBzV0Tw7uhqI7+lgw+Zgvhr80
	mcXwAyy5b0aApTtDdmbQIA0P2sgFr3udkbD/LewbW1ZkFYY48psoShdjCqH5fM8=
X-Google-Smtp-Source: AGHT+IGuakwp2z1XwyIAuX8ThV+BWCEbAlCZJtTCEONf7fbkwqui/HqUMuEEH8aKC8tcF1ckxlRG+g==
X-Received: by 2002:a05:600c:1d03:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-43ecf9c6b4dmr32207635e9.5.1743969038726;
        Sun, 06 Apr 2025 12:50:38 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:16 +0200
Subject: [PATCH 8/8] mfd: sprd-sc27xx: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-8-318e14bdba0a@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=800;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qgwnfNaPgh28TeCWIJFlF1vcUDQSOH8u0MAvqLNbbtw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr8FRvU4NEsoAsOgcLe3zTTZS29WOpDemdKF
 m5agwsbL+OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La/AAKCRDBN2bmhouD
 1+V8D/9bw6AbucxOFqt9SxfuI13mPt8OM4ZFDlD28s97deRQVFRBuCcm3n1hLVzcrh/gmdWJixt
 gtTWKJRgrERIXCi3fWQYvY9iAKVJ8n+uvFjezbq2j06b2inHMl0QBdeRoOj3sOOjYsjiEFJvK3J
 EGdEPy9Lbiyl4IAlL+vwRRtELP6JtDz2tS1dqr2SGPY4sBjbiK65vrnAemgRZV/zwGAM3hgwwHo
 3xv1FVpjI/ZuPUK4vq+NRwTQmC0kKc4HfGDf6eXwuuqGFgCfjXCYpi72FWhvGUttKZxEylCzCty
 k+iwgVm8ekNc5DDT888YnV3eAtQXeAwO6i7swy8tKjMXhC5EN17H+E1117BmCYCk0UV8MYA8NWU
 bEOZ2jRt13hbbZUv3IG6sJsKkz+MZAo0UK4CJZQV1K11FjC/BhA1jiE4UrXlPIK1FjAo6/SxZaO
 9uaA7YRQRbnchR0iA2Kj+FlGZf1vgo4/U79eKIHZS4pknWcbGhpewcthRiC59BJC1B2gJYlOm+9
 ELkoW8TuyGVIYJfpyUmNJre1d7BOnLpHNM4cC8I/zmmKfrEQtxcnuAtnOpeME62qq3mB/XGgI1G
 eGNoCC0sIn0F3L4VbKdBQdK6rOyvTJT4yK+BLV9DSHPcHwwAcgO8LGzQeNO8XEP6HcFcWD+meW3
 s2b2lyYFWl+LTNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/sprd-sc27xx-spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index 7186e2108108f0d779bfe72d476fa333194c23ca..d6b4350779e6aecfa19d9fa21b9174447d589e33 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -210,7 +210,10 @@ static int sprd_pmic_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	device_init_wakeup(&spi->dev, true);
+	ret = devm_device_init_wakeup(&spi->dev);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret, "Failed to init wakeup\n");
+
 	return 0;
 }
 

-- 
2.45.2

