Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26822DF9F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564100; cv=none; b=sJH7LirFeD1+A+h11X6FPdL0Vh3TrMneV3wCOrYy+Hcvk0xJD61Cm6zv1agVHfBVUAQ5/8sg73t3BB8YtDomZMGYXEfuArmGL2MmIqNObtvYVdPng8/kb3pfjkDaDQ+Lly45nbpfvP2spOtHSknwttdx1Sb0aNQ+2LZ4OZjC/tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564100; c=relaxed/simple;
	bh=jLS7Rn37l0I57i+A6PVokEpsymKgkGfF6cm4lD25RxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFvlGhv9f1/5sVeaXqBm/wTsuAsniOs2HBSHC8yHzyy1B05NY0vDnXUeLNG+oHybv4U73R3WEN2fSt1GqSyH/2r1TVh3cVuFohCQ6h8kyi8bO+bou1oYZWhfHShaKAMle7wYGSZDX7rF6dpGr5U4fS2vMZEnIeeZLXrkHuVhqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sQHx28Vv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQHx28Vv"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391295490c8so164713f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745564097; x=1746168897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTSsO7EdxmxQHcqT3LqzMIJMqaJ+JWMx4Ep3FWXS7b4=;
        b=sQHx28Vv2bqIHf8hxU15lMzcWbn1hsSfGwEi0CLY1KRJ+DQITSthRCsewOjgyFQA4R
         lzijFOiAvIOEKLV9z2VInvAP9V3CUK3HhYtK2lCda+7yBhCvf5v56GHIIzHL6dmirNaP
         JeC5UInB45XKEKEYKj21WkJ1Zt6DfOe7jWS6Y2vXDvR7TXXaUMYc/WIAJDqdJ36iz754
         qXQLDjV8OcVfMqxJDRBwjkpF+ecxSQENUGqECAWEUqx7kpC5dba2FHNB1qchsTq72BrQ
         JNB0cXx2QOr3D47yKML6LCoDsnC2miOw50n4LSvSV/lz7O4f/Ve0oLdCxtHxCqbV0agJ
         aLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564097; x=1746168897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTSsO7EdxmxQHcqT3LqzMIJMqaJ+JWMx4Ep3FWXS7b4=;
        b=YPzHQIYUA0C1unFbI/Qly1NkIzE9HSy4uo2k+nj/ABjuo3udx/+uw+dWB1BnZzB4PF
         +4Ker0dLmMuqE+qqflrBXMQbPXzmWRbCq+Bdv4Fh6Ms+jtVbbSIhhRzO5PVqYl+9csdL
         1hRfnoAvCtxyDukN74yErQeGkJ7eAx6GYNRew2rpAvKYQcLbr/gkNj9iAqpZ6KpqOf1T
         aa9YL7uMtbHpI1BHXqb0fuS8jVS/wrqqI8uOl4tBrzA4N4olYy1ZY1IIaYMse1DRpz3o
         7SOI0LSEaan4E76sFyLdq3NyF/yV95CCScA1KxWnRUiPIz7uF3oJi/W+e7d78roAy48m
         Zh+g==
X-Gm-Message-State: AOJu0YwUKARTti14TrQFRcJbEKV05fRwiz/we13jjK0LHSsvvw0GUaC0
	X9msuKAamMORIPD4W7H2xMTZa7sYQPNUZMtiUDMCrao4mfN1bJF4OPCWShkiv/I=
X-Gm-Gg: ASbGncsuQ9xPgYI0/vVtzwGlAlol/2Jg3wCjAIuThxYzkwyXiDcF0CZtn7Z3g5DKSxM
	CT3GrbE1lgCbuoPF04+MFWK3w107ae2YbNrrdo54MxSZArvwtSWnJWvnifFx4LY7hXExLtqu6dY
	QKoIGDkZHzHQCV27j+oenLIXpvaJcSv/oqtPhRUqc/NssCPPxHeI52DeDFfpkBXk8rTV3NBSCwx
	yXqwtQzTqtA8tt2v5aO1xtYxHmz4RPJpxWQKVy09ubYHDiFYGu5MVK2O8YK+rDX0cT7BqnQDNLl
	hvsfsmkPcVFD6KGGCT8e95gEWlUergtr9fZ+GooHIQ6xVl/ueLhqKzHaHww=
