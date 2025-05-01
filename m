Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7397920DD51
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117443; cv=none; b=KEHCmk5PwU/z8mPeXprjiZ+93b3KhbM6kDkQRVTCDVPr9DL2u8rm6K3qYrXyttrqT4qB0UBxSYjJgupxjq3q/FVGnnQBzwPEs/INfiJ7ECqRktN8tk9ZQJXsyx50oPbx+0PY6JdHO62MUQIqonPS+KffAbV1gPZc7nUU57bsnxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117443; c=relaxed/simple;
	bh=wSaZtA4bRYZs1G8waYvshbkAD9TzfZ9GbMZQt0pldJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKhDtG9tXqrNffD9xW3Z7WJIQRgEk8r24PM8T0deXLiMhOck4S/XCMd/mO4dEKwQ6LrMUqdAbXVZdadj3H/h+SoO2YJj5HdHmw/BGzuU3OiRMHQ9SRtpzHJTXCrTqlGHpeKEllN3hrpCmAKrLb2M6fPmRYq9mbPScDS0ziddXT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HR80fJPs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HR80fJPs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so1443195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117440; x=1746722240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9P1m7Y3z4d9rNoWAl6MknfdebV+lwfWdrXlwW8WNKhI=;
        b=HR80fJPsyFPKEUQRwbA00bCr+qB95bBuFSLflfSJbO6paKVShE0VmL9AhgFRoQoCZ7
         +u9+8MbyA6Pr5KiR7/cOkoz8v6VGurjKqCBmC8+twY5j9xlNoYsQqDApRaKKZcSGx5Ed
         ceGnTaM3zsLtO0iZ0OF0iMMd1jjPj8MR/LWfHd6yfHtTNBzV6GbT72E0aqiV6T7T1clB
         n6crbVUNb3NQxgRoqGBOFfxuj+FYYVO4e/Agk6aWLB9UMyUh4mofMxRrCpK9C6iKJfe7
         Lgn8f0EW37YgFlVtM9QnDm1rRlmG4zmv3R+yLkxZqSZpuOMk0ccU2GkEchp0Q9SWi3yw
         ZNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117440; x=1746722240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P1m7Y3z4d9rNoWAl6MknfdebV+lwfWdrXlwW8WNKhI=;
        b=sDryqGG+GmKQtoahunP1C+IFoVtH5M4PJurt2/0DM/mOADCqq5gXAq6I/8yqwe4Ih4
         NhxtEcxO5/JnJSZar6q8kf493X+shRAZhSwt2ucfg02xvg1iq6D4kep1aBLaLGgZ3qPh
         Hh1hhW2NYKZuC7G47sAD0Utqp/Woiu7IDFh6+IJ/BsvMJ5drIP/FzbEBYlQOLr/94op0
         ilx8iRILcKeE8ftJy7yGeQgVi3gVCFfcS1pEcN9PJznCfGnZiyV1qGQa52Tyg2byvjfF
         g8CiB6wHgnht3DgfD0MLLjwReHwnIkQh/nQQrfDg4iP0UokEBRFcMn+MLOQFzqFeIxlg
         F6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZX6nNDoLg4/n+Isx1lkDj3p9jsKt5WcTHOZUX/mY7HwslCh3SosMUicl26JPsBuB+sI42zlx5aK3dcw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFsXW6nmcNhPApLXx5UIOD5VOAERDu6rbIi3mhi//r7SCjouV
	QMlsSYekr2UAIBAxpPcVHXMeJEvlmahtwmy+BaFefomqEPXB0+FeP1D5WT93hqM=
X-Gm-Gg: ASbGnctBqY+IO+TXupp8jMHWBle2CDuHDDFbABOwMI1ahSxhqs+VfrEyVEAe1AVXkca
	7qHRiu4n7UQBREHTFbR+jLjXBtTCtPUWii6OqCp3vZYags/7nmBxMhmjB9NlvhvayjR3JUtjdK2
	f4oVgzhO+uP6XDCBn40e6OsN7nh8JpbG66GIGPNzokyhY76ADhvibZ70xGUIxe4/9Xtg+14WZ6B
	7Fv8BsZ6a7aUUEgVUdx4dX8UnvK4Qbryuv8k/W8FcS8LNpU7EF4K1jNjPrTxJsxB++81HMUPFa5
	APSl0oAczCyXHrEwy+GpU1jqjkg9tM7YoI02op/0MsZbsoRL4kVWvg8/HNc=
