Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64C1F0E26
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748193195; cv=none; b=WU8cknXP3SbN9I1Upxg8Do3GI6ow9pgs3asf7Qd1HiYUJAudDo3zAD+PJMvbfpSwupo4XlFfGhYoM9FQJX5OeUF/pOXlHDnjfr2Ch864cBGrIeOvFRyNy9Nf2AnjUb7CbH78aIGFQV4L0VzHtsaOz0QIkdJhauGicNzioqy3qmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748193195; c=relaxed/simple;
	bh=I5ZR3FF82SsvspTEqF2Ta82jGt3jr3/1NWy23/LVojM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpjGtbyM+tNoaCi6NvvENjKiF4rDuGBfEuz/CsbElfJ4DUkuT5kuewu1ojjfRjA1qwSrB7mMSB2Je3EsuOAOW1JKF98fQjhy7n6eBSPTLXvSTGAN8h4uLk8RS8jx0uBKbEpDg3FHvbXtKYGASe8n3n4ZGwmPudkUrXNF9/9tTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkLbjRu+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkLbjRu+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PFX4YH027567
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GfQcrit3isg1rD3lf7/k9AB6FJ0WubhCzrMkEn3mXI=; b=LkLbjRu+7uyDduYT
	1aTdldON6OIg8yuZ4p4HjgcGiomd48EnBwE7vJqoda7oSBUNWXFkJ6veEyQXvJac
	7cOKQGI00HiGThk9uvRJAhTm03RYDdRlpehmTreLyQFJfPX8949w9Rut84pZdOD6
	0uqSsouoovvxZX6dZdC9fT67o0cziPBbzWZ5igMAgGp2/alDTmU0dKdkVDWk95kh
	5hQ55JmLa4RZkI9GhCLt49nIS0MRx1eH8BRgeGDfsI6tAqEZGYSiwbqX6Em7PvLj
	sjMTHlHg3F+lW+8PGm5WoDRsVi1OiTkju2WlTZIYZb7N7Hc9tvy0lbDJs28Km0H4
	CBPrZQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p25ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:13:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e23d6657so26238636d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748193191; x=1748797991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GfQcrit3isg1rD3lf7/k9AB6FJ0WubhCzrMkEn3mXI=;
        b=gCx0M+to/FWooDkee6pk2hcG3es2ToTURsfbcm5+bfTkyYcMpiT3krSkZqLMtsA0Gc
         pfBLTJlPLN2udro85KWnG3+A6DaSteOh/VRsmwRg7wJJ6JP59NrOVYyGDoAV6HQjxLcH
         w3xyMgT0emifaSGq9UcHefmv/rsBHt4AXgP3NFKQHfbhiMDaC97NfPdPA1BA16PNSLNp
         HTwspnTGpago5KR4BT+Eqv95lu2JF85Vf9aCti0Mg2T5XA6soLQP9X7Bk7KxRVVCZfJo
         XmeWh7yRXaHApbe38fXpUMkklMM1eORfo1YLEPihy1fZLp2Aql2ksdEhKKSWCdoc/YZh
         VtLw==
X-Forwarded-Encrypted: i=1; AJvYcCXDmPIpZ84I/Hh91X2uu9O9VhDIAbjk2qmZnO/HIisTiEq3nbUIVs31ozgdTb8CjAg7tJbwtjRJy+qY5gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOxbJbHM+oXfWZUtJD49kl3s7U4FAf9s2x4Y4ZOH1hWyohxhA7
	2OQKSM3Irhxm8CDlw1NnZp/AQtOZ4xHNYX3JyP4TVNah28e/sPfeE1QDJEL8KkNESyaIWgAeL5K
	DM8gkQhg0rfH2jJf8+el1y+7JEPgoQPv1hOIhUcH2mz2m1kv9WGfqVh9bfylwRq1ABQ0=
