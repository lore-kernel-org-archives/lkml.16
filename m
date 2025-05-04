Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE61E3DC4
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375223; cv=none; b=EA34HoIcZAbSakk3gq1Sx5dgSWaNhwYn9TvyXNAdrOYsKpWIjRVHXPyYiONRdZFWUZarh4a2+PUFnsvQzdOpCf62BvaTEMQNEErD5Vkj+YjThR2mcim69f4yRI9K9NAJ9BEmdky5IUHYOjUlJ1oAIqfYMJYy+UaZ43V2oDXF2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375223; c=relaxed/simple;
	bh=h78fdNgru3raJgZ3WE0MgKX1Ryfd2RCOsMN6h6hFIo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iBQEGdw8AsczS05eWNqB1kQosBGkPM++7HDSXqHzuA1+TI+44JJX/OdPss4gG34rmRxHwZt+pxo1VI6m91oN3FH94xLIIuLO4iXmSFrrELWbbjkrbDIBUgPudj0DJ5b2UP6PvM7IJ4z9bytiIbQX9gRGXaleOOT/qasKEcFCcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYY5Lk3e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYY5Lk3e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DK8hA010605
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=mYY5Lk3ek8ARjW36
	ya8vLcViA5oGGfbflO8GqSaijdgywhA/EQTzHOUFPRDpjrhxCxfZDkt4HtqOQhan
	SqyB5dVuRVxw2Omtl/YX2bj2RB0X80D2/f6erMatdmoR5Mb6K/53Evyrf8XUY9qw
	rm+/a5Kp2OhZGEuZqNBIKp3qhEfhMMpEIQtetFVCXJYDpyHuU7tyEXj7B4olof5q
	BmlQqXjfSCF4zlPTz0RYva+HvcOOuVffDe1F8vGZ5M5yWVMKil1ylhQvlKyHOVk3
	lNOaQ9woRITIddiQ8r99fnzQi3VNB/WDzTcOc6uVOfTNYUGv1AkST4Vzzt5+7qIQ
	K2J/Kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47699e92ab0so78133111cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375219; x=1746980019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
        b=iF65vLV3oqCLJfVfXBzYmPe6oQZ7PhlfGpRaD3YEhMhIrHzjezbHkDBa9NXmpqIYWn
         BijS1WYw/RR38p0UlSVp75WI9sKvgCpOgBzioFzIQzcIh/LCKvcGqLU3fgZZRfOYs2RI
         epegdHLKAfIDbYANZViahuQRsBtD/IV7z33mnSCdS5atPoNXzl1LaON3tpfK9XLPxLdH
         eVoOPyY2XpRSV9fcKYhwf/YdObXZbJ+WtINH5Po9rLXakC5pnKkvoOfsdilJjGi2yP/b
         5CQ66Q0BtSYtB+pq6htDQE4UGbn/dHn2uNZgwOaIDUm+WyMmbkyOr2mQ5D2kV8w9aSfu
         LN0w==
X-Forwarded-Encrypted: i=1; AJvYcCXQaNFL2SL1hrav5WOwv7HgS4oA2GVIIOAdQrQEeNG+DYLL9WV5sVel7wVIpsoSqQr0LJRWl26WCkanH3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwGe0yRUmxVuNkafMuQ5n9e188F0rAsHx2BzlwlOiYeiPjxV5
	f4njtBEUXzp60G1LPcW8uH3um+rjZqbFT5SIqR4uoQ0pkGg5g6KRbmQLw1TN1W38hzEgfRIInFR
	63ILScJVLi7irkYgWpYgpf20RgEuGEN+Z2EPcTib5fEzF2yEv40cwF2FhDKU0nnyfcQSR1V4=
X-Gm-Gg: ASbGnctsT02Fs03WZp09mq1rfvJgRQM0uy/sLTsZWQUk7gIi+4NRYMHBbzUVuICMXdq
	AHSeo3xsxLROeuWJj+rmGE2FlRnNNiSiU/7qw5PsOUvqUhp4Rp2T+I0Uf1cyyaNdu0rvNPdCOVs
	ao0zpgHK66KNuoK2zSGTYmTM3Dzq8voZzyRZh+m2idS3f5po0/RyTVFYVMODhtbruY8vOkfENYR
	CoOS96YbCyPo5obye2JQkb6dKg2yGrm77b6CVSLqMaDz6dA/S4yFmYKNDsq4wJCZZQG1kqxAJ9G
	V6+9VIZmNbSTeoIGkB9BUdd1FTFe1wuhlADex0vS7C+J/N4mwp0h6thGfIwi+86y8B7rhBTxCh9
	+/ZbgKNgJGea4CqLPBwO2MMmW
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48dff9dd1eamr62916541cf.21.1746375219171;
        Sun, 04 May 2025 09:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4PpjTVXPh6t2ptCuDJ0u61ftt8JaFdmA2iRccvAqFCJVOcO9pPmlvh7PN0itVonAKVAxATg==
X-Received: by 2002:ac8:5a85:0:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48dff9dd1eamr62916281cf.21.1746375218850;
        Sun, 04 May 2025 09:13:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Sun,  4 May 2025 19:13:22 +0300
Message-Id: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX8uw5ba/t1GdG
 oQXBnrWWxs2uk7vKzRlyo51ytVd5vi6U8JSWWtZUnIoTcdbP8s4jyPMD/lUyfRq2B6FLgrDO9Kh
 1RX5FTF3/Wuf+VOuKuGY4bBwY9/FNDXO0Nq0CUn5sY8s9Yb/0rmknOcGMhWnteR3YuSHG3I3jkd
 IV695gQpn8Xi4HDqFRZdg7/XLh4mdigfDjB0eOpoHQG9iUoNToiLZEh9swH7DtgXl8FM5meur1x
 QPzoFMDJqzt+xAuNJUDYPrpsLeEWvmjUEUcf7zE+TOlVlrWlcp+sHvTLPeYfTl8wdiZB4DegCI4
 S9vZ3wyuO6Z1kUmaqMawAiNRJszCT52gSAKZ8GAq6lje8IdSsO8315YL+F9xH6KSD2VYHDtFulb
 ky1p/UC4P3s7Fw0v0GsZBJDU2BIHNLjKB+8efib66k4h8GPBkkxVceYZ4fkAclGFtNq+dkCl
X-Proofpoint-GUID: 4Igem0RiW6hADayjMUyt5ZfNXKH6wew8
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68179235 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 4Igem0RiW6hADayjMUyt5ZfNXKH6wew8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=633 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
