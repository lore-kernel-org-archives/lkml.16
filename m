Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4974C20DD47
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368272; cv=none; b=tA2wQ6M4Yl88kY/y8IG2iCfkJdHDqq0dKMbfWxPeITKC5M98VmLHrpOdJVET0mJ9wPsC+n3JDW+4oqj2y4kHF2ThUrRPIlUVbzT17pIK3bNmshBgsbD2WvLKpU9HrPtQ2URjOK+kqkAUX1T/IJDqEasbihjwX2ODjw6ButK5bHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368272; c=relaxed/simple;
	bh=x+iRIgahHokrDbJzMk7EUJ4fi5GnUOw18uY13owibtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jojYM6RWdyJKhu07NMyYwb9atP3BtNXdcz4JbqEyrtm5lMjx34Z5FLHfeyKkL5OrF46IglKHZHlXs1a1QlD2h39rUx/g2YNeiC01fGKUc4cO5jQW4z/iYnRl2M8JfZ+8Si/TSwkQsvS8TPOkbq93BsPVSGS/OAkXhI2r3iA00sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jQL3SgM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQL3SgM5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1EwVl006985;
	Fri, 11 Apr 2025 10:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgZYfPr64nT5wVvJBmQSEkiL7zVNqrvTZf9AcZAi0k8=; b=jQL3SgM57kgGJlMu
	37mMLEH704UQKb8Ns9FDi4jAXQfu1wJggx0rvfqqCGfT2ZlH1/66qIPTfDPUHYOL
	QJNdJDUWRIg/znDF3K5BMVmvAqeeC1L14tym4Xw9tDWvEZ6/sY9/GpgtBlrUfQLY
	IzFnIXHgX7nH4zCRdU8SzAPJ50GbtBvfhMs85ZUwcV2BtpRV002SDyxFtoasRmIn
	YT0DeCsW+tP1tFAGulTyBAwo7ZfA5wRhQ1dkSOo984ro0M0aT2+p3Xzah8C2FPnC
	goKnPBtjL8ji3a7qh5c78QPqnO1eA79Y4kz/3NBoy9mZwuMK5nfqrS+eESiXUAs2
	WdGIUw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3k466-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:44:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BAiOZI009626
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 10:44:24 GMT
Received: from [10.253.33.69] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 03:44:22 -0700
Message-ID: <d5fee986-15c6-44ae-b08b-82e91445e922@quicinc.com>
Date: Fri, 11 Apr 2025 18:43:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bitfield: Add FIELD_MODIFY() helper
To: Yury Norov <yury.norov@gmail.com>
CC: <linux@rasmusvillemoes.dk>, <linux-kernel@vger.kernel.org>,
        <andrew@lunn.ch>, <quic_kkumarcs@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>
References: <20250410131048.2054791-1-quic_luoj@quicinc.com>
 <Z_fvPOn1-v9WAnxJ@yury>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <Z_fvPOn1-v9WAnxJ@yury>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8f289 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=PSJ8d4jgiRcMPstjhLQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UYe-F4O17ewfp-UjoLBuTnE2JZZ73j9f
X-Proofpoint-ORIG-GUID: UYe-F4O17ewfp-UjoLBuTnE2JZZ73j9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110067



On 4/11/2025 12:18 AM, Yury Norov wrote:
> On Thu, Apr 10, 2025 at 09:10:48PM +0800, Luo Jie wrote:
>> Add a helper for replacing the contents of bitfield in memory
>> with the specified value.
>>
>> Even though a helper xxx_replace_bits() is available, it is not
>> well documented, and only reports errors at the run time, which
>> will not be helpful to catch possible overflow errors due to
>> incorrect parameter types used.
>>
>> Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
>> macros. It is functionally similar as xxx_replace_bits(), and in
>> addition adds the compile time type checking.
>>
>> FIELD_MODIFY(&reg, REG_FIELD_C, c) is the wrapper of the code below.
>> reg &= ~REG_FIELD_C;
>> reg |= FIELD_PREP(REG_FIELD_C, c);
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>
>> The new added macro FIELD_MODIFY() is expected to be used by the
>> following Ethernet PPE driver as link.
>> https://lore.kernel.org/linux-arm-msm/20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com/
>>
>> Changes in v2:
>> - Update the documented example for FIELD_MODIFY().
>> - Improve the commit message to describe the need for the change.
>>
>>   include/linux/bitfield.h | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
>> index 63928f173223..421c7701a18d 100644
>> --- a/include/linux/bitfield.h
>> +++ b/include/linux/bitfield.h
>> @@ -7,8 +7,9 @@
>>   #ifndef _LINUX_BITFIELD_H
>>   #define _LINUX_BITFIELD_H
>>   
>> -#include <linux/build_bug.h>
>>   #include <asm/byteorder.h>
>> +#include <linux/build_bug.h>
>> +#include <linux/typecheck.h>
> 
> Don't change the headers order: linux first, asm next.

Understand, I will fix this order in the next version.

> 
>>   
>>   /*
>>    * Bitfield access macros
>> @@ -38,8 +39,7 @@
>>    *	  FIELD_PREP(REG_FIELD_D, 0x40);
>>    *
>>    * Modify:
>> - *  reg &= ~REG_FIELD_C;
>> - *  reg |= FIELD_PREP(REG_FIELD_C, c);
>> + *  FIELD_MODIFY(REG_FIELD_C, &reg, c);
>>    */
>>   
>>   #define __bf_shf(x) (__builtin_ffsll(x) - 1)
>> @@ -156,6 +156,23 @@
>>   		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
>>   	})
>>   
>> +/**
>> + * FIELD_MODIFY() - modify a bitfield element
>> + * @_mask: shifted mask defining the field's length and position
>> + * @_reg_p: pointer to the memory that should be updated
>> + * @_val: value to store in the bitfield
>> + *
>> + * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
>> + * by replacing them with the bitfield value passed in as @_val.
>> + */
> 
> Please inspect the codebase and convert existing opencoded FIELD_MODIFY()s.
> I don't ask you to convert every driver out there, but core kernel files
> should be clear.
> 
> The first good candidate for you is __tlbi_level() in arm64. You may want
> to use Coccinelle to automate the search.
> 
> Thanks,
> Yury

OK, thanks for the suggestions. I will use the tool to find and convert
the opencoded FIELD_MODIFY() instances.

> 
>> +#define FIELD_MODIFY(_mask, _reg_p, _val)				\
>> +	({								\
>> +		typecheck_pointer(_reg_p);				\
>> +		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: "); \
>> +		*(_reg_p) &= ~(_mask);					\
>> +		*(_reg_p) |= ((_val) << __bf_shf(_mask)) & (_mask);	\
>> +	})
>> +
>>   extern void __compiletime_error("value doesn't fit into mask")
>>   __field_overflow(void);
>>   extern void __compiletime_error("bad bitfield mask")
>> -- 
>> 2.34.1

