Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7CF1B6D06
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747413323; cv=none; b=QrL99rDRy1Ab+jZX4KvY+yvcXHlrdseCzVaXTZe43IRt18ziVED4WhSg2cJSoXgh/BxN1Ajv+hD+Xu5Gw08AR3mUjxjYYODD794WnBvS+nFEV2x03QmFNJnUHRFRfKpxDU48OgPbGkES90ylZvgGl5JGo1ht5yhFUugX/xiiLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747413323; c=relaxed/simple;
	bh=es/iLpQ7h491Bm1ao/ZtHs92YEBYb8fiiply/JOiIR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9jAThNMOVAFEq9rkdqjygnV/VdZZEpVD1r4mH9fudfQQbRexMNaZNBbTs0NB7sX9X4GSPIRaGpvGsKoOSIF0kG5yKarUtIuCBEd1F8n1BD8Ac9dbOkSWKM6A9uY9lQA0922I1YXtWYRwWPEQpNpC2gDeBP240DNyOUd3jDKS7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lzZKB86H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzZKB86H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBakq0025636
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTmwEqQ8XcBgL6KMnmGn0Js5nNwnbxm2fJwGxsiwNzw=; b=lzZKB86Hz1wJz1yL
	SCH9OoTzfYdnDjPGW1XLSuIF1HEvwIcANflxs80nIOLJiWiXIqv5iXpHTy/MepnY
	ofN4THVwZ4he4iZGIQpcgXnjIbcwYB5FATPK3DILd+0qeQVeH9OzJbjup0V97+UG
	6HYodvtDQm2qgxlXK5JZNBTFhd3mi3SYFCTbL4+gxemvmETLA5j8VI8uvZWmmMsJ
	kTlxHqSxnfQNyhQxOFA7hEX3hk3OqIEspRbTisvEEuy/Yq9SyRji4P1uGLgZRYei
	Uk4jYSogWz+9g9YH9EuA/FNZh6myfh29qTVtm+S9omoqDUEPg/FTC5StCuC7e9ES
	KXzX4w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp2krd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:35:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c8929757so5572466d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747413320; x=1748018120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTmwEqQ8XcBgL6KMnmGn0Js5nNwnbxm2fJwGxsiwNzw=;
        b=I737wiqdncBFHsK6S81iqTjDtk5QPDqrh/+s6fUOku6aOQD8LklIiD5nu0OJMaFIQm
         cQ3TGc2+EHFX04Kxj4ymAQNgcmwumEHoyDwO0U/jw+3d37ueA4GrMI2hzidyTFXhMCg6
         PGjs2U4LHssvAHMRTb0rHX7Zx4dQhXm1Uqtd0tUUkJo1u6tLO77bCrz0whXtMXEUcST0
         E6PjrhWmbVojx0apY4XcXg8BtRmKded8fAHSb/Zcw/CzoBgWjfJNTykZ4mqS9kxU+mRV
         q0ef1tgsijh7kXFv2aJByWMosuaYapOMYD6ZHjitMU5b3bAzeyyBlK8FmSNdivxnRU+8
         K3WA==
X-Forwarded-Encrypted: i=1; AJvYcCWhNFnKuUZPTRwyRu+0mLDCbFNVN4xPOax+KZTvlWwyRZ/tcygraUZcWdLaW/3eiLaZN+aOw6BbHjiKcGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvdeZEm+hHUdIVLLrPWrirsnRUlTby2lpAq5CgM1Ee1r8fwxy7
	iS0ta7Ze2NXmVZE6k61CHDijaF1eD2yPla15OqdzmWp07xMEcuV8Ai8lLhy2yxtUsnxqUKzWkYD
	kf1hloUklDC77uIAOcXqzEJAjjMOasU0KbpTuaL/A7YP66Sjd9VRItFpqogy8IDdWHiQ=
X-Gm-Gg: ASbGnctR7F08uY0nY3tndOmUeBje9IzbvHCjlPqshiJ/saC8tQX48UqrZXWiRWrAh7w
	D4QrCjyFKQOFKMOIxw+SUo3jq0eigFBl/tLzx1dsmqL0UrXcPE/BvQerYZsuI2pQPV+A8j6y+6C
	ri2/nSN9OBIFJJsl4xD0FQKdHSM83PPDNHKeMDHPNLgfCAQuTYmYFRZNaLFcpqRqlkUSHClCc90
	CcqxBZNUJk+OWJSVIT52tCfrl63vJ1tEJk74N8DNuTMqBJPkahbBoL2I3kmbiOkHIO7Bwh1tgoM
	H+1M9ACEtmgXdoYywWKq4LpRnOMGRqTXJeyusgLkm4jNilriZvXnAEeEb2fWy8e1Rg==
X-Received: by 2002:a05:6214:21e8:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f8b09029a2mr22550066d6.9.1747413319520;
        Fri, 16 May 2025 09:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrejNuXm5xcNzQ2NQrSkT0Ek+i35JQqkBQixmZL/6pvDp3di/K8cA/Ni3c15xUoOUfouZokg==
X-Received: by 2002:a05:6214:21e8:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f8b09029a2mr22549896d6.9.1747413319075;
        Fri, 16 May 2025 09:35:19 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4909e1sm178126666b.125.2025.05.16.09.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 09:35:18 -0700 (PDT)
