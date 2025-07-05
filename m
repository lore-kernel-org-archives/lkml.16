Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E128C2A4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683669; cv=none; b=mrEaa0cHm661xDtX4sJ0/sFae1lopA9y5ed/nM3upNJZ+mZvrYk/aqvJLrpQh5tVtY1tK/F1WtmojKyKz5g4euUydZYZYazAWxPPaBm7/CkN0YCh7TU1htHFhJqXMaZ8INaO0nkHIMVDn/0hcv+dhEZ6nFnIvivvh2gv5iDkYPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683669; c=relaxed/simple;
	bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twBnZVaXeHipCr/SU6EacwL35+7W14FJD7+PwfUnFKELlaiWvfynjRIfY0FA4Z3YqR9Am7044xn/Ysd7GJYtbCup+O1q1su5peZDf1U99OZ/I0ANYcAcEPi+8m4exGbB7celnbTFh1nW9qrmtQJRTZ8g/vIXCQX7cnhUPx1z5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQHeq+9u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQHeq+9u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652CND3029409
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=; b=EQHeq+9uUm4I+8kk
	MRNOz7ewTCu4jmPtca70FrKykBzCfHT5mjeHnXt/UynFLXCNGezgON4tXtkGnn7h
	7wgUwXOJHNVo1p4Rn/f26RFxtGmiDeGo1ToA7uzLMgkaCS6/Vr/zhau71UaZqrQw
	9C2OuCW8PJcvfxClT5xEgEjgSdqOh+/772BvuF2hAsqhhwsbxNoY0OKlv7Skn3/6
	I8bHkr63lbin0bIEQo2bo5IQOtLeCrtTljIO5J38mUeBRZz2jAP3IqG5B1CjxVNK
	AsWXCpq1SL9DOF49A/SuuVcs03Kk2OfBKGPmGIf7ErdXZ61XOLdSDPtOPJk0CXNf
	pGLdBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag13w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so108880985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683666; x=1752288466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySsi3WA2KAoPFxgbMTzbgUKuNpVxIGybMd5gyhdvsL4=;
        b=Xc1TAInbWhEuopE85qOwpjtrbqpbhX8KzpaRFxabckafzONfShE8iNy6edNvH3UnGp
         P7CZCNyxIW/h/LoCm4cNlYWu0VKapTv0KGu5h5do6E0FEtdvO4CswItkekiJ+35Wpx6W
         75AAPOoVcFORqOFMGEcI/LftWODw4wCfJNHWcHyikGGLmAzAsy6xYGU+q/lPhtX0Dfc0
         wk8/GyGhHWniKm5nUVr/GqZKa/da92o+FtqcCLGUeNmTo4reZ/JFKecO1AbrR9H/4wjw
         Ps67yf8xv2WB7El4XimiO5Nk+M/WfHlKMBEV+/tX59cx6/2k0/02oirL3ctIME8LOoeV
         2ycQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7FM59ffzEKcKp/QetH8Smv60jhqL0nR+pYoLz+J2zJcXHpzHMaqoBVo983LxTybwHfKfv0upRasdqAvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxjolu0jALIavAXr/F3q1hYf66U1WoJG/DFaM/J8sol1YvLlme
	8nAwL+JN4ptvxJdfWqHDrEStJWeUfW7NjurLh1yEv76z1mAwti5X2soO+qE4iNiCvV4/e/nAvD1
	39xu45uZig+nTlq0NxYrD5lbPI7xhhtcZyvsqxuEe/oYE6JK0/Lw9vCp9e9Q3YtE+Rwo=
