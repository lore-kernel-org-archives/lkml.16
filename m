Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30BE2D12EE
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073063; cv=none; b=A5wOB2wZVgl6LuMPxXAqr/eQgJW1RUs1lwnJzZX6xjLv0VNfkNoZmgz8bOGmQ9VpFXMUvPJRIAOeu96kUEjiCJuxj9q4Cuznuvgl0Q46DA0tPy2jNXa2WuDY7mglNh82Sy+28gx8f5TA8SPLc2zOomP3rMZCilOvMgwqsO/XAJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073063; c=relaxed/simple;
	bh=7Y91ERdcVYXY+q+iTdAR87r2brMmDkMx7kZ5H1FMop4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXoOjGjyHQyB5aCMXxw7jEFHgWpbIfMKN65DvdWmoBGXhbmJeZc1tevAgjPdPG5FsJuXsbCafPl1ni08RtyX7338r+nrZsan1Pw8ppXzfqkmxr9VUmAM5WZRNsi9Y5PRlGq6Rp+zBY2+MM7xWw5av2sIqfpsvHoe6v0iQN0s9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQX4w2Tj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQX4w2Tj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Z3xe030943
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7f5B0gAHOa6XpZ/ifKYUiHiV0r4VkXHs7gOP8WPIMI=; b=pQX4w2TjQfxTY0FB
	j4fuu21HXbdwU2oh6KriUAgAcGFu1e4Zku7y6cuZ+JlyO61A6aHawEG0UkIUwRzU
	8moiNV1Gqin3w7gPnDRvuqln8SjVaK5mqNjP5juOwns9OTRNXRjCIM89C4hUyN0x
	bs9+xA/M+wsfIEhwzaOdnDv2GIPOULoKtZAsUYPjRLbxRJVdqPMOXUaei2kTcDK5
	5VuqAQEC4itBZfoeUanCTSile6o8kWG9yuiqXXUhnbXn68k3hJxBug8exP3cc9/X
	uJU33b/1eJ6ZCXr1ti9BM27WaPv+62Jd/y8peOjWuZtzanxewv+ZI08UCDx69q9i
	vUhNwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crm86h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:24:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3487d422so60515386d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750073060; x=1750677860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7f5B0gAHOa6XpZ/ifKYUiHiV0r4VkXHs7gOP8WPIMI=;
        b=qhJYzA8niJLwg1INs7T8se744Oh3nX+S6luKdnGeh9KZOsFq81x6bSY2dGo6mQ18Hb
         z0hLUd56clGoxbKAJzL3vJ+CmJebx4+h59CO1/Lhp1/eKmxPx9iXK0Hdyp33Lr9GtPt5
         KZjfkkDdMlnw9Ssm21R28c01Zll/lziBb5lY1RodMU1gEDQOjLMQMsT/Y18DixU/X6bX
         ZKzKXkakmza4oI9bnK440gsj7NumyRqkR0cUwQHB0L8D/SnkXdvXiS8xFQeK/wb3sssi
         fL4MHHqoXw3SEHmsJVpSzvxxRwggf8bgU6PsDm6ABfSgXJcGyMrvY969PPnEuuJFskAf
         b9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVtBZL6xXm19fRTmSh3dobCuOxwVJhxVSou8m0s9LM3EBkULacFHa97/IaS7wmVnciNy46zAYjOnlmQd1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzx7lvEkZuqJcIKN2cvTCBuGbMVO2AOiR50RXzZJN6c3K3OhAt
	uC7RnRyLHENbtsMKkFXfAaV37FUYKgSGHssCpHfGIA80sP4lTocIIU0dNYUpexaDfMBcWc5e/Im
	QQoQVMuOUAdkZH8b14nhzNpk506zrSC46IbmVBmwdDuLHE6o1mGTU6qHuvjexRQ/98kM=
X-Gm-Gg: ASbGncscv6v7Je42Pyz2baX5LIea6/en9rFZ7eEpoUy+Z+HlCP+xK969/DlD7XgQ9Ht
	g1lk9lc873yDhrFdumUK75UlIxPHdaPzo81hRE2Fm8MzdZMw9HS0JESp8PN8fx+OKnvMz+hnT7U
	1G1kTLdLFXW7CcosbeDxZWXUYIhXDJdFlnf0IYADdyk73U3dGmM8a0doE3HAUmGyN85OCiMA3dN
	QEZZhqgFEMmbyl7eYoSSgdlqgjlSvyCQqldiEbeaP6GT+S7UCHvVrssEwh9KiOg3S0ZZpHqfLf8
	QKRQ08Pb8F0LX4Wk6pc8a7N9qwe0qa8DtDi+Wiq/LGkRiJimE8mCFZYW7UVjoI1bmpah1cc9DUa
	bCh7ymLL0rEDPjbX909rAzfb2XaO5DnC3rnXutIKRh5IICMeLEjYKrBMCPwPl1cB2WVJjJ15dBl
	U=
