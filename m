Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFA25A350
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220347; cv=none; b=rnAQort6J6yLF7mZlKgw/pgZAmmFm5DTcnkec6A5AJh4PwAczT/G1e9EXhpwqLNtwqLC3taUgcDkKPt0MhWtTa1vou4K32kdNo00u0ujciizGhaqjuFydn1XI040bIxwKaTwHP9SFnfr+WA4fa7X44xqlHk4QeydrJyMpJpX9pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220347; c=relaxed/simple;
	bh=FZmui5N70R9j6A2haZ4i9o42S03szwkNyO8aN6nVt2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVnP5nbsmIAaQXJFVhOpAPGinQCpaWt1ZpPB49dSFonj8v/wgNTrIk0UikLmN/wacRhrFwJ0fjD3hJFMWPMpaQMz/RkKN9s4/yQA2OxLUKzbHJEsiyMABH4aj9YoBWI19MQ70FQCvSvQcBAF7NI4ppL3Iog+/01nzjHI790MiG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=moAU+5gj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="moAU+5gj"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E6ZJws017233;
	Wed, 14 May 2025 10:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Vyk5bD
	FJOkFJMuPkk2R5cMc9uiZrtyj7xClCWija3Qk=; b=moAU+5gjeJiGP/5/3LGSOA
	RBkr6SoLKYJ9LeM1oWRPfWltF8kceHfDktB8+ix3YUQu967V50LJUZHsffjFANtE
	VAf5gEBmmg6IN3eheUHPKrO2lKSN0PMrRQ9ie80v75xw/+C5y/z7OIr5jfZo99tZ
	wgVQiK5WbpBtWmI+egPn4V0p19V3CjzWtKjLkLrfZL/nHdeGWvZ5WxJbD5TKPz30
	fGTksPEySmzSF5beNnCqeEW43oqeYASHTiH2fpQsNQmGHapquAUt1+D8Ji5it18D
	o2tCjcKlezfQRhVLzEQpMlP5E+cUe+4kErA4MvMaCHa4wUD6nlq+/pzaGFClTMxg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbq8krpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:58:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E9nxcA026947;
	Wed, 14 May 2025 10:58:49 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpbrp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:58:49 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54EAwn5a4063894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 10:58:49 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2C5E58053;
	Wed, 14 May 2025 10:58:48 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE91358043;
	Wed, 14 May 2025 10:58:45 +0000 (GMT)
Received: from [9.204.206.228] (unknown [9.204.206.228])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 10:58:45 +0000 (GMT)
Message-ID: <ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
Date: Wed, 14 May 2025 16:28:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        linux-kernel@vger.kernel.org,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-2-prakash.sangappa@oracle.com>
Content-Language: en-US
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
In-Reply-To: <20250513214554.4160454-2-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kI32AY6MMjuBT4ENeFB8JOdDuqOBToZe
X-Authority-Analysis: v=2.4 cv=GrRC+l1C c=1 sm=1 tr=0 ts=6824776a cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=a7wRBuKbf9VA6CU1hboA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA5MyBTYWx0ZWRfXwhBNirkdH9bz nwwFrRay8r8vSpUGA6RGfNB7F9kJTjV6B6OJCJeskGDhryjWAARPJSHrNwoXZWBoNe046MbLPtt hLCDrnXkZ4unXvw/QM9qZg65UdyEVogoNfjWbOjjyZaE8DHszmpcqAW9JnjuWtU1ilz3q5pBUQ2
 /2rptuCM7BECfp+t2N5D4QNWkthFUYRMVlmDtqSh8sgAMwbaTCy67H3XzRFqWFnP3gfLZqlk/NA IzRzaJle5douUTg2ZEE0c6Ced3L1hWMo+NI7uysi153V11SBMoEIiEmbWm7fiRv0hmmUVfXbvn7 cbCntEseev8grRrwMw4wOfi+nFdlJD+P3IgSNQaZptnoNay04dw6g4A16rGW5bHero8d4C8xY2i
 pX6ngYHB905uKg6ZuECQQhQsXME3TjaN8G/07aZ5Z1foAkDxl4zv8BLLnWNBLFY7xZwjchBE
