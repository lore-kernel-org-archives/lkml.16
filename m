Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F72AD14
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463389; cv=none; b=oEvNhWk0nPZPiCvexlZStHJ7A2zRlMEzB4g3UcXmAnnFr6URz/cECzN+Ioju2AnmxyEa56r5w2bwk6NrLpHWy/o73FKs4H5GxKRF3MVaVLflC3wyXSyVbTN4/B5F0FLoNrAeXaU6rY9tTkdne49hOqTA7EGZvEabtBdP3yfwqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463389; c=relaxed/simple;
	bh=4m9MirB1WKJwy1ogvo/XpNABXqeFGF+vxFRGeYxvcf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjGAV/MchMS+g5rt7Y9HskTL55HednYtii/HTQ4/zeFfA9xLxGzjvJuLLkznBn24vt0/jzKdFlYLYhOT/4cPA3G00XsAeu0Ai3cm7csMeiGk3+edh0X3cgIQHtPgk5oLGkcAPMNRcMlGR7pRmGFX71TrlxVPwaLkunoKWYyThoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am9FiKPa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="am9FiKPa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55934vgI020014
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 10:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUOMLPIIJhzhRpown5yTsE7gvs4GZtO1HXjc6bWnF74=; b=am9FiKPaMOuHPg85
	wMUi6kqZezXRjeKsYbHyUfVfwR9wwJYHlP6JTzXKGxc3HVaASoihyk2ciR26oaFg
	Moqe+Lht3EC9+u24lLoKPsNoTMNGc0THpzfQeut44878M9IEzcqJ6szIcLiD1I6b
	jCg2tk51iiRAZHRqCKgdy+0vxcHRm4klrES86CcVkorUP6nPdM4Bim70uBmAoZgk
	m2KaqafT4n/2IWdd198fDpv1r1aS1Bf/HQzkvlunbhguKCzBcMrKFRSDlWsdONKR
	YfxRH2kXBAl1DYIK6pQcpkRi5ZhUQv6uQyMSUQGnhv1LSHjEIBXVlzvcO2XK2JbB
	gU9hqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qcts24u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:03:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee988153so705746085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463385; x=1750068185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUOMLPIIJhzhRpown5yTsE7gvs4GZtO1HXjc6bWnF74=;
        b=LGyQd3eyACHUE217Wp2TcpRrHKAoKC583QV1tQMamwXH8+g7py3M66xc5hLDpm2SLo
         6z4dNn96ZwhWr0KsLQIcyuRQB1Elx93CEO8LN603JSov12SO9OuHSW9CrS61vMx94GX9
         lmh5lit00rIebmQ32MIq61F5WBP6oinbgga4vKwUYIw0lJJQWGlJUQsYQLHOHL3szC0D
         KPkFR8ytYRkzso23ZVvGs1b7nrifScNcJhQLpnbeHHFdRBdcBxx5tDTtZlHvknq8RWtt
         7t0pO9BdqcK9gdTGD+NFvrZTp6CLHuo0mKUxAR5gPClLtP6i7aW+J6SYvML4bdNg6cxd
         ZAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg68hwXvF3qsYeNX8joeAaJX70evm5zsQc2eH9hlW6KU/P66R/sY7rY9dQmoIVDCkLQV7g21xIbvJM+Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpkjMJN16EhifkI7O+rX6CCbymml0yXKOLCnQPSVx8ccPpS3aa
	oOXxRc8NsmxP8YwthxBXUHhfpRQjJAXkBhiC2nv9xITb5/UGCU/1HWOXq2ViKouusJWX/I6HRXv
	FCiLmvUqGOinOyUXboQA8uG5zhJMu1QUkBHCPXx1wSZN2ihyV9ndWqqb/Vn/r+RSJe4U=
X-Gm-Gg: ASbGncvYAC+pLxse84askR/zLz7W2e28lO0O/TKloSblfMjnFLmKGDtHY18u5GAT9mK
	G+Np4KSp8LKECSNEg69facw59n4R4ily7Ft00O1ntHk8ddTMfkAoB4Yg0GhKHZjUYnqKn5RFzxp
	aCYFs5xs+npGXdDtz8yqCHouNEcaagqX0WRzJtyOc2YK+jvO5csaLSPBMgdh8nMKVFjiDyO06A5
	CADjlxICXeuOmFFXECX+X0BKxbfDthyZtFe0jlW+Xk5PdCCz9KokJyQUH/BFOnwNtiwmkwkmAlI
	y8jI+I9RfVlgaYjkHNLibyXku9GGF79bO6OB1JDS9XAlKpGmoffJt1ihp11G+NDWsbVc6XjG/qP
	heIwrrJyUkN8Qjg4oAl5y2aac
X-Received: by 2002:a05:620a:8521:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d38a1aa689mr701636785a.14.1749463384622;
        Mon, 09 Jun 2025 03:03:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPkrUgLaqtG161AtBPKmUTkw1bGzRfqAuamGIwciZ+5ygYaF/PqxwQ4YTspHzWz2F+rW9D4w==
X-Received: by 2002:a05:620a:8521:b0:7d3:8a1a:9a03 with SMTP id af79cd13be357-7d38a1aa689mr701634385a.14.1749463384212;
        Mon, 09 Jun 2025 03:03:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a817sm1063648e87.171.2025.06.09.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:03:03 -0700 (PDT)
