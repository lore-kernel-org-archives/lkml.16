Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923D136347
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748545677; cv=none; b=HxzzJ1XjdF0lbmucSIY58dnbocaILfHvkzCrqeZn47kA2NhhXG2HKJZyZcHpOSCgnCraFl+5uXIvAROkCgioMD7sJonb8ANChwMtEM7QJfJ/CDS2BDibZU2ZAVTU/PHQwjt0cpTSMFA7RP0A5S3WucIZ900T5snzYZo5eHxWF6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748545677; c=relaxed/simple;
	bh=Y9/wIvTPGPbaia/ygwyG7lu/okfgCYkuhDeI142REbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kN2qWocVE6Y3FT9XHkVvao4C8b/XuCrZS2qEPXsPeLwUB+wIK2sKrvFit67LGtagwJdhAmn7uCpOcKLAqpWiF8Si/wpSCG0s4QbxxdwySZB/CKJ3r6KfdclgqTnBCrfBq3xOQjhcCdd3WV+MNPXxUWMxisuCPiHRspv5+fENWaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnvFzhDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnvFzhDv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1p75032356
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqWWxEjhd9byE+G7iHgmKGApOto/HY6xBgh2ceMrgG0=; b=JnvFzhDvNSVhh506
	DnLGaLR6MyrI55KfSidvRDKiORP+KT4yT5MP4qcb3EsAb7gZd4mfl9Uwz0NiS7ls
	CH5g3emwLWQEMkWC2+gKgzQL4hL4sJfC+VOnAouLtW4zp0p7QRAYKWmIKrd4/knp
	AWE3vmGydSWNj0Fg+nidjYv9QDMaKVTBuQUNBB+O3OfRjlNFwn+gpEn721ASk5Uc
	435TyvylKbWponiMGAAABWB9CQc2MEDme/KtJN/7Q6gLLvPCFF5U3ZTE6IkMiJBC
	9d2MP37ImIHvjjYTpq3a6Hw9vI7M1Zql4F+gJJQ+H78LN4ahKBHc1K4j8xUlbR02
	XmWBKw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjxr62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:07:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faaa088820so2955906d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748545673; x=1749150473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CqWWxEjhd9byE+G7iHgmKGApOto/HY6xBgh2ceMrgG0=;
        b=RVq/BkLjZzUaHvfNKC8U7g2Ws6jPIptQ9OHSJjY/e/+DNo1weO52CwtXz0UZIQHEBN
         f+ywG+6ruXgKXL147lPGiESJCJi4W2XUv2GdclAtrMF4SzablopCC6PZghTVIvVVzgEk
         NhRjsGeFvdC+dEp5k5Kjkfd0rAI5EfxUnY2bilfPpm/lzotGNSR18nhZ8cG/cfgBmwQb
         qtzDuDBil+WdcaoRYeu3Z1PpR3YAHirLXdd9z8ABXu5p3KFaKFV1ObY39xzZgVZzu5uR
         z1DOr1f+3EX+PqU5XBm23csA+ZEvqNwbjeuCPESofQDbnqBjvzyJ07hDLDahmnOPzYor
         NZZw==
X-Forwarded-Encrypted: i=1; AJvYcCV48pWVuU+ibc4qOnc8ErMa+2rizXBuRmI+LYY09gC0BUMfC1ZGGtVouVcgdtzJi38DKzxddTASmkgrcQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQurMTD2zluQRhv5ejpD71jEbeRIFW2YsS455/RHapa0f6f/a
	I8woygKV5uPUOtKPkJz0Za6Yjh2k4ZPERp1SI+yPpTWR3PpUMNQu0jIdjW92qL5C9VLo0DkxFgl
	043MxHo/Sij6A4ujcveffw98eu0rbsqOm8aX0dqj+2i6lFCM2quMm1PDu4N6jnT6EosX7aPBGha
	U=
X-Gm-Gg: ASbGncsUUWrc8vSOq6cyzYdqsQV64uS4fJQl2Sbb8aWKCg38wTYXiui3TPCSBcvXoJr
	h+WQhVC733mhX/X367VZVGCY+FKQd7OqEHRCEhI+3at097Rpfe9/2ZE/h/LMGLAFsmPp0TbidqJ
	SqfjMTOsi7BeE6xMKIcauAIYmlpLon9T55quqpAWsyQRzszXQ5X3v4tnFAWAd98zI6p1+UkIp6H
	6D2RdVJ/AHTWj+TEagyTyOEWQUh/W19A8pnhQFUMiXA9wUWgN/v3d0nojuhyzCCcH6dNNSOnu1i
	BCFkrrRVEHXJvf3pWQ4rexFUiO6C4C1DgjIEze6bZphhWdHuQkt37hU8TYhGHTq/rA==
X-Received: by 2002:a05:620a:40c3:b0:7c3:e399:3289 with SMTP id af79cd13be357-7d0a1fab4c9mr34135385a.4.1748545673120;
        Thu, 29 May 2025 12:07:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6fTbto8Ers/c4bHlYLggztbwikg2RvRjJ2GbWmBPA2RfY7pGoWtgPCowFqHPfhtiiq2N/g==
X-Received: by 2002:a05:620a:40c3:b0:7c3:e399:3289 with SMTP id af79cd13be357-7d0a1fab4c9mr34133385a.4.1748545672597;
        Thu, 29 May 2025 12:07:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3948csm186704066b.128.2025.05.29.12.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 12:07:52 -0700 (PDT)
