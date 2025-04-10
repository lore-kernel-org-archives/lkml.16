Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCB259C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259744; cv=none; b=IxQE7BDDNAC2oDK13u5XJ9RTcCoe1SPA6iS9HJIxoHCbDYMZ8ss6ONHci//V6iSgyeUfucG5x5eQktlLnaGeWgJVVlKQNF53ize9kR3J3ZGa2UnUFQ/S6qXhMBb0FilxlOQ847lNPGX/LDHAMnWyBwrs1oeeYGP1U2SEqPFxGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259744; c=relaxed/simple;
	bh=k3nQtqPxjExMSD8p++9caMxEiFdA6QeqiMG5EJwyU1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFnGYAI80ouEVj7DZFNI0yvZ3jnDjqiX9o0xIqfhIi4Y5qiOIhv5WxUSloO3x7HfDO8hgHgRgKzUMsVIPE9K24IhjnHWRVtLUGaJtRNV+Qxdzay9vtmAkyTjuQXv5417LHMGsR84jNtAdqoLILrXaibN2o6XucQwI/+l8Z0JdkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JXAnqZ1D; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JXAnqZ1D"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A3cAcA025403;
	Thu, 10 Apr 2025 04:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=oNbxox
	IXFi03G457ixhU0NB/7vZzhAE8wUlETbGwixU=; b=JXAnqZ1Ds6r70rD31Evovm
	XNKPDMx7LvR/zcx09TEqdQTmW8ZDejMkCeosRT/3AXIHF2HIkkOHzcQhecs0Q6LW
	iUZr0v/ekUhs7zNgFeggUe38EzBrRMin9JEVqQ61knKvuO9sjInI/MzasLGr6z7H
	nw8x6tj4vQmvn80QJfyCQGnjnBcoTiQsgWdJ9AYzdhBXUbDnhfYzDRW4UHxWaJhp
	13keOUmbhTy94YCCLDxdvImvhzhjXZHZpqfpSHoH4+bqgwC7UX06wFxLU5zfsXeY
	vhEP5+kxxxDgal0RtuWbBZESbPsPTJqsl/4SzHjrGauwS9PLgLdkiW+UldVe6lQA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xb7tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 04:35:33 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53A4Xd6F022893;
	Thu, 10 Apr 2025 04:35:32 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xb7ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 04:35:32 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A35AXV025510;
	Thu, 10 Apr 2025 04:35:32 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm3we4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 04:35:32 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53A4ZVsZ32244358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 04:35:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56F8358059;
	Thu, 10 Apr 2025 04:35:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAC0058057;
	Thu, 10 Apr 2025 04:35:28 +0000 (GMT)
Received: from [9.39.22.215] (unknown [9.39.22.215])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 04:35:28 +0000 (GMT)
Message-ID: <2c311511-e6a0-48b7-bbfb-2c28ffcff031@linux.ibm.com>
Date: Thu, 10 Apr 2025 10:05:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/memblock: Added a New Memblock Function to Check
 if the Current Node's Memblock Region Intersects with a Memory Block
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
References: <50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com>
 <20250409192000.d8a630d2c10e902bcdf80973@linux-foundation.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250409192000.d8a630d2c10e902bcdf80973@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: C70EJX6oeRsm3rhJXUi5QH8wVL5J1_C7
X-Proofpoint-ORIG-GUID: HMdx_EfvqKEQzeTddXL5Jeg5fxm35fUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=871 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100032


On 4/10/25 7:50 AM, Andrew Morton wrote:
> On Wed,  9 Apr 2025 10:57:56 +0530 Donet Tom <donettom@linux.ibm.com> wrote:
>
>> A new function, curr_node_memblock_intersect_memory_block, has been
> "intersects".
>
> Because the name is too short ;)

Thanks Andrew,

I will change the name.

>
>> With this function, the boot time is reduced.
>>
>> Boot time without this function - 32TB RAM
>> ==========================================
>> Startup finished in 1min 12.413s (kernel)
>>
>> Boot time with this function -  32TB RAM
>> ========================================
>> Startup finished in 18.031s (kernel)
> Impressive.  I'll assume this is rppt material.
>
>
