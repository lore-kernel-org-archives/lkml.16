Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784124337C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756859; cv=none; b=OD0bmSmpY53c++YeJKi0Sf+g38vOtC9/2uP7v1faTrdR+M3uGK9dxge27x5X7SNdCWxizwdZTSaNRlvR69tBUd8A/huOP8b5wJudlP+WEMo1QK6iRYr0t5NVzmKTrCzseHTT1mP53rhJL9vLvOhfKA1O/WUgo6jcpU1PdrZEy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756859; c=relaxed/simple;
	bh=XShGFTgNmrvDCJE12WoFrXmQEnD7TePscFZvl3S0xEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGyWPlpu6E36pWggSuh7QgAMEAtgpGZv8DMpwr6su8GSWFvd9G99AeHG/+IfnALgUaaK234hU7cacDsmVBcLOkeWSfVWTai2N7fX+SC+ka4G9zpbR5CBcejjOn6dOsh6yhGfyAwO4Yt+Lma3BoRuw8gMvAfxbo3zjD9pXk4K8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4ggdOot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4ggdOot"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9Gs8g016731
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMB/4NFBbPr7e4v0JqDh+lXqkZdCYFJ/eYQU5wDTN68=; b=o4ggdOotUb3sY02R
	1ogiP6sF3rrUcmgrtkBPdV9Ix3pyfkmh9en6HT0RlojQsjou+94YUrfuN1TUv3PL
	5V7t08jGnFidPgJwdpw5hk4/b8AcP5QaByBhqgWCkolxFVMnrm/Ub9F1+FWxT126
	U1ZAMQ2EUnuCC77uPvwwhFzfyNusvRhErZ4IJ/0bvySslaS82tqmhk4ptXXwJpqG
	3v+y8DZVKTFLOEyv0WtRCq/JNF23+Shft4pxbxSGlPqOdvTJ6Ft1+zHqQtpiGGdA
	JT5SwIQ57/eZfXj6L088CzmoeQijxnGE45jdayhW92hcrV+0fXuw+2Ie9ZL5pZqz
	3/PBTA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041vwer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:00:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2c8929757so17389616d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756855; x=1748361655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMB/4NFBbPr7e4v0JqDh+lXqkZdCYFJ/eYQU5wDTN68=;
        b=OSFVd5dPTm4YnD+ZH9kNf5DFlV6zg7SluQRKzPTdwk0FxyFk6o3i1si/0tB/nKLnCu
         2/YM5hcgh/qig0FXS5x4uUtBeYK2vRTyS3pJhCg/vEq8hUs/mdpL8cb4pEON4DqPWrsu
         9C9+vvMVM4KaB8/5WjOilT8q+lDgZ4/3zQuiU++cg1GHphgm/jlik0gkEgyj1Nv426DN
         dw2jF8D/G28EuHUK67gBcCHr7bLiRKdMXw/2LiJbNLoLNSicOdJgnHasyBJyChpKrWOC
         2voDDoOO7SURfhNlqVSM9jW+8rqcI3au5Rfz7laZLbHJP3k3/bAK2K87uBZHfi76ZZzY
         E2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUE0Ws7mbKm0/KtjKDChRopgg58R8KZmHdLPKCLQI378CHl/Jedll2rp4R7JQCnGJ/eqjHSgND0yH3bDmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ndPzDrBnwYEIKu9k5YjMGTrkyVbl9K6iGtZj46xpo9V+7NeQ
	P9u2ytfmyCeYofoxHBjNJZ1LgetYf/Pna2yssurLLVUJFmWEhw/5W+ckm9g5Rb53xjRmLll1pzt
	F1HRTdnOveDd0OpVfUl296ofTtEzN2WKJfFY0/8d5maSv+iby8Zf5fS2eb39B4xqA7TI=
X-Gm-Gg: ASbGncuxMoE8h2xf+/82KainoggpbFzhHCEYyicBbXp76dH1Y+YQo2RZV0QTKD4Jlsz
	GUsp1gjq+a0h6UAue1lNlp9ibbJU1JYz7GM06qH5sECDnbbHiecrzBxxhlGHm/gbHYZWH27tqMA
	7mdognOyirFK89Rf6wS0iKXJ5cxmV1c8HA1hgp3NcdM+gXhNUY0ukH3urE56nUKKlgzy11YlsLh
	vLHJ9k2q/wYCYQiixCtztdtShrGBS/wLbF8ewfA80+3fP0KPDg/N9wZd889hv/PHzde/BkFwTb5
	7VZJG8k5Q2al2TBIS4Q0ftoTKRBTOYl5lncVWQHczozvjPj3GHOD8fBcsJBILhyAaQ==
X-Received: by 2002:a05:6214:20ab:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f8b08282d4mr98336216d6.2.1747756855235;
        Tue, 20 May 2025 09:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUfgy1w4r+nTJ4LSFmejma8AcEDkG3KohHEdj355IJKL4b9rH4agpxCV3msGdiryUvKcnbXQ==
X-Received: by 2002:a05:6214:20ab:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f8b08282d4mr98335706d6.2.1747756854525;
        Tue, 20 May 2025 09:00:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c1bsm756346466b.95.2025.05.20.09.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:00:53 -0700 (PDT)
Message-ID: <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-portable-anteater-of-respect-c7be5c@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMSBTYWx0ZWRfX+Y40+SCbP1BT
 HHVpZKUkfOeBHgyS5Z0m4aqRc1tSEZmEVJ/xosvo2V8hFPOF+Rb7hMI6mp39NQDi5ZRLEssP8nv
 nZWsMHV+LrG9jPvy2hRb24YKucq26PxPCNG2J2ww/YWFaBPYaFGwhvdSRrVCvR1xu2ZNRtVCItd
 gdVXqG+P/ogc5twBFJJe9h4ki3aFRIuaWQP4RRGES8M0KrY0M6GW2OiKTOiRIxReqc9hxbCs99u
 tLRMd30RJw2BtFuW9JdFgxvV+J6Yfe8evdbK2e4e8HDXxYEEARmRO3DfMhOR20UNSsYNJobD/Wk
 8YW3xFnpMWitMAB3xh/YSt0kSz7SL4P9OP7XV3kMDjul4gJ+s71C/IhirpjFTqBS+QbLO9FdjId
 Qtz67GdTnuvPY+LBWD/aXUA/gBb7jgMdyAyjrUO4HXV33tbYus3uDihTUDluD5mX1/6tpkR8
X-Proofpoint-ORIG-GUID: GRUZy7832y0H_h5qYoRhUgbf5wSm3o_2
X-Proofpoint-GUID: GRUZy7832y0H_h5qYoRhUgbf5wSm3o_2
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682ca738 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qkre8nadHetdGucJBgsA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200131

On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>> IPQ platforms. Use this property to extract the restart reason from
>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>> entry with this information, when the system reboots due to a watchdog
>> timeout.
>>
>> Describe this property for the IPQ5424 watchdog device and extend support
>> to other targets subsequently.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v4:
>> 	- New patch
>> ---
>>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -81,6 +81,16 @@ properties:
>>      minItems: 1
>>      maxItems: 5
>>  
>> +  qcom,imem:
> 
> Shoouldn't this be existing 'sram' property? If IMEM is something
> similar to OCMEM, then we already use sram for that.

We specifically want a handle to a predefined byte in IMEM, something akin
to qcom,4ln-config-sel in

Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

Konrad
