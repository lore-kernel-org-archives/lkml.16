Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC81E8824
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299932; cv=none; b=HyS82XsMG+/aOIx8mBpej3OLm43IgKbw41EyK3o2EGyeBSntrS6lb5Q3EchpQmQJQt9QYbOPRMprFJ6pEraJvJOt+ZxJ2Ma+FJK+oryQJkobGRc3/tMMKqmIYDHU7o71d8LA2krswCtenm2mNk5Lu47xmarlgIWmffZR/3/U+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299932; c=relaxed/simple;
	bh=3XlzKdYq6/C6j0bwk+fPqVKlzzCl+f4YZ1JM0Fs271o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgrAbG+q3GjIaZzT0bvLJK4jUIOFE43uJDm5+WnQA5MTMLhVAnacOnZFG0chB+U8Mm8PXbFRKhYs1Nq1yNrvqxTyMb/RAddDewzQMxRBL5Fl5WfAUE2qnfH1VEQY/W5x/ICzD28ngNk0u90LNkmJ9vRsh7ckyF7EAhqqkQyRcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gag/bni3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gag/bni3"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ACEUuU018223;
	Thu, 10 Apr 2025 15:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=nQ40aRYPjeewpxnzAJ4ncy9RDrWpJq
	SDFdiOgndT8Z0=; b=gag/bni385Zi+UUISsMhdbX4qi4Aaa4N1j0rB7nFIOQraM
	WTwdMdml7fHIPrhDwipLNFmwbjZPvEa6plOHQ9HBfcer3soLV+KqfIDmlC3wH+RR
	HIb2ylJDAXbXR7lWhNSgno59lfamCkUok9axl8ZFHRA+0c/qKo8KN+rKXMQ1E/gU
	AcGRZ2snV6MqOlZQK+V/kR3AFHd9o3QmzN1qe4dCVeHxr53ZXFsnMrDWb6WvE0Nq
	wylsHe67Ap5r87/xvE0G6i9eGNLJu1/sisd7l8D/lDVcXVFek5/knDKnK4XRQZS2
	eJdEeKBoqNGqrq6eJHRsSOjw/jDqADEVdO5Bm90g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x6ca3tns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:45:15 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53AFjEMQ030245;
	Thu, 10 Apr 2025 15:45:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x6ca3tnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:45:14 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53ABeYBa011522;
	Thu, 10 Apr 2025 15:45:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7yxtpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:45:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AFj94j34996486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 15:45:09 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 348C520043;
	Thu, 10 Apr 2025 15:45:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E51B920040;
	Thu, 10 Apr 2025 15:45:05 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.39])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 15:45:05 +0000 (GMT)
Date: Thu, 10 Apr 2025 21:15:03 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, donettom@linux.ibm.com,
        david@redhat.com, osalvador@suse.de, gregkh@linuxfoundation.org,
        rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
        shan.gavin@gmail.com
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
Message-ID: <x4aif3gwkz5u62u4sk4xaupydgyc6o4dwvi7v6hxlx5quscmrm@6fwtbpplehrk>
References: <20250410125110.1232329-1-gshan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410125110.1232329-1-gshan@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uW4bl6wW8n_-J2BrYXkOUvRPlo8dosy3
X-Proofpoint-ORIG-GUID: FQ-8hx6H6kTI4vK32YKxEEy4k9s9YRoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=629 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100112

On 25/04/10 10:51PM, Gavin Shan wrote:
> for_each_present_section_nr() was introduced to add_boot_memory_block()
> by commit 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()").
> It causes unnecessary overhead when the present sections are really
> sparse. next_present_section_nr() called by the macro to find the next
> present section, which is far away from the spanning sections in the
> specified block. Too much time consumed by next_present_section_nr()
> in this case, which can lead to softlockup as observed by Aditya Gupta
> on IBM Power10 machine.
> 
>   watchdog: BUG: soft lockup - CPU#248 stuck for 22s! [swapper/248:1]
>   Modules linked in:
>   CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Not tainted 6.15.0-rc1-next-20250408 #1 VOLUNTARY
>   Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
>   NIP:  c00000000209218c LR: c000000002092204 CTR: 0000000000000000
>   REGS: c00040000418fa30 TRAP: 0900   Not tainted  (6.15.0-rc1-next-20250408)
>   MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000428  XER: 00000000
>   CFAR: 0000000000000000 IRQMASK: 0
>   GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
>   GPR04: 0000000000013e00 c000c03ffebabb00 0000000000c03fff c000400fff587f80
>   GPR08: 0000000000000000 00000000001196f7 0000000000000000 0000000028000428
>   GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR28: c000000002df7f70 0000000000013dc0 c0000000011dd898 0000000008000000
>   NIP [c00000000209218c] memory_dev_init+0x114/0x1e0
>   LR [c000000002092204] memory_dev_init+0x18c/0x1e0
>   Call Trace:
>   [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
>   [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
>   [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
>   [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
>   [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c
> 
> Avoid the overhead by folding for_each_present_section_nr() to the outer
> loop. add_boot_memory_block() is dropped after that.
> 
> Fixes: 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()")
> Closes: https://lore.kernel.org/linux-mm/20250409180344.477916-1-adityag@linux.ibm.com
> Reported-by: Aditya Gupta <adityag@linux.ibm.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  drivers/base/memory.c | 41 +++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 24 deletions(-)

Thanks for the fix, Gavin.

Tested on PowerNV Power10 hardware on which the issue was originally
seen, the patch fixes the softlockup issue. Hence,

Tested-by: Aditya Gupta <adityag@linux.ibm.com>

Thanks,
- Aditya G

