Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FCC21D581
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493491; cv=none; b=lX/XmT0+Z4UrP19Ipp6hgU1DXFw+rn9mCNXGchKUKpnVDyblmCDjiPdDINYyM+iPTqzlnTdskX0nJNAQ/PnZ1C6leQnCETs/28v5UGy3D3dqOjYDlJnzVfQLMcIcMGAh+0ChtnJiY9TXRG/FOHIHsY+LsgTNnYFeCTFHbKx1cWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493491; c=relaxed/simple;
	bh=2Yz04CrS4eDfH+osQ1AYNYmCh+wB/WulKnvayV3buXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGmA8waGGx4O7vD8Zlp32npfLuZwVQIov5sjhs1X0F86WO1M92MJaZmQ1Z6zh5LBxWoT94PNeZIyX7ps0i2kLdXEvLgAnrSkc7Ey/Y9wKwOpO/CB/eF2qFhhGhDDXZGsSQ5XymEqEuQCa3Y/JCP8A/l0RKOXfS4Uma4JHyYFe8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMl/ATCo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMl/ATCo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599WeH7002402
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecf/gs5q5Dw
	zFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=; b=fMl/ATCopv81RuOcttIfLT3RGCV
	f2aFpC33dDon0kLyS+40JQ4W5Pm2bdSaCyaSfeO9ej6Q5a/5VZIxHJuEVE2pZAHx
	7fOEASnEIUe4EYRLaPVXWGZB2Nauq9gBZBfCoVlbceuikUOLy6EkajeRQmeXwXue
	qLnoGqBfkKECKtUtakL//L6/ak2etxDOwEPtxJhUDc2Poi9/Y6CvkSk60tq0rrnx
	c3bJ9JoRKMgsUss2RGWYKm/eLDxF6B3PoeJg1owl1ALvplNrQXnYIMmXLRlR90JQ
	ZDYoGJVWI6Tzvp23vkPEXxQpD0UJzxEs3HlxlTZyWKH91YENvDWwykoKyDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn66t7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:24:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so6533538a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493486; x=1750098286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecf/gs5q5DwzFWtmUtIrh+h+5TTwNY0t6ORkyO3PRW0=;
        b=Ec7sF1/pRGdLx38+iubmCdLDaYi0PE0aDN9P8APEUehhw7LaZdP5Fbtfyq2KT7jJcy
         DgGfukM8T1LpHczH/mIedR4jXRWnhVA3uXMiW7ANyNFM+tWs+aWuePBDCNZcm7/+ZiHa
         hi4NNtWoEB3hdBSm+5EKpICzyJrsfsETq6U2vsRVCyhCYVHixFP7HuZ57y1U2Xr+zBiz
         Ig58QdRxmwkNZCRwotIfJNPH23dtqhHGmJG1c/t0HXnQ9pOXp6HVhweK+/Z3tgfmEKJX
         dx7+WR+dkyZpTbzwYW/zGrUMtX6mjBp35oojX4+D70GWlRhypAV2VtcdRaPitSWx5lMX
         sQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVsaa0ki/AYG+7btOES1KyeAAUBrxITmlWF71u2OH3ioJcne3X4qpaijigpmWlQ+ETzR8F1RyUNxSl+7wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUgVaboXSuMXnpA6HJKMXTqrHEU+kJ2biCNzkanWqgCD5d5O1
	ArYlQYy/YCtMa72R1avZf1nHQjiRj4iRRdBnSOXfgFC/9dFr5yrFthRYbfTy1r8RNtEW5MVCVIE
	yjxI5kfGQqG4rCamYI5a/BmXYzUMJqP8W4HflM4yTJDdAXJ09p7Wa+TPctBr8LI/D3oQ=
X-Gm-Gg: ASbGncu7Rb56a6O+74l5wOyyzdP68Zh5pUUAnE2NAYBjobhavS4r5lTKIHXkabMuApl
	PhRezQhLSacL3bXutT+3LVJsJYRlcj96VQ3pSDEobVZBFM6BmvTxj6+C/1vyZGZgTiIanbMvR6t
	ojWmEB9elhxx1sezWPKZNcumPJ4I52XodZI/lHEsvmEfdhh7hY/mQadAnB4+JFNomgIsrNRc9/n
	t3On2Inlq60C8FhrZVy92hwqgxleQ7ed2hBoQ0GMxu5/Ddxt2OpIUXaEkHyE/rn7UlmHYBQLJ31
	VTkK4AjsS+QYCLQ4PQwCIg==
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313472d4297mr20221926a91.4.1749493486580;
        Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEigB0QkFd2i+DltDS7spF4Aiz+S0w1cLE1zE97QoFV7hOhFnk6CT2wbS3XvV3KokxiU/HvdA==
