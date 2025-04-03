Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DCB19340B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673090; cv=none; b=k+aWP6OHfCNE687j7teHPAUk6kLJedWH/UQK1XBTxFwnhfQ9VINsoX7LriKwWOqONQorZjGfRrfBuQ1ox51yrxHNQGMVSgp12XGYNxczR2kBrEFuHentcu2S+RaCcLdVHIoDHGCPmC0vRvLlk91KAp03hTPKMLl5emWdRaBTbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673090; c=relaxed/simple;
	bh=FQPPcWUtZdp2/DCXiYjNdfrN0/0GtbUq31e2vCX85hE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0IGj5iImyG4WF1afnueWEAhUiiBqUmq8AtRTU9KvZvCKF5C1EleO8P4b/nD6Bg4bWzPe16HQEC6WVkyy7zywXTfuIcUcR3yfzK0CTePy8EewIP48/9pOR+a5dBjHTNCm+NoZ1PEsi+NeDuM7WTSRaDon36Z0d6uiIAjX1yJwAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDKnsCMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDKnsCMJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53382mR0013721
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 09:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO2hhGbPwPnTI5JFeyUHyzo6fBY9jxpUbWMew2rlQis=; b=IDKnsCMJcNjTRFXK
	BWZokTMtdo+E1g4fPfEB8uMy7A4ip8wzZclrXLu/MN6WjP0XSgULd5QGBhHh9dmH
	nuDxnDlGcppQPt5waQMygyFK+WCMvP0Qfs7v1PnvFqkupTz7tFx0stOKvrynxtCP
	k0GlnpqhiiXW+8KeEtDudBsVZXchM1E3JsivyI61sjlyk+VZPpJ/99F5YPdtYD/g
	E7L1iXPAFu3wDxLtipGFf3eJJzrng1qO8lnDKnE96tfq/ilaK+WKHOd5sCpumzi4
	9w1b/Ltp/wgAjpx4QHcIC3N22hyI2DWfFOOBwMvD1L98vm0W5P3XZdonies+nBJ1
	3La4pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x1ken-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:38:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7bb849aa5fbso164711885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673085; x=1744277885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jO2hhGbPwPnTI5JFeyUHyzo6fBY9jxpUbWMew2rlQis=;
        b=SG1Rmu6jU52tUjSKvIY1J4PPCKYb61RR9PNzCNMsXGR6H3224tzKu2202LlSh7yBCz
         Kj/dTNWfP7AttLdFSSrvy/fxfIXON3LbZ8stOBuqEBTJQ0KMJ6HekMEbscBH7YFglq7J
         HF8F84tzEqfa6hbJhxV9UkSZFTSnybVGnvEle0zgqyGEgl1mWIRSIQaioPzbjbAacm00
         Ru2AHjjgU4Vv7vImXhJmNWpDEjLu5syPeVUbowIoYcs0pPitUoHTA4sfeCSglMmpImKw
         nBGcSzQhcBCg2DVpHFvQPxoO8EhxowFgZbPCMO9aZYkaKJlvTvZKGhVKxjc/UNKKat+4
         hvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG9uZVljeFBigBUoMCYRxNKqeHx1ldFXreINKZ1ydlPby9Ixmxi4GWFUHNCnbV6OiJzRVbuOzrVSpTP8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSM3HSqeehyv6L+57qsP2l+pEcmE4uXw3J2Fnyma8b4TlT4A7
	/qdC5tX1tHaDHqgk0mvaIiTcOILAioGNM2ow2PDRK5i+X2kss5s22qyiXk/io7J4iV0N9NukR74
	PnbrRk3YHybkT+6NoTO7Hl0226FDt79IYW0TgvreYb7IKuKwz9t2X3EoTW4anYhQE4ISgnOI=