X-Gm-Gg: ASbGncv2mgpaZTar7FJYbHKTHZoJXbzO+Cr599LnMWDrNSoaVhQ4GHEdqx6D5pSSFSU
	waJnpkU2p13pJH2MyBWVtRucJY/SF2ZxPg6FGr8245q3zC9uK+T4tfXIBMnpckk7up7ortNyBij
	rJGW33elL3gZL9TNZzXwxnXt6jEdnu62IXlu7StfJKL3UkgnLEI2sXtXjm7vf5kfEurCMz19LqJ
	PaNrUT+lRIrWlPiF0g7fyT4JTdEBxdz6QhRaHbXW8BPB+RyvRDJo079yLi5XPEVdTziaMQOMgM+
	nbTAilA1iKOmtTdw99qaOcf12Boy3qoUrx/vQ/xWjfwHmd8jMHI6zS/f5WJhBg==
X-Received: by 2002:a05:6214:f2c:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6fa9cfd2912mr112515306d6.2.1748193191164;
        Sun, 25 May 2025 10:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLy0QUxrOeWfkESnbDjqayvG3igEvUkE6sR/3TpigvF16g5Xho+6TvOHh9oCRLT8RtmZm88w==
X-Received: by 2002:a05:6214:f2c:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6fa9cfd2912mr112514936d6.2.1748193190710;
        Sun, 25 May 2025 10:13:10 -0700 (PDT)
Received: from [10.117.217.18] (194-204-13-220.ip.elisa.ee. [194.204.13.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a77sm2795716e87.186.2025.05.25.10.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 10:13:09 -0700 (PDT)
Message-ID: <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Date: Sun, 25 May 2025 20:13:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DGMaCib385GlXIJwYa7XvtAJuJvNyayN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE1OSBTYWx0ZWRfXzATbQiJo0Csh
 p12rgmC3vA+cy9yQFxNx+ybHFYr2hcIEWLC2eqaGvKQQhS6cVBdS4Utz2od8wSnmPw/u7dAjj3k
 2sGCp1cqFAKB8gJMxiC/qTIqvShuIKnRpiO4K+CsrezdFe3PxFiVVBNQHdsses1/9d8DJ09ZY/E
 RpSMoXdVZ75MMjEK36I6c6stmjKQFSe2ptP2VE8SgRReM33XXJ8QeeXaDFFwwMaPFStad6uInIx
 WDGF1GkIcIfs0ykUYZyMrNoJgpNrGFIBR+Bw4jyrpCZD2yqXjk90MbIqq0W7DTaPulOGVbpJb19
 6CZlbjekwFigcUIbFW+izdwlllHTVP9JVWCGP+/OPiOESf2xV93BIwx0fAFGTW1jTMuJva0Qv0H
 IQZ0oLb7NKKhq/RaeUZI3Vyr9wH+Qjd6NwtFD61/043kG8VtvjMVrylq27TlLo/8tYZEkHWe
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68334fa8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=zsrLd+foqYdeTGXumyX8oA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J2ExMKW3eQPLhXUHgQwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: DGMaCib385GlXIJwYa7XvtAJuJvNyayN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250159

On 25/05/2025 18:53, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> i2s speakers and i2s mic.

I2S

speaker amplifier

> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker is connected via HS0 and I2S

speaker amplifier

> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index 0e44e0e6dbd4..1ebf42b0b10e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -6,6 +6,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>   
>   #include "qcs9075-som.dtsi"
>   
> @@ -20,6 +21,57 @@ aliases {
>   	chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
> +
> +	max98357a: audio-codec-0 {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	dmic_codec: dmic-codec {

Just dmic or audio-codec-1

> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	sound {
> +		compatible = "qcom,qcs9075-sndcard";
> +		model = "qcs9075-rb8-snd-card";

Were the bindings and the driver sent? Cover letter doesn't mention 
them. It is better to send them as a single patch series (this is the 
case for all subsys except net-next and trees maintained by Greg, e.g. USB).

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
> +				sound-dai = <&dmic_codec>;
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

-- 
With best wishes
Dmitry
