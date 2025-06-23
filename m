Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F91239E75
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673495; cv=none; b=uklWI4OO19J1pRV/FSL0XDr+xlGgYt0nfhCTPzIXnwuLUMLYcdKJCUz5CGwaLcoAOBqqMu+R7d7bILUIfS+QBBX/FFF1GJGSbFrMUJDVR9jfS4TkzJZKRg5P29STI0M4EXY+BwAWy9iIuZYU2eaUgHA+sy8Mign54aoE8+tH55c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673495; c=relaxed/simple;
	bh=L4V8GDcixyWxkjchU/ASicNfTs7EbxX8xjgR4NFBHIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duScAr03OE+1Bc5XbAHlKgl8Qt8IVpTz47kG0araG821ESpxE2+qVj/okCJTFVWIuD9nPMLgBQGE1CM+JldHcRcjMd6AjpMyR0CDFMq6JqSJFq2WTKNW2KzPWfFNABur6EyKjEBDesJnrCrWOXThLT4b0AV4fEjW20ixxlXzmGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DH+9r/Gm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DH+9r/Gm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9pYcM013285
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nsXHkEoSXnETEDfohe14zSaQ6QC7uPOSNPk17vEgzN4=; b=DH+9r/Gm7enpM+Q9
	miBBmdz2aIUgb/NjLfy3ZAZM3bS7/n8lVMXVP1Jg0hEMow0Dn7gyDwEKrvBXEfUC
	i3jl0ZXPPrLSOswg/9G5Y4vWQhiGNTTZ3t76db+l9ST2Uq2ZfqhcAYvy+Z9p1LC3
	J+WfULCde68e5Gt7ICOu1LKx1V0Mp/BiduREIdd/OZHzcwJolXXPAhrpSuMAPA3P
	pzcZyrr7yFJ/FfBOMA9HulgcQ2gCYG8W4zyLy2pJes8NNV4lUs2mfGDfTO3OKPaH
	LwDW2Ozylb7tnKstrAz1KLVqATz1Sm7X7VdupL1hJUkO7Fvfw6+2FjDjLEpz4Qem
	uxSFAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09dfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:11:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso9838001cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750673492; x=1751278292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsXHkEoSXnETEDfohe14zSaQ6QC7uPOSNPk17vEgzN4=;
        b=DtaFTN4xF72HocSLM2L+4n2sAkg8VfI35gsyLAjG4Rhz0okIKqbQI3pKDXNrfZuiFZ
         btiohve5UzVTaZ9s9MDAKFqURbjDeF2nDkB83Le4MB2kCi/HWqiBALFZ8W+G671RxJmq
         3hGALu6XjL+NdaULE+zOQgcdU5lkTW6Alg1BTwSUlL9U9nChWhodlMxexNHMrfyyQGu1
         Mre2+vn1VUfNnaOSkqc9m2K5D8gJFAL3TGfWqTCeZPw+V68k5v2wGrhNqeGBNVo3n7PY
         kZrF89e08CnLJyU4mh+paVasGbXeD4Jkc2njbtGo3nP5PCowyPRsXVEQ72yz+N/Fmn6m
         7QZA==
X-Forwarded-Encrypted: i=1; AJvYcCW49ezQLSw3biH8G5WgsuXLpxKEBY5v9MC1UfQ9up7fLUpZsAPUNdtIaH2k6BmddWIOcYc4GZ4fZ0s3vH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx2LXWOSzMSjppy2Imc1FwtFDJWZXw5gndqrlBZSH4eB34dL85
	BSfZ3BZi3Y8ybFnU/uiHhaa11gfzJRXJcCclt/Lh9LnES7HPFF5ZLQyvuWoKv0eAEFOoxDqM01g
	8yIYZPSeMcp03bgHShxfjxsOdbFwFHt10/wEzY7KfKeVG0HMWfI8AB4dYTP6uSGyBYqc=
X-Gm-Gg: ASbGncsIeCkLwVbLrjF3nrubsmS29fxM6MHGDkLARJC7zoPXaHCbbyoRZFRlvjBuuV3
	mfcEfM1nzl7i5zrDbWMy5ASSwVmQMjb51Lw/bYGMwnF50nfF3U/3O3DOGLnqiWlAbtw2Q4Z050h
	URd49N1GFX5cm0Z135OuQ0chCT01s7RrBzH3UpIwWM/AsSRgjxjkLI+zWlCsze4s4s/7MI1s+ox
	rUqDk5bRV0PH5RpTsgaaoH/0TU1QCJ/1ZdKKi1AoptN9jXFpUEdjDDGCq/ePtuD91DuPFPm3tCE
	xkYdOOdAZMvIPsBfe80ighEM3twtQHQAxXhxq3R8tGINfQcM+cTSLkE/5bOAza9KeJp17g1TxrS
	Bqko=
