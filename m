Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA61A238F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913128; cv=none; b=EXDhF7qnAfO7VwjFHi4SvLk2xMaiCesBVC+Nwx8H983oC6Y2ic0TeRPWceXlGj4ku34tXherg8YBhgtSmU+GAXm0Id1COD2hpoAA8Zu+D1Igej78EcVIeKCvnGQxynvJyvKiHVIF4cOixNInmzvMiYa4vK3qmual7NnJG57tezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913128; c=relaxed/simple;
	bh=O0aqnBT9JAAVKCeAK3LfeehnqqGfJKXDwwwFQNpDHRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kTsNhwP/g3T+fjeFebMRaeXq8KVmlo8MeweVMKfUzudxHE1r1ug+Dzy4VTaIvyBiqmrLbMgojTjVPbWsAxMCAlzWQzz6fN2bgbCR/AeU5cCZDsSnAkgLMuxtLcQ8r/uJtzCQu8wOo9WcMEMEX1gBrlNZZsn2pgpUn4Bp+5qtSFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDsz/CNG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDsz/CNG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176Wuli009174;
	Fri, 7 Feb 2025 07:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsR/l7juiq4ts5nn339YbMnXmxHjFM8kaFQiNj600+w=; b=hDsz/CNGBR131zDp
	hcI9ZSlp06L1IljgZOoNaYowp6tamoWPmVJwVFsvCJ4A9Ci3+jye80lxRI6ETDXd
	KquCFoUMnMYo37pNlPyYELgekwQrw1/4XLHWwDuEgeSRGGQmdS/wAtR0dxNZ+79a
	+SfOn0y9y8MTUk9fSffwusjQlBaqTi4FtRr9RM6SxQcPAwN5ZAYghWEQYPm6iy5A
	WSrql/vHP7k//o1j+9aym0tf5gGOJeZHPKZOVSBXbYyfHahiBAUc/P7c1LN7rJho
	r3OG9NZv3gcaTpC9sICG7c5Hh41gFFU4TvrLPI1FC3Y+LwJZFCif0ZLQaHoea2Yd
	kvcZUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f04a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 07:25:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5177PFwb011606
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 07:25:15 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 23:25:10 -0800
Message-ID: <a2d221a7-ca6d-4956-8537-bee39e89f61c@quicinc.com>
Date: Fri, 7 Feb 2025 15:25:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        <kernel@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
 <20250206103213.GB8855@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250206103213.GB8855@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tnsEgEBAKxKwCDPY-SvT6kd_vqoOjR6A
X-Proofpoint-GUID: tnsEgEBAKxKwCDPY-SvT6kd_vqoOjR6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_03,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070056



On 2/6/2025 6:32 PM, Leo Yan wrote:
> Hi Yuanfang,
> 
> On Fri, Jan 03, 2025 at 04:01:54PM +0800, Yuanfang Zhang wrote:
>>
>> When multiple ETMs are enabled simultaneously, the time required
>> to complete a flush in the process of reading the TMC device node
>> may exceed the default wait time of 100us.
> 
> Have you tried how long time would be safe to wait for the
> TMCREADY_BIT bit to be set on your platform?
yes, 400000us.
> 
>> If the TMC capture is stopped while any ETM has not completed its
>> flush, it can cause the corresponding CPU to hang.
>>
>> Fix the by checking the TMCReady bit after the flush. If TMCReady
>> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
>> and stop the TMC read.
> 
> When a timeout for TMC flush and stop is detected, if the driver
> arbitrarily bails out without disabling TMC, this would leave the
> hardware always on.
> 
> I would like first know if a longer timeout can fix the issue.
> 
> Thanks,
> Leo
> 
yes, longer timeout can fix this issue.

>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
>>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
>>  2 files changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
>>         return;
>>  }
>>
>> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>> +       int rc;
>> +
>>         CS_UNLOCK(drvdata->base);
>>
>>         tmc_flush_and_stop(drvdata);
>> +
>> +       rc = tmc_wait_for_tmcready(drvdata);
>> +       if (rc) {
>> +               dev_err(&drvdata->csdev->dev,
>> +                       "Failed to disable : TMC is not ready\n");
>> +               CS_LOCK(drvdata->base);
>> +               return rc;
>> +       }
>>         /*
>>          * When operating in sysFS mode the content of the buffer needs to be
>>          * read before the TMC is disabled.
>> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>         tmc_disable_hw(drvdata);
>>
>>         CS_LOCK(drvdata->base);
>> +       return 0;
>>  }
>>
>>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
>>                         ret = -EINVAL;
>>                         goto out;
>>                 }
>> -               __tmc_etb_disable_hw(drvdata);
>> +               ret = __tmc_etb_disable_hw(drvdata);
>> +               if (ret)
>> +                       goto out;
>>         }
>>
>>         drvdata->reading = true;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
>>         }
>>  }
>>
>> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>  {
>> +       int rc;
>> +
>>         CS_UNLOCK(drvdata->base);
>>
>>         tmc_flush_and_stop(drvdata);
>> +
>> +       rc = tmc_wait_for_tmcready(drvdata);
>> +       if (rc) {
>> +               dev_err(&drvdata->csdev->dev,
>> +                       "Failed to disable : TMC is not ready\n");
>> +               CS_LOCK(drvdata->base);
>> +               return rc;
>> +       }
>>         /*
>>          * When operating in sysFS mode the content of the buffer needs to be
>>          * read before the TMC is disabled.
>> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>>         tmc_disable_hw(drvdata);
>>
>>         CS_LOCK(drvdata->base);
>> -
>> +       return 0;
>>  }
>>
>>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
>> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>         }
>>
>>         /* Disable the TMC if we are trying to read from a running session. */
>> -       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
>> -               __tmc_etr_disable_hw(drvdata);
>> -
>> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
>> +               ret = __tmc_etr_disable_hw(drvdata);
>> +               if (ret)
>> +                       goto out;
>> +       }
>>         drvdata->reading = true;
>>  out:
>>         spin_unlock_irqrestore(&drvdata->spinlock, flags);
>>
>> ---
>> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
>> change-id: 20250103-fix_cpu_hung-b5a95179ada4
>>
>> Best regards,
>> --
>> Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>
>>

