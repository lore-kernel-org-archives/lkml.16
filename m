Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C943C205AA7
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590804; cv=none; b=IX++n9V8eKf7gNGlJoPz65UKk0yZI6yY2fZ+N0tn6EU4qAFppDQnyvfLC7mE7rl+59/lAT4rP2Ls+zvmAOe6Di4Mg+Soasur1u2PAZrzKXlWjZPgCieED3MNAF1Z0knnkqrgwh/hHBezsTQHz0uLFs8QK1gMdifO06nXJQZCMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590804; c=relaxed/simple;
	bh=BDaTRPRB1+xDmux3TdJKzmueBfcUfMxtJ+8A1GnOBwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HwGdQtEvcg8R+mNZj1Wq+8kDx++n39YXBWkzyqD9GSDfQ23YrUxZf5Vw3qaUZ3unjUnl5AahE6A+/EUSQ8k90/InkNqENUmnM/+ox1Ohg3VXTlAVFMyRlcn4iB3MGP8bQo8UOGrQtbkhRMkuyMkfNI9eYLbAO25dB1wqif23lTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmNuGbpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmNuGbpu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135NVpn030601
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1my9vn2BynZGg5rPWbUB5/Z05wI52PF0CqTy6aaA3E0=; b=AmNuGbpuWXWCJK2V
	7udmnfL2FzWril8doULY1ShjJcg94lhhLnQBwrSPNMBhromsJZ7JX9YQO+Y91qIx
	idVVvRDpMFgo6AMJWmkEDgnI/flO2NeAfFQ4GCr2/G8uvbU7EbnY9N4/A0ErpkJS
	DMieKKwaG9YZuPQ9s6tUtu760xePTO+YD3sUcgSVWHjZSmKccCwnjdk8k1DGV9Vs
	HDsTwPBYaJ6T/Fh5LrB6RiXyjl69rTP/YEJbKGUYUbQ4z05iA51CdbKN/3IQSmEe
	hYWJV++FuBlRvpfMN1cAB6q7Snuw3h3kDdKb5ErM7YDL/BbzCWkMVYR9OfK5/9qP
	lTw3Dw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm418uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:53:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e132c31eso20975385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590801; x=1739195601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1my9vn2BynZGg5rPWbUB5/Z05wI52PF0CqTy6aaA3E0=;
        b=NiZspw2ixLZwlPpbEIO8+IsR6cp5Id/BeXJ+JG6ky6ucUmToS4hZE74/z1UkwyzUHb
         anlKC3yoMwQdFRM2k7z5Nd6kGSTqoc5mqnXOO9HsJAiHqWm/xl22mKVgPmCkmHNrJOdv
         a1bAua5Kwf1kYmTkTOtQsdbuCzHSM+BvBD48Tif2BSAmllnOZMoU0mUqWtormkKYo7Bd
         ovGpopFoYwmol+938gltSeksjDvTjggRG8fnD0q4dozdeMd0p4JmuM4gK9UMDgS20S2k
         O0XbdgYCcCYfeHgZ7m6gOwGMIqwTocPdTjj6ZtnNkrNEww2O3Vp4L0ag2dXSRMq/HPWt
         CqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3qe6bEwdYoCYh1+QQ8+djfvc5M7778YoRLxW2DhVwInUn4zSFQ8scyMQvXgzejD/4AldxIeeta4U0khs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqzkJuBAwKUy8x7+VGcxhP9NINBgShiLoaJYCF00ezrEfgzgw0
	83DKYJUvoJW5aMgSFkS9lLA3z8E7FZMfIuu07NfN1QoQundXRbPX39b1wlWTUiYpwYlJUA9Njav
	yDVFyA3pquYnq3GMMMgQb6k56QUC5bMjLyrhdh8KwEsMW31GiRDRtAchTvY8asgw=
X-Gm-Gg: ASbGncvAror49kmMTs1EvfOE2yzVpbqt9pXZE2TJn6QG+R4QMya7mZkzUNnxxC6liRW
	hWZcgoD7Nu3uskEhefRMAOKS07MUTYVyVbLv8c36d1gj2d9DNYZq5x3aEF5+cFVhuW/aQHGI9qc
	Smdr7voAr831wBowDy5iuvXzBYplH2cwcmVeN86kedw/MfkI5Hn9s2xwmrQylwHC/1czw6Sw7aB
	sJSJjc27Keup+anf0Eq81pO8FMsMSz7K+jIezwDFaWpqdLM58/Wpv89XtVO8gpjX71eaD3NtnBo
	MGr7PndX57YpTnQCRQ5dvrszkdcMaa5x0dTyDGLPaIHN5jnIOj8FlyQiChk=
X-Received: by 2002:a05:620a:3197:b0:7bf:f916:faf1 with SMTP id af79cd13be357-7bffccc9225mr1263566485a.2.1738590800772;
        Mon, 03 Feb 2025 05:53:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoz4zJLV52R3SeV3FERp7sQHSO7BCfUwtoXieuP2UYa736qUJQrEWnCeNYRuw1lj4Hh2NZiA==
X-Received: by 2002:a05:620a:3197:b0:7bf:f916:faf1 with SMTP id af79cd13be357-7bffccc9225mr1263564485a.2.1738590800391;
        Mon, 03 Feb 2025 05:53:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0feasm770707666b.52.2025.02.03.05.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:53:19 -0800 (PST)
Message-ID: <7778b91c-aa94-4010-89bc-5e86f78ae275@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com>
 <20250114-dts_qcs8300-v3-1-d114cc5e4af9@quicinc.com>
 <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e66dd1b2-3257-448d-9c41-9be643652962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jbaDhIzN0KH9ULHHURqozpN-oNrEOTdZ
X-Proofpoint-ORIG-GUID: jbaDhIzN0KH9ULHHURqozpN-oNrEOTdZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=951 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030102

On 3.02.2025 2:43 PM, Konrad Dybcio wrote:
> On 14.01.2025 7:59 AM, Yongxing Mou wrote:
>> Add devicetree changes to enable MDSS display-subsystem,
>> display-controller(DPU), DisplayPort controller and eDP PHY for
>> Qualcomm QCS8300 platform.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
