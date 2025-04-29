Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB32BE0FF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923197; cv=none; b=JIpf6E7PG8E6ycgxsvEoWRCTPmGtqN9hTXsH3LuXL8spFws+4b091iGvpe0cAuYtDTGK08Lmlt/UYUL9Q8mU40WekSrjiaofkv0vXqro3wKHsDjitKKIwOU5jJCGO560+GHjdBh3LByboaccA9oL6WPMLEraY+WUD0NuFYcqZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923197; c=relaxed/simple;
	bh=Wt1uUaZUC9gFE+lR0BVVSbnamlOJ4Gb8HENknFzyCGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9+7x0eTiyOtTPXh+ZFHZElqlo225qI0+rNL+3w49PRENPz3FuUkRSSi51ugyiP+NZrF/O2t5RiDBh5TRY0V6iR9dE6VYT/EPS3wA1zbS4X8jxkL23D8J2oD2SfxDs40WDBwZXy1YaXb7BYAYVFl0tqvKB7se8BRiV6COFTWGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7RDeKL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7RDeKL2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA9bAd017905
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5jE47M0eHoQydL1B1vw+3WD5G/nAjGeXiqvD85rIVQ=; b=I7RDeKL2pxucPcNN
	LVqffMqJJcUvuIEyfpuIaG0JtJPXskBN0Xyrsraxjo/q7t5eKuAzGCxHIhSZX2oR
	6eySlNXZ3bSwSDYnAnZSA4p8sMPkQAWg3N4zqR2STqeTPkhylDRGjikqlD8ZE6NJ
	oh86kNQyyA//pBnkd7G6mGptXN6rK1MYDbLhMRfJyFNRODTj554bWKmdfVZ4SZpO
	inbcDS8BEGGezC0Z7ZKQyH1MT2X0r4Om1ONjqZ1OfKdk1MjhYm8xDayuqhAC1De3
	QlwYwkzETh7FFVXEMjaNKL/5jLGbB71OUozoaFvkzYxtK5d2cK/1UrpcqDSVxmSr
	3d3W0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5kcbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:39:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae537a9d6so8207331cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923194; x=1746527994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V5jE47M0eHoQydL1B1vw+3WD5G/nAjGeXiqvD85rIVQ=;
        b=nI2rOg0sybwLp1kcXrwgQ2hU0MkFtMAVLz0dpvAAkfmwrdzeW8EqTsOgVeRyetns/0
         9IUbCLiIbab0MMliuk0uB4HUfJXDta75TdLB28rHc0EwlFvKoinFpLYWR7JBs+dFPE9y
         gifNQQOvg2adtPIRvo+xLzJGzVJOfYWGa3YfXGLGurrkEfyCfq+Uqpj3UKA7MSgMhBHc
         bcbUNEMwmP/BX/KP0JK/uw1qwyHaJtCwSHnZQ4kyTOzQG9XvK3LsAEFhBbDGWJXoNybW
         vl1s05HaSMbg3LS9zfO6OIe+0vhOeOd949TDAG1iw7WpJTXM2/FIeeG48dgvznX9Se3X
         FoMw==
X-Forwarded-Encrypted: i=1; AJvYcCWWa+kxxuKkcgo/h2hDyDAU+HMDAtVqzh9HmS7rpwPOE+lUjMyrOrS1rfe7l6/ZfDj/BnXwfu0aXa38PK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2AG4j0K4kEfeTo5g7qukRCIk31ULKTmMWi3w36fEBKtuWVd+8
	icI3Ln+A8TpMZZNfPIkZ8tWU0m97jQTTGBu7bfhyg7NCs776SHG0b2RSOxD4flxqhONeS8qYCIo
	MjpJMwZZe7/bAYs6ZHac1iJYffLuiI7XcDbqAwYb7eMlqcwRYLxb7XX/hIGAAauw=
X-Gm-Gg: ASbGncvyQ25xdUQ/V9xuBL9n8yX6x0obbmp8A1icgyAq+0QifO2vlb6bM/ZeCx2hlAa
	K011c9vxhLMcpaquRg6TQKHng8v6rZ/UCwwA6BNg/KGm+SudlN3QgscBY+8VgRCy76sd+XQupIR
	Bf0S4+gj3M71V+cBKscHCCMKdeIv7HlMsAMRCchHyPWfQxCB8aB0NyiMAUj6XvUjDfci8UizOXr
	k1dZm4VorGmGGno/80iVO2HvjgKQRrJd0hGhhZWK/5++2DSUZ58YG64/GxpYYp/PQ6eEijiFjJK
	qsyMqGPccKW5WLgOxNFej/M3a7vd0mirveuXV3oy7OjdWzXkpgMT57HhzCIrEcPTSg==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr14890891cf.7.1745923193710;
        Tue, 29 Apr 2025 03:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7SXnXKwXXoJeyT2VfZNTdTn6rufhVqSRfwdCtlqA8GQfm6SJmi5Lyaui6Ikt+hM1jvsruoQ==
