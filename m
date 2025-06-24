Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D327A445
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757842; cv=none; b=qNq1Lyt48KztZZkdghtWBMcvKiheDOnPCw2Tcj50SYbXc+qnBwvRXlHSnXx8REJJM5sTLm7p0bf6Glidjix2wHzwFFe2TlKZtL92cY5JiuSbPGEp2AUe3XE3Q0KR17YL7qg2WjtXkVNGKV42T4jQXMojDrTslSqMcR8xOfvqHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757842; c=relaxed/simple;
	bh=/7bT1Cx3kiKw06CIOp/AuMo9kBAZtcg02bTkvQg589I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RInGfHAR4ZDhO2QXpOV8iT00+63uCSF2fu45CKJNd6d2yWnD7tp4jsDZLJwRJISqw2kv50BrQ0MTvUEZXng7TPZLIAmBGvSe6aUVZmDV6rfZeZ8D6q6ZajRZoUHLElCyetZ6l24BdAoBga+TvJTSKUfy+YnE7UAh0Sr+NbD06RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=i/08+2bR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="i/08+2bR"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6V6Eq031510;
	Tue, 24 Jun 2025 09:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=x3OfAz3+/wP0QnmRgAYo+n4xSL92uk
	1klBXDJyX8CaM=; b=i/08+2bRWjF5jjWj19TuEaXbUXg2TgrjjUwp2cDXoRMqtL
	+SvUAtPjPxFdLARGFMIDH4QfxvAMvnR+h6KePzM3Px/pS8cFloPCyaHNGzN/6mc3
	hxVvtKEi+Fs3DjjANamMr4sUBd6S1sKZZuxI9xSXzD2DEw2Bh2Pyl0WmrBlYdWms
	GJIroKa5rWz1wZ41CEI9s8e1uZ30L3DEYJckDZY681wepJmofOhsQLVju5b76Pqn
	wxiznvivYPLIo0daha+3cTsLE9+rzLpD9b6vzsetqefBD67U1O1y6ia/x1c+wH2F
	2E9UZOofjsAEm8XhgSEwSEC5JeRinQlRdt+uvkJQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tqs1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:37:06 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6WoO9002499;
	Tue, 24 Jun 2025 09:37:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jm36fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:37:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55O9b3ug37224872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 09:37:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A1822004B;
	Tue, 24 Jun 2025 09:37:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDDBB20043;
	Tue, 24 Jun 2025 09:37:02 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.111.32.36])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Jun 2025 09:37:02 +0000 (GMT)
Date: Tue, 24 Jun 2025 11:37:01 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: move mask update out of the atomic context
Message-ID: <aFpxvQxgUEdO9jd/@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
 <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
 <4214d6d6-f8d5-43b3-a413-f576fdaf215d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4214d6d6-f8d5-43b3-a413-f576fdaf215d@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PJjezoW-OjHIXDCabrdGssqB8lpxBmor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3OSBTYWx0ZWRfXwpWOgiVsp5J/ zwkxus17L1WfD5Wfk9r1y1DU6djl3jrs7Y9TY68iA35MaSv4xFbpQ3FVa1mn3WblCpE+7kCgJZe WpBnC5d98e03DZq3hmJUv2TtY6S/TRVgdhF5dEbWMGQNM6dnmt2cUru8TF2geuReCEk6DDJ1PM5
 8QrpE1n7yzGchcTfrKWFRHII7XXzNgJngOCFWQpN+oVqlvQnNDu0msEv8efwGqB56MUUy1JAz+B e7iFIR1Vwwk3PKuYTSe9m5+mn4UJUOCgC27InyBQJpLOyPELlLdhmtegZ1kf0WtddqefB3urVI5 H+/5cg1+OnAOrXEgxAqJc1nZRuKAXEQD6wdfsd6uP2nvneN3An5v7UVMPfUQ9iMNrRPnzwBsPSd
 2niLc4Vhb2/iOsERCQ93FdOf9UPquoCAgOgADIbS7zhBGx/+mqoPdsc/WqPtRufpoWaFyP+7
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685a71c2 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=nENOSrSBMpMrXF5MCvkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: PJjezoW-OjHIXDCabrdGssqB8lpxBmor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=550 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240079

On Mon, Jun 23, 2025 at 09:45:34PM +0200, David Hildenbrand wrote:
...
> Let's ask the real questions: who checks PGTBL_PTE_MODIFIED?
> 
> I see
> 
> if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> 	arch_sync_kernel_mappings(start, start + size);
> 
> And then
> 
> arch/arm/include/asm/page.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> arch/x86/include/asm/pgtable-2level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> arch/x86/include/asm/pgtable-3level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> 
> 
> Which makes me wonder why we need PGTBL_PTE_MODIFIED at all? Is there some other check I am missing?
> 
> (same question regarding everything excepy PGTBL_PMD_MODIFIED, because that actually seems to be used)

AFAICT it was thought as architecture-specific:

/*                                                                              
 * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
 * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
 * needs to be called.                                                          
 */                                                                             
#ifndef ARCH_PAGE_TABLE_SYNC_MASK
#define ARCH_PAGE_TABLE_SYNC_MASK 0
#endif

Not sure if that needs to be addressed at all.

> -- 
> Cheers,
> 
> David / dhildenb

Thanks!
