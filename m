Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF62571BE
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197110; cv=none; b=liwZ6sNfrOiPoL692bEzXnieT4Zw/z0YeV87AFDayKkZSHII3F0Sv+Qa7sb39dq58YShWJW0U9EokwP6lQ/U87q87z+FITtsdhQGmTralmRnPsmTx8tD8Bs9zeBvNm5ySLZN0Y/EGMVNVbVsN1Ggs4GX2sMoB57w9PdimnReXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197110; c=relaxed/simple;
	bh=gIgjvlu9Lh4W9hA+25IQzvCi050+ERk+c0blFLwFmgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L80DvadDHEeud2KbWbt/7pqCYUfpA3C/kM+GsQTc2SkmerRzbmXr4/wkAowv0C/h+p3j2+NLdiEVvciZ6OuuMDnEycP4UJk9QsvxSZH68pfX1VNkARh6f1JxtG7oC3KCjyFjtaOazYj8v6C0jKi9PKIDyD+yJdRYLxh7U/wLTLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Hva6v3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Hva6v3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Dx2Qi016417
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 14:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKFBa6/zgrJ4k2F40/J4HmeH
	gWpS8VMAWbzSckv2X6M=; b=K9Hva6v3NyHFI7Yaru/1727jojyJSiREBT3xLhVg
	S/zkcXVacbQeJtlZgnCr9nj5cTx6G4m613rnV2WFyDDremtRxd/YdvQuCrNSy2Q5
	mAb6lCJUmjzDzXDjy1fDB55xpqyhIz1Qdd2Jgk2sBd9wOwZ6N4Z4hJpWOG+diKNf
	/MnaSnHlLniVGNxUXhXRjrv1O/qVhFY0U7pV4qkzggOlKv8zJxvg+IeqNZ4YW+Qg
	x13Cl/XF+hfInKPc6qlC/Ol+xk3RVM7VIuRlnCvQ2pw9XGyLly9cDRPUU4NnHaoB
	4E7uWMmqtiQj2Y6TzhRvs4sayQ8t71TKbMelQM93YqxKDg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uagh65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:45:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so470757485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197106; x=1746801906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKFBa6/zgrJ4k2F40/J4HmeHgWpS8VMAWbzSckv2X6M=;
        b=WO9NaIPWURUM33B4W6yg0ZsBhNrpvSmWJlsE0CBaeV977Qx9jPWG2XRhi0e/3dkYB8
         IAPKq4eRLmXebHt+O1kSogfa0v0A0UVWeHgiJwzvaqUknq5Yb/BHnlQ9WkLUqyDfQ5ov
         2YSbLwOyuFAUn/pMNLV1AXY+taSCrQtY/GtyC4a+l09HAsYw+byTZIhdWu7BkBGZbwD1
         t1GZeZnX0j1LBtlBQpaVq7o6n8XZSpQzDenWZsXzzZ5a/30QDbru5Cqo82fmfq/ZxJaZ
         4p8jQkS3wTMyEofPSfyN1v3raSfaM3smMBK55mcNzMK5ie0RpSgkRGlkHsv9sjvq15FO
         TsEw==
X-Forwarded-Encrypted: i=1; AJvYcCU/h57fMEzjClrlcpm0w6mvcVABxskVjNNB32xkFUseVsNViKzoZfJOOkO2yiuzbzPncxZznwCOZrYfzb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmP67VlWSyf27aXbpR2Zg+Axexy32tn5e3+Z6AH+5p2GdzGxsu
	JXk37q7oFNBjS7bbMhtIoMHO+uIHFnV41s3vo5RjHltNTVSQWgmJ6yXss6BcoLVazR1x1a2VKmV
	ju422qaSXMQp8X6MmO2yIRH6IcvkbupllJ8PA8U35AULJ+bGEt1n7qVmzVXo0S80=
X-Gm-Gg: ASbGncs3wUhn+u0h8V1yvG/fSjNXdTBv7SHkZge2VIOARl0EpCU8x31FTydjmqAE+OI
	KfU9YAC/9VOIIVHcF8JN/vwDplqy+MK0c8I14zBFHK1Sh6OloFUQEUBdBLJWMvXdJKm4yzY4ekj
	rLTH8DhUT6NGInZGbWJAvYHx+n5Dmf3hLIGZdoXxZo8IokLJ23q+x6/6kGPQ6EeIBIuJN/FQxWI
	oIMn/gvRM9JrspU4TRH5U1wfP8Cp0Fb+phA0cg/iGST/vfCLuVolxtIITEqu/tyR8k2rPOVC2It
	aJ+kZ70UaXHXWSjbEvsTHwaGo0nVvkJk5Zi2XByHKTBpK/0UXoPAL+PHHejmS136gkKbgwFSxGk
	=
