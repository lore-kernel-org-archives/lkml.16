Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D7274B35
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751683667; cv=none; b=LLim/NdcRYQDbBNqa4LqMRbdENSrfMx4/b5WSVaDlgrvBsSSAx4QAJY0ngPvtZa5pEYvz4Ipd1UbDDyXDeRVLfG1G7JDV1EH2pYWT8nlKokOVARESqWz0Brfmn+LPi8iLjm+TlA60npk9NtJxvBwBnqmuamKhOAzitG1K7/4E9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751683667; c=relaxed/simple;
	bh=tBTRVQReAX9n9KrkvZb4yrkMs88kXRzSL6ZE6wG1jPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/7UoUGi3mukU/LcKU+I5rhmY04TS8jfb2fHEWa4h3FI5VpEMY43b+45UcbBW0Suchc5P5BOG7j9mS5/n4TFXG9Ln5E/mq0qo9PpQzDJAw2QN8q1EjCt1gVGOd0eN9K3cyyaj0tpF3amqwRlCMpbDGXSwVU+em3JpbZ5OCpeDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bE30fd7f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bE30fd7f"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5651Svdf001018
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 02:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=; b=bE30fd7fNT1EQ728
	mx1VRIfChUrqBb9fDLkhcfaFEMq5OsGiWcweJYEVc9BynSVTExFOdNQpxvl0nhEx
	huhS+7Y1215Qnh61TcYytp1PEYFg3Le12WowqqKAy8c2gXOiu80Jx0weg7dcI5hJ
	oQV8js6mk4x84gNc0bvRLZT2N/yYmB6LtM29GoZjxoVaUmFglmT7wcIkY3DG1qtk
	DxGuTsqXcte8+NFYwho22nIJJKhDroiiH3USR3I5hW4sL1dKqLcawl7RglK/S4x9
	WrhOdvqeuH2DN1wKN+59jV8OJgnj8xbKfBBMmg69xQsZtVjYbMIG6PYsin/CTKwO
	3LtyUw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802cx10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:47:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb3487d422so20090996d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 19:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751683663; x=1752288463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKzndPu78T9KD6qlOnp0vaK4lOncIgXRX0HdtczdfIs=;
        b=RknZPSLtkFkNmJpHh0iMrGUAiHc7q21u9keTFWLOJeFQ7iIflIaTquAaHw+MSADE+B
         aDQBlRyS/oPTVr2WMysNC7c3KPuRYkbEi5uSNFcENbzvSLBGCLpt2TCreJ1ZAe4kAQzt
         eY3rHNI60YJAEa+8L209Yw426p9cBbGzwJx8yqmu0HRRtXM7T2bzTKxaFwYxPMYJgkUV
         F2TZqeqt22qU9UFlu4/jVKAl4y/lTyPVKYk1SenP0fXx5VSV6Egw1ERYPNCnTViagEKh
         mZb1oItueqrzQmQ6HGLAY1fUnnI/+jAc+9VQNKr2gyDgIbATBy45SxACZqxw7Yqc92BN
         trlQ==
X-Forwarded-Encrypted: i=1; AJvYcCULxjid8LWKHoeRBnu6UdfErbCO+1fHDHCShOq2cs+41EnusDK1zDDE5EKhHOsFBfMbn+aecULiAabTSYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS3Le4+jGhF7/CFbs1uc6C26raCFcQ7sppiiQKB82w7BkHyK/u
	g0VAibapGHUJUr7X7xre2ZzFXM8R50zkoEZONl+UQfgo4cNQ84PPXplXiibQ/DPBbb7mIl1X/n9
	s4hV+Vz4kKe/Fs4z+dK3bbbAPkWznzGrQuKV21CiRooiM9q3fCJLPyOjadmXO5s6e6dY=
X-Gm-Gg: ASbGnct0r4zkVi0CuIw5aVzEmwmDtehDB+RbnvxSSeS+0u5askSrNCCU7iKKHN61M+E
	6w1YPN93Hw2WNsQSOncnfUyBauIKdUt1dYOZArLNyhXalFORRyp8cqj0ceh5UuoG/5Tosaw9B7h
	vTVKwBXj/7IzCAfqZ9ASgwg7QdYy+4SgJMsel5wUpCdTSxiwryo4bg50KbaD9IH0UGLCZD5CYGE
	jwH8xcZK2I4SYOyWPKt27AECnVNfELpiR26Kt77Ygp0kE8Hu3JhVAXYsxip79QQKkfQdHbrMVgc
	L9PqfYAltrfiP/FLbVaOUfAm9/OE7EBmShbcXSr9Dfecbz0XuSPSAMq4j3Ts0ySfbz7Dii3BTv/
	vodyNjCPAFrXlX4gVVAxFbLvTWnshCnaDi0k=
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id 6a1803df08f44-702c8bc0d61mr59982476d6.24.1751683663517;
        Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhsBwDPbjwXmMNVNZnztP2icDidDytd6L4/eciNVoQ94oT2wPJEDuuw5S3YagbqjaeFDqrEA==
