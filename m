Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B0F283CBA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287803; cv=none; b=rQeTuaU5RgzOkwsKP0DCXkqCOTj0Wp0tStxwR+KHF7X66X2qAmtqyyBUtiM/CXYtwTfgdsX92XbRCqd9FSkhO2VI3O2xDT/FHwGSSfRIiYjhfCIQlK+FuZa8bCNgiBiD5QWYcEKrLYFpkVXHRT09ZdKghjXjdofwhK1i0TbVyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287803; c=relaxed/simple;
	bh=54Jo4nNo/d5X4X4+SdkkodmO389yWZZDVE1yt4F2jOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyizU1Bf6zkpYGcCF2dFZvV7kg43RA4HnnJLNUnULvnu4m4r5BGQtc9ntvAn66yDueFgviXHcb6StTswcPNBEO+IWlfDHu1CqRIdql+KHD7Y/cQeX6xGwHydpshcQgkjlMyQtjMjpY0LjbKnhrTuFN7FMwS5o81BIitzFVr9c/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=V+RF54IN; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="V+RF54IN"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A9vh60025345;
	Thu, 10 Apr 2025 12:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=GbJEQgF0XibJOyKxN3cFEfmWdRZals
	A603n+44EhDeE=; b=V+RF54INkmCq557aKfg17m2/XSDPi98FZUqHKg93hqk5gH
	sZuNWuJU7d40UaHb9i7DD8eqdCSneQNCpmXTTWzXocdK5ULo8+iLJ4qEe7gggNne
	GQwCzK4c9WobgJxnqjAkRNH5y6mJdVpsbpCVKzE+BqGyFo4BciRBMnlb9wIlALfQ
	rRL1ujcUdsraFh7COulA5XT8dimSDYVhu1LXBN3yjGmyzKSYg3Ze+d7uULv8bcy8
	o4uizdesXNrIW/46AZPCq2MEEns/5Z8RzbERybZhOZBRZCc/GDS7Rc3290/Qzvp5
	DrUqUTfBbk/KNFU6HhUydpnkLZ7HLn/Mlutx5ERQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ww2xdkr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 12:23:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A93Xmq025510;
	Thu, 10 Apr 2025 12:23:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbm5w4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 12:23:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53ACN6FL30868164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 12:23:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B48F2004D;
	Thu, 10 Apr 2025 12:23:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68A5D20040;
	Thu, 10 Apr 2025 12:23:02 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.39.22.212])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Apr 2025 12:23:02 +0000 (GMT)
Date: Thu, 10 Apr 2025 17:52:59 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: Re: [REPORT] Softlockups on PowerNV with upstream
Message-ID: <tm2pvk7ylatmou2gjcctz4dzyw3rudw5hgqsiax3eoxfkvsrmz@vuzh3xuepq6n>
References: <20250409180344.477916-1-adityag@linux.ibm.com>
 <Z_dWTU8UsvCHFMpN@localhost.localdomain>
 <dc4c0d4e-a9a5-4fa5-b39d-4248fba26043@redhat.com>
 <Z_d_8fyQzGuwzbIv@localhost.localdomain>
 <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675d6580-814f-4fae-9dc5-9470645adc07@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 72wWsvzQSRwO6SpG7SA_e4rX4N-_0D4U
X-Proofpoint-ORIG-GUID: 72wWsvzQSRwO6SpG7SA_e4rX4N-_0D4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=598 bulkscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100086

Cc +donet

On 25/04/10 07:44PM, Gavin Shan wrote:
> On 4/10/25 6:23 PM, Oscar Salvador wrote:
> > On Thu, Apr 10, 2025 at 03:35:19PM +1000, Gavin Shan wrote:
> > > Thanks, Oscar. You're correct that the overhead is introduced by for_each_present_section_nr().
> > > I already had the fix, working on IBM's Power9 machine, where the issue can be
> > > reproduced. Please see the attached patch.
> > > 
> > > I'm having most tests on ARM64 machine for the fix.
> > 
> > Looks good to me.
> > But we need a comment explaining why block_id is set to ULONG_MAX
> > at the beginning as this might not be obvious.
> > 
> > Also, do we need
> >   if (block_id != ULONG_MAX && memory_block_id(nr) == block_id) ?
> > 
> > Cannot just be
> > 
> >   if (memory_block_id(nr) == block_id) ?
> > 
> > AFAICS, the first time we loop through 'memory_block_id(nr) == ULONG_MAX'
> > will evaluate false and and we will set block_id afterwards.
> > 
> > Either way looks fine to me.
> > Another way I guess would be:
> > 
> 
> Yeah, we need to record the last handled block ID by @block_id. For the
> first time to register the block memory device in the loop, @block_id needs
> to be invalid (ULONG_MAX), bypassing the check of 'memory_block_id(nr) == block_id'.
> I will post the fix for review after Aditya confirms it works for him, with extra
> comment to explain why @block_id is initialized to ULONG_MAX.
> 
> Aditya, please have a try when you get a chance, thanks! I verified it on Power9
> machine where the issue exists and on one of my ARM64 machine.

I don't see any softlockups now with your patch as well as Oscar's patch.

Tested on PowerNV Power10.

Thanks for the quick replies Gavin.
- Aditya G

> 
> Thanks,
> Gavin
> 
