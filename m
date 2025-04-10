Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B501E9B35
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288025; cv=none; b=Ml14MdGvc8asMkvudPKoJMXfehFah6BwgXsfod0AWQ0vGCdyUVlUkycD3w/G/S11eL4ypBx+9jpbebblzs7gTWYpD6y/d4nTXpziaWYISBopMYZq4y0J1tAcl/bBGAjX2aMmvm306FoEH3dCdw7J7MmaXVWOQsTQ+dxCp2bgu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288025; c=relaxed/simple;
	bh=QMDUyyoGyTYFY+9TOg5hBGdZMLyK7dwuCjRU4ELDTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1j9EAgDzvMSL8tLWFoAHsobtwZyrpr1kFsFLEtYFz+sOtizwd2h7BnxFScHWbDHJJqcpCUlqcB3uxC9DYUQbLknUXFi6blH2ar5SM8Tq0fzR2g4wHQOqfWMCj3sZS/fGDP4i8lF4xH7tRH1sD0759syQ1sACJohvuY8FnaVr2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jvoYFe+Y; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jvoYFe+Y"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ABUDe3018214;
	Thu, 10 Apr 2025 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=85FvRbAwTpMAmUYdzSPjTGDy7WhnOn
	N4hRMAQsxEA3s=; b=jvoYFe+YnBbs8UrR1P0sxAJiW7nTen8Q9np/fnWUe1ObUU
	oPYfZKEt7GwopwAQgnjnKGlZ6+TUTPvJtkOuqsLv3iiPMzpa7RhKZIuvrccXfrSA
	xhMrZnXxr50wHx04vkvmfimxIjExYxWX97bHSgiDaNa1t1iAYbVKuT5dwU+5KD9K
	0CHyIxf7Szohw899d2gKNgVPT4aU9x0t+bWq1w5l63FvmzRtjQMSJf+7h0ZkQs9O
	RRUJda0cEeCyTaL643qQrCzJWfCBqjZbFLVBfWj15acTCzX9JGNaKQorVRZHu3Pr
	JcG2s1caubMZ2hWXP/11sIU81EvZIQRCD6owrZeA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x6ca2r15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 12:26:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A8jExk025537;
	Thu, 10 Apr 2025 12:26:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm5wd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 12:26:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53ACQkgE41550248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 12:26:46 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C131B20040;
	Thu, 10 Apr 2025 12:26:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 196FF2004B;
	Thu, 10 Apr 2025 12:26:43 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.212])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 12:26:42 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:56:40 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Gavin Shan <gshan@redhat.com>
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <3bn5jd25tpeubkg73kigbmjidnwavknlmgybp42fsleymk2zkp@gryuktxflfjh>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <lucjfatnsaovne3tsegsrwgukgjsrhe6js6yeyl3ljq3tydqiz@mf6w2dqeyrtb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lucjfatnsaovne3tsegsrwgukgjsrhe6js6yeyl3ljq3tydqiz@mf6w2dqeyrtb>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iR2PqIjTGmgqrMZNyGEHF5ky5Qwav4Ed
X-Proofpoint-ORIG-GUID: iR2PqIjTGmgqrMZNyGEHF5ky5Qwav4Ed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=603 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100086

On 25/04/10 05:14PM, Aditya Gupta wrote:
> Hi,
> 
> On 25/04/10 07:25AM, Oscar Salvador wrote:
> > > <...snip...>
> > 
> > @Aditya: can you please give it a try?
> > 
> 
> Yes, will try it now.

I don't see the softlockups now, with your patch Oscar.

Also Gavin's patch also fixes the issue for me.

Tested it on a Power10 PowerNV system.

Thank you for the quick replies !

Thanks,
- Aditya G

> 
> Thanks,
> - Aditya G
> 
> > 
> > 
> > -- 
> > Oscar Salvador
> > SUSE Labs
