Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34090B661
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555376; cv=none; b=ixnE+CxF5WHrTj/j4UbKAtqooYFqHelVg+Jc6Dhl8avdqibZQrw5E7+0SFLsjz55GG//I2X5ywGpa1i0T3MTbOqR6wjwK2EyxQi6uaEOBAMSUEp7hJ8rGA0w3feepQKSIOOmIFIzqSjrN7eDsWNYmDM2wf4657XTmjO+KMRF9gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555376; c=relaxed/simple;
	bh=kLed025Tz5yOzDv7LYXtZZNH4WdON+UOqvRZIi15I9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jmwe2zbIDnJNzezPdYmdoE4Sdw5wJQz7BbyYfWNZabK+9JYMAbTtAoXNK3k+TXd5sQx0g8KkpjphJctAyhjtFzZWgx3ZIdKqgTHUMws7fXvv7BEKUHN2By7yBHHx4s86p8tJMFPTiVqy4Vy09FiaeBmgZ9IclefHRbEk2K6/DgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z0OHfjDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z0OHfjDq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531C4eBX001410;
	Wed, 2 Apr 2025 00:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQPdJka26Zt3f5JYNWnVHi8ewypPJUPCEoqjarXgSWc=; b=Z0OHfjDqasIQgEJP
	mVfMJYZxi7mwcE/g5i/J7Rb4GMWggUY5TAwJ+WiKnDenJY3kBMEJOigHtpdJ8gA7
	gK75On2CxZVc+zEvIXhWm/xlCW7a5+MdzZzcQJts52owp4t5xVyzPBkMf/SI2xBK
	J7e+Ox3hiImS9/bgthgkCu7samyyI6+84atIUx0Jo8PDlXgEmGB2DhT/iyjjSi4a
	Q+97vGhbrPIfMmskrCCkk3fOVs4fCw7E65Rbz9KBNvUR5KdCu8c06QKpFnB/WIQ2
	o0V5ZNt3SLvUozBCVU1lHASb0f3cM+ut/ryL0lTh83iq8G7dRcixAxk+AkFyEKsh
	uE2yEQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qhxtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 00:55:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5320twOu007562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 00:55:58 GMT
Received: from [10.133.33.107] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 17:55:54 -0700
Message-ID: <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
Date: Wed, 2 Apr 2025 08:55:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ec8b1f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=Jy6px9J2CyRB1KJ-eCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: DzYqgaASLaIqlX-980ncbcyes28NL15m
X-Proofpoint-GUID: DzYqgaASLaIqlX-980ncbcyes28NL15m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020004



On 4/1/2025 10:58 PM, James Clark wrote:
> 
> 
> On 27/03/2025 11:38 am, Leo Yan wrote:
>> CoreSight drivers enable pclk and atclk conditionally.  For example,
>> pclk is only enabled in the static probe, while atclk is an optional
>> clock that it is enabled for both dynamic and static probes, if it is
>> present.  In the current CoreSight drivers, these two clocks are
>> initialized separately.  This causes complex and duplicate codes.
>>
>> This patch consolidates clock enabling into a central place.  It renames
>> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
>> encapsulates clock initialization logic:
>>
>>   - If a clock is initialized successfully, its clock pointer is assigned
>>     to the double pointer passed as an argument.
>>   - If pclk is skipped for an AMBA device, or if atclk is not found, the
>>     corresponding double pointer is set to NULL.  The function returns
>>     Success (0) to guide callers can proceed with no error.
>>   - Otherwise, an error number is returned for failures.
>>
>> CoreSight drivers are refined so that clocks are initialized in one go.
>> As a result, driver data no longer needs to be allocated separately in
>> the static and dynamic probes.  Moved the allocation into a low-level
>> function to avoid code duplication.
>>
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c       | 30 +++++++++ 
>> +--------------------
>>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 ++++++++++ 
>> +------------------
>>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
>>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
>>   drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
>>   drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
>>   drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 +++++++++ 
>> +--------------------
>>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
>>   include/linux/coresight.h                          | 38 ++++++++++++ 
>> +++++++++++++++-----------
>>   10 files changed, 81 insertions(+), 106 deletions(-)
>>
> [...]
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index 26eb4a61b992..cf3fbbc0076a 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -471,25 +471,41 @@ static inline bool is_coresight_device(void 
>> __iomem *base)
>>   }
>>   /*
>> - * Attempt to find and enable "APB clock" for the given device
>> + * Attempt to find and enable programming clock (pclk) and trace 
>> clock (atclk)
>> + * for the given device.
>>    *
>> - * Returns:
>> + * The AMBA bus driver will cover the pclk, to avoid duplicate 
>> operations,
>> + * skip to get and enable the pclk for an AMBA device.
>>    *
>> - * clk   - Clock is found and enabled
>> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
>> - * ERROR - Clock is found but failed to enable
>> + * atclk is an optional clock, it will be only enabled when it is 
>> existed.
>> + * Otherwise, a NULL pointer will be returned to caller.
>> + *
>> + * Returns: '0' on Success; Error code otherwise.
>>    */
>> -static inline struct clk *coresight_get_enable_apb_pclk(struct device 
>> *dev)
>> +static inline int coresight_get_enable_clocks(struct device *dev,
>> +                          struct clk **pclk,
>> +                          struct clk **atclk)
> 
> This function has grown a bit now, probably best to remove it from the 
> header and export it instead.
> 
>>   {
>> -    struct clk *pclk = NULL;
>> +    WARN_ON(!pclk);
>>       if (!dev_is_amba(dev)) {
>> -        pclk = devm_clk_get_enabled(dev, "apb_pclk");
>> -        if (IS_ERR(pclk))
>> -            pclk = devm_clk_get_enabled(dev, "apb");
>> +        *pclk = devm_clk_get_enabled(dev, "apb_pclk");
>> +        if (IS_ERR(*pclk))
>> +            *pclk = devm_clk_get_enabled(dev, "apb");
>> +        if (IS_ERR(*pclk))
>> +            return PTR_ERR(*pclk);
>> +    } else {
>> +        /* Don't enable pclk for an AMBA device */
>> +        *pclk = NULL;
> 
> Now the "apb" clock won't be enabled for amba devices. I'm assuming 
> that's fine if the clock was always called "apb_pclk" for them, but the 
> commit that added the new clock name didn't specify any special casing 
> either.
> 
> Can we have a comment that says it's deliberate? But the more I think 
> about it the more I'm confused why CTCU needed a different clock name to 
> be defined, when all the other Coresight devices use "apb_pclk".

Hi James,

The original clock-name for CTCU is apb_pclk, but the dt-binding 
maintainer request me to change it to apb, that's why the clock name is 
different from others.

I am not why we need apb instead of apb_pclk in dt-binding. Maybe some 
rules have changed for dt-binding requirement.

Thanks,
Jie

> 
>>       }
>> -    return pclk;
>> +    if (atclk) {
>> +        *atclk = devm_clk_get_optional_enabled(dev, "atclk");
>> +        if (IS_ERR(*atclk))
>> +            return PTR_ERR(*atclk);
>> +    }
>> +
>> +    return 0;
>>   }
>>   #define CORESIGHT_PIDRn(i)    (0xFE0 + ((i) * 4))
> 

