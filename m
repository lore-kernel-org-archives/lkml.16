Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4819A21C9F2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488694; cv=none; b=Q8K+fKp1gSCevTFkGSSfbirmDNM71N6JVGRZ1mIp2gBk7860JXjLlJAxMsTybVzxiyUJUm2/ky6k9E20H5Js0IWDLmMhh4cezGDW87kogotZUJKL7Am7er0EWQCE0VknZ2D9tKqwUvA/UcIWXaC61pqibdZt7twX922RwQV/jGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488694; c=relaxed/simple;
	bh=8Zh5FxpdEEPYWNBe5RT+mh0B6sH5fibgodIzdBiCrhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtrMsNUstavpCfCY15DNzoaKG/rRg03YWYEvM9O47OzO/bPb1wc8jV2vFr3Ds50FIBUuPeYdoLGNAxkH8rDvbhXXCxGkmNWKvhkgprmRDOGEgFnr6OmdZjQMgD39zx5CIylTqBpVXSGbj/8wxfc07Zn+1WbpeBoZ4o5EqmZwhGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS5tLNMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS5tLNMm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559G59JA027402
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 17:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XzZwPYZlbjF
	MZPye7rfYt1k670m73tYiBP58ZldSdxI=; b=bS5tLNMmGaTk0fsAqXaNNjrHiYe
	N3gHqmWXUDfnVH+wgr8H4JcLzIp6H9Zq/p4mEzC6+P2295TtVQ5LZuPHfJU2IWWY
	bs72wVFA5URZtBpe2+tJTwBWUvyVbr0/w355zMXtfNs/2PVVJfB6PykQkPG8dn2Y
	w7i86gKbxI3qIkapl1xcbP9ZuE0APkfmywZWCrwZXTMW8Z+I1UkZF6qVxEOmx+ug
	ATDCWo8aYB1lPpoZn7/+xpPhn6Ai8BspSaYAlDFyKydI65T6jQ8aS4tNwb2qyCzY
	PgU7yDxY1OAAwdupUgR5qXB9VHEDTyTDon5+6ZmS1NL6DZmIDqDMM4lIB7Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4762tg04ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 17:04:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2eeff19115so5520365a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488691; x=1750093491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzZwPYZlbjFMZPye7rfYt1k670m73tYiBP58ZldSdxI=;
        b=aK7x5eCrvjWNVbdBqhi9SpvHIjnOaE/IG9NKkXWAxhRKOcIaTFbY459Chli6yugoFr
         LNXpQCq+jHGhRa2Jv4r3fAWIswLnI40xlQIqkQicBlNDVHk+LIBqykvOXy1ygBfIEtQE
         vSZ4HDHMZN/YCyAa0aBxuIn1kOqCyru2hucrqkw+wmnbt3fX2D/lqq69DtWmg3derwQv
         ItLiwgAWrrpJ0e2KXhWInrrV78PrBteqpQH+dc1hx3j0snmdl9+TEm1uxjmwZueRxdmF
         T89Ujsa+IGStC2kbzgYIrl1HDC49N+c2BhpDm/wS/xmKWmEYt80aF+1FjJlSThuSDLha
         AX9g==
X-Forwarded-Encrypted: i=1; AJvYcCXMCXHJRHW6Ow+KSFjvlOqMdgskEOdfdIcskcNnBArQ6U4TEksxhKtII1vHs4OXnTI32AQ3H/83l1/od2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXfd5kvyZteTn6+ZOAwmKZMPrroxTBqlpI1spQx+VDTvUpAN3M
	1bNzl3oNoISuQXjO2TBDb9c4PGkcQAqzfWDi1d7QfM+lE8R6e/k2PtWst4XojvjgD7W/m9Q5KC0
	61IQWgU35sUqkjFCC+ovbF0KBYrJnEFD2yWnXPLvj9bsyYF9N9xbwtNqGl8ezGOtbPKQ=
X-Gm-Gg: ASbGnctbKyB6M5WBxflfe2WkfkK/fXK36XkqT/RPh1hJFRLOJXXeZjl306rvk99VQpd
	FPyfaLLyCd3lCya0fbm79QKD3P4MlJQ3V2DvgJvqOdE4sml3u5yhrnqUi8Ypv2LiCP4LI3+dCAQ
	atP17g/nFyi+vvvVSvT9x1hhPFKPlyfk21ZMdSvuoV1q/1V5MNK44w8FC0A5ETGoabFfE87SKHs
	obq0lwyuFRsYXFWqfyVyKfgBJofnALJyVWkW4qkzh51Tc2xoyzrvE/fdzM/u++Q933LhbmgWnRP
	MCa+FGo82iSa18wsZRBcnk/wgg28zobs
X-Received: by 2002:a17:903:2301:b0:235:779:eddb with SMTP id d9443c01a7336-23601d7194bmr213852575ad.36.1749488690845;
        Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL1pHFRZONFYaAY8yeqfuRk4Hrvwb8mpHSMYXfnTl0BvljOd/9GrDX2S0s4MWKivdH4qiYQw==
X-Received: by 2002:a17:903:2301:b0:235:779:eddb with SMTP id d9443c01a7336-23601d7194bmr213852165ad.36.1749488690463;
        Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603504ed2sm57042115ad.219.2025.06.09.10.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:04:50 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm/adreno: Check for recognized GPU before bind
Date: Mon,  9 Jun 2025 10:04:36 -0700
Message-ID: <20250609170438.20793-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
References: <20250609170438.20793-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZPyz/t c=1 sm=1 tr=0 ts=68471434 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=4MAclHcQAAAA:8 a=MWJfq7QAy6hsqaZmoI4A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyOCBTYWx0ZWRfX6vubCI+fXw73
 UARvMa6jRyPkTwTA5Rkg6YpTldMIqFuefpJDbJhsmFZQYx5cMdgKGGPG3Y0b5ZVCBbKklD2JFPh
 OWbDt3PQuUTv7sVyTohho0FsEYHo/8s4bY24DvxIC0r7N5Ziu9fvsAm+38o+VhIZhJznsZOew9+
 0WWRRj/EWzPwZNfq0MvfTPbEZWT9VDoMvDoBFc/SUE0708lqyoACp0KKnCOqBZJVaFSx3q33U83
 jHoNc7BZaF8y3BYzZ8gU8DDE3Zhmg59edsOTXqrTvzPBySuBMJE+z8xm9Y0ohHOH7XMCJJQsU8Q
 HVaRU0SXcNGek9wPXhQErTex7xhSB02svA8YS6QCKpMf5bi3gmqbJ7v58EkVwR871v8PHdCNMbB
 e8EP+8Ua4/bGkq5EO+m9n3RlHpUcbtkNu1r7Xg6Ew3Pfx5C5hOVD4pPjUF6RPJGxLJcY9zXS
X-Proofpoint-ORIG-GUID: g6Ywb9XQ-Xu8rnNnwyiaE8OuOymlsxQV
X-Proofpoint-GUID: g6Ywb9XQ-Xu8rnNnwyiaE8OuOymlsxQV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090128

If we have a newer dtb than kernel, we could end up in a situation where
the GPU device is present in the dtb, but not in the drivers device
table.  We don't want this to prevent the display from probing.  So
check that we recognize the GPU before adding the GPU component.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 29 ++++++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.c              |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 504174dbe6d6..002aaf365322 100644
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
+		pr_warn("%s: Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			node->full_name, ADRENO_CHIPID_ARGS(chip_id));
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

