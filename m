Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05826B084
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351759; cv=none; b=Gw5nEc3J7OZ5+rKTJvmsAGaHGTzqczgWt+icCSqgJH+4+Q3PHAmX9Mgu34fOYnQFSzQsNDedW/T6NNM0TepZJRATkuv3+wWrnviUjSruE5W4lV8yiIZSI5jBLlZ7p2KZyH58VseH9TMu0b+xQp2aW9M2cVZOy0d/3PWwZDj3JCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351759; c=relaxed/simple;
	bh=d5W3GX0X7g3UXissjAjd6tzKPlXKQx+avpna/bRC4og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXdIDhekaBeNQm7MeZlZWuh7f0ZVzJxLh+aNMpSYAF8MSDJn/DSkPBsXzP+Ec3z8iVnfzFtN/r+jNSQkmD/srquog7JrgSH01olUBKb5PAZSrKPG8AGIASpycDrf55bl3AVq9oiODuV/TQldE8SSYfrKCL3F0Lfc2c5TKYIznws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HucSr9AH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HucSr9AH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAQJZ6016904
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haI88HCttPlaimE5g5HZVq6U+tyuHSX3H7yH1gCwk+c=; b=HucSr9AHQ0oqedkk
	WQfCGc46c6oUBBd4ZTTElr9y7QkAWdeLenxWA459TAr1ezvg0CRxm1wU4VsbXL3w
	fyOkOYUSOGQfQe6UWjn3orWikMe+fCYvA/2Zjazht51JDLRxS0g66/F99meK0i6g
	L9HeEzZu1i0SkFUytu7W4iGoPbnkzPfdnkZm5tiYBm0Mei6EQRcmkqsxN/BSEt4F
	loh0XFLXeCHyzTc50e5L0tZ2rk4IJk0D+2TdDq+PyYp4CrcV/WC/7sU6j0ekDkeF
	XaV9qqDAwat9eLeJzCHbo5VnSpPlQWNZYXwidZzGXypHevOSUdcpq+pJ1WowNtCn
	22XO3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcuecv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:15:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faa016252bso11675566d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748351755; x=1748956555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haI88HCttPlaimE5g5HZVq6U+tyuHSX3H7yH1gCwk+c=;
        b=VK1ltteQuXuybduo2go45psR1ohlyXP9lHoEISQ+97Pq700F9r7r0s6duv5w4bUi4V
         YYopjduXSfN8rxDsFiE1vKnkZ4Ot907rwo/TeNTo7f6fdo3WNeQdELs0yVdgrWO/L0Rs
         YLf/L41qDGTBCmR2rgmejVMy31p9roaLJJUtgJM/xVThrWrL/bYHAvm6EjBLv8t5T5PA
         61mBqvInFoYlR4Vfn0EbSB0Bt4btgOn17AEDEzQKbJL8tg0hNJl3BjuGmDDV5CDDE4zr
         Lczf4vdy/QdLexzZ+iEj8N2tZJPTfRs71yOSdU3/HHFWOLCaV/kSFyHkiIcF/8y57HA1
         qErA==
X-Forwarded-Encrypted: i=1; AJvYcCW5AiBWX2qFC7s445rVFb6ZWCzPEy62oRv9eGLE1GFEiuqPPWZLDZN0qgql3yyd+Ea5GxeX1nWc5/OWhIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zgH/i5lwc8GLtmLmqsQYz3jazCgfkbjeKRREErzVAUzVOVL9
	7UTh1P5f59j2H6Sz5cwP/pL64V2sz6wZgyLB/wWuALRAW080V/fRVOgmE5uOqEf3/sVxjQ7oV+b
	nK5ts0u0Byj2CSTbaVUrRVl98r14++rX6eP+kJ0tzs/POjPbK+Aoo5jWAcDxdMnHH0B8=
