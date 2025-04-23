Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AD720C001
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745450409; cv=none; b=st3jrwPmMLMNrrMb4zpY4NKHTyN3r/7i9/wegss+eTL50LAb3+j9b/9tIEbUMg9XZ0VE1JPILV4EhqAu8qyj6RmegU/5IA7QNHGm437Wk3hx1grGmMgEihWr4SjLH/aK/qxjPkbLHupFb/R1FNG90xMROeUf2T2Riib1Y+7ByoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745450409; c=relaxed/simple;
	bh=GxZMqnYuxay3VCptew8dlY7FkRAzEVQXjKJd8DhvsBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4QAMKV59HDqlPaYI2ypS62TQ0KG3I2fqvZwjc49BHH9MGDKt6Qu7UYsrfH5viHu+Q8meiUA9YFZ2S9H4dLmjt4LE+S+3P6UD992Ii3gS9yGtTWOIsBu6eyG+ZLVvVROPNtUzgDljeflEyejSQa094Lb6rGsv1E9pkVMIaN7XxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWtxJWd3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWtxJWd3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NLHdUL007721
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRyddFgEaNgMLLlYJv03Ma5/jy5fT/40JXHI+meT7zI=; b=WWtxJWd36j8NYqvI
	XBhvzejX93bevRBIFj37WA/CGSjNRS9VRGVDhluyJPDXIDoHVJMb6IFGLrHGv6I6
	izIaQWF29lH8ic8VpmuM/KNSg/NReEl6sXXX4cNZ9k7g0TBRSyjr6BPfpp2ARV0K
	AJOupnCVAqk2HwZHcm0MLE8pO8bmMeBRiKbCjAZN4FjD4BZ0vA+12UDGZr7Hs8Mn
	vIlgWMzeNe+ObmZe/8Y0Z4KHqLXFepLHC/7sSEfGw+Onyqaroeoyl+QExrqKN9bL
	jXBSaTYufKYCbohJY9QnfESo9xHsL7qkJgr9FLoaZMNF9faxn2JrEQ7CBkNuvR78
	ZF2dWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5bmgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:20:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8340d547so323122a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745450405; x=1746055205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRyddFgEaNgMLLlYJv03Ma5/jy5fT/40JXHI+meT7zI=;
        b=RFCX8gBNjfMa25KlkEaRbLWZwYLRMI/2g1cckas2h9/nWK4QnrVUwKlNtGVW9FQfOX
         zawOD9jhIgVNOms3Vgn6On+LSUr4205YupsVwJ+oJF16yHkg1u+53hfXME9d6i7yYHxE
         bDQKbxN8sTZR790ZScOBhVdOtezdbrWvoX616TJGrWSw5uq0IwbVCtB6IAc2V2lltV3w
         67hzBNw2fyV1QIeew8W5d2yhp1KcQR9DNeb4NB71mYOB5Ppb2XBrQnYxJRKyzznL2rAy
         y/kqy/pnXWqiloHyKOqs1P9hxwhpvQLiIKt0rcMXEw+L27pcyrp4a8PZtGvvgclWqqST
         l3cg==
X-Forwarded-Encrypted: i=1; AJvYcCUn5N6fVArpoc/PyqaaNAPRv6iqDF8NwqbzQWeO5DDbejhkzyL8EygrHE5PZGAXlOSg9Yybzlt8FGVfTVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNzzgbFnj3ilyS2BXmev5hYlIunaeueINU4EM3g/bRBzCx0Ex
	cRIWDKVViJgBLsEzsfd8eBZqNuUSGb4635KWr6Es2zcPZg6BGAvxTdudJZGGzWqQRwYlLMraYDe
	NNAhHQ/vldfVFTlswWKrgMwluXExjyNpVaaKKt6VjMreJZnaVFffezKkHafsVcXY=
X-Gm-Gg: ASbGncsDlPFqL0ezGzqoPXERrHLc1GVVth5tSZF7CKRVovuYxi3YFKasFqhUxr2g9UE
	mpH9UQIt19Xp2P2g6o2OWnCSAqQo9ke75Pp5IAbifWYCXnsqH2a91UE947vYtUgQPe89fqki+Rs
	4SekBASgtksIM89Ezc6JHF2wDm+/tpSlx1d3zNnE4VKLv9ZJPRlSFtYGAB1/Jy246+0T7L38O+p
	AiVFnKDiS8D+NDhldpmWZVSa527HFil2bp99R6R4mqG6PGUyS9/HlSqWQEuSqFwPFbXRqpNRXJw
	D3qhQrpP6M8RiD6g/tlPhpvN96n8oe6p1FnIs9EbOKUgcE7YdB+o91d5E/1CVKHvhlXOEzrMShy
	F
