Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2726B774
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360693; cv=none; b=fUsa4TsXxYwOrPrcmwkE3iBnxOUwAKHWZfNVyT2lERx1V/hkyADqvLrd8dzpqWIcOXstBzyTiwCwf+wLeyZ/SeR+qNHsFUdWXN+HdY+z9klHX4IoA8gfIZpm41WeJYtksbfvQ+NUTEPQXyukc6/Bigzd6Mjm16M2SAjSPQXtYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360693; c=relaxed/simple;
	bh=lpfLiQQ4hlhOCJz1bORSb7XRjrfYlRfnFzYM0+NnJdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJo3mLztcoRp06kUWTsXk4eQpSM9xkP66S1eSuMYxT08Smolesr9DW3HojYrj/+PYXkRwuAAtAitUzRDbydgH7U+C78gLbCdfPfVhlCkVvvRBFOYHHoLlfbavmiwAXzJrOGtuv3AaNtdeSd//4ylEhuhjlquoQaY2s6kkP1J3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXXH56RJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXXH56RJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613F9Z2002189
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 09:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkIMxJPkQ5VcBbbAsfDLRu3BLuhWWjrI6VV4sNA6DUg=; b=hXXH56RJrGvCQvLR
	x+I081SlS8bTOI2kT5kKfyQmjvCm+i3FhSZpQ5OD8/AJmMrNbbLoohCTBcN3EMV8
	BJK/Smbl26D7apB6iNS86tYiieiA2DpUw+Yg1VGvg4RPmv4qU4JQ5hyZbjGgWMap
	f2dFUws2ucnMik4ukIV0URYZJEXOZNlBBxyjhCcGWW4lLi0qB3oqmtoxCxU7hHAT
	ZqtvvP2pdCc3cEkwVilCCa25En3NGLbfuwszQSxdlReztA0Uu64rYdK26RpkrLmA
	Doapmyhe7EsNlH7iu5pTa2UepOp2TqOKaHv2TRyCbje/QCExP9QMF6vuB4GJ9TpD
	1V3RBg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcqy1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:04:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5f7413beso19942026d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360690; x=1751965490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkIMxJPkQ5VcBbbAsfDLRu3BLuhWWjrI6VV4sNA6DUg=;
        b=jqRKYeteDfsha6/Ejn0UuTirH5WLgRW/Pxjy2ZVsX1mHv5MCDTc0AVJ3YVA626Z7ve
         7fC7poaDloSd2VJufgtVjtMCpFv/Bi5N0x9EISF2sKcURUEN0E+FTjQWfj/Je6GqHjQl
         4FqpUyYCzycfENcoYSPSpvph7hglr0ciFvZd6gbb4oXN9MhE8bzRRLwT2WuaRZU06QRE
         KomDQM4Fw4uKG6T5DCvrQlXDhadnjUTsAvqLvQde2XbYFBceUDfwftK7xw+rHmKAeVib
         zyVdWGWpBPlAsLdMa/ZGVDH4fC69dH2qAXPHMCE31YKuJq78ajJt8mB4QGzXba6cAa3u
         dqsA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZxa42YAq60y8wmP4i/tm8wMLJ7vfkXHJJ+HE0mflqZ1c+yroJax+0AiUOhe6KOvUOkQhOv1yg45EOxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQuYbelpS+zDlR8x8NMq+ox0B/7QQ9deW02bE2zxSp6+KCPdCD
	CjOBDvIJHFTK/vIvp0R4t2StVBIjcDEVhVRDCTgGIYA1G/jcsy6vgVoC39ZrHhWqXoPYhECJR7K
	RikaJBzgY4JypgSewTVjZOEPSPoKlP3jmjnZ81hR5o+oNiL1QlqCcJFgn+U4Ct6+ssGE=
X-Gm-Gg: ASbGncsNr+1qqz3OPQvqan9NkhShPrnGeZw9oYWJIR2TlN7zFdERdYZdJlr0gh8hP52
	qB82SlZdlF1ycncNZTZN51850LeCjxOcQKWxp6yJFTFcexS5NO174MRmFSJHOd0PwGTZJqHexSU
	GuGqxFTJDTorJSvlZkEcAjtgMjjZV6lrLI0P+fTWyqgO1PJgNLTDUk3Ws1++foTuPZG/Hlb8wUr
	LmCp/WR4FWKa225RKrPJi2BSIKGFO2LlAi0HPSHuFLlwFdc47dEXEy+eanW0tVbSpXCbrGmE4XM
	Q42kY6PXpEN36rlfc9SfiAr27D+Uj2Ox0WXUC+UOb4d4gRMpzjiddyRPFzcPEXNjdHpWWHPyHQI
	X7S1z/w5f
X-Received: by 2002:a05:620a:40c1:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d468757dc4mr99323285a.0.1751360689578;
        Tue, 01 Jul 2025 02:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeUDreOqmNQeuBoKNAZdsqkeA395+Jw1kTvuMcKxjfGMcdPAxGzBGNCpTkmEn2wBcAWkMuOg==
