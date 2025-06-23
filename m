Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE06238C19
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687778; cv=none; b=RsYRFbsC1WvB+E0yv+wNhdXfhC63fxXtUwAT1H2hPFa8sBpf1/xsc6m2HhKz0dhlmeMFM5qvblOXL/HY1lUaChBeX85B0qM59CtK8t1kCzB1hzkcS322LXFjqCedSqfpLAcb6CORCVxtLqh0YgsN8+32EhQr8kSGPz/Yxs7t3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687778; c=relaxed/simple;
	bh=J/FuLbVN3hNiRvuHYitenfWF6clJnuU08gAStP/Nqlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewcXUVqL5svyimcpJWu1FtqvYHzlE66oGZji7pU1U1bJdwtWc+MxKhSB2l0dxbFsDk7g1DLZy//UEHZANchKU09BVTWRn3NXC3Ug1Tyqd+9HPq03jHoUdN2usyVUcYWq9DgucK06szAvWq3zqWCm+oqzuWl6dIgLLqP8mQU+6d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AStK30X5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AStK30X5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9312W015230
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dsiybX/HWDxpP9dbMXEwUD6RQ+0f2abW6Z5Exqzf8o=; b=AStK30X5Ob4/MLNu
	s1ymiMXGpjuo4SOqbZbOr5qN3aJHuwETDQhBXPSoMJKkBBNaBjV45Jea37XM5z6K
	z+zeTUWgMAf6Aryc4KsD2r1LQlbWXKuId8dHxf4HLyPg/HmZJmsNYnTsBKAYwPkD
	a34MnByZQn/P+DNVpztcv30xRS0fzIStOpa95DbAePSsHBvPvAWrtBz1Rmh70hVD
	bplhgkG46zmByACVlQRIf4YV3YDILM+sj/Z8NQxSBVJWIFkgYIKix9E0rKduYBbf
	8sHzj+CoMAx84EXrhmiOLGACk4ddoD+vwZRSTUNOI6xrULGpKykojMQWcyqyCqOn
	PkPkug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0usq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso113416985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687774; x=1751292574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dsiybX/HWDxpP9dbMXEwUD6RQ+0f2abW6Z5Exqzf8o=;
        b=TFGo8rli3QZ5zjkxWZU/GYG0kcbXm6QVctlqkxbYWSzvUrfeYYHLN/yptmOW2OnNTx
         xKgwwH2lrNvjGwyPEboM+W15OX9+vo14E3aGoSYHGLLi3IwXrvKmRtg0Sb92mu8eahWQ
         evbwzH/HBQbYdzA5MpcmTaN/itrkFdboxVpw0T+KnmbK9f2P13n9u8jbwAjPR7j8yJ0t
         smoD4TWXlkHFd89KFJRVUwndbMq/vn4eZXPKqPjjIfGz5Z3ROosqlaT/x4UelZeLoCeq
         Zc33Hlso2HVJ6c1CEgKcuqK1y8Pn4jk4hqqEIDxlW8Gop3I1mascAgpBH/Tc/HvbR6UM
         syCg==
X-Forwarded-Encrypted: i=1; AJvYcCX/7R7zji9QJYxopWBKvD0n0DeakLvNNiV8338UDsjgAI+ess5e8pMENWG+x2Fg35HUyUXqsE/tLK5mUEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhurtaMksGVQo0ojw7ow+0UXdHTKgcr+jXvpij/qfF0omkEjro
	zPgR2NiFRep43PYwhzIphidMn7RE+Z9sAFPX4Z1YhzytS5DdekjjGPw2Fv7KosrOWcLY3WeE8KZ
	Mm6akaIXDXYaZ7zZ5PzxkhOGCDkuu9ikzPqsqRvpdmfC5kBo1Ox8x5+1Jv1Q/UNbX1Yo=
