Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261729E071
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442677; cv=none; b=Vn4C3FSp6MWQ17coyaJ3cUx0Z1P55Zl0pjA+pZne9vxu9MLuHGB+gKsyjwcgXNCWCAg+AX66zEJOR9JjrD4apiRUxq3JuiQ+Fs1n+kFa/UAq6hJ4gtqLPaQ2aaBg1/WozEOdntsvXwU/ooeMK+lMXkdoTC39SMpBSc8VsBQ/U6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442677; c=relaxed/simple;
	bh=UJTYwtsGT3nbqjLhAABJUsH2SjJ4w+e0xRwvWTY4cWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ozVxKIyQgTq86Zt+2Ys4DWKBj8+D+ifrp5vAiZtC+kd1p4GwZMYS+fqzvCAEbyhQ+eGKOQqw6y1s0KY5z4nyoQAWIFsi5lKvQ476D9sj5+de0zvSKP0WPKvsS3hORMiwL5SDS4VgEreNFZGRr31it5TxmIoNHivYY9bw01pgHnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ggdfl194; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ggdfl194"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYd4x012126
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xz6606WXp+s9b+803uz3n9kdD2ssImwJCn8lGI/+dS4=; b=Ggdfl194mz3a5lqo
	UHi3+ZdQvrGy7Xt/VT7CKJLjZHyl+aIvn0/14xhiQmVdutsTCEAMLKNZMk6cqFh7
	BGq4O0SetELWifoqNkV/xT2GPICT8uZaN36uvv3WoWIM4xxVTvCjO5Tqgm4/qDcU
	bMwyiN0Jy4yPNkjWAMgIXc2Ysh8XHiS/l/mOHJXOui5EEGSxtmSWqjB8SzlZXhgZ
	zMeesULX0T5C/L+VQHqIP6gWVFagVXAMsICEm1udnZdxPdNpZ25qP5sLK5IQVUgw
	Cqwr0rYFPKfL7FgQM1b2W19j02STk7/YXciDt/ZzwYqC0Xxqhlt6uaGy9SNVUaUW
	UNpO/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1kdq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so82994585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442672; x=1746047472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz6606WXp+s9b+803uz3n9kdD2ssImwJCn8lGI/+dS4=;
        b=Xh4qMUMcfJKKScx73ZxW+6YyMXUmkb19gKbY8afBiIcVKH7GVXZWea2YALBeNFumFt
         Eh/iBpaCl3Op45HDntt53iDKuzDpNBjWbJn4Y/XjAmUrOrJaM+Enn390f7I/0CQx2sNP
         3tBVwmApol4ZOdpCjn5Ng28TeLBRGXWjXi/m1fOuhUPQyj4QpwMc46qorseyzj1fLRXz
         8sS5OC4lId53ASviHQXMblOkEgEetPiqOtHuz6m6DbjTS8Hy0t9sTlmoyBg7HkmrB6bb
         ZPmukVlK4ZFoSgO8YM2jhIGWzu4T5XIa3GY2Z8ms3A4hxD/bLU/87HNJIu6dUB9irm9u
         RQ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5H5i1X43w64fEKeIpPxG1KQR9QL534KRNVXiBBT04LYjWinIHM3p6vPtxksyr269Fi7xprGVKJ68Q39I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nCpvhOZIWhjjt4i94e+bKy0YTLh/9ElO3RBlbCdIutlQRpeo
	um1NpqN2CkTrJppZySmNxQ25F5hB9qZ33nG/qNWokHtWmF2zmOx2GRzDMfFJnOt5RvX8KfXQNJ1
	52R7Lo+4slwhHOkjxjkRrRR27NV5X6vOqHubAgKbnfS/m4dwyLpR0qqKhIDgdIeQ=
X-Gm-Gg: ASbGnctDX9S+FXLPwyl2JmKOONHsxjL25nfuKvyv3x6HCHmdsF3MNkhWkvLxw1+b2ji
	3J7RtEHfAG5y/TDgxI4W5Ir6wkaxICK+lL+2w2EuVaHRVcYt+ymA1S+1sLLptRSVhSNfq0Pzusg
	IQNMlVPFmI9p/3htxQYP6Wr5poEorbhhCXZryh98BDInbPJWb45Y12xO0yyg4kexw3Lrv3uIQxu
	r884DOKkHF9e0A5DrxzYq65NcCeSqANfQYdJOqFowIyhRGrQD+aHhUdqSa+v7GBPTQ+2JWXLEMq
	w3JsTEkslq/N7XqTJtFpqJSiwd8UW1TVE7swmxK7E46RG8HrfW6BWFgpVJZY8bdReoL/3npqHaq
	qjJTIOBE5An56b87YoWOsvPcS
