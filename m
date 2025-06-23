Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BD255E30
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688076; cv=none; b=lgBOQGMM6ngjeJobGJUcDbSkzMCkB9jOja4jshsDO15TIv5HvGrh3HyfBi8DrQvBQOKQ4CqZEQ4LDwVtW+wnFf9wA0JrrOzX09j6uHODbc1Q29lETYu7gzb8mFd4qI7Ey5F7Q6jIsv2G9uEA5MXwYrqiwikBnndsbJ3FoivD6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688076; c=relaxed/simple;
	bh=xKZ9Xj4qiPD/2Zmj4aELMu3Uy4uODXqfzQQwFPTWu3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9eglDPNfWxihBvlLJLshmrhdZae0FfnvPMVhhUuchKqvzsYCbW+y09ycMbcij8CjtOshzKQybjGxEiBbruNt7XR8bq3I080QtXuiMe0MayIxDlPzwHdERw6cPQhLNfEjL2I0dc9Ok/bt62fMtt70urn9AKFK73fjEwYhMsjqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qr0/5Lmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qr0/5Lmn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Pa5s015721
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=; b=Qr0/5LmndzZH7Vy0
	9zK1b+MKQSOhlFsqy/SIVY2SW8wRk3lCJJPoRedx8FZgxUr9nRT9mRUdal33qRpD
	SDPDSp74oKrjJfRHJO3BoSK1Js292xtn1hZQ4mAtC5mJ8LuF/9OFKax3y2kPjC4h
	t6QZf0UYD2JkojDiq2Ao7RYqWkiX41bTauRD2ImU/LFnD5w0JZzry+IQH7L/pOxe
	0Zr+kE1jJeWEGnW/OQaEhU/JjSJ29RSzWfaWfTk/bB41Nitf07qf1Ge2k5/cEXZ8
	QbNnFZm0mTCPILf43q4qVNf2vE5ePBMEUrQOjHHq27WwFKEV5HM5HTpsbkMQ92tI
	7MBqIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5j0yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313c3915345so6586764a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688073; x=1751292873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDdT8GmCmZBkVRDlqMB/TVH3NvJZR5f0rOeZUeSRtHg=;
        b=rBnzZNW9MNqJ/Yv0Rk9JrOG6oXRuvje3EhfEUTIM+OaljD8zR1RvtOev+F1bTxeIx5
         iRYvwEC2jctEwy9gp2u68HBT6ke2mMaVR4nM449jojC0g9SLucakU5byqUtz0LdAZ3IK
         dKFzajqytN51S8UoEo6wSg+maj3CPPojGePO8UZs+aSbaDXwSo8vUfRntu7y+wq5e8b9
         y9yu1EG2Yoft/UBWNh7ul0PaPDXdrVH/upu8piRgBr6BZLY41botcur+vo3ucMVLD69v
         XsOlOgq6hKGT2SlJJUvjkcATpP/E/pNnFX1XmuWu3ObpPa6UPm1IH1+KPZloEDQdVcSV
         yXpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7FSqhie+pUSwqG+6+dn4S1Uj+G4AJONd25K7oyQtBM3qNB+ztRoynRx7USYVwJJ+AiotYCGQU7FdLSUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0dcliiW+44FNHPFxWA4ARS7MxRbpa3qMtw474aNJ5qhNDqI3
	L23WkdOVIoP8WOpPY+l/1QDUMgsI9e69uAn5LIdAwyRaL4voJWsSDzvyOc2oUCIWIzEKfbgZgzr
	3JyVYw0Boxkw/SRp1/0Tpi4CQiNOvILaRhTsRAGuFMBQ7Qb9x0LpCY5fAXRIFpwuod3c=