X-Gm-Gg: ASbGncuqCmy+DQte663jYxzH4SPwD9IhSuisKxAsBvJyoCQPtcTDntVx8lQL2c013MW
	RzaX66A11Gm+UpAO8Yimg5Unx9EFvl0Zp6TeGY01Qg6pNrNzqkiyiQ8HbaMuPkkWPdmmizga+uo
	iv9KFARnSb+uU84U1/0z/Hk8sMCiJyBPEBQNxEVQFiT/U5Qv6fgwWDo0FcJfJ0ektLwLN6Ptxiq
	W/+14yrpbtABFMnYvpBQFtGZki5yaB49ewHe97iP4kVejqF579X0kFz9smaTRwghnpqWCcIHTsv
	WNNvVHXtfITVM7rzlW8QKSaGSgQCCV3dwG7T7qfncoONbfdPxnHYPHpmFmjqJghAx1kOY2B/4Bq
	j0MM=
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr740336485a.2.1750687774143;
        Mon, 23 Jun 2025 07:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnPAvBf8YdMlMuE/0qJYHRbWbS4y//cSXltTSiIpF0YzwoKZPk5uhfCDHboNWUYMZ9nx4HNw==
X-Received: by 2002:a05:620a:4708:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d3f98b4b8dmr740333585a.2.1750687773432;
        Mon, 23 Jun 2025 07:09:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a1505294sm32885366b.83.2025.06.23.07.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:09:32 -0700 (PDT)
Message-ID: <d3309e0d-d751-44c4-845c-e05eec4ac75d@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 16:09:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
To: Sayali Lokhande <quic_sayalil@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
 <20250619070224.23428-2-quic_sayalil@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619070224.23428-2-quic_sayalil@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfXy3te/AVQ+2/H
 NLepgP4NfJvAb1bOwF2ld9cG38Ev/++d6SvV/8OWS/OYxCBxNaHHCWeKONaHJD4b0ghLxXq8mbe
 UlgKr2eak1tnGi4JDtAbD5zRH1YxDSdV/6rLy6VMVSXh7xhTrdLU4QQcORYlDHBSQcd1iKbxyYs
 BveeHJS3FaPHZBx3kLxetetArutBQUc7yCKhwcjKc60CRT2mcyv9buoV/eFV+ap2vBD+OMvaZvg
 MjiToStxBp63nKLduZSsI55cFIg25WWte8nScDE5Vmwp7vmiB+61J4MfvSwIgQeh1QphjdUorwR
 chiHJxQBBuVOC7dW+OIoAR2PK1uUgsJ6lwEXocSsJ+5My+9k9jNhP886h2DAf9l8HC1OWiGzb+Z
 3Ym2OTpOiJt/D9brHHMpMdpNeDOxw/f+hV+WjVeDgEdYVPXasjD5B/lvT4SLVY9WVdWT86Uz
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=6859601f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ViSwFiuPWrUJpFAOtGMA:9
 a=R9dU3JXcjent7X09:21 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ugLtszjeR_WfLe_-QbXmDXnugBB1gqjc
X-Proofpoint-GUID: ugLtszjeR_WfLe_-QbXmDXnugBB1gqjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084

On 6/19/25 9:02 AM, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---

It's customary to split board and SoC changes into separate commits

[...]

> +		sdhc_1: mmc@87C4000 {

Please use lowercase hex across DT, in all places

> +			compatible = "qcom,qcs8300-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x0 0x87C4000 0x0 0x1000>,

To make it easier to compare by eye, we tend to pad the address
values to 8 hex digits with leading zeroes, please do so as well

> +			      <0x0 0x87C5000 0x0 0x1000>;
> +			reg-names = "hc",
> +				    "cqhci";
> +
> +			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq",
> +					  "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "xo";
> +
> +			resets = <&gcc GCC_SDCC1_BCR>;
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			operating-points-v2 = <&sdhc1_opp_table>;
> +			iommus = <&apps_smmu 0x0 0x0>;

In case anyone's wondering, this is actually the correct value

> +			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "sdhc-ddr",
> +					     "cpu-sdhc";

[...]

> +			sdc1_state_on: sdc1-on-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;

Please move bias properties under drive-strength for consistency

> +				};
> +
> +				cmd-pins {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				data-pins {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				rclk-pins {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_state_off: sdc1-off-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					bias-bus-hold;

Is bus-hold what we want here? Other platforms do a pull-up/down
or disable bias altogether

Konrad
