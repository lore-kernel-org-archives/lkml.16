Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFFF2BE7D6
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842910; cv=none; b=SLtI8iq4nDFjEQo/PksK7V6BjwcaJw5UjUON9svbXYRlEIuw5m0ynV7jlo/TX1pEnD0kOH9Y4f2RHuvCeVhzTKASxe4+Gzb/8cd5rMH1scjZDuQgbiGYwuQTwCC55nx47alr7gOtAXKZxXRgOgqnZOtMopID4ZePOtvH/cqVqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842910; c=relaxed/simple;
	bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fck6qEbGdM+V4/tp/xskcPKgt0nwxfVbDkU9HvJ+t9JM3sN7EsIgr6aAUZrNdqYvEbBVlNaT3cje0Hz4RFeN3moAx1Tv4SrRrGZ4Y100Z/E9gqB3+x2y0hFMPYQP+ucWHHP9Af7i4CTcGPznOX2oiQJB3rt5RZYMwjUHMbwVHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4l3WZCcJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4l3WZCcJ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade5a0442dfso242906066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842907; x=1751447707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=4l3WZCcJUQZsb7YoW3qY4HX4BeJmjQ2e9BmvSP7DvoSr2YiXZ7Ccln60wxVihpNoeA
         KZbxjrJtFbUXcGRAaDqRqzuw9Zx1mRp6d15FZptaychRuwqtGE7QkhPoP7Of27SUuAs/
         pHWe9eNGxWrD3Sz+bTpB9uDNU2PMgflqeBZcPgWWzlgGIjBvmFJbqIdGCko49Zej+Imz
         f1TihDLU7tDZZIzbnkyh7W4t9HFkE4x64zIzg7jWAWOgWtEpQ0fSabryNmhxsh1ZIlre
         XUhs2jr0c5W5POEyfBn8vfxBHIxYhT0/k47V2v1YrZ9uZnml8oM8kiNanCoGSfTLnlS/
         FUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842907; x=1751447707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUNu7081NdSEDseAX1Y3e1QHYtmHZCwU3VvPUFRPHLM=;
        b=oD9536bpoC+1PGZ+uJyozSIXKYFhj9MVRgh6ULl5dF4X4Fu0dwdamjDO9AckrPT4q5
         LN5zmPvVTmLa7CbvhSHLOQHMLNZawENlqFm6f0e7fdv2iBbM15hFXEgFs7fXGWB7mJfZ
         RpMuooSo+DGqbhQm3pbXG1erub/FcpCZpnKPfe6kR9sDGBVoJ14LQWWBjQv91i31yefa
         +kNmv/cYXM746lau6TnRgWtBIwde3raWbZZDdlKZMKR3d3t2ZwPCCRF9mUDEsabNXGWI
         MKb/kb1BgeS3fj4joVuxwh/2f2zq0clmIG1eZvCRAmp/AmiitiU/pj5UGkh/7i5e8hL0
         0FEw==
X-Forwarded-Encrypted: i=1; AJvYcCVAw6v+iwnxXRF8xeycPDvL8jB9X8pZobRrQM9CxHKHrjvNiVB2rFoXEIUixKORvJSvNnt91Yb7c4mgA8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyugT/4SGgHv1kvZn6egsiymd6ZN7vNpmeq3evqJJqVJoibEPDJ
	ZJBdbFQDyil7QgMiJw/NdrL01SskrpdTNmglZllJ4kqTnjHbEUFeOmKeLeokMd6VB6I=
X-Gm-Gg: ASbGncvggtnkGvGLr/ktBTSxoQOVg9O96jmxHq2BS7FME2cH7PDXo35kZDGOQKH2UXW
	99dWJJommK1LVylsEPAJGIzArfIGo53qxdiM8ozp506qmiRr/d5M1pl7pM6GyojsBnJlh3cIfh6
	tZjsO8x+eLTA2NpL8p3ObvEwxZSgjtPje/LvS5T+0CxCkPo3qBlkZTLU4poBNHP6Q1k1jPFSEnV
	8kGh3c3OutN70Ghcs+5I2zrL09xDjtNracnbBvGSOfCgDVbJ4ZpC5r3YWRz0z2/0gDKlO3VXO/D
	F5dwdJstZk841lIqEJLSqFXi8kWKeel5caDI9Idmluo+R42PLRSfZeXJAdo5GkG+nqTLGxV6wYe
	YmwUuPeWh8zC6O3pHx3qFdrMK6okR0tR4
X-Google-Smtp-Source: AGHT+IEuwwPgZRVwpV0E5VzCi3XFCUhbcyDfrIuNNO6Kwzrn10Xq2xPkywwIm3YPQY5laniWK8XBgw==
X-Received: by 2002:a17:907:970b:b0:adb:4523:90b1 with SMTP id a640c23a62f3a-ae0bf01a47emr226738466b.23.1750842907077;
        Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:57 +0200
Subject: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1083;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ga1S1Xr1XwnMLdKu7zfWrQr/T730QEOJZ68b87o6lys=;
 b=8ytXcaweUPvgAlxdOOzwHq/Lo4rL98hebjV+yYGy27o+H8VskHWgSQLto1TFmtiLWV64CnvTb
 hsS6OQkxPVLDMP9wTarvkEDCDNQLNLFZx76E2jESFwtOG5cmMcEznGt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Support reading the FS Differential TX Output Resistance Tuning from
devicetree and writing the register, as required on some boards.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index d7493c2294ef23e37e484019a49ddf7b3d6a6a46..61594739e5b12706775622e1f76af6ad5d2d29bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -136,6 +136,9 @@ static int eusb2_repeater_init(struct phy *phy)
 	if (!of_property_read_u8(np, "qcom,tune-usb2-preem", &val))
 		regmap_write(regmap, base + EUSB2_TUNE_IUSB2, val);
 
+	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
+		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
+
 	/* Wait for status OK */
 	ret = regmap_read_poll_timeout(regmap, base + EUSB2_RPTR_STATUS, poll_val,
 				       poll_val & RPTR_OK, 10, 5);

-- 
2.50.0