X-Gm-Gg: ASbGncuq62W0Vx+VhG1L+UBza7BvLyXs7AUxgFhj03DHpU7kWDP8ChtzoZDs8kla2s0
	H8QFIM9GiqF72sy3rP7P7zFMMl/dXSy/K4kQKToV1c9R4JWpfII9/vX58VnvKgC/K13EAMXr+GN
	RNYxQZOJbg7INYubNPZwbG9Zlc/xWrk+eDV4rLhWXPoWhmUfNrnlpJbi7BkMUoqDFlVn0MoGmla
	nQoP3aVwOwUVpJauC84sxR96zlNCeAaM86C7ZD5nxQ4WcP7pA1frzaIooMH8IrO3g0ktRfxnqQ8
	Ekln7MmD3uhkwjZN6EWjiDXjQK6wtbC3jIzzCYq9Ct25lTNF5m0tQwmfM2PbefchBKKX
X-Received: by 2002:a05:620a:3948:b0:7c5:e3ad:fa19 with SMTP id af79cd13be357-7c6865e8a87mr2668669285a.16.1743673085511;
        Thu, 03 Apr 2025 02:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEEKOxU/05DKGywiYf9TLYJWmRWM88mF+jT2ChBuJVcyg4k4AGtMKZxTYd2ILiR7rGNb1u5Q==
X-Received: by 2002:a05:620a:3948:b0:7c5:e3ad:fa19 with SMTP id af79cd13be357-7c6865e8a87mr2668668285a.16.1743673085072;
        Thu, 03 Apr 2025 02:38:05 -0700 (PDT)
