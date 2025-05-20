Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB222B8B1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757329; cv=none; b=YgKzVScheC0QDreIsshiAqgx3LidmRkKjl6O/0QmAqWqlHaVaRboIvZE2EY5Fv6SM1k2p3QoqQhoFCucavmQfbC9JWFjS0o95oICa49l+KcZZCjQS+xbMsPeki636g0ymafA4zqgIgGBbt+aaN773GXBiENi4LKRMcFj90/dVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757329; c=relaxed/simple;
	bh=wYTaVwvNsbAu2UjkeaZU968DhSOzxXgvk2nExcpMZ7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWd/4eWAUkF2Hjm95D8k2Ydtogqvc8TABP6j9X/Ez/Sv3fgGbM2TXVnylaunXjYMpTFRiKMffsW6y9hz1AUNntF5QcGEDxXX3ogvobCmPwOTcf/QSfzVvSbL9Rlt23fgz/+6ezb5shjBh8vIApGaDmjqgVLDawW64iQ5Y0+1pzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ls9reJSI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ls9reJSI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7KXW0000806
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=; b=ls9reJSIc0Ps1nQY
	X6+XHEewVfzKWf+aglBFzyw+7OddUtb6MPYGZ9flKuW/4FvbRW02V8u19R6r7oqO
	s+c2ya58YrsNTzHsmpTuap/no0YT/so4QVwUlJjqj8GbPG5WfEgEh7yXwW+ML+MZ
	9koRM1/MAR4741n8D+iw1ltdbwrkwt83XfqfZwVVuVKDx617Akwebml1UmJaWfgj
	DyibvQ/L1ky+e0ckVYoilFG2OvHXWNQnRKnA0No2IwFzri8OuwpjZ5VO/W8CLPBC
	5iPZBMMtC2LHgz0Ng8IDIlrNEBwvvZ6t1v+VSnbDpGFq1mu0TIIiyCveJx32M9pV
	nll/5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkra0bj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:08:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so7433336d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757323; x=1748362123;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNBYPSDwYBwcL0JlUFsjFsIcMrNE3FHeUbnIgo/55M0=;
        b=HBBMEkTRVTE8pKeI2oYkXx/rnqxHcPG+28JLMDdyYmCbd8pBO6Is+UZvCkoQytGQkq
         VDef5n6PichthK0r5oHl2H//295lYyF8CPlPw5fZHuL7WelQWvKMeccX+ooj27igGwL3
         LLLvUGZftN9kcKBjzZxhYRQrLOLLV53e7yUbPp7GlvrtU4DrtymT7PsXUwcRuFyN8yjy
         LbNEgKWJiQJ1XXjk92ERGoABJQBKttwJCd34CktDohy2nLFpbWqyCB93xllFaXmXg2Wa
         x891kMrKJo7NHjtiZY6DDfd3CTlCevazurYywfDvkAS01t4s5amj/VImZxVpRj6y2vD5
         IqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3nOTw/C9EK7cjUvzl9PMsgkaq7aVbZC49GidFoF1gkSf3uIMSgweHsBZFgKPi+o+hOZ4ro2qW1VwEIDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkQeCGfVL1OOeUzgYWqFM08/9HpFXxnXjirhCq2Y92zR43bpvX
	OwOKrbO2tmx/c0Xqi7hHZkjMxmWlnphWrLpPLI/GdQ6uYyA6vArpD2XZtTRjtvKfbXL/9An53sk
	jQ6WBN9VgmeDVpLiR+79QzQzIpu/3dXUXiLVDhv0dk5iHs673Wkaau6mNNjRtN2laNG4=
X-Gm-Gg: ASbGncsQp0UD/Y3xbUwrGquIHfxFN9tb7jITEOhGPt7txmm1Q2+H4up1SwNArI6b2IV
	a30a0Lps0vxlxdpDMMzrnp+B3pUn7Z61PkaRy14Qms1ovMMYYR+607J7ZrSr6d1mucDX0qHeGpT
	QT3G3sak6J5EQJqccmdkj6OnPGLfAYuDlf/SNhjuFIWdn+DjhA8mwrjdaWUVWUJHFchQFCSFKEH
	1I+0GQrAp0kc6uhAFB4LPwrdB8UBnIDUY95C/4tKtAmL7RiXkRTzHS/130r4K7SiOF2IwOMIIT9
	L9ibEJphndS4Fc/Kzs3fnq43RDRXYpXXGnd3AYUohu42ro1dHa7rFEoVj9LYujKoxw==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922396d6.3.1747757323166;
        Tue, 20 May 2025 09:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvxo25X0xwc+Sia4cHOSRvAs8I2RKXQTr31HG6wPXMbAy/2Bmn5DJMjpgKZAqen7UvAExheg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr101922106d6.3.1747757322446;
        Tue, 20 May 2025 09:08:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d437585sm740241366b.115.2025.05.20.09.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:08:41 -0700 (PDT)
Message-ID: <898a2204-f129-44d0-9f73-74370524112c@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: csXuTilCyhVhkVkC3js6EJRLJDa4XZkp
X-Proofpoint-ORIG-GUID: csXuTilCyhVhkVkC3js6EJRLJDa4XZkp
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682ca90e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=IC-rWu3oLdSMw__OBeYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMyBTYWx0ZWRfX6wpoa+OIpbkk
 ZniJgTB4g5bMEaCvhaZfjgWzzzPYknfaqPV6gawmewuldK6biWi6QorrUv7Y1U1kYUrEM79KJoP
 km8IPFPSOIrshNjtMtMf1BlfX+au7gBNAgsOz8iGDwv/Z5Yra0Fr7N8h/KifIi38xcwxnsJt1fe
 S7QG3TNvOfBHZIT50JvmSA3dYYgEs9H7ZkB5hrGDxS/e9C2k6T1sL5u+irPFYIcwB/JyTsMna0J
 lTm7/F5pFaH12yOhkpx5Jr92pYD9w9qjooMHyRjMHaB+PMFE/7loVafjweL58R6jDdrelCC5+vb
 p6ZgqtM5ZbCV+piDHM4pz3cie4G4hMm6VDF128J4jqGn8nemBWFjGleRmnvnl8ZM+GyBuKwM49U
 fa+eKqRWYd2xb/9vPDRLSoCQQcgX9LbpzI/JBitj3GY0ezevZEtnr3IjTSmq4HqYYQR8yu4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200133

On 5/14/25 4:40 AM, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>  1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

put these two above status, please

> +
> +			reg = <0x0 0xac13000 0x0 0x1000>;

0x0ac13000 so that it's nicely paddded to 8 hex digits

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
Only CCI_0 and the SLOW_AHB clocks should be necessary

[...]

> +			cci0_0_default: cci0-0-default-state {
> +					pins = "gpio60", "gpio61";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up = <2200>;

Please set your editor's tab width to 8 spaces

Konrad
