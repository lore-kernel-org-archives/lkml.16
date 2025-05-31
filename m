Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8957E23BCF0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694921; cv=none; b=BS9EZoinEv1cPdakZ2It7OIqXC8XJZv1TEm0N3vRTTVxpo8+zfQOfmRiXeXA0xtrxB/Erei7a6XI4VUppxbndPtZTDw3V7CLWHkYxX8iqg72UqY77kUO1DTvwjHh6n+2YDKPNTEJSQ7lwzyyUYhwJP886vRbc3YaVNChWiG+2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694921; c=relaxed/simple;
	bh=fcsNL8Jr3V1Z+L+0UjZINlA1Qo0B6Y1X6uk25v4J7ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1c6CVyB8o8LJl/NGY7kGNiB9ZThz93ezhQYL5aZFACvLiyGSrqtIipGC6suvvRybAH9qVcTbuA/Hjx5ZdlJRrQk5g8FaEiZFT6lRE+ZVHOwRNz+oZk94sJxPCB8EZflj0mouEUDvoSaHOrztKmnp8fGstEA4hrKWCT0TjHPE3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5wT/oTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5wT/oTZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54V4JVfu005804
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9S0yvnR5M8oQbjjOZBfaKlPYmTY49vYzeIuyHaPRtpQ=; b=R5wT/oTZ+k/atVwz
	akac9bkVfTDUZ0s9t2yQ3edFAlChnAhVDdzYFDpLJbGHP3GDJ9BIoA9rBujwqOmb
	t/9O2rFJFBsxlT2lv2AATzfJalvE4xxUd80WmBfCCcSaiOWtncVAFEDlDJU+MrUD
	PgzzWKp5gom8WA92G4oL7hFIQie0hY6MLsDyn2eq526obuxsXTMgAlQoRuRmdfSc
	vp22AkmjLYD1+OCakBdTidTiKM18e8vipAhs3v8hL7XFf2qm4Pdz5e9YgYh6ng+L
	3MiHm5UlW/6DqbsTCIzjYxTI+ZCftEg6C34xc5xmIHP2d+DWL485Zbd1xh9pTdLl
	BQxXcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm68ntt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:35:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a42e9c8577so7767551cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 05:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748694916; x=1749299716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9S0yvnR5M8oQbjjOZBfaKlPYmTY49vYzeIuyHaPRtpQ=;
        b=fGAW7VeWHMEwnlY8wlQWgYFf8cWuFojgnaK3SCFO/puipDSMjvZi1M+x6X4TwADJds
         zh9SlhUCb8kA/RbYaFaFaCFlXWqhZyGlkGqFKQHpt2UQBK++1W/BhhLSr9E01N9+6VAM
         UfigliUJrVpOZHHn8auXAiuG/ba5jrSq5rB70DmFgYwhwCuCXQhJcaG8LxPpCh3ir5c5
         caCV86mlqqt4x/plHGmsQDBs55bM2pahHaisLee3e2p/sEDNNbDWXOzqXe/5W9zD0iy2
         PvPPnkrtDnZw3nhrp9/QjqBR4KpZjo4Pz5Ovms9cqRoRditWnGx2GVs8PCR3GN3mzRGd
         vDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtCQpzfBfi6PLl6C1VwHhgAwVMSTpYZVyA5Cm9xx32pO3UyuZtXrNw+cZFMHh4NPC/VVVyiYkgD/rFs5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyL3/G5tOOwS1LarOHmHWkiTk78DepXgW5+bkJH0GKyH4KGr9
	dWzCyKEXN4tImIxvR9uvYbS9MV6gt6VAVe4BdUSVsTh58327OeSJ2bVjTFHQ+hlCzFuQ3X3iSjE
	0dCFtkWZBHKV8TbRiaQaSRjJddCNSLSlwTejMH4VZ29aAC5AGEO0aFd/cb7ly8FS3zd8=
