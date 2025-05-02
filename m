Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EE253B7C
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197626; cv=none; b=JMMZDg8GDKx9geGUlNldKUP/IQi+Vcl/cnut+7fLRyA2tt9kP+sgZyVi3cY29C7g3GBTgMU9KL9e5i8ehW1hRvsJ+S8hxQ0Y82K3ey9EArvGGmccRSQDP7Q+phZkAUp0teWSZmHKCsUqv/I8ilD+9m7cb5pePTS+V4g47uKrgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197626; c=relaxed/simple;
	bh=K0E7yI1Xa7NXgaLdR9InXOsO/qfXVkW7JBH64HPB6Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGBnToTL2wUfeDtz0QCB3C7l+/GimTU4/kZDnhZcebay6qDHpvRQRfa0knUxagCrbidmeoOiRrzYIozdtv6Vvp4c5znHPQPac+FBJvQI9l0vyMCI6edvpLo8+3nY3fbbZ0r7qph497vs2Vo4F0DQ5e6zNf9K8WoZt2tVe5FLOK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=audcEK4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="audcEK4/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Cvh2b017448
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 14:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Q/NZ9PH3dCqRhE7QQVcQF21
	ld09o2KwGMTJ6V+d9kc=; b=audcEK4/k0zX/8UCBf7tbrLnDMFLoeeB+WoYk6sX
	bdhKt3cPonIN1CUZyvmlh7aA/8aB2IlU6ZLvUJuY9Uv74UHZn8+DBvpkSZvWskbk
	7EH726tUViDOshuC1FHJzRrhanMoNX1MU96UL65gbNXtfoZqXu8RRRx4Kxpo03om
	BxtYb2LqRyAQ5P4r98xPmY+TamSDVo6YZ0tfTagN1t3VwIXLlPVuWj8CVvqT3ApG
	q/zzfn041uoIUSc8Kdn7D0MuoweKb7JzYMopZHJH412Z7EM78kFezuHvBqAmx/Mu
	NUq5uMCIRq1mYDf2gj2jB5bCQexg+u7asr+uH13tn0gZ6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u78nw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:53:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so532417485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197622; x=1746802422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q/NZ9PH3dCqRhE7QQVcQF21ld09o2KwGMTJ6V+d9kc=;
        b=dvPyrgJqqjixsZtlUuVoD4iMyw0XXG9g9lPKP6q31Q8gX79O1uRBKXeoLvcLw8JLu0
         S3x8C06JJBgno0f7EhpfBqUNr2KBey8gt+a7A+pN4ji0TAn/SlOs/oZbBWLA6637m7aP
         DffhsngCLelUKloEUGL5gOWKszj+vU3zjRFmpSVWwSJoTUel7Yuw8QoruG1NJOyHucT+
         2A6fGIqxnwXefnh1m9yZNY/zvxUCEGFKhKfBD4JxRxoe8HgU0QfwRi4c0ApNjofw1Vjs
         gt54ZhMbtCzptrEMDHm+yTmSuSAHsdjVh5zYn0p1EVGQTUoXtpcuAEK0VBe0PxwaqTui
         Rrbg==
X-Forwarded-Encrypted: i=1; AJvYcCU04HM4LQJRxEJ2GZOo2fNGrTl9vACBFGNtvjRIDitdNVFNz3WClHJtBjmgxGaTdtl3mXVxtAXppTS7Oq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5h27FV5D9j6RP/+d7KfkZxM95UcmJ+fdH7x0xa4Sy3Gdt3DdV
	LKIC6avUIssoVpxsNJaE/aNXPGXIwGPXmocAK+/1HYawhx2EA9zxRlzqB8ROJ+iyoD8oCl2mgus
	8AvKeKK/5B6eaP+uAKOxCqYfPipkukDahhls27xtsNJdF5SebZlmCHiPpukueEbM=
