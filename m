Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E85238150
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677464; cv=none; b=jCKy5QXHMQJLRAQUSSCEwiOFaOgJFqFYzj7R6g7LdW1dAKrfHfAS330KpcYum/GRnz9zvkHvE+hQjbYMBuoHxCQzo/CZNyubqvpP9AjuE9lactx6VzYUY+kl/Ns+VrLP4yQmPBOJ5sFdJ7fazpR/b4g01xA2LXltT7bx74V8akU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677464; c=relaxed/simple;
	bh=QVfJZhPN9qiwrwnHlrRHaImgyg7M9hl5ecRtPiUK4T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tw2uksb4G7AVTqku/rPIvjXeO7nF2C2eGSuc6/nFDbH5piNA89VtmgJ6Ij7YkKvfMFMpzPdUqjkxfmrm65BNu1LOK5kOI5Xxah7+y4h9NBo++ahnkuUh6FSwGARJyTvzRTYyCrMUKkcQ1ty+GipiHHbLM3E4rm+kU6xtSTnOz7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ja7iu+m+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ja7iu+m+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9JFRk011924
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dyny+59KUMgDnoa0Pj8FANJXdd+fC6rz2NSrYwuJ3w=; b=Ja7iu+m+DcZwXxxQ
	JOObRZ4sdQv4ObAH8WSd3BDSk0TDtBIUfkUVvXKaDbQj3z0Q5JkYClaONXjzA1Cw
	uYQr8HvL1ntj4mUma4x0y2f9eQIc9lh2uDwY3raCT4fZ3T0TeGqzy+Fe04xLrJ53
	DdGTi/dStzeQJzMhHR3+Ef9iz1l5jwaOWVizjTRm8pwiISKb44mbcbLzc1cdJgFj
	l7XcHlqcXt142Zm2w9DfKgQ4CQA4lLFhD9HMb+NR5c+x8YWCPKPEV0u/LC+Pl7a/
	d7CPvFjfe/Vpeb18fxiF+J9LEl2xdUVD7PSuXF7URh4fQEJKJiuGTkhWa+ek5oid
	lWfhsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec262mt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:17:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21080c26fso107592985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677460; x=1751282260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dyny+59KUMgDnoa0Pj8FANJXdd+fC6rz2NSrYwuJ3w=;
        b=t2pKBzY07L9W/T6GfCBOMOL4lf6SmHXzyT9FHZI0gQVgctiw9EYDF7gi0cPsbKTZQF
         4h7ISiRsqYP17BULjneIoa8KBd4+oWzulzYSqnRd7uYFupjIBqOOsY/H1O53iIYYDgeA
         /TWe+9+/fLEWThTB3RrsfFYYij6aYpY/VjnabxL0hei8teQv/zCpREheEoNSqQ704F1a
         R0kYCPxXNJEsLohS4jAyJkz6bw8ylPpFJfu0NQViDxOTkMd3SWGPP8YyOdSo0UJjM5iC
         jfqP7pOVjQ63uAr0kFjosB/U0xPS9mYH5aPvBtuZ8fLunKbTYO8y9pnoeuvu7tU6UkGq
         FDYw==
X-Forwarded-Encrypted: i=1; AJvYcCX1eRW2lXpGrqp9UE2o2hPke4LKBHa1aiLCWOvDmoaK8oOIec+ORzJYAzCCZxKbQ9uC3M70y6+ZXoFdOe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxhRGj4Yq9zmwY4WhePXi0FHwrI0vayHlb8l9ZGH8+GTDvRdyO
	dYmDJgbYi2PCuPymvTD+hDFvZw6X5a+kUFhcSQzW8Knbuxtr9f0v0OmfJ25Ymuw1Ed9jeWmaMbt
	RMrZh/9KNdeoI+tiO4ISusSn55W1DlA+jRbzJ/G4YiFsOzUfIKWNvXdYniwgTtPTDgnA=
X-Gm-Gg: ASbGncuq3asDUUZzhOr+PqfZKzjbeiUqMeflylD0p/meAEcq1zY6R9HH8MmdJ3QidwY
	PWkMH11Wg8ggI68BdZZ/GIAINHe0dmLEJps0a/ugWI/RSCE9Lpch0H8RH6l2JU/7PaGm0aE7a8m
	7J2GLr+K7luHppZ/ft3cbyiVXJswH+nMTINIGBjE5kS4YRA7zYZmGLSQYekHjWWSA7Ck8B0ff/4
	EnBGJT2owAII2mIp9xyOeiqWEycCEQozokh9AII29p4p3Lli9uHco2PpKG8BpGmFtmdd/6ZRPSK
	MhAmH8LeYC5cia1PJEw2ob6e+Lp6q8LLNqHzkd1U0YsnEo6mHV4b9l6aKDZDrxWMW13UkhKFmJp
	vZNI=
X-Received: by 2002:a05:620a:8016:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d3f9938ca8mr701361885a.14.1750677459626;
        Mon, 23 Jun 2025 04:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKL+gpI55fdb30AiEedCk5JVTk1bfoCgITZ7zqFEzV6b0TJ8Zlfj3wjSMDQqD00Aky80qkgw==
X-Received: by 2002:a05:620a:8016:b0:7d3:ed4d:ac1c with SMTP id af79cd13be357-7d3f9938ca8mr701359585a.14.1750677459080;
        Mon, 23 Jun 2025 04:17:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b7258sm691177466b.119.2025.06.23.04.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:17:38 -0700 (PDT)
Message-ID: <ef07138d-dab5-4a9c-9bd6-20299e2fa53e@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
 <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8997eb52-788b-4264-a302-0fd10008e4e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfX17rU90xOaQZA
 8wgKqxMv73DlYjk0Hml3tRO3Xl7r1PU3L5Es4d8wswR4bijIo4A7TK31R/jgjcsx//OtKSlsk+G
 icm/s6wdFDsm9rKADmwc94j/5I8OyGg3DqThd4oUS3kmgD85sPhmEoFbDk34+5CjWSvsdWAbOUD
 70EpHjoUbIOv6yxlHE0HXj07499aLAZFzQbAZQBK96GOessAspCH27PsOjgjLh/q+KL0Bn2e2IU
 UAEQe0i0pOmpnQIrS1SNv1saA9wutL0Ytm/HyGItTN/sqy+RcRgwWPWCPM8XroDhlhOjTjoPxCC
 soFYRHox7OrRXaXwOIowgOmxiCgMgbzJslMLmH8k9gKj12IAv6tyyCs0zfJhPhBKVeankPxtj/H
 CclzmcH8KFAkU3tUPZRT6h1qGUaHh3oGSZIpSPd+MPeNjDD+CTlJUDyHMA41k9/4E6c/GVnx
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685937d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HP-r-xv5IR-xfd4SPmYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UptnnbGY5uX8xoEYybpoER5HPZWoatTv
X-Proofpoint-ORIG-GUID: UptnnbGY5uX8xoEYybpoER5HPZWoatTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230067

On 6/23/25 1:16 PM, Konrad Dybcio wrote:
> On 6/23/25 12:51 PM, Jorge Ramirez-Ortiz wrote:
>> Add DT entries for the qcm2290 venus encoder/decoder.
>>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>> Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---

[...]

>> +			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
>> +				 <&gcc GCC_VIDEO_AHB_CLK>,
> 
> On other platforms, this clock is consumed by videocc

..except I didn't notice there's no videocc on this one

Konrad
