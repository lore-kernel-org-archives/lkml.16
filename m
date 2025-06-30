Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9A13774D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308364; cv=none; b=RXOxp12BcgIgt3W8yFfYqTkdOYAX9pvCW5LsMKE4duJbSrzUjOtaRxLgTvsU5Ez5oLtPaL+YQpqQro4lugu2HpgGuxfOadeHrOeYg8dCZQapJ1dLojwNkD1oz0U5dr6MJUyRROzzXRu2h/4o6rgXpIpjWXcyHifA1rDLkh/MmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308364; c=relaxed/simple;
	bh=DquO3I52o4ZGK9vxx+BPJ0SMRh7M6VP6Y1Vk49/4kH4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ga/3ptfa67xIfHSNT7cW0J1k5YE4CvZX2oANN9pi1Nt6YxOCgRSVfgJWWDhqFbPAjzOej1++7H0HvIwVmKWiVeFT4aiml/FOpbtTRIBr7H5VXwRPLyx4qLtDjzGOIP0SgGCbYpB+5G2J2LEk7+tqY96jJusBlqhKiopD4UXd9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id B9A91C0669;
	Mon, 30 Jun 2025 18:32:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 3403820027;
	Mon, 30 Jun 2025 18:32:32 +0000 (UTC)
Date: Mon, 30 Jun 2025 14:32:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Aditya Chillara <quic_achillar@quicinc.com>
Cc: Ingo Molnar <mingo@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tracing/perf: disable preemption in perf_trace calls
Message-ID: <20250630143230.25b7a38a@batman.local.home>
In-Reply-To: <20250630-fix-perf-trace-null-access-v1-1-8c15bf5f402c@quicinc.com>
References: <20250630-fix-perf-trace-null-access-v1-1-8c15bf5f402c@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 85m4j1id8zbpxy45czp18s4f6tb14q4a
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 3403820027
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19DI+eMfkrn4a7yUPJ2RTEh2B3taTEskas=
X-HE-Tag: 1751308352-397520
X-HE-Meta: U2FsdGVkX1/rmdZyM2VpbUIGKPsglJX6IQuelCi2linc2SrxfT+IeX1TsbltXylpwyi4Ox9othk3X6GMAdvV2whjRlpUXCFDwveI7U3ppYSEnGFJzmg+EDqFO3l87SsxTREfTOBsUBlZqrWQoaUVMS0B2YEMKRQZw7paEdwiCQ58Cl6/urOKjQu5tbvvUI49qNCmhnaAtMOX7KJLkU6WlzwagL50qiNdi2S2SJlM69pbpFvV/51OwhiGegTyq/sQW3AhF4NhAjmgDqFxAaFLTwbr5XOaOB7Ab86WBPNTI+MA/depV5A37GFgr3gkIpPjtNtUgpdaVJ3DJe+ZzKfVgKJjXkspWc9u8PgCBoWscDgNvCeL9ghf/9eJ9qwK8ZW7

On Mon, 30 Jun 2025 22:35:28 +0530
Aditya Chillara <quic_achillar@quicinc.com> wrote:

