Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE98275847
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652339; cv=none; b=d78pddSnmltzNwjdyxD2EFpGiNTKD7OMQPJ6g1SVeIg5H1ydWt/4uNz5yen0iPGsyJV/8X+7xF+biu7t2pY9foLxl1WoAKyP/80fHFdPUIwIh2opee8/nvYHp7jNBbKPZpaVUAqP2975GV8EwGoYbsaAv7Ig6ENjsuj+Iotx8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652339; c=relaxed/simple;
	bh=mxTI29ncxsslT5tqzVqzF6esCQbl4MQEJnMKnvcIrjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxfzFGHqcZbBi0vbTsxGryR6mesFSqSqrc04L+uvD9xWr8ZTWhNBkQgMBbpJOyR1+Y/c4/jafncUlnWpHRQT4P3Tu/sVfxy6ORFxnUJh3ydioidhqSNIPH19JsrLvhkgvLvIJL/NR0yVaDgyMdDD6Fkd+TSKIAjfLchrZR4GAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+1Xs1jY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+1Xs1jY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9clEG012461
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=h+1Xs1jY2T0dXP5c
	PH93mDwWyiXLp+X5kuCwCNvDVFbpwLUZ0zJpLFzBX4NaUZ6Sf/AhbYW4n46ewIcv
	63JxMuERXRUDU+2TpBCH83onhVjK9ZZoHM0P9swGgZW4y3ouDXPUkK6aHGGHzK/7
	ecCnwVy5ZRNjgdfczbOA970GvZ65icievAqVZSFM+KUVFU3jAWKAIVcUtxvfOaWq
	KqskdRMPr9o30y6rC4JAITwqBzIkK8UEInzXq3gleLh4uiJtjZANB253NniK7GRd
	gYTkj/NzlCTCU7nLyacBduzQ1wv9sgTuYUGFkS0XwH+rTHCg96jheJZERIf9IT/O
	cRHwkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m23y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so815826485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652323; x=1748257123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
        b=QTzuVzkDbJT6oPlujNesOHd/2KtsLrg1AyXCn9yyQSsq2MCfMpPBn2hBOgVOV+2unZ
         nmmSuJQBWNSnyWkNcz6eLqRQbLF6xXDcUFSi0VsyUVzcK5tuIGqNHis/q2ZnuHkephNH
         wu0w/N2j4aOBdJM62PLrT1me8T88ulfvl+2H/HyNB8MgJoGmJeCKgR25Fy8lGQ5HsNiJ
         N6ZVvwPYN3t+8ORowVQJhyF3c7N3q4Jrv7PQoJAryyj8xoR6LJO3OaZJ8MsNaVEDceaR
         W0POTxFp34vg9AIHwzJakgSI/VEQoHf0p5tDNfExj7hDPQ/FX0qHv76PnwMPjo2umpTn
         k/CA==
X-Forwarded-Encrypted: i=1; AJvYcCVbk0pCRyuOdFndpP6UbI2veSkUNhpf6zj1/aCinL1JxiSME1CwCCJD0CUfgOV2a6mKGcYXIGjwLHWMHcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvr99usIdepaP51Z3emuEJT/WtiY87PHnXnnZFQSCRiaQD2Vl4
	E9qR81peLZr5dBWeGNLCc42MWFVoDmR8muUEUydhl5aVuycLqAp5Qw0sv8+POZbRzAKnzWlwcPN
	JWmj5deAZIkYpVVR9dPCQq6/b1K7SWp4ZzvK55MzqWyiSOuc4wmTaau2W7rqpGcilOgE=
X-Gm-Gg: ASbGncvX2MHAwz42REyjW9EgLBQX4N0c+Dd7PhI3BHe56SvlAArT9H21Rf0d0BWur/n
	oCkMTiOFeexaKAKPtQkMENhRqIF71LLGcXm5MoZLhCFd3se7E2cSqOZDPrk3dwbCEJM8N1f8cCc
	zOAPZnUBWP5+zQcAybWef+LFj+OtNGopos6KRABCqniENSj6X6jM5la/RLSXT+CNZM1RcL85x7o
	Je4wKWKfxtbhHe9qhHZdo1wP1Y++ochjiNM9axi/LMbBAMvmeZL98nu6EbIOrk75z8s7RGeZEGe
	uD1bwovHCWbbfmcGgI/QLZirrgduiqti0c2JDv3yYuO+ZO56Kti3oguMRyfgo7hk1g/Ue0ChG85
	8u1GMPXyglr7Kgi2hIH1EWEzv
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cd46708138mr1880482785a.4.1747652322882;
        Mon, 19 May 2025 03:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHlC42Wf+KXtGz5HPa63U8GwHGvVVcZg4hklaSY7uoLCUJYftUKkMonRSvLuBDCGCogzpW0A==
X-Received: by 2002:a05:620a:444d:b0:7c5:5f19:c64f with SMTP id af79cd13be357-7cd46708138mr1880480785a.4.1747652322512;
        Mon, 19 May 2025 03:58:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Mon, 19 May 2025 13:58:30 +0300
Message-ID: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ArIhBkIwmGGKdCFpOKc-E-SI7IzB5Icz
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ArIhBkIwmGGKdCFpOKc-E-SI7IzB5Icz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX0BT49ai6Qrs7
 J3nIQOM8l9f0S8sOJoUPhPhmb9NU3dLJiI9gz6VkgOkdcmzzBDvb0p0oFwz7ddtzTmMH7mi9Q+2
 azd2yqA3L7lOgjRh0juKAnUPKOyBiBT3abbgbdlOgsLAaPwar+eJfG4NkGU3iJdVrTCEbQ/gjcY
 r5+JrVLkRxE5AUreZj0R8paxERA8tVWHaCUCggtypbmMFRTEXU8K/SbVZw/7YvGizsAx8DCkn4x
 0BxdVoSLYKh4uDhCU0sUoiGyxRo+cdZ5VqTUrlIfp86DNaMEbG6YDa1A5w9ZQHMPdfyKBAIPqs9
 mNv8NBkUJYRc/mfFaezdlsnxmXpkDTmShLyc+3AOd7SVpxpuK0a9qWAWTbGWqf3fhLiDn8SqbNA
 hYBJ8p5i9lygUOcYH6A7vHo+KMLTO1TDtPvE81y7MqUapSbfxGuuk7eNw8zPjUuqMVLmM1CK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=572 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105830.1xjv-d0eOgkIwLQyn1NLSL22Pzgg0k_YT3mg8QydMJY@z>


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
