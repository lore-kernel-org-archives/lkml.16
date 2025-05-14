Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13780221FC0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266765; cv=none; b=q/oaohyaHm0UjwP37Owgt5D/bE/7m6r8W/dYn4Zx67opmFCtwvqKwXhler1ngscEyJJyOwXFK24u1mh/l+GG/lJRH/PTuzgxjAMawt7yUVn01DTgDYEqgRYxtmohzXAF+Ly8Z/OKbYAxEH+UwhtPJ3KHVdh8UMgGa8uYqCGuXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266765; c=relaxed/simple;
	bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iyiLmVKlGrozqLdDrQz82RwIuzjQy623BrQLcI2Ln533qzy9kYdmQdHJ74urjoUZKn4XfLWd8q4BqtugelJQFf1AiSKZpNLvmrnh/93F/hQ3HDRGtX5IDDnWOrgu+4+WdHau1T3g6kjLndXBrlIToAeJUBDSXsMdmB9amjRWUp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcQRFwfZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQRFwfZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIeSR7002748
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U9dXNTM0otXMtb+tXARZV5
	SVU4gth+EmAxcvRX+fMqk=; b=NcQRFwfZN9CA2RN5DDGL1fCCVQMgG2loJeAss2
	NDTyQsixhCw0dE4qn4at6blyETjMDPBsUyn94rhRlbwmZs0CYPqikgK/ygimGsXW
	xQUZEH+z8mU6YIOGp/BvAvY1jMtVfVZqUB67e6WOYxA3Ir506cmwoeu52YYx6H9c
	hqicBOG7OPYT+1m92BSc2DNHCa8zHFVTEAlVanZ2h5egaNpNxvcLq2OEBJ2yebHL
	SCz7mQAB53ipvO7OVs/tf5SQyfdZ19GEBw6Jl+FQvhsVHyeMY/rqRc+0fmT0vPOG
	pGoc/x9Rjh2NC1bwoK1/CdT2k4ikJeSaM43Grcb37NeM2TTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpccxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e3b03cd64so2613835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266762; x=1747871562;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9dXNTM0otXMtb+tXARZV5SVU4gth+EmAxcvRX+fMqk=;
        b=uJ7ixx/jCwniUpT1y02EuVOq1e41AO0OUawLtz/zJchO/2osIa90TEIoHj2OMUZ63z
         Q6rrVKiq06zO7RrR9aDxUEbUShNZXu4xPePdVPU5kHRI/f2u5hYMaSeNxzh1XVT3DMoA
         0q8UNyF4PzeiDeZDdOqQSXq1ZgrXBQCBmWGbt2xfWGqw8M8oxGHbCCF1FGMt45zo7e3N
         p0X4ME8t+nsPLHSEDWZ/z+XiEckS90VFAJc8fmCCiVOn6P9PxV8a0VdFhc618n60FVjd
         o0XlPn4cyEpvGGwG0t2qifvLWl/iN0pdlYh3Umyoh4IrdKrnb56ZuHdI+cXPQqzc8u4u
         zCkA==
X-Forwarded-Encrypted: i=1; AJvYcCUcphtI8phNIjOujI2Rz9NP2wK7RZgMBNHqsuI77o3PRcf0Wk6YM17sv7IwKjfRy8/Wc0KOOOnXge5tEbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLno60PAHwJzL+4tbidsVqMK7I7WPJTPVzlW+g8Fnu579h3vY
	WeD2m127e4Z2M9ybWTgcoBBF3O5lQ2XWKZC3LopuYEn/RM2917g2hFxF6fNOaf4fdiWurW+bShX
	YqGCspN2FNU0wn5g77qKi5heashRmhLLzvCOtIaaRzk5Lg0X4qhs9P5ybbnkmoeL4Eet9cJw=
X-Gm-Gg: ASbGncux/IET2M6OBK0Hr+qIry/MbypgM+oZ6kjju/l8l8SYCZJKXqFttjTH839xKkA
	auUbtPjmdFI8DEvblMeRxBTYKfuggHLaTb8ttVkwmoZ1U+1W69NUsokhdutaUH8ib/rpEjtpCIi
	n2mSUDw2EPuFhxqIM06ON2OHKxc7fwyrhc6Yt2CVxH3xoKepDsiagTdklPdgupU+tz2fCak5xpk
	gU5X5vVGAw29oEq4soEPErXmkqEWWNaFkoN4zuMGIr4t0h54GzC5u+IwZRXS0KPJaqsFOJBQkHo
	yAzNlxJ/S/EKRNrLnmN5KR09uVFhbEU1m/UVuYyR+j1NLyBgnHlAKrdWpJl/6yf8UDr3nwDW
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr80994995ad.22.1747266761803;
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Q11Bf0x1w3OdQv8Gq4HJtYawO2uCX+U0G/Tc6UvUo7gpok19dbvktUtFd8Z0CtlQnSADsA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id d9443c01a7336-2319810114emr80994675ad.22.1747266761421;
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Wed, 14 May 2025 16:52:28 -0700
Message-Id: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwsJWgC/xWMSQqAMAwAvyI5G6hVcfmKeKgxag4upKKC9O/W4
 zDMvOBZhT20yQvKl3jZtwhZmgAtbpsZZYwM1tjSFCbD1T24ysOKt4zngg3lZCwVNQ0VxOpQnqL
 +j10fwgf06RvzYQAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
 b=2fS6E10p0+LUPEXfVUGN1EiKyx+7j+1YYXZmTcrfjwLs3yXOx0XYFA0FP7+b444XrmN0u80zg
 dX1gqwXcCIyAy5RdHn+91gwbPRhUbL6nNW3xP1GaSQ/v7obPx3VJ5Cw
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: tDt4SCdwKDicDJvTwsrGiaXYzbPb-46Q
X-Proofpoint-ORIG-GUID: tDt4SCdwKDicDJvTwsrGiaXYzbPb-46Q
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68252cca cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qDZEy-X_bfy3rWNFqZ0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfXzUctK8R4OXxv
 qJs+n4/a7ujAf+8f8cZ58SSm4zdTwcfFKCqlGfW86gGpe17FIFmfAIslR2Krz21tdVaPkM0kazl
 zQcOVqOUGhPl9wYS71KR0KuI8MAj3RsQRCP+mU29RMmsCfSeQBe0otZ2/fMbJiLeUncHpKLc7tU
 viKrbnkLMjwTHMKX/j6Dnt+Ogu+jBbWTi+8XCPEil5Vt80C3c+YWFXhYyXijHkvYtjUjky53FkT
 UclLb5EmgSZzAfzRVRvGTrIwtOfJaamakZ7oZiAniS4NonfHcElpD2xpu21oSlwjMteCfppSl1W
 R8sm5m/SRuGZywmF39U46YWzui80rYwhcykFqhTTwJI6xDC2Fsx/vd3zzXLmN9VkYVveDUV/Vb3
 QpCsWq0iKhAJ9sQexqbF1lvuTOh/WWZZSlAx2v6NinCPJYwKSZM8UN6caZvtYBqcvhY1RlPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=874 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Jessica Zhang (5):
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
      drm/msm/dpu: Add max pingpong and dsc width to HW catalog
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 12 +++++-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  5 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  7 +++-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 10 ++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 10 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 46 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 31 files changed, 173 insertions(+), 49 deletions(-)
---
base-commit: 888f15dae780db7cea6ab1a3355151e4292038bf
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

