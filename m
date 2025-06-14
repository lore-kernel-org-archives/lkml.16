Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A127713
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749925853; cv=none; b=RT15gaBi/llcqdUpdmJmegZRE9pdDaBECwSPBw+UcW+HlMDQS0X7A8Fr8j4fD9n7mg/mYzzkhgKwtGDLX0gZQddUoQciosuTAFdEAQb/caGIQI8Q/VNOQccXZJ69NKcGBBZdCU+EZQX5g+bZ1S02tzUZUDVupGcNDO9IlnauH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749925853; c=relaxed/simple;
	bh=DwhzSolpHnQGsu7k0rCbg3BfE3JcSr2XRBcVKat7fLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTR1nsbGNc7SASl2JgFX1B9ypyifCKx+aX8wwTmBfc3ckg7DJke00fYQPKBdm7D0FtAoKe6w90rqYhiXpnHLp+F9pEdLXG6uoefAukrom9pnyy/9tyExyuSsY/zUzVH7EXOHcONk3i7aWR5IXqG+J8k+oV8B0Es+L/GzcT9pKjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gySbz4hr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gySbz4hr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EI0HLE019636
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jjhG81loWz4RuioBU1R+FIllgioIfWaqlYvlaoEHAU=; b=gySbz4hrdkqdCepZ
	9l12RES/JwyxMLOrOy9YhSjAcXvRWqdeNkaOX+g4NdD+eUI/HTu+SLx6uony7Ssw
	fYhA13rg/0QzEFz9usYXLWWtQJa/rTqwA2lJfYjGY/cFP5BNt2worMN/+JQPBT0X
	uNN1Aii5hnrhiaIyFFULo3Bo3uD5O2AmCqR2BnV0auCW03owhFc1r7ARzsyPDhIR
	7jFa6ObeFbtYeUVZAIXQBzYFwg6gw/l3YxI2WLktOxIZ1UaQ54QdYNn9+2HaGFrl
	1hksYgGTF7vWd/ZO+JpeJ2LjyUet98tdh0wKrEcdvV6Odko/Iq9Tj6spcDO1VViz
	ZzLitw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9rthd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:30:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso98184385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749925849; x=1750530649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7jjhG81loWz4RuioBU1R+FIllgioIfWaqlYvlaoEHAU=;
        b=FGUqZYHN76xIJFEbGYlW1nQKiSK4Dmqmrvq+Kn07Df7GiSM+gwVMyShqAUsYVNmFh3
         fy9RSw0mTtxFmSI+Q9zXbAkhvGvhq/TRB6BdyWhDDBo9Q5bCoYIZ8lxxarRURlAdP62z
         YK8j8eKn3U2N5TaRvT350538j+cgqDei/9B+CgyEAYugUvGOaqcEGemsYBS58R9SvYQm
         JlwvJbOePeTF6Q8dYPYFqJP6iSGZZLPLAWofm5kVxjtA/dZ9+nUvn3Bw8werVwazF20p
         y3CigsulWl1h0WZN6PZVKBC5HdSGpFlfnsqwMeVvvhhNYmXdZEUcO2KypV6Y2kJROp2S
         aIEg==
X-Forwarded-Encrypted: i=1; AJvYcCUrNi91cJioDM0iFT5QofRv4K81OCNhW8MgcjdGmuuZu+iNUs8XmP3mlE/9Kvzrj8hl2De8FakWh6hainc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFOr5MG+iCwCBai4vU9JQbEgUmnWxaQBpoIZgIhzzSXJK0Xa2
	YPGssfXdVtAPfYZsVNSuVGveWNlhFJy9cXP3OsdNITyWhPjXuK8e0OI9gMdny/bVdbkWeI4z3S7
	gQDj5dG4+qxdPkwwG5KEPEjux07hMwMxZfzq10qZGipDiVEIn/TNGqYinB4UK2XVUKz8=
