Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78D2EA49B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038474; cv=none; b=FD0fRhYmheXhM5z+d8G39WZx42z78Q713a3aRStMgkmnpVIZovp00Ll/eby4cryh6YRu9a6mT/8KmYxGIleXgrLyjAk0FjEbupUm2SBv+PaRI0iK5/Cd/0iNrafdxZ6x+KPS+JNoZvOlUU1V2gItEy9m0iuVA76MC1f6B71PIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038474; c=relaxed/simple;
	bh=Ew8lpjg2KGw8RUtsdIdGkXQu5umyWwe0BTLTaVIb67w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PubGX2aDgrRmuhYGKP0QwpsxOOT4npnJZ6PVtVxyV8qilBrGLaWA3APd/CFAhwfgJvmN151/ECY8mwH/MTmi+7l9u7r4SOPpZnqMZ5UL/9vXDCC+D1ms+n78TIwvKmhqJdygu85who9ikOXEhjKq3DUI5SkRtpPXd0WRyAHLTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIh7/9dP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIh7/9dP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBoKj8028952
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhpcGE0kY2U2qHSOUrNH4gIXVYCbpgzCRlKlqKyiksA=; b=ZIh7/9dPTaRIKAbz
	qtcRTfYJUmfDMD/1CB8sEgyGGumkjtTwe+1FCskmH91irz9aLvC7+w8nrjV0yIl5
	QB0xqTRmG3P3Ft7yR9hK7RMWZYwi2POUq3sly/dUJ48WJWKJ9oC/oYfZUNb7O7vm
	LRWccN5ciTm5RhWLpEa4ACEx19S+i4nLKISatypp1vBgmGk4bGCx72jy9YNPJfE0
	o0qY4acjP6oYf70tubxgG7+gVbaXm9gWVcLv0iapLnGrDbi7elYbdiW8YQARPy4E
	GwNMvpxwKqqfzTXYEUxP9yi+/mXni1WFKeH7ELAXBg4/7DE74URNzH7E2BxvGiH2
	99Dl+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbj0f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:34:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d41d65f21eso3478085a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038470; x=1751643270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhpcGE0kY2U2qHSOUrNH4gIXVYCbpgzCRlKlqKyiksA=;
        b=WIpIni2tEvDzWp7wE8ZsX80tFv/Ut+GDfOekTR1hG6fhEawO43zdxPN6Reor9nWaFS
         ARakdqkrg6ULIITSpGvYGpTi/w7au1Iv/WtsWBfLjqS2jjNwMsIEjYlX34Y0l2yIT+1d
         1AewlYjfJAiq7M/I3LfHfWkkogYXC8D7gjKG3XnFWgonSZPt6DBxsfbBWsgPyNcWJVBm
         wNf1jKgSKChCF4aMtwsbi6e9nDJoXeyW31shzxyhSs+j/ZMsP+JFIJXWBVuOe9lG0jK5
         LBXq+krEOv4Un+HfMXDtuouBmpNwD2NJv4+O1CYzNtaUBEXaaW0zgJhy0kEJS+jR9JNo
         ad+g==
X-Forwarded-Encrypted: i=1; AJvYcCWOGwo+Mzj8i0iynkkvzqKWnyft+C03/SA32+FCLpSGITtgYOVyUHViTqhQEi0e3V3MAciWB6hQmwyrU/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSnTfyzlwpSJvtQDE3tnvWGZjsP6J3qLtzGg8Xsm8MM0Pz+nB
	LrWbwJkRASmithx9J3OJpoMmBKGLsSKricncP7yGbLhdzpLumJCq+7oPcg6JW08G2MlqKnQ/qfU
	1+pSZBPNC5eALQ1+vsYNXadzuuOHXV+XqjdN/zG4TkSrtvuILLF1Oyt3atfZbNmmuLMo=
X-Gm-Gg: ASbGncsAOplrL0oxX4E/xgUYLGN7EX+PDHyEYrwnbX4MZaYHZlvQCFjHBHMMQhRIJCk
	WyUS/zMvKCBH5LPjr1JZkXW9zMuEBfhcxpc2MhuGUqdgfomy/qflFJwtELpyjMGtCwlVefWYaSk
	aR1Krv1XqbCkVxrgB2idVKKAyYw5633ZrIf6CJW5VPL0UUrJwFVBuqGRKoEfPcRI4M/SfsfKkYR
	GaI9wJajXQD3IxvyZs/P8900xVf9NGWqCy9jHQBg9J9wLQRK025+0xx67J41TnJ/KyJ0aQ/fYQf
	6O9r+7nm6V/6QUPtiI4vYTN6M3nvXBhMmx3u+d1r7Y3GQraGEp0/9sO1k5khUxiJS14x3llUrvS
	cRl0=
X-Received: by 2002:a05:620a:4390:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d443966417mr201232085a.13.1751038470173;
        Fri, 27 Jun 2025 08:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzOTtjkZGz3phOnalpunb7y20OgdgwVxcjlA9JNDAl2YYT7eAuxSBmhUwNsqtuPUIJtvAnnQ==
