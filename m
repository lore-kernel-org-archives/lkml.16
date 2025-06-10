Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0E26560D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589497; cv=none; b=SLO7/ua1exJd+uCitWvKLZz4B4FuFlSnb6j5ajv/wNOhBgYucv3f6yqD02Szla1+OFsH7+e+Qo438rhBlEsltKDYqHiGEbi9+u7nZ5SnljEe9PTptIQH1oyMGW1sfeAWAiGtSPsXuPrJ/6fPyn/9NAqh+KPbI+m1UjJ7bAF5nLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589497; c=relaxed/simple;
	bh=kE+lkbDW2fkjWOPf0p+Xh9to5hHkH73htFiGsWeZSEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIWf0eZSlen3h1DTJ563FdgjErdSNHZXK2MpqQTf6I8lZCGtzAMTXcN1mixGpEw+22o3XJTBRiJR+nhI5yRaJ/b6OJhiGaYc46WY1nlszKVumOomRktzuIB5WVQ1hU5PkWUlzPXX55ORnVvFDxbT4us7R2ryBOWhr6KIu90gooA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiheBHYp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiheBHYp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPnkU000381
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g1rTZa3ADy4dw2FlA/nSkUedBUIBJbaSuUbI/8Z9Xk=; b=MiheBHYpuxVWeC1y
	i9RMldHzII+b9U5HWguHfcYiwWJDg9CO6nAkIVTDPsUhlw24nSTlzUT4gUN/fBPF
	iTBvZoVHzUpUmTGFbOHf0FS5vBg3/ga1K0v/5K53Qxl5KFXJwk3ogHNcKocNnyYC
	XNoaN8keTOsteV5wrPtGBL/xjTUpS7tjdQqYXZGx1iP9BKC/OBJd9QC0UE8KpT2W
	r5ZQlAwafYNmycRjTCP5lE74vzDCxkKZ+v6C2sP1/Tfd++G2RAxuGP9w8wasbwlo
	cdWeqGbk1gLFHV5dQsuo4C/w5bw1VlMM8Pf+ZTFYM+MIqpTfNQZ+riQhtQFFkm4M
	dLP5jQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvas3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:04:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so106207485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589494; x=1750194294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g1rTZa3ADy4dw2FlA/nSkUedBUIBJbaSuUbI/8Z9Xk=;
        b=FQdCRtSR6RLhSlX9/Hw1K8jhjYeeKWxDv5zWrX6hM4feMxX3B6JBXuHoaaHRMo00ff
         3lD/XA9oNDymXYC/LTbpBuiMEJPYr2Zrhzy6SL9mew8SjQ1++9kaj6gYOqTSG80loI0+
         q5W7lpLeKeEot74+03o9AVjb7Q04OeGGCgilu7eiP8HSb3OBV7kquaZjl+udNQ82SM6o
         ITzfpf01ehXS1zvfyWX+vyD/Z/mQiPhjNEz4ysNs3np59IYc67ihV2IluDFL1OqHCYwz
         kxdukZPXJhiyqbXs4+jDYAPUaFJ9xMtp1n4aMi80WwHRidYbO8guP8T4YFBnZEoN24IK
         N6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXUPUh33VhX2yqYvsZ8ys2W0yGPqjDfRtcJ/6O+eiNaiqLdnW1wIe+HIc8HFXIOtUP3nUNgz5dBPFRX3HI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw650rzB/Q0UaZlY188Njdhg0cziC2QcKme4MMpOMo5uixf82sE
	bb7JwGrjkW4GNajZufWwvejljtiTc0Pc1zGH2I8QbKAP4/frxCH+ujChV4NGT76kgHXY+uFUFTx
	+owlGUn714lc8XSkkyZFiBk42RGD6jcXctA8RoLAawZJeiD7QdsjXgReBjmhI4YY1Ax0=
X-Gm-Gg: ASbGncv+PaGdhlrwcW5OwkixV/Olhfz/jPNKB8rq3Dh6CZ6DTmqrSUNAdSwMstCrGxr
	aujHnIcSAO8qt/9tW/oB9/h9a6PSaVIQUGlPZfFxfoWZ0E4sUHUdIOBLEZq+1W/dogfJniw6NCk
	tZCxc6b+YuASPlakbikVbRyXvcM+YVqCJ58NIOCOhZhwxwzrQn0qZ8elc5d0B9cPMn75Q8lqIVI
	fqsV9lNz9xlGmsBdZapDIrgUqJoKXv5JLYVO40ReTrk800po95Ai3ZTboAUfTdvQvUyJgjZLb8d
	Kt+Xhcs9JBl4Rlcr7Dp1zP3wbCtXiZqmnTLInFS+hXVYdFFrH9/y8d/tZEs+dnuwx08WjHa28GT
	g+CQ=
X-Received: by 2002:a05:620a:1d0d:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3a882c6b4mr39699085a.11.1749589493848;
        Tue, 10 Jun 2025 14:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZfc7T9tNgx+yBsZQ9oxjOn+p/Z6msmA25Rm7iZVLz1xrwLf9jLrAJFTWkr3OPcdsW2xSWnQ==
X-Received: by 2002:a05:620a:1d0d:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3a882c6b4mr39697685a.11.1749589493347;
        Tue, 10 Jun 2025 14:04:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783c0528sm6771458a12.43.2025.06.10.14.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:04:52 -0700 (PDT)
Message-ID: <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 23:04:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JxTWYUSIXaAF1onVvNlXcwKB7BQkVZia
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68489df7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BAsi0iANeLLsmxwWO0gA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JxTWYUSIXaAF1onVvNlXcwKB7BQkVZia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3MiBTYWx0ZWRfX/0QPnl/j8d1f
 D7kzPDGohT9/pil/Mr5m6U2swnpLdXLVJbU5X7nfCl3J4YbqwHaCpmn9IKrzR5Y1mMxCDAxDhgs
 zP9iC9iBj77MxJstAh6853AQ+aH/XE4YArEJmJpCyLqHbh1fRjtuKdLJceUS52tZqJ1kJJFrzjp
 oQY4dirTiOzM6Jc9IgvmteGbttt59JTF8QelU8KCPb/ThT3PaO25WR8QSPYEc4Y5sohXK9M6TqA
 CL48z1GIudwKSzNbMEa+6JtnSi/4gbR4hJZZ0TqASLo2k4EZ8S6CRh67H2pFJKQBbCpkoZBNv0X
 Luz4zcE0jX2YXRlP6M0k+E21rHjn6aQ7IlNcYVwHDwXPckOorCdAUqCksEEdYqbhxR04y/Ts3Vi
 qwiG9jrOQlElH6fbTfAatQ4gdVVMfVR/yMSqrcua8xI05UR58Mjhxcex3vfiweq56TOODGSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=964 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100172

On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>
>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>
>>>
>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>
>>> The expressed concern is about the novel label name.
>>
>> I mean to say the feedback from Krzysztof was that we should use isp@
>> not camss@ and I agree.
>>
> 
> Let me repeat it thrice, it's okay...
> 
> I don't object against the properly selected device tree node name "isp",
> here I object against a never used and very questionable label name "isp".
> 
> Please feel free to ask more questions, if you still find it confusing.
> 
> Again, I may missed a discussion about the need to get and use a novel
> label name, then please share a link to it, it'll be very much appreciated.

To hopefully help out:

label: node-name@unit-address {
	property = value;
};

Konrad
