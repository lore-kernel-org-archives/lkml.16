Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB151D63DF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484322; cv=none; b=ZvHWRixR32lo/r5FtwbE0BiVfQPX8C4a8k4LRuzt+J6U71sQGUQZALywtkb6uySDY26EfQRYRnjszQA8a0GaejbxnxqweXR0TiQ5QDD4sNYSFTPFM1vA7aAF2pb1GDL91yxcZwnuIU7WahzNUhGo8Oorvx6n4s+5VJnr8eET4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484322; c=relaxed/simple;
	bh=oOHLXQ/PS1QWkADzzpFvezZg/SQH0pidwF7pgTKLJlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5oWx0+1/5uYMvQUlZH17xctqYhoPQLRgYc8g8S6IHvhXAT+60VNK+8Z+65QphR1pAUWmGPb23qVXqXxKrbcDF/uNTEVMhLNUsScctJ++z1RLzsYU55n2wVrtzPTyHio/N+NO0vj4U/0LJGNRZuFtTuNO8XfWoJU2J2E6tbqepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU7+D20E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU7+D20E"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VG8Klw031775
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 05:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6YZL2XT5oTD9JdY1E8WLZd4k+JqH1zW6qsQBJsA92c=; b=KU7+D20E5808f+KP
	NgpjbPbLXZFwqtRT2kep7hT1dLmTW5H9Lee/UHQrHgZtHTGrqPO8dslmzFvfbbOK
	x+/RcMp2M/ZW7J/U5z6qhl36QezoHP8npXFGm+fzLxriDzw/7C+vH78bdaB0Fard
	uLQg307W3SEOuMG8sqRxv5rdBZltybYEMvsr1LPQNbUweXQABg9yswfLrgb0Cqid
	FbC7v6rN4Dg4SsMmVIkkEK0F/B5CbWp+xgpYHBKyeetBgEBTZ+WKGhNoiNMBXpN8
	zbmmJD5eKSpxh3iSYapclqhfzxBsToFITqoKioLxXXX0fViF/O8VbNc7MhVsST+i
	R4eOdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7sj0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:12:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so1031021885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484318; x=1744089118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6YZL2XT5oTD9JdY1E8WLZd4k+JqH1zW6qsQBJsA92c=;
        b=Iv7k958kOuI6v0088tRH5SPjLJTbA4a99Tblw4EQb4XOPTyBzSlBk2Ro6wntXDwKzU
         FGNlZa6DFeqHywIwK8OQ2Ozmoy1Y3XgxBLCSUWIXoPHM9jQe6I5EhkrdDg5YcSoP4V4e
         xYDCpyv71MGPUx29r3l2b+u9Oghf+w3xJZX5jNPDqK8dX3BQ0FM22PwsjYWFpBZN+upQ
         WIeWU5vY2eGYrE2HQMqWfPk3YkPpzeV3QEleA6OdEbaP2ZXrcuX6hadwP8sZe8aC2Sxj
         R06MB8Enm/tVdw8eHza6u6lokrEhcrDaZ9GsCbhaThW38wCsx7ylKfGeLUOwYBua7oBT
         aGjw==
X-Forwarded-Encrypted: i=1; AJvYcCWURpMiiMA9GNN5VkPNm5ODmr+CsUq1Gz7ukSG+AI8oDEvcZl1Sso/HK/b0bTSr7pXJ61lelA9Wv9eXTEI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk06K5CznfPWvgprFUGpkpfeQShLBNoVTfMv5/qmTEu2YYfUcr
	g+A4j+cWgpF99/rV2mCWU2QET3A676EBV9IG/OZiTd2IZPSWeMU9V2peest46cwuoKQLtrtjPPa
	2kJFvItotjc4HWYAMc/ZWbMknv8LMi/YtzqRnhs1uQbbZ7wtWjt3YHK5Lv2IF+oo=
