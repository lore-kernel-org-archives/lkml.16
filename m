Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEAC2E4256
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546320; cv=none; b=MWvfPii9e8+s9jppUGxrw3eTfR54Y1PzWvAM0hK11eD4KOFyfR5P7QtvcnB19ScpLbv1ET+4kJRcoAxkFqkaNN3sikKz0wF/leJqOFV9V8EI6aZjIqyoX5nO1BMxLJzYEMA7dKdu/0q8dKRdgTUfiVJjGhcUcDd7QMSUEX6Wp5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546320; c=relaxed/simple;
	bh=blvhHAuvKd0z+M6UM8fJg7hW66Y0sZvUde7gR9VDZFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7eBuQAICp73nj+AMfDmOTvl4NbPkFtlVDAP9mb6969oXaHRQs+MeGcDuekYso0Bi8V4kS6saWtRIVNXMUVLztb1+0r1/9682sTRJqQ5YT9Mf7UXidZMLWgLy8R6WuwcMT4olnFLQb9XvxkzozxElCxutnORXpLT45LraGVyinU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c07+vPHx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c07+vPHx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639tmsJ005534
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 12:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qh8aZ053Ew1qTcqO548gAuyDU01MqTeC46OFogIdvLU=; b=c07+vPHx3IKsaKNJ
	+53zzbImtZLBaVhX0gRwKtESHcuUKKzex75Hisgg7BKtV2h2MORMWrimj02M1qKA
	6Il+GHeP/ycLt1WdHxuqsodzLwnK/+XSd4NLEfy/sp3D1V2RhAgyT9UMJ722Vws8
	GHbDeqon/n0jBwk3zeazACWa1hXYNSCx9JM0NC0cGfYXCA4sPYIno4tWj4p4SdpX
	gUkEVZ5glqNFNNM7u6AY2sf1gFt2cdn/nHWZs1C9vWneLMctqLki16etuQLb3fVX
	Lw7GZiAtwnFhIsDnXZaq1ooNaQp0Ws7LpVbdfUQlPS8DkU8vZuVO3PD0f8IaayQj
	uptZsw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmgbdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:38:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6facbe71504so26409456d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546316; x=1752151116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh8aZ053Ew1qTcqO548gAuyDU01MqTeC46OFogIdvLU=;
        b=VMQ+Ed7MyXx6M9+K6MKAcw09LvWQQQZBLS+3wK8KyfuqDTTcWuXEIY+fjpBAhR6n8e
         OLtA4wW32XjCW5b4YrKXiI++DV+txQfUMY9jJkrSjB6phKD0zOXs2IqDRgfVeiI3dINV
         hc22mGn4MywBYeAQmOAzkbBf3KlXxrLQc2S66HZ9e7ITSv6RI5CrUbVRnFArTVpqPgsF
         Y/CadPvwBWhD6IZa4c2+Tfb1gHyqAG+N3fxdOZFl+dzFRA+PbRu9Oi7KGGGdAQR40sMf
         B9SPnGCdxg32+IkADm1h6StAKphp7zgcIQ8LDkXN7KskInqhXHOLAF6tQYzonk3JP0GR
         ytxg==
X-Forwarded-Encrypted: i=1; AJvYcCVsSZh8nbhRlZMeHRsrzqS4g0xOf5Ih2LKd1uIsDMcMrrOMcYuTLy7RfSJNPlt5gMUTrtDY30V7GsZYc7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRveqK6SYMixUxZ4uhD4rXLJRqjYos0BH8Tk9BkA+RiQ5YZziT
	cZMsAouxD4bxRH8nn9YTG2LeiaOo6JNr+1XXYOxPLW8mkdqhew6pYX2M9VLflvpc3VdTaYz11zt
	i9v9tGTzT8bDTs1xq7GrpbG7zxo9YkMIHiCD3kz0Mgjv8BVbW/E74YJBfE9EPK9TpqjI=
