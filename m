Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC182367B6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393274; cv=none; b=Isbebw9j8x6CPbV9stQqcshrRp7rwX8hrDXeGDk46ReUfVxNXAjl+Qf23I9Lhi5PSEKIkE5vS8lrprVJoNzuHqrL1JJEPRo3GsmrT0CVek65UvzcyRckt78MnxYfI5BxmqH911Q6pDnPwBavJrVF54Cexb6uNufn/+IW4kai+mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393274; c=relaxed/simple;
	bh=CJFNkAlm23450Mhis2WYCLNAgRKCHL1u02Joc728pn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKKXpIosrczkA3hIbc18pQVzAMYlUI7tgbTVZtKdw29V7nvGeEkKsDUWKwIwkURUmv5LtEhcGBdR9HhHg/BBojropsrxc3IyqLwtQnpOJ/6N8kflPRJOaFq39RfhTrkQcKVnd1GIRWVKagCfwCI7sA66GyJmvwlAb/TkcRIza5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZpqufhJU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ZpqufhJU"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G9F8sO007312;
	Fri, 16 May 2025 11:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9KPter
	FkW62tyFKvD+8Fg0jSyjUVUtISswHvp618FF8=; b=ZpqufhJU9qZBszFGSAnsSz
	HTFA3qhVy84x5aTGx6AOG/qLyWqDwRfOFKdSz7W7qA5ZUOdYMmiyjm9R960VMyQF
	agUefMu4UV4hTK5RaeUbeprogYDed3+QcMMMKGm/a+HEbMBIFAKgZMpqxnAKH/1H
	nzV8Ee8IYiNFwuJnu67PRSVWkJWog2y5xqjaF/q9H1dkQsG7hoeMXtU2/8Azgor1
	gs5fIb8sww4Do73ENMhvinyrjb7qtOhuuwCOMUZHDCecCq+D3ih2avIKYnmmQTGK
	Yk/8Kh+U8p7cHEYricQH7Ap29hc54nQ2RZxzPaV4d9xTZtRAsG+ZLV+I2tm4Lgnw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46p2jj8ejv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:54 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54GB0sdI009362;
	Fri, 16 May 2025 11:00:54 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46p2jj8ejr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54GA4G5L015330;
	Fri, 16 May 2025 11:00:53 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfq74pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 11:00:53 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54GB0qiL15270542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 11:00:52 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65A755805E;
	Fri, 16 May 2025 11:00:52 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F24C658065;
	Fri, 16 May 2025 11:00:47 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 11:00:47 +0000 (GMT)
Message-ID: <65547a74-ceeb-4aa2-afc1-ebbbd3b8d918@linux.ibm.com>
Date: Fri, 16 May 2025 16:30:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] driver/base: Optimize memory block registration to
 reduce boot time
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <56cb2494-56ba-4895-9dd1-23243c2eecdb@redhat.com>
 <aCcOx34j5mgiwfcx@kernel.org>
 <a3072d7f-235e-4224-9867-4cebb66ca4fb@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <a3072d7f-235e-4224-9867-4cebb66ca4fb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfXxVWHtPJD+ypg MTJiL5FhlpEC7oDVGWuokp4ZF0xFKc3DG8HHrVgq34dHoCNxjxCipZ+2uMt5xnHVKecg0TPJkSZ g4PHQJ+BTNWTwbOM4fi7AFoB1qow4yGeVMu9tkjd8VndB9S40b9z57uG64uzXjpPb0utxOVlQZ4
 TrQkmZgbDepVEcVe+R+XA8Z1q8pupAputeq39k0lISdvlRYbK3PJTYPa2SKCg/X1eFIdsYNiuUD M7XJRQOVrr0IpdZzySXbMFnL80jF/zgCUVzhZE+koelx0sXKtjYkw1s9UOm+cxJM8KiXvpnc6ZD Vd7h9VgmYUO5ddmueymiTclxaS7CN4zOSugV9m3Cegjg0EmOCSZpWb9+cS+QYvzcpPcUGKuGdCX
 sOyZYlaPQWlao3gcDtxDJJkjeTJq0LcLxLNXOdsrJPuEVUI5XLlCcNl2EHFSMqqGCtrnpPj2
X-Proofpoint-GUID: sTKq_LsP0UnNh8IJek88S264LhWROSNQ
X-Authority-Analysis: v=2.4 cv=O4o5vA9W c=1 sm=1 tr=0 ts=68271ae6 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1mntedN-ysDotl4qOaoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: afHiZ8qCT6jrLbe6bSD4F8a3PexfidE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=844 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100


On 5/16/25 3:42 PM, David Hildenbrand wrote:
>>> We'd have to be smart about memory blocks that fall into multiple 
>>> regions,
>>> but it should be a corner case and doable.
>>
>> This is a corner case that should be handled regardless of the loop 
>> order.
>> And I don't think it's handled today at all.
>>
>> If we have a block that crosses node boundaries, current 
>> implementation of
>> register_mem_block_under_node_early() will register it under the first
>> node.
>
> At least upstream behavior should be that it would be linked under all 
> nodes. At least that's what I remember :)
>
>>> OTOH, we usually don't expect having a lot of regions, so iterating 
>>> over
>>> them is probably not a big bottleneck? Anyhow, just wanted to raise it.
>>
>> There would be at least a region per node and having
>>
>> for_each_online_node()
>>     for_each_mem_region()
>>
>> makes the loop O(n²) for no good reason.
>
> Yes, that's why I mentioned it. If we have many nodes it might 
> definitely be relevant.


Thanks David and Mike

I will implement this and send the next version.