X-Gm-Gg: ASbGncu4Fc2W7gA28A10MP1yPxU+BibowTmiTb5avjF/MilDyOd3o8EZ0c1VIo8hGIO
	EV3KqzCUZBovpn1FpHDRy8BilsGvX+bXMJqQ0962tSufm5GGR27aobFChNNQKsf3fx+TR+R3DX4
	bhfMZCBqK9kzycOiFN/JGPhk5b7rgVP6MvHmZ2yX/KnbBL0yO0vKYMyuZqVdsqlgCx309tpI3p2
	/lQ6bcV8k7feVpt2dMS5uX2Zv7FGEe5xncbgJJDuvvjcsP5iUbhSqRrg1WDD1BlpFWBHKdvhpkd
	GfdAyrCiVjDLVVxhm9H54RFRJaGbuymp2i7EGS2b5L19xSFO6wx3SVm0U4bdUyXdIQ==
X-Received: by 2002:ad4:5ecf:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6fa9cfea442mr81664956d6.2.1748351755265;
        Tue, 27 May 2025 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyBKkeXUxc/NTG8gSl5izgYWO1GVIxceH278WuDF/J5QwQZVTgHu/6Sllwpaohx59JNw9hoQ==
X-Received: by 2002:ad4:5ecf:0:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6fa9cfea442mr81664516d6.2.1748351754721;
        Tue, 27 May 2025 06:15:54 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8888dc22fsm155534966b.101.2025.05.27.06.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:15:54 -0700 (PDT)
Message-ID: <061032a4-5774-482e-ba2e-96c3c81c0e3a@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Andrew Lunn <andrew@lunn.ch>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
 <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
 <DS7PR19MB88834D9D5ADB9351E40EBE5A9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <82484d59-df1c-4d0a-b626-2320d4f63c7e@oss.qualcomm.com>
 <DS7PR19MB88838F05ADDD3BDF9B08076C9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c57cff8-c730-49cd-b056-ce8fd17c5253@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yBAyWNJoi-mdrwAgqSp5stiZ3LKZI_vA
X-Proofpoint-GUID: yBAyWNJoi-mdrwAgqSp5stiZ3LKZI_vA
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835bb0c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=c7V_mG7Cw8Ydp4GSWmcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEwNyBTYWx0ZWRfXx1wPWL+u7tv2
 nhULHn9CSGrSPwrxJj8UfCzmjQa+YFO/FSVUBl2qHYLBMGMGI6WIVB4Lq4hHDm1rGR+dYfMXvbF
 msI9Rh2T22R3kbX3latH/I90taceVHKZbLeTFKGt0ky5mBSYZ93Mq/NUpeMYtW91hWEZUWUdfGD
 R6LoWhFFrQcZZ196nfogqH5PeyyRvVKEUSnSR2jUMhhK064i6t5KVT8JCLC0MMkfLFlJRXfKt6T
 3MuQpaV0e8lk39f1dfssYxV24ZB1wadNk7qtP2Okd0u2W9pHOpSnFCW2UniWmt1JX6u0GTJeDKL
 RuTR2LliT9tPBQwAeE3X/VvRXXJSCWwGsPI2LyWHx+HCVTYJS6urrjhRbOlKJiaRKKaZYwZsPnA
 llj8OakIpsdKg7Ph8I+tkTp0mOuqdssIsH/8PkG7hBLB0g/aRBHJmLneX8cLYjGwJVw/x7NL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=941 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270107

On 5/27/25 3:08 PM, Andrew Lunn wrote:
>>>>>>> Would qcom,phy-to-phy-dac (boolean) do?
>>>>>>
>>>>>> Seems fine to me.
>>>>>
>>>>> Can the driver instead check for a phy reference?
>>>>
>>>> Do you mean using the existing phy-handle DT property or create a new DT property called 'qcom,phy-reference'? Either way, can add it for v2.
>>>
>>> I'm not sure how this is all wired up. Do you have an example of a DT
>>> with both configurations you described in your reply to Andrew?
> 
> When a SoC interface is connected to a switch, the SoC interface has
> no real knowledge it is actually connected to a switch. All it knows
> is it has a link peer, and it does not know if that peer is 1cm away
> or 100m. It does nothing different.
> 
> The switch has a phandle to the SoC interface, so it knows a bit more,
> but it would be a bit around about for the SoC interface to search the
> whole device tree to see if there is a switch with a phandle pointing
> to it. So for me, a bool property indicating a short 'cable' is the
> better solution.

OK

does this sound like a generic enough problem to contemplate something
common, or should we go with something like qcom,dac-preset-short-cable

Konrad
