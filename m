Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B15226BD92
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739241661; cv=none; b=d7Pnq/37u2b86jMBJMlaMbCC92X5xSP8FEYwlVS6Lb/hi62FITDgqP6B4POIMWRP5EQb123D9z3K56IMmC3rh7GKnsEwx9tzlET4loriRw3PxjGvdJOTY5Z8npgcM2a/2fGHNhOKYgoFlOfy9UR/t2MXPP928YbkNqyTBw8lyOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739241661; c=relaxed/simple;
	bh=iP2ZFd9mmNM0UOkLQXqsOjEl6+6YiCtrboCdTCrEnOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+mn1sCppNGiuJwrmq8uCHGJnrEVZjNuugpL6zT0KjHB24lVC2eOXDVXyDsT30VWtYVWRgoQLq4dgKD/nfpm86ZOafxSQiJT/oeX8kXFgK+qBetAwrh6auBbt4pKicgeoCUttjzZ0H09e0tw3/jQGt3AqDS96buAo/C/52eZHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfDz4OQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfDz4OQU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AMrYSi011756
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=; b=bfDz4OQURTIWt6vQ
	wuUL9s1UUob+eLYOJ9ktApZV/AK4m3q6MPe5KKDL8OUhn7ShzF3YpuaF9vBvBTHa
	qacOs0HFSpqJB0EXkJ66XQQhXsgEubPApLF+jEUyr36LsqM7s/WAICDUIK7evo1D
	8CeJU9ABjGvFPOkWbWZ8MJUN5PFu3rdalVRHqb4XBnEm/8NTaCUMWNdk86tuyUUP
	r3fXPvavzKcXmkTN1/FMC0JWQXItKgqYrfqWfCvJRyZcyHT9IDrpo2lyW1TkKbV8
	O0+QRZHA9g7S7cPJ3NSYb/7LkiHxbCgvUW6usKflmqzaGuHs0olhOyFoJ7DCrzRM
	gQR0vA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8kybfwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e4287d04e4so14193346d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739241657; x=1739846457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5WY8N5ks8GYUyNu1nsdKVcNatvt1ZRhBofnP73+/Cc=;
        b=cJtpM0NzT0zyo/xHpVVb/oGqz8nC3NDldyTeT2dqNb8/l2xK2phfQsfiC2SGLxQvVg
         OWlvXT7F0HGhEAE3OB6kkRtcbhaT5j7lHkPdESZuYdplpXSp4d/0framDtVC/UEla0DR
         nUGnzahpgUs46QMCG+tv4bg/JAsfVecwMLZblsBnDZ8Xes3M15Vh/cVldLVQs/01O9Xp
         KdjWg/OP+eaaYi7LE09DV9Q8ArwQXEpVm3G9+IvwWQBSe0Ky0Fl+oJ69kqTcMLh4tL+g
         oUnGinXLGz4qZKSXltTmiRh0rKR5VGOrh43eCW3RdvzumiMKZpox6PTIS++gD3C42AxT
         Xg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbpNn0WTiElpP2IIjBonNvdnlmRk/pKhy3Z6W6+yevdpajmTR+z1aR+w9yQh4z4zH1YtSbbuhGVTgs7VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfSEMUDNbaSW2SQLRLWT40zIys+UlvhxTiHPUXMYhW/kIoQPc
	W1h8imK398UfHiPyynimTQ7ui+cHIZD53/nUbOTMwEdzROl7RsKq8R3pDcIRP918W/iW9LBVPdp
	GR+piEOeqEaUe2EsfKgM9nx4gJM/2ZQyplFBqqzpfxeudlzlcXGMs6BL3eZkfNg0=
X-Gm-Gg: ASbGnctthSSyNj4lvn5LMcNq58kFJomZGoJ7g4aamiNL2lM3w5pNGqLIOyTdRyu9NWj
	kjLgiM83XaZ1hlnJMd2lDip/wm5RvJlr+FJ7JP3/FlwQe4chCEz2rn0rISZRXi1n2ysk9P56h7Q
	CkLCQ0usu/8nK/saNohz/3MM0s7pXNYjUYT515QQhOHLeNx6WRz9FfG7lN447ECyhPbocN/pHtG
	GTe49qwwHAfTelRNQQGsm+tpUJ95pQxRNBA3s/+sdjwknu0LdHrOLtsTJihs1WUL49yn8qY7fZ7
	QmEMnDaskOiASf6o0ipcVFB7iW1op6812CTjorjbHiZnpwZubO9pK2JbYes=
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7c047c582c6mr862203685a.13.1739241657145;
        Mon, 10 Feb 2025 18:40:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXTZRkXlf6H0uaJ0li29IfhwzaEgg+uIjLZ5thLqRq3AgGpVeEiHBLdGiJWI4c0EUhvnEVXg==
X-Received: by 2002:a05:620a:24ce:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7c047c582c6mr862202685a.13.1739241656794;
        Mon, 10 Feb 2025 18:40:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de61830117sm5320653a12.6.2025.02.10.18.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 18:40:55 -0800 (PST)
Message-ID: <03df88a6-91d0-4504-b14a-223e55208162@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 03:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't leak bits_per_component into random
 DSC_ENC fields
To: Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lydWFmKm-taY_D52hcVZu78HoFIAP4Rv
X-Proofpoint-ORIG-GUID: lydWFmKm-taY_D52hcVZu78HoFIAP4Rv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110014

On 11.02.2025 12:19 AM, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> Now that guards are being removed to allow more bits_per_component
> values besides 8 (possible since commit 49fd30a7153b ("drm/msm/dsi: use
> DRM DSC helpers for DSC setup")), a bpc of 10 will instead clash with
> the 5th bit which is convert_rgb.  This is "fortunately" also always set
> to true by MSM's dsi_populate_dsc_params() already, but once a bpc of 12
> starts being used it'll write into simple_422 which is normally false.
> 
> To solve all these overlaps, simply replicate downstream code and only
> set this lowest bit if bits_per_component is equal to 10.  It is unclear
> why DSC requires this only for bpc=10 but not bpc=12, and also notice
> that this lowest bit wasn't set previously despite having a panel and
> patch on the list using it without any mentioned issues.
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
