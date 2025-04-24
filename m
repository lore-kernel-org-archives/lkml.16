Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE477E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463550; cv=none; b=gyh0OXySEPBBLR6Siyq74owC7DlOKMWSrIOJ4cIzChCAXjNZI9d3PodO5+yum8mjqMIRk9fQgr628y8XxtrMvOdqRSXGkTtyYviTVQWneSOGqITj/R1iu0mcfaTr+t8HlLA4dYL/+0NjxMADD/Y6wA1dDZ4WnX3k8N3EWOhMUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463550; c=relaxed/simple;
	bh=Sh890rGKudDlXxi7yitLnH+1F5vTwN4R/Va0ZLwNZDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDAfjtJRb1lQ77TrEzg5VD0hTwj3E4R/Dy/xWz5sFhn8CD40agawagJUtYVMXVL2Rv+5QYuiGuQifX6Gt4p2uLEENIJzAJUa0VskbCt/jyTYBPTxZdfHaF5IjKEM3qKRRn7vyJezwsYyNgsysAP6FGscsA/dB/Mbm1V2VB1P37c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6crTg6+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6crTg6+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0Fl9A007098
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AY8TuvINZq3xaLhDJPXgJlOQHqLQNDKDcNKgYWGRTk4=; b=l6crTg6+kMI1540S
	ky4VuzKWaBxcvgVVLXxBnyvhFjH7vCr00jRgLrveGff9wpRhZKW26yx957FDEL4T
	TkbekYOptWOpA4q7cwjNRT9uSA6KTg/+nnXVMnQhRRxpTGpRgDVU4tElbuFhRjT5
	kNzzNe3eHSCOLB43mpthliHh8Rly98Bv0W59WAFlol2njVhN5E5Hz+1MCiswE6Qb
	3qq8eabENHCQKHJz92zn05zjlNNDKuHLm0bhKRx6jDNj6NySwhWfqdvbBk4s7QL3
	4RZSXmXLybbd8N/0eYp+gHpivlKct+noQWsvCMPWXYw0qLC/tHOgf18445kfEPPZ
	HgOyrg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0410b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:59:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-223fd6e9408so9789785ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745463545; x=1746068345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AY8TuvINZq3xaLhDJPXgJlOQHqLQNDKDcNKgYWGRTk4=;
        b=mRmurUXPcirh+eIbyxmVmORDRDJgkVdb3+BGYXPcc413EOh40QXJAROKghbCLn+GaQ
         GGh13JkLgHFEhADx7Pl+XvjnaBN03+86yDsOcIhiH4/Ts8idb2klzAAna+3c+Lhi90H5
         Zew3EI1H4ukv0xOa29yfy3OAaMIX643rVuQg5yeFQxO4PnOGwSCIdfQZXiDKrpyxguKr
         CLeIyRcyWZe1NMTBOHuhVbE50VME/DzUnvMzxflTj9KldOPZvgon7ri7OmcpwnoAilQs
         auwyFV0xMhNByYRBpRWbaoaVrGkk5ZJCKg6/hvME/7LvcKWr8mMgPUSm4DNnlhoeyTq+
         pRgw==
X-Forwarded-Encrypted: i=1; AJvYcCXCAY7vlMLfnSDrYbFJI9LgGVi1d3dWvKdHZA9BUC04hoBFKfPU+a6eV/u5yqdlhMaBKnfJlzicU+cLJRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dJPrKryNLBvMvM0ir0ZpizkNE1pzadc1c5X9CVl73S8eV2Ct
	8xCoYXnn1K3EAnqYVZ4osS9dGj7ytN+uo2mbfHPSshLH5M4LBmyaUu45ERMAyBNaWua+FBbccaw
	nzBPKO+/XfW2Kh2MYGW0z8CD2bcoof7C3RFougAmcoD0/zlnUDmiZHUdKGSzzmq0=
X-Gm-Gg: ASbGncucEt3k662HtUBHsA9Ud+68enojTs1v0kMqdORhTuaNUIrzzDKpzwYX9CQ4ILN
	U4bCJvzKnSUs97wl+rzmMHC27JtrSR/FxHFF1pVEAdKFDMTGVG/N0aSZqS47ZdFAihn+6yuKIlF
	qWPWyKYuskfw7AB/+Jg3JnH5RwfSKl5mTmCXF5RO4PFHPLO8Vj9Au1p5miuR4JeHkyQvZyguxVs
	zKoum7SYoocWFolb8zxUluMM087tgQWulRr92M0XZ12/RGOeBTa0V0lCo/1OmCJr99rJYDYL3PA
	wceFu0ieooH0CsnVTiQb/He5w09Kt60MMvQ0ClNNFuZ1HA+POJH5Zvja+ytcIn4EIkSBPNIk
X-Received: by 2002:a17:90b:5104:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-309ee3f9ac3mr1009144a91.11.1745463545401;
        Wed, 23 Apr 2025 19:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1uoQJIfPOjYS5c0t8qEcdJBa/XSSVaDhhDbxUVf2wYW3p+2ufJ1iKpn+iSg1y1zlPpsMSVQ==
X-Received: by 2002:a17:90b:5104:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-309ee3f9ac3mr1009128a91.11.1745463544995;
        Wed, 23 Apr 2025 19:59:04 -0700 (PDT)