Message-ID: <21bd89b9-9f6e-42d0-bcd3-b6476cf91705@oss.qualcomm.com>
Date: Fri, 16 May 2025 18:35:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
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
 <1e871aed-705f-4142-b72d-4232ae729a37@oss.qualcomm.com>
 <6274641a-7366-41cd-a0a7-a9e9cc41b8e6@oss.qualcomm.com>
 <0a73989f-b018-473c-872a-5cbc2e7d1783@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0a73989f-b018-473c-872a-5cbc2e7d1783@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OWnWvK-K7OaW-tieRUr31evdeHfExtWq
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68276949 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VNoyoka1EbeTPVikYY0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE2MiBTYWx0ZWRfXyr4UkhlSPFt1
 39dhMyIG0JCu7M4edNZRamR9zM6a4JkkdMh/UUqs+38SDv6Re/ttR23ViMuAesq0n5sanhxl//m
 LQxC8gXiyS/I70sDkjlSC6W3tPwy29QwajNua9IaDM+Xx1rMX/qJth8P/9Vq+QD3XyAQIqIBWek
 avt3CJfOsMfGG/a2T/lISiW1tkOZJEr5pm0gkYLjhCp2OYFl4KRw7SMOdcZE0ZM2YAm5xpvVEu5
 Ha287QHdXQeJQU+vqzJGVn5n4pMbglD1oiruJdoTPd6O+kD62rKG+wf77fF1DMddwIYXSZ8ETdS
 hb3VoIE0fdlIMG1Clgk2B1NBFq1pU79RHNuRFMytF3ib36ril5MU3tWXhixsJ4R6T+aUAe4rwHY
 LviXoPE4N8Z+mgG+UusZ04cLleQTx8z2gQUH741V1yCuR5wZVDFkuIxI+473sgY72NTmsltQ
X-Proofpoint-GUID: OWnWvK-K7OaW-tieRUr31evdeHfExtWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160162

On 5/16/25 2:52 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/16/2025 4:48 PM, Konrad Dybcio wrote:
>> On 5/14/25 3:15 PM, Kathiravan Thirumoorthy wrote:
>>> On 5/6/2025 4:31 PM, Kathiravan Thirumoorthy wrote:
>>>> On 5/3/2025 3:53 AM, Konrad Dybcio wrote:
>>>>> On 5/2/25 6:28 PM, Kathiravan Thirumoorthy wrote:
>>>>>> On 5/2/2025 7:33 PM, Konrad Dybcio wrote:
>>>>>>>> +static int qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>>>>>>>> +                    const struct qcom_wdt_match_data *data)
>>>>>>>> +{
>>>>>>>> +    struct regmap *imem;
>>>>>>>> +    unsigned int val;
>>>>>>>> +    int ret;
>>>>>>>> +
>>>>>>>> +    imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>>>>>>> Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
>>>>>>> drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi
>>>>>>>
>>>>>>> That way all platform specifics will live in the DT, requiring no
>>>>>>> hardcode-y driver changes on similar platforms
>>>>>> Thanks. I thought about this API but it didn't strike that I can use the args to fetch and match the value.
>>>>>>
>>>>>> I need a suggestion here. There is a plan to extend this feature to other IPQ targets and also support WDIOF_POWERUNDER and WDIOF_OVERHEAT cause as well. For IPQ5424, all 3 cause will support and for other IPQ platforms, we are exploring how to integrate WDIOF_OVERHEAT. In any case, can I define the DT entry like below
>>>>>>
>>>>>>           imem,phandle = <&imem 0x7b0 <Non secure WDT value> <Power Under value> <Overheat value>>;
>>>>>>
>>>>>> and store these in values args[1], args[2] and args[3] respectively and use it for manipulation? If any of the platform doesn't support all 3, I can update the bindings and define the number of args as required.
>>>>> Let's call the property qcom,restart-reason and only pass the register value
>>>>>
>>>>> Because we may have any number of crazy combinations of various restart
>>>>> reasons, we can go two paths:
>>>>>
>>>>> 1. promise really really really hard we won't be too crazy with the number
>>>>>      of possible values and put them in the driver
>>>>> 2. go all out on DT properties (such as `bootstatus-overheat`,
>>>>> `bootstatus-fanfault` etc.
>>>>
>>>> Thanks Konrad for the suggestions and the offline discussions.
>>>>
>>>> @Guenter, I need a suggestion here. Currently as part of this series, we are planning to expose WDIOF_CARDRESET, WDIOF_POWERUNDER, WDIOF_OVERHEAT reasons.
>>>>
>>>> Once this is done, we do have the custom reason codes like Kernel Panic, Secure Watchdog Bite, Bus error timeout, Bus error access and few many. Is it okay to expose these values also via the bootstatus sysFS by extending the current list of reasons? Since these are outside the scope of watchdog, need your thoughts on this.
>>>
>>> Konrad / Guenter,
>>>
>>> We had a further discussion on this internally. Outcome is, it wouldn't be ideal to hook the custom restart reason codes in watchdog framework, since there is no involvement of watchdog in such cases. Also I don't find any references to hook the custom values in watchdog's bootstatus.
>>>
>>> If this is fine, I'm planning to resend the series to handle only the non secure watchdog timeout case. In that case, as suggested by Konrad, everything will be handled in DT like below to avoid the device data.
>>>
>>> imem,phandle = <&phandle <imem_offset> <value>>;
>> the part before the comma is a vendor prefix, so that must be qcom,xyz
> 
> 
> Sure, will name it as qcom,imem-phandle. Hope this name is fine.

just qcom,imem is fine, phandle is a datatype described in dt-bindings

>> what are your plans for the other reboot reasons? are we scrapping them?
> 
> 
> No, we are not scrapping it. We are exploring further on where to put this. May be we can put those logic in some simple driver named as ipq-restart-reason.c under drivers/soc/qcom/?

I see drivers/power/reset/at91-reset.c does something like this

Konrad