X-Gm-Gg: ASbGnctiZs/c3PwMCp0FeY7deI3SS8cPTbmunrhH3osEoaGYrkPMc+pvSAoI+nwUYmY
	SPX9B9F9D8xQN08KAnscObULXJ53LALrBYTQVaKA6xR6joeMeKqKJn7zfJxAONnJDqyWpjxdNDT
	J77jHDXRy2nCNP+A2/EmD7qgXZbZx0RQIFRF0GHq403tl18bu+3ScU9dkv8qDdtkuE7nZj9fmgZ
	l1ffRuGq+xA+pO432Hne7aA9Lb8cBbolpNMWQRvmzyPzQmaA6r9u2F/olOSfWiWj51Wcj87V1Uk
	AQqqwaSRp8ILXPud1zVesuDYEalwZ2xvo8ZUGO7sgj3gfCO+j58bboDumWEZrt8naWNk0JQitCG
	nQJg=
X-Received: by 2002:a05:620a:d89:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3c6cec2ddmr231099185a.14.1749925849432;
        Sat, 14 Jun 2025 11:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvFTUPPrRoF6zayeHhnBj8mBhdSWc9gdeNtd3F+nan7ZgX3nBmd83xrz/enT2N6VHXwJAaPQ==
X-Received: by 2002:a05:620a:d89:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3c6cec2ddmr231096985a.14.1749925848982;
        Sat, 14 Jun 2025 11:30:48 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1db714sm906822e87.178.2025.06.14.11.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:30:47 -0700 (PDT)
Message-ID: <dce016bb-b12e-4ffe-8042-4e39c29b0e77@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-1-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-1-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RIbK0sw8jjebuOe3ay9rSqgNpQnGM-hb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NSBTYWx0ZWRfX9GCy6AdA4soT
 tmzAwe+Sl71eWX1e7Ne4uw1eohiLKN1RLMxo+LY0Uc4M0cJHgjuZBF5Bj4RAgK8Blx9sOfVNk0L
 P2ZfXpzM2kTPQ2evPmvR4D/5d2RHl9tJvYklmB2sgW3v6lqSckepv0wqFmNQlHDWPfnjXQDpJC4
 MOvEXRZdCZmelwIWgJJmr2zCeqnsAiBt/TB6U65/2jjmShfv+1uJ1NAAdMUl3KfpbYJf4NWcQ9i
 /EeclS70Wezrd6oH29CkVmVYuEMW+8j9qCSHee6PtQ1JtxJZaLnQy7sjg+tjG99u6+eGAf63+1W
 lBbczghBpBiwMIAMou2dV6199SJIvzo3v+UPIlgGF32twaE0Rq6V/CF//1Utija61kEt8kQeihL
 v5oKM2WFgOYDepi6jFk7tHcDJsbbY5+q/cYhMIDU+BGsWOAz3FCXJd5zlGciIIiq+3Bv7fof
X-Proofpoint-ORIG-GUID: RIbK0sw8jjebuOe3ay9rSqgNpQnGM-hb
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684dbfda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8
 a=eEByw65rTXB7yy4hQzQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140155

On 6/13/25 7:50 PM, Antony Kurniawan Soemardi wrote:
> Adds sdcc3-default-state and sdcc3-sleep-state pinctrl states for
> MSM8960. These are required for devices like Sony Xperia SP to ensure
> micro SD card functionality, though they are a no-op on the Samsung
> Galaxy Express.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      | 38 ++++++++++++++++++++++
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  5 +++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> index 4fa98277128897a531c54296576a6f15cd6d2a28..77fe5be24b36fbda83ba73034939db10db6ef4c8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi
> @@ -18,4 +18,42 @@ i2c3-pins {
>  			bias-bus-hold;
>  		};
>  	};
> +
> +	sdcc3_default_state: sdcc3-default-state {
> +		clk-pins {
> +			pins = "sdc3_clk";
> +			drive-strength = <8>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc3_cmd";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +
> +		data-pins {
> +			pins = "sdc3_data";
> +			drive-strength = <8>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	sdcc3_sleep_state: sdcc3-sleep-state {
> +		clk-pins {
> +			pins = "sdc3_clk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc3_cmd";
> +			drive-strength = <2>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc3_data";
> +			drive-strength = <2>;

Please add bias-pull-up to these two as well, just to be explicit

Konrad