X-Received: by 2002:a05:622a:580b:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a77a246084mr68884191cf.13.1750673491684;
        Mon, 23 Jun 2025 03:11:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy1oUWDRKcqfh0pSMxqJrFkq+zIxAO/Cnx7r1VMRo0FanZaDrJkBgm6J29KYYFk+KqUg20Cg==
X-Received: by 2002:a05:622a:580b:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a77a246084mr68884021cf.13.1750673491076;
        Mon, 23 Jun 2025 03:11:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm680996466b.71.2025.06.23.03.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:11:28 -0700 (PDT)
Message-ID: <92f1d1c1-e62d-4f77-b55d-110d8ad56a06@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:11:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci <cristian_ci@protonmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
 <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Fp48ghZvedurtk8ta0jccDkZvg7whZFgX0Ra7_AQuMwS12QxAxHqgcOMP_SbXsnLNme2LWWz6ZshoGFTQT6nVvfe-4B_v-2hkRxpgcb9bq0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f7f1JH16UuKSNJYLxk1E4gJOW6QY8oyJ
X-Proofpoint-ORIG-GUID: f7f1JH16UuKSNJYLxk1E4gJOW6QY8oyJ
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68592855 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=XdyHM9KW_fXSmfWyf6YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MCBTYWx0ZWRfX3m2fuCoOTaAB
 PUIGOhwShWL7CsiZ8yp6Hj6Oyvul4T8Dy9VXi1zZZou3pn8/IFx40lavMAs3q91r5dgE+NTY6M4
 o4I041+9jB1YWQRqLqzLHJ0Di3l+Feb3gU3crM3ySAP/p9TmNL5lil/og8hukAnvJiPBdo1ZyYN
 DRIHHrObJbrWkkNZeYH0Kh/smvLCnvPxoxG0GLYbxaCniPP1qFnH7kSk8IjB2aeP7jTHcMRZopu
 qBva6srL06+MV/A5BjQZtlxmlwePPy/LRMNRMvwfJQUPzAkLb/reU51l3Gh1hM9ZJdzoCYmLosn
 117LiRmlnUHhaIqPo4BAhdbMG6hqTUWa6HJBjRiKflPNu42L1Enw0u5X+vEIbm4w9C6UWi4pXp2
 vE6bijgXPR0vO7PjbENLpVLjMDzVjxQ7XHmYply0guv72Gs0JPxwovmTTY/C660Gkdk6Ot0n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=774
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230060

On 6/21/25 9:31 PM, cristian_ci wrote:
> On Saturday, June 21st, 2025 at 12:17, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>> +
>>> +&sdhc_1 {
>>> + vmmc-supply = <&pm8953_l8>;
>>> + vqmmc-supply = <&pm8953_l5>;
>>
>>
>> you should add regulator-allow-set-load to these vregs
> 
> So, do you mean I should add 'regulator-allow-set-load' property to 'pm8953_l5' and 'pm8953_l8' regulators? If so, should I do that for 'pm8953_l11' and 'pm8953_l12' regulators too (sdhc_2)?

Yes

>>> +&tlmm {
>>> + gpio-reserved-ranges = <0 4>,
>>
>>
>> These GPIOs correspond to I2C/SPI_1
>>
>> <135 4>;
>>
>>
>> And these correspond to I2C/SPI_7
>>
>> Without much more knowledge, I would guesstimate one of them is
>> for a fingerprint reader and the other for NFC eSE
>>
>> Konrad
> 
> I made that check in past and, while it looks like 'gpio16' and 'gpio17' are assigned to nfc pinctrl (though, nfc appears not to be implemented in this device, considering also the lack of 'phandle' for such pinctrls) in downstream dts, the devicetree pinctrl still doesn't mentions the gpios associated with the fingerprint node (which is, instead, implemented in this device). So, I'm not able to verify if gpios 0-3 and gpios 135-138 are related to fingerprint and secure element, respectively.

If we can't tell, then we can't tell, it's ok

Konrad