X-Received: by 2002:a17:90b:274e:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-309ed298e18mr890132a91.17.1745450405040;
        Wed, 23 Apr 2025 16:20:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMksh6QUEkA2VrQQYoNS0ljT/n3zsIGL0Yxw9gOlz/DfDxwsL6Jb3yx2E7fX9kIDGRh12+cQ==
X-Received: by 2002:a17:90b:274e:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-309ed298e18mr890093a91.17.1745450404453;
        Wed, 23 Apr 2025 16:20:04 -0700 (PDT)
Received: from [10.71.112.43] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa27059sm2258925a91.26.2025.04.23.16.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 16:20:04 -0700 (PDT)
Message-ID: <d622e3b7-3f62-4009-85fc-8f1d79fbb925@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:20:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5 RESEND] thermal: qcom-spmi-temp-alarm: Prepare to
 support additional Temp Alarm subtypes
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
 <aAI0Zm5M9ba9ehyI@mai.linaro.org>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <aAI0Zm5M9ba9ehyI@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1NCBTYWx0ZWRfX54gqkQPc96KR szgGvsdIRPiNVC5rfXJ0dqMGMfH2Wb/F81Ik0SJ51fAmX7Gws75S972UxfZ0iwq0cLg3Z9nk0aI KGyYky1bmFrvOnyKu/8USr4EXhROn9GHCvs8YoSdBIPBg6KN2xguAZZwGlTj7rJcsy8O6xhP3L+
 hcqmzqlqFiIOvivX40AU6MT+JoCPQm8t2xs5CZYnWxtbOFQRrfTnlmLArZu/hyHhnI1wJsJhq6o dMwai7y/YY4iV2NMlWRbbiSzByV0uzXEW/TJLTV0HrCe8NisNPJPUglB0WJx7W7GONnlN2HvAFY 4Xr8tK/Q6q0UGdUsDePFMbWX+llMVDdcbItMtZXk6roSxnuT85F+OG8URIsVKe2tSu7S3IRSw84
 qgT+oprgqjzVqqjjtxDKZCVPcZufJDjLYgML7yA2o8sPkMv3ZD2656JKutmYihRRZH0XyGgs
X-Proofpoint-GUID: FRzznHCiBA9pQhYzr1IcCQXe3fkyxtUw
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680975a6 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IMXF3EE_1CwuGGpSq0QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FRzznHCiBA9pQhYzr1IcCQXe3fkyxtUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230154



On 4/18/2025 4:15 AM, Daniel Lezcano wrote:
> On Thu, Mar 20, 2025 at 01:24:06PM -0700, Anjelique Melendez wrote:
>> In preparation to support newer temp alarm subtypes, add the "ops" and
>> "configure_trip_temps" references to spmi_temp_alarm_data. This will
>> allow for each Temp Alarm subtype to define its own
>> thermal_zone_device_ops and properly configure thermal trip temperature.
>>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 38 ++++++++++++++-------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> index 1cc9369ca9e1..514772e94a28 100644
>> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
>> @@ -1,7 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <linux/bitfield.h>
>> @@ -71,8 +71,10 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
>>   struct qpnp_tm_chip;
>>   
>>   struct spmi_temp_alarm_data {
>> +	const struct thermal_zone_device_ops *ops;
>>   	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
>>   	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
>> +	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
>>   };
>>   
>>   struct qpnp_tm_chip {
>> @@ -312,18 +314,39 @@ static irqreturn_t qpnp_tm_isr(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
>> +{
>> +	int crit_temp, ret;
>> +
>> +	mutex_unlock(&chip->lock);
>> +
>> +	ret = thermal_zone_get_crit_temp(chip->tz_dev, &crit_temp);
>> +	if (ret)
>> +		crit_temp = THERMAL_TEMP_INVALID;
>> +
>> +	mutex_lock(&chip->lock);
>> +
>> +	return qpnp_tm_update_critical_trip_temp(chip, crit_temp);
>> +}
> 
> The qpnp_tm_configure_trip_temp() is called with the lock held which is really
> unusual to have this assymetry when dealing with the locks.
> 
This change is simply moving these lines from init() into their own 
configure_trip_temp() function. configure_trip_temp() is only called 
from within init() so functionally this is the same as what the driver 
was doing before. As new temp_alarm types are introduced (like in patch 
4&5) they may need to configure trip temps differently.

Specifically the mutex_unlock() and mutex_lock() guards were added in 
this change: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/thermal/qcom/qcom-spmi-temp-alarm.c?h=v6.15-rc3&id=59edcd91d852f88ef7d208029503f9b5310d0603

> In the other side, this code assume it is ok the userspace can change the
> critical temperature of the board. Is it really a good idea ?

Sorry, I think I might be a little confused on what you mean from this 
comment. This driver has supported setting critical temperature from 
userspace for many years now.. 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/thermal/qcom/qcom-spmi-temp-alarm.c?h=v6.15-rc3#n264. 
This patch is just reworking driver, there are no functional/behavioral 
changes.

Thanks,
Anjelique
