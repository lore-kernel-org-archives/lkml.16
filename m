Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357071AA782
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813194; cv=none; b=nNhOlXJj3JLUCGdQZES4Wlrsc/icWMaEYCYM7aZVm9s5asMIn9WWV91hax/u3YpBtLHemrd4MPNEO4glMkYF44fO+XqGOZVAR6IldPBRxaFsZPgjHjLcI0aKZ4Z3vAj+hhPOq2bdP80bf3I/qpX+fz7SQM+X6e+Pc7B9mEqH0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813194; c=relaxed/simple;
	bh=HfrPiWru8k8p6DPiavzJB6DAONCMI2/gXm28JKBOR18=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gpoa21Y36w3d6YL7DzS+cLE5uBs3PPjOvXWxU/NeQrHdg2kUUySSe6+kelcNF7LcbRCguO2hvoYAblWe9/HRi44YOaU9VGDwEXnuN/WXrDPIeJET/RL/wK5ysGFbhFj/L2Mn46I/OwnteDqpXlD3tekqWnuyTs3NVddqwrgk3SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CMfa5YQN; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CMfa5YQN"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GA4LVI030084;
	Wed, 16 Apr 2025 14:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=E6X3bH
	XkjfioHKJdqS9ZwJDDLbXEQrJOvdoxcCQdXDM=; b=CMfa5YQN+rVqdCvU1ZpIso
	qhzLKix+qgcIoSSWxZk9cYaCLNRRalUMnrgRRZfJ0G5tnPs4odTK56L2TCNX5Xz1
	8RC0MVawd3I6jIEkHDXCj94XSDH4nAwTA5Un9IDlonTbsnO4WUXt3cF6d7rgkW3b
	G/gWnvaZmga1F2ki03mBLhG2u3jkSv1GDuvkazKmZNTWde3u4MqgVpVAFdC86zfe
	4Op1mb1CrOVDGLgxf71s6UG/09aoG8CkeViRD1hkSgk8+WAFFaDiPMg2DJgTIhAx
	TnMOy1TiPohfjGt9DJ/m34h0N0dToPdvi0ugJEglB1ijkoFvQMRjcxjrcSBx7LSQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462aff9b88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:19:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GDR3oa024888;
	Wed, 16 Apr 2025 14:19:44 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gth0wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:19:44 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GEJg4W21365354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:19:42 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 687055805D;
	Wed, 16 Apr 2025 14:19:42 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2652C58055;
	Wed, 16 Apr 2025 14:19:40 +0000 (GMT)
Received: from [9.61.241.145] (unknown [9.61.241.145])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 14:19:39 +0000 (GMT)
Message-ID: <99a06f56-08cf-42ce-a231-f9a38c6ece9a@linux.ibm.com>
Date: Wed, 16 Apr 2025 19:49:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline]tools/perf build warnings
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, jiang.peng9@zte.com.cn,
        shao.mingyin@zte.com.cn, Thomas Gleixner <tglx@linutronix.de>
References: <2c04b7ef-dc85-4a40-b0d8-6ae73c20b65d@linux.ibm.com>
 <B34E8075-7F38-4E30-9E51-23E43DDDF06F@linux.ibm.com>
 <1ec497ed-b98c-46aa-a9c2-5fa906790298@linux.ibm.com>
In-Reply-To: <1ec497ed-b98c-46aa-a9c2-5fa906790298@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MANUmOX_47QreoPsuuhU2vmLvicelOuF
X-Proofpoint-GUID: MANUmOX_47QreoPsuuhU2vmLvicelOuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160115


