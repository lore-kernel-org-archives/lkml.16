Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9528F522
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709993; cv=none; b=TuHFGAmfg1LYOrqPhZ+PwboGdmSNnjyggX1dmwuubP629uqzAKl4/onTHXpHnT8wYsUjKYxrs3R3T9cTXyvqDQHFUnmTATi6Ivyy1xBIpGl7erb70vRzxCEXpEr90Tuv6m0GHUsePo/yf+ZJQuOdRq9avwyleAKupwKO/3qCjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709993; c=relaxed/simple;
	bh=uyn6rjWTDHITUowJs0zdqs419FlfeMOd6EA+lSArPGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anZB+I+3/6gVUpJw84LUSf/1COV5iTsKmKnVC0owD9prwuWH+OO9rvuDyTXGJAy6gM4T5T8PdsrOyBi7u5fCEbicrzKL7d34oKATggfVZ78FDpHF4iJ89+0INKm1LH1yj2s+unH65/qNp+QeS3O24tojsPPx+vWBhGxxzWnpPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxPMCufq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxPMCufq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tODW023401
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjXjlNJQjaowHbkG3YqM6O2XdQTkytP/jZ3dM3LDh3o=; b=GxPMCufqNj1yNkQL
	rqcaw+cuLilECb62T0LZOrN/kBBE7h+mmoGkFDmM6rJJDMTbJ2cNnHCR8iCFNMgn
	eCNmzHY6htQ1tjDaOVyTdJ+QeqLaowwJEXREwEe226o24czNnh+CjR1bl5UikSm8
	X8pe61YJyS685xEd40xRgFQEyOVmtzaCuvnSTZWVz+3YRYq0V+bc4/bVKyEFr5QY
	TCFalDrGaqj0wPJErN+jsueAXu8hcrFT9BMl60878CtrySsZVnzEGeSGh4fbOr4u
	xuPc0KJURnFGJZ7lqgA48abnkPvDZopAe98r2w1oSGe8NhHTYByuOs/7E6v3gwHE
	doKwzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97gmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so804877085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709989; x=1745314789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjXjlNJQjaowHbkG3YqM6O2XdQTkytP/jZ3dM3LDh3o=;
        b=EIS/DOuzsfMuU58amSx5zokyZDFz6xOLVoY1aiY72mxjVhObHnVAFpIGofyaLBFgQa
         0VtOhjz99lCMtuJUWY2rOxp/Eqwk6isovZ9BztsnbraWrrRQAJTJFcJ2rsrfO1cV7Xll
         e97qdc+3MyTehwM6xpVDb7Ska2cqN6C9dSg2jzfBWp4xd7B0cgaCAAtz1vaVwEGU1UjV
         oaoGkx8htuAYwz2G/u41YGFsmdXskLfqPcuXNjZMLLTo13CdYuTyb+6/yY1SPb512mge
         jyNxggJ0N3BpXV4mwW9MjkEk2ntUkCseUcBLdjCBs4BDNd4MCoKgFie+x/iuf3xPSzsd
         +x5A==
X-Forwarded-Encrypted: i=1; AJvYcCWMbemyCeVUWXKSipNAw2B3q89ge2jjpNulDV1e2vAy73OuUWi5aXZRR5LOJLvJHna3lCw1aMLjXCXY1Xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGitPOadLNnGAWJpbsXZQ/DBmzA7O0s4ZqopfV8DsDxUIq0bdU
	SiXfg4PaEt7jxCJ9PQupPFVkDPQs/3t3q7vYwTDyU4SuMLG82p9MXVFoUfDxrgBSDRU3EkWjCcW
	NBaHKtNKp145dlfmUc2I80iz9p1nBphXoMI3ZdhhxqBsFAGDXTjsIxRF6qit7mMo=
X-Gm-Gg: ASbGncvOd6o8cSsg3H4LEYAwuVZGBexBmnIJpQdM0A2enhf5+fuuBH7hnjOx48hzoix
	GxAuxZwHrvTU1a0W6OQ1xG/hPAIHYL1AhQonzte6C0yIJ0bAtBx2rQKya4DdPyLQGeluC0bsYeR
	bkSCenDQ7sh+oEnJxrohIhSt+av+aZy9R2fSi2pg3ZaqR0VmOeWwna++6jVHcFSvDyRzXR4kjnm
	P4Y8ErN/7DnrQVN2toV1wIGFB8qTX9FU3zWk3emRgukfk3Uj6fZsULRgbPlC6raHnKUildNEkuR
	czNliPZ7P+8IYAP82I2FynudXarb9YoslSBPQyI62IodEl+TkobqDypDI24NP+xAsdOKoNvGY/j
	RjNFDb1xeA6ibSx5Yz5ZROjWh
X-Received: by 2002:a05:620a:3185:b0:7c5:6cf5:9439 with SMTP id af79cd13be357-7c7af115a65mr2232293485a.37.1744709989249;
        Tue, 15 Apr 2025 02:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTt3VU9M5DSQiZNLKLDNX7P+6oRMR/cwV9Qvdh22sv/7Dpfg/hivv4ML/QFqiWfEQYSonzGQ==
X-Received: by 2002:a05:620a:3185:b0:7c5:6cf5:9439 with SMTP id af79cd13be357-7c7af115a65mr2232285985a.37.1744709988296;
        Tue, 15 Apr 2025 02:39:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:35 +0300
Subject: [PATCH v3 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-7-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VXFGPbLULr+xGELX+USGVkfaqafdytyi08lrC/x1doQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilXA1DFE9LR6Dw8AVasEoRLrlP+3oPztAgJB
 53drEbQdyaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVwAKCRCLPIo+Aiko
 1ULTB/4mLzW4sxSigYkdzsjo5a65yIkeJB+3gZhK5UceQi1MBNqYKOjyKpn3l2rYMueGWV5Ff16
 f4XRGcSW1UF++CMTjmTCD7j8m+NYpHVx9m7XH02aBVgvLTVr17cnx0j5+g1rgDqPhxejLr9MyjW
 gjQMuidNq6D2duf77r08jJ4MhFCL2tze4ZByyKqJG3ygifvZSCypxv/ZQ5nPbNMHg2b6UIGt4hE
 QiNyO+puz769Vgu5yjLk4zIFmg9fD+nb+SDNF+W8vK5qgrVzkyIuLCGuRTyIuWH5WiCx33Pp1iS
 GOv0Bx05Bj+guv8a3F01idqXSzynkEOuyDUvBTdBjkU9y1nt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZeTvJOXlzpJjml6CmroG-9u6Lo4IU51q
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe2966 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=WWvJJprN3eueWNfT7O0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZeTvJOXlzpJjml6CmroG-9u6Lo4IU51q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

From: Dmitry Baryshkov <lumag@kernel.org>

Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
the configuration is the same as SM8550 DSI PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_sar2130p_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
 	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_97800uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.39.5

