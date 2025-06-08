Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D194C9D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397930; cv=none; b=e8F9AAqg9mn4dfyzGW2Fzw+1nSY3B9uVwZF5XUQs6Ax8/7AaxyLXjJSXibcYj4bVKzPykCrT0R7Z/591V2TWz/HoYGsyJozEBWrkBreKfwtmqrlCiLVLAZ1R55lr0JDDbD/qZ3FBHSmy355PTPyAHqWGraUPOei9wJme4Ow7xJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397930; c=relaxed/simple;
	bh=ZoAA3vuK/kol5O673dlsy5ItLmK0L4GXKNFdqazixd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C/gEtxlU22qR50TeOMLtRqdStQ5A1wAQA3Fnatz/0tImm675MJzUzGMH7Y3Vo61sZCVIY/Hp4RoOnXB5D6XHuOIIMU1H7V4R8YC95X31fK/ygqDwd4KHKkphyoya2s6LsqUT8hbb8z16JopAG2GzmIydb34y+zL8e7sz3m98JBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN/V09y1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN/V09y1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589tE7v019483
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 15:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=boZFxi7Ddh45D8urWAKV+2
	Jls0MVjnq7y9F6R2rPKr0=; b=PN/V09y1o/FgirIo0GDW6xn2JkwvQzTCZYzjO/
	nfwa/vquMsOySdPWIPeBAVCjX170BkviL/+/pknsv8/EHPIh3ia99120r2TThIC1
	Blb53L2q7O7RWO+dT8m6tC7enrbilKVKbi0tDClhuBV+/DZ/GUggh7fecmaSJmQi
	r9EhkmBIN/GbkstopOp3P18m2GMK5Gle86op7vGoQngeoBVbh0qMNmI3vsOnoUe5
	AV07/wiSaIiwbE+Nr76K/dvf6MrqZ5C+moisvsJS+Fk/qcOtCvdHhne2nL6PbpHv
	pMyZ3V9KHLFUhKkJ7SCfw0Az4bBJPX1zHZayIsEXgzwuzFVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474asrkkyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:52:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso726412385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 08:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749397927; x=1750002727;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boZFxi7Ddh45D8urWAKV+2Jls0MVjnq7y9F6R2rPKr0=;
        b=jgZukILoDO9oKIJkfSFgv3ShgH95z3bHc2tMB4PsOw20MN5KqNQfzlzpsoXiQMjPSZ
         xGqHgluanRPo8l63L0PSoY2lUyJnpKgu29HJJGHPh7pPw6mSCDDIFOVQ3hAU2/24f1IW
         GfXT5H6LRh9rIj98C75lHfwTyeBdj5CkgYWH6fajYG6o1U8styAnfJf/N6l8Q1ZQ35ED
         9o0N/z9iTXLNNcdnFWGvc1gqhglINknKMdvVoXaqIYdu/x0jMjefUxNiYZrLH7hoJ0AN
         UeZtQ4DMO3AFIzcnbuWglHbxHaab6okV84jFHHLrES0BdR+Gkh0ifJZf2wqRbBvXsmPA
         Z6kA==
X-Forwarded-Encrypted: i=1; AJvYcCWHcIHDCIXKzV/AFcSQevH+4/yV3EE+clMCamBYAjsqBxzMqkV73sqy/16kvb03OdEZkJSbZ/Az73p7/as=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQ9Z7IYbbCrXKDqt8WbAqixJqW5VVM0GG07zWlGOV638hyptH
	6ME96TxydoObvzbZuhjPEUFvvz2RxFQiUTuEfzrpAGIJAKGvEVNv3VoKSOtpRMFPKg62AADC3o4
	XGcoHGoZSLmdSLWW8e0G81YujBWBcL5bvtbAje+sdq1NP3jH+650JBsnCtA5uHoxcr1o=
X-Gm-Gg: ASbGncse2FNr0NUMMtO2S3Lv44o/TJje95B9DhJAT7qHHY0GH+MfrCyjch/z9Hgm752
	Lrghb3OLstkW6rieVhbfNqIzyvqbsyHLxpkvR59CDWF1LclLfZu5C1uG43i0DryYPusLF2a77K8
	4RAFUNbcCGqoKx2bHpmYMUemYSMSuOvH+Qv9QSjDBInF8dGHrpnmT0kXWUkVFMKRA2ER9Vqnv8q
	ggONp/Bcu0SYrm/wlC4G0r7kugcQKiWh7+5BafptYITvjPcFzMTv1UkP2O04g2WGXtmMuDcgaM1
	zT5t6SBuUN/M8wA2N6UwCnMdcvE4UE1MzldmF7tPeMGpNieIy3FA+OwE8hVMwxmGe1MMDCVncz5
	KY/wJz+1RTvV6v4xCvPYQzU9z
