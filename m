Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740F1F2392;
	Fri, 31 Jan 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738347243; cv=none; b=TFCsSvRSkBRDVKaKYVBZdf4uZlNSZaIlTaf4Z1DnpszUt2yYq3RZICQvQSMny8aMw541daA4lb6EcI1GHXqlWnWYcnkrKVwi/8Cyh1YX+ooFQsX64NrqT85Bytiv+we+Nm2kWPE7AhOTxwLmUeb1MP4rDRFppg/XIh8yhNLjzXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738347243; c=relaxed/simple;
	bh=xyJ65tKgVjwJHrbcCu1WkIZ9H5kiHix8wXr8hmS3z5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PmtcJVKaBZQlZdaHY3KO6I2AfAst68W6WIWVd5B6vV90WsDhZWjZMeIMCX7WYDgJ0HROs3iCpp1torReMFKITuz+y3sovvVlCIuEiY0nmLIPKrAPkmM4lczxu4ESuiGkBH0WGl9WxWlRDvxF7yYlnri2s69qkW1ROUhz5rmEmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDLuWDRP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDLuWDRP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so3822253a12.1;
        Fri, 31 Jan 2025 10:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347240; x=1738952040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NVDC1BCd9AWkrJth6d12FQxmu1lidyDRyNXZVkh74A=;
        b=VDLuWDRPuDqKv654l2bP4RaSeY0VS8qk3qoyGTHyEhtyPfvQW5NGC0MuKcjDFip13B
         XrWX1tc4wpEthgN11J9uYQ2WuPC3992n8yAsKFZNWYnGtyBmLW0/YM2IAZfq8IFXrkl0
         daedcmy/m8MZbBRo9+o4ce1WtSEInjIHWDiIYdFKCi7dHTN0RzXxE7boK/3OQqwTOwR0
         WQmhREIw82OlLEjUc2ZggDbC88SnAzGNCViA4ih0eAsyk/RTEpRqh0Hxd42QT/pMYkso
         oMZBLJrNj5D5Kv+Bx8dxe59nSCr47/yfPMAKOTvopeAndfaMUIqwB9Rpq22p9Ll3Gjtf
         wA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347240; x=1738952040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NVDC1BCd9AWkrJth6d12FQxmu1lidyDRyNXZVkh74A=;
        b=A4/gxcsG6mnMqgHR2oPMq8+IiXRdfKYFUoi3P4X9WxrdcxNGJXwL6eJ2g9Vukm+C0H
         BSUQbuxNnUPvQgnvLDKcTTN/q0G4sAdO7H1med6j5rxB6sU+0ss9Q05R2w76kLBHWfO3
         jH5mTsR9dPdK8HauOI7sl+9ZY4/OFAoar19hVeRIV8fQPreg7LG9dPpInpoEzPgugX9G
         B9KVCIzBaN1jeWibhLxmWyIBcUT4WoMJ9U75rYRCRztSUcU/VQXLKaIZ4MUbWQ1aXArz
         wvIJ2W+5pfnUfUL3IbJCvt6ZfjTBFNbY47isAn0RKVBwSL1b97gJBjEZZtmuNLpDt7K+
         bFiw==
X-Forwarded-Encrypted: i=1; AJvYcCVv2qwpveKnUqodTdLXZMUVUdiSRdWaVnZBYUAEKbvUhF/LtiSa75F4r0wpaf6cr9Ku2G+4UPRcIwsfhqln@vger.kernel.org, AJvYcCXXmjprQCuWJ18kMSHzDjZ9a9mYvOqpt9Ye7XJogngOXP7/Fs12QcqvKRZrnh772KIDDprRgoDM6CpO@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXK6Vzd2NdX86ORad4FnxnU1XMX/KY/q87O/Onbi2Jqb2Nq28
	a2PR63pktwYENC3V7RkdpELIty4HCaM9J92HkBcyOXHOMpuhYm6RAeff8A==
X-Gm-Gg: ASbGncsxKD4EZO9/3hMvdpAT3mN7yRbumDvAT5eCLZg2BRLxSncLCOyeQOdKm4JRU/L
	Iq8O44cKknOJafJ0asFyLSklP2CXajfGjnPzGXNaKDQE7u5S0J0gkdA6RIFPQSlZqnB1R1XSX80
	zAu3Df0C2r/c54qlG5z4AZzXdDtqU25VxOwyKacN0a1Dz07WHc4dJm/sx5ldRGv/qnIHDxjCyvb
	3bBUaQ2QLlMm0VkPLHh7eLkZ3voGQvS1pVBSFOyReWgPB06v9UE2Os5ht9OzOKAZ5CZgaf5NRCH
	HKbEsGiTbm/qhGsEnDgOQpL8295EZc867C5hehtQcTCbG/E4FcZg8x2PDb7xDQ==
X-Google-Smtp-Source: AGHT+IGPJ4/jeRlYVMHKjrZ+UIzlTobg/nm/rOXX+d6UQMedpWf7FGYvaugsiKHBtsVbv1M642DRVQ==
X-Received: by 2002:a05:6402:3589:b0:5dc:6c1:816c with SMTP id 4fb4d7f45d1cf-5dc5efa8ee0mr11648178a12.1.1738347240018;
        Fri, 31 Jan 2025 10:14:00 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:59 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:52 +0100
Subject: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=2247;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xyJ65tKgVjwJHrbcCu1WkIZ9H5kiHix8wXr8hmS3z5Q=;
 b=NFYiDgcC/zL0sAIKvme5gI0kNx29A+DdsA9eTtYWlzcRLUIWrq9TQ7ynUsSAkepeZ8ptUqIGL
 VPpe6VmFv/ABoQ+jZl4f5Bf11K0Ghyy1JUI8P3GHRAZSgsI/FPMMThG
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

The BCM59056 supported by the bcm590xx driver is similar to the
BCM59054 MFD. Add a compatible for it in the driver, in preparation
for extending support of this chip in the bcm590xx regulator driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Fix compilation warning about device_type pointer cast type
- Name the device types enum and use it as the type in the MFD struct
---
 drivers/mfd/bcm590xx.c       | 6 +++++-
 include/linux/mfd/bcm590xx.h | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 	bcm590xx->dev = &i2c_pri->dev;
 	bcm590xx->i2c_pri = i2c_pri;
 
+	bcm590xx->device_type = \
+			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
+
 	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
 						 &bcm590xx_regmap_config_pri);
 	if (IS_ERR(bcm590xx->regmap_pri)) {
@@ -91,7 +94,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
 }
 
 static const struct of_device_id bcm590xx_of_match[] = {
-	{ .compatible = "brcm,bcm59056" },
+	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
+	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
index 6b8791da6119b22514447bf1572238b71c8b0e97..b76fb57bf0dd17d51580e93db58ece4a4d6dc5e4 100644
--- a/include/linux/mfd/bcm590xx.h
+++ b/include/linux/mfd/bcm590xx.h
@@ -13,12 +13,19 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 
+/* device types */
+enum bcm590xx_device_type {
+	BCM59054_TYPE,
+	BCM59056_TYPE,
+};
+
 /* max register address */
 #define BCM590XX_MAX_REGISTER_PRI	0xe7
 #define BCM590XX_MAX_REGISTER_SEC	0xf0
 
 struct bcm590xx {
 	struct device *dev;
+	enum bcm590xx_device_type device_type;
 	struct i2c_client *i2c_pri;
 	struct i2c_client *i2c_sec;
 	struct regmap *regmap_pri;

-- 
2.48.1

