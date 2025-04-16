Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF81DED4C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815116; cv=none; b=U2Or9Kc9Y2hPVlbqc5W+/KbxifBWRVqEJV5/SFy7ARRDuJt+cpFKOkgksDnrUh1MEO2perdxDaSr7crdWain6Ucv44KXaaL0sOuNwF5gOP4SQfapxMDjbvzyVRdZnsvIm4gVYLIBVQHeJwYwft26gTKoKXG0bg6EqIDTMi6jmcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815116; c=relaxed/simple;
	bh=vwL1BbE9dim+EUQ5oei2dD+XaH7nnA7tsi2X4O+Jtts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haYHx1NHwlGJ/1JEq0wfjx87JSpyuD2VHt5JLWNIYGWWeDV68HcUwJw7sFhjRvoa3Uucr9EV7Sb8W5Y1SkFXRnPC/LZnrTEqxJN83JKhLcfPyIEf2mt593Shl/8S1W/O1aIePydruaE9kCsCj3xP3rMVNPsYsP5M9wPrM5bpH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh8PAI4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh8PAI4w"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mEjO007060
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68ZrhJQovSEcR2kztjippS0ohW5/EM4NVarjyk+ti00=; b=Jh8PAI4wOElWmlPv
	1QGJhjgN/Jp67AVwgq3d/dMdL5otjq5VvoRBN0m0Dmetmey0PuG3zuGTPRWKoKTW
	Ai4p2CTx2L+35klVlCzvpEWSoY8emzYp9yjt92TXYph4eFOpe4xKE1C2gPxQ3eSM
	rUx3ThcGdYrBZ2LUUbVIyh99R8vX6/wTxLAhzHStBIG39TljXfB5cdAtSExq9Fcd
	9f2m106XuI8gd507IFN9y4PhzEmc3HtB/1Ile7RU3ddadVF80RhOlFXif8T7wV4R
	/sa2/1FA3QjXftyYdSJ3wxSk2thyNWR6YPgg3RqBh9JGvNGiLlDxocVQz1AuJJwl
	ttxYeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6kx93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:51:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so163217885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815112; x=1745419912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=68ZrhJQovSEcR2kztjippS0ohW5/EM4NVarjyk+ti00=;
        b=PvgCC46Ecs/VC5UFM0TptXDCTdvvZA5hEr7iCxkgq6EBZyOB+cFqn0HH6ZpsYEu1TF
         A9kYCXqWdOAvUnfLWbp381wxGCyv2PaMWPRxLEZbtWD4G0MMd9EsOo3NfEuybmv1ZvuM
         SuKA9us9L0QblfQCN6zxg3ekOq73W9K8JteRkaHpaaYswv3AFZ0zFRmOmw4QTfZ0YB7c
         YVgEAUhOZMm0iurl3KPKgL4t7+wsO45CacmxTLvynQtL+GaBxHwwA1t5mHas2rtq2FJS
         +mnCxtT9ZklXMqJUriXz9otlr3kCVMTtpHYTFngLZMnSBzsHeGaBjS+fdXbUHN9+hrLc
         aiKg==
X-Forwarded-Encrypted: i=1; AJvYcCW7KQAY0qKZ71IHGlMHJEsTj42LxaOJbziTQgu55Ah6UcCnh0Z8LJTHv8ST53l9mJiegJKTZLgD3alnfqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxierNLYD0Qe5RnA7BzGsLT4yBkT2XtztAUm4ulfhZOwDXDDhXT
	xBB0Hu/TtVLI2FHYmt0bEswqddXjg44k+/qutGbx0vp+vPIPcFQkpVxm3aciVF+93654ciSXvq+
	WqvbYTYwW4JothbFv1F39YKNnU1RWj049xLXY3ehYD1wthN8EUtg/i64TGhRXh5I=
X-Gm-Gg: ASbGncsW0xZbDAT/+/Rnnv/rpdwxtn3RrdHDNPMihuS1hepRjyr9fCshgOSdPF6T+LD
	QLYvSUyjFAue1RS95fjMIHauORE7dQjp7VplgPtgUYqT17kS2AYwCUXnfQnnPkureAVI/lNOqHV
	v74EJpUQj+b9Py656zPD/wcN418x8is+flUbDEG5P7bPsfrwwfbju25IEeFoEp1Zm7HD2DCzput
	WQj3RBhXd81tVuNJu066wAwIZi2JqvfNPnYTBH0mKF4gUnqf6IY7b873ZuSIdCJJpkCVpGOoLpc
	xJtDSM76LPWjxwAXId8CbX0FcjUvrBkvxnSz1XFRXMbhrMcjA7Vm8ndJ2l8RDOJ18sk=
X-Received: by 2002:a05:620a:3949:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91907f98bmr107038785a.14.1744815111889;
        Wed, 16 Apr 2025 07:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcOviPf73nDukXkJL7ld7hTvKQxe8wwMiCfiI19F135lGpiXQBbhZ3nTHbf1J+gRCPNMCQDg==
X-Received: by 2002:a05:620a:3949:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c91907f98bmr107036185a.14.1744815111395;
        Wed, 16 Apr 2025 07:51:51 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdda64fsm140691166b.62.2025.04.16.07.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:51:50 -0700 (PDT)
Message-ID: <4e9621c2-f347-4cba-9422-b14f96ee4c0b@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 16:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LiBg04Jfg2qeLlU_Yuvm4z02a5RH1XG_
X-Proofpoint-GUID: LiBg04Jfg2qeLlU_Yuvm4z02a5RH1XG_
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffc409 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4JCwT51NPQo9-FzctWsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160122

On 4/16/25 10:29 AM, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was restarted
> due to WDT expiry, bootloaders update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>  drivers/watchdog/qcom-wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..94ba9ec9907a19854cd45a94f8da17d6e6eb33bc 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
>  enum wdt_reg {
> @@ -39,6 +41,9 @@ static const u32 reg_offset_data_kpss[] = {
>  };
>  
>  struct qcom_wdt_match_data {
> +	const char *compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>  	const u32 *offset;
>  	bool pretimeout;
>  	u32 max_tick_count;
> @@ -175,6 +180,15 @@ static const struct watchdog_info qcom_wdt_pt_info = {
>  	.identity	= KBUILD_MODNAME,
>  };
>  
> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
> +	.compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
> +	.offset = reg_offset_data_kpss,
> +	.pretimeout = true,
> +	.max_tick_count = 0xFFFFFU,
> +};
> +
>  static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>  	.offset = reg_offset_data_apcs_tmr,
>  	.pretimeout = false,
> @@ -187,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>  	.max_tick_count = 0xFFFFFU,
>  };
>  
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,

double space> +					const struct qcom_wdt_match_data *data)

Please align this

> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->compatible);

I still think nvmem could be better here, as it allows to plug in
more magic values

Konrad