Message-ID: <84f4dedd-fe3a-452f-93f7-b20e0bda9951@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 13:03:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
 <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
 <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aEavSv3VWuMvzyBw@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mOjmbX27iI0mYAoS5YBfoV0LaM4mZ2Pg
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846b159 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=RL8EPRIwvXipj7ok6woA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA3NiBTYWx0ZWRfX6xdJVprA7lsb
 zreC7UMojnVE/5GJl9qQUnSLa6MWVp81FOcbsihffC9K3joCG0yFuAzNqLRM6KV4XmEPJwnXdq0
 UMN7nNpdZJBGrWWBmL5fx+6oLtd1zrq/icsk3tmMMJ2oWFdn+pYhglOw8A3fWX+/Xv7YzHVcB+w
 POUHxukJLYqGUsvbxkUXTYxTcDUV9+bPLGaQUYvrco0mvlJIsQdI27wjq8vUrt20k+YWywMSycg
 WyCLtjDkIhp5GvTDgxgrbAOcHSdUT0doT1KsVjmwuPwxkqNfNZ3x4MnObJA4CWEm1N7BDuxyXfi
 GBt5B2WjMlUZUOFKgvTDch6m7pVgSeuMcGave4JgsXNqj3/NyT/I+yrk5NsKex5SEW+lEQRAo/H
 RTDyjxyvw86RI0utB65KamqpGCobbSiJUaKOEjSoqSw8pwAxlIVyaxglYe57zL331+y+W0dM
X-Proofpoint-ORIG-GUID: mOjmbX27iI0mYAoS5YBfoV0LaM4mZ2Pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090076

On 09/06/2025 12:54, Wasim Nazir wrote:
> On Sat, Jun 07, 2025 at 11:22:39PM +0300, Dmitry Baryshkov wrote:
>> On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
>>> On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
>>>> On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
>>>>>> On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
>>>>>>> On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
>>>>>>>> From: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>>>
>>>>>>>> SA8775P has a memory map which caters to the auto specific requirements.
>>>>>>>
>>>>>>> I thought SA8775P was the IoT platform and SA8255P was the automotive
>>>>>>> one. Has this changed?
>>>>>>
>>>>>> Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
>>>>>> the later one is SCMI based chip.
>>>>>>
>>>>>> Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
>>>>>>
>>>>>>>
>>>>>>>> QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
>>>>>>>> inherit the memory map of SA8775P require a slightly different memory
>>>>>>>> map as compared to SA8775P auto parts.
>>>>>>>> This new memory map is applicable for all the IoT boards which inherit
>>>>>>>> the initial SA8775P memory map. This is not applicable for non-IoT
>>>>>>>
>>>>>>> Is there are platform out there that actually uses the "initial SA8775P
>>>>>>> memory map"?
>>>>>>
>>>>>> Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
>>>>>> map.
>>>>>>
>>>>>>>
>>>>>>>> boards.
>>>>>>>>
>>>>>>>> Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
>>>>>>>> introduced as part of firmware updates for IoT. The size and base address
>>>>>>>> have been updated for video PIL carveout compared to SA8775P since it is
>>>>>>>> being brought up for the first time on IoT boards. The base addresses
>>>>>>>> of the rest of the PIL carveouts have been updated to accommodate the
>>>>>>>> change in size of video since PIL regions are relocatable and their
>>>>>>>> functionality is not impacted due to this change. The size of camera
>>>>>>>> pil has also been increased without breaking any feature.
>>>>>>>>
>>>>>>>> The size of trusted apps carveout has also been reduced since it is
>>>>>>>> sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
>>>>>>>> carveout and its corresponding scm reference has been removed as these
>>>>>>>> are not required for IoT parts.
>>>>>>>>
>>>>>>>> Incorporate these changes in the updated memory map.
>>>>>>>>
>>>>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>>> Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
>>>>>>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>>>>>>> ---
>>>>>>>>   .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
>>>>>>>>   1 file changed, 113 insertions(+)
>>>>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..ff2600eb5e3d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
>>>>>>>
>>>>>>> The naming convention is <soc>-<something>.dtsi and I don't see any
>>>>>>> other uses of the "iq9" naming.
>>>>>>
>>>>>> As this new memory map is common for IQ9 series of SoC (QCS9100 &
>>>>>> QCS9075), so we have used its common name.
>>>>>
>>>>> IQ9 name is not known or visible outside of this commit.
>>>>
>>>> Are you referring to add the same in cover-letter?
>>>>
>>>>>
>>>>>> Once the DT structure for QCS9100 is refactored, we would update this
>>>>>> common file there.
>>>>>
>>>>> Can you refactor it first?
>>>>
>>>> This refactoring involves changes in all the ride/ride-r3 boards which
>>>> are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
>>>> need to conclude on the final structure. Since, ethernet is broken in upstream,
>>>> we are working on its fix before sending another series.
>>>>
>>>> Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
>>>> finalized, we can use the memory-map there.
>>>>
>>>> But to avoid this dependency and to proceed with iq9075-evk alone,
>>>> I can rename it to qcs9075-reserved-memory.dtsi.
>>>>
>>>> Let me know if that works here.
>>>>
>>>> [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
>>>
>>> Hi Dmitry,
>>>
>>> Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
>>> other suggestion that we should discuss?
>>>
>>> Aparently, this series is for qcs9075 only so using exact (not common)
>>> name also aligns the naming format.
>>
>> Squash it into qcs9075.dtsi.
> 
> We don't have qcs9075.dtsi.
> Is it ok to squash it into qcs9075-som.dtsi ?

Is the memory map specific to SoM or to the SoC?

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>
>>>>> -- 
>>>>> With best wishes
>>>>> Dmitry
>>>>
>>>> Regards,
>>>> Wasim
>>>
>>> -- 
>>> Regards,
>>> Wasim
>>
>> -- 
>> With best wishes
>> Dmitry
> 


-- 
With best wishes
Dmitry
