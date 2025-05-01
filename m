Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6752144B4
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117444; cv=none; b=hVkCaH62TxTJvdagB1gL7k1NtU1wOMFDtmNBsfUM+KkyP71Ml1N9agUrdPf0a2nqSE+pjwXnEYM9DJi4dO+gXWTuvkzTBHp3Wozmj6vzcjQldg8r3UVt0a+qj1qfh8nQML35bQZFfPqJ/P5eSm5w1wgAB8+uln8JpT2evSxVuUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117444; c=relaxed/simple;
	bh=br7GZJo/Y+jEEdWoRzjynfLSYE2qWMF71yGrpCFWlfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKG0A6xZeQvDKQp0Lb7GU9CHxOadCNwvcuZpTiRamNngMBZ26CI2dQbPGc+7lB85/tNJtSNS0Wa9cwB6jdVXSbHzOXiyExi03c8fEdviYUP5jptnfZR7Ss7HALBOPwz/qoXKqe3faKQw2f5Td9Xcp1j3uQh7o/EFdlfER2qgEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hph63/L9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hph63/L9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so1641495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117441; x=1746722241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=Hph63/L9K/0eZ4ctbNXJnIlTmAHRyCgAFf8dWpy+icmnvFcT4DweeYiffQ9NKwFMTd
         /QkQK/ds+3yQQdESWVFbFRYq1F1crmEM6HW5msLFPT5cCyVbWRm99Ert3KLLxThcTNmn
         pF1AqcKdb41xNjXBpNzpVvi4m5fHwlCXvR07txFHAkqretCQZYTlvtrVTrcWANAHTEHx
         Cjvntc3iTt25sZxECNoon20SuJYx4OgW1H4LKEidw5TFy7XUS4Knvxbf1WjIXHcY8zBK
         8/8RbKGhrX9WxoxQJ24bAiRG/zMRbfrqqukrZRh5PBSEAuVkmtyUFGDHj82aitdQPRQh
         P4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117441; x=1746722241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+72BTk3p7hLtQaCti3cuxoq+C9cJepOLj5FSJpxepws=;
        b=MUwXkHH2UG2fOSvE1kNSXK2LTotEHzgllpBAtNH3bD0eNbafugfdEc92pYDsOatd2G
         RN3QEDNDgUY4SDw1iLGY54D4LCgrOgutkRIyGLUB+Pa/b9B0YpCFEbsEOHpWUAE4k3D6
         RWEUHMcrkWzucIgGtHDXYCmQzLd2dZcqDPG/4RjrdHMi+y1J4RXLOY81PCsnk3+QxrW6
         c657/UU1++33pull2/9SIJ8O4RobZWqD7GcTOZoG9Oc0ewhDR30EwvFyutv/y38rrUU9
         XfepC4aSJtYz0FO/lcUwMAqQ8eBjcr9vpPYP94PxmNxk/FWVg/28hinTELnoSNqT7FoU
         s0SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmlW375lgIw1WqnrWo6ND41RD7ZCJfyZZq7sZE5RRLssnFycYlTVWs8X49HO8xKlnN0mp7cJA6kx+B9+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pgOJTJijOOiEiVXo1DTsKAL2YVzrtAAwRXdikOGnknoNjnv3
	nsS0Qc+uV2I1UL36H/p7gZfqLU+BhVoq71iJvASOPgG3laS8rWbyOpWBn6CGhKpgYHB0lRWMF0/
	y
X-Gm-Gg: ASbGnctSgESzJAR7/rCDXMWYQr80cU6fVLlTc7wPjrWQAPeBZqOTxv9JpX3wz+AL8Ej
	eyB+3HCS0dPtJtRyjVI+SfgAeOpBQI13giokEH6aMREb8YgQfYcsRdCSExSxqfYzQxrN895C5GF
	VnmOCcovLa9i+bVDchOeOsNMt8I2eZmKaCXvplqybCOtyvttLkOxyGSoSQtWIPQVIp0Keohwp4i
	9c79eN5bZBl02OThGHuFc6O44zSRcvnd6n1BrVUQYZU0vAjdSklNQbkZ2OV1C4xkU6BOkIrWmuO
	qQQWWN3Hra0PKtXGbTGUaVIEQI3F+s0LcJw42INTQhgJH+COnCXzP3IGeP2t4MkuXQlBnQ==
