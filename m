Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023C27A900
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383234; cv=none; b=O9f5nAAa/olYj+PZ6ZlfiEfbt7OGv/nnMHj05X4gTEk42xJWynsUSeTUTMLyuB13NTGC/BUt6b5LHKN+cVI5YdA02sK0JzBVyI///rgb2kKk5/9z7usVohzwLeW17En3fB1JTy5YBo853QT+/0Jvhy4vAZhuBmhXX/Q5DYtdWR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383234; c=relaxed/simple;
	bh=YHKFuGE35A4Aa0dREmXAp8IwwFwiIVWsYuMOqi4QHaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dkYNjHaR8cZx5TtzBvo2JsWfOz42ep+Mwjgbi27P6SzDBHuUgHA+KnjMMGJt02xyt1ADkYUQzk4MSepNSowITaskSrix/HFX8dOcWaVwvGtfH04mv4T89fCN6zyGpEx81nGCTcBvU9iduWr7dyDRsYVJkzQ0tKgyRrAVzyf+/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=crxqb/+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="crxqb/+U"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qJ0J028627;
	Tue, 1 Jul 2025 15:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5VjOrehgu67gGQhS/OJrOelLzd1u65qTrNycDObBlgU=; b=crxqb/+UGn4UAyWL
	uHCpSS2MrrFfshzDF8QKlom4W0WYDjIVTi8SNaATW8Bv6PfU+htr4HACE2wNNpvj
	N/94UCq+kDFSvhYBpL6j0h6cKCsSUPRxLepI42kv5o1exjkVVtZNYk1aevYqT033
	O2voVPpn3RwnS0aWvh7nh+rybHXX2KHdD87JvYE27Fa9+eezq2CIGMRqgtHM/akr
	Ku1WxqYzw3ovLuHuEHGge+k7kJ0VydQdmOmNlqWIpTCB/aKjgwwvbLsanD5eA85t
	MyYQHViqsB3ekeH1mbM8bntr0LdfROrx/4i8af6cuX6az0jrPXdafKL9uMxB3FY2
	8lxCLw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvsbkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 15:20:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561FKQqR017226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 15:20:26 GMT
Received: from [10.110.56.217] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Jul
 2025 08:20:24 -0700
Message-ID: <cba8a539-b6f9-428a-be6a-52169ab0de56@quicinc.com>
Date: Tue, 1 Jul 2025 20:49:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tracing/perf: disable preemption in perf_trace calls
To: Steven Rostedt <rostedt@goodmis.org>
CC: Ingo Molnar <mingo@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20250630-fix-perf-trace-null-access-v1-1-8c15bf5f402c@quicinc.com>
 <20250630143230.25b7a38a@batman.local.home>
Content-Language: en-US
From: Aditya Chillara <quic_achillar@quicinc.com>
In-Reply-To: <20250630143230.25b7a38a@batman.local.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bHvnHshZeI8gojKFnITDLSmxz6TSSH4h
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863fcba cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=-RQ7FLaKujfTUwwmNdEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bHvnHshZeI8gojKFnITDLSmxz6TSSH4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMiBTYWx0ZWRfX2M+PgjHs9NWf
 uOVApBrAWLqOtwVQHQ42sUNykLhQsDFLVj1xRxAV6GZsiaZ1MOiLExImLEkKo3KTy/zTsiymimQ
 V32DAqVnWOgDB1PLS6b5ygqGjyImNTPodO0JZ8RNFTe3FuGNtbuJVFU8xjfeyODYf1CANx27zS5
 HvYDvo/eWM6FHOrgqkHAIAF+Mf0QIZMd0V9uwS71f++1WCNOu9jmzs6p7P7sBabIOAah6OapYEA
 WaMeHhsPYNxVbZlkP8ajQOlPIC/NKV6N3VT9/rdi3fTP7KEykjbb0fbZeFVrNv9FTgttF0y66Tc
 Ru/S9dcb58j9MtOoO/wUR+EaQbbHPoHorBUUYErQyEAfKiTNbVUTVA+Ixj3QR7CHwo1Z1dBkk+D
 XTFA8CEDMl0cslE/EZ2TA1tvKqCdiWz0oRis4xsvgERa7BbFDw8OUlj74L0M6qxg9zkOLA/F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010102