X-Received: by 2002:a17:90b:3c52:b0:311:ffe8:20e2 with SMTP id 98e67ed59e1d1-313472d4297mr20221906a91.4.1749493486236;
        Mon, 09 Jun 2025 11:24:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f32c96sm6630688a91.12.2025.06.09.11.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before bind
Date: Mon,  9 Jun 2025 11:24:37 -0700
Message-ID: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfXzia7DF8GyTnU
 TdBiQcDMqaHIO2fCpVX7MI2mPaMMTeRLeHgfbHdHQjhycb914ypC3QHurhkYbvHrlEero4s6cHd
 cKv7PXJRn8hvyScYH7P1yhYOjYDGq72XUGrlES8n9+Dnzl73fBqmbBPS3HxoUGVD6TMs9Hw332h
 tSK+G99ETt3HJW5H8uyaVDZtS92GQh5HUum2K4NoUUrAy+cm5xrtAvy5Hq5aK74+8PeukXXgQjL
 zqfVxjeyXBq5rYid5RCsLXDCKZqnGIr02CkKtjs2vNiY3b7+5uuZ+MoS6J/Mj2l1T4qqLPmEwZ0
 ILsQMZZCCmUwNEFCygJR6Ixkoa+7/50G9GqqkuLI3SuFzwJi8PTv5Y7U9UxM8ibvlOdrSNWUaF/
 1YXyhZeuX4jaxhBNVB53FVZV0WY7JFLuy4TgLjogFcWhs8xcQ7gKCWapmIVAA01V5GvkgxNw
X-Proofpoint-GUID: enAbKuCxS9x-EivhnInJYXzDDE2mM0GY
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684726ef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=KW-EWzdukDj2kg_Rd5wA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-ORIG-GUID: enAbKuCxS9x-EivhnInJYXzDDE2mM0GY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140

If we have a newer dtb than kernel, we could end up in a situation where
the GPU device is present in the dtb, but not in the drivers device
table.  We don't want this to prevent the display from probing.  So
check that we recognize the GPU before adding the GPU component.

v2: use %pOF

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 778e6ae7f137..0d12454b1f2e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -178,6 +178,26 @@ static int find_chipid(struct device_node *node, uint32_t *chipid)
 	return 0;
 }
 
+bool adreno_has_gpu(struct device_node *node)
+{
+	const struct adreno_info *info;
+	uint32_t chip_id;
+	int ret;
+
+	ret = find_chipid(node, &chip_id);
+	if (ret)
+		return false;
+
+	info = adreno_info(chip_id);
+	if (!info) {
+		pr_warn("%pOF: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			node, ADRENO_CHIPID_ARGS(chip_id));
+		return false;
+	}
+
+	return true;
+}
+
 static int adreno_bind(struct device *dev, struct device *master, void *data)
 {
 	static struct adreno_platform_config config = {};
@@ -188,18 +208,17 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ret = find_chipid(dev->of_node, &config.chip_id);
-	if (ret)
+	/* We shouldn't have gotten this far if we can't parse the chip_id */
+	if (WARN_ON(ret))
 		return ret;
 
 	dev->platform_data = &config;
 	priv->gpu_pdev = to_platform_device(dev);
 
 	info = adreno_info(config.chip_id);
-	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
-			ADRENO_CHIPID_ARGS(config.chip_id));
+	/* We shouldn't have gotten this far if we don't recognize the GPU: */
+	if (!WARN_ON(info))
 		return -ENXIO;
-	}
 
 	config.info = info;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 87ee9839ca4a..40eb04bab35e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -956,7 +956,7 @@ static int add_gpu_components(struct device *dev,
 	if (!np)
 		return 0;
 
-	if (of_device_is_available(np))
+	if (of_device_is_available(np) && adreno_has_gpu(np))
 		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
 
 	of_node_put(np);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 5508885d865f..56bd1a646b83 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -729,6 +729,7 @@ msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
+bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
 
-- 
2.49.0