X-Google-Smtp-Source: AGHT+IHUhFrXADwbxP1ijpRv/SdrvgrZ/PxGAe9LD9ZxPOb9+7WGpMe1rZUUPA4R+DVsS0Iv5xvU2w==
X-Received: by 2002:a05:600c:5029:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-440a65e5d52mr3146505e9.3.1745564096861;
        Thu, 24 Apr 2025 23:54:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm14369405e9.7.2025.04.24.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 23:54:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 25 Apr 2025 08:54:40 +0200
Subject: [PATCH 4/5] cdx: controller: Do not open-code
 module_platform_driver()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-cdx-clean-v1-4-ea2002dd400d@linaro.org>
References: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
In-Reply-To: <20250425-cdx-clean-v1-0-ea2002dd400d@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jLS7Rn37l0I57i+A6PVokEpsymKgkGfF6cm4lD25RxQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCzG4R+gt7kKDTkZx58fTW8MDc/3N1t6D+Yv4R
 L13mGEtNhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAsxuAAKCRDBN2bmhouD
 12uND/480mtExWwsyomBhojqIto++cWVOo852wA4lcS8BNoiSr46s/I+Ruze3cdoaEBf9iRrsLi
 t+eLKUXTdwTzrEdP3hTNL9EbL3Rjv6TYuAeKTAo9wzNDbV0uHc81PDbE/kQsk/WBG16dqieKB/C
 VyMrBE5yUThmy0Cce8jIJ7SIVCohpXFjpw9XEfOOctzPiwtOrqEpYuN3RYgNOWJ7sLeKcbsS+zk
 x7oc+MtxkZzwi7885tmhyg7c1svwgFxuwz6x8UFYcCUpNYqF2L9OQ/yIKAtFYEytp5FcgW3DHd/
 y1iwjM3M9CCxsxIkmdJV0L/hgBKBxvgq3Xq7JgK0ly8wV/3yMRG5pkCZj/KsArr37lvODhb6ql2
 kH3CfAp/JyFI2O/Vx3UzPsD+6Xqe+7sH9hrjNYsL/Emwll/ZinAfADohvrePIXc7iTzCwU8vN25
 K39JRNY592VAWkTEHHaD4NzFQ+BOKvMoxEETDt9lA86nsP8kkrRh+P/wGRKMJOOYlm9P6JtReno
 Qu2yFvbnCqW1XCm2FBlzgSncx8pemiL4mQIzzkFXdGP79LS4ThQmnMzvLSsfi14KSJx07Ajd7xu
 CQHKasHQvRfKrCZ0OU3J7hct3RyTrycDgap6xvzqFHMcaqZpDwLi79zBqAr/BLf2gdr780h9uRY
 pGCtmxifD72RlMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace standard platform_driver_register() boilerplate with
module_platform_driver() to make code smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/controller/cdx_controller.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index fce90926d3378ae60166426cbf8e4a4fe014af86..fca83141e3e66e68e6916077833db2b7d816395f 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -243,31 +243,13 @@ MODULE_DEVICE_TABLE(of, cdx_match_table);
 static struct platform_driver cdx_pdriver = {
 	.driver = {
 		   .name = "cdx-controller",
-		   .pm = NULL,
 		   .of_match_table = cdx_match_table,
 		   },
 	.probe = xlnx_cdx_probe,
 	.remove = xlnx_cdx_remove,
 };
 
-static int __init cdx_controller_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&cdx_pdriver);
-	if (ret)
-		pr_err("platform_driver_register() failed: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit cdx_controller_exit(void)
-{
-	platform_driver_unregister(&cdx_pdriver);
-}
-
-module_init(cdx_controller_init);
-module_exit(cdx_controller_exit);
+module_platform_driver(cdx_pdriver);
 
 MODULE_AUTHOR("AMD Inc.");
 MODULE_DESCRIPTION("CDX controller for AMD devices");

-- 
2.45.2

