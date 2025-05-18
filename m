Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C421B905
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567309; cv=none; b=YzFnwh7fmye9Gn5PHfbELlnVv4DZOVBeKg4vZ67lx9VIG94wYB+un85T0kllX1cou+W91EqXMWQZlc0qLRX2znztAj3JRJqfwoGd1YGP5podsFDLD3Xm4F0cWa+zha2Ng+5IcoeEKOLMLm+gahaQO6Lqzg8s1BW9drjx+Jr/DY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567309; c=relaxed/simple;
	bh=ke2tlzaXBDi/WkjoeX7VnhxmZXFVW77Qa8Cr51NAe5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME0lbrfgrj2E937ZdRiIeua91OX1BSXSI3u/8sIDBw1Qy8rZhyA5rpNt3IWkZYcw9pYwVw9a9VfKruQxaOXOVlG5TKxzmQ0K9U7XR5QOyC4m5XTlWHmYPHwGVKn3eeF8TYmzbTkY0tSX0ApQ31AHvOLrNKmUUhfZUDzzTdGXTJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o70IOARZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o70IOARZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5epZp025949
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=; b=o70IOARZox1upD7F
	wz5ZSYxIJPTHb9+qH1fLSW+a2jNcfX/gBLk2N76zG9QlywpWXcp8zGhhNHg2InOP
	QPRX73DCu7o6vD39EDIg9ob1wBy7rRmlnrnXhCac3nHsZaLvJ7UeMLpltdyymKtZ
	RmexzfPkXb+8ZyRIZF4hRJvmryBkCnOD69qX0xv+jcfm5Z/wIDXYVURfY7BZQC+y
	stLllX9ydvN6E7cxcP9NCofaYSTOjpwqPKmPfW+YfYMzYnMu+WoL0zDPYH+z3uxE
	5tkU7R05GYcfvbTkNZ6d3dO9imoJjb2TE4k+HgG8I/+mkVLAxUqMFVlkLaWGAzCh
	Hz9eDQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9tw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso37158046d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567306; x=1748172106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POuM4QyYBSzs8lEBebuLF9SmwUjGap5CnJ381Bf1bNg=;
        b=k5EGdlSBP4Ql5h4tI7Biyp+e2FenU5QkofxWkxJNTM06z8H+W/ggEteSG9GestDsJn
         bNNROMd8t08aod5VOBjKZimo/rK3VSEBCCsEne+nw0YtkiTsiOmOYrmT1GQp+YTirzN5
         N8jvIe62Q6GSqI9n9ZmGlh41THYqlfX3uGrUAaJ49eWBR7MK79xgAnOwNPFvd+DG1imG
         Igqy3JijjGRDtqN6Ia9saD90NBZKoKlD5Qd5eSfFqKfNxq1nNtABLTVThk2QPgVZERPI
         HJ3SxTBzaNoEJVX+kPQ1S8PGuiQNmww39nSTLR5OTtCw+mWlJdx+SFIU7fBAjS6S6D/Z
         mNCA==
X-Forwarded-Encrypted: i=1; AJvYcCWdsGlAMcFheQ72QU6RO2yQGL247UUa2gSkK8W8lYofJmsBdMecDweIn1VBFZA1WheTk3S1NWnblmAKkrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTo2xbCVRExiZMqDQObf0BXy5/Vy5vUiATe5x/1Bx9gd8LnVo
	6rFtjyqrUXyY30h7zxSpzAKPruWp6HIfegSIVKZIK4Qc23gCUz33z2ZVvcylv9GPwjQn9TbSRMf
	9H4piXhsro+PVc0diT7m/7j+XKsII9ysLwiansOXYhr//RZPXz9Yz5p+pVOipwIP9EUs=
