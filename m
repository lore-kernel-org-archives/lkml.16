Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB728688D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683664; cv=none; b=SfbMh/aLOOQPGMWGPy0vq6EeOQT6rxH8Vm5pw1LcXOLRlsPGU/ifJasRqTAomZg79kCKSV3n9vPgvxbAwc/9X/KdCS0j8uwRfw+e7C4WpoLoTwR4wkVnQdVKc71oUPW1DvwwRkfZALqEcQOuR2j9VEOESMPFLPk+k+TFMywc0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683664; c=relaxed/simple;
	bh=Sb1qbqPfpeBQHLvvRmH0mQcObhTRza3WiqOCZtRU5nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIEa9A3N/lzX1Yl3+XqcXr30d7uD1mo6e/dPcx1QXS0TFQdKtslq/MqQ9a3Mozd6GJ01u9mbNBOac1e9L3X7nHZifKyLkz9MoholHy+JCe4RjO4Sxy5qSOuzcHfwwSiB4lIRdycFikuKvlZyjXi94LKpLxB266K8N/5szInxf/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTmFW+gh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTmFW+gh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652C2ZX028454
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=; b=XTmFW+ghyDk7TLHR
	epoaKIjmPjSlcE98Sdc45wgMqA5lYHidLTU2MCMNSRcI3CWmdxj5Ywi7xPOZk0Xz
	jjSXqopd1aFXrR1Du+A/37IIfEylbUQcuoe3xe1ciwZfPj09X7rn2QVujh/V3ixB
	ciBLJllh8BwgcyUsj6rSMsB4wqL0N+5CVdPGj12gz3k259m1L2RbQWjMO/fAQY9+
	pT/fhplQJ6YXJhcWAZ31rHDfjXlzM0yDHRFwyaLjEJjoalOkKYLcGR08SV8+RxTL
	SYA7CEJxZ3AuAd2dxsuILB81fbRAWB5IvF6vgAszpYCCSPFxGHlRGzo/ve6t6s7/
	eTT3xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag136-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399065d55so172816585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683660; x=1752288460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2ctqz8C7Fv58oSozKmoJbscq9Is2yiOi+8iK6eGMbo=;
        b=Ik0dKK52uPKaORALZXq9x5RcRTk+FvIoyQFjh5pr3X8A4Eyd3nyzaXLIABC6vwEnGi
         5++2WHZGZ5DOaZ2q02eZ8mLr4fWooufZxLlCbAcjY2F50CWHFpaqJ5GVaioQWFMrvj+C
         xw458OyLumWuHXQpzx++9xVrVR9xOfF5rD+IqELL6gDNrsBgwU0PmtviUOsvgSmTxjWs
         mEYujWIfrVuk1TyOPOqVGUu2W3jToibcHxZyADVDn5SiX4Whv8bserD8C1ZTpkSmd3PN
         XEVG6eMJ6hfw1K2XxBiMRkB1K06AQbeku1734uUqPcfYjcfZheJbftclasSuBaaJpuAs
         CUKA==
X-Forwarded-Encrypted: i=1; AJvYcCUfjNhNPr1SeChl9pv5liEzpcbs2jjWbniQJSExqW2+EZioj0saXihVQU+V3j7FQ4FzJrwqq3MI//y+2DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Sjep9clPGXXRFQkn/V0B0zN+Tr88EMnhMlaXcehXbwa+lhb5
	9hpBcGfCy2CdGKOb+koGX+PhmEbwxjdwTYM7UHyUnPf1KBPrOUSlpGTWM7Co+ExmZThfW8AbMNc
	eUFRMoTmiItlZBBGSSQA21qq+JBUGkqNKm2A02jfUGul3bavxyMse21rYpFISZfcr+npueCpntm
	UU2A==
