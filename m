Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BC29B773
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940634; cv=none; b=TLE9Rrxh1wjPriOCBqY+UT9sRgOqgqGplrzCD6yxTE7itEsN9DRay+DPWPjPxrOddVlzBdl1BevPq1JsGrzO3lNVPKMhm9diiRjeB6oygnAbil5/dljBoj0epT0WufkQKfgARjhkkWZxyYn6GDsu2uqFXtc29t+gmAq7iMB5IMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940634; c=relaxed/simple;
	bh=C/fkV4RJEbIljMUecy7d8Dm54N2WIZnBLf255ExSex0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+CPFz0v8cz7ilOvuOSRu5/gA0kXTRC8cEsnCjWG1t1pCVETBZEhr74B4tF/6/AggMpNB9b5BHY8MAGVfZluvDb8M+wsRbliBLonRZ+HEymifXoyBxmg2etDpIGFi4IOkkhlXATfmswGXuCKkFtiLlZX2WowZNhap3GU17dqRCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uv9eWw80; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uv9eWw80"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGgFVg027699
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ri/QKCy9CGa3/NJrEtAUKAKyT/Jp6jvRpLEBwHpbnVA=; b=Uv9eWw80ew6eMXkR
	ApORJjIl+iynL6RybQ628fvRaHsprTHztwaNAU+g8F4Ak1heClnvCRf6s/U/LjBz
	N9K3jPJT5ux2wkfz5oKQyoayjoV5eXHXhV/Fl4OHPje0/INf7jJJ/sI5DjlJehYF
	YfLVdsZHSkYWFT2IHb3wNrxYzkeZb2SVk8J5tLtaGWtQx5qot2KFf7I388Tl6z3F
	r1LQh+z4TiG6DNP/tMRMLHujCB1BMxeZCKYG2IsgTzUopxZK8t2e+U5PsRBUrGy3
	ea7qiMKaYmSOvKdMgR5TQc9GrTK0Guesxql8rA2zU9oK1ibV5oUo4C0mnAva//tv
	zd6BxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9fb1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9305d29abso1501560585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940615; x=1748545415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri/QKCy9CGa3/NJrEtAUKAKyT/Jp6jvRpLEBwHpbnVA=;
        b=lV/ne9aYANJYXs6q4X42De7LyoDnTkwrwAx9FAjfUsGGaJJ+08BFGW5HyBrb70MnBb
         J4wkkTeR3Yd8kYAnnbDNWvBhZRPtbBjWH+SkntbhEj92TR7+7ie+hYlmTsiYTK50gbeu
         t1F+S+XcPaEY1zxMr4niwG2MH9o0KARzhdbgJkuxbKmE2156uzRZZU4oU0s5Jc55wOCf
         NobxSq8kDPcaK7eCQsg2WNpipvAws/LvR3Nsh0Nbo0ariVKucvfI6+DYKHTuKgmVRPtk
         Kel53zmnbbKsNUG6115LKDRJbKskWlfbvnmmd7nL9MEpwCdpba6a8Jd0YcoaflxW6MGN
         MOKA==
X-Forwarded-Encrypted: i=1; AJvYcCU2oRlOf+sd7Zg7n7CJVPvYBNY3YFgG1LjZZYtIFBt/R+/VW13MBJPbRd3pLp7av1c0XOV/bJqQpgT1jrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Jcl+TagDylx2y3ERrm88eJg60Gz4WFO7n3pE2BbGBaN5jZdp
	MpuMGXir01FkWCaNNgADFsMPQb8PNpeBDZikbXTuYjF6eRo2rghGwNPL1SPHJ08DFdDMD8FBbx2
	ArlIOEfNc+v00oNx1XjSgVTNpur8SEjl7u6eEfcQ6NRKCp99AXtBJJFAknjp4/pLn3lo=
