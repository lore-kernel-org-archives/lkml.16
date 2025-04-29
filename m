Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D6D2586DA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953401; cv=none; b=AsBR9XxJ/6L8qG/Ox0dnPsyKA9G5GGDMnqLLlg05dMwOvQrl1j8F+8Z3dauiCmxnRU6hEjvZoSyTrh54KmyaG52ReI4Zqx/kchgVH+5CLDovIaoXovJffGVQWPSVVsJ031f2iFqJtNSqyj8TAKYbTuZd0DIDyP3I2N19PN7XpP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953401; c=relaxed/simple;
	bh=enZuKg0Yho7LCctoR7MuGNSzlG3syPAETBOCsWhHujw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksijM6EyAOJwd8imcK44ytABgUSgDw5TrNHAUUetxaURXJh2xJJ5k8k299P/k5HKHP+3fbxnWis9dUOb6dLRVgpmouwfQV4rdnHt699M762fDPooaYftu7Do6g9EqY1kVe8EEwyql3e/Rlag0MLiBHhwL3O7TYUtpzTYshznsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjMpvrBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjMpvrBN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA0ocw030420
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SFUA+vmGXvWQaDUz0FTdKxJwrF/zWygzDZetk0yUquU=; b=gjMpvrBNaQpK7ZTM
	/lZ+msm1SX3oCVf8quRBsXx5dh/hKVK9J5Szu9lfFVWpujNcNmX02GAfoAfnclFc
	3tB8hFlbTlZ45zUcsrelRS0Puwvn0Cues542/mqCrtnE7kfBvMd0T55F5sjEqqbS
	ghNtliBZCDlrG+Ar8JTr8tlQkw/v4Fi8TI0bzMMfDm5tp3POiQG+STBNb9q+AAF/
	PTnsgIku9XFPdoV60bI3EbjWr3z+YxQxOD0pWZsU3LN/VJxg2Uma5kdsHdRyuIjY
	iXapfUQDEQraQemqlAAbW+Yd7kzlw5kSr0N/hnplH7xI3zj56hfaJfMVo2r4vJHj
	xgCNgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevmq40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:03:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768b27fef3so10412541cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953398; x=1746558198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFUA+vmGXvWQaDUz0FTdKxJwrF/zWygzDZetk0yUquU=;
        b=E6iMedvEI9XX20qs66/D86gyFgOUhNAOjf2908Z9Vs03F8ll5ElL+u+QNbLU2blKlY
         XttvKhaNQyy+KdEUzVwSTB+oOYudQzJe1BnFUL/0cGz+x/zgIfH7M8gJu9wA4U6mrXGc
         B4hsFluO9FDuY4NUPnjgYc4vJU3irY541HAwu7kDRiYPfQwHTy2UjGo1INFlffBmcsnw
         sQkfdyYn0UNF5hWDI9dCGlYf1zUsrO4tRwBj5WfGTYQlSwo2YG0UBk/o6Rz9snZGtfti
         6WcBcw/sl3KUtMRftWe6f7Jy9EBGX5ptZhwLEyC49RgB/QjelTp0f5EBH5R0FkM3JfxC
         FIlw==
X-Forwarded-Encrypted: i=1; AJvYcCWbAocLsoTl0uB9NAz67nuR7NW4Ob+KQAF8tNlqOhqxqSm3lfdGFccbLpBttJGi5NxKRLytm/qeV/WmQpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQsZ+pCUNnvUDJNKQbArHo1PRC66m7xCdh76uo+9l3FW3fNvEM
	06Mmwpln0XC8WF+fvllhGE33BZcN7JZc1FQls+dF3rBBiq0ZNxCtc/MsnwzbDf5mSvw9kQdfLKJ
	Mko3apS/g8/Roai0C4/7hRarZfnQKqQ/IRdVDHO12DtV4MB3I8an4NAyb/PKu/j4=
