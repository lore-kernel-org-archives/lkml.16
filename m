Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F7246BCC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277843; cv=none; b=LJFqYSHyefl6qGI0ZV/q163qTtOLApn4RrPUBwwzRU69NYkx1vkCuVfHPQ5Vp/sd6Vavbt18egZQyIvD+SbcruMzqnWk1Bk9L8HagG2YgoG8L24nGu28ADjHAKsXwU6+xeQZUi1+YIReo/R890Lw9BKerH1PAaa/7svp/DWDaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277843; c=relaxed/simple;
	bh=AEODnrMS16lb5KVlrtGAqxppDZZws9s1JxVfGXYy7yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Dfbl6UVJsop1XiYtH/6x0lfnbbXYNunVBjCpafvBbodEJl8VkszXT+VpL69qAtYt08c80PIwirNDP7kRHVViOH1QJkGKX1QHROEBxrGboCASWKypARUOl4SU5apBjWd7XVdzw9JHy2qqhCiAHvwUGPUbnaVSxZmpY+p5ebdKmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SKHd8eGc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SKHd8eGc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DDPP018597;
	Mon, 30 Jun 2025 10:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJKWEiBayTIfW0AYuKnleMaC6ErR2HE+2N2I/JaciHE=; b=SKHd8eGcbHn/z6bm
	P2fgX42kptcG4nHQCDWp4NU8my23o32XN3ZqJHGUjPTNKvzgSgewH+Ps/5K3l9qa
	wpIUCrTH0NlcvHPCgQ8y24bSbm/hjSmJuSpjhQiGLazCKIerwvYQrMi11PGn28zw
	UCrQx89eI4ecdiA7RZx+G2b7WwIKFVzjW6ItGDoin55ucW8m354NJ71yPjQMtWQ5
	0CgvsNFyfpeL5safYRXZ2lpzGef/2DVdME3MPcyL7hSteRhgdIhLq43u1cM8bWAG
	8/sXea6xb/sThw2e+W0QMWaGFQYT3CNy7yeLrT8UJ/txCoXmVbSh1uS48Wji4+l3
	/OW/iQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxc98p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:03:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55UA3mJ2020557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 10:03:48 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Jun
 2025 03:03:45 -0700
Message-ID: <416f8284-ad98-4922-96d8-7ec873f7b9b8@quicinc.com>
Date: Mon, 30 Jun 2025 18:03:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: Add configurable timeout for flush and
 tmcready
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, Leo Yan
	<leo.yan@arm.com>
CC: <kernel@oss.qualcomm.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250627-flush_timeout-v1-1-2f46a8e9f842@quicinc.com>
 <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <78f2179d-26c2-47f0-bc19-b72e5e51ad29@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4MyBTYWx0ZWRfX1lv9szCI4A2q
 JMbUVgNERJbDT0tyZU6JRvwgk2l5DKwPGWBwZJlcAYOUq5Zi7GrVuL2YmXJvmWxtr4yLJfJm/Rk
 1WtJlxB8lmrvNrOHRD3nwS2MEIHtfTGZhNoH4UY8gksTSywP6ods9XA/IY4jIReWVt7skH7Yd04
 FG8BLEdjXERrVlulKkv7Crqm7K61jwxVEEKOd5WfmdsRqYxyL6ZLdRAQNy+TH7Bb5BaNE4XRtvf
 3RVCLPU8WLnYaOLj4EEo4r2YAfyIr9z+HoHGNLtEYleNhVHJEoY75Hoj6w+GjxGjdX/Rxfw5hI7
 IfH2X7V6AXYfjWYak0Gu6UpzvLcyBy9MUe3TjcT9muU7esjEI2qWp4uF+0OFpb5vf4MOm1Vn68X
 joPgAsdAKgWt1LAp8ykc1ZZhVPVSqhbVRMckEdDZoyKJNPiNYz0RtnAcQahvceWtamIdeSYM
X-Proofpoint-GUID: nArRLsHPLiAPnZli7AK9LYgX6c9q9yBG
X-Proofpoint-ORIG-GUID: nArRLsHPLiAPnZli7AK9LYgX6c9q9yBG
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68626105 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=l3ZCduS5h3iTd8WGH-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300083