X-Gm-Gg: ASbGncsqXBy7Dc9efPpjoxIvxjZIYYzF40ve2hYtL17GywcUfpqTdeo7U4HYTn6rsu0
	joob0KwK/97oea++XJb2IYRb7HEqLZxAJL6Udpe6wJ4tAYCTJASfhGOeSMAZ+c6ZO3o5gFgYdxb
	klf/aeHQLYjdsPQY4LZq+nmvsC1fDck1VIDajdnOUQbv0fdR0jtYVmnB8AH4P/JPS7mDXhfiQkd
	AbCx9CvsTmMc5j3rorgKWevjK4om0b2Pc0JDIEBdJ0vBoeL1NpLItEGbZOHKQ4d6XET7EW9hnFu
	XWwnoDos7+Al2PIfrjumCX6VcNSfDkRslqnibAiK4LfxR5NZAstynVSAk58a6gpyMSzNLr28f9/
	vPz2qc9w+Nys5VnxcFzShczDLGAApkAgLtfU=
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7d5f14ee3dfmr154599185a.36.1751683660183;
        Fri, 04 Jul 2025 19:47:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvQf4vFSIOxg2wCCgnwprnE70FE9+wlp5S+oMHsCgXpl0NmhjkZssFI2yJpD1cnIfQXIJRIg==
X-Received: by 2002:a05:620a:5be8:b0:7d5:d2ac:bbf7 with SMTP id af79cd13be357-7d5f14ee3dfmr154596085a.36.1751683659694;
        Fri, 04 Jul 2025 19:47:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:26 +0300
Subject: [PATCH 05/12] drm/msm/disp: simplify tiled RGB{,A,X} formats
 definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-5-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9162;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sb1qbqPfpeBQHLvvRmH0mQcObhTRza3WiqOCZtRU5nY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI9MF4P/GQytOow2EvJc/dGCvpDmGBAcsCKz
 VgdwTRSziSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPQAKCRCLPIo+Aiko
 1YG6B/9NAUZAdE6RbK9jU9oBkFgimA+ochP46ux+4OOAmEWItMSqNpDYWKjtf2Z7deovMGT+XnP
 P6uHBhPbAcoEMPKHH99+toNYXPokrDxj7u90XdOYRISCQMi9njwA1fcZWuLU0gXzhfLGVXNeCl0
 r2oFIDpCN6uL0ASgXi45Sexgb3KgULqT+rKlOZ488hxu7nsO+aTt4QLVdr33B20pB3Luj/WM1/5
 MCLhA5THVwT5ZB8ywcaPv+2s2IqG5xQCZFQtox7mtY72xQO0sTxNlwMSmh3R/HZWnH1KRB+z0Ow
 or4GHQUvjsrEkJ6ceq7A4mdQSRxx6wqDa00VlUDk/WKIlTcH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX6BkyxUNjq+51
 ty4LCl30U5O1PthH94rn6OHE4APttmulGJ+7YBlvbVJo3PChfXBUoSWXOjRevKPeFXWCO41ofKo
 Y5n9qQwYzHzZMCJMM3eUDceOW8jaLsTKAZU9PJRo4w4ztl84OcNuJrVhTbs6I6CPFUuTNubDnln
 jZLX193RUPG+dlPSMceVRV6f0Ub7hvhF2ecDuIii7Popk6bjM8Vd032gcGbSTYGCqOClY41zS4+
 mU+BTduclR4uHWkiUk9/ReH4c5jVNC9KvPqaHHwQ8D+iVqH4wY3H2QOxUDfOQQmExUkiPFVsYxo
 ISr9ygPcoceLT9G54Qz8e+CeFD08cSoZ20HhqZ7NgaYvVEsxRiJnjb9gKcdecNg9eNVoY2VL5ps
 ceRuh7TrViwsrxARmVnpMDVX0Kyid9zrJK3Ed4kTLTRcr+GAeZ/yfCV592EPlJXz3Rm9soe6
