Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1E146593
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812248; cv=none; b=A7kHZBdGjNKYrlWHnr6Tt/Ufleom7MuuFfE5JkKi5p6E+5sRIfYb9+nnHnINR43kUjmYWEnQG0E2kTcbk9q4xyazGNd61xzxdjYvuHq0TQej+JrBI+7PYMl1Rcet7bWsXPQA0LZDQy9o27m0/a+GXxnUcIGyM8sxa2OIzHrIosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812248; c=relaxed/simple;
	bh=5FruTQEw6kFzse6LeyftHeWXvbTo0p9a12VJ7NFnuX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwHQN8I8sZMbBHPf0PKMljbpSQBncL3zgAskVGbf2lwqkmwecDSNEKIDdEMOWVydeEIYKXO1ze88ISZobcNkhZdhP/ynbhNESquheqh6oqtt5M/HwGuBzgBjT37De+gvnlnsASp+nemXSJvw5GnOoCYHr+jZUj1/lqh49O4NQmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=l/c0J2Fd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="l/c0J2Fd"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GA3wvK029000;
	Wed, 16 Apr 2025 14:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=soYzm2
	Qky44BEkxPGbMkkj364v4eEf+zFEpnsBblMvo=; b=l/c0J2Fdeg2oSlvr+21CER
	5B7e0TDOAJqkCGhEgsn5xtJosKIXSo1PXj3Svb2f3i1csWGDxXUtYKKUjRhq09F1
	aEB57hVbjhoRjC4oHGJz4H5ik7/dWydcFVP/4gaRS9EF5pIhfhQcQBzKPKnRlUXi
	Eg5K6h3YMMRmmUyaM6p4baER/QUEpDIF8okQf0p6pMaVrawHct8Zzrqn70mLfF5f
	tOfR4Rk5cVyyu+JXMCh46rJ5aiHP9g2aa9SwRoeBngd9zq/kFHPEixIHB8DHiHFS
	eBnGCjiSnCm9ygV/S7n1KxBNosiqaAxdmlQUYnmKxg3k3S7PpL+AlTsahl52ldkA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462aff98fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:03:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GBwDCO017195;
	Wed, 16 Apr 2025 14:03:46 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46040m0fv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:03:46 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GE3jYb524874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:03:45 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A37E5805D;
	Wed, 16 Apr 2025 14:03:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3C4F5805F;
	Wed, 16 Apr 2025 14:03:42 +0000 (GMT)
Received: from [9.61.241.145] (unknown [9.61.241.145])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Apr 2025 14:03:42 +0000 (GMT)
Message-ID: <1ec497ed-b98c-46aa-a9c2-5fa906790298@linux.ibm.com>
Date: Wed, 16 Apr 2025 19:33:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline]tools/perf build warnings
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, jiang.peng9@zte.com.cn,
        shao.mingyin@zte.com.cn, Thomas Gleixner <tglx@linutronix.de>
References: <2c04b7ef-dc85-4a40-b0d8-6ae73c20b65d@linux.ibm.com>
 <B34E8075-7F38-4E30-9E51-23E43DDDF06F@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <B34E8075-7F38-4E30-9E51-23E43DDDF06F@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sD38RxdY_8mov_aljAdRjuyX0GJ6Avzd
X-Proofpoint-GUID: sD38RxdY_8mov_aljAdRjuyX0GJ6Avzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160115


On 16/04/25 6:41 pm, Athira Rajeev wrote:
>
>> On 16 Apr 2025, at 5:12 PM, Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>>
>> Hello,
>>
>>
>> I am observing a new build warning on today mainline kernel, with head commit: g834a4a689699
>>
>> Repo:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>
>>
>> Warnings:
>>
>> diff -u tools/include/vdso/unaligned.h include/vdso/unaligned.h
>>
>>
>> If you happen to fix this, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Hi Venkat
>
> Can you please check with https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/?h=tmp.perf-tools-next
> with the tmp.perf-tools-next branch..


I verified with perf-tools-next repo on both branches namely 
tmp.perf-tools-next and perf-tools-next, and I think this warning got 
recently introduced.

Git Bisect is pointing to acea9943271b62905033f2f8ca571cdd52d6ea7b as 
first bad commit.


Below is the bisect log:

git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [834a4a689699090a406d1662b03affa8b155d025] Merge tag 'for-linus' 
of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect bad 834a4a689699090a406d1662b03affa8b155d025
# status: waiting for good commit(s), bad commit known
# good: [0af2f6be1b4281385b618cb86ad946eded089ac8] Linux 6.15-rc1
git bisect good 0af2f6be1b4281385b618cb86ad946eded089ac8
# bad: [ef7785882672e73847fb80f6c39e76998d4db57b] Merge tag 
'bcachefs-2025-04-10' of git://evilpiepirate.org/bcachefs
git bisect bad ef7785882672e73847fb80f6c39e76998d4db57b
# good: [e4742a89cfaced383db758bef94037637899487a] Merge tag 
'block-6.15-20250410' of git://git.kernel.dk/linux
git bisect good e4742a89cfaced383db758bef94037637899487a
# good: [eaa517b77e63442260640d875f824d1111ca6569] ethtool: cmis_cdb: 
Fix incorrect read / write length extension
git bisect good eaa517b77e63442260640d875f824d1111ca6569
# good: [ac253a537da3b210fa4b65d522d5533fc68f9515] Merge tag 
'perf-urgent-2025-04-10' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good ac253a537da3b210fa4b65d522d5533fc68f9515
# good: [3c9de67dd37029cca1d0f391ff565b3809b40a1f] Merge tag 
'x86-urgent-2025-04-10' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 3c9de67dd37029cca1d0f391ff565b3809b40a1f
# bad: [0c7cae12f67c4c5fd232cffb27023deb409e1e20] Merge tag 
'irq-urgent-2025-04-10' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 0c7cae12f67c4c5fd232cffb27023deb409e1e20
# bad: [34833819d2270ef96fa98fe3c1d3d297b5dec986] Merge tag 
'timers-urgent-2025-04-10' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 34833819d2270ef96fa98fe3c1d3d297b5dec986
# good: [92e250c624ea37fde64bfd624fd2556f0d846f18] timekeeping: Add a 
lockdep override in tick_freeze()
git bisect good 92e250c624ea37fde64bfd624fd2556f0d846f18
# bad: [acea9943271b62905033f2f8ca571cdd52d6ea7b] vdso: Address variable 
shadowing in macros
git bisect bad acea9943271b62905033f2f8ca571cdd52d6ea7b
# first bad commit: [acea9943271b62905033f2f8ca571cdd52d6ea7b] vdso: 
Address variable shadowing in macros


Regards,

Venkat.

>
> Also there is a patchset here:
> https://lore.kernel.org/linux-perf-users/FE96FD04-4396-4C34-A70D-2A592FD5F916@linux.ibm.com/T/#m3e9d6aac4c34ebf42f18f3c213b7dff8f8c70d9d
>
> Which I think you have already tested..
>
> Thanks
> Athira
>>
>> Regards,
>>
>> Venkat.
>>
>>
>>