X-Gm-Gg: ASbGncvVbIdPF12UWyCEIDUW3bf/4ci2qDDY2jYqUANhx1w3ynz0C3yJfMWUPKDrrFP
	L0XM5Fkmq6jEn5DSPYxtv6jhFurckeI1WKnGLlrZubg9ngx7IteFvpSZ4eb9LkeYyjsvlfWdudr
	znJ6c+k7FSfKyuPdcu1FWJr12Lcl6htDsy4PLxY+XFBQvEOcL4XaLSsLuwiblPZnvw0hGTesLEA
	JBlA7dLGye5KiNTjYJVvAa4XtMdjqYncqIItUJ0zcnNTGRajPn7/JYzKf96vAsTAnPiASieOKL9
	xHhsw7x0TZAsVzxgcE3BKSGXA+5gpXkGrxBA9Pkv0Oq8FUNODen7skaTxnUfsi5JWCwB4FBDX+M
	7orpgdew7NoCNDChA4TqRmZxc
X-Received: by 2002:a05:620a:294a:b0:7c9:5eca:ea3b with SMTP id af79cd13be357-7cd46731a51mr3537346185a.31.1747940615049;
        Thu, 22 May 2025 12:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuDtGUc4muO1Z0QfsR40omgcfSLLvYeuvR7jOav5AMf+UAhT3khSrkdB1PHtMoiqedxkYO0w==
X-Received: by 2002:a05:620a:294a:b0:7c9:5eca:ea3b with SMTP id af79cd13be357-7cd46731a51mr3537339785a.31.1747940614571;
        Thu, 22 May 2025 12:03:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:20 +0300
Subject: [PATCH v5 01/30] drm/msm/dpu: stop passing mdss_ver to
 setup_timing_gen()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-1-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/jtEB/eJ70Kwf3ZRDcLKCteC/8VDM7I/q74Ga6UWOgI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T7fyavGriyaGHOj+ADxHUnLpxMPrK8HtV8i
 TMAZBo/dmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1Qz4B/9/zYYjE1ZBotnVsVpgFu835IeL57emvaCd5NC4Ll9kNPtZ75ai0PL8BIf+M8dgSffevtl
 giD8oXN1n5hVbBh5eAxH69ztZEBrI3AJeqgZcIl3D5WXln1EwAp0soeINMuIK5J3nQimMhUFyrM
 5o3eW2+kOUrPNZ19nXL0dJt75xuzpBYt7BSOqeRPunxAIfoWLlfGryVXBWHkfKG98AwM2lxhrzs
 CUKjnMftbz06GQJKmtte2V6ZsULO9S/TXsj25REbt+X3vW/YoOULxSWIdwTLn7OdOmwqUl+5bKy
 6qOvclVm+BrIJzR5vC7oicPCr5FHeV7vulPT27AC4EnTFh+L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: d_xbmNwV3tw6RoJuKK4ojqRkjqvHSuoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXwtM5aRnQuPtU
 O5SbwHdSAfyx8XrorraFjp/6fVOQtVPqfldThU9vmC3sIvm4kTqfbhd01daCc7PMTtJ6bFv6xN0
 0np90ZrjdTFZ6H2lnwHIBzgunBbi9fHLu2Wf1sDkaihoMMV2Slr6Rj2SepcPrM+nATAZHvAxWFN
 D+4Aye/9nDgFJqqGlxN3eDHVWRgDbS8Xks33rZVVtVOqFOvS/QTVc7Ld4gyB1Pxz36op5Cp7Z1z
 xquAh5Cb0/ZQJ6BsRDw383iep2nIFRt1h5A939VUK0szg/Mpl1RXSVHfmLzU8ouK3uMXBh6rQfD
 IjBFa2awfZmqCMYqjAN2YSuiOujToLYFqlGeBS3MO5CDaD6VdRnT8X42bLOrELdxUSKw/qDJKg1
 zxFo2lTYN1Z97wbgLJVJ8ENJw4bWyWvRUimFwsULmZDziKBOPO2reTMhXegwWeA7DGeGKbJq
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682f7517 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fc1Z5Xec4v_XsjI5eh8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: d_xbmNwV3tw6RoJuKK4ojqRkjqvHSuoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As a preparation to further MDSS-revision cleanups stop passing MDSS
revision to the setup_timing_gen() callback. Instead store a pointer to
it inside struct dpu_hw_intf and use it diretly. It's not that the MDSS
revision can chance between dpu_hw_intf_init() and
dpu_encoder_phys_vid_setup_timing_engine().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