X-Received: by 2002:a05:620a:248a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7cad5ba79femr368388985a.57.1746197106162;
        Fri, 02 May 2025 07:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnTvg9+ZU86kpvNrwYxGXjpp9+8gfF9cru46QLku/mHRjHUI/CT9RbX1jXkEXwADoj3azjNA==
X-Received: by 2002:a05:620a:248a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7cad5ba79femr368384285a.57.1746197105730;
        Fri, 02 May 2025 07:45:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029306984sm3560131fa.58.2025.05.02.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:45:04 -0700 (PDT)
Date: Fri, 2 May 2025 17:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use
 fixed factor clock
Message-ID: <frlw5n2fxu5wxrlaahiuwlgaeg4rsqk7ushpcgvc2q4mzorrzf@e4axknhir4el>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-6-27902c1c4071@outlook.com>
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6814da73 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=dROWWaiHUd5sXOo7F1MA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExNyBTYWx0ZWRfX3uCn+1NuWh8c kaLHZ1Wu1uQ0ESbcYYUtwMRThpz216BdKO9L/5k8iajEhhYJ3DqnMzfRhMhoDOkotcs2Lmu7bcY uVQQF6v5O7uMEucNZDbnwxbVk+3Lf9ITahdypIod1/zxpxeoKBq0rPB5rwsyF7CojmJmx+VKyUA
 8FjZFwuOvjQ7Aoedb6ix2CoOTX7IKb/yrtt0NR6wQkAmpQz1sLVo/Ch400D5DCs3vsIatRYIfiT 0uj3+xWLFz5IVo6rQGPqxrCsXY5bPtGqFDSgAu4L3S5NyljpbX3uK8mb4Sfj+X/yv2uSwHB0aBM rXLzRI9yq7d1b4ghjxI35Y48ycQH1ApzGaZM+ictspHH8V0hMAyjPdTT8V4hb1ji9+EhUG1v/W2
 hJEXdAgISRCxOoH9h1oC5fX8vfy6WMJzNuXy/vKiaAwIj4zKlkGeb3HnY832r6R4uN3IA68U
X-Proofpoint-GUID: WorlguyiETNAAlOtqUR9yG_vTomrAHCl
X-Proofpoint-ORIG-GUID: WorlguyiETNAAlOtqUR9yG_vTomrAHCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=936 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020117

On Fri, May 02, 2025 at 02:15:48PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The xo_board_clk is fixed to 24 MHZ, which is routed from WiFi output
> clock 96 MHZ (also being the reference clock of CMN PLL) divided by 4
> to the analog block routing channel.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts             | 3 ++-
>  arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi                      | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8460b538eb6a3e2d6b971bd9637309809e0c0f0c..abb629678c023a2eb387ebf229f6dd1c30133b19 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -80,5 +80,6 @@ &usbphy0 {
>  };
>  
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <4>;
> +	clock-mult = <1>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> index 5bb021cb29cd39cb95035bfac1bdbc976439838b..7a25af57749c8e8c9a6a185437886b04b0d99e8e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
> @@ -124,5 +124,6 @@ uart_pins: uart-pins-state {
>  };
>  
>  &xo_board_clk {
> -	clock-frequency = <24000000>;
> +	clock-div = <4>;
> +	clock-mult = <1>;
>  };

Is the divider a part of the SoC? If so, please move these values to the SoC dtsi file.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 78368600ba44825b38f737a6d7837a80dc32efb6..7e40f80e4795de25d55b5a19c1beb98e5abcdef3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -31,7 +31,8 @@ sleep_clk: sleep-clk {
>  		};
>  
>  		xo_board_clk: xo-board-clk {
> -			compatible = "fixed-clock";
> +			compatible = "fixed-factor-clock";
> +			clocks = <&ref_96mhz_clk>;
>  			#clock-cells = <0>;
>  		};
>  
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry
