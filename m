Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A208145B25
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747228563; cv=none; b=qavLOzoeMli8tKQkpLFZoGzNXIH6UfWG7ybRcNL8z7GzTtDzmizAm0lW27CYzGo5sY1dw0QOTlFAGOkF+KGax6fp6muscWLHEsqfgSgdJqpRvI+lTiPCoeiGD4YzOguGuap7tyHCEqi1Sgz1FDCTWhYLEltgHrinNkPxohgsKUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747228563; c=relaxed/simple;
	bh=v0BP+1zgyodWFIzVNFNOJIwHPfZxIR3qJHaplc/lVec=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g/PQos7nhScFygNC+w6mWIeRJistghcABcqpYxKxabTe9ErqiH5o2HIYflegRAB8mOtlee0rNzbydiGAuANw7+Pz9WJxuS5snATHzQtroQkbOqlec+BWB9N7GJhvAKnPl/Y0ygXDrWF9rRD1AWkcBautJ6SrmjrxwgCkBlnT+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMg0kXSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMg0kXSJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuogG012664
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yILatwHUR+Jh1zWNHOlot8iZKoX8IiPojYOoJQNfo34=; b=UMg0kXSJ2b8RReZ4
	VTdcPjMNvv14Q++NaKIWl8cFIKa40MmBYlVL0z8KGtTbua9u1BTLvY79tsdagqkZ
	eG9KWQZBMOP9tTfWzmlGXAWI8DtNIJTXv53Hr1meLbT+CTR/N/5Zuvw607UP3KD7
	j6LNo9GrtT9B6jtyacfgaGdAMg+SWhOQ3Q+FGzUPS4nsRp5wNKuViD3ETqQgqUE+
	LtoVCguCBj58cMpuB0Rrxobse8p3g0wtQ41tvq14ruSrn+eY29wyJRIjBlRCAYvC
	frqXYujniYbXb4/DQn2qxWYV3Dp8POFlI7BFGrTmyNoSwQo9xWgt/n16FIM5ZwwV
	hnz+GA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyjt2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:15:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22fdf1d9fcaso26237495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747228554; x=1747833354;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yILatwHUR+Jh1zWNHOlot8iZKoX8IiPojYOoJQNfo34=;
        b=jb3Zxk2u2ZVuDMry8oT6bx8lRxDcghdXPBd/JtFJvl2SVLXeKnH8bqkVjIxCyy6nNN
         JUThi6cp/5YGu9rRaMM7P8FUm1G3aPJeMNeYm4fW1/5S3VfrCi/aVSG4IqQ2eA5//lfY
         AM5W4baKdZOCrNbiqsL/DrlhJst6ZEqIL2+ITrxU2qCKK6gsc+KfJyU0h3Jwjntr8Rqn
         IsMtLl+WfIF7aESM3SsiAXvUg6p59s7UMDKRgONWye97X/0vMMlmQ2Zjd+derBL81fIk
         KY10sO6r5VOV3unIwW/VE0x95Iy96SgtItOzciQtp+1BtUYjYPQoGo06uU7yZrWXE9aw
         93yg==
X-Forwarded-Encrypted: i=1; AJvYcCWGJRt+R9XbgTZNhYzGIZo5T+h3lrKp9b5eluLdlU7qvyZCIXv0GbDERXXo914huxuT4dAEn9XjclcpdTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj/DR55L0U+veyK4UFv0TIQs8sGBAr8rt5qJHGE+UGNYctXMLb
	IpgzRJJ3aTLhY/XWxAhTPf+t4LrTwzH1FnAneymsVXPljxK7aBdzeUVKoRDfjp3T7mScMpasmtr
	nI560GACTnfOwN4gBOgak0X6B/OdolDOtIEAmegMK6i9P0tvHOAHzcVGnwaD5oe8=
X-Gm-Gg: ASbGnct179xFeKFSY+xz6XhkextBMoUkK34wQlACtzIQxpke++e2KJpEOEijBJW0F//
	ZbCQq4v0kL/dhv8c798cvbcV2bQAipVf/2aE6JVq4Rw1rdOjPzrkp/HIaIJDK7BHMFbCZvK6wW9
	RicA6WZLRAJmPYLdL5u1IWy8o+8ZaMk6AyfPVSfbAOeFH51RdkQSNDJ71qjUTNpmmGm0DKzh9nc
	F+woB6/Hbi0fjDaW1MLj8qBVk6uhsLgNpBIV1uHBEMnOAFzZ1wIFBxVfHne7IexWZAI4L/tBGnS
	/qm1M1Dj2q1hTLE//hOH1T109xbxyiGz1zg28rttZB2F2kjK9vxy
X-Received: by 2002:a17:903:f86:b0:223:4bd6:3863 with SMTP id d9443c01a7336-231980c7733mr54018545ad.10.1747228553554;
        Wed, 14 May 2025 06:15:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTYFWo98SuyRtqUUetHlRQ5KWCgJktTdVRJBORzPUQiavaZT41cx3IqIQIAnIuysE+QhtScw==
X-Received: by 2002:a17:903:f86:b0:223:4bd6:3863 with SMTP id d9443c01a7336-231980c7733mr54017455ad.10.1747228552334;
        Wed, 14 May 2025 06:15:52 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.85.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc680515esm98921705ad.0.2025.05.14.06.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:15:51 -0700 (PDT)
Message-ID: <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
Date: Wed, 14 May 2025 18:45:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
 <68d280db-f7df-48c8-821d-f7d408c302ad@oss.qualcomm.com>
 <8a763c70-adcf-4a14-bb68-72ddc61fa045@oss.qualcomm.com>
 <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8c2a53c2-c11b-4d49-bfb5-b948767ba6c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _TKMogeD5W0x27jk_dPu8sY0-eCIcxix
X-Proofpoint-ORIG-GUID: _TKMogeD5W0x27jk_dPu8sY0-eCIcxix
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6824978a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=P+HiGktFAnQmcg2NW2se+w==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=kuMuzYqABaI6PAa4Gd8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDExNiBTYWx0ZWRfX3AG5iL8XRv4q
 JvabeA+v8cw6q63G3DSSGWmRvMvNOnXUscYvVzQMfpNiO5dm7/t1nvfsDjU0w4c+AmJEMKMaSsc
 0oByP5V/k20CJP4CrzDDI7WztfCzkIepvWQKx7xunJ3vPEkMCtEmbwfnn0U/Gm1rcxu3hd65ZTC
 ZpkFFc3zUsNXs0iWF1MSvwIO4U+M6mvZFP6/Tfdca7GWr7+7NBI25NKQTfDIy+NtkEpkIsePcXt
 jKy4zbb+T5qoq63I9NGtKPTE9aQx2sLNCH+GUKKSIM3B4qMrkMq3OrP9uSG0vCFRTIGgQLItrEL
 9RiQuVfDWxhIPpso81RmWhn7ByK6OOur8yQheROj4DtvVyQ+9aMPvUV7/9Et4lLsTcER9zqHkTI
 BQ/VQ6krASXrTrN75NlXx4aRz+hRwXyIa4D12yO9cNhaXYjiJDe/4DSucqmmLzFongg4zQVM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140116


On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>
> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>> +{
>>>>> +    struct regmap *imem;
>>>>> +    unsigned int val;
>>>>> +    int ret;
>>>>> +
>>>>> +    imem = 
>>>>> syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see 
>>>> e.g.
>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in 
>>>> x1e80100.dtsi
>>>>
>>>> That way all platform specifics will live in the DT, requiring no
>>>> hardcode-y driver changes on similar platforms
>>>
>>> Thanks. I thought about this API but it didn't strike that I can use 
>>> the args to fetch and match the value.
>>>
>>> I need a suggestion here. There is a plan to extend this feature to 
>>> other IPQ targets and also support WDIOF_POWERUNDER and 
>>> WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support 
>>> and for other IPQ platforms, we are exploring how to integrate 
>>> WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>
>>>          imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power 
>>> Under value> <Overheat value>>;
>>>
>>> and store these in values args[1], args[2] and args[3] respectively 
>>> and use it for manipulation? If any of the platform doesn't support 
>>> all 3, I can update the bindings and define the number of args as 
>>> required.
>> Let's call the property qcom,restart-reason and only pass the 
>> register value
>>
>> Because we may have any number of crazy combinations of various restart
>> reasons, we can go two paths:
>>
>> 1. promise really really really hard we won't be too crazy with the 
>> number
>>     of possible values and put them in the driver
>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>> `bootstatus-fanfault` etc.
>
>
> Thanks Konrad for the suggestions and the offline discussions.
>
> @Guenter, I need a suggestion here. Currently as part of this series, 
> we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, 
> WDIOF_OVERHEAT reasons.
>
> Once this is done, we do have the custom reason codes like Kernel 
> Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and 
> few many. Is it okay to expose these values also via the bootstatus 
> sysFS by extending the current list of reasons? Since these are 
> outside the scope of watchdog, need your thoughts on this.


Konrad / Guenter,

We had a further discussion on this internally. Outcome is, it wouldn't 
be ideal to hook the custom restart reason codes in watchdog framework, 
since there is no involvement of watchdog in such cases. Also I don't 
find any references to hook the custom values in watchdog's bootstatus.

If this is fine, I'm planning to resend the series to handle only the 
non secure watchdog timeout case. In that case, as suggested by Konrad, 
everything will be handled in DT like below to avoid the device data.

imem,phandle = <&phandle <imem_offset> <value>>;

Kindly share your thoughts and inputs on this to proceed further.


>
>
>>
>> I'd much prefer to go with 1 really.. If we used nvmem, we could have 
>> a map
>> of cell names to restart reasons, but we've already established IMEM is
>> volatile and we shouldn't mess up the convention just because that
>> subsystem has nicer APIs..
>>
>> Unless we rename the subsystem to `fuses`, `magic-values` or something..
>> +Srini? :P
>>
>> Konrad