X-Received: by 2002:ac8:584c:0:b0:472:7a2:c3ca with SMTP id d75a77b69052e-488665065b3mr14890701cf.7.1745923193124;
        Tue, 29 Apr 2025 03:39:53 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf7397sm773772266b.92.2025.04.29.03.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:39:52 -0700 (PDT)
Message-ID: <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
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
 <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SxmSts2029rSfnnwlqQcZsLiKDOEKrSb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3OSBTYWx0ZWRfXzEI2CJy+iB17 q3AxByNjWXBJU7pAGfL/DwTnXhOvBkkGxBE3m82ITLDWR1/bJ0r7ChR3REYfja3Fvbv9DQ0kYwK 2/UsHHHYro6bwO9D/Hv8QQGy2abH8xy5KNrrjRj57xrCtKiPubrq18Pcqfg42g37Sd4qkIpdvYG
 TVeWuiLQoqc2rFoYeiOFCsESWAFWcwpm4O2DxVt9RXppcaEJ8//WezmKD7cqCDi4D7lclD8SqVq ym8nB8KEi/rrqLCNnP1sGqU56igyrMmq2xEBso+1xkunu/selLubh3AXTS/OTBtl8dch2af58hW FHvjQYJEHsum5BjBTqWfRwKn7+j73WKVNsIwuGbDkqLG6LkaXVY4nqxQto5tZ7FJhSmQXndHbry
 4k40B1y9ySN8cxPVzhY4anz7ahaD379vBw6hAbElXLng66vKqGttOt5c4uWPhCCHUgGKuHmz
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=6810ac7b cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Lg4MxL0JmYoKiIaoETMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: SxmSts2029rSfnnwlqQcZsLiKDOEKrSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290079

On 4/29/25 5:52 AM, Maulik Shah wrote:
> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
> ddr stats. The duration field of ddr stats will get populated only if QMP
> command is sent.
> 
> Add support to send ddr stats freqsync QMP command.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index ee11fb0919742454d40442112787c087ba8f6598..15bdb8e6a542bbab34f788ac4270f7759ca83e3c 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>  
> +#include <linux/soc/qcom/qcom_aoss.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <clocksource/arm_arch_timer.h>
>  
> @@ -37,6 +38,8 @@
>  #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
>  #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
>  
> +static struct qmp *qcom_stats_qmp;
> +
>  struct subsystem_data {
>  	const char *name;
>  	u32 smem_item;
> @@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>  	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>  	void __iomem *reg = (void __iomem *)s->private;
>  	u32 entry_count;
> -	int i;
> +	int i, ret;
>  
>  	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>  	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>  		return 0;
>  
> +	if (qcom_stats_qmp) {
> +		/*
> +		 * Recent SoCs (SM8450 onwards) do not have duration field
> +		 * populated from boot up onwards for both DDR LPM Stats
> +		 * and DDR Frequency Stats.
> +		 *
> +		 * Send QMP message to Always on processor which will
> +		 * populate duration field into MSG RAM area.
> +		 *
> +		 * Sent everytime to read latest data.
> +		 */
> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
> +		if (ret)
> +			seq_printf(s, "Error updating duration field %d\n", ret);

let's just return some error, instead of printing "error" successfully

> +	}
> +
>  	reg += DDR_STATS_ENTRY_START_ADDR;
>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
>  
> @@ -310,6 +329,15 @@ static int qcom_stats_probe(struct platform_device *pdev)
>  	qcom_create_subsystem_stat_files(root, config);
>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>  	qcom_create_ddr_stat_files(root, reg, config);
> +	/*
> +	 * QMP is used for DDR stats syncing to MSG RAM for certain SoCs having

having what? (you could drop that word and the sentence would still make sense)

> +	 * (SM8450 onwards). The prior SoCs do not need QMP handle as the required
> +	 * stats are already present in MSG RAM, provided the DDR_STATS_MAGIC_KEY
> +	 * matches.
> +	 */

Konrad
