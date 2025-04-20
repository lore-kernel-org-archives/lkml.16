Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2915D1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 03:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745120354; cv=none; b=PgCVobImyd/41XNCA73RKQC3sVHcGVWwN6nL+rMj6JuBzf4BLryfZgMH5odfGNmEc9WV/A0DUao2TbnrljHHUr1JhGeTnV79f5RS0HMf+3AcvxlqdAFsUcDFdkgOi80CKUCSK7Xb11uoE9QshLj3ocNtlYy3jmrQ75FOkJbZMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745120354; c=relaxed/simple;
	bh=keDdGVbH7Wl1A4kHPgs+w8OnLrgpE4m++kf/2b4/C+o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ceDGLzloaZGAtTImnaOy0IH9Ld6ZfQMNqOG6LbPtuydA4WoqVHSsxQWgLHv6kjNtk2HQ6FIagjAdCclHvqERroYgVwXwQ3r6HuBlYkp302u+EAg8tKwdEk/SnXKYcPB7NA3PnrpxYLNxwIo1q/URJY2l+oReGgxb8ewngOYhTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WrQaJpDa; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WrQaJpDa"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K1TgN5001489;
	Sun, 20 Apr 2025 03:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=OdlyrnsxWWj84F1ODfjW5z8fuNDIoCt3uSloN2QG5iM=; b=WrQaJpDahCfz
	gUdj6DqTh7gMVrNxwYG5HE4nJqCM/wpAK1eXTI4wyjA5k4aCfVDSenfDOkRwzjU/
	yni4eVq4085/I+YNJutkrOtFcd/33Z+HeAbyEpYqJbKRP2PmnqRKDIZcjSYHBRhi
	8Ne6Hv+CrLziknIyNMaI5i3ERECAzyHwjaKlM8fHImuINJoXlKlVDbyj2dxVtLw9
	aaXefrh/lAnSIF8Y0G0i+aD1oTGUdwTRWC/XAmiowMk2EJ1hTVLOKKpNGJw8o8G0
	9/kcy2a0mI6vNyxD58Zie+SF2gQVmzAyVbNN9vK3FziL/nu/pEFEPqwmsE+bE9Op
	HvmIBlJ52Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv0rvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 03:38:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53K3cV6o006317;
	Sun, 20 Apr 2025 03:38:31 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464kyv0rvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 03:38:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53K0BM3U012493;
	Sun, 20 Apr 2025 03:38:30 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5srkfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 03:38:30 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53K3cT5v29164238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Apr 2025 03:38:29 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7582D58052;
	Sun, 20 Apr 2025 03:38:29 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E19F558056;
	Sun, 20 Apr 2025 03:38:24 +0000 (GMT)
Received: from [9.43.83.33] (unknown [9.43.83.33])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 20 Apr 2025 03:38:24 +0000 (GMT)
Message-ID: <1d0a5987-1aa9-450e-a37e-97bbefeaa649@linux.ibm.com>
Date: Sun, 20 Apr 2025 09:08:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: Re: [RFC PATCH 0/2] sched/fair: Reorder scheduling related structs to
 reduce cache misses
To: ZECHENG LI <zecheng@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Xu Liu <xliuprof@google.com>, Blake Jones <blakejones@google.com>,
        Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250402212904.8866-1-zecheng@google.com>
 <dad0822a-5e0b-4518-a246-a3820787ed87@linux.ibm.com>
 <CAJUgMyLDwyK-WgNFOr7bGmXPG9eAEnG7mNtjfPSTeJnJT8bAVg@mail.gmail.com>
Content-Language: en-US
Reply-To: CAJUgMyLDwyK-WgNFOr7bGmXPG9eAEnG7mNtjfPSTeJnJT8bAVg@mail.gmail.com
In-Reply-To: <CAJUgMyLDwyK-WgNFOr7bGmXPG9eAEnG7mNtjfPSTeJnJT8bAVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J2moqHfekDspChsNaQGJ2SItrK1zGyjx
X-Proofpoint-ORIG-GUID: lJlAaA3hOKMQS59fkPGnXc-5OdCpap_U
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=68046c38 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=p4LLdNialmM4HVgT2nUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=322 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200027

On 19/04/25 02:28, ZECHENG LI wrote:
> Hi Madadi Vineeth Reddy,
> 
>> This patch is based on optimizations by reordering for 64 byte systems.
>> In case of 128 byte L1 D-cache systems like Power10, this might or might
>> not be beneficial. Moreover lot of space(almost half) would be wasted
>> on the cache line due to APIs like `__cacheline_group_begin_aligned`
>> and `__cacheline_group_end_aligned` that may restrict size to 64 bytes.
>>
>> Since this is in generic code, any ideas on how to make sure that
>> other architectures with different cache size don't suffer?
> 
> We propose to conditionally align to the cacheline boundary only when
> the cacheline size is 64 bytes, since this is the most common size.
> 
> For architectures with 128-byte cachelines (like PowerPC), this
> approach will still collocate the hot fields, providing some
> performance benefit from improved locality, but it will not enforce
> alignment to the larger 128-byte boundary. This avoids wasting cache

I don't see the check to enforce the alignment only for 64 bytes. IIUC,
the macros seem to apply the alignment unconditionally based on arch
specific cacheline size. I might be missing something, could you
clarify this?

> space on those architectures due to padding introduced by the
> alignment, while still gaining benefits from collocating frequently
> accessed fields.
> 
>> Due to the reordering of the fields, there might be some workloads
>> that could take a hit. May be try running workloads of different
>> kinds(latency and throughput oriented) and make sure that regression
>> is not high.
> 
> For workloads running without a cgroup hierarchy, we expect a small
> performance impact. This is because there is only one cfs_rq per CPU
> in this scenario, which is likely in cache due to frequent access.
> 
> For workloads with the cgroup hierarchy, I have tested sysbench threads
> and hackbench --thread, there are no obvious regression.
> 
> Heavy load on 1024 instances of sysbench:
> Latency (ms), after-patch, origial
> avg avg: 2133.51, 2150.97
> avg min: 21.9629, 20.9413
> avg max: 5955.8, 5966.78
> 
> Avg runtime for 1024 instances of ./hackbench --thread -g 2 -l 1000
> in a cgroup hierarchy:
> After-patch: 34.9458s, Original: 36.8647s
> 
> We plan to include more benchmark results in the v2 patch. Do you have
> suggestions for other benchmarks you would like us to test?

May be some throughput oriented workloads like ebizzy, sysbench and also
some real life workloads would be good to include.

Thanks,
Madadi Vineeth Reddy

> 
> Regards,
> Zecheng

