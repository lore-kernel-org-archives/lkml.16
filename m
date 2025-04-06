Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815C1A0B0E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969030; cv=none; b=ES8zI7k+GR/WR7Pw8f0i4B/COgPOEqaOR42jF2m6agNafsKMYpZlgg1+LtTiEdMwmxR2/Q4oKxHag+FE+OJzftJ1BMuPDZQQqEkMzuOW01+LMKBXdotJ+lL3CYbxABi0RuoSVEIc3SMTNq1knAxVIRpscFofgBhVPLc9l6Eql7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969030; c=relaxed/simple;
	bh=lVX9gDSjYyL88HlwbYeVCE4D3bdTh5t0UN2VPaWosuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fti3cp6uTfY32mQVoDO536Q3AQJZhtsTzR29MtnJncsXSHWNqCQxMuCLaLD6BOVTg+DKsoo22cljZoF/0XLXGJvocVwp9bScA/+nw7aGm044GV3H7fFR4d6uEerR5pe8Pklh04SJlLV6XELn7+errCFiG7BnYAz+0yt8bBoJ7ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Goh28jVq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Goh28jVq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ab85402c9so447209f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969027; x=1744573827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYyOGvMtr2olklUFal7Pv6grs8vJ7iFTWyWW2GDk7oM=;
        b=Goh28jVq2cZWV/dfH/PVF+aTGpZabIhIHuTZb0rtfwMFwCwkYJb1AMGamYPCAP6WRl
         RWTbaBMrsX52kKNu/5YGQ89wB4TgAzICF+9ua8JOLKv5iGFKqiGylDfoIjWG/4Yp6v9G
         Gdtsctdd90z6VWJ1k5RKSjaHiooKM8Tnxz38AwckY7jmGtTW55e6vo7msxM69p0XTUxZ
         toopDDX6Lj/U1YCXELcB+q5Szt4OyWBDQV3/a6D6wzs+D4lxgr6Z7zImQywx7Obkr+wA
         yfyDMDgsMRbFsSUadiVlHE/MZrHkw5v5wX3hWC7ssUnbSEm+TlTWMRhULDlap0xoJtE8
         WzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969027; x=1744573827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYyOGvMtr2olklUFal7Pv6grs8vJ7iFTWyWW2GDk7oM=;
        b=MEj6eqHUslD1KiiBtHMF138qC9+hNbWAmk5JpCXyBNWlMbaPe4x70z5wfDj/tRNFNl
         3UDHbqI24bwazeT4Ythe2anoEqrSSClii5EQ2R+SUNJBq+o+8ZL0unmCKq316kX1gGRw
         ZIppGVyPCQimTR8aqWR7iPv726f42ye34uthfI55p1nAq5n7rLrMrcutBOp1XsM5QsQ2
         SaBAehDY5JJZhtG+t7WKw0pwvFCeyL2NaRPdy7uYGR/gHiySvC8EKCFouGBzP8S2DDES
         ffjHS0S6HSpKcSqbyDYP7nKM+Ra2S9315HJ0G1/mUKrIISp8dFXojyDo9JfI0civJMfg
         VrSQ==
X-Gm-Message-State: AOJu0YxeFbDR4uo5UX7QVE/u2iYehwm0JGxOAxyqv8NCCdnETVE2Wrf5
	DtpHGDRtBFtMfPnccX8fT/ohvmbKsA0A46AMTPkGEn+8hZ67TQivzt4Apgjadms=
X-Gm-Gg: ASbGncsb9hcTEqcShf1Pro1fKxq7oM7by28eLA6fPs1OGeh32Gu3iUiHMbkqhUvbqsP
	QExPkD4Ngg740S6a/yCoRWwAbIiRAx3+cZoL8Q21MF8S08O1skllygWvPmX5Db6c38U2Owk/ZDF
	2RDkHETeykAtkWEbmBmdxQU8SCIicyEJ6/TPUZvxV+jAXIFHmbnQ+A/9Lm2mivY3lzeexBHbljs
	UU9qGcfB9vjG6UPty+rBLbr4cxYYcTRs17LFZJl/yOmkk45nwrInYxiML+JkfpX4DGJyGejVW9B
	R9uzqrLHDu+pJ43jZUAW26Gv6jsRmqF9pM589xq56Z+LvZqlzG0mkmxLHex6aMU=
X-Google-Smtp-Source: AGHT+IEBtWLQ26wYm2Ac+98+IMKLTggihCv9ZU5gkzhyVxSqqSeYKxF5OfHc/JdpLP7+LJk1jY7Y+w==
X-Received: by 2002:a05:600c:1c93:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-43ecfa02814mr28929145e9.5.1743969026724;
        Sun, 06 Apr 2025 12:50:26 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:09 +0200
Subject: [PATCH 1/8] mfd: 88pm886: Fix wakeup source leaks on device unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-1-318e14bdba0a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lVX9gDSjYyL88HlwbYeVCE4D3bdTh5t0UN2VPaWosuA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr2LtIrIdHB+r6kobp+0sfhyJbSMSHY/XE8U
 9IcObbOqwyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La9gAKCRDBN2bmhouD
 14sBD/9EMepXnRWheaplHT4ZK75kU0fzxj/I2Idpgbx8/Q3nTfoP+dbDnNcl6ohNvEseyJsKSps
 FVqXnHZqcEQAYgZm+N+HN7hZAUq5Ypt8efm2Y6EEUXSramp1aEhY4inEkY9/7Fd8m08b3feUQFS
 snfER9dwXFmqDEh6mF56M9p2yHhuV1Dm2lscNQ/rI7NpxDzQrESR0a3Gb+uUWpSt+u9fK0qKcjZ
 9kfIbKKssVMdQ8wSdt5yPvgb/+YWVXYY03S+1Ba1wjXR6dDlAzTUB8PKVV46uvYjaH2a5zofVx/
 JXcxbyxGDcjtlD6CaJZW86GxcM8ZGUWr+fHFGssQIPLt4siC6H+tEmTSEluCT4dR42HgH8YO4qo
 RTXxP1yxtxHNBTxUURjt+aa53PAFmM3lA20BAM45nJSPmubmrSh5VYZ26pxPdie1hhNIfdJx7K5
 KS3frXk+Ose7ODDJoRawQxwgNF3g6LNHoMw0cHt4lqt3LGbDeyYVmwyqcK4WLGrv753nA8kOGFH
 0R8cknJLdybh+vBH5dWdsH3Sz7Qbr/ugexrt390iemyqtoQrwkfe6HfAgE4y5H1Jq1CCTQTHog5
 bRnh28wbb7bfW0xTYcjc0hSOoSYKjnfmuJtpTnhyBpt47ckgWDd1zLmgzA1QKlDg6c5OjPnIY/c
 svRye6jKd4pf8Sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/88pm886.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index 891fdce5d8c12474e5e01152ca5fec8c88470b63..177878aa32f86eb59705ba6a1205eea43142d920 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -124,7 +124,11 @@ static int pm886_probe(struct i2c_client *client)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to register power off handler\n");
 
-	device_init_wakeup(dev, device_property_read_bool(dev, "wakeup-source"));
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		err = devm_device_init_wakeup(dev);
+		if (err)
+			return dev_err_probe(dev, err, "Failed to init wakeup\n");
+	}
 
 	return 0;
 }

-- 
2.45.2