X-Received: by 2002:a05:620a:4413:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d229889682mr1366809885a.34.1749397926871;
        Sun, 08 Jun 2025 08:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP9sj/pKViK1P2M5QiclQ+hkJ6yBVJVUeBZ72zOARopK77awg/D4ihbcFbUOzv33Cm3bqtPA==
X-Received: by 2002:a05:620a:4413:b0:7ca:f2cf:eb8b with SMTP id af79cd13be357-7d229889682mr1366808185a.34.1749397926564;
        Sun, 08 Jun 2025 08:52:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a80csm801827e87.162.2025.06.08.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 08:52:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 18:52:04 +0300
Subject: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKOxRWgC/x2MSQqAMAwAv1JyNlCXun1FPNQ22lxUWhRB+neDx
 4GZeSFRZEowqhci3Zz42AXKQoELdt8I2QtDpSujW93jyg/ay2M4PS6RvRhDR86Yuild40DCM5J
 Y/3Sac/4AHXAJ4GQAAAA=
X-Change-ID: 20250608-fix-aud-hpd-bridge-97ec55341c4c
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZoAA3vuK/kol5O673dlsy5ItLmK0L4GXKNFdqazixd8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbGlXnyYaa+wLYGYQBFyyj7+KhDRSOQ32gbL5
 8GpmF0+75GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEWxpQAKCRCLPIo+Aiko
 1baGB/0f3R9LVi0bPxXCWU4QLHL44VbMsPlfobciX7JknfLTghj3MojTN2qx3ag2X5awDTFx3Yp
 Gd38oHY2Tc3gd4mcgFbYB/0y4LOfk0p5QZ4R5rlFoU1mUIeT7ZArTrQ3S/9Sab94RX4l9Npxf6l
 GNFGVwV7aH5vOLqJ3N/bR88ToXAk3GQ/Xk2RYb6SdZYzpVujPY90nX916nX3ZcfCbHnoT735usd
 25Yr6NxmxYSxHIHP7GwkOWyDziXGB0H1+DJDTSnOiHt8/xWGQ65Do+A6VzuNDs4FTiQLOvxRF8a
 V7fI1cHuIz8N9ze0X+PQpoSMuDvpUAwYrKwZ/QqnyQIEjJH1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1osPT_YNfKF0ozrqsxIc-0RiePScEKc1
X-Proofpoint-GUID: 1osPT_YNfKF0ozrqsxIc-0RiePScEKc1
X-Authority-Analysis: v=2.4 cv=AMUSjw+a c=1 sm=1 tr=0 ts=6845b1a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QisQagpBsXa4eD-aF94A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyNyBTYWx0ZWRfX/3gKUAmiTfZw
 rC76UZNqo6g2wmnwn/0sCd9IGIqWmiWmKGeDmXgczohUeK+YxzpfTKs2sgzqWSMu4XYaK9gRxzh
 9emPWHtkLw+3gGhRztAtQJFEIokdQhszFdOuSKpYu52JddYwHE96L3Y5mPbc65iieWjp6gTG2cD
 iOchtEJqAGHg/2rrYJwqyDj5AlW2vout41W+ChVd8ExTr8C4xcbJVEK1LAFMrqNO65y8b+2740U
 KCt6srmpzFxR6MMuAGZlopSE95R7ABzsbY3+fPDW7kKIQbe0yA/p2K629JuAq03M7qSd9shKzhc
 tQhF6OPjQ4fxmfjPYf0Leni3RVwZI8D44ZXubEekvwFDbmCOk6EuZdW//MLmnH1hyvWcvOSoqRx
 Y3tx9NdDA1C7F1ymqlNiRjNrDO32BjZrcaIJwW9aNVeNuievUq812UIx+AnwQRjlnHnn2HXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080127

Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
Fix assignment of the of_node of the parent to aux bridge").

The assignment of the of_node to the aux HPD bridge needs to mark the
of_node as reused, otherwise driver core will attempt to bind resources
like pinctrl, which is going to fail as corresponding pins are already
marked as used by the parent device.
Fix that by using the device_set_of_node_from_dev() helper instead of
assigning it directly.

Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..af6f79793407f400b57f945fc958d613155417ea 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -64,10 +64,11 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 	adev->id = ret;
 	adev->name = "dp_hpd_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_hpd_bridge_release;
 	adev->dev.platform_data = of_node_get(np);
 
+	device_set_of_node_from_dev(&adev->dev, parent);
+
 	ret = auxiliary_device_init(adev);
 	if (ret) {
 		of_node_put(adev->dev.platform_data);

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250608-fix-aud-hpd-bridge-97ec55341c4c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

