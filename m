Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC531FCF41
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344775; cv=none; b=L+LOHhEhtdhXBGAhL5dMrLZpiSIVMWOJXuTxG9OZmlwFe2jGrEPYSc0X3qBtVjMt2pDb9O0FId4o762/B+n4X93eWjDYb6TomcW/7URtUfyG6iwr73GTrUQPnEkQFLRQeX2ym5uq99c+0kr6K0N4tx0zzX9NS+q391ezEqqa8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344775; c=relaxed/simple;
	bh=19feJZZTbb+km5oSmqKqxCaJrNvkXHMQEj7v3RsRCgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qla9eIH5sYkNWqdxjq9hd7o/NuTbUvfRvPHauby36Jq6fy/DdEjoGBsPK7fIxu+0jCpNh0W/0MT8SavCWThS7Dfs0fHUY3FrgRjAxBZaglAxanU0LtrlUtL0d+LePpDhaCFiyFSY5EJduBVwAZgfBONbwD0FLY8ag/PhKMEsuu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJUp31k+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJUp31k+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RA16kD003699
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=; b=IJUp31k+8iZ8fZ75
	0IwkgnNKcfWG8ZX6uBxvXyY1Pmba9MTgMyJ9hqR/1Gcp+7OmWHv9LA8JhHQdA7i3
	0aP3cvkaobNyLO6lUXfZI/r5rOmMnNC/Kk4VIT7VLVcFNxBQNaWwqTUs1p6XoQXu
	IkRafdp2EyegDVWCus8pQ8A/XQAfHuBaonnhptNyzYVipO5H13DaAsEqum0kSqCE
	S9gCjy/EmPKtHuvimd1LZxt4GPWzAXaZ8NGenBMk9FQtlRDoAVv8iw9IKr4P63V0
	0KwSVQQfRuSO+4HlfdQGBD5BkolkRSTbb8/iuv3xdX0bX/NX11e5MtPohfZTLmUE
	AS6T4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq6t17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:19:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so44636785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344771; x=1748949571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGGnr2Cf6uz/5zgl9H9llVxN13njxFiPARnslx3OyQY=;
        b=Ax6cyVBbHkkmChT5GPfuI9HcWp3vzQ5AlkfA0GIaZhyUnNJarUzus5KSW5TVdCuF/b
         bjdbB34WAk/wxKoKz5hGq6YErxD040kz/VIqjbONTt+wtyIhwuacufhhTzRDcmul88ez
         //Yglyz4g61ZC1eU3VgqJPnIybImnwj1Eoloo8H1/Nsn098qxjuJuOy3NmjEx0o6+rUn
         lehyQtNCQ/EZxnPMEouKs2Zb9NrqbPJJuo+idfvFjgYdL4dnxZhjAvYnF81S8GYWSBc/
         ZKIYxjAuNHVK/3aCP4pBeNrrOTikQAS2EvR36fPGUzy5omy9cF3TZdj68iPKyr7AK0jp
         NMnA==
X-Forwarded-Encrypted: i=1; AJvYcCVPBnRbGfzqETinfuYij3CXWbf5IZzOq6dTD+nQv8wn5EbfDbBjGhTQU/CksXOVA37UQhaDIEQnAK2LYQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaJpRERRpq5Qy23pbhu2j0VrqZUP0QmdMCLs9kHTP37nZ3nHb
	fqcH68r0H4Gu3IOwocqTD/YFY320h0o3IiIqa5uoSgOVAdiU6xhiGaG569JOVYOzyN6mm56eS1w
	2Y68yA85Y+5e7oSblBayMEI505O31OQZt1ljdidaLg7R7ZW7/UcXZ044OvDt4g4gtW6M=
X-Gm-Gg: ASbGncuWnof4VOE1m5ZwN7IRku3Pk3JxZ5DcOqwGMkBurq4zJslUnHgWruNwZmgO5X3
	GqRodfT1tMWwlMdlCEOZnQjQoiGSBE2FpNQf5EM/TwEIZ1t6utYZoMaSZljk7ubUWb1kKQr3n62
	jR97kL2G8XUuQ0IjFgKZdRBq6WHDVrvhVEFZfgaiLr3tiJi0sGm5rXqcDSrVrpi0W8+GIgckZoQ
	NwikKrszcRpxQwto1j+s2LRqFop/0CjC2ntFcvfdkDZRLMeIunqgHLOUBl2bQ5taptu+wE3GD+D
	ueu/TdT7wNhgv/DjPOUt8JdUIMD75dxi9JPx+MF3l69WZ7owWASDqhDKVmPs8fBrdg==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868906d6.9.1748344770690;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVX0YQa52wzPt5zotLH02+4Oq1iIQcnbNqEa0aCHbsQCwGP7XhMmeQ5L88JOR1OO1b3BhmMA==