X-Received: by 2002:a05:6214:f0e:b0:6fa:cdc9:8afa with SMTP id 6a1803df08f44-6fb47742e14mr134573236d6.17.1750073059760;
        Mon, 16 Jun 2025 04:24:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtJiyfX3QkCFTp7F0FQi93DKQasR0p5XngLtnM0qsj5HwT8bo/bstISR/2JTMNMtQS8XeUQg==
X-Received: by 2002:a05:6214:f0e:b0:6fa:cdc9:8afa with SMTP id 6a1803df08f44-6fb47742e14mr134572686d6.17.1750073059250;
        Mon, 16 Jun 2025 04:24:19 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a4:c3fb:c59f:e024:c669:a69b? (2001-14bb-a4-c3fb-c59f-e024-c669-a69b.rev.dnainternet.fi. [2001:14bb:a4:c3fb:c59f:e024:c669:a69b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f7db1sm1506770e87.235.2025.06.16.04.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:24:18 -0700 (PDT)
Message-ID: <6463f18d-b258-4773-aa12-d3ae3af60715@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 14:24:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250616070405.4113564-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l3Ti7cSRob43M3Cckjnuv3W1G1i3B_u-
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684ffee4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5ARAolRv94kXMxSVR3wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: l3Ti7cSRob43M3Cckjnuv3W1G1i3B_u-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MCBTYWx0ZWRfX5R3RRXFejcIs
 afzIp2wBYXd5Bnx0ozpfaANAXehx3jIQ25rUKQcURSdiQc8Hi49wfiIFKAeb3+CmzwbdBUZ8KVl
 kP5fjBvof1CWdQv2ZSHlr4JsMsln6CcN+PNHFfFkNR6P6CYjtWEsXWgfy2InUE7PT7wdHkDdsJM
 XPZZdnSb6OQG4GkwY9MNb/lqiBEASv2BAwYEorSDznNicvx/Ij1WOee+l+VE1IsX4eCe1RUGH8a
 RF3lsqKAAlsfruh1tfbqo2KNvsP43X0GUYoeSGGM1VgYJAx2r44WhDNrKMH3jCqDKAb4x+kvLN/
 gY8mjgz1OVSQwttfR+vQV51QJSgpiZ+KMVhTdvvO/42kR0M4enUBZ5GOHKqPDGwmjjVlkZglQnb
 TfGn1m/hQ7S6q7iWYOVHX/Ao6YhHENHNYUtUn6/ELxh9+9BDg7+kIlXNesbI6+nbfL/BdKNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160070

On 16/06/2025 10:04, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index ab161180d1d5..d073c6f95d4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -5,6 +5,7 @@
>   /dts-v1/;
>   
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "qcs9075.dtsi"
> @@ -21,6 +22,57 @@ aliases {
>   	chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
> +
> +	max98357a: audio-codec-0 {

This wasn't sorted out properly.

> +		compatible = "maxim,max98357a";

No SD_MODE pin?

> +		#sound-dai-cells = <0>;
> +	};
> +
> +	dmic: audio-codec-1 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;

no enable GPIO, no vref-supply?

> +	};
> +
> +	sound {
> +		compatible = "qcom,qcs9075-sndcard";
> +		model = "qcs9075-iq-evk-snd-card";
> +
> +		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
> +		pinctrl-names = "default";
> +
> +		hs0-mi2s-playback-dai-link {
> +			link-name = "HS0 mi2s playback";
> +
> +			codec {
> +				sound-dai = <&max98357a>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		hs2-mi2s-capture-dai-link {
> +			link-name = "HS2 mi2s capture";
> +
> +			codec {
> +				sound-dai = <&dmic>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
>   };
>   
>   &apps_rsc {
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 07ca6dd4f759..968730da180d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4711,6 +4711,20 @@ tlmm: pinctrl@f000000 {
>   			gpio-ranges = <&tlmm 0 0 149>;
>   			wakeup-parent = <&pdc>;
>   
> +			hs0_mi2s_active: hs0-mi2s-active-state {
> +				pins = "gpio114", "gpio115", "gpio116", "gpio117";
> +				function = "hs0_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +			};
> +
> +			hs2_mi2s_active: hs2-mi2s-active-state {
> +				pins = "gpio122", "gpio123", "gpio124", "gpio125";
> +				function = "hs2_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +			};
> +
>   			qup_i2c0_default: qup-i2c0-state {
>   				pins = "gpio20", "gpio21";
>   				function = "qup0_se0";


-- 
With best wishes
Dmitry
