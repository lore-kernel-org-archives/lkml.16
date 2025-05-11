Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC985260
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746945678; cv=none; b=gJ9+o6qPKJRlhoUMcNk/XTStHbnEOinecP8DaQi6KnFci7tZSWsjg0fkP8sE7pY15Nhr6pGDddIb2zQcoWpNIa7vkSkAUOGnPigcsGS41IIZ5tTNM/W7NtbAgnrD/ZpNp/ETtHuhUS5s3EWv8y6rM1t230SQnrvSBJxCu8kwW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746945678; c=relaxed/simple;
	bh=+6a/Y1B54Abbs2KqBfh4gH8j0hGjaFDaIJbFdtRC8Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IeM+iwPGIMnZfMYKJH6I4M37TDCQsnpKCsJaogzWrmmKKyMZdSrgtpXCifJilIh8QbeW/GW0216e0D29lvwKcW86KvtRMyOkpgZU9xdhPMfkJnLfQnNqlyGUb6VmOAqQ90XG5bv2CHac/v5Wc8O5qXLT8S6vOJDqUgrgoLUshDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aZLvswg0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aZLvswg0"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54B2raOY010719;
	Sun, 11 May 2025 06:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cwAXTc
	X0HJqzWruHfmnqPSEejaCklME30gdLsup1Ckw=; b=aZLvswg0zJpFBr30nicyfp
	uCp3Wic0kwHY8C3nk7kuyxZknF74Mbp560IOf7gnQYzQSNQhv2Fc7qmB8tqc2rWk
	Gc7DYUmyK6Eb3XTW+oVeQi4+eKbStKWxWIT6xNAigu1TSi5I0Fvve6Q+Gjwkcuxb
	v/i1XQhuA9TF5XFtfWa0aZBGN3J9InXKOixpteDfL5vagl1i8SOwWIZms6Xq+dLn
	Rgg1eeh26ohVJaa0dCY7mmNjaJlaKoMnHosKprYRE39U3Te+SEasie7fyqQfY3G4
	eWJK3xTYUHiBcfZKQQ9JPAqDQu/vYICYgR6OzWqwKCvbZJcBtBpSXQFGm3hZc3cA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jce8h69s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 06:40:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54B6eu5v026832;
	Sun, 11 May 2025 06:40:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jce8h69q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 06:40:56 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54B602xD016348;
	Sun, 11 May 2025 06:40:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46jh4t8y4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 06:40:55 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54B6es5r25821868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 06:40:54 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5C7C58055;
	Sun, 11 May 2025 06:40:54 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BA2F5804B;
	Sun, 11 May 2025 06:40:49 +0000 (GMT)
Received: from [9.124.210.168] (unknown [9.124.210.168])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 May 2025 06:40:48 +0000 (GMT)
Message-ID: <dfd310c2-cbf1-44d3-ba69-e3834e04e881@linux.ibm.com>
Date: Sun, 11 May 2025 12:10:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
 <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
 <aBi8Iqp27jXLUWfs@kernel.org>
 <78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
 <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
 <20250509141050.4b19bc796d7edf2eb9027361@linux-foundation.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250509141050.4b19bc796d7edf2eb9027361@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ga2Yrki2KUyHqj9dpOfaHJoVVqav-z7i
X-Proofpoint-GUID: 45qzxqsfw3kt6QvgKN-8-P6KZjjfFwRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDA2MyBTYWx0ZWRfXwq7iltw+6AHU rLC6ElVfOxVnByMKZkifEGgmC0W/Vb+NnXYz6VdzcHigQ7knXr6QIAHfQdIPM79R/6q06Mix0fi +VXiMgTzVfKReglPCpJbh57fooKqfBUG4SNU3lFIvsHaNfLxZJyE0+IvLBWQzZXgmLKVC38JHfz
 rs0ylBZmZL0LuTGUZMZpSrPp1edzH1QvyVfVkDQ9H/vAh0ZIcUsxR4daN0ka/PmODJRozOt3elt +k6kx7m7JlJ5LWRSZzWK14JxCy6FJUuiJmLw9BwWukO1rIPDBp7j20TsN7Q9AwEAcDnQsYR+rtG MWUXdOYTXFHVBcw8JBDxzifrczwNl73wjaIgBeCSQoxmm9nfWMWZ90ywgnBMOeCdY2Hn6oCbB20
 xFpAkFviTUMxBBXBiy80jGaek7YD/4FX3zEP4AjYR/9ia4zP8xFbaHf/gZTOPTzTZOgSNRJ9
X-Authority-Analysis: v=2.4 cv=fvrcZE4f c=1 sm=1 tr=0 ts=68204679 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=P-RETWrbBPZJbLTpotkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_02,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=749 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110063


On 5/10/25 2:40 AM, Andrew Morton wrote:
> On Fri, 9 May 2025 21:10:34 +0530 Donet Tom <donettom@linux.ibm.com> wrote:
>
>>>> Then we can drop the call to register_memory_blocks_under_node() from
>>>> register_one_node() and add creation of memory blocks to
>>>> node_dev_init(),
>>>> i.e.
>>>>
>>>> node_dev_init()
>>>>     for_each_node(nid)
>>>>       __register_one_node(nid)
>>>>         for_each_mem_region()
>>>>           /* create memory block if node matches */
>>> Yes exactly, that makes sense.
>> Hi Andrew and Mike
>>
>> Based on the discussion so far, it is clear that the patch will work in all cases,
>> including when CONFIG_ARCH_KEEP_MEMBLOCK  is disabled. Just checking —
>> would you prefer to take this version, or should I send a v4?
> My mind is a blank and perhaps some alterations were picked up along
> the way so I think a full resend would be safer, please.


Sure. I will do that.

Thank you

>
