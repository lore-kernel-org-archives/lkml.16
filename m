Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F522980D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362914; cv=none; b=cdBErndFYxw1EV/vk/Cnatg7Ne3bY0JsV53Ux6VxU35cRYyam/I+YUeXk4PrRnxNZayPXjEbmXlabQzXJBiZtuvoLy6rqERN9Ij6ipwQSYHLFKr3VlM4sY1TCZMk6WRIQaIEr85a3LUJce2aV7/s6hARr3NWnOlqwz/tTxX5+hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362914; c=relaxed/simple;
	bh=wSDiSTIMzZ8AzbSlo0H6dx6Tq5uu0BrhmY/nA2lB3N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=deV1+RlKZWxoiHPGU7NLuIog+O7pCl9vLhaH7WPvTR/C/f46khc+TAQkPRIDs8cOgMtP/Bibkm0ukANuWk7nKUFoTpPRfEOCPTCJNbbay/ruN/TKdqzm+LZlu3jQ3t749kOSI24+bX9ge+rG3cMYAV8cx7zLkOn7Ooa28MqGwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWZhNUqc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWZhNUqc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4vD7j000699
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5doLk99y/BQBx6tHm6rmyRjgyjHDIBKbmZ7562z09Q=; b=kWZhNUqcE2V0dB02
	Dy6TINSzNplcmyqE8oahY+6kMQFiEhJWuFq1iYSuaGoDl+tcixwyWl3OdZylw2qX
	YS2ICAozNk1O6BhXqQGWNM/PuQkweccACVrLh67FXCVlYdk4R3/DhvCJwRja1Kod
	yIHwbjNF4Ng1H7G/jecyLb4303ZwalBtksP/TWeZE50ATzSDxVSk1hRFxoYj7GiK
	+BdQvfrYiqM0wj4C/kVOw4ehBG7E+oMRmHEftPrHwT0990vKuEflnB1ote8p8fRE
	DYs9o6Nzx3cauYRLClGk0EmnDCx2yRciSKlKhCwvrygEDYX/c33n3fz8a9cDyubk
	TjDq+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd31ud4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:15:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f3766737so2672746d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362910; x=1744967710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5doLk99y/BQBx6tHm6rmyRjgyjHDIBKbmZ7562z09Q=;
        b=GSdyc8x12+gNMzNgZN5bRm5aGI5SDRilxCE4sCktZTK/c5N4DJvrrmNVziw3StdC6r
         DGKyhyna8wGidRytwTzOsPjn6w1iBZtfu2mvQZnUTqUgGf+JMak1pta+3oFQRQQDybp+
         OiQwgC7FrmIEg1wFeFdC8TpHnywAeddklDNtfwogTU+/VWpSglL1ZBrNTmKUQKsKcZZK
         L6duc96Y7vBBQn1gpT67nLQisB5omIeXiF0xW79aU0EQMB0w8xtKRErdmcjZK8v3tz6q
         qeTjR8aWR1KIl8bLcqmjfxS32ivw0qlo3DVAB0mW++P9ihz9LgLw0wydOh4WHGpxj6Lr
         qF0w==
X-Forwarded-Encrypted: i=1; AJvYcCXMs7jsWTkr0EAW1sJRcVrrnvPFgcKzItgfEz5RaHlpdnR545bt6Y5MtJge4CnglU8rZ6RzuOhAL2O4e5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkqQezAkSlGJCKi7WXOGz6vOtjGuW7p8Zy9Rj2l4A1FPVex2c
	3rLJaRIaAfl73N2pmaAPn6uhmmA1eFo9FX34uHqETD2zp/1HFyjObGFLfD+EeVTDLBkxTuDWVe7
	zVu/dyuPu5iXBy1QXrz6IObuzD7LHgOqBJcl0PgFX5audQ9XATmN1s10IgM9Niqc=
