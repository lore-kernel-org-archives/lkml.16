Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374878F39
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745979760; cv=none; b=U9tamp2sBxn6wFdNpEBJQCYyem3QH1Cihlrn31V7MD6FugaMGTGwcOQOP2KIxXUM50FII750/hS93BP0542a+HyPUoJTPNhFO4KUdHMOvq9X/1rwGzJAczgRvDXIlGCs0k1Y4mQP3IMdgUlE4T5y/TVeaD25CGvRYN94AbP1UOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745979760; c=relaxed/simple;
	bh=RRmsN+Jhax2Z4TIBFafa4tT0ZH33R8lWSorGzwLiDrE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f53w2CR0YR7+Xgu6NOY8ek8ivmlpcaONv8nsHSnpJPqs5zObjvPpgW+LjkgjySiCRpna0anNiuoMwjXP8PpZHwiv3QZh3whcvw2+8myFhZlWPcJwpBkdQ5/n8zOj/3EtrHlglXUOO/I6tpPfgYq0VOfxYuEBcXip3V4VvSnS1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FuNczuK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FuNczuK4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLaiJX001229;
	Wed, 30 Apr 2025 02:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+dNA4WT0YksUqtsfniJBr4Yd
	4CV3UaXPulrWB2ZFegk=; b=FuNczuK45v2VE7+jSl4RvQ+Y6yt6dsP6lTMKbdAC
	96q7D/Qnb8IwPj7Gb4nCxrG3UIzaD082mX+RZX1YLEe40Way/cj0xs8o/MEb7nDR
	UlBseIGzDMAmlPG9YIGcyG9bP8GOh50Zvyf3ShR/YqTF+y9Z9L0w/VPiedKDWJI7
	rYLNtY2I6+NC2xJkistSGRYH+K5B6Lc6jnRkDczPWMaGBJcp8ldPCUM19i7gyPu0
	iVrvomU2Tz/NgrO4cPnun/x7s7jvjQfugvsK+WkN2DK/ZqN8FxJpdFdR1LiXszh/
	iJX613c3wXIw/Sjf4AMFsUr3ij7n0k/HtHKU/0/oMgWuGA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u9rh4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 02:21:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U2Lw5G002345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 02:21:58 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 19:21:55 -0700
Date: Wed, 30 Apr 2025 10:21:52 +0800
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Alexander Potapenko <glider@google.com>
CC: <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
        Aleksandr
 Nogikh <nogikh@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Borislav
 Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dmitry
 Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
        Josh Poimboeuf
	<jpoimboe@kernel.org>, Marco Elver <elver@google.com>,
        Peter Zijlstra
	<peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
Message-ID: <aBGJQF8aMfWmz7RI@hu-jiangenj-sha.qualcomm.com>
References: <20250416085446.480069-1-glider@google.com>
 <20250416085446.480069-6-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416085446.480069-6-glider@google.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sRcwMwhFzls9v268hynIGxnUi3FpBTDG
X-Proofpoint-ORIG-GUID: sRcwMwhFzls9v268hynIGxnUi3FpBTDG
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=68118947 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=DSPBSGmzSnmKTek9qQoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAxNSBTYWx0ZWRfX8FsQUMQu4Cdj WZksUnmeu33OnCqdeafWI9Qonr+kiDkrgFvWTF1IliT8gMyQcAuKO+wVhj5V1OuvjQAqEqFkOpt vMS2S0cg+9f95gR5BV+YKwAKRcVZgewobzs3KIBPGsYKy9YtqqCv4J1TBPSbKNkeJ5NiX+x1bFe
 tpedlvGE29hMTGLvPG9MKXGK7qAc2s4gdXJs9Mi2L3tgYBXKbdeGumN4FzK6z8Tq6H0vTvjHk0u BNAsCc3pTaN7wtGhgXF9lr300WAzKwbiOfMLlUX4vh88sUHLXrcsN2R8+3yTusOBdiMpT0Hhg9A zCD1GB0P6ReoEEYARLduu1CgFk5FzV8PqYIacLRXdrx7PgtlQDP91gmKqIbxaqW8kqLV8v4ARps
 7gdvJ/PpFWdmdCZ6QhxLczAJs1yU+D7A+fM5xbSiKh0PfZBXWlq40ZfUe8HvZCLqjnlfsagN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=784 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300015

