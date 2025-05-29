Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E39D374D1
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748495504; cv=none; b=ielUqSUCs8dVfzPHUU8ARaHZRzW3hvlTm5fNJSQqoRiC3Cn4jS+57RSLmxk0ggcavhvABT661VcFEOWjkrMlqtiwgi+surkxDRTpxiThczHL/AaFHBkoJufgKb8b0dht53h7ceY2wQa6Uzrf05TtBqubP0WULvXpM+M7zvYfvKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748495504; c=relaxed/simple;
	bh=c/ixq4Z0udRwRqznWjIlGyCtXjxgW3LExOAXwRHr0Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4/5T06Os8XXjmlkS3/wvYXTA09cmnx9+hujoscdZaG4D4r3lap9oOsDQsL01rbinpOqJd8+6/c3QfNDySx8bMRm8Pbp5d9YPo0OKa5iTJZ9GR+iI/t1IQ+Yk9gSNRkd/RJFGXIDRVo3u7097o5dc7qPFbXsRLBiGCI7fr7Noc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hFk4/03p; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hFk4/03p"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T1fj6N004383;
	Thu, 29 May 2025 05:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=X0Jd8FFgm4qxnOgZ865QP
	KgJMHi8ub0Qr7DZMpZF4Oo=; b=hFk4/03pbftAz7B66Dc73kJ+8XBzXMXJOLXqW
	RRtrHWdykXEi7pX153PFYs/kWhAwFFu8laWKrXeyjQuRphjtXZeW1JR3IUiASpsd
	jYd7j6WzVvPi8tMBH8VwCScEyUOn7/WpnZAJxGmk/Do0R9YSIFfE6xwR6Ie6yZcY
	62dyF3wT0lZgz7k8PPpmoBxDpcC2fEyjZ2jgEonu5HZlusZH9bODpGU5tmtbFK+B
	6nnqGWkOxBd6L6xTDrMmgXKWxWzkLOZt/OYEeTSjsrbOOpVIetsoGlMm9eKpjb3i
	p883nToQkgagaH4/Gqy8tUgX7PywqLmU9/Mff6oEYiwgEdNJg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40hkj34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:11:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54T43rZL016184;
	Thu, 29 May 2025 05:11:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0u0ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 05:11:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54T5BOvs53281034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 May 2025 05:11:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 384B720040;
	Thu, 29 May 2025 05:11:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EC8920049;
	Thu, 29 May 2025 05:11:23 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 29 May 2025 05:11:23 +0000 (GMT)
Date: Thu, 29 May 2025 10:41:22 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437
 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <aDfsemssEVATfP80@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
 <aDV8iWe2nWX9JuvV@linux.ibm.com>
 <20250527204728.63d538f8@yea>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250527204728.63d538f8@yea>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA0OCBTYWx0ZWRfXwEhsCyLs6ykq 1ZMnVs/VHuDk4+Nh1EkeaM2XS0YvBBwwRvQ3R7ODG3kRTSpKAbBw6j72AXCb5iClwTI8aujt8Lj DAZMt7av3nnIpIib+fTrvBYgvGSWyzg8vBiZ9hs4jbnXev/w49Q/RmTTBfEgR5m2RUH33YCtHz1
 LGLvIaT0ZB+dxxwSNTQJK8U3abDhaCvh/eGqp2De1DqdNr+6+xuS4IZHoWOlf8ocS0QCmj2coU9 5jIS1TNfGJcAbBS7iEAyEcAwQMvpGKK1nX2J7WEQ0B2QJOhexFYiXVLB0E049qFDnQX7AtAbut0 CxaN6+fFWT3qoT9jJiyK5forrZwwE3ObpZaq688oMsx2HPh7azizhB6XSlDqd8/WJZmsIVQbdeb
 P2ZoMpDNNoX+8VkPWYV1rsKNgVrDVJ/wx9sam2elO4TdhYwUhQ8KvpSRsijI9gC6rDDAMKce
X-Proofpoint-GUID: 13H9WgQKun6tknp03i1YS01Ih7sydL6I
X-Authority-Analysis: v=2.4 cv=WOd/XmsR c=1 sm=1 tr=0 ts=6837ec7f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=8nJEP1OIZ-IA:10 a=dt9VzEwgFbYA:10 a=b3CbU_ItAAAA:8 a=VnNF1IyMAAAA:8 a=7tZeYA7kITtpdtYA3z0A:9 a=wPNLvfGTeEIA:10
 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: 13H9WgQKun6tknp03i1YS01Ih7sydL6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290048

* Erhard Furtner <erhard_f@mailbox.org> [2025-05-27 20:47:28]:

> On Tue, 27 May 2025 14:19:13 +0530
> Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> 
> > > Getting these from time to time when I run the machine for longer periods building:
> > > 
> > > [...]
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0  
> > 
> > Its a warning with says that the task's userspace MSR register has
> > VSX set but not the VEC or FP.
> > 
> > Were you building the kernel or were you building something else.
> > Can you paste the command you attempted?
> 
> I was doing an 'emerge -e @world' in Gentoo Linux and probably building a kernel in another shell. Noticed it only in the logs on the next day so I can't tell exactly which command triggered the issue.
> 
> But I will pay closer attention from now on.
> 
> > If this is happening with only the recent kernel and working with a previous
> > kernel, do you happen to know the previous kernel version.
> > In which case, is there a possibility of doing a git bisect?
> 
> I think I have not seen this in v6.13, certainly not in v6.12.
> 

I did go through the git log from v6.12 till v6.15-rc7 and I dont see any
direct changes that could affect VSX VEC or FP changes in kernel.

On a side note, Was there any significant userspace updates like library,
compiler updates from when you saw it working to now?

-- 
Thanks and Regards
Srikar Dronamraju