Received: from [10.151.160.223] (87-95-44-167.bb.dnainternet.fi. [87.95.44.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5b51b5sm100280e87.3.2025.04.03.02.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:38:04 -0700 (PDT)
Message-ID: <139a5c4c-b984-4e32-aefb-81dfce2ea0af@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 12:38:03 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh>
 <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
 <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com>
 <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
 <CAO9ioeVYYy-10ZBmNLMzZK2+mZ5mKf_ZtGwRVf__Dg8GA=Sf0Q@mail.gmail.com>
 <56cbe0a0-048e-45a2-87f2-e2515c7e7414@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <56cbe0a0-048e-45a2-87f2-e2515c7e7414@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hS1ohYR2e629g5MxtZob842Bi9zkNHKO
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67ee56ff cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CnknO/h8B0MWpypvlE+5Zw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=OgopSsC_kgRU340XoF0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hS1ohYR2e629g5MxtZob842Bi9zkNHKO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033

On 03/04/2025 12:35, Srinivas Kandagatla wrote:
> 
> 
> On 03/04/2025 10:31, Dmitry Baryshkov wrote:
>> On Thu, 3 Apr 2025 at 12:27, Srinivas Kandagatla
>> <srinivas.kandagatla@linaro.org> wrote:
>>>
>>>
>>>
>>> On 03/04/2025 10:25, Dmitry Baryshkov wrote:
>>>> On 03/04/2025 12:18, Srinivas Kandagatla wrote:
>>>>>
>>>>>
>>>>> On 02/04/2025 12:31, Greg KH wrote:
>>>>>> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
>>>>>>> HI Greg,
>>>>>>>
>>>>>>> On 01/04/2025 20:18, Greg KH wrote:
>>>>>>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000,
>>>>>>>> srinivas.kandagatla@linaro.org wrote:
>>>>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>>>>>>
>>>>>>>>> Hi Greg,
>>>>>>>>>
>>>>>>>>> Here are few nvmem patches for 6.15, Could you queue
>>>>>>>>> these for 6.15.
>>>>>>>>>
>>>>>>>>> patche include
>>>>>>>>>      - updates to bindings to include MSM8960, X1E80100, MS8937,
>>>>>>>>>        IPQ5018
>>>>>>>>>      - add support to bit offsets for register strides exceeding
>>>>>>>>>        single byte
>>>>>>>>>      - add rockchip-otp variants.
>>>>>>>>>      - Few enhancements in qfprom and rochchip nvmem providers.
>>>>>>>>
>>>>>>>> Ok, I wanted to apply these, and tried to, but they fail horribly
>>>>>>>> because:
>>>>>>>>
>>>>>>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned 
>>>>>>>> reads")
>>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>>> raw_len")
>>>>>>>>      Has these problem(s):
>>>>>>>>          - Target SHA1 does not exist
>>>>>>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit
>>>>>>>> reading is required")
>>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>>> raw_len")
>>>>>>>>      Has these problem(s):
>>>>>>>>          - Target SHA1 does not exist
>>>>>>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than
>>>>>>>> one byte")
>>>>>>>>      Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
>>>>>>>> raw_len")
>>>>>>>>      Has these problem(s):
>>>>>>>>          - Target SHA1 does not exist
>>>>>>>
>>>>>>> Looks some of your scripts or b4 is picking up older version v1 
>>>>>>> of the
>>>>>>> patchset
>>>>>>>
>>>>>>> None of the above patches have Fixes tags in the V2 patches that I
>>>>>>> shared
>>>>>>> aswell as patches in linux-next.
>>>>>>
>>>>>> Yes, that looks odd, it looks like b4 pulled in the wrong series, 
>>>>>> yes.
>>>>>>
>>>>>
>>>>> Even that looked incorrect, as the v1 series only had one
>>>>> patch("[PATCH 12/14] nvmem: make the misaligned raw_len non-fatal")
>>>>> that had fixes tag. Not sure how these 3 patches are tagged as fixes.
>>>>>
>>>>>> But, that's even worse.  Those "fixes" are now not actually marked as
>>>>>> fixes of the previous patch.  So that information is totally lost, 
>>>>>> and
>>>>>
>>>>> Its because this patch("PATCH 12/14] nvmem: make the misaligned
>>>>> raw_len non-fatal") is taken as fixup patch and wrapped into the
>>>>> original patch ("nvmem: core: verify cell's raw_len"), Also the sha
>>>>> will not be valid for linus or char-misc tree.
>>>>>
>>>>>> again, the first commit here, "nvmem: core: verify cell's raw_len" is
>>>>>> broken so much that it took 3 other changes to fix it, which implies
>>>>>> that bisection would cause problems if you hit it in the middle here.
>>>>>>
>>>>>
>>>>> All the patches related to this are enhancements to nvmem core to
>>>>> allow specifying bit offsets for nvmem cell that have 4 bytes strides.
>>>>>
>>>>> Specially this check is also an additional check in core to make sure
>>>>> that cell offsets are aligned to register strides.
>>>>>
>>>>>> While fixing patches is great, and something we do in the tree all 
>>>>>> the
>>>>>> time, let's not purposefully break things and then fix them up in the
>>>>>> same exact patch series please.  That's just sloppy engineering.
>>>>>>
>>>>>> Please redo this series completely.  I can take the "new device 
>>>>>> support"
>>>>>
>>>>> I can send them but its going to be exactly same series, I dont think
>>>>> anything will change as all of these patches are enhancements and
>>>>> there are no fixes.
>>>>>
>>>>> I hope this clarifies a bit, Please let me know if you still want me
>>>>> to resend this series, which is going to be exactly same.
>>>>
>>>> I think Greg is asking to squash the fixup into the relevant patch.
>>>
>>> Its already squashed up in v2.
>>
>> Then there should be no Fixes tags. Is the series that you are sending
>> visible somewhere?
> 
> Yes, there is no fixes tags in v2 series,
> 
> Here is what is sent to as v2:
> https://lore.kernel.org/lkml/47a3a851- 
> f737-4772-87c6-98613347435c@linaro.org/T/ 
> #r01449e17cf6f9396967a822a0460ad4b1245e914

LGTM, thanks. Then I don't understand what is causing the controversy 
from Greg's side. The only piece of information that got lost is that 
Mark has found an issue with the previous version of the patch (I'd have 
added that information between the tags as you've squashed the patches).

> 
> 
> thanks,
> Srini
>>
>>>
>>> thanks,
>>> Srini
>>>>
>>>>>
>>>>> --srini
>>>>>> patches at any time, and really, those should be marked with Cc: 
>>>>>> stable
>>>>>> to get backported, right?  The other ones are written as if they are
>>>>>> fixes, so again, I can take them any time, no need to wait for the 
>>>>>> -rc1
>>>>>> merge cycle.
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> greg k-h
>>>>
>>>>
>>
>>
>>


-- 
With best wishes
Dmitry
