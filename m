Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08261205AB5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590790; cv=none; b=iMsF4D2PNkkhdmgZEaCSWN+tyTmiBnGgKW8MJjaXi6of39URMrPq+dpaUkj23/F5cxrFemwVnCSL+TTix9YfxzpXFs2RhxpTZJEwcOtjUoQOZBVMgxq/pMDrY0OW2LTE8VbuXG8HU78BA5B3wy2VcRwtNACqOGNqqlEjZOMEY5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590790; c=relaxed/simple;
	bh=H6PO6kEAyVQ9N4PVFPzHjeNFBeJaMbP5zp2gL74nMX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSh6g3/MoHttp9I4LvfYXQmDxERPDt95LstVMIb2TYkrMae56goOSkHN4ZCq0iS6b02IYBJf6cZQNFyothrNIMiceMY8SlvgrZRFmDgO+WQwB7Y1j1wUGmrzco1qqN0gIYLj4mDHa2FcU+KHyP0OYsI2n+XU5EUkyj5yeJ2MbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYLB/yYc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYLB/yYc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUOnt003800
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	injNGQI0JCbgKouvarpQylLY+Y9kc7bf7gKHQgdaXO8=; b=UYLB/yYck712hP9W
	4J/jGySIBb/758cQAMgZBTjzGFwrbI7C5Krk69MTiTRPBk4i7nXRrCDRGkgfj/ax
	04IHMjVw/IG6fqCuUpuT3pNp1BYNO9U2RASfTYhUvarNMJgTudvGGFBLetDxwKDI
	JbMtaYUTGjxmoJR4kb26CAGnylmxgbIklOJ9RApRmCWxZI0+ev+z74hlHW5kB5IC
	wsq4L7mMwZgQzXYDyp/O2rr4vrakmO/GiexEVvU4LYkRJ+HkcTp8b4dqM94ByrEZ
	a9y/06Vg9UMG/hWjbzKUQDT7acDj96nOgUbmSXtPg7wFPpDklbEk2aJ7XsRpU0Rv
	73Ji7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03ggda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:53:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6ea8fc9acso43262185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590787; x=1739195587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=injNGQI0JCbgKouvarpQylLY+Y9kc7bf7gKHQgdaXO8=;
        b=ZWA1oyDmSv81N6cscOLKoTZK90dDLm3nGMcbuUBBKsEPiFAKI1w97UmEhu6ZvB9KGH
         Y+ZOucG8nLI/xGrnmBa9NtX9U5806qgbf3F+gaj2fqg7wwrpiJayARHA3JtEtYVs4fpC
         q8MsxeMiGA8TqYBSwO7x/gegdPEZnItmEL35Ze3l4Y99ChUUp/nZgNb1VVFlE3vTccFI
         G6h26CmKytQOTY4j2dxLgLmrgIzVR0ZAq8KVd+FodAawK61InHsBodCnU6yxaWKcRH19
         LrJ3Y7BS5NgatgGIcm2XZq1mqX0Asd+glDALl8RvfbH+dGe0cQBA/lIKxPbt2mxQHyJz
         gLdw==
X-Forwarded-Encrypted: i=1; AJvYcCWAhb9x2UvUqj9qm9ZHjHWdfwxVKfSuAQT+/nu0r0lUQLzPN7RsrMJD4Tesb8zSyncBABAV+uZhZ9ndzdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTMaSg4AL7wasGG3CUs84MANpm8LPjYhrXmOpnbW3ZgFYl1F+Z
	feLKT7EF2buQZ31csKGhoWi+DnOYTvRLTOu9Tkf9Pys6AwXuiJ8MKSz70DqDCp2s/XATFhfbn2m
	5ivkkbJQcVDHj3ogd+/C3PiIhaGiH8LNWSQl9D62UC5hIrvlMPNU06SsxXFENYXc=
X-Gm-Gg: ASbGncsTdswRGIVaOxt8rF62iN79+8kc5jyYiY4Y73FiCDoZw1Cj+QiYgcfLIpXg22d
	tRo4APG+ohVQdA4Q8tU9uslxBmvfvCUK7v6g9s5OKfoSdVAqFnRjvTILyjUQ0BJUV+bJnjFj6U4
	zIGAllnZXhZZW64Et5Z4OmoQPohZ8dxRvyVT4BWKsokbrsHJNuut0KWngYhaMP7W6pKyUWGlR/W
	f8/xgynmg04xraZ449mmFgX0N7SWOdxy0BGnTx4zDKE3JNUrxcH8lHJiBTmLMYs0wEPAgu81Ll6
	tB1wupiKfhx+F8LGNHkDQGKZkgXW/sKFl1/6tjVXCczhZcrhAYNA450YFZw=
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1176417185a.12.1738590786835;
        Mon, 03 Feb 2025 05:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQPQpJI2+u1RkHb4r/wD2F0JaTaGVjLrWR3uuOQu7UjW/qlahUngyXxm5TuRGYBMphiOSSgQ==
X-Received: by 2002:a05:620a:2686:b0:7b6:d65f:cb6a with SMTP id af79cd13be357-7bffcd8b180mr1176413985a.12.1738590786518;
        Mon, 03 Feb 2025 05:53:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff876sm759919066b.115.2025.02.03.05.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:53:06 -0800 (PST)
Message-ID: <70863b0e-1189-4190-807a-abe831e09a58@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
 <20250203-topic-sm8650-thermal-cpu-idle-v4-2-65e35f307301@linaro.org>
 <e1f066f2-d8ff-457d-8d10-c08b525013c1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1f066f2-d8ff-457d-8d10-c08b525013c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: howjXjhJlbIRR2a6pdOLuwv9wLdF7D_S
X-Proofpoint-ORIG-GUID: howjXjhJlbIRR2a6pdOLuwv9wLdF7D_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030102

On 3.02.2025 2:31 PM, Konrad Dybcio wrote:
> On 3.02.2025 2:23 PM, Neil Armstrong wrote:
>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>> is done from the HLOS, but the GPU can achieve a much higher temperature
>> before failing according the reference downstream implementation.
>>
>> Set higher temperatures in the GPU trip points corresponding to
>> the temperatures provided by Qualcomm in the dowstream source, much
>> closer to the junction temperature and with a higher critical
>> temperature trip in the case the HLOS DCVS cannot handle the
>> temperature surge.
>>
>> The tsens MAX_THRESHOLD is set to 120C on those platforms, so set
>> the hot to 110C to leave a chance to HLOS to react and critical to
>> 115C to avoid the monitor thermal shutdown.
>>
>> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
