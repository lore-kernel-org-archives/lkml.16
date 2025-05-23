Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D823814A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002989; cv=none; b=hvP+mDM+h7A/t8wxsr5774DYkOk8WCrbTdHiZTfZnv/g/IMsMkAN7Ew8ffkrPH+hIMkg2leaXEBQ/bElfVPRplxjnEY5YlVD5wIwHDGhZmRoN9sejfjfbdU0ldfVPil7lWU5eFFecvFLNNkVthMcornz2ieCzIvAf5ZFww5HpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002989; c=relaxed/simple;
	bh=sjsD+QbK9mnb6AiEpXSNG/jWV1+33z4lHQ8TlXIeQB4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rlsKtuzF5uoYKHuIvH5JTTLg7/y702tLqgmAhe3BNt/A0Em5XzrTAa1UmrsLbcLsh/+3rWrxuaGzxAvfTsd7zWl5ok0wt4bkNvb3ginbNduS1yICjT0v2UEZhYHfpYJz+18iLb4A7z42266jhbhFeYLBqi38oA06zx+6CwGdTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Fam9uvvz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Fam9uvvz"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NC7TI2024630;
	Fri, 23 May 2025 12:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Mv27Rn
	kmPikA+dNN5lMrWWVazp6Le4oxa7GInuekgfs=; b=Fam9uvvztkQVl6hAO0xAbe
	+lmcBR1E0+Vd3DxlCeuKdCmoTeOYPEpoktkQQheX7wUl751ii7wi9F8NNQp7fSyj
	5F3CvcAXHNbgTteN27wPxZ/yHF5psAsvROFP9XCraHH4IiFKtm/Ky1XrIGXLDn9F
	k6X//ngx5/p0qQ64SZBURMx7G9H3qwOIAxyUyhy4yTfR0fVuAkOlFIdcETrhs6tq
	VrYMUp6pACr9KaIz2iMEwFzZj+OofsdxJ8qZZWArzMknw1jtwVTDjC/Eqj5PDs6T
	tzx5S5HPJOy0Ig4mtVhCF6ijhuIGX1uGtTg/cSKFxKiLj+6Xkq2V1AaFYo9+fyXw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhwfm6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 12:22:58 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAwmfi020713;
	Fri, 23 May 2025 12:22:57 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwkq6fr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 12:22:57 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NCMtSt15401478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 12:22:55 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 883FC58059;
	Fri, 23 May 2025 12:22:55 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6864C5804B;
	Fri, 23 May 2025 12:22:53 +0000 (GMT)
Received: from [9.87.148.238] (unknown [9.87.148.238])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 23 May 2025 12:22:53 +0000 (GMT)
Message-ID: <ad10fe2a-2065-48a4-a200-a0c91be2d439@linux.ibm.com>
Date: Fri, 23 May 2025 14:22:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zaslonko Mikhail <zaslonko@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Heiko Carstens <hca@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
Content-Language: en-US
In-Reply-To: <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDEwNiBTYWx0ZWRfX7gZyliZNFwXF qW1DmWB/PGXZcq3A+N2ScMUfWZPTH730bCxyxEAjuT9dYlWG+8cYazRed6UZk9nOpH5rz/RW4OX 14vY7LbEKQSVpgBw7QS/WsMhnKdt45Z2EtHH9Sfq7/PUA8x3cHRuZJERAvYaBqvcmv6r5DXQlIl
 AyxHtfj7V+u/1K9nGkkJS1rnWx9vl57B2c0J4R3CSNigAQ8271kYPQYcg/5nWjis2e5+XI4F2BG O5+JywZkY8Aw4mTz3+0qdN5F14oIT62w/PQareKA2ODn6TJWpTlq16kaNJX3ESpX/rj2VEDHgWX Ip1FePTwyoV8Tt4f/fwDhdlkQjuy5HHPpKVDPSrMXhCYjsXkhLKCbqogDDjTKMylctXrr3SBNHw
 t+f3xENcRahBtNr2lt0CCtV8biDVYln4p39lhkl7R+Ty/gQ0wAKhXo3l1398EJajRLmkSm/c
X-Proofpoint-GUID: pniA40CTIlxMhhHTF1GgFVpc--QfoHea
X-Authority-Analysis: v=2.4 cv=O685vA9W c=1 sm=1 tr=0 ts=683068a2 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=anLjIrP37XIjfVduPqUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pniA40CTIlxMhhHTF1GgFVpc--QfoHea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230106

Hello,

On 15.05.2025 05:14, Sergey Senozhatsky wrote:
> Cc-ing Herbert
> 
> On (25/05/14 12:58), Zaslonko Mikhail wrote:
>> Looks good to me.
>>

>> Also, here is another patch suggestion from my side on top of this one. 
>> Let me know what you think.
>>
>> ---8<---
>>
>> zram: Utilize s390 hardware deflate acceleration for zram
>>
>> Utilize s390 hardware deflate acceleration for zram deflate compression
>> by default when the facility is available.
>>
>> Signed-off-by: Mikhail Zaslonko <zaslonko@linux.ibm.com>
>>
>> diff --git a/drivers/block/zram/backend_deflate.c b/drivers/block/zram/backend_deflate.c
>> index b75016e0e654..5bfc57522e3a 100644
>> --- a/drivers/block/zram/backend_deflate.c
>> +++ b/drivers/block/zram/backend_deflate.c
>> @@ -22,10 +22,23 @@ static void deflate_release_params(struct zcomp_params *params)
>>
>>  static int deflate_setup_params(struct zcomp_params *params)
>>  {
>> -       if (params->level == ZCOMP_PARAM_NOT_SET)
>> -               params->level = Z_DEFAULT_COMPRESSION;
>> -       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET)
>> -               params->deflate.winbits = DEFLATE_DEF_WINBITS;
>> +       /*
>> +        * In case of s390 zlib hardware support available,
>> +        * use maximum window size and level one as default compression
>> +        * parameters in order to utilize hardware deflate acceleration.
>> +        */
>> +       if (params->level == ZCOMP_PARAM_NOT_SET) {
>> +               if (zlib_deflate_dfltcc_enabled())
>> +                       params->level = Z_BEST_SPEED;
>> +               else
>> +                       params->level = Z_DEFAULT_COMPRESSION;
>> +       }
>> +       if (params->deflate.winbits == ZCOMP_PARAM_NOT_SET) {
>> +               if (zlib_deflate_dfltcc_enabled())
>> +                       params->deflate.winbits = -MAX_WBITS;
>> +               else
>> +                       params->deflate.winbits = DEFLATE_DEF_WINBITS;
>> +       }
> 
> I'm not sure if we want this much of s390 specific code in the generic
> zram/Crypto API code.  Both of these params can be configured by user-space
> via the algorithm_params device attribute.

I understand the concern. My intention was to use special defaults for s390
when no algorithm_params configured by the user (which is the common case,
I assume). Do you see other way of doing so without touching zram generic
code?

Thanks,
Mikhail

