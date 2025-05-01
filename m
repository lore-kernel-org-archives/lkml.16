Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA620C49E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117442; cv=none; b=FL/zVRFYeHGfAkL1ClyM/hw+TvcdUKC7Z627t2KH2ZWp3iW+BOLaYPXZlfoW6LUwDyiuJiIhpVAhU+Yt8iepIk8GTRu/borQyAR/vralZ1UU2K8wE75jaWoOBqMkp0pcq0z7pMOwvQNU0RUqPQhzE2J5nEHwQqAXrsGYuv30dF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117442; c=relaxed/simple;
	bh=5iZ+1LBZMer+pZpH3XZWHbsSvLh2Yz7gnxpvLUEV64s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkmOT+6DPpSBE+F3+1nv/oeNubCd5SFyjnfGJN0kOGlv2SrzO65Q9O4YzS9K/uuPTx+J1C2lTTf/mUtfTSFQvkJ0WxbfXWArsoXwWixhey2nzreFcq6ZP+i5Mp71OAtod1DOzX22g1GSp00Qo0Ds/7FaBuELb91ALjIVhGy7pBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvNbspGU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvNbspGU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf861f936so2103635e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117438; x=1746722238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8lqK6tfVd59vX3pywJVYOhORRQne8XIPVi9Jx6VDF0=;
        b=zvNbspGUErfIT0o+7vV7+amfIWACmGOaAj19HMu5DFsK921zljbZMQK0cIUQBEtaQU
         ys3wH0qs8BnBtRfi/EkpUdi/BKIdQ344G0ntz97xUUyPS4U9JavgCLOVfMDC62LvkLYM
         PhUKfyOctaU1skym+mdA53gdXm5bUie1pfuqh+qSA9BiPgbe1tTVm0SKTCTcy7kO3Ylh
         WEf+kLQslU7W71DPz3+ykf1qLnm6MxZZCK9iABINPU6QeEOurOi8M+Ve0MUFJYnuXE66
         eJDCIexKkXdRgklmgr8zPFMW9GY+vGMYoTyoOJdt501e5vja7wnoDSpd8ys3SAQ6r0dr
         418g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117438; x=1746722238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8lqK6tfVd59vX3pywJVYOhORRQne8XIPVi9Jx6VDF0=;
        b=GVHIMJooksdf139R0tiv3Sjh/KJh3VZN3w0UAXg+KU1r1RwDBx0y+beZokPPRnpPyv
         G1AlwcqrmAROV1+axviZWvRhth4ehpqwgHJLXTlJwSTjPrqxRyTnobiNSlqZmlnWnu3k
         0w+qlUkOBXBqGSJBy3qgqw+cMZ2qmX4g7BIVQamxRibz6p50fOJGwfZvf7/HoDEXbrpQ
         3mo2MuNkyX8aMd05NokWu24iXdPcRaoP63Iv6l9mGJwJoNGKPuBHWW4DHM6fLRBDnjTu
         j5HI3tLalB43VAWxBGluwXGMP8zA8GpULu23cQfJVMr6Yp/4k25URrsCIoXdWQ12j9n3
         JO8w==
X-Forwarded-Encrypted: i=1; AJvYcCUQ77py0escLaLKrRNmticry6CO6EFPLFf1HqeFOjmHzna9hK0OOCsqWQjjUOhrUeXXKy/YrMMnD9XdzE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMUZ1Uiwrbv2LMWZs8u34JlhvJbpFfmecpeSm5f7esDHwNuQ7
	Owaf//AgGnnnleuDgHWSAOC5VH0yR+divUYE8iuqUd42LizLnsTLxnrQtbal+JM=