X-Received: by 2002:a05:620a:40c1:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d468757dc4mr99319985a.0.1751360689129;
        Tue, 01 Jul 2025 02:04:49 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01980sm810958466b.81.2025.07.01.02.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:04:48 -0700 (PDT)
Message-ID: <a6117473-fa38-48db-94a1-892b76abc10f@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-3-quic_sartgarg@quicinc.com>
 <6040afd9-a2a8-49f0-85e9-95257b938156@kernel.org>
 <9627ed6f-2bb8-40b0-b647-5f659d87f2f9@oss.qualcomm.com>
 <bba062a3-f96c-456b-8e9e-fdeb0dc2d28d@kernel.org>
 <5bdae07b-a7b1-49be-b843-1704981bc63b@oss.qualcomm.com>
 <ffc62906-c3bb-4968-8f7c-fa7ae5028ad5@kernel.org>
 <fd73a142-3b22-407f-8e6d-00f4e1e1c8eb@oss.qualcomm.com>
 <e0e66895-e68a-4420-a61b-98a689798ce4@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0e66895-e68a-4420-a61b-98a689798ce4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fKuFE4GdxaAXExD1Sul96G45_oBONDMN
X-Proofpoint-ORIG-GUID: fKuFE4GdxaAXExD1Sul96G45_oBONDMN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MiBTYWx0ZWRfXyQ67cdL4Pd5V
 tByXQXglLtNh4w21IOIxoV6cper6Hi0sWP1jtoDn38Eiz3eCYIcUzQIIYkEsfnW/kdvO+y2o0+R
 zR6MMg7h/T92FSDwfwK9nDAZa0gupwqBfsZzIy3RVt+aEdt2wG5f0Br9RMSSlbsb3qZN1nOpbcC
 bPtfhQUtqTUh4fjxEKRATMGpWBrh4CmzIgkmtlpGT+OvS9qQkoRAhyeyqKFwcBHTZrTgIpQz8rA
 KCNGHxpcc+7MbQWEc8sX1Hy35Si2pTe2suRLetYJEwlrQQUkGyXduOqn/6YCiajX4X6QoXWXXbs
 te2/sHWM6kb43hFdSW7l0u01361/XgQz5avIPMhFylQK4x7naTIFgeRBijPLJ3LIyB2KwLQawEV
 svLOj41gpLGvg9vkaiLwlkMmrxnLaViFWq17Tl95xE2zFYwCwXnRxZ32DCU2b1MRB/aRCC+H
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863a4b3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Nx1jMUExMGuVGuT9j-gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010052



On 24-Jun-25 08:06, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:31, Konrad Dybcio wrote:
>> On 6/23/25 2:16 PM, Krzysztof Kozlowski wrote:
>>> On 23/06/2025 14:08, Konrad Dybcio wrote:
>>>>>>>
>>>>>>> This might be fine, but your DTS suggests clearly this is SoC compatible
>>>>>>> deducible, which I already said at v1.
>>>>>>
>>>>>> I don't understand why you're rejecting a common solution to a problem
>>>>>> that surely exists outside this one specific chip from one specific
>>>>>> vendor, which may be caused by a multitude of design choices, including
>>>>>> erratic board (not SoC) electrical design
>>>>>
>>>>> No one brought any arguments so far that common solution is needed. The
>>>>> only argument provided - sm8550 - is showing this is soc design.
>>>>>
>>>>> I don't reject common solution. I provided review at v1 to which no one
>>>>> responded, no one argued, no one provided other arguments.
>>>>
>>>> Okay, so the specific problem that causes this observable limitation
>>>> exists on SM8550 and at least one more platform which is not upstream
>>>> today. It can be caused by various electrical issues, in our specific
>>>> case by something internal to the SoC (but external factors may apply
>>>> too)
>>>>
>>>> Looking at the docs, a number of platforms have various limitations
>>>> with regards to frequency at specific speed-modes, some of which seem
>>>> to be handled implicitly by rounding in the clock framework's
>>>> round/set_rate().
>>>>
>>>> I can very easily imagine there are either boards or platforms in the
>>>> wild, where the speed must be limited for various reasons, maybe some
>>>> of them currently don't advertise it (like sm8550 on next/master) to
>>>> hide that
>>>
>>> But there are no such now. The only argument (fact) provided in this
>>> patchset is: this is issue specific to SM8550 SoC, not the board. See
>>> last patch. Therefore this is compatible-deducible and this makes
>>> property without any upstream user.
>>
>> When one appears, we will have to carry code to repeat what the property
>> does, based on a specific compatible.. And all OS implementations will
>> have to do the same, instead of parsing the explicit information
> 
> Adding new property in such case will be trivial and simple, unlike
> having to maintain unused ABI.
> 
> And it will be unused, because last patch DTS should be rejected on that
> basis: adding redundant properties which are already defined by the
> compatible.

Got some more fresh information.. This apparently *does* vary across
boards, as there is a recommended hardware workaround to this rate
limitation (requiring an external clock source, which is up to the
OEM to implement or not)

Konrad
