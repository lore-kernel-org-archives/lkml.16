Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A82246788
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279647; cv=none; b=VIAWrLm5rHBJQgkX5axqycfCUT8zJhluLuPeEc5bdjcijwqsysspKHeMT7lzNraitV4uFfWrpWVQWrvntAOxDRfLIugQ2IT01VuScUYBptCyhPbZUlprTymT1cZG1yj5ID0QANqUQhvvCmCQwyWTsJijBLUdZe8NRCcJuLSHRq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279647; c=relaxed/simple;
	bh=Glo95zkh8gVXfGqCSTJqjOM6U/pI6krDNu4cyFf0dT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XviBQZ8Y9KhKePpZujtKeg782X8oHuPLBOfBH2us+oV4g6IGeuV1RGtRNBAn2sO0Ol5vfH6i+nYaw7cp9d19P+7RvJulxBGZPj7spu8Svu5MUEl7twEdSC5mY5da4nCKKXuv7fSAQzS/uLOKrOntPAz4whJ+bg+cobpo50l6fsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBMmDasa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBMmDasa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DA7Z023239
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=; b=BBMmDasa3kkvlduS
	e7tyBDj6a271BzJUI+pMBE2cH3olV3LZbKolDv2l17VWcRmzXTgvxrW+g81jE7x5
	rTiVnRCzQFLYN3hY6stwMh2dzbdjvXzu5Rr4XFrIUPh4DaxQtvpwnCGL7DayGvHa
	nC2ZlU6yE2u6XyxFxvWEtEUE6FjVEQDGaCOQaLorxT556tahwkfdsJqVSP6QKOCT
	hHUflSnBkAnRukLnnABsMSxTyLsLB0O6nRQp+zWU/fOoFSTWHtEmAmstLudl+r+u
	hba8y1lvE56l3Hbf7xLXdQ1pc+EJKCm3T3wDmShPGNKI0utPop46kSfNYmgedKZx
	Bv0gEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kpq28fc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:34:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so14067685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279644; x=1751884444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/DSsMm2kVm97th9bVbLAFQC3F5AhKTQNEcJC1748oA=;
        b=wkwvNseCVvCHMfQRhRaRaRyQpp85lxVjiRZ8Gl1PhZr2g/BFhVI2vCQaWCHhaY5zMr
         R17SUlb0vfrcvLp3H2WY1Vs8tj11ogBNpP2QFd79dLYY8/jHFVldkNeZj/B6anYNUzOR
         +GdFoA/pDEl7sTrWabHuUcHRK9N3zKzcu2WxvZgAQ54mNc1LoYxNkb7GCr8kwhgi2Min
         W5xSqMpCNsy57eSLNP8wb7gdn5o+0+RJti6zbMrQ4TrpmuNJsTZPSwlQwHSH6BzdT990
         Rp/iCBDbHGpAvB6QvwcWWzZ2VP5lVx6J5b82zOOTqJJtcEVcYMXkGNK2QTy8Z/BAzcUZ
         g1OA==
X-Forwarded-Encrypted: i=1; AJvYcCUTlnkBhz63QLVLOJ7V+JwfvP2ilUWSIROlt7zpxZ5FkxAkfj9+r6NiBX2GrZwivLjGzeBGptcCyKTSjX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBKd6biJRp4CsH6UXIxe8yWj/7AxWyIOl7OY/u26Vwdn6LfqE
	diLAfQI5RFjtAluwYjzkEfNRkMglrHoj2jeYkimnzjSf1/9m4pv+7RhWJXlIfHjbJVAxwyN3JA3
	KAlir8LzomNxMMEaG6lc2TOfrSDqF4KIms1VWxMf4DESP/h5epHLSQRxwxkKC9loCo2g=
X-Gm-Gg: ASbGnct5pvvVN6entPUsLkQKRiHENlNQ+ivb2yZOh7mqwQdg5+7c/B7FOA8X0Fjd0Hf
	AZYzm47rIi+0uqIiJtAeNxx4AlACG95XQQMz5iifsHv22EHDG7qsSHQi97lElWo9P7RUBQg35aD
	DJgmOvOFndkzjHklWKAEytdNdkSccH4qMEvQopxAX0XQjLN27K8sopTFACEln2dN/24peUTzGQc
	1tTCTvRcu/IzIIP4I0Pp0roEuhQ9/l60l6hpezj+fHoCNkNiSxb3muHEVYK7/D8wk8ti6o6wVJX
	fw6l+TjtGXv/TPp/tHJ79dRjdR2iuuq1y+4e1qs85tC4sEH9ReIdPFY6Yarca/cuZqG//+McL6G
	fPchkR45i
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id af79cd13be357-7d460e530abmr63822885a.6.1751279643641;
        Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF14u67wYVOXU0dwFwQQCwd2FEAqwgbTauB1E2BpJpoGlhPPQaUrdj7uROZsLTFGEwJNwiJMA==
X-Received: by 2002:a05:620a:a218:b0:7d4:60e5:24f3 with SMTP id af79cd13be357-7d460e530abmr63820885a.6.1751279643192;
        Mon, 30 Jun 2025 03:34:03 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb7b9sm5684192a12.15.2025.06.30.03.34.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:34:02 -0700 (PDT)
Message-ID: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:33:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G4scE8k5 c=1 sm=1 tr=0 ts=6862681d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_tQuiCBsMoVRMLc1B3gA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -GEK_r3A6Qt_PnncgDBe7keUZU6uUTwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NyBTYWx0ZWRfXy0UdY/+Wd96b
 f5epQrloyZO9M3mZoozfVxXhBpxIrGDqYiMsqcFzChAZhF6irsorGbAQpDyx6uKgb4u0T/etAIn
 QHOicjnp2Y0MPENDbMnPkFs5imyzZ4P9XT0P+D+isrRbpECr12FMLOWcrW1I/TclaL/OiVeyEPT
 caxSSvmaJCx/fmSC+t/EkO3C5JPvYgbFCFsenrby79QT80KLGFSm/K9uWIAwhAiVTwZPHbQgWG+
 u/aDjE4s4Rybmhf9AU4gx7iHT8OZjamVkDSow5sHHzPH602oAOAmFpQK+BXGLHPNXyK2qi7Wxb/
 0RoV/NmiBcRlGQdZNLT0FoMk+Yhew1fP28OkMSd0NCwSGEl2S3Bbg3yV8P/MFcpCKQKqVRxpini
 MQeM7P71gOtfhNI2EeqwwWqK0ydJVuPidfhPhaNdHscUPHekIbQh++ca6jWeoUPcAC494Cbc
X-Proofpoint-ORIG-GUID: -GEK_r3A6Qt_PnncgDBe7keUZU6uUTwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=755 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300087



On 29-Jun-25 15:58, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Do we have anyone using cheza at all anymore then?

Konrad
