Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D826FDB3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350817; cv=none; b=VggJSFokmvGoP8ies7PADS82KkGqkHXTDIXTK+oYL08FYiHec59684ZuBAHgVrQ/hR/qLGs/7QXG06fOQHYJjbJxDkshaIe2iG6w81pmlsIVo6WC3GOtaFv0S5efqYhvsGeMLR6KevZ3Gr+prd+JVcoxKZ/XQqqmI9kMm30rYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350817; c=relaxed/simple;
	bh=Y0H3toatZSjcnlATqS0M3QpJEqMRrCp0mypi2ETlKLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaL3ATYOkAY1olH/oieKH4PpQItDaXltMHbBLcLu7tPRp6DtTNf/IR0CYrPbc6tnwjr5r2Z27F94t7u94qWyVN6on9oqZYZwFkBkUZZGTOak4+uy6Lys+a50ki6I4FRBNuKxuH+hzfJcVrVGWc7vjmW0J16zx69YXX9G43RxQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elKXw6UU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elKXw6UU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9YJIc001582
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/oAvyIsOigZeM/MFTaz+sIwKKluMAfH5ZvZ5sMUBPa0=; b=elKXw6UUbTgCao0N
	UdkLZJzsBbkvErTMRRAkzVqqVKOicmIDKZKkDkCW/wsGfzxvzgQh8FMGXLEzBHvq
	FkyYwpf1w2/cxQZ7kB6CnU3uhzRgCJGma8ALzkl+uDplTdg/zJGJBnQM0gTO7ZpD
	o2tAOGI2DgLn75Fc6V8pOZ+vEIK13WnvoI7AOrkE0zST7HHv6DfP44rD1dV3cnLh
	PuiCgCvQB0XJpr+LnM1hIAFWTmlvgLO0bBkpdwVpH++waRQ/DxLqi2m3Ylfm5y/3
	i8hvlD9B1B+2bkZUGvaaNNjYRtnwyMf4ly/wzs51KPcXFWmWFYLTk2xSFVwJWlEd
	U4jm2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkrmaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:00:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faa4e69621so4560656d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748350813; x=1748955613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oAvyIsOigZeM/MFTaz+sIwKKluMAfH5ZvZ5sMUBPa0=;
        b=cZfhDi0IzRdMaZsTisWvwktEwAiD1FzNQKo8t9BOenwcgTqouQpWyMdFjJzvAwas5G
         cf57d3kp0HBCfJx6shJ9WXQ5a9USpph0vMTP6ziWH2giKDTl9eQM/mBDtf8G6wsOJE1y
         kAmOQ9HXdy1JrvLYqwWwKs1Wj8Kko3LeFEEyuMn869cTxF6iN6+nYfzaebFG02w94leH
         KoffDRcErtWWZFzZQgohTgva0IfD3MZfLDk4FBUYwa8srO/h5HmNfP8xKvf4tnDAIc3D
         E20oKR+jRQDrE/VWhrYyX9BxrAVpaW26cz7e7c7elL317ZKR31z+hreDNpZBp6V/ca+I
         eaFg==
X-Forwarded-Encrypted: i=1; AJvYcCU5yZgq+jL6UmJ7JGXmBNzKF2IpzUCpEEcFgu5AK2dyIBnm663yuffd41KwVLo4WH5m2I84riZZ8e442vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5IgMDuyfbFfFof61Sw4OcJgx5p+dt815vC1Ho4xS+G/KeBOi
	Acu+TP/W7Z7mUoZ/RkwFO/SVPjLPl/8DMrelq4p6TvK8m/ZI1gB3bGyLd+yMJJcNW9Xv4kHVoQP
	BdGjVMKtNcjFHwaqWJmb7fweC23Zl+CiwAfXEGHbeP7rnlMDoPL2O7YxQSyc3ncIYy/8=
X-Gm-Gg: ASbGncuOdjARhsKAyMcpoh6QHbmYA6QdqD9j6hRuz5B+G00/TC5TfQ0naEDx+bewDtJ
	a+Oz7H2CzIEoUq/8MRgc2X/h2GyWoi1Bekrnx9twwwb7P20jnZjLR6b5GTGYPhdE4a6LxRVqIRg
	1scVstoamWZwCHMTJjoG/SgLHr210AlM+Vu1IT336y0PwiRSmVJcC0K4ZvInEeQNPZAkMXvDbY+
	eh/JNtQWRSgmSIB1gh9+ejouApLwWVdAHo6ok5f4urNzzmsnKgNCa/zyRLAnAAO7WUHAshuj0pS
	wrdf1L6gnMlBb6BLrgAzU1RL3xduUR3THFXuHDbqc2TdCjl34qX8ZPBLtDFVKu4GYw==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr69690906d6.4.1748350812432;
        Tue, 27 May 2025 06:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsd45p7MtHnd0C230nLnbPXANMtphnUoIk2oXFWcsvu53O2hU8bd9xH0/suRkdQCrBpP7nMg==