X-Gm-Gg: ASbGnctqg0y7fkTCRJDtIBJ7KM9m6J+aKmx+m57y7Y2AyQh++0un4EiPXE7it0fyN6f
	KEjmz0nYqGChXvXl6CwrvpJFI8GFgb1wf6m2LhCYg6ILyWPSzVNSFNNBCk/KgCPLQ6viK4VtgSq
	jFgG52UQDZAqWZ55jm4yqo04WY4spcq3ycoDeeC2hSEPmwVG0eROfUPFG7AH1zDrwY2tnUqAWks
	ECYHI5RQlvBko8zAej9erT9upWyEp21HMoACgIcTAAe+dsKIdRZ3YHY0HyCdnAJO4sf4aDB76/s
	OoCjvMX0Ex3ev1dJfridckfet+/m66sY/IQAQZuJs19R0qGtWDgaTJrIGok=
X-Google-Smtp-Source: AGHT+IFZwlTD+VXEFQskm5Opg4QT08E4V4yhKr2btjZ2ach7B7s8+ZAR92EKMwCOCBvn4Zdc7T2oaA==
X-Received: by 2002:a05:600c:c0e:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-441b76b815amr9384095e9.5.1746117438399;
        Thu, 01 May 2025 09:37:18 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:55 +0200
Subject: [PATCH RESEND v2 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-1-5a3cab296972@linaro.org>
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5iZ+1LBZMer+pZpH3XZWHbsSvLh2Yz7gnxpvLUEV64s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M2ILY0VIn3BIClSvY2jKPuO2ZgMzm5a6pN9
 Hx8f2cAHZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjNgAKCRDBN2bmhouD
 15TnD/wKU43Zt+z6TRR7birMMQYuwrxVFM6QbcBghyAdrUuYvBvaFWylo3sxGwRXrxQEi7aVy8b
 Y2uBscPzKtNC+oIxA7zRvI3ttqWtsBwY/iJrd1LgPB69tBvCvkPE3x6liwxclqrWv83JRpxOfh8
 wTbtqA0N+N+H7tH58L7E40i7OkW5ek13kb8TCqSZhe+GC17WYbQreJZ+f28Wg5VBLT6y15iF9wo
 e413uncYze7Q9LGmPeAmWW6+3AhghiKuqg/kAsQ/mkqSuDzLPKkphG0CFxImCKH7Ktniy44KJ2f
 FaJ/px0bcruKsShHrH81Q6auY/JSWbGP7krcrhljbSqsEJ5JpuGkt3MfkGQjTzJtZovjC2SwbuC
 WDAoJpWsXwq9v6WXMxdML9yg4et6s5Q5sWJpTHbjjiScPfg+if13v3IxFCKyRnZt08iZdsqqEYf
 ss0OkD15qM7P+PnYccuMIcbVGQdrX3qQT7Y5Vcmtl1WHAbePL3Xj45nbYke67iyk5urV4j8Xgxs
 Ckr5V+w2cZUPlReNlqD/oshdO5Ln6i3PQrSsHIUTBndConaw4BZ1J6x2fmyHjvSSXn9tovdtXFX
 KjPcSg8HMs9XewBrAes4OT41kJMBesAI5ABhORTNE6g0s/mmqZDyqfiQ24RreU0sFZh+COAPGcy
 eubtyBdyW4diOqA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The syscon_regmap_lookup_by_phandle() will fail if property does not
exist, so doing of_property_read_bool() earlier is redundant.  Drop that
check and move error message to syscon_regmap_lookup_by_phandle() error
case while converting it to dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 3c62337f43c67720a15b67e8b610da7886f6f39c..4448c0a512137c79195112eea25d762266c77bc3 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1123,23 +1123,15 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 					      struct omap_iommu *obj)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret;
 
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	if (!of_property_read_bool(np, "ti,syscon-mmuconfig")) {
-		dev_err(&pdev->dev, "ti,syscon-mmuconfig property is missing\n");
-		return -EINVAL;
-	}
-
 	obj->syscfg =
 		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
-	if (IS_ERR(obj->syscfg)) {
-		/* can fail with -EPROBE_DEFER */
-		ret = PTR_ERR(obj->syscfg);
-		return ret;
-	}
+	if (IS_ERR(obj->syscfg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
+				     "ti,syscon-mmuconfig property is missing\n");
 
 	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
 				       &obj->id)) {

-- 
2.45.2

