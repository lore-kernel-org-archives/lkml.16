Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8123BCE3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574722; cv=none; b=kZrvB2yrlURUfLa5DpAxy6uDZiz//r1WD/TSaDR+hTLrjipJV7hrewjeuUuetuv9Fw2tjs0rcfKm+Gch9lIRBCa5IdTMBFWFmedNECKYZ+cFj11Mw4QSm1Lnh/4v3mtH6tQg1B0B7Q8YmkBR9geopU5+qcn7jJQcy5AnI5heHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574722; c=relaxed/simple;
	bh=zx7+dSoppSMyESrNu3BFwk2c2JYSvOsmkYctkDdBx7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjImk6p5lat3m8z5zBUy/jnwgvk7JXIT1I8fPAKKLNfFFkc88Dq9wC8CO5JkBeZ2l3m76ISYmDI+69J2SBJUoIw30m0iEBcnSh/FLfwOX6JIDbEKjGdxoIV2I8VP81JSew40VOEENgPB3MVLE8/ZQl1Us64DPI0jQK9aulDUUIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9ujEnMQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9ujEnMQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6uJ016010
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=; b=S9ujEnMQR65qi47W
	HroSG4bST6eVXaxvIeG5r8dhhrSiZnEwFALHjWXSesZ21v0H2tEfaMpf2hPn8JKe
	o566I70ANHDNfFeIMpN4Kw0vp5Sh60cAAXTjpieLbeb+/Wq6m/k1YPD5fOK72Nqz
	DCxq6jSVvVwJagGU/2kk7RctbFx/x+Xn056EvcTS0CfoOJmsdjggz0FB8mRaxNP0
	OCcieAbc2cMV6IkVMFmBea9qud6nLRuGu3BurbSX6tb5mBPUYAHAzR6gOMlNklxZ
	jue7t46m21kJV8ZoslxemP1g4N5RqWENOir1RGoxK+YmNp+LNriF8UZDgQJytQZR
	DObfHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08jj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so369648885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574719; x=1746179519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8whSwmbROd5U4SW4xj7rGIwJr7viTDgjWVNxw4D21I=;
        b=YOSF1RutseUS3RPXnnsn3PB1GTR0z5zb1o7pkd+09rWWTukDwOloeLX2phTO0pz6ge
         g2yx0yKZZypMXYEVA9Qq2300l8RbSm5I58UPco0ZNGv77hV11Rr1j7O31NM7jVQCEw0g
         x6w64NxJB8m8nfp8+am6n8hzbxaMf44YpoWzCpnlag7WDAwWD4xAidm5l/bSHJUu0SYX
         /GZnPMvwbTOmbYvO9h/CWPLV45upgNAuqIhN2XxvT/EPum1iK6I31T6e5FPAWdSrdg29
         Z7GCozFebAUAl4jwou0XHT8HrasKcsp8WvqUiBMxIjhRLoXSMupqcKpFSn/CaKVDUWVx
         DDeA==
X-Forwarded-Encrypted: i=1; AJvYcCVpbjdS3438vweDyZxJcgbP+TfSHJ65GbDq8BsGpw01VulZ+bStSt1TIB7GzrY3RaTwlVshteI8tAQUXkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7omseCYawelphoo1NsgZXeboq59BSAVMKFOx+0M7ElDueDQxM
	cBpMpDjTPNWe63M893LHOLYMNejlGzbuuhykftZOhM0QsJfA3/Kv+BRQKwJhCfpSXuD0hQdl+fq
	qU1uDAH93sr4Tv8GuRT2Tu7Qkjqfmxwk99larR0N3Xsu9ahwbXjwvybkegl3X1hI=
X-Gm-Gg: ASbGnctLiu8ejbLqXJXFeWKmI7jlpVn252u9L8aCTdWRTaDhBZDz6n1i7FpU5w8n4X8
	v16CbPOFT6LX61m0SOd6trRGDcKBfztMjHrUal+4J/tJ9Bs0FiGFd7OEi87H0DbB7tXvSxlqOE1
	BShKp+Z5OQTF77yZtp5Q+DKDcjCaRAgOWcLGwodHIMO9Q+6SH5V78Vy/MF7Y7KKnw6hPiz/oJAP
	9N5Mhqujc+bu/SztYenLPQCI4vizqGGa9UPVIik+kMDLsBoqwHGz35hpZ0pDZUNJSmJhmNTigTQ
	caI4s3XOzXaCW5j5Rl3d5zKbk5limYi1cdD7wxPykirp22kaMd4V58gPoTRWOgLmGzkcN8/m+Iw
	oUBeQklkEQsZEiieaMEDLtnAy
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id af79cd13be357-7c9607ac4e5mr267490785a.50.1745574719238;
        Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmYWemUx6sBPB/T3b50nXsfecUg6EReTeevtS+qwLs/fKOYNGbkFlAmCHLkfS2+zEw/XB0vQ==
X-Received: by 2002:a05:620a:3727:b0:7c5:4673:a224 with SMTP id af79cd13be357-7c9607ac4e5mr267487785a.50.1745574718908;
        Fri, 25 Apr 2025 02:51:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:51:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:52 +0300
Subject: [PATCH v4 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-2-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jcu7uq6H+6YPyRALgxceXQ2tUNztuo1HlOXKZXH06DA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5U3r9aVtf/3nh7d3cM3tjHy0GNVxGrgrty
 ABAzdzfrgiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1RSiB/9bNTmnNuezj2sMP5aBdfaObPY0aMItydxeikXSRb/vuIv409ORenKD0alhIeO695iE8lZ
 aG5XdPUWHO9fgXhk3Iuoxbuxrke/rAONsRKGZc/9lP5Cc/gIG27iuLqTcCd6aGGdxiA6QegYMVK
 aVQhcrHrsfGfCIzaOueCHAES5+IThttFM6yWt9Prajk8UQJ7WDcF0UjWQsQe1fN/QquDJgTqAer
 frSmwKpldbpltLgT+QZysn3Nv8m7wXjSqg9pRpBzrmnHwz39Ep6rRk7FlUr5b0I6NxBvVcVfZvT
 OI79VECVQEcvGp2ACXiZFRqyn94aSdIDp0KjjUupWPN/3uXn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX53l4+ZEQwxr3 0XS7XT/e1kkuzFaRMbau2/QNOE0NRXm2tQMbtZfD6WBoDj1KwMJpHl38b7EwxCAFiLnQWQxOjxS aOiMT9T3WHpnMg9d7HiMhP+DiO8/Y0TFExb8kPWLqW63Fy1pH9vqwIL4KKJFpMRIHqR53Epyyjt
 ITSgg8o8+cnHfIWZ6Y/Vl8itk9UAHZWRNGn2m1wGIGcLD19VexCTCipehYYTfq53HwCSoXm74ug bN5OcbrbeNV5FEWzUhsZx5PfORPHkVeKBm7XRsi64Dhd4Q+P01u8Xpm096pigObtt1jHNUhMkr5 Urb2R2Nm7fOoK7sTQl1Qj1SmaKXwdow0hIZF0MPXPjKOdfQMacUniycTym5v71twSm3hsMqp9VT
 EDBYpzj6KUY8EWLWr3ch98gMNdAKRk0skgYCOPnSN3B7lrExTzMVD+MR7hyM6dDY+0jfV2sA
X-Proofpoint-GUID: 4IIbeURoRZUm5uu9ZQHIipW79XBxwZM3
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5b3f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=QS4NkVPmAqbJGmbYc4kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4IIbeURoRZUm5uu9ZQHIipW79XBxwZM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