X-Received: by 2002:a05:620a:199f:b0:7c5:5670:bd6a with SMTP id af79cd13be357-7c956eb157bmr50596785a.24.1745442671942;
        Wed, 23 Apr 2025 14:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESPt3RK64BW1DTE00z0O3BAxspMGtVLb4ytLZd2o4Tr0I2+Z/OZa3mf6XxcQZ70Pa1hOgpYQ==
X-Received: by 2002:a05:620a:199f:b0:7c5:5670:bd6a with SMTP id af79cd13be357-7c956eb157bmr50592585a.24.1745442671428;
        Wed, 23 Apr 2025 14:11:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:20 +0300
Subject: [PATCH v2 24/33] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-24-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8937;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HOkBs/6zBYjscOwL9t+s9f3+kkK5I+SwIYI8RcLTw34=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctmgVurNwAYEJFpA4Zw9ZG1w4hRQEdFFqVj
 kg93M3vUnaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1f1NB/wMU4ysJvf0NiIhGNgq4avl1Ut1itt5HDEzi3JmSh23hMOp1Mi95CcfDn7Y1OW33FPWHdc
 nx6ddCXDHRKZdlFMiCiGc2VMaYuuoR7/7p2JTBY1gNE1ngmMgtY5ZXjMx4vk8dOUJSfCbo861vD
 sX9n+BTW9+bdNJ9cWt16iH6PsBwwe5In36Mucg2agXtnd43GeN+hkoNSghw4rG2sOvdRb9NlpQX
 yQLjmLcTDwbvMNTJOTO5xYSbptk5JkU7/qjtHaOloj2P7fgIjo4ocsC9QMoXWJSbgvBfrFvw3aw
 xq2aPY0IBBoUBGlJR40V7uY/kkIP0dK1IMlqQthz/WkiczpV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: gJ3DsRLb_MqqPXq_I1VQWTTR7P3zsH8j
X-Proofpoint-ORIG-GUID: gJ3DsRLb_MqqPXq_I1VQWTTR7P3zsH8j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX9mjwEh4mzeAh VgdD1JxflG/wwl3Ia7wiDOwTjH6NqyKtEGrCaRAq2UDBqJpY4wz+03BUwE4DK82+5tWlW1v3sQB tYW9ykbd92Xiy/jXcl8K/PYNzlU519WsXK+IswiAzks7ZJCs7S2MUr2bYNPAzRLD0yl78cxtgSh
 AqcwZlFNU7av0HSXPQpbXb0+lheQY725el/yx6cvy/UBIqchMblQm4uHmB83C20IK7Ji8eV48YU ODycXEksHj8JQRa3k7jyykqdTImXkL4vrjcZTHh0PiqdQaIo++8Oq1YehNanl3BJP7iHjLERNo9 cLPrEIkJjX7iiY2Gdd3+9dP2zMW2WqER/jxcCAJlOXmvWv2noKp5fUghD2/rLoMzdKDx7/ZX11c
 LmCHjaV6xKrgvOpfsbF5OoPO6CaOAa6uCnTgbzUR5Rty57uxcxHnxe+fT2imSnufhEQB5bdz
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68095772 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=s0E_TIProlikEKm38KMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 634b7dc452839f994c948601fe9a09581cb42a42..c5d964e915cdde1f8a83c2793b0020d7cecde672 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -262,19 +262,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 59e280edcd508c14ee297857a19e9974970566de..dc21c5c232a7ce7d8c21d3a3f30a5c1bc352ddd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -261,27 +261,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index af0d789c47917e9b712282a542c3d0886313c049..c1e620ae9596f400655b64b47e6b51a8d25e1428 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -195,11 +195,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 4da7445aa8019894b35b12ace18c0bd6209b9148..81af11630202943b910cd5896f07a32e53a23c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -261,19 +261,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 6563296190bb27b6cab1b03921af6cff34037cd2..8cdd601a5350e80a5324db42c23bdeb474a59b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f..c08d8bae3293d00ef7ff28942699ae2a52e2cea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ee8dd66a68f421161961495dd68d39dd4622ecf6..981d259c33631d31f0216f5cfae948b828d03592 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,14 +176,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f917ffb85d2f1b1a0ee826f125d02980b7a79052..f118c6caa1b9007eb03fa9b39efa87dfb46583ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -169,7 +169,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5

