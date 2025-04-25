Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6BA25E448
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609676; cv=none; b=IDalw9HvSAW8YaxesqnR43oT06HG+EaQb+3Ze1WKqjHaKmmoe/OoDwe5AH0AQhINZeHlOqRjG81NqGSqx6zU3znBpoBw4h92cKx358p0zHD9f2Y5SM0Cb3QYqQE2S2ysShxqyBuS+nKn49AzFPdPvNo8WcSTsCPzcHQDuQ2xBHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609676; c=relaxed/simple;
	bh=163cahu5ENu9FDqHl1M5BVKZOqnHDuPHcZ50Md70BVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGBkC6DYxa48aqVoA+mop9XUINQ6oJUjc22FJ3RDAJMg5eXa0v5SyuhE7yVqu+JTpD2jziYvBGm/VAawxG5sJOwfTRXMfmdekFzGum8JD4QVAQBKRzutEe/KNHicfuzHCU+b54Dm+W3dklC7GTtEQX5pvDmxfGY+TNuh+NIenpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdmlEomX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdmlEomX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1kt008796
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gbzbh9sKilox0bBpv/9uc5Xe
	tDa5A8nI6Z4xbs/KARc=; b=JdmlEomXnx0xyrNPEElivGjEB3Xi6jBLj7b0F+ep
	aeggcMkZEda+Q0R6ifvA8exAVf3iRnGlkKRofjIQJM9H3XpgMNqX7qfMYzSDhrhM
	SROBEzbLPe8V1K0s7garvHMVdHFkJNqLljXca8mHMd2+A+Mm8j/Xez/+FKHNm+BM
	rPrOWjFfGdE7bRJdL6r4Bnv2bCJvFkBj3xJmcS9elNgg6usKzs8SMifphHa3Qlhv
	M4PeO12wrT9kHvAu1teauKhfcSiNZMRJUJXXw8tFJscwrGTJbMkmo+NrvjSQAHh3
	VEWPfDlixjNOZK+niNS8bTKcet+yr20iGO0WiXAnw/kv1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j670-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:34:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9057432so52670476d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609673; x=1746214473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gbzbh9sKilox0bBpv/9uc5XetDa5A8nI6Z4xbs/KARc=;
        b=Lr91tQrEmhM7iF6l8GWJhm/kgPXvgr4XravXhipNxamjv6ZVQQmwp9D8KB0wOtyxne
         QBG1jKwTAvz92NAZVmTWfDMShMT+d3h1XmLagke9yKG9eMzQHcj3XW87kCODVD2+SygQ
         vWovePxi2NYAF9u9IJOD3gn9lEHaYMTyFp1fZg+DR+iCdg7y/RrTYPjCngPEDGU85lGg
         EvgcGOPYIpBbhLePNf6Uk5WZaRZCqLW+L+S54oqDt6wvECaHCt5UdY5kGunNwBLqVZ1v
         dlT/FZNXla6wfJKrvFhEIa8XCJ6zMkGuKAqu5vUeXIvdrdQ7J1fg8iVtbcDFV4fa1r1T
         OVQw==
X-Forwarded-Encrypted: i=1; AJvYcCXM7mTFOVdxH2zr+elujaESqKobFcFuixobQcFM0qImOYcBXGtUParzlo6GoPHMUTkiv7PQkcwEu0TL9kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHjBKannt2IM70z2zBmBExyjecq+ExUHFwo8o2CtFX8TRwJYb
	X7gxIiT1+5Piyn2o7MIopWGLJB6IfdpVTnbVeKwBySGKPONAct7LkZ2re0TrWGwrnH1CodLpO/h
	5rQ83YtzN0B1PyEnR/4Nv3EkbzRSvR9Ex5BxSr1Y9zUIsR3KH1r+Nun/PlkicSUA=
X-Gm-Gg: ASbGncsEvDdOlFb6pfVYJMcppOoaPQgfxQgQbLFNDcZ3pfYzLcIjjQnz9iCA16dPYlN
	4DgD5RtvRjg/W8FdYq5tGXckEVBvTcNPvbLwmumUz00ZVnBYEueimVJLW4EIdgHC9X4bjel4f2Q
	owMn5tPG/w5rtH0R80dFoa/dzE1mUBwtlOTYlIooB74xESAwEex72rttNLbKog6WLc6xbW9lyoX
	E5Od4vdBdhRClnSRdMWicgj6yUbsIRjgzjqoJm/ukvbyU8BRUS/RBsx1jwfzO9a4zMvftpjHq7a
	yFr4tqwhP0JiLonYpxS5RgHhfN3fcNbSaVZnwQi3oO5tbYabg16KB38xpoGZqCBYK5YxBFgoks0
	=
X-Received: by 2002:a05:6214:d64:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6f4d1f9d931mr9597046d6.39.1745609672980;
        Fri, 25 Apr 2025 12:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl9bHOMYkB+SjmxFEank3g/xII0FoIJCvCC1QCWpvbIk9euK6eKPgazIojwUkLXrFRDY2vkg==
X-Received: by 2002:a05:6214:d64:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6f4d1f9d931mr9596696d6.39.1745609672646;
        Fri, 25 Apr 2025 12:34:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2630esm722956e87.23.2025.04.25.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:34:31 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
Message-ID: <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
X-Proofpoint-GUID: EpyduWbApiTNFwrfh7iJr_QkBrPhmsta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfXxy/dSyEr5qK+ XbDP3sBwn9kRwyJUxnWplv9fmXLZ3y30Qd91uC/DEQPmVWQrCQpIc1Y5Rp8VKJMBgyhghxywndk agi6yPI5Je90TNAcfyPOJug9IWwxAc7+e0XALM4PlG1++BJ83NK/bwYsFfhVRhRQ9gWfrWsP7J2
 1nktzm11icxm/9XlYE9jHK/CzG4l+gk5c5qOGUT+qJXwpbPEIsjryLmmm+tq0r+zalCQvBET7Iz Gt+DSeIdS8Y4ZGA3mBS9h8N1hadagEFNmF5mRNY0AiQ/fzV2CvE1IS9L/y/RhZyWfDqKN0rq6xm JRDws+FT2Ap5kwLdhGAPruJ6iU+70jd3s4qosCjaaLIGL8+MswoDSQRE/Pkidux2vdPtryRTbmq
 PBq90UBgCbnQA3cMJihdGZLyKfRVt56KGnWz1TtVFUgVINYSf+Kbw3g6CBp+uYuTAZoCyA5c
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680be3ca cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8
 a=mWMBN-svVNVciv-ajYsA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EpyduWbApiTNFwrfh7iJr_QkBrPhmsta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
> DTS is ready and I consider it ready for review, but still RFC because:
> 1. Display has unresolved issues which might result in change in
>    bindings (clock parents),
> 2. I did not test it since some time on my board...
> 3. Just want to share it fast to unblock any dependent work.
> 
> DTS build dependencies - as in b4 deps, so:
> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
> 
> Bindings:
> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
> 
> Patchset based on next-20250424.

If the DisplayPort works on this platform, I'd kindly ask to send
separate DP+DPU only series (both driver and arm64/dts). It would make
it much easier (at least for me) to land the series, while you and
Qualcomm engineers are working on the DSI issues.

-- 
With best wishes
Dmitry
