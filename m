Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB71A5B8E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971258; cv=none; b=uU6YyKtpJVZ0ZKeio5HisyD+21eXUASXil67pB4bkmSLw5ftcrkwNYZaHQpfwJxYO7ncnkdsOmgTq4IvHJ/tdwwg1lZ024iff7NwbsihhwCH3BWjMyuaEYmj4QoIRSkhGMCs+tzVGNnD9uomPMXXLRcTkHK2uA+AUwy0eGu0+Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971258; c=relaxed/simple;
	bh=jplvHvGl30e07hKf9/3qdUUYwxMmtiNSbU6HW3csuuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8uEme2Wg7Z+wF+kWulsvK4N1tMI1teBrl6cZnqpsVSfGt3JTnceFVVERp6Hg933+d3gwERYPNwyMm+7lkDuuk10dEYkk6nZZ4OdnzjudCOzxa5NtG7GzhVLUJu4RtbkJ124FtZt4BS7RmAtXMXk0qRi6edgFYiUjG221a8xf+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FB6H0U0o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FB6H0U0o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so2178665e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971255; x=1744576055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTRHCroqU6G8v0HJ3YcuO4l6Qf+wdw60CAB5xH0Xlog=;
        b=FB6H0U0oJ6diFEBkQbBlUHKH3awvdFuyg4nImcx/TqUkGzu2LpFPjOiRhXDb8pIQ9q
         1SO3yuQ+VwXZkFz3KAn+S/s8XmvwgQvDm6y+rq6NKONmi0le8Y2kTzOaLURJjMDPt19U
         y2dt+GlHFL66f/rz7OHXU35yEP2/p87mw9vhVLu1SLkRkK0NRrxhQDvtHDe2w0zg7DHQ
         wTRz6915bsJyxt5sNS5SJPWWUZ5NVSSi+0qLhVO5JVUdUfg/ZfS1S0GJYSUlPn0Y7pJH
         AHs2qawgUj7ED2V7d55hEQqwhyV/MOUSLlo6W59qi5/lNuAsf3sIvIMXCPOCwMMueIlG
         OZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971255; x=1744576055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTRHCroqU6G8v0HJ3YcuO4l6Qf+wdw60CAB5xH0Xlog=;
        b=fywzZRK4nAL6YSkxW3exdr1DO8YJznY2yzlx3kFu3xSyA1cRvLz4I4ADLpDJvj7OxY
         hoDJ7wiYo694FTzG//mckvyEPJ+h2d0D+9UgCR62zb6KLAjCasvgRaaAt1m2hkr2VCfG
         gqRhLFC/ZOZ/Ol8a6ZLTIOuAw5gjJ+sMtpnZ4r3bOQbrvQZ1ECQY2s86lYEOvDm9oFxY
         9NBsYfY/HX+B8X7hscCu5S9egQCJBlIy6zxJbS1bLswrdb0+nGsCZWeYSzl3gqNfASrq
         DpFo9WANRAh9dLKjOdR5w+FBKanPdTustCgInoWZFtxe9sIXaSNNvdI0JLit6vTI1Tv3
         ggRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLI9jzfO5bFjtcAFJ0bfAyKH/VVacwSGBkEnjujhod3lLlrDMNZx0iheP1z0zO88vxWJu8XwhQKCKT3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCjHx/UWVEtVMj7BM5fUsNqv0gvvNraWngt0yRlHvQqOT44kV8
	+fZ/HyRHIuMr+QkNV4AdhPHbZKXxMm52AoHaxoGB6dAD3nE5MhuHLxz62yh9ais=
X-Gm-Gg: ASbGncu5uj2OpuY6Lidraqf3HqOfR3WnpOZ0z0Our6GZRdOGn57wM4SFz7WebgPwWlO
	BTttDnRxM35XtvPqx/Zkm1xqq3X/7rJs/eknsa16f5KLvQygkvXXzdSdJ780eKd6vgseqXBJpbV
	EMlDWtxAAZCGWLpTJyDCdlu7ThWvArJ8uO2d4L8JK3lSvB3nBA8HlFrZvPRWuZyQXmSN50MsSZD
	e2w9UFjIbTQRuIVShjStVS3lRLm5erEie36O+OQhaDXeU/f87Y+c0Hs9w/MxvqbDeGy3N2F1Inj
	uyMBX5eb5Wq7PdoQOJ9rFciruRhChiAXmXV7gRsYmJWlYnvAEf3hmQ==
X-Google-Smtp-Source: AGHT+IHBPZmuSi77aH/gtx5jaiOFfnhyy6YC06F36BleT4GspLq39QjbR1wa4JPuEuq7P8cBwX2+Vg==
X-Received: by 2002:a05:600c:5247:b0:43b:c228:1ee0 with SMTP id 5b1f17b1804b1-43ecfa45bcfmr35267165e9.7.1743971254779;
        Sun, 06 Apr 2025 13:27:34 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663053sm112207355e9.15.2025.04.06.13.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:27:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] power: supply: gpio-charger: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:27:30 +0200
Message-ID: <20250406202730.55096-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202730.55096-1-krzysztof.kozlowski@linaro.org>
References: <20250406202730.55096-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/supply/gpio-charger.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/gpio-charger.c b/drivers/power/supply/gpio-charger.c
index 1dfd5b0cb30d..1b2da9b5fb65 100644
--- a/drivers/power/supply/gpio-charger.c
+++ b/drivers/power/supply/gpio-charger.c
@@ -366,7 +366,9 @@ static int gpio_charger_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio_charger);
 
-	device_init_wakeup(dev, 1);
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init wakeup\n");
 
 	return 0;
 }
-- 
2.45.2