X-Gm-Gg: ASbGnctlWfoxk+rKyCnRIXvfCYYprjn5VPL7lp4HJZ10Q8am2GKshiauIuVuUFHufgL
	xT//KxevIIpwss4W6FD1Tp9Zrh+VI/5i8zeHqoL0UUpZPAXxParrzOAdLlhwIT+NDTzSI8olgkH
	5G8oFDY1Aehj22rLZSt4VbvkIxZzE5JSuIV8THX9R3axSxCMc1JtmsDDE6qMmRU2ii+dEKAKwwr
	XN4pNfXnWY74ly+OOCTxeQq+fJrWLr5FaJF4/mIV3DckQ1CYGcbFcDCZTi+nu9V4K3kXWDcrmnS
	M+FzjFtxEOIJ+A90RsR151wc+oChNcOHHaicSjnoJhxDBEswkf6/L19wmw96GzssyyX8VrRx5kb
	7w/cw8C51
X-Received: by 2002:a05:620a:28c3:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d5d3eb6529mr119135485a.3.1751546316490;
        Thu, 03 Jul 2025 05:38:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwk4eFNYt3i3rxN0XJmcdLSCwy/gouEpTFY2xPCM13VPaFLKLCRNVsyEKzUlz6/p28jLHr6A==
X-Received: by 2002:a05:620a:28c3:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d5d3eb6529mr119134985a.3.1751546316055;
        Thu, 03 Jul 2025 05:38:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca20fesm1272538066b.174.2025.07.03.05.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:38:35 -0700 (PDT)
Message-ID: <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686679cd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=V26NVJm5TTlvxhDq-ocA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: b7Ob9geRURD1rPUcLAMrSTSDZLqFd0v2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwNSBTYWx0ZWRfX2Ir3+s6zUbrN
 6QMO/4IkNj1Kj4jrrUcCTleFJO2mDp01/83V6iRy4La1V7saxwx87tcwZblRg8G4cPDZrVkoQpY
 uhswd0PfTtwk78DB2au3jEf5xQWCndu7sC4PkFa68JV90zchWIXYozuB1i7XWhFJ1dl2vu2ilJa
 x77Omvt5yPrblC10NTHT5Zq/sgPkIHdD6Ekg/9Qpxj08HdSiwHfUvguff3YFVjQk+ifMkEb84mZ
 +NjmK0ahZZxogCbOJTtWU12pzS1SBeTdHChd4yJdwNOgK9aK4ZeCo7i0+fBjol+uX1JXXhfT+tP
 UNdIJInZx0PvdG4pM7VLIlLDerkmvnsT1CFLxBqNJORJCPfo+/CmGl9Tw8WKSI/VgFFfZOB58nR
 F+otwVoJzCG4bpDK/0Rx3vfZfj97p64c90n0rJp0vdNzYUf4gYv7gl+ikVSTVpM4e3bUgfmE
X-Proofpoint-GUID: b7Ob9geRURD1rPUcLAMrSTSDZLqFd0v2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=935
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030105



On 03-Jul-25 09:27, Krzysztof Kozlowski wrote:
> On 03/07/2025 00:26, Dmitry Baryshkov wrote:
>> On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
>>> On 02/07/2025 13:01, Vikash Garodia wrote:
>>>>> Anyway, in other messages I explained what is missing. You are changing
>>>>> existing hardware and you clearly must explain how existing hardware is
>>>>> affected, how can we reproduce it, how users are affected.
>>>> Exactly all of these i have explained in the commit message. The limitation with
>>>> existing hardware binding usage and how my new approach mitigates that limition.
>>>>
>>>> Coming to usecase, i made a generic comment saying usecases which needs higher
>>>> IOVA, i can add the explicit detail about usecase like 8k or higher
>>>> concurrencies like 32 or higher concurrent sessions.
>>>
>>> Why not make this change for a new SoC, instead of an existing ?
>>
>> Because we definitely want to improve support for older SoCs too.
> 
> Older SoCs came with completely new drivers and bindings, instead of
> evolving existing Venus, so they for sure came with correct code and
> correct binding.

No, this is a terrible assumption to make, and we've been
through this time and time again - a huge portion of the code
submitted in the early days of linux-arm-msm did the bare minimum
to present a feature, without giving much thought to the sanity of
hw description, be it on a block or platform level.

That's why we're still adding clocks to mdss, regulators to camera
etc. etc. to this day. And it's only going to get worse when there
will be a need or will to add S2disk support with register
save/restore..

Konrad

> 
> That was one of the reasons why duplicating venus was accepted: to get
> things right, so obviously your argument cannot be true, right?
> 
> Best regards,
> Krzysztof
> 