> It is possible that perf_trace_sched_switch call is rescheduled causing
> NULL access in perf_trace_buf_alloc because of perf_trace_event_unreg
> called in between, leading to data abort:
> 
> [  363.202351][    T0] Unable to handle kernel paging request at virtual address ffffffba56d0a03c
> [  363.202355][    T0] Mem abort info:
> [  363.202355][    T0]   ESR = 0x0000000096000045
> [  363.202357][    T0]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  363.202359][    T0]   SET = 0, FnV = 0
> [  363.202360][    T0]   EA = 0, S1PTW = 0
> [  363.202361][    T0]   FSC = 0x05: level 1 translation fault
> [  363.202363][    T0] Data abort info:
> [  363.202364][    T0]   ISV = 0, ISS = 0x00000045, ISS2 = 0x00000000
> [  363.202365][    T0]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
> [  363.202367][    T0]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  363.202369][    T0] swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000c9795000
> [  363.202371][    T0] [ffffffba56d0a03c] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [  363.202377][    T0] Internal error: Oops: 0000000096000045 [#1] PREEMPT SMP
> [  363.202383][    T0] Dumping ftrace buffer:
> [  363.202385][    T0]    (ftrace buffer empty)
> .
> .
> [  363.203036][    T0] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Tainted: G W  O \
> 	6.12.23-android16-5-maybe-dirty-4k #1 6d534d25cf9b12caecb741d5004c181a6a432b53
> [  363.203042][    T0] Tainted: [W]=WARN, [O]=OOT_MODULE
> [  363.203045][    T0] pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> [  363.203048][    T0] pc : perf_trace_buf_alloc+0x90/0xe0
> [  363.203057][    T0] lr : perf_trace_buf_alloc+0x40/0xe0
> [  363.203060][    T0] sp : ffffffc08016bc90
> [  363.203062][    T0] x29: ffffffc08016bc90 x28: 0000000000000000 x27: ffffff88083d0000
> [  363.203066][    T0] x26: ffffffba56d0a000 x25: 00000044684e8bd8 x24: 1198f2d01457f4e4
> [  363.203070][    T0] x23: 0000000000000000 x22: ffffff88083d0000 x21: ffffffc08016bccc
> [  363.203073][    T0] x20: ffffffc08016bcd0 x19: 0000000000000044 x18: ffffffd01580bec0
> [  363.203077][    T0] x17: 00000000d2dc9ceb x16: 00000000d2dc9ceb x15: 0000000000000010
> [  363.203080][    T0] x14: 0000000000000100 x13: 0000000000000100 x12: 0000000000000100
> [  363.203083][    T0] x11: 0000000000ff0100 x10: 0000000000000001 x9 : ffffffba56d0a000
> [  363.203087][    T0] x8 : ffffffba56d0a044 x7 : 0000000000000001 x6 : 000000548fd2bf93
> [  363.203090][    T0] x5 : 00000054908be990 x4 : 0000000000000000 x3 : ffffff8808329640
> [  363.203094][    T0] x2 : ffffffc08016bccc x1 : ffffffc08016bcd0 x0 : ffffffba56d0a000
> [  363.203097][    T0] Call trace:
> [  363.203098][    T0]  perf_trace_buf_alloc+0x90/0xe0
> [  363.203102][    T0]  perf_trace_sched_switch+0x74/0x190
> [  363.203107][    T0]  __schedule+0xbb0/0xeac
> [  363.203112][    T0]  schedule_idle+0x24/0x48
> [  363.203114][    T0]  do_idle+0x214/0x25c
> [  363.203117][    T0]  cpu_startup_entry+0x34/0x3c
> [  363.203119][    T0]  secondary_start_kernel+0x130/0x150
> [  363.203124][    T0]  __secondary_switched+0xc0/0xc4
> [  363.203129][    T0] Code: f8605908 d538d089 8b080120 8b33c008 (f81f811f)
> [  363.203131][    T0] ---[ end trace 0000000000000000 ]---
> [  363.203133][    T0] Kernel panic - not syncing: Oops: Fatal exception
> [  363.203135][    T0] SMP: stopping secondary CPUs
> [  363.203276][    T0]
> [  363.203276][    T0] Total active clients count: 0
> [  363.203280][    T0] Dumping ftrace buffer:
> [  363.203281][    T0]    (ftrace buffer empty)
> 
> Fix the issue by disabling preemption in perf_trace calls.

Does it really fix the issue?

1. perf_trace_##call() gets called either by DECLARE_EVENT_CLASS or by
   DECLARE_EVENT_SYSCALL_CLASS. The latter already disables preemption
   but the former does not because it is called by the tracepoint logic
   that has:

#define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
	static inline void __do_trace_##name(proto)			\
	{								\
		if (cond) {						\
			guard(preempt_notrace)();			\
			__DO_TRACE_CALL(name, TP_ARGS(args));		\
		}							\
	}

   Where preemption should already be disabled.

2. trace_sched_switch() is called with interrupts disabled. So there
   should be no scheduling out in this trace event. So how did it get
   scheduled out in that trace event?

I think there's something else going on.

-- Steve


> 
> Signed-off-by: Aditya Chillara <quic_achillar@quicinc.com>
> ---
> Change-Id: I787347a7db4554cfd2cb74e0fc985699f1824c92
> ---
>  include/trace/perf.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/trace/perf.h b/include/trace/perf.h
> index 5800d13146c3d0cdf4eb474a3bb895dd71753de4..76994a5d8c55f4ca071070ff551a53a84fb1d95c 100644
> --- a/include/trace/perf.h
> +++ b/include/trace/perf.h
> @@ -66,6 +66,8 @@ perf_trace_##call(void *__data, proto)					\
>  	int __data_size;						\
>  	int rctx;							\
>  									\
> +	guard(preempt_notrace)();		\
> +									\
>  	__data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
>  									\
>  	head = this_cpu_ptr(event_call->perf_events);			\
> 
> ---
> base-commit: 70575e77839f4c5337ce2653b39b86bb365a870e
> change-id: 20250630-fix-perf-trace-null-access-9661f910df72
> 
> Best regards,