X-Gm-Gg: ASbGncuf+M5JJ+QmAdTszNOcl3KixyAK1Rv9Uh63xwkTjHFFgr0qfWe/nILqzUwdyWs
	KOX4jYT6L2X5h/pJhsd8SPBjjkc5A6TWCWlMygvylpgyv3U4u+SiOxfEiF5zUs9cXnmFYySabBp
	A94Rj+M83uqdHkb++MxfDZn0zB8dJJkPMObi46XSmloWQPB3j/HyUSD/ERLGgBkH3N0h6Qyk5jJ
	Uv/fJ8MmBoYhutwYBtDBazoAy69gXYuC+8imTXv1Cm9upXlbfJeseBkBOWZOcdr0NgPbHl9qcs5
	bTN40AsbYe4sX6kub9hVELlzxBFe+rLuE4w6SOegvbkULZzbTl0bNvJmEfnNX5/8ntP3YLmWg4E
	=
X-Received: by 2002:a05:620a:4442:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7cad5ba5b8emr552667485a.54.1746197621895;
        Fri, 02 May 2025 07:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv+2rgqKEXz5KX4ZAVjm6VR2mlcVmss6vo6U4HwP0A0n7q94Lv0z/IsqE8QQF1nfQDyCLaxw==
X-Received: by 2002:a05:620a:4442:b0:7c5:9a4e:7b8a with SMTP id af79cd13be357-7cad5ba5b8emr552661985a.54.1746197621395;
        Fri, 02 May 2025 07:53:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f15ddsm375752e87.159.2025.05.02.07.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:53:40 -0700 (PDT)
Date: Fri, 2 May 2025 17:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 3/4] watchdog: qcom: introduce the device data for
 IPQ5424 watchdog device
Message-ID: <4fvlhcztwqw3sp4wb32rbvdra5ativo5zypeokpglzezkmjfmy@vogadyshroix>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-wdt_reset_reason-v3-3-b2dc7ace38ca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExOCBTYWx0ZWRfX/2oId8f/v99w rERMLk7r16FXV7J5YCH1eDguCjxmnOlb+EE7845DDKW06GSfUce9kX5c0IsewlMu9368zQYVRqN i2qjgJ340jxUwkCSs4jFqMKZ2L2Lm7r0dqMCQ+B6Xe1nXuwywks0Shxs1qxRO4Elqf3yHSYEynk
 f90dAqNnydlNzADy2/hJOd02MyiZULYpxiDFJSb3wU1r8Y/2/2SIPxjbf9/YKHfZSxdmdAGo9yY 3fQzjynjalVV/nZV/uXwfiak0FeJ8weemzkTXnpr8wrJoXLZoqGupUq2ArHyg2etCjv6m4MwxAG Rh/xJdXdEC6ExFh2hvOlgFJjtm1Xf0M2Ay8BU3chqFOaU+7u0eO2CHSTU/EoJqka5RaGrBHSlT+
 cJQnWWwBXDRmJuuqP64nAL8sr72QFOODqOdz7PMw2MU/GccCVxR0waXq2yZiagbICHODA29c
X-Proofpoint-GUID: U9gkIvHKZl-KldGNvoTPHZr8xl8C96Oy
X-Proofpoint-ORIG-GUID: U9gkIvHKZl-KldGNvoTPHZr8xl8C96Oy
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=6814dc77 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=eHhXNMzxjzR4xej-uuwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020118

On Fri, May 02, 2025 at 06:47:51PM +0530, Kathiravan Thirumoorthy wrote:
> To retrieve the restart reason from IMEM, certain device specific data
> like IMEM compatible to lookup, location of IMEM to read, etc should be
> defined. To achieve that, introduce the separate device data for IPQ5424
> and add the required details subsequently.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- New patch
> ---
>  drivers/watchdog/qcom-wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..dfaac5995c84c1f377023e6e62770c5548528a4c 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -181,6 +181,12 @@ static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>  	.max_tick_count = 0x10000000U,
>  };
>  
> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
> +	.offset = reg_offset_data_kpss,
> +	.pretimeout = true,
> +	.max_tick_count = 0xFFFFFU,
> +};
> +
>  static const struct qcom_wdt_match_data match_data_kpss = {
>  	.offset = reg_offset_data_kpss,
>  	.pretimeout = true,
> @@ -322,6 +328,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
>  };
>  
>  static const struct of_device_id qcom_wdt_of_table[] = {
> +	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },

Shouldn't it be qcom,ipq5424-apss-wdt ?

>  	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>  	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
>  	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