X-Google-Smtp-Source: AGHT+IGPpDqg1uqE8LFEWwLX435f56VDxCANn/R7sh63I65f2yRV/LXQryCMvr0tRZXQRAMZb4Q3cA==
X-Received: by 2002:a05:600c:1da0:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441b2dfce81mr23814815e9.9.1746117439733;
        Thu, 01 May 2025 09:37:19 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 18:36:56 +0200
Subject: [PATCH RESEND v2 2/3] iommu: omap: Use
 syscon_regmap_lookup_by_phandle_args
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-syscon-phandle-args-iommu-v2-2-5a3cab296972@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wSaZtA4bRYZs1G8waYvshbkAD9TzfZ9GbMZQt0pldJQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M3dTz73g1hTqWpvm/RlUFFBhL88fh777FAU
 nRWt/u50OyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjNwAKCRDBN2bmhouD
 14/1D/9qJJTAa6KNC4lnTB/UEBpK84vmumCpWTc11C3ByO2evXS29s7m1n4ZeLfrGzcrMmdIgev
 SlymAyZt1pL0HRWKb2lPzosqnhTpPMroFJltOQ9ZFiF89RGR+52847bWlrO2T3QhduCvBENWNcy
 gJucPsQ8IV8FsulSEYNSyk7wZwOD/zeCQrJg48ra6dJp5RBwKVfeVxMUKVb5BQ2U02MJZXCzvRO
 LJCgJhHs0cGBC8XRiTjCH0pc3PDZTlbUt7WyCDORjp1UzLrN7p3y2+rACVlW3Fr7gmGIDq/tRv7
 h6De2LgeQeZ/Jk4wRgQauPk+kOxC70aMXic7LzQ9zoe+FxBirV+x7veEsey+NsrDVCcUbNJQzlr
 w0FaKE6Tht0oesmD+iI4sETbNNt55JdQ8i0l3MkG0PAmKwSnFWT3sfCl7+ZBowY0j8b84fZQF/f
 P2fhWwsYBcxldooG/RmK9pSJYh0zCpTf7gRLFpoGELfB2PTRsXnjbqJFKDI2GfKxaRcNl4vPFcW
 6T60C0sLDvFfESa810o+xYVTroMqojApfAcU661dCx5WcdE/EO2UtOnX1HVCENEXYpM6GxArbJS
 r1ta56HmrhLEoAqeIamYOzHSQIRL05dpIQPQJWm2Nlc3B4sySF5cuV6D30iUdELbH/fX2yQedfG
 3ZTINBZ555xaPXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/omap-iommu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 4448c0a512137c79195112eea25d762266c77bc3..30fdbabbc9c652990e6cd31d3c0a1a06633df9e6 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1127,18 +1127,12 @@ static int omap_iommu_dra7_get_dsp_system_cfg(struct platform_device *pdev,
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return 0;
 
-	obj->syscfg =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-mmuconfig");
+	obj->syscfg = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-mmuconfig",
+							   1, &obj->id);
 	if (IS_ERR(obj->syscfg))
 		return dev_err_probe(&pdev->dev, PTR_ERR(obj->syscfg),
 				     "ti,syscon-mmuconfig property is missing\n");
 
-	if (of_property_read_u32_index(np, "ti,syscon-mmuconfig", 1,
-				       &obj->id)) {
-		dev_err(&pdev->dev, "couldn't get the IOMMU instance id within subsystem\n");
-		return -EINVAL;
-	}
-
 	if (obj->id != 0 && obj->id != 1) {
 		dev_err(&pdev->dev, "invalid IOMMU instance id\n");
 		return -EINVAL;

-- 
2.45.2

