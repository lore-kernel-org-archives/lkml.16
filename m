Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEF2EAB6D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443248; cv=none; b=soxxS4sw29jKtb2yWRYlzLUO0RzhDxYO8QluSNP7nTD5y6fQhUc6drVFKqVfTwoMr+AiNHHYZzBHvRpg25Qw5NK9PgbgT3lSSWONDjbUTw8gSmYgN1XY4opTQH1izh4cdnJWi8oS4CH5DvHpqVCiYJBjlZUjOpv6rgSLOoNKr/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443248; c=relaxed/simple;
	bh=VBzjB5WjT6RDIp5iUAI5YjGn6ndaHXTTJuvdvNseLKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBKzhRzGuE3QFB/bVycgEIa8g+qCGpaZOs1Obq1fR9p6z+tWKLaligmPIuikQaGP2drl0bmmEL47JJgEHQE3deamxMvhn4mRLqIh90W+B8O0yObnGfGLP+F1rC5I24juOgrMSR1GyunazIn2bPqnoph0O+fbzTCf5z6plC6j62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk8zULvM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk8zULvM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDHOZv018584
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=; b=Qk8zULvMyRlrQu9v
	Sx2Or7V8X6C89vR74Y/LH3FGphJ+F/3IE2Mt7D57ZjK7y9CyrMb1Q4TdjjUoeN/O
	Pt6Oyekff1vNYFvcEwwcnSgb/nkWyNkTrZRC8qvuuS9dow6CfWqVyvC6I4B6/L24
	mIRUj6te82cSxJ4w1fd/pbgOZkwMJxYIX57hRiROW+7gU0nijDM+8QuZ/KMHWPRj
	oAVCHfnKmlQSZ+fDFS+g6dr5azg1peKZi63bxGvBeOSVd+4cfz6lPkqojQSLX0gH
	qHlDiSgKS22uWQnfQQWasRg/sw6/b5trBk/gdLRobsRb32azWi2gGGna+5lWrJgD
	jlbv/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9m4p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7cf6c53390eso171485985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443244; x=1751048044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=;
        b=vQbu0qoIVJkMPFbCiusqgI6Ykyik2XTJL7v1Ig4fj/LkvaCcG+Behx2QWal7mAuqzE
         pCmZXV7a6YHET7amIUrDgp99tH1fRlLEBt1QY8iKvu/pCHaC2KiLl2qhqFAfXTvnHcSL
         Tkq/A3tvMRILHv9MaKf+M7HpwAgGRgcs4Q8jUTNl8UCp9DxzMnKPCBjJ2gZIHzGNQ90N
         KmC4XXNGvtV9X9ZEJbSjna5aQYH8kxr43lgiMsPBSoSaeIRnPFKw0dB+pXfR19HOay2v
         RhjcTg20N3dWO2aHzlnBTjOYMBY0WA1vAO2KO4IEVcUcqecOGPZZb9ImLwkrX1OoJK7M
         TkGg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUtdoarhhBgTUATy1R4eORtyAlQqTlmBNCbn9Y9utxJk72L35D/5qv374FeQSHEvDITkW7HMJcgWfaQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuzobk9SrMWM8EWEfQk88JTQ/b8xomqU6wSJ1egYuPBo+3I8xf
	Ha6j8HL0m7gDfcQ7EhiT8McJSf6Jt9Q10zxDaHaOCQQCA3VXi/enT8plXM4d97ybQCrxAsWBIrr
	bNEEUSwO0AHHGzb7iutJoJPKKcseYsC8+Exnz5tDSWNSxga8KnSFPYmu/82Ll9ErA8LA=
X-Gm-Gg: ASbGncvZiXVT0P1P12Tr6AhNuofC6MSkwUcyQ9SZEUI7FfhaArXn2OQo5iCZUBMqm4U
	ENtEZ2HhqZgPcWl5ogRbe+AG2lGJDNb52CpQxV26wKcpou3A0nlYn1WRdNvsDTLpJP709cCMANu
	mGw6TeM6IovB2s0wGuBqaeTc8XxrHa5hZzsJvcxk/kobDhGLJQ1vZB0568VADwBsZwv7D39VvHA
	eVbjg6748PIIqnUE5VofOCybOgrKcVOrT9XzYIZ0URjPew+wPR/xF19JHOJH+TOAu3hr1UWzNAm
	5TrKfyDPpotfUa4NWgX2CPfIsmOl67JJtqp6GTtjjBha17LGONKXkH7F5oDRGzEJKEQYZ1WB2LQ
	r+C/1DHNSkq2+iC8Uc6lHg8ii4hQYDXidr+I=
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id af79cd13be357-7d3f982d109mr467394585a.0.1750443244518;
        Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRug5gJS078hOPt3466yq98+p4r3R9GxsncNqHjb/+sLWrB1qjkQE/6D68L+cdn2aDAgI0A==
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id af79cd13be357-7d3f982d109mr467390685a.0.1750443244082;
        Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:14:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Date: Fri, 20 Jun 2025 21:13:53 +0300
Message-Id: <175044313809.2014621.13604308903491514079.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TrNnROwwv5ZVyqxnl3yoE-E2WecwH2Tn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfXyaBeyl/r2zeK
 Jq9L/KBBS1xofcM/Ep87cGTvHdNStyigYjcNQTjsdJgwW5P3Sl10dW+2f+7Ya6rcWo2YlqwdUv8
 6c5twSiXSIMCdKsDNOIfBmD9UNix6Ogq62GQL7HkJf6NHn5Bb8i7Yelp1j0/WMXWg+SwBqrU8Ol
 XTPaqnfWR+QqNnv0rDHCfiBj4qLOir5wimUwSX5yNxQbZF4N+62uoiw7yc34CLpTELt9fQFY5N7
 kyk+UcPPDD21hzvt7JJVpkwM3hVVaaLxitAUMmDLyRxyBg3wI96YEO7IYVXpriEoVS/+3z1xJoK
 K4Qex7xeIuGqHA5d/rTaMZbD3dZEl0QDAyS/FcobGczH9iq58HqvywOe2y42lRI0kO+yE7aB/K9
 hWX3PMaBhmpT87YV7eJe8J2taQMgjBRD+UhNYRg14l1gkBRtIkZqj9sY8Vos4p8hqnFyo1h/
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=6855a4ed cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=yxMiGmJVoxqqM-PvpN8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: TrNnROwwv5ZVyqxnl3yoE-E2WecwH2Tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=704
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Tue, 10 Jun 2025 14:50:03 +0200, Konrad Dybcio wrote:
> Based on the downstream release, predictably same value as for SM8150.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/457fad6dee5e

Best regards,
-- 
With best wishes
Dmitry