X-Proofpoint-ORIG-GUID: A4P6sPqjsyPb3Lrp0IU6G-A99x-_k7Ob
X-Proofpoint-GUID: A4P6sPqjsyPb3Lrp0IU6G-A99x-_k7Ob
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868924d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=BVuc22GF84-4pAHDYacA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Define several additional macros, capturing tiled RGB format classes, in
order to simplify defining particular RGB* format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 118 ++++++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 28cef986f2d662484afd47440a79393c48256ff5..d577b3d53fbebced63792b5c65f50dd45211c8ea 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -163,22 +163,83 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define INTERLEAVED_RGB_FMT_TILED(fmt, a, r, g, b, e0, e1, e2, e3, uc,    \
-alpha, bp, flg)                                               \
+#define INTERLEAVED_RGB_FMT_TILED(fmt, bp, r, g, b, e0, e1, e2)           \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
-	.alpha_enable = alpha,                                            \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), 0 },                               \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = 0,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 3,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
 	.element = { (e0), (e1), (e2), (e3) },                            \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
 	.bpc_a = a,                                                       \
 	.chroma_sample = CHROMA_FULL,                                     \
-	.unpack_count = uc,                                               \
+	.unpack_count = 4,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = MDP_FETCH_UBWC,                                     \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3)   \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = false,                                            \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
+	.num_planes = 2,                                                  \
+	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
+}
+
+#define INTERLEAVED_RGBA_DX_FMT_TILED(fmt, bp, a, r, g, b, e0, e1, e2, e3) \
+{                                                                         \
+	.pixel_format = DRM_FORMAT_ ## fmt,                               \
+	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
+	.alpha_enable = true,                                             \
+	.element = { (e0), (e1), (e2), (e3) },                            \
+	.bpc_g_y = g,                                                     \
+	.bpc_b_cb = b,                                                    \
+	.bpc_r_cr = r,                                                    \
+	.bpc_a = a,                                                       \
+	.chroma_sample = CHROMA_FULL,                                     \
+	.unpack_count = 4,                                                \
+	.bpp = bp,                                                        \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED,                              \
 	.num_planes = 2,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
 }
@@ -525,58 +586,49 @@ static const struct msm_format mdp_formats[] = {
  * the data will be passed by user-space.
  */
 static const struct msm_format mdp_formats_ubwc[] = {
-	INTERLEAVED_RGB_FMT_TILED(BGR565,
-		0, BPC5, BPC6, BPC5,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, MSM_FORMAT_FLAG_COMPRESSED),
+	INTERLEAVED_RGB_FMT_TILED(BGR565, 2,
+		BPC5, BPC6, BPC5,
+		C2_R_Cr, C0_G_Y, C1_B_Cb),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR8888,
+	INTERLEAVED_RGBA_FMT_TILED(ABGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* ARGB8888 and ABGR8888 purposely have the same color
 	 * ordering.  The hardware only supports ABGR8888 UBWC
 	 * natively.
 	 */
-	INTERLEAVED_RGB_FMT_TILED(ARGB8888,
+	INTERLEAVED_RGBA_FMT_TILED(ARGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR8888,
+	INTERLEAVED_RGBX_FMT_TILED(XBGR8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB8888,
+	INTERLEAVED_RGBX_FMT_TILED(XRGB8888, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(ABGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ABGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XBGR2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XBGR2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
-	INTERLEAVED_RGB_FMT_TILED(XRGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(XRGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	/* XRGB2101010 and ARGB2101010 purposely have the same color
 	* ordering.  The hardware only supports ARGB2101010 UBWC
 	* natively.
 	*/
-	INTERLEAVED_RGB_FMT_TILED(ARGB2101010,
+	INTERLEAVED_RGBA_DX_FMT_TILED(ARGB2101010, 4,
 		BPC8A, BPC8, BPC8, BPC8,
-		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_COMPRESSED),
+		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
 		0, BPC8, BPC8, BPC8,

-- 
2.39.5