X-Gm-Gg: ASbGnctK+Bmo+V0CW81d+EPsdPHmfN/sEeTRyhC58ye+CP0w559zIPydQ3hDAqdCkRG
	k8IqeYoBDfD24mFl5yf4fJXmPDqS/8kzkd09+eFq+kgZ3ViDFRWgkmroU4FwUbhhELKK6A3cEms
	dsQzeplaLiiCYxlbwhR3TvNp3ExYQ2XqIojZLG4VH/t2Q1zScF6GWJmFyXJmFpSRIF6pPNoewjf
	TCbPA29IugWy0b6r3TjOKX5Ag1f/5FkXDX7OPQSNiPYkeKRv2sEJ3JE86dKAfQjaST+Go4yA8t+
	iCrfglvp0delCOZ8SvNEnII6SKS0GF2UIBmxxe7Nc7EkVEdZvmhLdX4bIjSNribE7OgBOxkcwdY
	nN7UQrzvztXrtqsZw1/rlS/JOyPwsprVI2rk=
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id af79cd13be357-7d5df11decbmr535125285a.23.1751683666023;
        Fri, 04 Jul 2025 19:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtwtMlsGQ5e0xwgineScuK7LVo81xSUUNyI9wwOwhzVC0LLgubWDgPwYkzeO6ONeH2kkgrTw==
X-Received: by 2002:a05:620a:270b:b0:7d4:6473:5649 with SMTP id af79cd13be357-7d5df11decbmr535123585a.23.1751683665639;
        Fri, 04 Jul 2025 19:47:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:29 +0300
Subject: [PATCH 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-8-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zQGn21STxoD+LHqL3zqFBJZONXcRVa5w5iB6awPjCFc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9LZKmNcw7tV7+z+ODXvY0qjWWZ8WxZuq4U
 lsCFURThMCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1W0MB/90ovalKVq+VIoaoxKU3yeK1DswGCM7wY5lnI2NRur9dWGNgY0nHwTqDBm7S8m9OP2iGfX
 LUaxcE43Btwkuu1QZ/Ql9T/kA2y9cwfK1mdQRkn29D6VLuHEyyFd997n1SloMJKaObGiNvEjmvU
 ODlS74FSwptlfcY4nHWVkX7pBMkCjOKl33Eot6m+qVWMgzwji/QrYdsrw3CfGP2EK/Chkk79NDx
 NhTrO0gaSwvDeSC/CESh8k+43yhRb8DalR3oAvzJvJ45qea6SJIBjmxEoh/RqPB8l2a6hiyYMvh
 7kWrLUljb0S50hVIc7pM+OM78+tPblfNSkIwVhsmrVpMx9Fh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX9msT6YLY4xVW
 B5rsmyBv1wfDROiOboSqb8hG5kvYxlxHd+ZpgOyFw1M31KVe80ZC8UGajg2nHsS9Gwy4uV6yUBY
 DQ6oGMzfr7DkIV+b6615SjagWOIb1V8Et3e1jNES7U17N6LANbSGl21In/dVJw6okgU6bR1v5GZ
 bqk8APeZI+pjL/JfvVeHxdaEAkDGUTQjbQR9gsWYHoqMTwgx/Yc/mw6MJJEJjn5ItLyCbPGdeki
 eKi0v+rX4ahytVBvBpvHWzCLVV33HM6a0vrBPaQ6QIT11SpSiaxEuAEdL3I3t3ZwR4ewxCIlLeW
 W1g3ZLro/kHqwb54Ptfm+5rQQY8M2qrPgkkN9+5KGkVat4ABiMmeuNvmnV1+b+mJsfhCF+yDk8J
 i1SRzJxRTEp3k60Txlyl1pfKw6CXjBw0VT9UY/8oKeugzRs+bMmCaTMQzsXFciTanLIhNHiM
X-Proofpoint-ORIG-GUID: YEUYEmY66LyChSwbCPnLjaC7knzXOobm
X-Proofpoint-GUID: YEUYEmY66LyChSwbCPnLjaC7knzXOobm
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689252 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dG_4ntQBwjiDuco-PWEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 6f5af26d4e2d43414281197bf541e1ea3fe211f5..f949810567d83c5924f9dd127261e7d523921724 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.39.5