X-Received: by 2002:a05:6214:2482:b0:6f8:b4aa:2a52 with SMTP id 6a1803df08f44-6fa9d270dd0mr69690556d6.4.1748350811908;
        Tue, 27 May 2025 06:00:11 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-603f71534bbsm4671679a12.37.2025.05.27.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:00:11 -0700 (PDT)
Message-ID: <7d8c3a31-cba3-40b9-8cba-52d782e5cf00@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:00:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: simShLqCnDjG7Er4NrS-gN_1pdM15Lc8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEwNiBTYWx0ZWRfX2vcmdXNS6tCg
 SR6Wq5sKOgqUisET5WTLKTLntD/x2C08JjWfQlk7uGPlPIkzr5VtZ7xWCf6c7XIEE4sKyN/kTGh
 zwgwxcBOz/lqwIbzJ8vOmEtoRB2i2eWw2+kSUCo8ls0PSflm2lUEyPvr8tuU0A2oqGD8dT8aLbY
 w6+KLxBKj11qihomJq1/plh1qMd2r8UUFvCe2H97lEU48YTfcFVoxA+zmofJ5GLZFeZ2ftuv0b3
 /9M8/Ru16/wwYUwB/kEdWDq3OC8WMwonYoeexlKtCVbwzK66tQEBP7eA/sgDMpeQjuEJ3iaaPiA
 jHBGOg5WmFo7HOUQAo+rmWdLE2A0Ix9fP+z2a9boGZAjGdlGySY4sRlxrwjDLgo/cmWE4LWO8aV
 vCfntNmf0M/yzVdR6YnX9rxsPNVDiijpHpszlACsl424EVOSnn2FhCjl3T1FFNVEp+FNDUFN
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6835b75e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=kxBOdmaUou3VQMwD0a8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: simShLqCnDjG7Er4NrS-gN_1pdM15Lc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270106

On 5/27/25 2:13 PM, George Moussalem wrote:
> 
> 
> On 5/27/25 15:31, Konrad Dybcio wrote:
>> On 5/27/25 1:28 PM, George Moussalem wrote:
>>> Hi Konrad,
>>>
>>> On 5/27/25 14:59, Konrad Dybcio wrote:
>>>> On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
>>>>> On 26/05/2025 08:43, George Moussalem wrote:
>>>>>>>> +  qca,dac:
>>>>>>>> +    description:
>>>>>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>>>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>>>>>> +      link architecture to accommodate for short cable length.
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>>>> +    items:
>>>>>>>> +      - items:
>>>>>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>>>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>>>>>
>>>>>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>>>>>> Drop entire property.
>>>>>>
>>>>>> as mentioned to Andrew, I can move the required values to the driver
>>>>>> itself, but a property would still be required to indicate that this PHY
>>>>>> is connected to an external PHY (ex. qca8337 switch). In that case, the
>>>>>> values need to be set. Otherwise, not..
>>>>>>
>>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>>
>>>>> Seems fine to me.
>>>>
>>>> Can the driver instead check for a phy reference?
>>>
>>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
>>
>> I'm not sure how this is all wired up. Do you have an example of a DT
>> with both configurations you described in your reply to Andrew?
> 
> Sure, for IPQ5018 GE PHY connected to a QCA8337 switch (phy to phy):
> Link: https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq5018-spnmx56.dts
> In this scenario, the IPQ5018 single UNIPHY is freed up and can be used with an external PHY such as QCA8081 to offer up to 2.5 gbps connectivity, see diagram below:
> 
> * =================================================================
> *     _______________________             _______________________
> *    |        IPQ5018        |           |        QCA8337        |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | Phy4   |---| MAC5 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |                       |           |_______________________|
> *    |                       |            _______________________
> *    |                       |           |        QCA8081        |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |_______________________|           |_______________________|
> *
> * =================================================================
> 
> The other use case is when an external switch or PHY, if any, is connected to the IPQ5018 UNIPHY over SGMII(+), freeing up the GE PHY which can optionally be connected to an RJ45 connector. I haven't worked on such board yet where the GE PHY is directly connected to RJ45, but I believe the Linksys MX6200 has this architecture (which I'll look into soon).
> 
> * =================================================================
> *     _______________________             ____________
> *    |        IPQ5018        |           |            |
> *    | +------+   +--------+ |           | +--------+ |
> *    | | MAC0 |---| GE Phy |-+--- MDI ---+ | RJ45   | +
> *    | +------+   +--------+ |           | +--------+ |
> *    |                       |           |____________|
> *    |                       |            _______________________
> *    |                       |           |      QCA8081 Phy      |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    | | MAC1 |---| Uniphy |-+-- SGMII+--+ | Phy    |---| RJ45 | |
> *    | +------+   +--------+ |           | +--------+   +------+ |
> *    |_______________________|           |_______________________|
> *
> * =================================================================

So - with keeping in mind that I'm not a big networking guy - can we test
for whether there's an ethernet-switch present under the MDIO host and
decide based on that?

Konrad