X-Received: by 2002:a05:620a:4390:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d443966417mr201228685a.13.1751038469653;
        Fri, 27 Jun 2025 08:34:29 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b244sm142288066b.30.2025.06.27.08.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:34:28 -0700 (PDT)
Message-ID: <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
 <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
 <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
 <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
 <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNiBTYWx0ZWRfX00bPUSATUTMr
 Z7fz/lhVe9fIW0uRoyL8zWKEW95gi3kmfbG0GviFG7hC/zdLAHkhyf1mzZdzBwLjBcuzx8HrN8a
 tmC6VJ7SvBDlkRRw36EL0TonEdTQjl8KXo0DkAd059MgsuOLTmHp6UDh7l47037wuMtYXyb+wQT
 PBmz5eQSIIrL5vmQXaE/+BeXmMyiFV9Z65fET8rpT43/1R5z+uytBSx+O7D0A6bwS9QVeWNMp6z
 aHfgiUUVZi9b/TM7gEQif3wsTHulzLV2+ukMg2sywI95+QtOdzqZdIzTrDyXtWWNtiq/rtII1H5
 QIuDH5JXWOjCmc+UfCQ6bDQ/ab55ZCfORT586v0pMHjwG4aQ8nDMt5qwFs9MsfMIuky6mgI0+GW
 w/Vllvmgi6iD2krTKSOghpFyPOv792QEg03IyHTd4stdG0uPPOjU/xGfp3yRCy8WBka8Fdpk
X-Proofpoint-GUID: PMiXuZYjXNMGUsVU7Hec970IhofcrU1h
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685eba07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=huVnaSGCcg0LVUp1CDwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PMiXuZYjXNMGUsVU7Hec970IhofcrU1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270126

On 6/27/25 4:44 PM, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 4:34 PM CEST, Konrad Dybcio wrote:
>> On 6/27/25 1:33 PM, Luca Weiss wrote:
>>> On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
>>>> On 6/25/25 11:23 AM, Luca Weiss wrote:
>>>>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>>>>> on the SM7635 SoC.
>>>>
>>>> [...]
>>>>
>>>>> +	/* Dummy panel for simple-framebuffer dimension info */
>>>>> +	panel: panel {
>>>>> +		compatible = "boe,bj631jhm-t71-d900";
>>>>> +		width-mm = <65>;
>>>>> +		height-mm = <146>;
>>>>> +	};
>>>>
>>>> I haven't ran through all the prerequisite-xx-id, but have
>>>> you submitted a binding for this?
>>>
>>> Actually not, kind of forgot about this. I believe I can create a
>>> (mostly?) complete binding for the panel, but this simple description
>>> for only width-mm & height-mm will differ from the final one, which will
>>> have the DSI port, pinctrl, reset-gpios and various supplies.
>>>
>>> I think I'll just drop it from v2 and keep it locally only, to get the
>>> simpledrm scaling right.
>>
>> Yeah I think that'd be best in general
> 
> Ack

[...]

>>>>> +&pm8550vs_d {
>>>>> +	status = "disabled";
>>>>> +};
>>>>> +
>>>>> +&pm8550vs_e {
>>>>> +	status = "disabled";
>>>>> +};
>>>>> +
>>>>> +&pm8550vs_g {
>>>>> +	status = "disabled";
>>>>> +};
>>>>
>>>> Hm... perhaps we should disable these by deafult
>>>
>>> Do you want me to do this in this patchset, or we clean this up later at
>>> some point? I'd prefer not adding even more dependencies to my patch
>>> collection right now.
>>
>> I can totally hear that..
>>
>> Let's include it in this patchset, right before SoC addition
>> I don't think there's any pm8550vs users trying to get merged in
>> parallel so it should be OK
> 
> Okay, can do. Disable all of them (_c, _d, _e, _g), and re-enable them
> in current users? I assume there might also be boards that only have
> e.g. _d and no _c.

I suppose it's only fair to do so, in line with

d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately")


>>>>> +&usb_1 {
>>>>> +	dr_mode = "otg";
>>>>> +
>>>>> +	/* USB 2.0 only */
>>>>
>>>> Because there's no usb3phy description yet, or due to hw design?
>>>
>>> HW design. Funnily enough with clk_ignore_unused this property is not
>>> needed, and USB(2.0) works fine then. Just when (I assume) the USB3
>>> clock is turned off which the bootloader has enabled, USB stops working.
>>
>> The USB controller has two possible clock sources: the PIPE_CLK that
>> the QMPPHY outputs, or the UTMI clock (qcom,select-utmi-as-pipe-clk).
> 
> So okay like this for you, for a USB2.0-only HW?

Yeah, maybe change the comment to something like:

/* USB 2.0 only (RX/TX lanes physically not routed) */

to avoid getting this question asked again

>> Because you said there's no USB3, I'm assuming DP-over-Type-C won't
>> be a thing either? :(
> 
> Yep. I'd have preferred USB3+DP as well since it's actually quite cool
> to have with proper Linux. On Android, at least on older versions it's
> barely usable imo. Can't even properly watch videos on the big screen
> with that SW stack.

Bummer! Not something we can change though :(

Konrad
