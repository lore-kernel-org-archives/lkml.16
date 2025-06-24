Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6D27C16A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767770; cv=none; b=eWVuoQL0Q3y8jE44D+myd/LC91bc5eUuMd6FV7TEtFi/5DyCTUMCTy2O8rwxMA7fanFQr1t8//WysyNRVX8bUM0u0KCyGsNRh87qU/5Hi1fCGJKvX2J3z5aQSH8N4tvbLyoL9/DClKri/UT1+VX9FFiShqmxzBMosJHmAK4dhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767770; c=relaxed/simple;
	bh=ueipJTTN4GIT99VDYZR+nAvHf+JWom0KrWneDnWo3sI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvArXBp06mZDc97n/fSjZabG/+X6ZGYvye3q3i7iG1EqIpMrQNxu8hzumH7Up8vq7HydRwh4l3L3mQoS9uS6QkgMlfWrCVIXFK3Ku1FZIVEm/3Eo6IbWhXLfiboccYvoqlr3v5CoWerffBto1Rp7QKLDo62zFknltAihqkDpdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJoWiGmj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJoWiGmj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso64285466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767765; x=1751372565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=cJoWiGmjzVK/irkSIhNWBN716RvrsbXsrh2Pwff3GekgefXvBXZ22VRXunji+E6uLt
         WcWRsSEW4tHtIVJpk+Ad3DZ2pexL7Ud1MObcdE+Br6BMWnhuRJKuclU34TygNzBt+A/k
         69gVeKcjKQLvJ2gqrhTOL1j7/gTc6D/xsmmLrfq7UIiEp3w9zKrN1uV8h8mKFXN7m8Gf
         uhqt1rHXc92WpVNH8viFf+0JQGj/DlI9iqEn1QLHk2LIPd9ziL4htAvlfoBoIX5QAAft
         rr8BPzwgl4cyZR0hJgnCSCP+GGSs+QCNA8tOgg3bjrto7Dmnc0dRhYBGQu/eqUyuDezd
         HBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767765; x=1751372565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYR0mvGjbB1t9PwMrSYQystitWjrVQqAGcccPxG+GgU=;
        b=XmKbKaXuKlyCQgSSF6/BC9OO4TR0MvyduCw1PZbGuYW26nDKy61xSsT23yVAMPhgna
         0jzRF409upyQ9Qzy6C1mlDIgqwVIt074trDxsQlL7vIBLy4GQW6g0lW8yAYDn1xVGoeM
         rlqNZ2DLj0liHZkpG4Suh8H9poRZy/COB2lQlM0CgLp/2p3yhAg94xLKeRfwsm7TOh6T
         kxwm7mY6hj1tkbWCS9mTZR3nnSRyVy25FJArQ7w0gOCsevaznu5XFm4I/PiUgTdPb7bz
         Mcf52plUGsi0+5xF9Ahe8bUkV9eUzu9zeI0UMPz/YVBS2RpPKcyV84ELZ0wpuGBcL3nh
         AUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKdi/7FwwQlog/c9Ij3SsHsLm4/gAomG38GLnrNKi9Qixnr+DiM4QM9t2871nY3Cz4AUhZdAxT7oXCBSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHkG5cf22wwy+SxqQDmdMHtvF1kVjnO+FpUXgCUU5ds1jrL7/d
	LD0D6AC9BaAJNcs3jAOfGkMWHQc2v6U3/cQUwSGWK5xbdwpcQp5GKcTfsnhaIV+onyk=
X-Gm-Gg: ASbGncviHAxShV9oRTWaWpPKd3hSK/x5gLMTPWs5Ebn/RxXSdurBQ8L2DCcFqAcGoty
	thkCa7wDgfRFi62mYjA/MByOWTEDstBzghQQVNL90zVYHKPJZ4/F8XsAynnncuc1IrtDqOteOp4
	jotefdfOAHaJ05viICdypZFWCzhKwAoHwf+i9Mmx5kmy2rmm6v6LpycTaYSk/qO+S3IXF1b9FM5
	YTRzmdJ9Z5BYbW0JeFX1F6KawtuDJgCoSdvkSfCLzgEBISYzqZHD7Cy5UF6THaKoXpAkDI98aXT
	IJ3+iSaALU2lGWHw43Aj76REwh5Axp0eF1j09Iufe3WsvW02+WwlNMnPHfiz6uBnmNOdGIBYJmn
	5ZeDAPw==
X-Google-Smtp-Source: AGHT+IEsZ//+E0/Q5JRbtMOjfmMwrd6ZqBEhvEMcASAfMvO4Z78K40GvJpneVMJGYeJGXSRojLvxIw==
X-Received: by 2002:a17:906:9fc8:b0:ad8:8200:ecfc with SMTP id a640c23a62f3a-ae0578e005amr526516566b.5.1750767765372;
        Tue, 24 Jun 2025 05:22:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 24 Jun 2025 14:22:32 +0200
Subject: [PATCH v3 3/3] iommu: mtk_iommu_v1: Simplify by dropping local
 'mtk_mapping' variable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-syscon-phandle-args-iommu-v3-3-1a36487d69b8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ueipJTTN4GIT99VDYZR+nAvHf+JWom0KrWneDnWo3sI=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGhamI7Iw+ClTaksgGzVRNZBqEwhCMHErWdDPgl3KBLt2cw5H
 IkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJoWpiOAAoJEME3ZuaGi4PXrSMQAJis
 3J5R/L2EfwRPOX20YInJ3r9Rj4cm59Hk4gwBb6sJBPC42WJRFUfriJKoBwOrXG4/wGCneYOvHGn
 F5h1zJLrIknW/Rr3eQU2JmiXfvfG05b4wEn2q59T4z98TmmqESvXISsSy8InCeK/ui4qCEormFm
 WCluiPBO7+kmKT471cc0V8LUPwBidaXYQy0bvjwLALYhsZSyss5hTi0lqvTpmEOIPjJQPZ8S44U
 y8hpaLmPwJZaSNbSxVJ7jgDmEG0OCU2Lp5Hfk8m76ijVsRAjp7vbifVJJcmzAwVnLwz/Mhp9zqR
 701ZiWueSdJOpFBr9dnum4uzJtbfmdAOcAaZrtr9fZ6/8ODcEjp7a1R4JPWaqzdwTcMrjXDcDSp
 5ucG899MrwqT2WEahy5IreqJFG9SGntaDTDewpOcO1+l+iqe/4TFw1rrvC+vK9qOdHK9DnBc3T2
 6cDBQMuhRGre8ruUf6h1li4CfqdYwi1szocZJHVAsr2PQZvMjWtWLBToNtCdJbPXEhD5loEEwpO
 Fck8zxNaq4AlXafOpg2uWSWvYs13l4VTCztSq9QCYclHzDZhCXukRHSJtPuCdNnQjAO4JtF4LQP
 BdA7mfHdmewfVjvi6I+fwWRhECj2Z5cyuRBK9DFSYqceUX0/iMGPS6nRoDGeG9QYu1NFWb5FYv+
 /WU5W
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

Old warning is changed now to:

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
2.48.1

