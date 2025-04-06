Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D021E0AD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969040; cv=none; b=AhEXQC6pjIutxn01aKAEMmp2fqHEGTRRorI3V4HW6r/n4sRzpq/J5CdzofBlheTUNtH1okwpa8tNhFNEMunWFB6dGjed6/EkImhEM2UOKlsn/Kf592Y8zNMQXEsLPNuwCKzguuvoWsNI0iqgk8MILZhuEdL0f/vLJfnBchhlOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969040; c=relaxed/simple;
	bh=PqhR2u/yGxy/oelp6gW7dR/9DhcPRUQZkAsbiQsmD60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U7wGXdTW2lhL54jcT/Z/OG3veyzX2j2NPlYFMOSCHDHlrVij6aux+yeNI+u5wpDftT/XECkMV+IDCxZiTZgDa20f5Zpy39qyiyC+wLHQuH/ridK4ZFS8bsoU2kyVr7L7oQ7e0EAiYAzJvzQ8bsbKED1Gey7GHGgZURVzQ272Ujw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqKGMdQM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqKGMdQM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3815915e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743969037; x=1744573837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJd1xPX19vqrxzx7wek489USM3/BRbbH7R9o+Cf1Fms=;
        b=RqKGMdQMpiL250FP6CBC+lfYDJ4H1sM0XVkPjPkyE93hUUdOmd/MAdYS32961nuZBo
         DDiBpXmUlm0xypPDmuQgKu400bj3ucj000hmkgqvWUWuVAaRTpyT1CbKUuNvn5xeFLzt
         9lubYX+6Xn0Ewm37jVWlF2PeQFexHhm1Y55r9xQLYw0k7tnTa9UeBMkzojr6VP7+DC9I
         hQ3YKgMbz0DeM80vh9HvulnXTFq5ZuNw4kT/LfLEiqdNUiTAz0Ao06ml43AhBPRH09NI
         dDCsIlFSlhCTwsTtwm764Zbz3a54FE/QOf7Xf0loD28EWwusjg3vDCfkUhw5DjjKRMbs
         qcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969037; x=1744573837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJd1xPX19vqrxzx7wek489USM3/BRbbH7R9o+Cf1Fms=;
        b=iMrgrJGIQLG5/L3CXpujDHr5z7Q2pr7TZmTozyRxRIIUUWDOktruRb4gS92pSTZRjy
         xtTksmlKrDf6hOn8xyuIWswgK6UruHGSd1W7COPyNFnUQT9r+7S8Xn65cuIUxiepNRuu
         ZGctd1LTu7D3VEaYFQcktfJigYSt7fCc5rYEr3ql5j5hd3ukZq4IQniNZH2if/RoqoWl
         o7/j0Gj5soZ55zk7BqZMLUZ4lGd7KCjFdKctwBc0TFdJsGWOxnYjLG8zm9WCFGMnDKNR
         8Fmx1uI0KjbyriQGZwtTcrUMzUqqVzyTsljsKQdG04109mwL29AazaRNPTIQ2S3lCul4
         32Ig==
X-Gm-Message-State: AOJu0YzE4H1K0NMCGzY3NK628bz+vG9cjZ+L03BlsFGJ5Z/dRGMyOSZN
	VuEZhOQQuCHRFwcniEzC3ZCnYcxcZPGHoYMKdmop8t6DOrraMQ8ZjtHInkxxh7I=
X-Gm-Gg: ASbGnct0iR9ZTvvaTlgtXW2wtCvdJ15CKIB1yZxlL6AAV7Pk9oRc47jq1k+OIKHs5VR
	PkfSc37k6D3x/e5fhV7vtYjfy2cFTB9Av1SPxyB8FTNU9rWfTiPcsBNoZ4DEIar6+9141yyw5GA
	FPnV1QRvUS4m+qS6lD9so+ZMZYMFxCQRjypliAxquJZqXqS4DOwvRpSNRDzmPeIc1iUFR1Ulpdp
	vNjOA9hgVIVwK6/A2GBOi5HWXnSKgW+KUW1O4esdZeUVP3ZaBeTx643WVr4dKe/XLF7Cf9Iu8iI
	nBZzxn7ko5Gow/0BMqEs9abtDMr8Yv7EeEpKDmEn0Jy6c/wyRtiXE4ZZCOgDH+M=
X-Google-Smtp-Source: AGHT+IFdEF2v1BVmlavYslv7/3zMmZ34jleJS3IPAfEVH6nOf1Gy3bjd13qv8AM40K43+6NpvPAFfw==
X-Received: by 2002:a05:6000:290a:b0:39c:1258:2c32 with SMTP id ffacd0b85a97d-39cba94c47emr2834985f8f.16.1743969037290;
        Sun, 06 Apr 2025 12:50:37 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm10053842f8f.43.2025.04.06.12.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:50:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 21:50:15 +0200
Subject: [PATCH 7/8] mfd: rt5033: Fix wakeup source leaks on device unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-mfd-device-wakekup-leak-v1-7-318e14bdba0a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PqhR2u/yGxy/oelp6gW7dR/9DhcPRUQZkAsbiQsmD60=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8tr7icFakcAhetNxA5r8+JC00HGpkyg1FxX/V
 AYjtqQZfFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/La+wAKCRDBN2bmhouD
 14RWD/9yQ89eWw/K9bGHYd+h1MoJxTjk0W/WdnU2u8pJI5HmzwLMmRLd1OPRbrbhBaSiGVVUO4P
 b7/aTFBUBzmVeM4si4BNYv1zOk55DMh6Kzic4ZfDCs5fX+2fzhBuAw25X0ab0j1p2kduMRRtlZH
 mkN0G2cdEZpDiRpnA3BDxhcrb3HGe+IVS0kLJgx4N6/xPWW1MSqtYg6fokFJXgxETOq3bQuzmdB
 efxtc67W2glqmLcRs60txPvwnJdzGctNUCEbS9kASkac/UF1LVVJMgqCDi5PHRM4dk7THOzWIlE
 Tr2n5UaQHH+HZ3xN8FQyYo4+JWVKZ2C7c555M5Ap+L/3un9hOPlklF0syDDmtzfwfJCTNtFXiDz
 YKTMnyORw8gPmRdkJV23iFnTc55m3lc66S99kOjOGmXfruXthbP5i07TKUre9Wr9iZeT16CAa4T
 MndA1f0FjM8DpQs2BnPCulttg11jT3wSB2B0c+wRqpIBYPAyD46N2vXnkVmza5pMaA2JylzonC8
 AVDE2vAqHh6IrYXwgV7LwXTo/ySP3cW2s4H/na2yrgnDcLbXPcffXmzvcV78rGm4oImBHft5pyi
 6intRO9dZExukyQ4HYqkuTQ37Ganzao5hEYdgHOQ526xqKfv6UIp6bwywi6aATwQw/pwoZ6sIL0
 nfgohLpV/PlDYgg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/rt5033.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index 84ebc96f58e48d3b55abab75d64efde2fdb02f66..2204bf1c5a51a864b1ca2cb1be45272d65630d15 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -98,7 +98,11 @@ static int rt5033_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	device_init_wakeup(rt5033->dev, rt5033->wakeup);
+	if (rt5033->wakeup) {
+		ret = devm_device_init_wakeup(rt5033->dev);
+		if (ret)
+			return dev_err_probe(rt5033->dev, ret, "Failed to init wakeup\n");
+	}
 
 	return 0;
 }

-- 
2.45.2

