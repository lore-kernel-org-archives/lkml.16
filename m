Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9020D4EB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922872; cv=none; b=WygKbnJ639L+uyyC2OOC1s2PY/ubmRkp5+lh6zvZK6lM5eBs/5miPrNWoGmtGBl75DUaodOClL0MybeztEY+7N/LvpQWif0OEughC9b2Ifr/tTGdRUNK31VZT0nhYe+Kc2K/x8LTig2W+mzJQh71OPF9j5vO382AuqpT3tPddU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922872; c=relaxed/simple;
	bh=+07+xNcZxPa2E0knNITxVBPboW0oYJsB+sCpHA0BehE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xzdv04gx/Vm8IMz4Gtjbnv1gk6ydEmbqfXkKX6fL6UJjogBbKNDNhiyOlGCFGhEa4uPdqHr9ifjPieCxk58mK/6Vjlnr9QkzaP/Ag5k13aj79h0V8mFI6PAi8oaBpuVLLBCuvaYxFPUxuWAo8HqeHwClwlBBTpS+DHAvrZRaof8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a43sA3T/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a43sA3T/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9l1lZ001785
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTpLlEw7Nf8Y90SxN0pE/V43lopvZlp2wc9TRpcckrA=; b=a43sA3T/7J1JmBHT
	7aN7CVUHfjQZ6y46tYrB+KnlfYQtGk8fhgu3NK9k140im7sWNr4jdxsKq06pULP3
	rTBk4E5gTm9kLd+PTzpGViZClk1WAB4ivD2mje+6qrNjfJI3eP+p2hDBtbtHxT6u
	AYEYMqszOfa/n+lw/H01l0p+AVCjW66i8p4OXmRhaoDhpHn5WJtcdavrQwsHiMr7
	ySYWXNKWIUw5nUXR8IkgXL1jdkL2nj9VS6zTMhqG6KQqkO93aiWhbdHybjCIb4aw
	/8FU6qr/WGehvHoWt1DVOBZtY6h/9r+bbZLx+ZyyuB2BFkx9FbpnS4XbL4/803gX
	YSMImA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9m6gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:34:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so12782611cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922868; x=1746527668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTpLlEw7Nf8Y90SxN0pE/V43lopvZlp2wc9TRpcckrA=;
        b=m8h3SNjdUXxt0myodfhdy4fPks4tMY4WkczsVZDHU6dd5vXf5of5kehtrBS/iv2spt
         TUT7bGHrOxJpjucNbZ/irG85eq1KNP5VSGR8I+JRIAotl6CMRtuPfYPcNgWYdW4JqcfP
         Y/oiaZPxMbSC35Ddim1ixPqy6dGUUg2xEBQ2fJEq3RMrw775cu0RP7CH6xvLteqnaxAa
         M9HcXvRavvEuHRwgdDOn3Av3/2PQHsG0moHvhHd/1WbZz9aznbOD66Qp3hD3pfx18Gsg
         Zl5YKQuh8XQVfNz6nNmiUgP82jKLRPRsAgcFWS8Z7KyGveKorMFmYHcQ7n6S1k2BXJy+
         Qk4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVafo33AO9jnurTNZ9zjQnQw/mepUqa+lwS3rtGIuT1vyyQkGRzQCIpftYThxj65pjvuF52degcjK1M27U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgVNVkWAKGGJ8Tish7+n+AKrXzphrmCRUr/3e5e313jwNR6Pjm
	OBDkU6oTDJKw1hdK3m5RIg7EkSTg4NBjL3aaD4ZzRKG1VeYXKcs+l8JArnGLuwrVjfcthChMCZE
	sSbqsz6uzLqAYiYvbCIldbkac4bdpioXPdLq/NFMzeYZ/WXLOWydbBeoCOACOxzR8ruJBPPI=
X-Gm-Gg: ASbGnctRsgHt1MLDZsCqTPHt2kHAwbUCFWlbGlLSb6DCJxRfqIxmia5mVFRldu3Qn8n
	2F7JX8zrazkTqmDHyiO1b8Y3o5QErigkO4fDgBSwMSxIaspLEzVWHcfk3YNHNIoKcfJf97unfXA
	h/vdjSaLWWtHcE0f7XqsBRBpvv6lukCA9KF2m5oEFUB4o+c3axCb0b8tPFWC+0ANKdhmIWBzz/o
	S3JAJ6xZWNVuUb4WERzANmyY3Et0kaAkKrq0VNW5B79RBZzD+lFpMLFyiH2twK75KYqBcfHD2lT
	pKp/oSzLU4v49TdlHKHVr9b09yrXvyQifnEM0/boYvjCiM0sStJtqsXlMhQi3qSz6w==
X-Received: by 2002:a05:622a:44a:b0:477:6afc:f59 with SMTP id d75a77b69052e-48864ad4111mr14918621cf.2.1745922867842;
        Tue, 29 Apr 2025 03:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/eYz/3VQLGoMR3LYKlWT375abyVhawesjEMr/lYhSQEyH8YxsdzynPxZ1vPCbeMXSz+b5g==