X-Received: by 2002:a05:6214:2124:b0:6f8:e438:6a31 with SMTP id 6a1803df08f44-6fa9d38a281mr84868616d6.9.1748344770315;
        Tue, 27 May 2025 04:19:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049fe0e94fsm3125097a12.26.2025.05.27.04.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:19:29 -0700 (PDT)
Message-ID: <99fd4103-97e0-486d-9e6c-66c8adb70b3b@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
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
 <sboyd@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
 <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
 <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883BE13166F7CD5DCA777DB9D64A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8bmNGzkiMaDJa6bw0nFsuw4m33J5vizq
X-Proofpoint-ORIG-GUID: 8bmNGzkiMaDJa6bw0nFsuw4m33J5vizq
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68359fc3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=2jJET5DcvFRXXXsR3agA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MyBTYWx0ZWRfX8BE5Iui96AbN
 b2viyRuRGy3BU2Bmmq0lfGEJzOem2mxmTFrGrHWjtShmhhNMtBCSuxQaHqrnj/1A/qkfBEWUrPi
 bO4iHwNemc7fwhVgRGrLwcbn+mVY+bwiqQ80AiwR+dESqO7EqrDCTbLY3VKzm8KlimtWmV9CDaA
 CITfCeP1fpJUSWOSLzek0elJ0qKJjdYBPCf3MfJ/iNLFEpKj+LUoFzk+KihlnUQ44xF51Z8r1Ve
 FkBvBmNj0W1pdvNgvhDazlxoeYAUGlAE31LnXJyVCV+v31Nd4yFfzWUbSAFFMU+MwwW4TtELX7E
 +TwsTMVufv/SX21/TMRJEyHpxmnS3Q6zdiAr2ZTgvD1EIi/4RjQMpJOOjl0iBIJoi/wzx6zs4YP
 OP3n8+M9BtwDINaJtk4Nz3jMr9LXaaxPZoh7uex5dtR9/oCtjuihD/a75mtz/ZTw6LDIkBMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270093

On 5/27/25 1:14 PM, George Moussalem wrote:
> Hi Konrad,
> 
> On 5/27/25 15:00, Konrad Dybcio wrote:
>> On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
>>> From: George Moussalem <george.moussalem@outlook.com>
>>>
>>> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
>>> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
>>> of the reset definition accordingly in the GCC as per the downstream
>>> driver.
>>>
>>> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---
>>>   drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
>>> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
>>> --- a/drivers/clk/qcom/gcc-ipq5018.c
>>> +++ b/drivers/clk/qcom/gcc-ipq5018.c
>>> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>>>       [GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>>>       [GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>>>       [GCC_WCSSAON_RESET] = { 0x59010, 0},
>>> -    [GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
>>> +    [GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },
>>
>> The computer tells me there aren't any bits beyond this mask..
>>
>> Does this actually fix anything?
> 
> The mask is documented in the referenced downstream driver and allows for consolidating:
> 
> resets = <&gcc GCC_GEPHY_MDC_SW_ARES>,
>      <&gcc GCC_GEPHY_DSP_HW_ARES>,
>      <&gcc GCC_GEPHY_RX_ARES>,
>      <&gcc GCC_GEPHY_TX_ARES>;
> to:
> 
> resets = <&gcc GCC_MISC_ARES>;
> 
> to conform to this bindings restriction in ethernet-phy.yaml
> 
>   resets:
>     maxItems: 1
> 
> Effectively, there's no functional change. So we can also list all the resets in the device tree, whatever is preferred.

+ Kathiravan

are there any recommendations from the hw team on which one to use?
As far as I can tell, the _MISC one simply pulls all the aforementioned
resets, like George described.. it seems weird that it would be designed
like this

Konrad