Received: from [10.133.33.184] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm120027a91.36.2025.04.23.19.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 19:59:04 -0700 (PDT)
Message-ID: <87314d4c-e98e-4fc2-950c-52593a7a9ffb@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:59:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: tmc: fix failure to disable/enable ETF after
 reading
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
 <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7Vi9sZBMfkwp445im8fbjeEZOB5_8saTsXhYj3aoRRPdFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAxNSBTYWx0ZWRfXxrj4lgporbsd cT38csithc6iPmqLEAMq2kIY2DIjt6nmQgc5u8L4Z1d6oIaflBYuyaJC0Yx8ZydzYfAZNVb7uul YoRPmvz5/5+jgsHEqdjxL6hVL4yr5Hq6jFmozEsZwJVmYeD+Bpofu4ZIfkHM5SqGickasQ0X87E
 S+li9UB9idWG7aMjds9NXUJ2KoaU/TvcLlzA0WkcuWX4Ef4EDZ3zp8HfhoEmekZS2+hFSVyPG73 fpSaJOEOigFM4BEEkHfRzekCYs9bC1tDbOD8Ux9Xogdsf/7qco8HQ2gK5W7Qmhl7OYpriK6OKE7 JICwaJEMEb+BS5vDz7WxVRADGC+56ow59HWGE6QAHhxlAe3HPUSDChPtlxRH+aTuyZI3fBC84sY
 FW0Bxu+ksYwcwT2lCtTmNXWbq9xrJj88cWa6mdSB3tjwzHW/LEPpQalq2lOUzT4nEITqjQIE
X-Proofpoint-GUID: ADvgjEgwGX6WW4rt9aju48T7VHeQQntl
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6809a8fa cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=6sRczlYm9dJ-c3QEjcgA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ADvgjEgwGX6WW4rt9aju48T7VHeQQntl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240015



On 4/23/2025 9:56 PM, Mike Leach wrote:
> Hi,
> 
> On Wed, 23 Apr 2025 at 11:37, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>>
>> From: Mao Jinlong <quic_jinlmao@quicinc.com>
>>
> 
> What are these extra email addresses for?

Sorry for the mistake. I did not aware the commit author is changed from 
me to the original author.

> 
>> ETF may fail to re-enable after reading, and driver->reading will
>> not be set to false, this will cause failure to enable/disable to ETF.
>> This change set driver->reading to false even if re-enabling fail.
>>
>> Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")
> 
> This SHA and message appear not be present in any upstream / coresight branch.
> 

detail for the commit from linux-next git:

commit 669c4614236a7f78a2b693d0024cbdfa8536eb5a
Author: Yabin Cui <yabinc@google.com>
Date:   Fri Jan 27 23:10:01 2023 +0000

     coresight: tmc: Don't enable TMC when it's not ready.

     If TMC ETR is enabled without being ready, in later use we may
     see AXI bus errors caused by accessing invalid addresses.

     Signed-off-by: Yabin Cui <yabinc@google.com>
     [ Tweak error message ]
     Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
     Link: 
https://lore.kernel.org/r/20230127231001.1920947-1-yabinc@google.com


>> Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> index d858740001c2..8c9f14e36bc2 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
>> @@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>>          CS_UNLOCK(drvdata->base);
>>
>> +       /* Check if the etf already disabled*/
>> +       if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
>> +               CS_LOCK(drvdata->base);
>> +               return;
>> +       }
>> +
> 
> What does this have to do with the stated function of the patch - this
> is unnecessary.

I agree with you. I think it's ok to disable a disabled device again.

> Under what scenario can this function be called with the ETB
> previously disabled?

Combined with the fix code below. It may appear a scenario that the ETB 
is disabled but the mode is CS_MODE_SYSFS.

> 
>>          tmc_flush_and_stop(drvdata);
>>          /*
>>           * When operating in sysFS mode the content of the buffer needs to be
>> @@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>>          char *buf = NULL;
>>          enum tmc_mode mode;
>>          unsigned long flags;
>> -       int rc = 0;
>>
>>          /* config types are set a boot time and never change */
>>          if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
>> @@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
>>                   * can't be NULL.
>>                   */
>>                  memset(drvdata->buf, 0, drvdata->size);
>> -               rc = __tmc_etb_enable_hw(drvdata);
>> -               if (rc) {
>> -                       raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> -                       return rc;
>> -               }
>> +               __tmc_etb_enable_hw(drvdata);
> 
> Dropping a valid error check is not acceptable. If a TMC cannot be
> re-enabled, then that is a hardware error that needs noting and
> dealing with.
> 

That's the issue about the error check. __tmc_etb_enable_hw may fail due 
to hardware issue or just a timeout for tmcready(may restore). The error 
check captures the error and returns directly without setting 
drvdata->reading = false.

So the current mode for ETB is CS_MODE_SYSFS, which implies the device 
is enabled but actually not. This prevents us from processing another 
enable/disable session for the ETF if drvdata->reading remains true.

Thanks,
Jie

> Regards
> 
> Mike
> 
>>          } else {
>>                  /*
>>                   * The ETB/ETF is not tracing and the buffer was just read.
>> --
>> 2.34.1
>>
> 
> 

