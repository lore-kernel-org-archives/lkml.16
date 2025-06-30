Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED025FA0A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287413; cv=none; b=sZprVngfFGvx7zG77gWn4ku3YswdbToXhjQ3vrs02qHswanUYvqra5NOOdS1FPQmcxkovhXZpEVZ8rXGITXtppMeLtSaFoeLE6pb/FESDFX6A7VNbZ0t8qjdTgAuBukZDsx2alXQ5eid0tcp7GdXtWrbI7zITSk1xC48Wg6IyPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287413; c=relaxed/simple;
	bh=jX/AmnyTXmXRMW43Ube/tbKSQWPvBUKcTNDIPOnQyXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRrTo6E2Qv1y6umSCsJEJFPKjkyO92nwq9HpNtFxu6cBkz+rHhX3Awa2fM9APhZyV9QPewHFaCW5aAj0kJNRox+sT9qBGP4h82RLtBo4UnO1mbnTm+i9ASryQPlmXnfJtrewwlXn7MVHXH5SgK9IkwJdAe4SBo02eljNSdbHo2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzqN+Au0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzqN+Au0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DEYa002217
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LyQZIyqrPdU8CUNwsF+Y17dwiZfR3VxulP5rdlb6Wow=; b=BzqN+Au0hKWVG9em
	usSFXiVvbdiCi+1KDPehzYpnia7drrQxCDGs3gBj3v6+q2xkECWVWGF8FVIe3n4f
	n93W2WT3HlXHmBdoAwF13mIifMlWCK7wsW8gQeTVsiwIV9qlaTdj7bKdJQPqZVmL
	1toiD4+zsFPP/HCq8GvCR58dmp7+6gwSpXKF+66HnxiGeTx06/BZEQTWzeOqyUMg
	Drly0wz5/euWl8ECdw2sO6D38G+aV8roLH4zM/IixjfbzF5gVgPKok/4enM93FLa
	caoEef+McTo4qmfDDLo17LpD8DBqbYLhYS3KocIqrhq6gcuQVDmYKUZ2i+/Erla3
	uknEbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcmq01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:43:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979e6263so16293085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287410; x=1751892210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyQZIyqrPdU8CUNwsF+Y17dwiZfR3VxulP5rdlb6Wow=;
        b=Rt4HSU0NJpxLOLf9WJk2AoQfMOxgAcZfQOqgNcpoDMh+C+1IIw0CG6r51ZtCnbWXA0
         cvi+sPqA+zBw1gb6mFXAIpO3/DW7hVbxKnC5XsKym2PvLK00jUSituFzVl6br8blCCDI
         m1nV4cpMuyDpyCKti6WGO898PsN6KKggE0iwYKcdMcPtgFTkA7tmbMt+ZpoGS7hfNeBP
         dpE491U0VfwFP1sNIt5OCCXqqcmw/iD9FUg3P5wE9cX+FVSfoDIUdIslUVJBDPgHvQSQ
         fjFYJl7xiWePlzLAfhPJ4CrXR4ixhiWC6Nt0XxDcFBQsnnAySf+22rLCdJmXJUpFRdZa
         A4mg==
X-Forwarded-Encrypted: i=1; AJvYcCWF8zfHh3UZK7J8Jlie3NCA2aRBBx0P2uEWRkkWpKVxE8suqBISRF5cY+N+rY4noow2amDlo2mXq0ecsJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfE/oPIVOUMo7EPXhECJpH0PY29GcnjXsyHaOT0pvV0r8hbom
	8pgKD2fME719q3EYR8WD93sfxZpi2fHZEC0eb65UmHfLhTFNPD28E/+XFTB/wz52YHgmI1XdEzG
	bzXDYwgk+Nj4mL3qMjBWMyT722gjAsDzhay/LNOJuMG6nZZro0VANiJ5LpLFIwA98+qT1iNvP8C
	M=