X-Received: by 2002:a05:6214:590a:b0:6fa:cc39:ab with SMTP id 6a1803df08f44-702c8bc0d61mr59982236d6.24.1751683663082;
        Fri, 04 Jul 2025 19:47:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 19:47:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:28 +0300
Subject: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tBTRVQReAX9n9KrkvZb4yrkMs88kXRzSL6ZE6wG1jPw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bGJNv7nYwCLTtEXDvuV3MHGbXqX/+37yGTBafoY4WMT
 cGlRTadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIfAX7/7jnPW9kAh70PpKP
 nZOoLn+ritHDPvy9r11DBQPDbgP5U3nzK4/dT2VNUfRYv+3s0vgVPaf+TLoatcy54JJbuuLaXMO
 3vybJeXv77YkXaH/L8+JdxUPf63anXBMTki07xXff534bs2BySm/CA+9187hvej54Fz3vaN/hF+
 +56i3Xt7DuzwqyYs9b8pPjP089y4nYQOdo6b0aLa1t/Q9P57stZf7167rnXA//X4v688NaIxun3
 Oxl4+H+WiJcFHU6cqnJ4d6Gc3WMPF9+FP83Nl7wpPhsJWP6yqMKXKs/1jEceaVjesk3d6L987c7
 t9+1mpNVedbDsaX3Xoy8hbarFf8y2cOHBc2LVvx22pYLAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: L1_k6aJ1357o6rASCDRLOBF9sxdWeuS-
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68689250 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FCw1dLDEiFPyt24oSuoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: L1_k6aJ1357o6rASCDRLOBF9sxdWeuS-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfX6RT2eQvO1Zv6
 QLEBkeQIu2EaTLf2lBd0pk39CV/BcrHac2zmKYmI8teUDHmLZMFbA4Dia03u4NXqxNdfKSnXeA3
 cvF6Z6HJ9wNm10Ieu7uO13UZwqVPLvnDPQFpgD1sUmGTS5SZgNmBHg/0i5cXh/ZT0A88vv4oCuT
 meBLOLfAixRet3cgy0R+bBvO6TnMvXMn3dWMYsWE9k9IUlpUGu5JUXpVL0tgBst6idRJ2MAplp9
 JrJDnerOhjKa459l6FCCTT9Mb7qYPVrfeTHHGsf//UjTXEgfOXXjj5Te7buZJxtdrfkG6+SFBpu
 TltsMuaR0jbMya8/chWl1NW3AJXFn2nhdYIq9Y6zbOdfITZXXNIFWTWIiAWBUJ4XmpI/BVGwWrq
 Nzrw7vGtNptWw84ttkb8pjuRqg2pVkGSuyt+bfVNVVVwVh2J5mQ3kJHKtgzPqDgo8AQcYCXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017

Pull common params of tiled YUV formats into corresponding macro
definitions, simplifying format table.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
-flg, fm, np, th)                                                          \
+#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
@@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
 	.bpc_g_y = g,                                                     \
 	.bpc_b_cb = b,                                                    \
 	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
+	.bpc_a = 0,                                                       \
 	.chroma_sample = chroma,                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.fetch_mode = MDP_FETCH_UBWC,                                     \
+	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
+		 MSM_FORMAT_FLAG_DX |                                     \
+		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
+	.num_planes = 4,                                                  \
 	.tile_height = th                                                 \
 }
 
@@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
 
 	PSEUDO_YUV_FMT_TILED(NV12,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
+		CHROMA_420, 0,
+		MDP_TILE_HEIGHT_NV12),
 
 	PSEUDO_YUV_FMT_TILED(P010,
-		0, BPC8, BPC8, BPC8,
+		BPC8, BPC8, BPC8,
 		C1_B_Cb, C2_R_Cr,
-		CHROMA_420, MSM_FORMAT_FLAG_DX |
-				MSM_FORMAT_FLAG_YUV |
-				MSM_FORMAT_FLAG_COMPRESSED,
-		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
+		CHROMA_420, MSM_FORMAT_FLAG_DX,
+		MDP_TILE_HEIGHT_UBWC),
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,

-- 
2.39.5