X-Received: by 2002:a05:622a:44a:b0:477:6afc:f59 with SMTP id d75a77b69052e-48864ad4111mr14918531cf.2.1745922867503;
        Tue, 29 Apr 2025 03:34:27 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8f3dsm744493166b.110.2025.04.29.03.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:34:27 -0700 (PDT)
Message-ID: <b3119bef-d045-467b-91cf-37fe6832ff63@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810ab34 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=CWSby3ZRTVrr-Bqb7HsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uqGBhq1tkLS4gS-AJaB3MSFQwlgGeRBN
X-Proofpoint-ORIG-GUID: uqGBhq1tkLS4gS-AJaB3MSFQwlgGeRBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OCBTYWx0ZWRfX+iI9OuNq2qoF RH5OR6DGdrwtklMCZwjx4Ho5ZFp3Gze/B+UDaODbJcDECC5hV0xojjd+FijyWb3ixhaO/Tvo/cS DQrW/7c20Cj42Xm1pWZ5+xCXfMexI2HEPgCb7KGt3yu28OBD2XdUxOSERsbB7SBgv7c/fY69/S+
 HLS5P1GS/VivI0k0qWedhwMDNp15fF8ijqR8XmuG8kw1sbUVUi/grj2G7SfN2sZMXnFTfwn7Zyt 4M1LHbK3KkLRnaaNsvfI9p+d5ZI8FzFdRSe7sebuPtUSjW80m/Dmn/Wap/6/icsMqVLpKJ8xPxV Zzk6z/f/MfegiDwIThy4NQuqml0tsYBgK4Y2Q0Sr1p9N7KYiH5VyPYb4TftcmP/IwpBX93YJ4+A
 UPi8UK1pKi1L+em3rDZMbqSWqo0OZtfx3ogycDupvszP4d3d3/gFRDyRv4743zI6ZQKqtJcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290078

On 4/29/25 5:52 AM, Maulik Shah wrote:
> DDR statistic provide different DDR LPM and DDR frequency statistic.
> Add support to read from MSGRAM and display via debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 5de99cf59b9fbe32c0580e371c3cc362dfabb895..ee11fb0919742454d40442112787c087ba8f6598 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -1,8 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2011-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> @@ -24,6 +26,17 @@
>  #define ACCUMULATED_OFFSET	0x18
>  #define CLIENT_VOTES_OFFSET	0x20
>  
> +#define DDR_STATS_MAGIC_KEY		0xA1157A75
> +#define DDR_STATS_MAX_NUM_MODES		0x14

Numbers (count) make more sense in decimal

> +#define DDR_STATS_MAGIC_KEY_ADDR	0x0
> +#define DDR_STATS_NUM_MODES_ADDR	0x4
> +#define DDR_STATS_ENTRY_START_ADDR	0x8

[...]

> +static void qcom_ddr_stats_print(struct seq_file *s, struct ddr_stats_entry *data)
> +{
> +	u32 cp_idx, name;
> +
> +	/*
> +	 * DDR statistic have two different types of details encoded.
> +	 * (1) DDR LPM Stats
> +	 * (2) DDR Frequency Stats
> +	 *
> +	 * The name field have details like which type of DDR stat (bits 8:15)
> +	 * along with other details as explained below
> +	 *
> +	 * In case of DDR LPM stat, name field will be encoded as,
> +	 * Bits	 -  Meaning
> +	 * 0:7	 -  DDR LPM name, can be of 0xd4, 0xd3, 0x11 and 0xd0.
> +	 * 8:15	 -  0x0 (indicates its a LPM stat)
> +	 * 16:31 -  Unused
> +	 *
> +	 * In case of DDR FREQ stats, name field will be encoded as,
> +	 * Bits  -  Meaning
> +	 * 0:4   -  DDR Clock plan index (CP IDX)
> +	 * 5:7   -  Unused
> +	 * 8:15  -  0x1 (indicates its Freq stat)
> +	 * 16:31 -  Frequency value in Mhz
> +	 */
> +	name = DDR_STATS_TYPE(data->name);
> +	if (name == 0x0) {
> +		name = DDR_STATS_LPM_NAME(data->name);

I'm not super keen on reusing the 'name' variable, maybe turn the
outer if-condition to switch(DDR_STATS_TYPE(data->name))

> +		seq_printf(s, "DDR LPM Stat Name:0x%x\tcount:%u\tDuration (ticks):%llu\n",
> +			   name, data->count, data->duration);
> +	} else if (name == 0x1) {
> +		name = DDR_STATS_FREQ(data->name);
> +		if (!name || !data->count)
> +			return;
> +
> +		cp_idx = DDR_STATS_CP_IDX(data->name);
> +		seq_printf(s, "DDR Freq %uMhz:\tCP IDX:%u\tcount:%u\tDuration (ticks):%llu\n",
> +			   name, cp_idx, data->count, data->duration);
> +	}

> +}
> +
> +static int qcom_ddr_stats_show(struct seq_file *s, void *d)
> +{
> +	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
> +	void __iomem *reg = (void __iomem *)s->private;
> +	u32 entry_count;
> +	int i;
> +
> +	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
> +	if (entry_count > DDR_STATS_MAX_NUM_MODES)
> +		return 0;

-EINVAL

Konrad