Message-ID: <4f7168d9-8d8e-4fdf-8917-47c1cc71cf82@oss.qualcomm.com>
Date: Thu, 29 May 2025 21:07:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-2-b4b7dae072dc@oss.qualcomm.com>
 <6ldwvqqhk4lndesk7oac4ly2vhdxyd57f5hhijvutik5gm2czu@vmkasgeg2tmm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ldwvqqhk4lndesk7oac4ly2vhdxyd57f5hhijvutik5gm2czu@vmkasgeg2tmm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6838b08a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=o6kQi37HjthQItwaaD8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: FnZNY8ozoHR_6nD5U9xuH47gcajR8LN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE4NiBTYWx0ZWRfX5FCvhFzLVfWw
 h4OTjxzxQb6DMTiisds+2LY49MeSa5rfUGsey6kMDfogqK8sTGYG9UHSEi74MSEFPgmSfbV2RRi
 oAPAloU9CxM62XL/vhJttkBha4SiUb9xA3HHFxW6gx4fPtBSd8Xxk5qYODp/RTQe9Rto/wkXB6d
 Goz2zsPpPO+az2FYplp+ewhd12nQTr59LtspfyaRzqTdgQKOtaBYmHpOWLWk0B+oqrmCR8hmUz1
 nnM5HLK5FV2101xF8Pkeo3VbMt1O0Def2/xu6YUpwqX/P26egbydw4XI8+4Flx70MxQP8X8oFiY
 iUiVKUOpF2yMR148NcJ3MB0uub+3CiQmUJSpDfKROhWTvMJbJlyp0JOMc8XlefIq26DPQb8rVu2
 a9elnSSmQnYLrOkxS2yogIUPckziibUeRg1hGwJE/w3H5Wo7ofFyFWPW+TfX5dKjoaW9NO6J
X-Proofpoint-GUID: FnZNY8ozoHR_6nD5U9xuH47gcajR8LN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290186

On 5/28/25 1:02 PM, Dmitry Baryshkov wrote:
> On Wed, May 28, 2025 at 02:51:32PM +0530, Maulik Shah wrote:
>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>> ddr stats. The duration field of ddr stats will get populated only if QMP
>> command is sent.
>>
>> Add support to send ddr stats freqsync QMP command.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom_stats.c | 34 +++++++++++++++++++++++++++++++++-
>>  1 file changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>> index 33fd2a1574464768bd07289e743fbb79ba415e84..0545c8cbefb8f18758d4eb51638e4ecb94e05422 100644
>> --- a/drivers/soc/qcom/qcom_stats.c
>> +++ b/drivers/soc/qcom/qcom_stats.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/seq_file.h>
>>  
>> +#include <linux/soc/qcom/qcom_aoss.h>
>>  #include <linux/soc/qcom/smem.h>
>>  #include <clocksource/arm_arch_timer.h>
>>  
>> @@ -37,6 +38,8 @@
>>  #define DDR_STATS_TYPE(data)		FIELD_GET(GENMASK(15, 8), data)
>>  #define DDR_STATS_FREQ(data)		FIELD_GET(GENMASK(31, 16), data)
>>  
>> +static struct qmp *qcom_stats_qmp;
>> +
>>  struct subsystem_data {
>>  	const char *name;
>>  	u32 smem_item;
>> @@ -188,12 +191,28 @@ static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>>  	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>>  	void __iomem *reg = (void __iomem *)s->private;
>>  	u32 entry_count;
>> -	int i;
>> +	int i, ret;
>>  
>>  	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>>  	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>>  		return -EINVAL;
>>  
>> +	if (qcom_stats_qmp) {
>> +		/*
>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>> +		 * populated from boot up onwards for both DDR LPM Stats
>> +		 * and DDR Frequency Stats.
>> +		 *
>> +		 * Send QMP message to Always on processor which will
>> +		 * populate duration field into MSG RAM area.
>> +		 *
>> +		 * Sent every time to read latest data.
>> +		 */
>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	reg += DDR_STATS_ENTRY_START_ADDR;
>>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
>>  
>> @@ -304,6 +323,19 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  
>>  	for (i = 0; i < config->num_records; i++)
>>  		d[i].appended_stats_avail = config->appended_stats_avail;
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>> +	 */
>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(qcom_stats_qmp)) {
>> +		if (PTR_ERR(qcom_stats_qmp) == -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +
>> +		/* We assume any other error means it's not defined/needed */
>> +		qcom_stats_qmp = NULL;
> 
> I still think that we shouldn't be ignoring actual errors here. I'd say,
> check for of_property_present(dev->of_node, "qcom,qmp") before.

/**
 * qmp_get() - get a qmp handle from a device
 * @dev: client device pointer
 *
 * Return: handle to qmp device on success, ERR_PTR() on failure
 */
struct qmp *qmp_get(struct device *dev)
{
        struct platform_device *pdev;
        struct device_node *np;
        struct qmp *qmp;

        if (!dev || !dev->of_node)
                return ERR_PTR(-EINVAL);

        np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
        if (!np)
                return ERR_PTR(-ENODEV);

        pdev = of_find_device_by_node(np);
        of_node_put(np);
        if (!pdev)
                return ERR_PTR(-EINVAL);

        qmp = platform_get_drvdata(pdev);

        if (!qmp) {
                put_device(&pdev->dev);
                return ERR_PTR(-EPROBE_DEFER);
        }
        return qmp;
}
EXPORT_SYMBOL_GPL(qmp_get);


Konrad
