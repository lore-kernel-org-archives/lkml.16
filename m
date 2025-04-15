Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82C28DF07
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709990; cv=none; b=DpbQTzEm63+z9d57hK5U+w7at5kCb1tMm39r016Tj8AV0vxQC3CDTj5rQmZhbFQJ1epQ6DYJX7BUw4uTJIKD8SRoGXmXIwD/9dJfHuZc71BY/PJdrCvQr/on1AxQ4pN5164ngDYY1nPCuzs7qQG14XZnKXQL1xg7+cbjBtFw7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709990; c=relaxed/simple;
	bh=lQQh8ylJrHtWLQoXqKNrrnmkQhqGnX3390KtwvC0ink=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRyOP+XuSHzbwaqvQxIpSoiQUvNfMFKqRk8fsx8WFlUR+mfYpRyU0bsqRqwoPCjtm3n4JbcuwI6EuTTOrHWHzxnbmHZbjaDQBXctKzRfAeiNV/uCeNr2oMIeJua2j1uQYgLUoh6zGOGrunDGzg/s3AVf1dhsjSPULPJPB+Gxmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEKy+Dij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEKy+Dij"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIxF031773
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=; b=VEKy+Dijiq3D2HS9
	CttI6+q/ldNvecUyGFgk+PBDZd+y1COnsv091oUDpau4C70e4fnZyfbm47wUfPRb
	5nqukibWXYS8Ak/Ok6BuKz/PusuXH8vX32lNBK9J45KoY9WPx+1fIuiz+usA0B+W
	+sGsuE1kXRfhGo2oEVDT/iEYNmaFeUXtb8xR6ct8rw7qxFuU2RufPOH4v5uDEeLC
	Rx8t7Yo2f2TE096mF7X4OF34zfNhHSlb38eVL4lVhR2shNf4lo5mjuPjueSD5Dh3
	Bvju9vlAPU9wR+4z05sT3D7Yg7Z73KV1zjthK8mGqN0xUSBHTIBiqK4WfMc4WlRh
	varBSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17j0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so1084892385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709987; x=1745314787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=;
        b=DlVtvG2WT2AwDncTiOudkdFcFqGCbLcwnlS8YtrzQRHcgk1mDekFVcz+OcoG0c89jq
         Qda7CYbpniLp8HQ+1GxRdqrYIxNkboxtCIZNaNj9Anci8I4IIbIilRpuJVxxNAhe35f0
         y+r1HhCck0nd/1GndTSVz42PkmxEwQVRgY2OhmVHNeTxrkIJJXDB8Xq8RuWsMSwooDlb
         a0g/V/etdNXtgTummk6m9rRDZ9ly01aR2oW+ECqdnkVvhik/zIPXBM12rXkxXKqIOKfz
         7ZOH7Y9QsqkdNuNsRqPitIU9647pnG1cKjsU1DraQrxldq+3+eyNTTiRlqlsUJLlzzeY
         urtA==
X-Forwarded-Encrypted: i=1; AJvYcCXKWKoPZ5EaRUgFUgC/W9t9sRcg2HNxNr6+18rtYyr6qUv5+kvb0cpOJgbQlmJtUXlLOC0SRMaIiPBmGXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXEYdHvAQUBdmZaD7Kr42Q313xQGniUBdwAkckWg1DwVAlIbFg
	nHXqRMDBLYjgDN3lYAx7iWu8sVhqJ9Xxq4CcHD0cX9d8nz6ISLNs8fiA2zRFRaqZyNRnmHkoEsu
	LS+8n0ku1aLb7Mk/cJSZDb6NF+PPO2gnvOerDSOPWLUrLP3MbtTae/EXofH1sbUU=
X-Gm-Gg: ASbGnctyk1fpXgTJnL/yGciJnnhpWjgLWisbiYwxaYHbKAhZu0a6MhawsEqzgowcLoI
	ULlSBIBXWvVCMWoB6lPP7b3RN1bk7eKJqro1eTHc1eB6aO9MvHOdg8LuaLWtIsguDATybOdXHWl
	UaiLgsxD56wygKnPIX+NOLEtG+qvdlMO33CmqApKzTITVJl/WbH6/JsfUTQ1MWHUFjTVHG7urpz
	v64NJGMQcMz35skHKXXqPemTcETze0GkIxCtvmpUuuviyVQ65U9T2yFP9G0ILucp0HIK45hgBhB
	qNPn4Ur040b9a+R3P8YRzElGpF7Bh8TjaZiVjsFBpdcJ8RcCQh7CVq0JCAOqaEOdMj2sJrpoq//
	QxYfMBAT9hr64uaQK/2En46Wy
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7c7bbc9abbemr966509285a.35.1744709986959;
        Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNnFLA5vT9LBSCJYCI3wYTMJxns+5i+5nNMjNTaaqHqu7WIdEd0lcCu19hVoYSlOsP/K6bQg==
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7c7bbc9abbemr966507185a.35.1744709986634;
        Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:34 +0300
Subject: [PATCH v3 06/10] drm/msm/mdss: add SAR2130P device configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-6-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWDQOXj32DrIB5f1c8i1fbFrhMbXUgwFwuJ
 rK+IaXWOZGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1VumB/93BM4l4rNb1vaPru2JaZuDFAsHysckNuR6nbScwRoFXGKP3DshlAILzwors9FN9+qfY3I
 FPMgJHcrKuzX7MfYGB37yKDkW84JsFXofe177vif7emU+yNciQcpFCt2OMLEC4YicOKMg/YwRLR
 JKkTp1+cbbuZyyTjX83GT332xV0oVphd3hdH+mBpR1yO/kOf8ngxeKlkxLes3AwPo9UYoODfly8
 2OYFQBakGA8BC2JN5bg0t2E/i6gkbgNB793qiSr/CvSn6sZLdWYpODgNu4P2C3BPyYB8535ahbb
 HGAKYIM52l/E67bm+FTgxudqZ8MMZZMjz+R1o4U01fhNfCYx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe2963 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Zo32ic80xGYl86IK4a4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fifIc0lhe4fa9j1URvIrspd6iYFJhkxH
X-Proofpoint-ORIG-GUID: fifIc0lhe4fa9j1URvIrspd6iYFJhkxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

From: Dmitry Baryshkov <lumag@kernel.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5