X-Gm-Gg: ASbGncsv/c/VHSaoeKhx17z/z35htcAC+Slv2i0TQq4v1xRicwMm6swYZJ/nNkwQFM4
	uLR0crBOKq/YvYCwLid61XqXht1HbI61dpyZzvDWZRFmu58MJFfW4LI24CI9MSJWpyuwGwOkZvW
	9awES9dL6BM+91uZ4J1hafGILre/lTcpb3hXj5QBSQAKB/Pyl8gf4C9aUlvrGzUZoskpSFNP8s0
	NaHhcLSUD1HKSxWWkn5c4Y31pNeMXdRQoGg4WVZU8yw3TT3EOILnGPuP3rueRVWuvMqMICxY18t
	KXRYvifo3yPaDogFWVHMLYQcocYiGYPG
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id 98e67ed59e1d1-3159d7c8f9cmr24187374a91.18.1750688072961;
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFohlIbDHPnzGFzoVo8IyUWv275ozTxbFgCP3ruQsyFrF9oyTg/DjA45LUYjJ+1geRNvBXBeA==
X-Received: by 2002:a17:90b:2651:b0:311:ad7f:329c with SMTP id 98e67ed59e1d1-3159d7c8f9cmr24187313a91.18.1750688072479;
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:08 +0530
Subject: [PATCH v4 3/4] drm/msm/adreno: Add Adreno X1-45 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-3-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=2172;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xKZ9Xj4qiPD/2Zmj4aELMu3Uy4uODXqfzQQwFPTWu3E=;
 b=nyiUEqvVCW+25SYZKCQtGlM9mIdhtcEW0YGblasDdcsi9vA0hNbTrMnvW29/s2M5+bGhB9XUq
 aFcV0xh4x86AEvTj2u6wD9wWN3yobWDJ/JNXPBpIQzwfyk7yvN++lw5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 1GE--x1ub_vigVlRj9aE89UsNWaXDcRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX2LhVzGtSKus/
 bV1Qt2Txsb/pJnyjbttZXRclXfOVF0rFARgfs5+l+Ky9ArdFVRVPnqmjxc/14YnIIU9EoPlfphL
 Y3WMzAYHCjDyTU86I+Yir4phVEItoK5ytBm3eqb7J1ureACMVSojOJBBR5PkKfg6dYlHYAauf0f
 tv/AFjnBojD+MAPqacrEeenxKguR0UhvB+iDE8zfjAHoMfv8bS/AuWDjo7Ucx6kaPqrkdPUWvmN
 S+6mTX+/5eNrFK2ZmUFel3tkH3lTSdDc31Ja2U35AqzVxs/QGGoBdsW8cHKGPTNB11EXb7OMLtn
 8X06orOYsfp9NB+JVgEHRwc/ByrOWQ4wqUtm3xnNWAPL2+tPK5dbHwwOxAFzZsmFYd16r+wsoTK
 iSRH6nhUguFoV0iWafzuIjnq0jjjWCZgYAbNIGWcXPhqbRVeA6p3m6cB/qTqC+G4kTxtmYFZ
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68596149 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8
 a=pGLkceISAAAA:8 a=xcvD53-FQScLkYWh0o0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 1GE--x1ub_vigVlRj9aE89UsNWaXDcRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084

Add support for Adreno X1-45 GPU present Snapdragon X1P42100
series of compute chipsets. This GPU is a smaller version of
X1-85 GPU with lower core count and smaller internal memories.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70f7ad806c34076352d84f32d62c2833422b6e5e..7748f92919b883bbcea839a61158ab52e6e4e79d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1474,6 +1474,45 @@ static const struct adreno_info a7xx_gpus[] = {
 			},
 		},
 		.preempt_record_size = 3572 * SZ_1K,
+	}, {
+		.chip_ids = ADRENO_CHIP_IDS(0x43030c00),
+		.family = ADRENO_7XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen71500_sqe.fw",
+			[ADRENO_FW_GMU] = "gen71500_gmu.bin",
+		},
+		.gmem = SZ_1M + SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_PREEMPTION,
+		.init = a6xx_gpu_init,
+		.a6xx = &(const struct a6xx_info) {
+			.hwcg = a740_hwcg,
+			.protect = &a730_protect,
+			.pwrup_reglist = &a7xx_pwrup_reglist,
+			.gmu_chipid = 0x70f0000,
+			.gmu_cgc_mode = 0x00020222,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 4192 * SZ_1K,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 294, 1 },
+			{ 263, 2 },
+			{ 233, 3 },
+			{ 141, 4 },
+		),
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);

-- 
2.48.1

