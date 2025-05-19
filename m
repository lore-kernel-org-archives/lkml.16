Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD252874FB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670666; cv=none; b=HbuXks4sXT7WoCOH8r6ARnqHfd4mZqD2eVI6T5H2PpMAHRmeadCr/oY4b/JD5yrdjQKt5kpYwxnPFTbsSXZwYHH+fO7n0LdU/FS3xrQB2pe9JJDiGdAr8fC7nrLWD1tZdeVbT6eGK+iZtk00sfS37HuFaGYOru92yO1Kp4FK1ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670666; c=relaxed/simple;
	bh=90b5t9G9pFXVJuP5uOK0GL39NWpHYmCtIt4INqXgFi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHKpSN1OpmSFz8BeKUAliJscO/yHTrOyTHfks7jDH11qSohd6sFhDFhEOQtT12r4zS50qWwTJ2lrlFc7qsLRwxUjEszD5P733OvQ3Q4jBeXBZo+Ui21qDUgKJXmDYTKus3ArzOeIbWhIcYETBJYAKSlArbt+UlTmYINcfKYPiRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jInHb0HT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jInHb0HT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9GeA2027861
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=; b=jInHb0HTZMjx8/Zl
	4UHKKxYSjXtpKz+UYJcbWPKjk5S54cOD5gX3EDx/Fu5N377loqwThmzZEbHTyX1q
	CREW9euyHpoJ9JpIJ4htHKsJqkfZOB4TejYc/JFdBZfhZAZa+N5/EDtJuirus+mZ
	oOnpjj0rKXRAD6WUOL1hnQWoS3mjkZ2Kb2p/T8QOWc8pCKBpLZvOMOqJ5LjRUiIi
	PcZy1hYSw2iaSLmfm8oNmcQjducsNVkMaqGMV/tLFjde3Yfn56osHYqoldElEqTQ
	tpQ8+eVoah5ysX/bfj03rPQ3w4FiDvju6BgwRFjVhjdoltZagy+fWBDgC7CLOt8l
	+IUPgw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:19 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-400b3a7e434so3747495b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670658; x=1748275458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZL6pOdAVZeGnzG7NNpx0LbhlTqFZLDNnGh7FAtqiAww=;
        b=e2xv4oCjrSri0YcMm4KOOUhmW+mJsHnAGp/61FNUyhAOedOjQhGJ3qTuK9Gs5cwTLE
         QnPo4QttvfDrUM2It/2tVx2U94Qv5mysRbVNRpFpGrSH97FD5x+5SyC4tfGp9Uainw9B
         pV8Hgv0oxT24i4irwzO1+R2Lj6yzCbBdxcPB4QFPbttgRdRPNfNL4rap5isLLanSxhKw
         /gMUdqf4CQV02t8+YN40dehC0R7GARPNd7AMdbLWR6okWhojPwHx9rFAB37+g875oPS/
         Wmwi131eeNz2ntLJNdCyjp/4IDo9gVtLTPZXCSN49HzymT8RnKnisMP5Zd5taZTx6keM
         2TYA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cGWZ4UNQ0ZdnyBfO7AGdRB5Ns9ZwkuWfjdf1BLQNplqk154nhgiUKg8LXoMSzvlZP9ulHd5d9gj0crU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybdYf2c3p71qeqs7ZA3HRWZPDCh0IvSrIGiWGqqXDJktcDIs2S
	yLep3gqqE+fSBPRlR+L6m7ezmJr4ZKcfF1hBjA6jg6jFWfTHxj/2VFwn/qDzW/izD6wkDRf2QFr
	HxeGUcIB4c6RgLj7WztR9vt/DkBr/cJd0gD1iNhCw40IYMD/9aqvjyMFyGf6I8rMJ68Dq1rExcU
	c=
X-Gm-Gg: ASbGncvZ+Jk7gZ7sLATPQKQieTGHoq9UrrXPfNLE7UzWGHYy5WyyMNhcuDWnCJrFgzx
	gsIppsJk4Pdim/Ndmrv59eYbrUM7Qe6v1IZNbQZgtP6Oz1w7QaMgwkA1rTU8IJrlLUL0v7hOLmF
	fN3AcbZMOfZMZG9sKfz77tKewvV5jh5KraAG3pGNQu+tfQvUB9gK3H27+xROxczrawFVV5fIc9G
	xsu156tXCku0ME3uBQxDx8rzgjBoqgPD5k5kPQTnfJRVp46IHuhbnorT4TgdmIV5t4FTIIUBzld
	MgPxba3g6HwiDwMHXPEeJPPaOQJAAc4L9yn6OttfVNaElA1aGo00qHTvnYdVZadIcc2TpglcbsS
	4ElB2qembF4//3juiD+lDNiNp
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-404d86c16c6mr7913487b6e.12.1747670657760;
        Mon, 19 May 2025 09:04:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa1ZWnT3cVS6hT4TKbEGhN2g/VFNk/7QQ9n5aitrhO9g5kpK7EA/YMf56SoMj8UgFO/O7mOg==