X-Gm-Gg: ASbGncvOMD14UsCSLYbJjDD3bz4sxC4qZ0Q3Y/lG6bpE8jjTYVzE2/orGNeEI9S0f4J
	l5nd6C2VnuoOF7yG8OhTV1JR302M9OM7U4XIH0FA27MPZmSJmnj73M93P4xkh7dQ0ou3A3lEglE
	DKUKDhGKejv0ApaO8g42TPVb6JI6pzWyGC1tr0CV8AdEOaQ7txIkm11SQ1OKvpBJ28k0HvYga3G
	STMl0kCdP06c8ULHJwd7cJxBgyXM4ItRJOQcZGuFs0kKyqLMOpF2K9K4ehtYl028CMaeBx4DXa1
	hvPGoZLfti/QskicS9EL1sy0xi/yelyt/8ha7ith+Q12LkLbcc36GGgsI3+bRncsWRTm4vypIXz
	oyyDbjkfS
X-Received: by 2002:a05:620a:1911:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d44c214b76mr509667485a.5.1751287410062;
        Mon, 30 Jun 2025 05:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+9H7GyJO1Tgn7URrH450skC1FcVFfpRh/HH2LooElNcKzAnTRx0fRWDZsl0nEZJM09hrdNA==
X-Received: by 2002:a05:620a:1911:b0:7d3:cf9b:511f with SMTP id af79cd13be357-7d44c214b76mr509665985a.5.1751287409624;
        Mon, 30 Jun 2025 05:43:29 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae36ffe2981sm457103366b.120.2025.06.30.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:43:29 -0700 (PDT)
Message-ID: <1309f269-9b52-4f0c-a463-c4e5ae48cdd3@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 14:43:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] firmware: qcom: scm: take struct device as
 argument in SHM bridge enable
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250630-qcom-scm-race-v2-0-fa3851c98611@linaro.org>
 <20250630-qcom-scm-race-v2-2-fa3851c98611@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630-qcom-scm-race-v2-2-fa3851c98611@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uEQ8S5DEz7JPX5OSXp_X2E1JNA7pmbCq
X-Proofpoint-ORIG-GUID: uEQ8S5DEz7JPX5OSXp_X2E1JNA7pmbCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwNCBTYWx0ZWRfXx2wyyYB6t3ji
 GQACvGhHl/sHf86FaPH4akpQ5RM88bwivBXioUriYOvOTjGvjoEuBim1Fcy6/Z8vBUS3npcMOgS
 N5kx2gjBt14XqDq2AOdikkmPSLgN6CijX/E3VhfFsx0ZMPQbsTfX6yY9sKcBVAgK2SUdWsP3pZk
 gAUELBrF9MDaiyWTx1vP+MXTybj5DnBYhRLZEkGEFD4QLm1/hsiu46HS6P+S1LBpHjSEwbK+199
 ascowGwQYT7fsSlPkGXBoSTkKpHXvV0ShN0B0BglnwUbhihpbFD3+4oiwkVretnGNuLSm8+aRKm
 VbkJeEaf00kccSiJII8NNCVr6JfUq8YO7Ndn7W1fy1nNiduwqU/8EvAhpwu+RcbnDRixarCkbkZ
 IrCFTPN9hHOUkX8gLM1H7ej5I9i6rW9wGpt+ufo7MZaNi7bDXDB9b2MVWvcw394DovuRUJSg
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68628673 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RNNxD7A6MxM0MKzNLocA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=825 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300104



On 30-Jun-25 14:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_enable() is used early in the SCM initialization
> routine. It makes an SCM call and so expects the internal __scm pointer
> in the SCM driver to be assigned. For this reason the tzmem memory pool
> is allocated *after* this pointer is assigned. However, this can lead to
> a crash if another consumer of the SCM API makes a call using the memory
> pool between the assignment of the __scm pointer and the initialization
> of the tzmem memory pool.
> 
> As qcom_scm_shm_bridge_enable() is a special case, not meant to be
> called by ordinary users, pull it into the local SCM header. Make it
> take struct device as argument. This is the device that will be used to
> make the SCM call as opposed to the global __scm pointer. This will
> allow us to move the tzmem initialization *before* the __scm assignment
> in the core SCM driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