On 7/1/2025 12:02 AM, Steven Rostedt wrote:
> On Mon, 30 Jun 2025 22:35:28 +0530
> Aditya Chillara <quic_achillar@quicinc.com> wrote:
> 
>> It is possible that perf_trace_sched_switch call is rescheduled causing
>> NULL access in perf_trace_buf_alloc because of perf_trace_event_unreg
>> called in between, leading to data abort:
>>
>> [  363.202351][    T0] Unable to handle kernel paging request at virtual address ffffffba56d0a03c
>> [  363.202355][    T0] Mem abort info:
>> [  363.202355][    T0]   ESR = 0x0000000096000045
>> [  363.202357][    T0]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [  363.202359][    T0]   SET = 0, FnV = 0
>> [  363.202360][    T0]   EA = 0, S1PTW = 0
>> [  363.202361][    T0]   FSC = 0x05: level 1 translation fault
>> [  363.202363][    T0] Data abort info:
>> [  363.202364][    T0]   ISV = 0, ISS = 0x00000045, ISS2 = 0x00000000
>> [  363.202365][    T0]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>> [  363.202367][    T0]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [  363.202369][    T0] swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000c9795000
>> [  363.202371][    T0] [ffffffba56d0a03c] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
>> [  363.202377][    T0] Internal error: Oops: 0000000096000045 [#1] PREEMPT SMP
>> [  363.202383][    T0] Dumping ftrace buffer:
>> [  363.202385][    T0]    (ftrace buffer empty)
>> .
>> .
>> [  363.203036][    T0] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Tainted: G W  O \
>> 	6.12.23-android16-5-maybe-dirty-4k #1 6d534d25cf9b12caecb741d5004c181a6a432b53
>> [  363.203042][    T0] Tainted: [W]=WARN, [O]=OOT_MODULE
>> [  363.203045][    T0] pstate: 834000c5 (Nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>> [  363.203048][    T0] pc : perf_trace_buf_alloc+0x90/0xe0
>> [  363.203057][    T0] lr : perf_trace_buf_alloc+0x40/0xe0
>> [  363.203060][    T0] sp : ffffffc08016bc90
>> [  363.203062][    T0] x29: ffffffc08016bc90 x28: 0000000000000000 x27: ffffff88083d0000
>> [  363.203066][    T0] x26: ffffffba56d0a000 x25: 00000044684e8bd8 x24: 1198f2d01457f4e4
>> [  363.203070][    T0] x23: 0000000000000000 x22: ffffff88083d0000 x21: ffffffc08016bccc
>> [  363.203073][    T0] x20: ffffffc08016bcd0 x19: 0000000000000044 x18: ffffffd01580bec0
>> [  363.203077][    T0] x17: 00000000d2dc9ceb x16: 00000000d2dc9ceb x15: 0000000000000010
>> [  363.203080][    T0] x14: 0000000000000100 x13: 0000000000000100 x12: 0000000000000100
>> [  363.203083][    T0] x11: 0000000000ff0100 x10: 0000000000000001 x9 : ffffffba56d0a000
>> [  363.203087][    T0] x8 : ffffffba56d0a044 x7 : 0000000000000001 x6 : 000000548fd2bf93
>> [  363.203090][    T0] x5 : 00000054908be990 x4 : 0000000000000000 x3 : ffffff8808329640
>> [  363.203094][    T0] x2 : ffffffc08016bccc x1 : ffffffc08016bcd0 x0 : ffffffba56d0a000
>> [  363.203097][    T0] Call trace:
>> [  363.203098][    T0]  perf_trace_buf_alloc+0x90/0xe0
>> [  363.203102][    T0]  perf_trace_sched_switch+0x74/0x190
>> [  363.203107][    T0]  __schedule+0xbb0/0xeac
>> [  363.203112][    T0]  schedule_idle+0x24/0x48
>> [  363.203114][    T0]  do_idle+0x214/0x25c
>> [  363.203117][    T0]  cpu_startup_entry+0x34/0x3c
>> [  363.203119][    T0]  secondary_start_kernel+0x130/0x150
>> [  363.203124][    T0]  __secondary_switched+0xc0/0xc4
>> [  363.203129][    T0] Code: f8605908 d538d089 8b080120 8b33c008 (f81f811f)
>> [  363.203131][    T0] ---[ end trace 0000000000000000 ]---
>> [  363.203133][    T0] Kernel panic - not syncing: Oops: Fatal exception
>> [  363.203135][    T0] SMP: stopping secondary CPUs
>> [  363.203276][    T0]
>> [  363.203276][    T0] Total active clients count: 0
>> [  363.203280][    T0] Dumping ftrace buffer:
>> [  363.203281][    T0]    (ftrace buffer empty)
>>
>> Fix the issue by disabling preemption in perf_trace calls.
> 
> Does it really fix the issue?
No, wanted to confirm that perf_trace_##call() should not get
scheduled out.

The following is also present in the logs:
[<ffffffd4cde44348>] do_mem_abort+0x54
[<ffffffd4cef79b5c>] el1_abort+0x3c
[<ffffffd4cef79ad4>] el1h_64_sync_handler[jt]+0xb4
[<ffffffd4cde11298>] ret_to_kernel[jt]+0x0
[<ffffffd4ce05a19c>] perf_trace_buf_alloc+0x90
[<ffffffd4cdf137fc>] perf_trace_sched_process_template+0x64
[<ffffffd4cdf115f4>] __traceiter_sched_process_free+0x48
[<ffffffd4cded7eb8>] delayed_put_task_struct+0x94
[<ffffffd4cdfb1564>] rcu_do_batch+0x1f0
[<ffffffd4cdfb3ec8>] rcu_nocb_cb_kthread+0x250
[<ffffffd4cdf08420>] kthread+0x11c
[<ffffffd4cde1f174>] ret_from_fork+0x10
> 
> 1. perf_trace_##call() gets called either by DECLARE_EVENT_CLASS or by
>    DECLARE_EVENT_SYSCALL_CLASS. The latter already disables preemption
>    but the former does not because it is called by the tracepoint logic
>    that has:
> 
> #define __DECLARE_TRACE(name, proto, args, cond, data_proto)		\
> 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
> 	static inline void __do_trace_##name(proto)			\
> 	{								\
> 		if (cond) {						\
> 			guard(preempt_notrace)();			\
> 			__DO_TRACE_CALL(name, TP_ARGS(args));		\
> 		}							\
> 	}
> 
>    Where preemption should already be disabled.
DECLARE_EVENT_SYSCALL_CLASS in not present in our tree.
> 
> 2. trace_sched_switch() is called with interrupts disabled. So there
>    should be no scheduling out in this trace event. So how did it get
>    scheduled out in that trace event?
Thank you for confirming that trace_sched_switch() should not be
scheduled out.
> 
> I think there's something else going on.
I will try my luck with CONFIG_DEBUG_PREEMPT to check for any
preemption underflows. Any other idea what could be going on?
> 
> -- Steve
> 
> 
>>
>> Signed-off-by: Aditya Chillara <quic_achillar@quicinc.com>
>> ---
>> Change-Id: I787347a7db4554cfd2cb74e0fc985699f1824c92
>> ---
>>  include/trace/perf.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/trace/perf.h b/include/trace/perf.h
>> index 5800d13146c3d0cdf4eb474a3bb895dd71753de4..76994a5d8c55f4ca071070ff551a53a84fb1d95c 100644
>> --- a/include/trace/perf.h
>> +++ b/include/trace/perf.h
>> @@ -66,6 +66,8 @@ perf_trace_##call(void *__data, proto)					\
>>  	int __data_size;						\
>>  	int rctx;							\
>>  									\
>> +	guard(preempt_notrace)();		\
>> +									\
>>  	__data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
>>  									\
>>  	head = this_cpu_ptr(event_call->perf_events);			\
>>
>> ---
>> base-commit: 70575e77839f4c5337ce2653b39b86bb365a870e
>> change-id: 20250630-fix-perf-trace-null-access-9661f910df72
>>
>> Best regards,
> 
