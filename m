Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69781230BC2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914422; cv=none; b=SNR2hJi2IV+em15gOGNeR9l8xyHTCod9ySyaWX7FQVlo0+94ZQn3FyWxraOkFjjsspzeDWllK46aWZ5olpOBtHZE/kx0Jfnw3ViIzihvD3WqnqP0OgprDlz44QoBtWt+SKqpsdobztGqN3fi1pIc/mcvQJAlYrqDSRWGF2Yqd/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914422; c=relaxed/simple;
	bh=QLId+fH6oVUVyactkW2XX5q764N2pw54L4fLFnGsysw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoS/KHuxh5MLCA9Xz1QeHOrZBcfxrV0EhlqKS8Zx0ogxfiWFjCwj1oZkYWgedro1fstuxbq3iKq7DqrodZvhgD8ZT9ixnum0MCzuKxOW6BaLTrvcuv2HJx3Rguz3TMBhJJ5POh7aCg/rY7VVUQbOYqIt4qKXKyk0yEdEgMM2Tdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=meat3bEH; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="meat3bEH"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8pdWm003014;
	Thu, 22 May 2025 11:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CrjoWY
	V9u0t7vrcdwzJSmU4cOMHcny2DSeADTll+KHw=; b=meat3bEHUPKf6p3uphYd2u
	KGibjbwjrHGeVdRzcYdXuQNgUJXqR+w7WQYub85ayhm3O1yqyKPxIEzdhqFUi9r9
	njEzdpkK9Eq13r8oNmqcrUEXGARWX0H4FdGNu6XaZHd+N+PwIQ9VTsr6Axpgpewa
	4Ef6Y5juVlXOEFFYFJQP5GWYdcAIE+MzQsabUwGRNCwNTJxhxYS0fvR52wLzTBRY
	MNPlqRcP53PwSRVa8D3n/qgQRNf0IOFomdOP7GFMlCILay/VOhvyCpsSHxxshGaR
	uHJZk9gODgcCtnt+jZuJehor5Z5NSYc8h4YGzEWjxlfVatFsqaxx8hj9dA6NWOUA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t0sjgrvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 11:46:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54MBhS7c024709;
	Thu, 22 May 2025 11:46:36 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t0sjgrvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 11:46:36 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9keZS032070;
	Thu, 22 May 2025 11:46:35 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmh8bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 11:46:35 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54MBkZPD28443164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 11:46:35 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFDB958055;
	Thu, 22 May 2025 11:46:34 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31F5F58054;
	Thu, 22 May 2025 11:46:30 +0000 (GMT)
Received: from [9.109.245.113] (unknown [9.109.245.113])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 11:46:29 +0000 (GMT)
Message-ID: <202c4509-27dd-4b31-8959-5679472e0670@linux.ibm.com>
Date: Thu, 22 May 2025 17:16:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drivers/base/node: Remove
 register_memory_blocks_under_node() function call from register_one_node
To: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
 <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
 <aC73Dp90lDz1PN5T@localhost.localdomain> <aC78_1-1CtAl0qlG@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aC78_1-1CtAl0qlG@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDExNyBTYWx0ZWRfX32LmqP1b6MdW t9WTHY7jZLdQ70WhK8t60XmMhAhYUlOv5VsXyo72KgRH0ucFT5hlqkFW1D/csPBFj3M5LJv4WzO fhf8yIGc4KQx3e7m9De5JQWKdwJ+PP/FZL6w2t0fBwEh5DCLy2759JOQSTC1FI/y7tRd2MyT47W
 Eo4ukGmtCkl54joY+zBsNQq1onpxyFG38RAJ6u3RlhJiOl9NQPCVyd2NSdC+7LNbf42P5RkGlmp IaTT91ULdvcVze2ZBuCkYltEUdjP1vbpn2whjTIiM2u7wwt5WtAHH531ghLCfXIjgLI5tKOEf2B UI657clG4cWpy12dWJKq6KwaLT5hhvApnjN8qumqcyickHroD9vmKuJQcFgmVYhKPCKAUQL6Nk6
 eCg7+0Dt7oTB+YbSfgI1809729crJX0DXj6Gjrdj69bTgmQ2zv0w0e6Ms8DR5umbunek44po
X-Proofpoint-GUID: vFq3w004PkFqsykFxikIGw4yWojaGNex
X-Proofpoint-ORIG-GUID: 23OTfTPW7pH-OmJqtMcxouoOXgdq5BRE
X-Authority-Analysis: v=2.4 cv=HcAUTjE8 c=1 sm=1 tr=0 ts=682f0e9d cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=oDHSpl0J-XFlJIyCyv0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=839 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220117


On 5/22/25 4:01 PM, Mike Rapoport wrote:
> On Thu, May 22, 2025 at 12:06:06PM +0200, Oscar Salvador wrote:
>> On Thu, May 22, 2025 at 04:17:30AM -0500, Donet Tom wrote:
>>> diff --git a/include/linux/node.h b/include/linux/node.h
>>> index 5c763253c42c..6cf349c26780 100644
>>> --- a/include/linux/node.h
>>> +++ b/include/linux/node.h
>>> @@ -136,18 +136,8 @@ static inline int register_one_node(int nid)
>>>   {
>>>   	int error = 0;
>>>   
>>> -	if (node_online(nid)) {
>>> -		struct pglist_data *pgdat = NODE_DATA(nid);
>>> -		unsigned long start_pfn = pgdat->node_start_pfn;
>>> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
>>> -
>>> +	if (node_online(nid))
>>>   		error = __register_one_node(nid);
>> Heh, remembering this code always brings me joy.
>>
>> After this patch, register_one_node() is only called from try_online_node(), right?
>> Which, before calling in, explicitly sets the node online, so... we can get rid of
>> the node_online() check unless I am missing something.
>   
> I think you are right and a sensible follow up cleanup can be renaming
> __register_one_node() to register_one_node() :)

Thank you, Oscar and Mike.

Yes, I agree—we can remove register_one_node() entirely.

I will go ahead and remove register_one_node(), rename __register_one_node() to
register_one_node(), and send the next revision.

Thanks
DOnet

>   
>> -- 
>> Oscar Salvador
>> SUSE Labs
>>
