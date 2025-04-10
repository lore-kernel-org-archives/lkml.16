Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92E4283C98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285521; cv=none; b=cnhnzKNuubWMrr4ED1gsQgA6MBnUJkRN1lbrXR++IiXCd05VZ72BWgWHB6+qlFIAJr1eU5lT8tQxWRhDfklkkW2QrmviOzEF7kGwvjh/W/DuAYM4IcEjX1MONTJiC38OW6n8Ur3gADb7vlwen5tkRuPSepsqTK12Egb8KH8XWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285521; c=relaxed/simple;
	bh=7ca5bLfmjxvf6jlg5nuul8dtCE3amSTjjDloSGV1IJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzE+hF1PWJgHFS8SnOqE6JDxL2rQ+TrShGBjqLnZNTll4J8AoDc22w2ZTlH9RzS1g6kRyHqXaPXK8ZVHlcRncVG39IzQlpZQnA/BOakJyGhFwkEvtQieQkjOFNKYO53Cl1GgB961rM+0IdYIwvEBpORPahnh6zXh/y7xdJGJGug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FKKmF44a; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FKKmF44a"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A7eNpU027166;
	Thu, 10 Apr 2025 11:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=p1V/7F+VMq4YH0hACfoC/u64p3acG3
	4ZY0pkRT7wzz4=; b=FKKmF44a0LU8VGJOUjYtWxksHnW1ccSmWzO+LOPc+ezCe7
	qA6yaZgEdat/AZ9jM8btEOQlehyYTERbGfrMNFNm1IIOv1+IaO6rrdmtTjr3hpZ/
	eYHmNZOwOYvTNkH7gJnrFmSOHXkvWpzutyUKIMgsIycloGAGD4LnVoVs2hzH5Wew
	cd0CO/eYKvTFAR6GzbI+a1hxH+a2sPk7zYkFjL53SV7qATVMDiwBCXXqCfpPPG0H
	lhJC7MVr6o/EQ5qSWj0+VyB979ELjj1OaCs5Zz4CnrVrIpKwAd6rRp0FDp6oVGN6
	7/bqVGP2vLvonJ7o7/rhpIUgGcCaWQrHxIFi3Xhg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45wtaq6p1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:45:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53ABeYEp011522;
	Thu, 10 Apr 2025 11:45:02 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45uf7ywy6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 11:45:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53ABiwld19923322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 11:44:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A61B820040;
	Thu, 10 Apr 2025 11:44:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5E6220043;
	Thu, 10 Apr 2025 11:44:55 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.212])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 11:44:55 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:14:53 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <lucjfatnsaovne3tsegsrwgukgjsrhe6js6yeyl3ljq3tydqiz@mf6w2dqeyrtb>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_dWTU8UsvCHFMpN@localhost.localdomain>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pa47FRq-s15H8wi8vWE8oorCdPchpsZg
X-Proofpoint-ORIG-GUID: Pa47FRq-s15H8wi8vWE8oorCdPchpsZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504100086

Hi,

On 25/04/10 07:25AM, Oscar Salvador wrote:
> On Wed, Apr 09, 2025 at 11:33:44PM +0530, Aditya Gupta wrote:
> > Hi,
> > 
> > While booting current upstream kernel, I consistently get "softlockups", on IBM PowerNV system.
> > 
> > I have tested it only on PowerNV systems. But some architectures/platforms also
> > might have it. PSeries systems don't have this issue though.
> > 
> > Bisect points to the following commit:
> > 
> >     commit 61659efdb35ce6c6ac7639342098f3c4548b794b
> >     Author: Gavin Shan <gshan@redhat.com>
> >     Date:   Wed Mar 12 09:30:43 2025 +1000
> > 
> >         drivers/base/memory: improve add_boot_memory_block()
> > 
> ... 
> > Console log
> > -----------
> > 
> >     [    2.783371] smp: Brought up 4 nodes, 256 CPUs
> >     [    2.783475] numa: Node 0 CPUs: 0-63
> >     [    2.783537] numa: Node 2 CPUs: 64-127
> >     [    2.783591] numa: Node 4 CPUs: 128-191
> >     [    2.783653] numa: Node 6 CPUs: 192-255
> >     [    2.804945] Memory: 735777792K/738197504K available (17536K kernel code, 5760K rwdata, 15232K rodata, 6528K init, 2517K bss, 1369664K reserved, 0K cma-reserved)
> 
> If I am not mistaken this is ~700GB, and PowerNV uses 16MB as section size,
> and sections_per_block == 1 (I think).

