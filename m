Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B94288CA3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670676; cv=none; b=XCsn/TcgN/pziUShys9GI1GEjJO9BIlknLtDmKoCorz0rbhzeT0PCNlFYV8jry18dTet9OHIEBmUm2ZnL8uxEdx/H9/qQKfPz1GXrewtadB0j2VEoEKejAy4r5l9wrm94OakJy+u8phMZmCwdpsqecFRPQWB3Hw0PHybLfEnVgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670676; c=relaxed/simple;
	bh=SQ58XAJu1DnF6IsV1si1mx+a7NOTGBAGcwnp2eDAzO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C6FBqukf3Ur6NlJzL2NivSKwopKjbbbfLZaIqw42Kp9Bw2EyiQkLqPObDZk1GRDvYHBjp89/LsEd9I0yrmhUMmhIqfSRE8kEUMg+r4mcRr7je3xRgaqThlNE+r39pBurpo6156FVR59E8FxpdDVz8QrsdiHA1+c5sYsgWBmNWAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o99O5crK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o99O5crK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9bruS002228
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=; b=o99O5crK873QodzC
	RIyWQOZY9oHz6k/48NXpcIM9JOQuM6eTf/U8MaoZoqTBZSu8eSRFDhHGTPY2GVYo
	plntw1EuqDLcksJL3lvj5gZHCshBANZ7htcYI/NV5+FYfFQsOUlbY5xbTFXrAOG/
	DxIlFTDSA9vhwwJfmEcLto1lEAQqfX8TSB4WNvN6ICa/WmELCGliHKIzjb2WjYhu
	hUd5bPqDgSjO63Px5S9WLiHal1GpBWlXFNGeOQjgw1dHOZ+bXbMvLKnZNgoI8RmK
	a+E3kbHt7t2VCFT25ZiXO5gLTJDsvl55XsIMDDI2R7zRw4DbbSSgihQxTp9S0rHd
	rhLjRA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:34 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3feb1dce9ceso1984976b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670672; x=1748275472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=;
        b=Me3RM0r7AsxuPwrRhGrOwRqVi5fmATAgjV1vr8JAQGm3w9pJ9/t0nyHMXBFHFmAjCx
         /Nfg9i3D+4qO9lR3HwVrpR/fY97pqLEjDshE/XgSKE0TW8acSOppFcfH30rL5QZNq3YO
         P6vOEnDGbJ0lF7tTYFBjolZBLJIYPi7NbsQMEVhjJJU67D5KUzTHJ6QgXXrUFXbhMxe+
         8hSOem29f1WktSNAmodcPvIY7MXyUl2ofB6+waAgCSDz6tEJMOC2fjPHLIi5G/fO6j+C
         ESGLZAO/zzcwGFDCwjtRb+dOLqV78vjTgmgrLTPZmNYIz9cnLKM74daGRRr9p+wOKWGY
         VGFA==
X-Forwarded-Encrypted: i=1; AJvYcCUkZDH29VtEG2uOH30ViD2RI3cr+GQWrtGF74ZJNrIDk9ov/5ue5cg6tZoZD0P60dDWu65E61q229rsMCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmuNjhnuqfCGPU1RQXdsA6/swphaMJyHsetfmm49dDGr5kCDg
	Vpia963fnQjujLc5deFrvwsdZ/bgOdAY/9MLQl1uRcNQF1TSyfFbn+50ozdi5K4d27NtD2CRW1V
	RZQ//QDDNC0UgbV2r0Yle4mlf1w2yHhesffjhhXN5sSp0EG0UWzTpzWQMNJzsxLtgKrTTwy7GJv
	U=
X-Gm-Gg: ASbGnctGoINCBH68V0VhlIe8OzZOr+a2WiDlJhyTu6cb7oWnrnGLgX5zr60b2zg5m7U
	bohhn2tqJbLtTQfPzNexMNHLXJzK6sMniw2ns20wn3AnyUnfhFbO+XgsTdvtWdlyV9th5alU+08
	zhwphuHQNVGSpEir7npGNsA1EdCAfp6dmHRFyAmkSvfVpwpwNdYolOU5zRq+/U4DlDsO6+hVVpW
	MaTSqmcoOuEsmgo+Pgj0kMkXx2Qzqox+0K/HtfdrE7EP0epmdvowXwiX0Yi0XRPo5CUwpNsa36A
	p0nI8iMYL3BHMr8Z0U4i1lJZSkqrvcqZz1gPgUAdPLcDHKKWpwT6fv74ISOomFMvGYg1BpW11rA
	Wmo+8xJEZLqhzmTmFQW2i416O
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id 5614622812f47-404f12504f9mr4618169b6e.19.1747670671769;
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSISujwU8lrobwRd3mozh8yz/HYjzCWY1OeWbJw5uS6+xeKb62OMUpojjSAlgxFf1iosixJQ==
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id 5614622812f47-404f12504f9mr4618105b6e.19.1747670671310;
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:12 +0300
Subject: [PATCH v4 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4FSjImmMI/5tZIFCML1RoMebVbAYsPcJFHUVlcmc8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6fysDl8sDZ3MznEr3n4u1Qo2NCo2THp4WG
 YMMjC7SGW+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1RHmB/0d9Th9/V09WijgOOsdRNZa4hYTJSsYMTZcwglXLc8Wpa2fJLJoZQcEzErO/2s5taOYmS+
 3AHPUG3fvvoOV+a0yxWBKUvy5IYgiBqbpCFmuftqyh0FCZQ9OFWb4Wt/TwjkEG4i6rB2vx/5Zgo
 UXSdPcJrR+3qNgc8X0luwwrlUCwYlfsAnR7m2gMf8vlBSzdSnzYxRbAqgLGYrXukrM2TA1WfN93
 yi+IdfrxdxQus4jvxn4qM4FeFzmhzgJTPy81CGUPEY9UFB9cuyzXeKdYGMfbJLm/fdIbYTb6pZj
 1WRoizjQ4fQsXpDXDcymOROdH1pEWbBpSfiZEczh6YgyASnG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mE4dRbwDNCZLQmaYvmpBLX7be09JwlDh
X-Proofpoint-ORIG-GUID: mE4dRbwDNCZLQmaYvmpBLX7be09JwlDh
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b5692 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1CFBwsujT04XwbEipTUA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXydMnUhomhTYo
 njbdnU4GDDwT9lnhhXy1WiMJISbnIGUQ9+8tDzfzpFHBAMuKP0+IyD1bETR9YvngwLvLCKaCRfF
 nvw2vvcCDJmFBGx1sPhZI9ixZhzKqirFiXsTGHwKiTt7y+1EY3/K0sz9zidugv8+vKdW5cjaR5M
 czY7Lg2IZtc6UvkwGq6g87L0LmFpYrYchmrY7P7yAfWhn7cxUqkN8jo/BES8CUmKvkUn1Z8v9lu
 yB5VY+VXHRjsG3DfCAk+d14Dn2J6ofGiSd5EFQp9XW0Kl+XsRlh8Ovd99iJmD88J2y6zBXkNRFm
 n31jTLmU/rqXNVq36W56sk4kQmQ4FVTTGQGL53QYZKeXR8KwQnI7EHPMFk2KrgSNTYsR+DbCUmH
 vp8v0ogjSdo/m3nb1QUBnch9H9+NseVVwRLvVM6rJb53rZ4OVxDxV2pjnnQ2SeBMWPw2k6Wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=846 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -132,14 +132,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;

-- 
2.39.5