On Wed, Apr 16, 2025 at 10:54:43AM +0200, Alexander Potapenko wrote:
> ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> in the presence of CONFIG_KCOV_ENABLE_GUARDS.
> 
> The buffer shared with the userspace is divided in two parts, one holding
> a bitmap, and the other one being the trace. The single parameter of
> ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> bitmap.
> 
> Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> pointer to a unique guard variable. Upon the first call of each hook,
> the guard variable is initialized with a unique integer, which is used to
> map those hooks to bits in the bitmap. In the new coverage collection mode,
> the kernel first checks whether the bit corresponding to a particular hook
> is set, and then, if it is not, the PC is written into the trace buffer,
> and the bit is set.
> 
> Note: when CONFIG_KCOV_ENABLE_GUARDS is disabled, ioctl(KCOV_UNIQUE_ENABLE)
> returns -ENOTSUPP, which is consistent with the existing kcov code.
> 
> Also update the documentation.
> 
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  Documentation/dev-tools/kcov.rst |  43 +++++++++++
>  include/linux/kcov-state.h       |   8 ++
>  include/linux/kcov.h             |   2 +
>  include/uapi/linux/kcov.h        |   1 +
>  kernel/kcov.c                    | 129 +++++++++++++++++++++++++++----
>  5 files changed, 170 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd24..271260642d1a6 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -137,6 +137,49 @@ mmaps coverage buffer, and then forks child processes in a loop. The child
>  processes only need to enable coverage (it gets disabled automatically when
>  a thread exits).
>  
> +Unique coverage collection
> +---------------------------
> +
> +Instead of collecting raw PCs, KCOV can deduplicate them on the fly.
> +This mode is enabled by the ``KCOV_UNIQUE_ENABLE`` ioctl (only available if
> +``CONFIG_KCOV_ENABLE_GUARDS`` is on).
> +
> +.. code-block:: c
> +
> +	/* Same includes and defines as above. */
> +	#define KCOV_UNIQUE_ENABLE		_IOW('c', 103, unsigned long)
in kcov.h it was defined was _IOR, but _IOW here,
#define KCOV_UNIQUE_ENABLE             _IOR('c', 103, unsigned long)
> +	#define BITMAP_SIZE			(4<<10)
> +
> +	/* Instead of KCOV_ENABLE, enable unique coverage collection. */
> +	if (ioctl(fd, KCOV_UNIQUE_ENABLE, BITMAP_SIZE))
> +		perror("ioctl"), exit(1);
> +	/* Reset the coverage from the tail of the ioctl() call. */
> +	__atomic_store_n(&cover[BITMAP_SIZE], 0, __ATOMIC_RELAXED);
> +	memset(cover, 0, BITMAP_SIZE * sizeof(unsigned long));
> +
> +	/* Call the target syscall call. */
> +	/* ... */
> +
> +	/* Read the number of collected PCs. */
> +	n = __atomic_load_n(&cover[BITMAP_SIZE], __ATOMIC_RELAXED);
> +	/* Disable the coverage collection. */
> +	if (ioctl(fd, KCOV_DISABLE, 0))
> +		perror("ioctl"), exit(1);
> +
> +Calling ``ioctl(fd, KCOV_UNIQUE_ENABLE, bitmap_size)`` carves out ``bitmap_size``
> +words from those allocated by ``KCOV_INIT_TRACE`` to keep an opaque bitmap that
> +prevents the kernel from storing the same PC twice. The remaining part of the
> +trace is used to collect PCs, like in other modes (this part must contain at
> +least two words, like when collecting non-unique PCs).
> +
> +The mapping between a PC and its position in the bitmap is persistent during the
> +kernel lifetime, so it is possible for the callers to directly use the bitmap
> +contents as a coverage signal (like when fuzzing userspace with AFL).
> +
> +In order to reset the coverage between the runs, the user needs to rewind the
> +trace (by writing 0 into the first word past ``bitmap_size``) and wipe the whole
> +bitmap.
> +
>  Comparison operands collection
>  ------------------------------
>  
> diff --git a/include/linux/kcov-state.h b/include/linux/kcov-state.h
> index 6e576173fd442..26e275fe90684 100644
> --- a/include/linux/kcov-state.h
> +++ b/include/linux/kcov-state.h
> @@ -26,6 +26,14 @@ struct kcov_state {
>  		/* Buffer for coverage collection, shared with the userspace. */
>  		unsigned long *trace;
>  
> +		/* Size of the bitmap (in bits). */
> +		unsigned int bitmap_size;
> +		/*
> +		 * Bitmap for coverage deduplication, shared with the
> +		 * userspace.
> +		 */
> +		unsigned long *bitmap;
> +
>  		/*
>  		 * KCOV sequence number: incremented each time kcov is
>  		 * reenabled, used by kcov_remote_stop(), see the comment there.
> diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> index 7ec2669362fd1..41eebcd3ab335 100644
> --- a/include/linux/kcov.h
> +++ b/include/linux/kcov.h
> @@ -10,6 +10,7 @@ struct task_struct;
>  #ifdef CONFIG_KCOV
>  
>  enum kcov_mode {
> +	KCOV_MODE_INVALID = -1,
>  	/* Coverage collection is not enabled yet. */
>  	KCOV_MODE_DISABLED = 0,
>  	/* KCOV was initialized, but tracing mode hasn't been chosen yet. */
> @@ -23,6 +24,7 @@ enum kcov_mode {
>  	KCOV_MODE_TRACE_CMP = 3,
>  	/* The process owns a KCOV remote reference. */
>  	KCOV_MODE_REMOTE = 4,
> +	KCOV_MODE_TRACE_UNIQUE_PC = 5,
>  };
>  
>  #define KCOV_IN_CTXSW (1 << 30)
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index ed95dba9fa37e..fe1695ddf8a06 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -22,6 +22,7 @@ struct kcov_remote_arg {
>  #define KCOV_ENABLE			_IO('c', 100)
>  #define KCOV_DISABLE			_IO('c', 101)
>  #define KCOV_REMOTE_ENABLE		_IOW('c', 102, struct kcov_remote_arg)
> +#define KCOV_UNIQUE_ENABLE		_IOR('c', 103, unsigned long)
>  
>  enum {
>  	/*
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 7b726fd761c1b..dea25c8a53b52 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -29,6 +29,10 @@
>  
>  #include <asm/setup.h>
>  
> +#ifdef CONFIG_KCOV_ENABLE_GUARDS
> +atomic_t kcov_guard_max_index = ATOMIC_INIT(1);
> +#endif
> +
>  #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
>  
>  /* Number of 64-bit words written per one comparison: */
> @@ -161,8 +165,7 @@ static __always_inline bool in_softirq_really(void)
>  	return in_serving_softirq() && !in_hardirq() && !in_nmi();
>  }
>  
> -static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
> -				    struct task_struct *t)
> +static notrace enum kcov_mode get_kcov_mode(struct task_struct *t)
>  {
>  	unsigned int mode;
>  
> @@ -172,7 +175,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
>  	 * coverage collection section in a softirq.
>  	 */
>  	if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
> -		return false;
> +		return KCOV_MODE_INVALID;
>  	mode = READ_ONCE(t->kcov_state.mode);
>  	/*
>  	 * There is some code that runs in interrupts but for which
> @@ -182,7 +185,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode,
>  	 * kcov_start().
>  	 */
>  	barrier();
> -	return mode == needed_mode;
> +	return mode;
>  }
>  
>  static notrace unsigned long canonicalize_ip(unsigned long ip)
> @@ -201,7 +204,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
>  
>  	if (likely(pos < size)) {
>  		/*
> -		 * Some early interrupt code could bypass check_kcov_mode() check
> +		 * Some early interrupt code could bypass get_kcov_mode() check
>  		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
>  		 * raised between writing pc and updating pos, the pc could be
>  		 * overitten by the recursive __sanitizer_cov_trace_pc().
> @@ -220,7 +223,7 @@ static void sanitizer_cov_write_subsequent(unsigned long *trace, int size,
>  #ifndef CONFIG_KCOV_ENABLE_GUARDS
>  void notrace __sanitizer_cov_trace_pc(void)
>  {
> -	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> +	if (get_kcov_mode(current) != KCOV_MODE_TRACE_PC)
>  		return;
>  
>  	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> @@ -229,14 +232,73 @@ void notrace __sanitizer_cov_trace_pc(void)
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
>  #else
> +
> +DEFINE_PER_CPU(u32, saved_index);
> +/*
> + * Assign an index to a guard variable that does not have one yet.
> + * For an unlikely case of a race with another task executing the same basic
> + * block, we store the unused index in a per-cpu variable.
> + * In an even less likely case the current task may lose a race and get
> + * rescheduled onto a CPU that already has a saved index, discarding that index.
> + * This will result in an unused hole in the bitmap, but such events should have
> + * minor impact on the overall memory consumption.
> + */
> +static __always_inline u32 init_pc_guard(u32 *guard)
> +{
> +	/* If the current CPU has a saved free index, use it. */
> +	u32 index = this_cpu_xchg(saved_index, 0);
> +	u32 old_guard;
> +
> +	if (likely(!index))
> +		/*
> +		 * Allocate a new index. No overflow is possible, because 2**32
> +		 * unique basic blocks will take more space than the max size
> +		 * of the kernel text segment.
> +		 */
> +		index = atomic_inc_return(&kcov_guard_max_index) - 1;
> +
> +	/*
> +	 * Make sure another task is not initializing the same guard
> +	 * concurrently.
> +	 */
> +	old_guard = cmpxchg(guard, 0, index);
> +	if (unlikely(old_guard)) {
> +		/* We lost the race, save the index for future use. */
> +		this_cpu_write(saved_index, index);
> +		return old_guard;
> +	}
> +	return index;
> +}
> +
>  void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
>  {
> -	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> -		return;
> +	u32 pc_index;
> +	enum kcov_mode mode = get_kcov_mode(current);
>  
> -	sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> -				       current->kcov_state.s.trace_size,
> -				       canonicalize_ip(_RET_IP_));
> +	switch (mode) {
> +	case KCOV_MODE_TRACE_UNIQUE_PC:
> +		pc_index = READ_ONCE(*guard);
> +		if (unlikely(!pc_index))
> +			pc_index = init_pc_guard(guard);
> +
> +		/*
> +		 * Use the bitmap for coverage deduplication. We assume both
> +		 * s.bitmap and s.trace are non-NULL.
> +		 */
> +		if (likely(pc_index < current->kcov_state.s.bitmap_size))
> +			if (test_and_set_bit(pc_index,
> +					     current->kcov_state.s.bitmap))
> +				return;
> +		/* If the PC is new, write it to the trace. */
> +		fallthrough;
> +	case KCOV_MODE_TRACE_PC:
> +		sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> +					       current->kcov_state.s.trace_size,
> +					       canonicalize_ip(_RET_IP_));
> +		break;
> +	default:
> +		return;
> +	}
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc_guard);
>  
> @@ -255,7 +317,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
>  	u64 *trace;
>  
>  	t = current;
> -	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
> +	if (get_kcov_mode(t) != KCOV_MODE_TRACE_CMP)
>  		return;
>  
>  	ip = canonicalize_ip(ip);
> @@ -374,7 +436,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
>  	/* Cache in task struct for performance. */
>  	t->kcov_state.s = state->s;
>  	barrier();
> -	/* See comment in check_kcov_mode(). */
> +	/* See comment in get_kcov_mode(). */
>  	WRITE_ONCE(t->kcov_state.mode, state->mode);
>  }
>  
> @@ -408,6 +470,10 @@ static void kcov_reset(struct kcov *kcov)
>  	kcov->state.mode = KCOV_MODE_INIT;
>  	kcov->remote = false;
>  	kcov->remote_size = 0;
> +	kcov->state.s.trace = kcov->state.s.area;
> +	kcov->state.s.trace_size = kcov->state.s.size;
> +	kcov->state.s.bitmap = NULL;
> +	kcov->state.s.bitmap_size = 0;
>  	kcov->state.s.sequence++;
>  }
>  
> @@ -594,6 +660,41 @@ static inline bool kcov_check_handle(u64 handle, bool common_valid,
>  	return false;
>  }
>  
> +static long kcov_handle_unique_enable(struct kcov *kcov,
> +				      unsigned long bitmap_words)
> +{
> +	struct task_struct *t = current;
> +
> +	if (!IS_ENABLED(CONFIG_KCOV_ENABLE_GUARDS))
> +		return -ENOTSUPP;
> +	if (kcov->state.mode != KCOV_MODE_INIT || !kcov->state.s.area)
> +		return -EINVAL;
> +	if (kcov->t != NULL || t->kcov != NULL)
> +		return -EBUSY;
> +
> +	/*
> +	 * Cannot use zero-sized bitmap, also the bitmap must leave at least two
> +	 * words for the trace.
> +	 */
> +	if ((!bitmap_words) || (bitmap_words >= (kcov->state.s.size - 1)))
> +		return -EINVAL;
> +
> +	kcov->state.s.bitmap_size = bitmap_words * sizeof(unsigned long) * 8;
> +	kcov->state.s.bitmap = kcov->state.s.area;
> +	kcov->state.s.trace_size = kcov->state.s.size - bitmap_words;
> +	kcov->state.s.trace =
> +		((unsigned long *)kcov->state.s.area + bitmap_words);
> +
> +	kcov_fault_in_area(kcov);
> +	kcov->state.mode = KCOV_MODE_TRACE_UNIQUE_PC;
> +	kcov_start(t, kcov, &kcov->state);
> +	kcov->t = t;
> +	/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
> +	kcov_get(kcov);
> +
> +	return 0;
> +}
> +
>  static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>  			     unsigned long arg)
>  {
> @@ -627,6 +728,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>  		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
>  		kcov_get(kcov);
>  		return 0;
> +	case KCOV_UNIQUE_ENABLE:
> +		return kcov_handle_unique_enable(kcov, arg);
>  	case KCOV_DISABLE:
>  		/* Disable coverage for the current task. */
>  		unused = arg;
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 
