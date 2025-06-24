Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43661B393C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766419; cv=none; b=mfsSuNTt8IpAZRd1GmJaJT13bgFFHf9zQr2mMg/NOnj8gEDVnSdsIelTiGaEpR0v+bXl4phjPpFK4uxrtAJjYqRQplQZDR6+COZ5vbwUSzjTZphGNmkcrUuBZB2UsvagvKNB7HW3ColLlRA9fkgYt4MITuiFGkWCFbpJvAcpvdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766419; c=relaxed/simple;
	bh=5H+0ZBatIoV98zVsiGevjwnsDrxv5wtU9tnLN9LnZy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/cejn0f/dF5X60HxhBO/ztVZdVZAvBTMsjsS2Ltm1u/z4XxhvfHtJk2zvjfjF6Dxf29ddnqBIus8SE9ZsnL2cpm0jBIfovGIAQP+o27aELRyXFurovEpe+uhwahzCZ3Xdb5gLxFte0chWkPgFDFhNmXQbLSqfIvb7anzHKNQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ayE572c9; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ayE572c9"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8ETKY011544;
	Tue, 24 Jun 2025 12:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=+9C+Y37xuTD23dtTgJMKeF5k/yn5MH
	BAcJezcH86M2s=; b=ayE572c99VaHxNMdeIYB5bpt6Ba9l6vezbfo1xfMJ1PF3E
	781NAH3lSHtypjwepZcEjjCH9Brg2cIe9UVWsWsdYKVFgM2F9+ZQAIr52kgGiSeC
	2LhnftfMdgju+2RJJ5fVjrKm0324A60dhIQmi8Kvcwfvp126Bq0xS75UGaTL3Wp5
	GYhf7ldOsulO1Qi+SNiiDwW4LBT7Lu3IT7WWc0wCg5bd4WQKg5M8omyqAjslG0/j
	4wNXcbNY7VWlx/3zhf0KpR+Zy0aVF1o98J2A8JZzQPdddsYMLBB/ltl9jCQdDsEK
	MyC7EmiAcpdetAuTAGBkIG8QwYjc0nzYLAiDmnOQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfe8f0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 12:00:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9SfgV014951;
	Tue, 24 Jun 2025 12:00:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72tm040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 12:00:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55OC04d452429060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 12:00:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 424872004E;
	Tue, 24 Jun 2025 12:00:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 172792004B;
	Tue, 24 Jun 2025 12:00:04 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Jun 2025 12:00:04 +0000 (GMT)
Date: Tue, 24 Jun 2025 14:00:02 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: move mask update out of the atomic context
Message-ID: <aFqTQtK8yCTlmEfx@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250623080440.3005693-1-agordeev@linux.ibm.com>
 <c11a4b2e-6895-43b7-9ff6-620793bf8551@arm.com>
 <aFkgTA+02bV6nldk@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <f5c7ed26-b034-4600-ba29-26761eb1eef5@arm.com>
 <4214d6d6-f8d5-43b3-a413-f576fdaf215d@redhat.com>
 <aFpxvQxgUEdO9jd/@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <75717e4e-51d0-41a2-8463-45097fc3875b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75717e4e-51d0-41a2-8463-45097fc3875b@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fazFq2rDNT2-PW9A3uQh3Z2JthCXtzj0
X-Proofpoint-GUID: fazFq2rDNT2-PW9A3uQh3Z2JthCXtzj0
X-Authority-Analysis: v=2.4 cv=BpqdwZX5 c=1 sm=1 tr=0 ts=685a9346 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=nENOSrSBMpMrXF5MCvkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5OSBTYWx0ZWRfX4glAbsng8hlX eVa8iwvTyWlWgTV7SdMAOK5zofZZQ+x7Px7ly2qJprQQBL8+IQEQKOmPIyyiDnLrKLL5WjsImvX rGYyVrz0kpzlONRJscUOmR2TlW3+CyVNSKkKnn9iKSoah6Wc/fDxl8ukidaN3pULmR67/k4IsWO
 R3vdGZZETXvoV4njFxtmB02DppTJLUKfq3Yh2hCktazFSZbbcdu+tCp1wudbZKlGRrfgaZifedR zxP8IedlotmWNjHWqj6nVOJBdmeH8KNxSKJ5shUdgSPlXc+hR1GrzsFGfB38p1uDw5xfNi5esWe r2Xg10seD+i/aAjx1oVwryCKf1HX3pymYA8CAI5jTl8o9mx/FCj+aHgE27Oj6Fq2QvuxLoY/ZLW
 7LYkyan5uVbloe8w2EryraeRLnS9L6bl6klF0Beu4AP3KJRr7aQFkyX5vOGwcDgwKBW1YCJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=383
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240099

On Tue, Jun 24, 2025 at 11:40:05AM +0200, David Hildenbrand wrote:
> On 24.06.25 11:37, Alexander Gordeev wrote:
> > On Mon, Jun 23, 2025 at 09:45:34PM +0200, David Hildenbrand wrote:
> > ...
> > > Let's ask the real questions: who checks PGTBL_PTE_MODIFIED?
> > > 
> > > I see
> > > 
> > > if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> > > 	arch_sync_kernel_mappings(start, start + size);
> > > 
> > > And then
> > > 
> > > arch/arm/include/asm/page.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> > > arch/x86/include/asm/pgtable-2level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> > > arch/x86/include/asm/pgtable-3level_types.h:#define ARCH_PAGE_TABLE_SYNC_MASK   PGTBL_PMD_MODIFIED
> > > 
> > > 
> > > Which makes me wonder why we need PGTBL_PTE_MODIFIED at all? Is there some other check I am missing?
> > > 
> > > (same question regarding everything excepy PGTBL_PMD_MODIFIED, because that actually seems to be used)
> > 
> > AFAICT it was thought as architecture-specific:
> > 
> > /*
> >   * Architectures can set this mask to a combination of PGTBL_P?D_MODIFIED values
> >   * and let generic vmalloc and ioremap code know when arch_sync_kernel_mappings()
> >   * needs to be called.
> >   */
> > #ifndef ARCH_PAGE_TABLE_SYNC_MASK
> > #define ARCH_PAGE_TABLE_SYNC_MASK 0
> > #endif
> > 
> > Not sure if that needs to be addressed at all.
> 
> Okay, if there are no users of PGTBL_PTE_MODIFIED we could just ... remove
> it. Dead code.

As you noticed, PGTBL_PMD_MODIFIED bit is used only. Thus, all other
bits would have to be removed as well, not just PGTBL_PTE_MODIFIED?

That is more or less revert of at least the below commits and rewriting
it in a PMD-focused manner:

2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
d8626138009b ("mm: add functions to track page directory modifications")

That would be a completely different effort, which I am not aming at ;)

> -- 
> Cheers,
> 
> David / dhildenb

Thanks!