On 16/04/25 7:33 pm, Venkat Rao Bagalkote wrote:
>
> On 16/04/25 6:41 pm, Athira Rajeev wrote:
>>
>>> On 16 Apr 2025, at 5:12 PM, Venkat Rao Bagalkote 
>>> <venkat88@linux.ibm.com> wrote:
>>>
>>> Hello,
>>>
>>>
>>> I am observing a new build warning on today mainline kernel, with 
>>> head commit: g834a4a689699
>>>
>>> Repo:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>
>>>
>>> Warnings:
>>>
>>> diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>>>
>>>
>>> If you happen to fix this, please add below tag.
>>>
>>>
>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>> Hi Venkat
>>
>> Can you please check with 
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/?h=tmp.perf-tools-next
>> with the tmp.perf-tools-next branch..
>
>
> I verified with perf-tools-next repo on both branches namely 
> tmp.perf-tools-next and perf-tools-next, and I think this warning got 
> recently introduced.

/Typo in the last mail, please refer to below update./

I verified with perf-tools-next repo on both branches namely 
tmp.perf-tools-next and perf-tools-next, and issue is not seen there. 
And I think this warning got recently introduced.

>
> Git Bisect is pointing to acea9943271b62905033f2f8ca571cdd52d6ea7b as 
> first bad commit.
>
>
> Below is the bisect log:
>
> git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [834a4a689699090a406d1662b03affa8b155d025] Merge tag 
> 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
> git bisect bad 834a4a689699090a406d1662b03affa8b155d025
> # status: waiting for good commit(s), bad commit known
> # good: [0af2f6be1b4281385b618cb86ad946eded089ac8] Linux 6.15-rc1
> git bisect good 0af2f6be1b4281385b618cb86ad946eded089ac8
> # bad: [ef7785882672e73847fb80f6c39e76998d4db57b] Merge tag 
> 'bcachefs-2025-04-10' of git://evilpiepirate.org/bcachefs
> git bisect bad ef7785882672e73847fb80f6c39e76998d4db57b
> # good: [e4742a89cfaced383db758bef94037637899487a] Merge tag 
> 'block-6.15-20250410' of git://git.kernel.dk/linux
> git bisect good e4742a89cfaced383db758bef94037637899487a
> # good: [eaa517b77e63442260640d875f824d1111ca6569] ethtool: cmis_cdb: 
> Fix incorrect read / write length extension
> git bisect good eaa517b77e63442260640d875f824d1111ca6569
> # good: [ac253a537da3b210fa4b65d522d5533fc68f9515] Merge tag 
> 'perf-urgent-2025-04-10' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good ac253a537da3b210fa4b65d522d5533fc68f9515
> # good: [3c9de67dd37029cca1d0f391ff565b3809b40a1f] Merge tag 
> 'x86-urgent-2025-04-10' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect good 3c9de67dd37029cca1d0f391ff565b3809b40a1f
> # bad: [0c7cae12f67c4c5fd232cffb27023deb409e1e20] Merge tag 
> 'irq-urgent-2025-04-10' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect bad 0c7cae12f67c4c5fd232cffb27023deb409e1e20
> # bad: [34833819d2270ef96fa98fe3c1d3d297b5dec986] Merge tag 
> 'timers-urgent-2025-04-10' of 
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> git bisect bad 34833819d2270ef96fa98fe3c1d3d297b5dec986
> # good: [92e250c624ea37fde64bfd624fd2556f0d846f18] timekeeping: Add a 
> lockdep override in tick_freeze()
> git bisect good 92e250c624ea37fde64bfd624fd2556f0d846f18
> # bad: [acea9943271b62905033f2f8ca571cdd52d6ea7b] vdso: Address 
> variable shadowing in macros
> git bisect bad acea9943271b62905033f2f8ca571cdd52d6ea7b
> # first bad commit: [acea9943271b62905033f2f8ca571cdd52d6ea7b] vdso: 
> Address variable shadowing in macros
>
>
> Regards,
>
> Venkat.
>
>>
>> Also there is a patchset here:
>> https://lore.kernel.org/linux-perf-users/FE96FD04-4396-4C34-A70D-2A592FD5F916@linux.ibm.com/T/#m3e9d6aac4c34ebf42f18f3c213b7dff8f8c70d9d 
>>
>>
>> Which I think you have already tested..
>>
>> Thanks
>> Athira
>>>
>>> Regards,
>>>
>>> Venkat.
>>>
>>>
>>>