On 6/27/2025 7:23 PM, James Clark wrote:
> 
> 
> On 27/06/2025 12:10 pm, Yuanfang Zhang wrote:
>> The current implementation uses a fixed timeout via
>> coresight_timeout(), which may be insufficient when multiple
>> sources are enabled or under heavy load, leading to TMC
>> readiness or flush completion timeout.
>>
>> This patch introduces a configurable timeout mechanism for
>> flush and tmcready.
>>
> 
> What kind of values are you using? Is there a reason to not increase the global one?
1000, Because only TMC FLUSH will face timeout situations.
> 
> I don't think it's important what value we choose because it's only to stop hangs and make it terminate eventually. As far as I can see it wouldn't matter if we set it to a huge value like 1 second. That would only cause a big delay when something has actually gone wrong. Under normal circumstances the timeout won't be hit so it doesn't really need to be configurable.

But in some cases, TMC doesn't hang up, it just requires a longer waiting time.
> 
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c | 43 ++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> index 88afb16bb6bec395ba535155228d176250f38625..286d56ce88fe80fbfa022946dc798f0f4e72f961 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/init.h>
>>   #include <linux/types.h>
>> +#include <linux/delay.h>
>>   #include <linux/device.h>
>>   #include <linux/idr.h>
>>   #include <linux/io.h>
>> @@ -35,13 +36,31 @@ DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
>>   DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
>>   DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
>>   +static u32 tmc_timeout;
>> +
>> +static void tmc_extend_timeout(struct csdev_access *csa, u32 offset, int pos, int val)
>> +{
>> +    int i;
>> +
>> +    for (i = tmc_timeout; i > 0; i--) {
>> +        if (i - 1)
> 
> I didn't get what the if is for here? Removing it does basically the same thing, but if you do want to keep it maybe if (i > 1) is more explanatory.
sure.
> 
>> +            udelay(1);
> 
> Can you not do udelay(tmc_timeout)?
sure.
> 
>> +    }
>> +}
>> +
>> +static int tmc_wait_status(struct csdev_access *csa, u32 offset, int pos, int val)
>> +{
>> +    return coresight_timeout_action(csa, offset, pos, val,
>> +            tmc_extend_timeout);
>> +}
>> +
>>   int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
>>   {
>>       struct coresight_device *csdev = drvdata->csdev;
>>       struct csdev_access *csa = &csdev->access;
>>         /* Ensure formatter, unformatter and hardware fifo are empty */
>> -    if (coresight_timeout(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>> +    if (tmc_wait_status(csa, TMC_STS, TMC_STS_TMCREADY_BIT, 1)) {
>>           dev_err(&csdev->dev,
>>               "timeout while waiting for TMC to be Ready\n");
>>           return -EBUSY;
>> @@ -61,7 +80,7 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>>       ffcr |= BIT(TMC_FFCR_FLUSHMAN_BIT);
>>       writel_relaxed(ffcr, drvdata->base + TMC_FFCR);
>>       /* Ensure flush completes */
>> -    if (coresight_timeout(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>> +    if (tmc_wait_status(csa, TMC_FFCR, TMC_FFCR_FLUSHMAN_BIT, 0)) {
>>           dev_err(&csdev->dev,
>>           "timeout while waiting for completion of Manual Flush\n");
>>       }
>> @@ -561,11 +580,31 @@ static ssize_t stop_on_flush_store(struct device *dev,
>>     static DEVICE_ATTR_RW(stop_on_flush);
>>   +static ssize_t timeout_cfg_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    return scnprintf(buf, PAGE_SIZE, "%d\n", tmc_timeout);
>> +}
>> +
>> +static ssize_t timeout_cfg_store(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 const char *buf, size_t size)
>> +{
>> +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return -EINVAL;
>> +    tmc_timeout = val;
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RW(timeout_cfg);
>>   
> 
> Seeing as the existing timeout is global for all devices, if we do want a configurable one shouldn't we make the global one configurable rather than per-device? That seems too fine grained to me.
sure.
> 
>>   static struct attribute *coresight_tmc_attrs[] = {
>>       &dev_attr_trigger_cntr.attr,
>>       &dev_attr_buffer_size.attr,
>>       &dev_attr_stop_on_flush.attr,
>> +    &dev_attr_timeout_cfg.attr,
>>       NULL,
>>   };
>>  
>> ---
>> base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
>> change-id: 20250627-flush_timeout-a598b4c0ce7b
>>
>> Best regards,
> 

