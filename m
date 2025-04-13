Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19D1EA7D9
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561992; cv=none; b=tTty1nN51KpBcnGDo6imZGIriVuIDL+bL9Y4ohOEF9COJ8lCYrjuYH+AncrCOv03QS/kTDO955pv0wsqqmOkO6ohagsmLf09R0l237VfTNlYAEo7ru2A4cOeluw7N0xZ7HlSdLI07FpFcls2Kx2XQaJxumsYCVA6qwAJadCLl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561992; c=relaxed/simple;
	bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSr7ZSU6IXFDkmectrlMGRg25Xwq0iL/5/gtBZGf8+zczaR/H6m7Z4YI322gE8Smvs86C+awBhIWwvFmw/Jhx0KcuwyFEBt7kdIRjwdPV/SC7J4Ka54GpB7s4rnEqNBJIlVO348odoWZaCXlpbceLlReXNyWhuPshJpwh6Ounbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNFxRR1m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mNFxRR1m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53D93Kn1026123
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=mNFxRR1m3X4F/rfZ
	SzNyS/4UrnRiqZQFXlnmARW3+J7zlyctBx+auILE8jjyTVP0mAszsWi2ue5GAcUH
	T53BKEtsjA+czQUJsGBavS4uTDc/+kyvRFJsKmHvZT2nx7A0vuak56XkoeFm4HkD
	6zjpGGwZh5VqbLmI3ajBp8cBCn2nmdMvGgkmfP86W1jy8xeWfJ79g4CLu6U3IvJ4
	415CxRmDYwTFHnWrUxXILhKaCvyOv6Zc1xBPlphTk8gcf5jy+Rr32zUXJkwcpCcp
	M9Dl5kg2fC8xRQ4OFBTSpb7CBtMkAEAnyNLY+KkAH//fsNRyuDLXYPjYpMYRWNsJ
	Pr/NQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjadcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eb2480028cso60932856d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561987; x=1745166787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
        b=HNvKfrnZQBmjpoRsQeK4iZuoRphKZQRvPh5zv8LepU61/TDpRHUinE8g9eH6+Y6T8p
         gQJDKqNHHdyjP8GOcWEi1yKTDjHxL1e/areHON7sgYSFElir+vxWEIUnMqJuz2J08kYJ
         kOeUp7yaeTcm7xd1J3iufdUcXHGbF5oO/NMChM3A2aIIMIOTDvaNhqUOIDhbHpMYTwN8
         RA7O6J2EbBhw7lsqiCQNVMadaoZWT04ixVLEgmZmK+n3fLMkO/RrxK2icqQ5DKvDBV+v
         zQGc4qfy1sJFgYWec9c1AxLQpBEhOIE+asU9iumlDX62CRx7gQIFd17wHoEalqyWMV9y
         TkwA==
X-Forwarded-Encrypted: i=1; AJvYcCWYi4eaBxJERHb+uD2giSMhCsP8KoaC0SLhpUcEyoiPa9C3O1q08kVZARojf2t8X2x2mLkd93BdvST7oXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJ+DORE1tfiMLiO7EFfM0FUZnujhY/6y/nveSQmqMXy9bS3qN
	f3ToHAZUOGUgaoKHoX23H0BZyVK5wJQ8Y21Qw46HTlA0LSGIa3j/2MlT3bZChGPxkOXIj6HHLYX
	31fJHvoSNkMQB5q7POvhIdaK8c/oPNOq1BzCxn4h10SJu/nfOO0Ndo3lQ8TihNy5GnKWnZV0=
X-Gm-Gg: ASbGncuyYdc/y233iAhquj/p8QsGv/DvCtEvzjG8KkHPHYO0JmLLUlyb9aOUJqx8Cau
	6wfAB7+5HQXw81W0R3jgjRShcJCVdlFA4DPRVltbilbQiPotJkdvWcTUpgCBjq1R9PlXUMqrNnu
	vkGqPdPNcfVA38Y6cbfN/gyJNsLy6Gx/e+ozdVvIXihCOh+glVw3Qlf+JomJlbZPxk7yeanfQjv
	D6EJKz6TohiKICuIKY+Yop8XuXJqZ6e0RphDHawhC2cz55qk3kIWrsDfl4XM/aa42g7phNNO41d
	SAOcZIO33/JNrP7Vto68YlLTTb9ekKM9TO4ybHB/TGMWhc1wRCwsp5xHQrojHrtC9l1gIgE2qjp
	p8CxTNWzrkzno1W8s9le9tbx0
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f23f1188admr152015286d6.34.1744561986922;
        Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGLodl/w6+GHQYPiMmhn35zt6NHmgJcWNBOid2Hlk9AhNDjaBExDvTcFzQwqXWWmtQcU0lIg==
X-Received: by 2002:ad4:5c6a:0:b0:6e8:9525:2ac3 with SMTP id 6a1803df08f44-6f23f1188admr152014846d6.34.1744561986403;
        Sun, 13 Apr 2025 09:33:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:58 +0300
Subject: [PATCH 4/7] drm/msm: bail out late_init_minor() if it is not a GPU
 device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-4-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5I7hkNUFspsI06/XZ8R8h9Li5mG5fqSSyf
 SjGe4M9r5qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1RnMB/9pV6fJTmE9QLlRbc72gU5cp9CDKzI2cO0Ye6XCaZ/bqfpv1aTYAKtPFFa2t/1tB9tY7jK
 70eMELu1I1l95w9Hifvki8tRXsCdT5DNAY7im3qjeYvreuE8Y/WfacKOweJZ2n/pjJIEh2ubl8B
 oRuDMx6SMc08WiOJrAGnj2MmXNRleIRSLrcekS0fpJnXeYjrkRxImZOheaAWwcswwyZapf8F8T/
 kJWigmJ0yWsjDMO2ojx5o0qGf6ssP8tJTVgPTjb/goTnRIJZiZPiSaSxPP3HAR13nDz0BaDcgUi
 TTjK+Ub+RejLZ0huYFCb9ToGBqs2eGcL1lx91btlTqlMQT/g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NCmQwc_BogjKXNwcA1mDZqTJoH5ntG_q
X-Proofpoint-ORIG-GUID: NCmQwc_BogjKXNwcA1mDZqTJoH5ntG_q
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fbe745 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