X-Gm-Gg: ASbGncvjU5tXF28EcwXq3aSeJLtvey1k4GorpOp3Wr0Zs6pnm60hhOjfbk544UiIe68
	GctopJwXgaDbJQyFF+CegSiMPyOzX+mowpGdKmnZi/Y2Ch2MzIuHGOX/jBiRTx2wUTJ5lxbA4NV
	h+qMCqRD5Qr68jfRWLnEMxw23geAEaTOKivMkoluvGZbma4Gm5Wfjxp4kpDmUCFy0eNRLZIuJaf
	6x3Eg7SWMIEcd65jYrt5Ry1WFdzyyuGWViwYzpvYoWvU6aP/gTfPieVvSItoIl03AInNnhqUL79
	Wu3mj193Dn8BMTQ1aobd75H57j582oS+RsoNdAVVdjIeRBWiqLspquO14jQ08uxQ3qJVVqBpQY2
	8W40R4o3SWuVjM2yGuQXVptP2ySzI
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7c690875522mr1892740285a.43.1743484318338;
        Mon, 31 Mar 2025 22:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkkyizkr853F+xZWRcueqn9rSKTA9DxTtGQrKq0tW8dXyPUtTl4nbZ/r8/KPTZYprk3ktRxw==
X-Received: by 2002:a05:620a:2908:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7c690875522mr1892738885a.43.1743484318048;
        Mon, 31 Mar 2025 22:11:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:11:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:35 +0300
Subject: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
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
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oOHLXQ/PS1QWkADzzpFvezZg/SQH0pidwF7pgTKLJlU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQTU4MLspe5vr5E+cIuZXf5/aZyt03r8Xtr
 XhgS0FtIFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1VQYB/9GP2loEJeNChEDibweW7b8I4wmpDKXFgpsj8RxeJIBeBtu25iwzRmUaqfJHSbXL3O0KpQ
 VO2jff+Nmbppnt6MfZTXE/h3K4PpitqKfUnNqNR4Q1as1gcXR9us4WjxqoNdFNcKXjs4aj45Has
 vEHWRq2uV9h4u3MgmCdnBV17mLhqbIkurFSXG97KoY1FZL1bTZ3v/g/1QkTNlzyBSLfPon2MIxj
 CSvbitfJ3xjpftJ7Om+976ZQN+HOrO3a1BdMyf4Yq0qy0xqkCTxfyaeiTN66rDJdO3KOvdEnCgA
 ulTL3euYtUMGx5CQz0fQpwPvR0uR43i4YqwcHOLUZs6UZvk0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EJOjj260WQg9K5N0kxR30wPKv9t9HKCv
X-Proofpoint-GUID: EJOjj260WQg9K5N0kxR30wPKv9t9HKCv
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67eb75a0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7AO8d6WWEX918e1AdasA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033

The dp->panel_is_modeset is now a write-only field. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 82dc4b01806f9728dc882b0128171838e81f21b0..704c6169116eb2601d2ad02dc7294455ceff5460 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -964,9 +964,7 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
  * is false, the panel will be unprepared.
  *
  * The function will disregard the current state
- * of the panel and either prepare/unprepare the panel based on @prepare. Once
- * it finishes, it will update dp->panel_is_modeset to reflect the current state
- * of the panel.
+ * of the panel and either prepare/unprepare the panel based on @prepare.
  */
 static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 				     bool prepare)
@@ -983,12 +981,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	else
 		ret = drm_panel_unprepare(dp->plat_data->panel);
 
-	if (ret)
-		goto out;
-
-	dp->panel_is_modeset = prepare;
-
-out:
 	mutex_unlock(&dp->panel_lock);
 	return ret;
 }
@@ -1532,7 +1524,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
 	mutex_init(&dp->panel_lock);
-	dp->panel_is_modeset = false;
 
 	/*
 	 * platform dp driver need containor_of the plat_data to get
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 774d11574b095b093ddf2818ad5b84be6605c9bf..b679d5b71d276f458d905c936160f107225bc6c5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -170,7 +170,6 @@ struct analogix_dp_device {
 	bool			psr_supported;
 
 	struct mutex		panel_lock;
-	bool			panel_is_modeset;
 
 	struct analogix_dp_plat_data *plat_data;
 };

-- 
2.39.5

