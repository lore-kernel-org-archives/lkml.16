Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969CD296147
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767768; cv=none; b=nxdEk7Sa/7+ruhSW3j1GpbAVBKMARx4UhAZeR8QmJUk6c+zssguWDoYoLfZWy2Zl2PGcM+Hs3sRdntlHU8EnBU6l0NrahZLJDN4WVmn43rbgq2IzpNeUDt2JZbdDONujR61ItpNlvoJW6vGVke1r93U+auEMnYJsHUVe+8vAG3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767768; c=relaxed/simple;
	bh=MR4X/vqSPCpzHXBlHPwjTdycYDcqajyWXlyrIiTPhc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVdajSQ2V3iS8g7P4TKsQj+aBQiN/TMjre9/t+2oTmVXop4Ck+UPAaKBwPB8wbucGEHjinyCqtLUNwKSwqZcwQoalNz92fYtmrm825F3B/asoZkA02G3BiqEugIxGuCtpUBTEclTFqibxmdkw9G1BF7ZmW1xSfPwTvQ8LCaB74I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTNeY3qy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTNeY3qy"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ade6ef7e72fso72850966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767763; x=1751372563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=pTNeY3qybC6N+m7T1phT531h495886cfM6fj9FllO0ACY2XoXNlnOVW4yYeNjS1T5M
         bTeukcKnKEdDysIkDEU3Oy66ih/bz4CksctkznCCQf178l3CV739HVMIiGPOwXJU3wUN
         Y8bv2dB5PpFABBdM06rLiqZb3L27BS8qkArt3tjLIoPc7Y7vtrqw5AuGyIP3kZH7P0H0
         nv6+rSbk4vMRX0Bb0rByb6xzQV9Osbe3QBpSGU2XQ4YjNxmAUZ7TYUtJc0YoZ4ZB52Lv
         4Q+un9KvSM9Q4Up2wHIsmQ10T58IqWXF5V/2OLREntX+2yIsWs5r4kpCCyOQcsEb53+I
         2+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767763; x=1751372563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWhMh/5fYler3nhbWTRM07ex/VdP8S0PYvhv8obnGps=;
        b=GlVIPEby/G9Nt+JOlEAx90cBd2UrR2YY5NQNWv2zokm+iZdKJ6C5dxXZUZPuR0wnwO
         iWcOYN5ZRWS7X8x64adiOS+26Nws2biqs5wtYSvXYCO6EHTqRRAG4OMY5iw9xs/EK/tN
         +FUEDPQ43CsYDi+ee7Px6AbLfNvHKx1iVnEDCw9GQNpED80jyl7Uek7QUa0YA6FAQEfd
         NKS5cN/T7xBFmnE3ukAIAgA/jXpvHA4PZP0rBx23CuhOfkSo0kmyKycdJgEJBBeEdUdX
         EILtdarAD6cbdRtnLpdbii8Ufj4OYHM5A5kTbdwNq6mTn2N6PSZWNlAiU2kZ9QzVPjib
         HBSA==
X-Forwarded-Encrypted: i=1; AJvYcCXe6ZRT4tAC7nM4YOYRypU7b96ebj67kPJN7WmdnQrdEgd4b2q0dwDCYZHVIut3HOfwOd4zsX1coVxwmO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSxlTO45p4AWbMoaRB0b4/n7kn5CmJxlpGfyXaiMUU+lWuoNAC
	b4w01fcT7+AXKMFtOPZ/lsHFzdT5u71MQS2ZA7G8NHSF3qxJsiv4n4cO4DluB5BDZlQ=
X-Gm-Gg: ASbGnctGzGnISz1QOrTfFpfknTHHgz7YWdn064npvBm04uRHKkizVJU26NyCiFdk4i5
	cXdmv3YEX2m2LF5+ZXQ7OR2hxu5SCL1mVdWiwx3UNUvZ7g/S9cp7A4cDbfA+I7GT8s3ITMeCdfK
	hNf7HZ9W+vdAEtvbjnaThGW8nCB0xTSdjJLN5TichK5taQL0oNn/cAOgnOck3pWEwTFLSm1tPs8
	J8BWhBNo57DxUWVBJZl0XA2ZZYOHX8jj2OLZ1jfzn/H9Thk+1IFO352xPrbBDQTx5iUH+ZHdgyw
	c/rGEmgvi+qWRgxk+kHzmAiNlwJjexhGGLpSfINIBJ9gDk9fh/jrZWgEdZX4xxe+ajvg7Blx++q
	G/+xmfA==
X-Google-Smtp-Source: AGHT+IGJeHAE5O/zwjKbt1rTA+c+TADFcI3NU88w3TmhhB+vtkSIGErnItgRWYP4ZJeQzbFZwyUKeA==
X-Received: by 2002:a17:906:7311:b0:ad5:2caa:cda0 with SMTP id a640c23a62f3a-ae0578e8100mr576222166b.2.1750767762491;
        Tue, 24 Jun 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:30 +0200
Subject: [PATCH v3 1/3] iommu: omap: Drop redundant check if
 ti,syscon-mmuconfig exists
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-1-1a36487d69b8@linaro.org>
References: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
In-Reply-To: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
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
 bh=MR4X/vqSPCpzHXBlHPwjTdycYDcqajyWXlyrIiTPhc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiM6ARA2FxSObqWTe3UcZTFThPbO9BDoHWLU
 PhkHh1V/zeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYjAAKCRDBN2bmhouD
 10LmD/9HpPHgdOhaRuuJrbNOYY6y9CLhs2idJGqV/EDv2qgsS8WG1i8N2cleWDdJPlajEelEsbK
 uYaR6Z+FIKU4TWCOtHXjkut3T8C5kKBQfrMWmCzFoA3Br3z+X5FssW76DmzfikShRZdMPIKAlyj
 VcTszq8nPqtvxu9MPR6AJrTkyWRr0CyOJG3fShHB6V3YaHccvBsGaEJkoFElPyKEUMcLK42Vyym
 Zrxd3svSy2w4Zz8vvKJgvjsUUBJ3dr9BMe8xng/sMQWX4Nqn1Qi9GTdMGsnMvKtergM97bwe7Rz
 Qzsfp5TnYpKP9zG8SnvZTJ1FCKnHRwsbJJbO8cjvoIxJkWykthRKQ9fxsRMXyxBPRnuELNnZsxC
 5edJu4QdKJpjs0famlCNyXA6AS9hh3aiTdU+RHXNyKSKjyRnJYLTKTAGIR3QfD2Ura7SpymfIFk
 mId46fu0g5s/ueNSgigZnt+qUJOiarAgsptFCQ0TFhvsIvCoxUWbilR0VYEnQtaWfOZpCRetqNB
 etOLco8RovGOUMrSiECRB6Oek6GPuca/SZOU+PJxTy3ULIfHlbRdmVTaoBp5N3oTW2ZK31yef3F
 2H6IuMznU0SzXzxW3BpTNuOvFqhBE21SupYWzzYU/DRIvtFvHr/Pyfuo/gLovJv9dOWV7mkbqo4
 B+5rkWKjyrOp7Tg==
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
2.48.1