X-Proofpoint-GUID: kI32AY6MMjuBT4ENeFB8JOdDuqOBToZe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_03,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140093

Hi Prakash,

On 14/05/25 03:15, Prakash Sangappa wrote:
> Add support for a thread to request extending its execution time slice on
> the cpu. The extra cpu time granted would help in allowing the thread to
> complete executing the critical section and drop any locks without getting
> preempted. The thread would request this cpu time extension, by setting a
> bit in the restartable sequences(rseq) structure registered with the kernel.
> 
> Kernel will grant a 30us extension on the cpu, when it sees the bit set.
> With the help of a timer, kernel force preempts the thread if it is still
> running on the cpu when the 30us timer expires. The thread should yield
> the cpu by making a system call after completing the critical section.
> 
> Suggested-by: Peter Ziljstra <peterz@infradead.org>
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
>  include/linux/entry-common.h | 11 +++++--
>  include/linux/sched.h        | 16 +++++++++++
>  include/uapi/linux/rseq.h    |  7 +++++
>  kernel/entry/common.c        | 19 ++++++++----
>  kernel/rseq.c                | 56 ++++++++++++++++++++++++++++++++++++
>  kernel/sched/core.c          | 14 +++++++++
>  kernel/sched/syscalls.c      |  5 ++++
>  7 files changed, 120 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index fc61d0205c97..cec343f95210 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -303,7 +303,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs);
>   * exit_to_user_mode_loop - do any pending work before leaving to user space
>   */
>  unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
> -				     unsigned long ti_work);
> +				     unsigned long ti_work,
> +				     bool irq);
>  
>  /**
>   * exit_to_user_mode_prepare - call exit_to_user_mode_loop() if required
> @@ -315,7 +316,8 @@ unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
>   *    EXIT_TO_USER_MODE_WORK are set
>   * 4) check that interrupts are still disabled
>   */
> -static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
> +static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs,
> +						bool irq)
>  {
>  	unsigned long ti_work;
>  
> @@ -326,7 +328,10 @@ static __always_inline void exit_to_user_mode_prepare(struct pt_regs *regs)
>  
>  	ti_work = read_thread_flags();
>  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
> -		ti_work = exit_to_user_mode_loop(regs, ti_work);
> +		ti_work = exit_to_user_mode_loop(regs, ti_work, irq);
> +
> +	if (irq)
> +		rseq_delay_resched_fini();
>  
>  	arch_exit_to_user_mode_prepare(regs, ti_work);
>  
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c08fd199be4e..14bf0508bfca 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -339,6 +339,7 @@ extern int __must_check io_schedule_prepare(void);
>  extern void io_schedule_finish(int token);
>  extern long io_schedule_timeout(long timeout);
>  extern void io_schedule(void);
> +extern void hrtick_local_start(u64 delay);
>  
>  /* wrapper function to trace from this header file */
>  DECLARE_TRACEPOINT(sched_set_state_tp);
> @@ -1044,6 +1045,7 @@ struct task_struct {
>  	/* delay due to memory thrashing */
>  	unsigned                        in_thrashing:1;
>  #endif
> +	unsigned			sched_time_delay:1;

Can this be placed in #ifdef CONFIG_RSEQ?

>  #ifdef CONFIG_PREEMPT_RT
>  	struct netdev_xmit		net_xmit;
>  #endif

[..snip..]

> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index cd38f4e9899d..1b2b64fe0fb1 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -1378,6 +1378,11 @@ static void do_sched_yield(void)
>   */
>  SYSCALL_DEFINE0(sched_yield)
>  {
> +	if (IS_ENABLED(CONFIG_RSEQ) && current->sched_time_delay) {
> +		schedule();
> +		return 0;
> +	}
> +
>  	do_sched_yield();
>  	return 0;
>  }

As mentioned in previous versions, does this not change the semantics for
sched_yield()? Why is this necessary to immediately call schedule() and skip
going through do_sched_yield()?

For a task if a delay is granted on CPU A, but the task migrates to CPU B before
the IRQ-return hook, the timer never fires and the thread might overrun its bonus?
Any thoughts on this?

Thanks,
Madadi Vineeth Reddy