Yes, the memory is around 700G:

    # lsmem
    RANGE                                  SIZE  STATE REMOVABLE         BLOCK
    0x0000000000000000-0x0000001fffffffff  128G online       yes         0-127
    0x0000400000000000-0x0000400fffffffff   64G online       yes   65536-65599
    0x0000800000000000-0x0000803fffffffff  256G online       yes 131072-131327
    0x0000c00000000000-0x0000c03fffffffff  256G online       yes 196608-196863
    
    Memory block size:         1G
    Total online memory:     704G
    Total offline memory:      0B

I don't know about the sections_per_block.

> 
> The code before the mentioned commit, was something like:
> 
>  for (nr = base_section_nr; nr < base_section_nr + sections_per_block; nr++)
>        if (present_section_nr(nr))
>           section_count++;
> 
>  if (section_count == 0)
>     return 0;
>  return add_memory_block()
> 
> So, in case of PowerNV , we will just check one section at a time and
> either return or call add_memory_block depending whether it is present.
> 
> Now, with the current code that is something different.
> We now have 
> 
> memory_dev_init:
>  for(nr = 0, nr <= __highest_present_section_nr; nr += 1)
>      ret = add_boot_memory_block
> 
> add_boot_memory_block:
>  for_each_present_section_nr(base_section_nr, nr) {
>      if (nr >= (base_section_nr + sections_per_block))
>             break;
> 
>      return add_memory_block();
>  }
>  return 0;
> 
> The thing is that next_present_section_nr() (which is called in
> for_each_present_section_nr()) will loop until we find a present
> section.
> And then we will check whether the found section is beyond
> base_section_nr + sections_per_block (where sections_per_block = 1).
> If so, we skip add_memory_block.
> 
> Now, I think that the issue comes from for_each_present_section_nr
> having to loop a lot until we find a present section.
> And then the loop in memory_dev_init increments only by 1, which means
> that the next iteration we might have to loop a lot again to find the
> another present section. And so on and so forth.
> 
> Maybe we can fix this by making memory_dev_init() remember in which
> section add_boot_memory_block returns.
> Something like the following (only compile-tested)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8f3a41d9bfaa..d97635cbfd1d 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -816,18 +816,25 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>  	return 0;
>  }
> 
> -static int __init add_boot_memory_block(unsigned long base_section_nr)
> +static int __init add_boot_memory_block(unsigned long *base_section_nr)
>  {
> +	int ret;
>  	unsigned long nr;
> 
> -	for_each_present_section_nr(base_section_nr, nr) {
> -		if (nr >= (base_section_nr + sections_per_block))
> +	for_each_present_section_nr(*base_section_nr, nr) {
> +		if (nr >= (*base_section_nr + sections_per_block))
>  			break;
> 
> -		return add_memory_block(memory_block_id(base_section_nr),
> -					MEM_ONLINE, NULL, NULL);
> +		ret = add_memory_block(memory_block_id(*base_section_nr),
> +				       MEM_ONLINE, NULL, NULL);
> +		*base_section = nr;
> +		return ret;
>  	}
> 
> +	if (nr == -1)
> +		*base_section = __highest_present_section_nr + 1;
> +	else
> +		*base_section = nr;
>  	return 0;
>  }
> 
> @@ -973,9 +980,9 @@ void __init memory_dev_init(void)
>  	 * Create entries for memory sections that were found
>  	 * during boot and have been initialized
>  	 */
> -	for (nr = 0; nr <= __highest_present_section_nr;
> -	     nr += sections_per_block) {
> -		ret = add_boot_memory_block(nr);
> +	nr = first_present_section_nr();
> +	for (; nr <= __highest_present_section_nr; nr += sections_per_block) {
> +		ret = add_boot_memory_block(&nr);
>  		if (ret)
>  			panic("%s() failed to add memory block: %d\n", __func__,
>  			      ret);
>  

Makes sense, thanks for the nice explanation.

> 
> @Aditya: can you please give it a try?
> 

Yes, will try it now.

Thanks,
- Aditya G

> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