X-Gm-Gg: ASbGncuPHK6IowN+kONh9TkZu3vGr1dMyXVjjzx/uzKK8zVNCsKmb/QZSIPvZniwZJM
	z/UdEiulpLdYrB2HDn7G68vv+HuxgdR9JxkAc46vjUDXxXJF+ZZHybblBqXey99IiISUkW+6Fc1
	RPY7JBL+c6QZCdAxYh2djoGIVl6joJ/42cngig450FHS4Gbnb+kXme0+nGsTqlcCzLdU2GcdYjA
	3nqjKqJwAFFoGPT/W1zdu9OyGNLf4KXUHlIRcW0SzO81TkSHsTGTZpHhx8bTEAv0XXrk8djzB/h
	P0IYCu/pimS7RaR22cytHiQPGLhMcEp0Hsgs9RXn34cEXsNDGvWXro1qI6CwUR7xqQ==
X-Received: by 2002:a05:6214:212f:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f23f1679e4mr10552076d6.9.1744362910108;
        Fri, 11 Apr 2025 02:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxpGlXszdxNQCnjkhwWTXgQ8wOks/BBU6emAo6r1j/KIqv8QPgKc0i8th3uVqdCc0PKf177A==
X-Received: by 2002:a05:6214:212f:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6f23f1679e4mr10551796d6.9.1744362909745;
        Fri, 11 Apr 2025 02:15:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acad99c4456sm25883766b.110.2025.04.11.02.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:15:09 -0700 (PDT)
Message-ID: <e2cc6dca-0c7a-4607-a23f-7623212dbd8e@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:15:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: Add MXC power domain to
 videocc node on SM8650
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-15-895fafd62627@quicinc.com>
 <12986cda-99eb-4a1b-a97b-544ea01e2dbb@oss.qualcomm.com>
 <44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <44dad3b5-ea3d-47db-8aca-8f67294fced9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gJIjpLw_BF-HCx6cfFw2qYWKO53s47Md
X-Proofpoint-GUID: gJIjpLw_BF-HCx6cfFw2qYWKO53s47Md
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f8dd9f cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=hak5HkhHT8-G3VIbWWkA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110056

On 4/11/25 9:16 AM, Jagadeesh Kona wrote:
> 
> 
> On 4/1/2025 8:57 PM, Konrad Dybcio wrote:
>> On 3/27/25 10:52 AM, Jagadeesh Kona wrote:
>>> Videocc requires both MMCX and MXC rails to be powered ON to configure
>>> the video PLLs on SM8650 platform. Hence add MXC power domain to videocc
>>> node on SM8650.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 818db6ba3b3be99c187512ea4acf2004422f6a18..ad60596b71d25bb0198b26660dc41195a1210a23 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -4959,7 +4959,8 @@ videocc: clock-controller@aaf0000 {
>>>  			reg = <0 0x0aaf0000 0 0x10000>;
>>>  			clocks = <&bi_tcxo_div2>,
>>>  				 <&gcc GCC_VIDEO_AHB_CLK>;
>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
>>> +					<&rpmhpd RPMHPD_MXC>;
>>
>> So all other DTs touched in this series reference low_svs in required-opps
>>
>> Is that an actual requirement? Otherwise since Commit e3e56c050ab6
>> ("soc: qcom: rpmhpd: Make power_on actually enable the domain") we get the
>> first nonzero state, which can be something like low_svs_d2
>>
> Yes, commit e3e56c050ab6 enables the power-domain at first non-zero level, but in
> some chipsets, the first nonzero state could be retention, which is not sufficient
> for clock controller to operate. So required-opps is needed to ensure the rails are
> at a level above retention for clock controller to operate. low_svs was choosen since
> that is a level that is generally supported across all the chipsets, but low_svs_d2
> may not be supported on some chipsets.
> 
> And required-opps is not mandatory for MXC power domain due to commit f0cc5f7cb43f
> (pmdomain: qcom: rpmhpd: Skip retention level for Power Domains), which ensures MXC
> always gets enabled above retention level. But it was added to make number of
> required-opps uniform with the number of power domains based on discussion at [1].
> 
> [1]: https://lore.kernel.org/all/eoqqz5hyyq6ej5uo6phijbeu5qafbpfxlnreyzzcyfw23pl2yq@ftxnasc6sr2t/#t

Alright, thanks for the explanation!

Konrad