X-Gm-Gg: ASbGncusuM0T/evRBg1poNdHIAV7GZtsIluCBXRrUr80ozrfHDMnoTz5rCDpDgPKI5p
	OTme0AMHfz33+aoSXwrGL0rF9NI6NlnjAsYUTkmsA7RysAoGPOs9VNAAvrWdtZhbWz4cSP+eC0g
	oa3dbi0b0NMO9PfoI+6WNQOWNUKQ2Q1Li0/+sPoDQ48yW6B9fFGTj/N0okyn8tKLxKCy4mQ+mzS
	pGCYkAztXoeXIem8CdY/HaEsGUBt9TGQOH6/SSYw2zANSOoZvs1IV8CkevsqvmCUMvPqFUBbwtp
	TJ7X2HfbKsjaB67W+f+v8oJHPKvzl+6oE8GBCeTz76tK7kt8oTfI6brT8DgshYOZRw==
X-Received: by 2002:ac8:7fc1:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-489c0ecd9b5mr1232951cf.0.1745953397402;
        Tue, 29 Apr 2025 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4oXGFJFE688jinn7yYFdRyAJwph4UBQHGatqnUkCpVJYykMoY8ucb0lhtaDPLXOThnrZHrQ==
X-Received: by 2002:ac8:7fc1:0:b0:476:66fb:4df4 with SMTP id d75a77b69052e-489c0ecd9b5mr1232631cf.0.1745953396777;
        Tue, 29 Apr 2025 12:03:16 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6aebasm813646966b.128.2025.04.29.12.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:03:16 -0700 (PDT)
Message-ID: <1a49959a-9f76-40ee-b221-c049ebc2bb09@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 21:03:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a4149ac8-7e47-48a9-84ef-42aa367d014e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kEq2J3zKM9URDW3acgFLIkhCDkGRbT0u
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68112277 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=CIINWzuxR8hvsKXtIHkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kEq2J3zKM9URDW3acgFLIkhCDkGRbT0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE0MCBTYWx0ZWRfX4TyoiU6QguCC FcSrP6w2qM2NYuXv4Ln0N9pBsJhqd/4OEVvE2X/oTLM84TT1ZkO6kOMxItUVI/NWIj2VSC70hzT GSCRVJ+xh5j0MXOEJQ/OkrY1CSQcTIrZRFCvmZfgTj9B/O/qX9cDyolCArVBa0F54YFcU2rkHYY
 BJOklEg3hsM53Rrzi1ebJ0zRo4OX72+EAT6As6cPUlzkwpQ/NyDrLhy+katU0hBAvobbRGQx1/I qItfSeTMCxMuONzdz9ly0LkE6FFOQvsjijRncNWZUOjvCS+OtOCaAH060rz3m5UXQ7QEROiW+Ui 01eMk0D0qhfHFpdagXt2YV2Dm/2CliHYdkWOdflyB+cuOyZagECkdDaWmTY9i/rAskwhFPYbl2X
 5Ia5KGFNDtM3OagQo5dBXx8HJMnwqT0EPACieHsKOomgC59scSCwsVs7G4ungCkOaDdmc78/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290140

On 4/26/25 4:03 PM, Vladimir Zapolskiy wrote:
> On 4/22/25 08:42, Satya Priya Kakitapalli wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SC8180X platform.
>>
>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>>   2 files changed, 246 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
>> +
>> +maintainers:
>> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm camera clock control module provides the clocks, resets and
>> +  power domains on SC8180X.
>> +
>> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc8180x-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
> 
> From sc8180x_rpmh_clocks[] in clk/qcom/clk-rpmh.c I get that there is
> RPMH_CXO_CLK_A clock also, shall it be added to this list then?

_AO only makes sense for CPU-XYZ clocks which (almost?) exclusively reside
in gcc, and most of the time they aren't even necessary to describe in Linux

I'm not sure there's anything in CAM_CC that would benefit from it

XO_A is in the end the same physical clock as XO (or at least used to be)
except it places a vote in RPMh such that the harwdare takes care of gating
it upon cpuss suspend entry


> 
> If yes, and taking into account Konrad's ask for GCC_CAMERA_AHB_CLK, it
> implies that the new dt bindings can be omitted, instead please consider
> to add the 'qcom,sc8180x-camcc' compatible into qcom,sa8775p-camcc.yaml.
> 
> However still there is a difference, qcom,sa8775p-camcc and qcom,qcs8300-camcc
> does not contain 'required-opps' property, it might be an omission over
> there though, please double check it. The ultimate goal would be to get
> a shorter list of different camcc dt bindings.


for required-opps see:

https://lore.kernel.org/linux-arm-msm/44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com/

Konrad