X-Google-Smtp-Source: AGHT+IFZ4wq/YC5Z8Q1DORspcfBal0TXZZSb4qQ5i2LX5qoWo7ODXYSBY0H6naDeevzu7XX1zCwGJA==
X-Received: by 2002:a05:600c:8712:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-441b2c6fe2cmr22011025e9.1.1746117441032;
        Thu, 01 May 2025 09:37:21 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:57 +0200
Subject: [PATCH RESEND v2 3/3] iommu: mtk_iommu_v1: Simplify by dropping
 local 'mtk_mapping' variable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-3-5a3cab296972@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=br7GZJo/Y+jEEdWoRzjynfLSYE2qWMF71yGrpCFWlfM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M4CJameWdIEbaKrhQD0ut81+1BXWRWUnwFO
 97Wgb7lxumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjOAAKCRDBN2bmhouD
 14SOD/45uy0MY8VGk4ZvKE/H0R7CNE2ft3oLP9XOQRzm6XJHx2Z9QXmTT/RSuKn7rZ+bMTOw+Ir
 GPQ0iGcxYbbvzawOd5YGQVIPk0Zb1+shoVoyBFJqmuoRll36W3jRmfIN3GL0YaUjZhpnA1jcZAy
 TTuqnfYHXInALgDOecbSNWc79Uy8+ClQ3E4L+KOy4pdGjft7nSX7JXTtTXy37QxGkhpekH0JM5e
 Ny0iwkeJTtgXi7Exa1K2spOHRlROyoBC4SbhIwSnR1ht7QkzuV/dDELMLU+rjhbANXDRvhLD3Vu
 jzqfOzDuiChfqmVO8WAS80b7a7MORPmXVhl/foe3JeyXchF2/AdA0IG31LiCwkryPkD2k75l3rn
 CEazjbiTy4jsN8ZLcGWs8/1s6FpePznAdTmg4Xwg85K+Un2AibmOI8+XJXVQYQflmXwe2cvAcxq
 dYBhTZwXoJ+HdUEjmJpq+DC1veARGn0blUPddRTXMqveUNQP6ieZY53tCYDKJH3dsXH3cU+rmSn
 2touTUB0YumibIzZdFmfF4BKTwSMHWDE0A4ZrLuaeQ2PdEdjI39x0BCE2NLbYI+Ra1JtWEZ7mgq
 vVTfWQER71C4Hc8d4JZLENH1I4xL8uQFlnxuZ0maHo0+4z4H03ObcnJNhOE7y1NWCKkOEVpBT7F
 DmneETwpwZMjFiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Storing 'data->mapping' in local variable in
mtk_iommu_v1_probe_finalize() does not make the code easier to read.
Use the 'data->mapping' directly.

ARM64 W=1 builds also complain with:

  mtk_iommu_v1.c:512:28: error: variable 'mtk_mapping' set but not used [-Werror,-Wunused-but-set-variable]

but this is not being fixed here and 'data' still won't be used in such
compile test.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Old warning is change now to:

  error: variable 'data' set but not used [-Werror,-Wunused-but-set-variable]
---
 drivers/iommu/mtk_iommu_v1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 66824982e05fbfdda224276ad41b90f9d5f9ca4e..bbe3e9d901c69ac6405d9549a4481fc80f1adb80 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -509,14 +509,12 @@ static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 
 static void mtk_iommu_v1_probe_finalize(struct device *dev)
 {
-	struct dma_iommu_mapping *mtk_mapping;
 	struct mtk_iommu_v1_data *data;
 	int err;
 
 	data        = dev_iommu_priv_get(dev);
-	mtk_mapping = data->mapping;
 
-	err = arm_iommu_attach_device(dev, mtk_mapping);
+	err = arm_iommu_attach_device(dev, data->mapping);
 	if (err)
 		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
 }

-- 
2.45.2