X-Gm-Gg: ASbGncsNNJi0DCPIeXgWIjEjQ9ezBarAtBTZPlS5rdZ3dogqf/QNYlU+A8co44Qieyp
	8aRc0XI4cgA3D0OmqVhKfI/5CxSNNlfzXRi8R3AVJobFSXJG5+SdDq0qLlxMQPYwFfoIOeON/OY
	/8EYjNBPVpwQT5cy6FdQC0dsclJ3/Y7RqaA2o4bcPRaYYeEGv5OtM2uwzav4mdPiWWzjVrgrxRK
	Dt9PfSPpCgpbXmPOP8Zz1LTuz7rx2D+7fKlJzj7sO1T+TdHdylOp0aAAT+pXex5ybNLbYCVDCkE
	Y5F+1sAvXYIokqZb4LblY1dDnZ9IAqh6mbqou1bpIEQYcXvyRovcJ0q6o/8ZMzZISw==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr35732921cf.9.1748694916343;
        Sat, 31 May 2025 05:35:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAFHOKZwSa7Oj9a9fuVNjpeDyKERIwciylzFXlOnRCQf2AWDWhuEfkezhvglK3hxxCoL2fQA==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr35732611cf.9.1748694915801;
        Sat, 31 May 2025 05:35:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c7332bsm3179441a12.35.2025.05.31.05.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 05:35:15 -0700 (PDT)
Message-ID: <43581d09-4e30-42bc-9c5f-9c40f5d2cb39@oss.qualcomm.com>
Date: Sat, 31 May 2025 14:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: qcm6490-idp: Add WSA8830
 speakers and WCD9370 headset codec
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-8-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDExMyBTYWx0ZWRfX5MhgD+zE3QFW
 94rJ5jcrFLB3IAhnWb5aNWv8p+JekmlZgj+GQEjNBgaUAeulLkP0DB3zqd0LH3axAolZbvZJyUI
 saE40CpAnNkuasrfmv2dHkCP7oY3JvTIjTNALJXOQc8yl2pQQWn3DfviauoM+BNsU1A/H3rizBC
 QbZ5u3fTrv8klumrxk45ZKSa6xRkqpTLIBXk/PTWQzGLUbpt/Dl9xk8pVJ5MP/3xQ333gWRv91s
 YNryKA01mdRI6oX4wn+XSXdAomecnL0/VqnUknBzarqOl3zDtCck/oSuGg/cuIzOY8ImyLgf9Ci
 CqdAuz6ZTnrTgonOsbumuhRNWH4xukt8fHOC7qxxf8apUxugNi2qP6cZ/lOeCONmGYN+AhyACaD
 3Ksd7VB+k3cgwXJ9e11C5++046Q/9jL2Mxk9P/yjXCEVfa6FgZorTq7WL2oOyMQP7FQikvIR
X-Authority-Analysis: v=2.4 cv=EOIG00ZC c=1 sm=1 tr=0 ts=683af785 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=7yl-E-j_GsxE4UPiD6YA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sazLm41SGTAhwUawq7XjsEt7ZhU-VCZv
X-Proofpoint-ORIG-GUID: sazLm41SGTAhwUawq7XjsEt7ZhU-VCZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_06,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=824 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310113

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers and WCD9370 headset codec
> on qcm6490-idp board.
> 
> Enable lpass macros along with audio support pin controls.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

>  &uart5 {
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 542a39ca72bb..2e75e7706fb4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -29,6 +29,30 @@ &lpass_dmic23_data {
>  	bias-pull-down;
>  };
>  
> +&lpass_rx_swr_clk {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-disable;
> +};
> +
> +&lpass_rx_swr_data {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-bus-hold;
> +};
> +
> +&lpass_tx_swr_clk {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-disable;
> +};
> +
> +&lpass_tx_swr_data {
> +	drive-strength = <2>;
> +	slew-rate = <1>;
> +	bias-bus-hold;
> +};

All other DTs that overwrite these pins seem to be setting the
exact same settings.. And given this pin is connected to an on-SoC
peripheral, I think it would make sense to consolidate these in
sc7280.dtsi

Konrad
