Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD832857D7
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307534; cv=none; b=bsWrgEzeqHn1sU/q5pAWBw0YRJjuKSs9yLNPlGJzP4XosR58FU8L2ILHpvyhHD0eEbo/esPohkfJfiGBl4LrGlohnukH5azJduDM51YEz6iwXuaHp1gBQ309OPezoofXAXVI/+ToFccHuVZw7YeNZCXFUt9FHMuaKCAzC76EpaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307534; c=relaxed/simple;
	bh=ziQqEtPjtk67juzs1IQRlCg8ansjp8SlUA8/NNfdOO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5G7Wm2y3iJqDUjtE3jSQPyDRD9jeEHB3IhRsznw3a7kBjsJcnlwURsVDlJv7bx40yZFsJbvF9vT3jfuiOExDPP/jXMMq2GXNjipTq5llO1B2GNPsvOQxNFdNJ6xE30dO/hItFI4iO5LGBcZVLMnj6RW5ZuwhqSqOtWXgE2bdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=N7IxGQT5; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="N7IxGQT5"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEbtF0022725;
	Thu, 10 Apr 2025 17:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9ngdSO
	lOdyBUe2/C0R8lRO1k8iIOCkOAJhh26HMJqT0=; b=N7IxGQT5nP6Uq7XYehSCpx
	QQje8He7bb19JlcIK2v0DkJpWk8o2MrfdqjFGsWMAlAmz7ysbdMrbaZd4p6+WmfM
	hiMrxNwhMi6UvtO/QGxE/PeG8FDUzcOZ5X/oy4u0BSbD4crkU/+x15tLF6WVyROK
	ChAKH4+PGo9+E4I2VV4KGnN1nS2Uc0Pd+TXuC/foWw0V9zLlOfjK57KpV4sYtyz5
	EzbDTdH9PjYAZSeIDbLqNjxNN1uUPsSwGFiSLh3NdC9wjWUj+yrEP5mfR26uF9rc
	qTH3MJXjVRBk6sNA7l4/FGAOv9vbw1wkdneUG1WjRADvawqNRB7KcFiEsS8KUkWA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45x02qeaqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 17:51:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53AEqSLw029526;
	Thu, 10 Apr 2025 17:51:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45x1k75365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 17:51:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53AHpqAT50200856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 17:51:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59BF320043;
	Thu, 10 Apr 2025 17:51:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18A5820040;
	Thu, 10 Apr 2025 17:51:50 +0000 (GMT)
Received: from [9.124.208.29] (unknown [9.124.208.29])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Apr 2025 17:51:49 +0000 (GMT)
Message-ID: <c2aa89d7-c3ab-40e2-bd65-443a75b04017@linux.ibm.com>
Date: Thu, 10 Apr 2025 23:21:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/19] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Waiman Long <longman@redhat.com>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FbrNHpsp4zv1GP-XduKnwBO79wV6pf07
X-Proofpoint-ORIG-GUID: FbrNHpsp4zv1GP-XduKnwBO79wV6pf07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=879 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100126



On 4/7/25 21:27, Sebastian Andrzej Siewior wrote:
> this is a follow up on
>          https://lore.kernel.org/ZwVOMgBMxrw7BU9A@jlelli-thinkpadt14gen4.remote.csb
> 
> and adds support for task local futex_hash_bucket.
> 
> This is the local hash map series with PeterZ FUTEX2_NUMA and
> FUTEX2_MPOL plus a few fixes on top.
> 
> The complete tree is at
>          https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=futex_local_v11
>          https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_local_v11
> 
> v10…v11: https://lore.kernel.org/all/20250312151634.2183278-1-bigeasy@linutronix.de
>    - PeterZ' fixups, changes to the local hash series have been folded
>      into the earlier patches so things are not added and renamed later
>      and the functionality is changed.
> 
>    - vmalloc_huge() has been implemented on top of vmalloc_huge_node()
>      and the NOMMU bots have been adjusted. akpm asked for this.
> 
>    - wake_up_var() has been removed from __futex_pivot_hash(). It is
>      enough to wake the userspace waiter after the final put so it can
>      perform the resize itself.
> 
>    - Changed to logic in futex_pivot_pending() so it does not block for
>      the user. It waits for __futex_pivot_hash() which follows the logic
>      in __futex_pivot_hash().
> 
>    - Updated kernel doc for __futex_hash().


I don't see any change in Documentation/*. Is it updated in some
other path?

> 
>    - Patches 17+ are new:
>      - Wire up PR_FUTEX_HASH_SET_SLOTS in "perf bench futex"
>      - Add "immutable" mode to PR_FUTEX_HASH_SET_SLOTS to avoid resizing
>        the local hash any further. This avoids rcuref usage which is
>        noticeable in "perf bench futex hash"
> 
> Peter Zijlstra (8):
>    mm: Add vmalloc_huge_node()
>    futex: Move futex_queue() into futex_wait_setup()
>    futex: Pull futex_hash() out of futex_q_lock()
>    futex: Create hb scopes
>    futex: Create futex_hash() get/put class
>    futex: Create private_hash() get/put class
>    futex: Implement FUTEX2_NUMA
>    futex: Implement FUTEX2_MPOL
> 
> Sebastian Andrzej Siewior (11):
>    rcuref: Provide rcuref_is_dead().
>    futex: Acquire a hash reference in futex_wait_multiple_setup().
>    futex: Decrease the waiter count before the unlock operation.
>    futex: Introduce futex_q_lockptr_lock().
>    futex: Create helper function to initialize a hash slot.
>    futex: Add basic infrastructure for local task local hash.
>    futex: Allow automatic allocation of process wide futex hash.
>    futex: Allow to resize the private local hash.
>    tools headers: Synchronize prctl.h ABI header
>    tools/perf: Allow to select the number of hash buckets.
>    futex: Allow to make the private hash immutable.
> 
>   include/linux/futex.h                  |  36 +-
>   include/linux/mm_types.h               |   7 +-
>   include/linux/mmap_lock.h              |   4 +
>   include/linux/rcuref.h                 |  22 +-
>   include/linux/vmalloc.h                |   9 +-
>   include/uapi/linux/futex.h             |  10 +-
>   include/uapi/linux/prctl.h             |   6 +
>   init/Kconfig                           |  10 +
>   io_uring/futex.c                       |   4 +-
>   kernel/fork.c                          |  24 +
>   kernel/futex/core.c                    | 794 ++++++++++++++++++++++---
>   kernel/futex/futex.h                   |  73 ++-
>   kernel/futex/pi.c                      | 300 +++++-----
>   kernel/futex/requeue.c                 | 480 +++++++--------
>   kernel/futex/waitwake.c                | 201 ++++---
>   kernel/sys.c                           |   4 +
>   mm/nommu.c                             |  18 +-
>   mm/vmalloc.c                           |  11 +-
>   tools/include/uapi/linux/prctl.h       |  44 +-
>   tools/perf/bench/Build                 |   1 +
>   tools/perf/bench/futex-hash.c          |   7 +
>   tools/perf/bench/futex-lock-pi.c       |   5 +
>   tools/perf/bench/futex-requeue.c       |   6 +
>   tools/perf/bench/futex-wake-parallel.c |   9 +-
>   tools/perf/bench/futex-wake.c          |   4 +
>   tools/perf/bench/futex.c               |  60 ++
>   tools/perf/bench/futex.h               |   5 +
>   27 files changed, 1585 insertions(+), 569 deletions(-)
>   create mode 100644 tools/perf/bench/futex.c
> 

