Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281891632C8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035604; cv=none; b=XyLa/5zw4dmUrWg1UI6f02Uz/xuG6lvn3wGDHN1hTTiV445dCtH0CuRiYy87aMGsST9CMJHtruVQUAIM+PhTeQmNZEBC5xhaCzsAokVngU+M+7Wi57IvcE/zUm1uQwR4s7CgpAe9KnzKcizA5SEVNnV0+c4iizfGW3LiSwlJa/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035604; c=relaxed/simple;
	bh=sILD8tH6zENV0PMgxasm3/T7rbz9dx26TywcRHXzI5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bo9m2qbcU3y4pfiONQFPTvlsBpb3JDRnFe56D6LSk2eV6tMXChY/844h660+Sxg22WkNT7k7AXr1F22cMemhCscDsF9e64wgRvPqKL50XaDl0AuT9lffVRrlq4zDD8vmByJhtseAu3eSFwPqOFRkmxi4WAUC4OjWMXZKGkQaa7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EabCxAAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EabCxAAV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMR3Y009550
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7w0AhAyV1EY4/EuI5ZGZ02Oew6JczUUcSc2eq7tlKQ=; b=EabCxAAVRoUDc93t
	K6OrEqUCQSXe5+lQY78gK3u85dD7rNH8onA9bEt/keU6pKEvJ0Yt+fGdvT9JM/kt
	1QnJ/Jh8fTC2gVgFpFvxajJmoVE5SM0XRcHpD86wqy63MfUoWISs3ItrykWCtfob
	L/hgwGbS7Ik5ZEcUtG+lmwDgdEhIp31fwAYdthh/gWwaeVNSkBats17hfiIj/vqP
	ZpOw48txSUU2+5vmuSPkvSrJfWFzra9kUF+wjr3oBZ0jCsqU5fZL0M42bSzRF/s+
	GCnKRI/SNLt6xG+S1U2aQwqW87qvvQeH+lH3nOQ9z/Fboit2VtyRz784Q/PADtN6
	+5MttQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b473pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:46:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso34246885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035601; x=1751640401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T7w0AhAyV1EY4/EuI5ZGZ02Oew6JczUUcSc2eq7tlKQ=;
        b=cZiH3psSHsXVo/VKKleExu4BXNQNTNYDbcIVwaxGl7ho31r3UyIuQfjzrB08ma8NNM
         ol+hJGYcSJiurukv958u2RIrrtuVI37nGv4M5SsWEFU3JExxXvopeIHHB2XQnGQJ1CRE
         tIVNK7lCV2MpU6QMBDWr3CVJntRqysA6lslDzgegsnWNyAC7gsImv0zvRram6eWAqqEN
         511TNGlWXil5afBoODOdE2b+jkb7RCx9MNu08sHvEqk0Vof/GOQ7oBKxwSIrAzyWfTJv
         873yaeLJHzuZJHhJK6cjPoEBGAQBpEpxZpzeOix+HPzhhQJ3GQN9QFNf6lI9+JgKAhou
         l47Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFEQpzR7GmAPoYncN7AHP68tfxlLZUgZ6LA7PxFrTozATkQs2QNmHdbdvHw1ZR0yO9pDAjggGaKWavxtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2OEOs4/6DVRWZ9jgmg3YGwQjgWDSvTxlxncTwDPLKlJJqS17z
	/0EqY3qfalP3fjxdror73j4J9YgJXOg5R21aKwUobwpjahwF2nO6Btp8EbaL5HHvA8xVTU/fOx4
	fOC3U45DvTvK6dROCCRWHPCqCJVYAlqePI3Kd/IS264jBogZsm3/JMP073mU9FDsjPZ8=
X-Gm-Gg: ASbGncseqZ5/Uc7PqaP8t/ampl1v+l897lAZybfWFwEFSiJ6JsG4wX0SzlP4G3+0ACi
	Km0OqouDsBJ6Is7jQjAPlK+w0/6U9SWcX+HQ3cQb8jILraRwWdKFdA8FgHT6WBsRBevVOVIiyTt
	akLPdO8A5eJAQJzOuAyyQ55NRR22IahGJZmJH9TG3RnqlaXPYOYH61LtBFXy+VRmTutzMsWyyjo
	8bv8I735AlxGwAvT8bqcS0z4rlvjorZQxjuDmQ79ANd67+KJUuwVxC9r+TGu/j6VgHEhjIB1RxA
	xalB1fkqJbB4VA23JdVXh0HL5G8N45rW58mVUfTIUorQsGMLpnhCIwHhVtY6lSJcnuCvQvL9Rzg
	rtSU=
X-Received: by 2002:a05:620a:bd5:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44396ed30mr191584385a.5.1751035600825;
        Fri, 27 Jun 2025 07:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3cvaIDX4f1oVAr8XxkmqXufKIqRhKzHxi4yp4lSQHsKZaATQyS6r3lewgu4Ei9TeYFwKmKg==
X-Received: by 2002:a05:620a:bd5:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7d44396ed30mr191582385a.5.1751035600310;
        Fri, 27 Jun 2025 07:46:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365973fsm133783366b.48.2025.06.27.07.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:46:39 -0700 (PDT)
Message-ID: <e824ea10-303c-4d78-bb92-24320c26f84a@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:46:37 +0200
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616070405.4113564-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMCBTYWx0ZWRfX22OXWyaflpT2
 tESVUq9Lh4tKTHnOjiWZ/8mBnR0Bpaj48l5+uuiOgncTOMFEE/4AD12IXA+LFqvOLs/brnb8qQA
 8LDztubXGEBSM/h6bvKZXjgjuCT+7Jl5dMmoboVk77M5ub7ENcJXd2LRyTYne5ZurHxFry5K8tI
 sEVO7LQfvMDPd5GySZLzxE6woMbMOZoEiD6dKxhHK5VXPnVdvbVCFHHASZkhz+5I96lmSBeH/02
 +u+CCJwD5K51eb8far6IQwXOpJRwbQfMyi1KS0x5tNlnKwZLL6avc70tehATyHy1fOpos87n6vu
 aiNIV9v155CJtVVNB2WVuTWpbGvONTFNw2p1DQ1EodaFZlCpZqdbo/Onz2P2ti8kRp6sDnKjLOn
 Y/UHlnKJVLWCSBn1xug9xr8scmlLKdfZnmMzzPSOqyBOQy//LEeIB/tRinmQCHsHEhzBIyAG
X-Proofpoint-ORIG-GUID: 11BB2SESmVS5HcQB24F2GGzp0aS0z-QL
X-Proofpoint-GUID: 11BB2SESmVS5HcQB24F2GGzp0aS0z-QL
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685eaed2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=RUmmF2Cuiqa3jFE6LK0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270120

On 6/16/25 9:04 AM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index ab161180d1d5..d073c6f95d4c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>

'r'egulator < 's'ound>  
>  #include "qcs9075.dtsi"
> @@ -21,6 +22,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	max98357a: audio-codec-0 {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	dmic: audio-codec-1 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
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

"HS0 MI2S Playback", please, similarly below

lg otherwise

Konrad
