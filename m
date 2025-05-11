Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D0F1C6FE4
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746966834; cv=none; b=HqiwopdEmcBPnFLWEIlwJT8G+px4cplSpl1/m6flemZfgAOP9lSt/wFryRAjL+aedTFq+YNxa8a2VUw+152TscrAGRlgALzHtSql6CeCmrfja+frC1G2hoUsA2IATv5uVHi5o8mtk0/LVSuJc6jSCFl2kogdYxxT4ldNADC5720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746966834; c=relaxed/simple;
	bh=zB53D6b35EZKuLYWKABr9CPAzve+ULmWfC0DxwlNKTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgHbZcVPgbIVukyOm3rtLpQtUHPnPG9SA0fYd1FQGAgZGOtnivQkc+NFqD7uO+UfPEDDazG1RYgohSPZ8nefgcvpgt1pqozjCuv1Lgliff+Loja7paJc3uFE90/4cEfCFEkQL1jFu1tGzIXLOAg48CJR1VkSUJ6/Y7HSf47N5Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kuAqiIFH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kuAqiIFH"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54B1s8vN001308;
	Sun, 11 May 2025 12:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JSETHQ
	w68fWqmiPJ7zxQFvWWNMk2RZqAjOt+3JqfXmc=; b=kuAqiIFH+YB6H3JFsLnj1z
	fnlA0AL7LSzOX9ahg+F2nTy2HaoYhLz4GCkxW7VcyqJ4SOgvA7/w+o3GQOyAaSSv
	mIOa4LE6k6GdqVqdAjueKcPuZzxNCglYB9bbIhvTVPeYR9TJ00ezAJlhs+Jp8dDa
	ApUYTRffUuPy2o+P8k+9OGQkJJGDmjOgmetBCas/VlmKvqWcWyyfZ1Sg8o1rM12S
	zjZRbNtuYFnvrlvFDuX6YCBUxO5vgKey9GT6yMLZGGGPHCND253mDJZZlGyy3P2+
	cphf/aPWFZfemgcBrJCvqBsX1DepPfSp2/ettESaeKVf7R2h1Wtas3jAEznhYf/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jcg6hrrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 12:33:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54BCXTJp008331;
	Sun, 11 May 2025 12:33:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46jcg6hrrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 12:33:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54BCGZxm016981;
	Sun, 11 May 2025 12:33:29 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jhgystb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 May 2025 12:33:29 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54BCXSx348824616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 11 May 2025 12:33:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEFE15805C;
	Sun, 11 May 2025 12:33:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3762158058;
	Sun, 11 May 2025 12:33:23 +0000 (GMT)
Received: from [9.124.211.114] (unknown [9.124.211.114])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 11 May 2025 12:33:22 +0000 (GMT)
Message-ID: <4e20d51e-ab22-4aeb-860f-9cdff0fb47c4@linux.ibm.com>
Date: Sun, 11 May 2025 18:03:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhuZWpZ7ltMuOe0@kernel.org>
 <8180a50d-eebe-4f9b-9ce8-d886654a992d@redhat.com>
 <aBi8Iqp27jXLUWfs@kernel.org>
 <78bc6a1b-164e-4925-a624-a271a4499364@redhat.com>
 <d19ad41c-069d-436d-8fea-a05188adcb0e@linux.ibm.com>
 <aCA4KP1nNFVzphPR@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aCA4KP1nNFVzphPR@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTExMDEyNCBTYWx0ZWRfX2CpuGf4v5CSK ibEl+qmz850PvcB9N8MwsNvoR/2WEjfaY+IdWkZv5kWO4mLFUuR11xbGNfUEpQi2dvuzZhskldc g56RvR8jxqxjR9Vle81UJGOQ3tII93WIMCv40NypqIRmE1g4I8nSfPdXT9SlLUr9GG7hKG24MaP
 5wmGV5XPFn02izoKNL3k1mQHlbpscvD9hjb60t9O/ZqBp3br7EgKeXlRw4Y0kY5hEt9ZzwGWq9Y ySldUSfMxrPpUa4xixFVEaJnhT39NONmsB+Vb6LYUTAftZKSVK45PS0wO8enTaCZJ0oW6wxtur8 RxIPsbrmYiVtrvWrD+nxz00d13k9xZ9jK9o299W6WIl8anm7jsMN7EoCuvlG/yWgD3pCmGNi0dr
 smg2aaoEs9aBtP4AH0wILUyLwW4jenJaQUlol6n2jNcBP40OnvSVdI1aBclH0nmsQ1hjxLdg
X-Proofpoint-ORIG-GUID: 6x1NuWXw_bHZ1cXI72-n8ZTA7aCwbrcA
X-Authority-Analysis: v=2.4 cv=IY+HWXqa c=1 sm=1 tr=0 ts=6820991a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=WoPLYqF27UWALN4nqQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hfEXWv_Tl_AsdY8yTKoCTtKYijQN2vJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-11_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=799
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505110124


On 5/11/25 11:09 AM, Mike Rapoport wrote:
> Hi Donet,
>
> On Fri, May 09, 2025 at 09:10:34PM +0530, Donet Tom wrote:
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
> During the discussion we concluded that the right thing to do seems to drop
> the call to register_memory_blocks_under_node() from register_one_node()
> and make node_dev_init() call __register_one_node() and then create memory
> blocks for each memblock region.
>
> Can you please make v4 along those lines?
>
Sure, I will do that.

Thank you.


>   
>> Thanks
>> Donet