X-Gm-Gg: ASbGncvwyhYNMGsPORs6NNYgDdbmKO++S6vEQElaArdXjsnnOFjRcgMYboq2nF4ABHQ
	Pn7i9wsCG0X7xmllC2toHMefO1Q2eEtKF2ZUQG2xo+dj6D2Y5iwoeA6I3Z65tCMg8uCiL1/GoxA
	ozdkNOfvrLdITYb28QdtTzvAI9TkgLtXt8ZeWG9YSbFMqEOIatthctpBqACfUf+73RdKBzWcTKA
	YJBBmcg58lYzamZYW3lla5Nf1MEHrv1JQbQGLR+TRUO/2j5q0eBkBRsZSfsVLYIkRNcSOz2q+u2
	NlPeamzoNGUSr9SrYEckGnZSTLFKsb4QGVZlI9tWhp5sr9CuPBBVeST+iEqL491CSaU3oITD7m3
	eF1G1J5CzvgqfKt1JBWY73dUt
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id 6a1803df08f44-6f8b0935339mr170238456d6.35.1747567305948;
        Sun, 18 May 2025 04:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4fR2ucbRVFRPSQkbMQXjGJ1Hxtylk9FgYTSGqRkdqAOCHzKlKaMxCW1Vp/0NfYlmM0j4QeA==
X-Received: by 2002:a05:6214:202e:b0:6f4:c8df:43d2 with SMTP id 6a1803df08f44-6f8b0935339mr170238116d6.35.1747567305572;
        Sun, 18 May 2025 04:21:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:37 +0300
Subject: [PATCH v6 04/11] drm/msm/dp: move I/O functions to global header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-4-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5605;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7PLWki9dLUTSYTbO8lnYK4VQogj3alhO9C5gmUos+0o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/fx9rbbfR4U36rgYWYAu1S28GUFWgeqdzJ
 +CN5aCZHPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1dWKCACycRH/dlVfJIyp68ot6qbT/rPE5BqvnjGZyMkHzwxgOLy4KeZdr+Uu796aXYGtEgGGrVA
 BvtpQCHIno67+x0FFN88iU82AKZxJ6G0tdYeqWpFmp7Ha42Kqekhg7dp2E6mcpvi75wIZ43B7Dh
 JQFmRc25jJ/6Cbh5mMccbx2r1/XhronxFslkIy1e37JoxNCUfZc2O87fA0MM4NDb/Vfm7DWxEF9
 PDPzRggDOfqbJOm8D8i/ocxSUu6mKPkSDYGgUoLUvLXzdQT1b++KyINPKHyBTwfYi5yJMdRZEkt
 1BymanDBxDfM2qWx/GwD5zJggLmV5StvjxxY0di6oyNjThzn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX9CRs7QRrZLFe
 +BX8Dt+FRLPHVO9jRVwiBapY7F5KqlAvmVmm10M4vjtcxvls2bNxV+Y/E9SC4ijMs2BETKPf8vq
 bjHqHHOmA5ogb7KKN6neXegfdnVZBriU5icI0cc2BVOt5bIlZSRehtqxiRKXvLfdR65uNbn0mss
 a5N4q+Mk2g6VWxMGdWjsdE0t5FlOlSYj0E4tzwsgrW77Xplgtz8WPBLk7SRLDJCiV9L9II68SPV
 QppjkOmeEfuH17O30RSyGoEGSICTmJaupef8Fis5DYAHxkCeHhIWMKwjsM0hgM2Z49pumx1Q7zI
 fu86EQjaHbioeR5am11CwV8xQczWqvV2o6qW3o9dMU32/QOMbi1gU/efSJYauDkXgvs44V8ibGH
 Jh7q8eEM0RUerV3Qrc8avZyjW34knZRy+SnxvugbY2kb1uB9J/WOb+EKFxuoipmTUYQSYIhH
X-Proofpoint-ORIG-GUID: ZDjI-qXCODg-fxtjo-29W2ORW1jX_oG-
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829c2cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=J6TQEPGwCORx6xcX2JMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZDjI-qXCODg-fxtjo-29W2ORW1jX_oG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Move msm_dp_read()/msm_write_foo() functions to the dp_catalog.h,
allowing other modules to access the data directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 65 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 74ab86035f3b98b498756673229218558b6713c3..a22efb1e83d04cc5c9bc768a275df9cfb4752a2f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,71 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 5a757671d7310b43e7ca0155ffdc276c83d1e8bc..10fd0086132092be88bb698e53124f87a906de70 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,6 +48,68 @@ struct msm_dp_catalog {
 	size_t p0_len;
 };
 
+/* IO */
+static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->aux_base + offset);
+}
+
+static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->ahb_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
+{
+	return readl_relaxed(msm_dp_catalog->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, msm_dp_catalog->link_base + offset);
+}
+
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 

-- 
2.39.5