X-Received: by 2002:a05:6808:320e:b0:3f9:c0f6:2163 with SMTP id 5614622812f47-404d86c16c6mr7913447b6e.12.1747670657433;
        Mon, 19 May 2025 09:04:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:03 +0300
Subject: [PATCH v4 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-1-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3718;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tqlj8LXxDL0ZIrdpMe/CdigZeONJBV+bmLiEA3WJ1VM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z5L3L1i/g8Zfwi4G3+Ez9id9XN6cZNezATw
 J1xPzUBb5OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1SOIB/wOsSbv4nod5wFIVx0MYuyh4+YD73mzWHesXEYz6EJ0waDOX8+0K2nRxE0eqAXKf49vRD7
 MxviScWEIDjyh5+gvn7TWbi/IaYK2BkRj0cLYjKC7D67Bixzv2wjcSPZJU7rrJdxZPeyFeeZ3WX
 AHdCJWQMAHDewwY09GueCWofkbxe5TRNjwLYZ4zQi46qbrnNB8mBvRdCxazSSF6R5+bktr7XiFH
 VJikbMiJLPeReJ2QYHXtJyRxhbnkPZWzCI8nQwUicSxX9ORzf8hoWYERluH+MAy/byylnXqWrWn
 aEnuJlidq6bVFx9QcF1VyTEkIg3ZJcP0cmOy5mkylxhix6qd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b5683 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9A80PTQX3-Mt8eMA1ZX5FWmuGZ23JJ4q
X-Proofpoint-GUID: 9A80PTQX3-Mt8eMA1ZX5FWmuGZ23JJ4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX4urrtMNWq7hs
 lAzdTB7WTRkmokBM5Inlv2WtsL7cgaQu6+x1WqLrmTaYgIYEKQgmkSl5VLmIcWei2PpZJj/6nTy
 //9UymkYzTgyBlQao/Iq6HYEcRvOkg/tJKRhno0DdXs29BlSOgHHaTBG/FWjW6WOhZpkMrU3goq
 FYe6H3xEoJXPA8w/Y898VyCOO0tRWLqbh5ujRqVUyJdYSezz5lkmdC1dxHFy4Ky4HkkY3eh81gp
 EWvql1azCsGAj0K77zUeNMDONoREgomdfEok2TPQXqFY5+I0noglOvw/aby1ksn9uHSdBWu5ZLT
 XBKpX5ZotKC/QRFv8rZ5MxA31IoHdX/8FN0mMmIaROpecAj63yaniioEb9Md+HOeGkdVO6unMZC
 kwUqcxtI8C9V1AdwdhDYdU2vF5nszOd3XAlrL2EfoAFjAhlUWRUxQhHX4P3P5w72r6drAVVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 8a618841e3ea89acfe4a42d48319a6c54a1b3495..d35d15b60260037c5c0c369cb061e7759243b6fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -309,8 +309,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
-			&timing_params, fmt,
-			phys_enc->dpu_kms->catalog->mdss_ver);
+			&timing_params, fmt);
 	phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index fb1d25baa518057e74fec3406faffd48969d492b..1d56c21ac79095ab515aeb485346e1eb5793c260 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -98,8 +98,7 @@
 
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 		const struct dpu_hw_intf_timing_params *p,
-		const struct msm_format *fmt,
-		const struct dpu_mdss_version *mdss_ver)
+		const struct msm_format *fmt)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
 	u32 hsync_period, vsync_period;
@@ -180,7 +179,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 
 	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
 	if (p->compression_en && !dp_intf &&
-	    mdss_ver->core_major_ver >= 7)
+	    intf->mdss_ver->core_major_ver >= 7)
 		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
 
 	hsync_data_start_x = hsync_start_x;
@@ -580,6 +579,8 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 
+	c->mdss_ver = mdss_rev;
+
 	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
 	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
 	c->ops.get_status = dpu_hw_intf_get_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 114be272ac0ae67fe0d4dfc0c117baa4106f77c9..f31067a9aaf1d6b96c77157135122e5e8bccb7c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -81,8 +81,7 @@ struct dpu_hw_intf_cmd_mode_cfg {
 struct dpu_hw_intf_ops {
 	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_timing_params *p,
-			const struct msm_format *fmt,
-			const struct dpu_mdss_version *mdss_ver);
+			const struct msm_format *fmt);
 
 	void (*setup_prg_fetch)(struct dpu_hw_intf *intf,
 			const struct dpu_hw_intf_prog_fetch *fetch);
@@ -126,6 +125,8 @@ struct dpu_hw_intf {
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_intf_ops ops;
 };

-- 
2.39.5

