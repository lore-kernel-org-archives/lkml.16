Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326831FFC77
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393137; cv=none; b=drpRbS0ghYBCEVnByOLnAcN9DVznStNlPt0XdOlnuVZXSLJ7DzWBxfm4XQmNV+hpNQd4jINuVWImSclNIdGY6J0UE156xzNr0Y+SJHp/yZL9vvMp3ZxQnc7DMEQ6hekJLL794rAGapoeBnZA5plk6efMdVUvXBLQpEtBbqdyoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393137; c=relaxed/simple;
	bh=hdgQsnfMT9MxgW1W06EFce2Q+ewRj7Z5/iPZ9G9fSnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWUWZ4MK/+Vy83AZfPWMNrlQdmV3OYlY+kk7bGwwi2QqbeOF0FetTO3vjrEZgEz9ZFCuK9TJnlpXJJbuh25DQkob20ZgkfA8xkscWZZLpgrNae3lM8g12z9XetzAvdSjQ1zvUo2agwpijaWK9BW81xcrdrGde3Q0lxQ37eM77Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=F6f3dNJc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="F6f3dNJc"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5uf4o012511;
	Fri, 16 May 2025 10:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qSV+13
	jdTd0kjEuQ/LbThSNZOMjTdBcojT6ZLpxsXv8=; b=F6f3dNJcMdgx1UsN+3flTT
	f6u6AaJdWpk31/M+ucBjDH4TbBZHtIlWwLIzoa1i8mvAoA5xZbr5wD4ETdLmcWwT
	+SQ1px9rHU+G7G7llx4oKzJNJ60QykRdGRVfIEPpw6SvM8aSAi4+w3MrovNLNmA2
	yCC+f2qCIFJR0rGRBI00X3Mh4z7TVMH/feV2NCi8FiGomqnc0lVoYrfkuL25iMfB
	BBGsLozXuurgc8w/GihybzoLsvffsGls3j3/564nkFgHuSpGEp9Mt3ddeI7L5Kpq
	R+5HrxKDxH7QQBFcSIIPVZD/IUWgMeqYkGI4rwtMs2gnyCrbOMgHD397yrraKt4Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nnw93n7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:58:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54GAowXo004973;
	Fri, 16 May 2025 10:58:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46nnw93n76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:58:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54GA1qwi021786;
	Fri, 16 May 2025 10:58:32 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46mbfpy5d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:58:32 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54GAwVRu55050520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 10:58:31 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4A158056;
	Fri, 16 May 2025 10:58:31 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DC5358052;
	Fri, 16 May 2025 10:58:26 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 10:58:26 +0000 (GMT)
Message-ID: <bf01158f-c110-4dc5-9a52-1c2db64518a0@linux.ibm.com>
Date: Fri, 16 May 2025 16:28:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] Remove register_memory_blocks_under_node()
 function call from register_one_node
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
 <f23e8df8-5836-4ffb-83ef-d19c7c04947f@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <f23e8df8-5836-4ffb-83ef-d19c7c04947f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfX+PlDFSoO7FrI cdPeLK16vD9PJ/WVZU5pQknGfW1kN6Ptg294Y9TMgNnepwyZjQp5T/rNO6cGUOJD/MuCh8Xx8Jx xau19iXv807X408gVdWFvEyv1jXkcAt7EwXs9h5r5d7touQzIYjBoyTZ9UDN77Js2kBHr2nScw3
 FUnWDnqLpa02C6UUzySDy9u8YcG022pdAp750mVG9JpET7imWG6UoGhZMwy4d+Gd781SpcwVy83 e7xbcRUbZ4GCI8t0UZA2jV92rd23rnWP2uyT0B1lOtTbB1uTAICdEEqaCf+MufRo92o0PF0MJNj Asmpw4n6O8FRrVPgD4ctgb72U+7n4900ix/R3bp47TFHKryqfJ/9MlQ/L4JKlgTllU5QoZcWgXw
 lz3Ho96BlVIYIUB/xXncQGAzOjI4lDnPcwPvmHwwaefmYKcR55nXwY+CBxuo+guubfFp/4A0
X-Authority-Analysis: v=2.4 cv=b8Ky4sGx c=1 sm=1 tr=0 ts=68271a5a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=aV7FWT3kXTZD2rPvmhoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: eTFjSho17LayjhPKl28G5cGUQIFqYuue
X-Proofpoint-ORIG-GUID: gnQURw7UoX7INN1oewKXGYm37UlojZlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100


On 5/16/25 2:48 PM, David Hildenbrand wrote:
> On 16.05.25 10:19, Donet Tom wrote:
>> register_one_node() is now only called via cpu_up() → 
>> __try_online_node()
>> during CPU hotplug operations to online a node. At this stage, the 
>> node has
>> not yet had any memory added. As a result, there are no memory blocks to
>> walk or register, so calling register_memory_blocks_under_node() is
>> unnecessary. Therefore, the call to register_memory_blocks_under_node()
>> has been removed from register_one_node().
>
> It might help to throw in some empty lines to make this easier to read.
>
> Patch subject should start with something like
>
> "node:" or "mm:"


Sorry. I missed it. I will add it in the next version.


>
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>> ---
>> v3->v4
>>
>> Addressed Mike's comment by dropping the call to
>> register_memory_blocks_under_node() from register_one_node()
>>
>> v3 - 
>> https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
>> v2 - 
>> https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
>> v1 - 
>> https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
>> ---
>>   include/linux/node.h | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/include/linux/node.h b/include/linux/node.h
>> index 806e62638cbe..8b8f96ca5b06 100644
>> --- a/include/linux/node.h
>> +++ b/include/linux/node.h
>> @@ -137,15 +137,9 @@ static inline int register_one_node(int nid)
>>       int error = 0;
>>         if (node_online(nid)) {
>> -        struct pglist_data *pgdat = NODE_DATA(nid);
>> -        unsigned long start_pfn = pgdat->node_start_pfn;
>> -        unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
>> -
>>           error = __register_one_node(nid);
>>           if (error)
>>               return error;
>> -        register_memory_blocks_under_node(nid, start_pfn, end_pfn,
>> -                          MEMINIT_EARLY);
>>       }
>
> Can be further simplified
>
> if (node_online(nid))
>     error = __register_one_node(nid);
> return error;


Thanks. I will add it and it in the next version.


>
>>         return error;
>
>
