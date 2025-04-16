Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3324DFEF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845410; cv=none; b=FrdhsamXiQCqwuB/Q1MZPCO1LBOzzHuXKacm0mAsRTtJCSPU6bscMCEFySeJms4I18RscfUKHks0+8yzgWJgJ5BEO8wBBc0weonjeiVTkibuR3s7+EdVoZm5iaoDNeHt3qAm9oVSly64j6qbGEdIcoBPQgMWa0Mbe2t0uyLtcaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845410; c=relaxed/simple;
	bh=lQQh8ylJrHtWLQoXqKNrrnmkQhqGnX3390KtwvC0ink=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjYNiCqYoqXD2U+9ZP0sVIWTs9KOw7bdSe2cVAVPs7rbV/EDdDFKM0n3Tc9m7vLtNqcXrKlnXdUfROuaj7Mx/TADN95tz/UOSqvcy+UNKyV2fMTZ/Los4fJKvDgmw1bO84ZBIEiDQMP09uerQvf8k7RvrqAIyEP+SoW6Qo/9RI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psYFKSGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psYFKSGa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLUPKs007674
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=; b=psYFKSGa8IWf0Zdp
	gDl5yrvUGgl+n5i4lA+2AhKm2kA4ySvUuSAgqjRWvppFWDYJHxE88BhqFuf5k8zr
	GfjtPsz9ibtgxKZCKck28o5FyL0XFKzuCVy9HFvfICtbWjQXtvRsrIzgo7SM5RtR
	CAl2nkTLjdQQfstkx8mCrBEC9PrDoGqb+5KN6TXwCOEeBPv5BYJSOq0Lk44Hc1e9
	IIn7CjJUT8dd09seAiKjQ6/zR7nXqShamY80liNUapEnZWC4OqnKrV988S4hlD5L
	bhspYnInVltf8mKSoB6IlvucsDuVjCuEgriyYbCZDk1W6Syh2hvnfiE0pkxQDiv+
	ce+7Ug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6n3yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so4309746d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845407; x=1745450207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=;
        b=D4BAVxUTVeU9V3XW4GVZ55jw1RafQG+Czsee+LE7XGXNDcQemCpfzurgz+5/ScPec5
         Jq5OkHljptQE+T7KLwYjrWLtH5ecwfbEwKL5IZZSywXDOXDZUhclEQrhNUtV+q6VLwxs
         Ipr0oPsxO+w3Ll/7fYwve4Cn535rlOsrUBPn+cMTKdLyAooQ+AxTNWhlht5nwtNbKJ7K
         DPjbWn4TRALUy8U8+izOKzaAvp1FgSl3Xz0TcufGq6YrC9MC1A17YfRTrevorxF6S8rW
         fJUkALQXP8K5+vJ09VzWBUQpOzJ4iz1nrIS3NIxDMvOI7V+QlA8Ml6AVMY+gLsyxxW9z
         MWDw==
X-Forwarded-Encrypted: i=1; AJvYcCViZAgDa4POVBWQOktHQzBqfPKmqQUtUJaForGgF9Dcw+1/eYviZ273/Fc8PUDHD9bv/I/AgiwM0vVE0Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfeytFM6+si6fam805QQnHZpUGEoauXSGeRZ1C9PGzaNp9xg2y
	KdokQWwsLhlkrLSYS08xrJXt0xqgitQVICGxl+iDeJSbaPVBgZgtJ3DskKedPbeWcPdkXZaHiQq
	LIvt4mQzDd1oveCowjIxBvxlaxXEJCRHAA3B4+C1sxvrGcNEVXd2ubwHjfniAdEo=
X-Gm-Gg: ASbGncsFvEhjpcniqm2+a1j/EGZjmaQcH8c1mv+LfwUIo4saRXQjVv/Is0dpBC+W4qs
	3+XXb/4DjW7PmnQ+a8hAZr3vtzcgZU12FddWJLYRC66KaUh2r8VlSjEOnnzXmf7E1wskrPjJE9e
	aBquesUajkX7tHjUFfr/zTqQJvQIpDg2uSzJynjNnpKBprIpU0UuB6hRmCi/3MTpCrwMSooue/0
	oe2Ingm7Ka0VS4YFYv5CuLvdcYpuQOIN+4euIe6PSGwx415Y1BYDygNnqSnTs7aTTn2Hvjt5kze
	Y0UnVbOfTyOroI0aKX4ePuMCwzAgCo4HrmYSqvXDJn3mIE4bpyhtNK29cBVAqLdKtKkTeYdp0Sa
	uo497SWVUhXROBs0xgoVX1F/p
X-Received: by 2002:a05:6214:258b:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f2b2f1f463mr61447496d6.4.1744845406997;
        Wed, 16 Apr 2025 16:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEExfurjoRk0XXDux2AeafmWDRteWsUt3LSo3MCvlJ+i86Yzmt6OO1ISBEL9kuOhXHGem09Dw==
X-Received: by 2002:a05:6214:258b:b0:6e1:6c94:b5c5 with SMTP id 6a1803df08f44-6f2b2f1f463mr61447246d6.4.1744845406624;
        Wed, 16 Apr 2025 16:16:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:36 +0300
Subject: [PATCH v4 06/10] drm/msm/mdss: add SAR2130P device configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-6-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpRzs8G5GSR/kripA/Mt++az/kf9tb4wkRPT
 zWUR/sY9OGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1fs/CACvhyvRY1vFiTBxUDkPDV+CWAFVRYLGp1bsq6je6dejKFJ625SQEvvJNEoKLoiVZi8sd2B
 x6vGq9TKEEr3pWUjSQd9IueqBGVmicfKCOIeuigoBHBD4ZCEStqXzalR7sICRWJ0SxLM2vtsAhD
 4HvX5gv906hJNctsQ8kL7EIhXViOAOUKlGAWtU53NwpDIfY9sIXDWkoLCcnQWbgWzzxzTgy7pI2
 10qdApZGoSEU8WGwRkKmUjRILwA47wPakWx5Z/+nUEM1xmiMZTM5IBR0hfVNDR5Thg2dStbhlA5
 1I37aM5lUJPKktaB1k1ozoMAREvTjaj2sdmftXkzVA9Bjueu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: eHEevIDv4OZv9dxwJ2bc4vswVKgSXRA1
X-Proofpoint-GUID: eHEevIDv4OZv9dxwJ2bc4vswVKgSXRA1
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68003a60 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Zo32ic80xGYl86IK4a4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

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

