Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D48A920
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744862690; cv=none; b=Q0g2F7aWYvh1XpTh6nQtUSh8vPrGonmMtb7ao+2GkaaqRezpkvDrwRMRVR0O8qEYz6jex51DtguRzRnDCuaQlbDL4QSTfdHfyMB46Dp7JUWN1cpDV7JkWeWzj82nl132M/yWGzRGDS8/NnmdgecayjUAM+BGWZy/uou+kbwb1OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744862690; c=relaxed/simple;
	bh=w5FgbK2x4sGvsy9PHL87xjDes5Oim2woi57EAKaIyDw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQXSGr74+C3DT1e/gGW+wXVqLD/ohVggOYMKp/0bBv7Q46zuB3MQfWBrpSu5O/f1nRs7l1e6pKb+8tcmvkCh9vWnfU6hTThLryVNpycSZ+bag7rUdutiEkyw+ekg1PO9cPW/S1H5lQFQVIW5fTWDlFCjea8xbffmkGv1NikzEvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ebr9Zvck; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ebr9Zvck"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GN6kUV029930;
	Thu, 17 Apr 2025 04:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DuQ6vw1UigtHKVIvQTaQhmje
	30fGE5Ksa+r0AUhWdEY=; b=Ebr9Zvck3miV3+xYq2iWkd7WogIwMz7mIUT5tLt6
	2lod2YUvAixnazSlbHKCj+K3Gt2xAaSE29yNsOLD2oEhpmdXmdJYjUcI5XUnk1G+
	wiXUPrQUTWsh4ciH7k+AF60qBQ8/cX67aM0JcuE8UjY9TM8qZVolI4dPejDYHKr8
	62gneiULPflqw2xN6QE0hIvyoMJ8XXTdVmsh066QNU1OIyNDhI+VSPZCb+bqFH4F
	u1EL+4JMeYDyCw1s/q8FsAHNDwEVVJYz4oJ3E/v6gW7I3LguboOCnMwj4aowrn0O
	0DYHf74BZWB0oqirvYmNn3NIEzBh3gwOUTt17cI9lHTv3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk5fjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:04:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53H447Wa007204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:04:07 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Apr 2025 21:04:05 -0700
Date: Thu, 17 Apr 2025 12:04:01 +0800
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
Subject: Re: [PATCH 0/7] RFC: coverage deduplication for KCOV
Message-ID: <aAB9sUllq/xR/Maf@hu-jiangenj-sha.qualcomm.com>
References: <20250416085446.480069-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416085446.480069-1-glider@google.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68007db8 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=6WkzK5_KCWnSRe-jCnIA:9 a=CjuIK1q_8ugA:10 a=gIUsDA97qKwA:10 a=TjNXssC_j7lpFel5tvFf:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-GUID: cWkygLtIaFXhDVZIryzvozcwrQSrmAIv
X-Proofpoint-ORIG-GUID: cWkygLtIaFXhDVZIryzvozcwrQSrmAIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=730 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170029

On Wed, Apr 16, 2025 at 10:54:38AM +0200, Alexander Potapenko wrote:
> As mentioned by Joey Jiao in [1], the current kcov implementation may
> suffer from certain syscalls overflowing the userspace coverage buffer.
> 
> According to our measurements, among 24 syzkaller instances running
> upstream Linux, 5 had a coverage overflow in at least 50% of executed
> programs. The median percentage of programs with overflows across those 24
> instances was 8.8%.
> 
> One way to mitigate this problem is to increase the size of the kcov buffer
> in the userspace application using kcov. But right now syzkaller already
> uses 4Mb per each of up to 32 threads to store the coverage, and increasing
> it further would result in reduction in the number of executors on a single
> machine.  Replaying the same program with an increased buffer size in the
> case of overflow would also lead to fewer executions being possible.
> 
> When executing a single system call, excessive coverage usually stems from
> loops, which write the same PCs into the output buffer repeatedly. Although
> collecting precise traces may give us some insights into e.g. the number of
> loop iterations and the branches being taken, the fuzzing engine does not
> take advantage of these signals, and recording only unique PCs should be
> just as practical.
> 
> In [1] Joey Jiao suggested using a hash table to deduplicate the coverage
> signal on the kernel side. While being universally applicable to all types
> of data collected by kcov, this approach adds another layer of complexity,
> requiring dynamically growing the map. Another problem is potential hash
> collisions, which can as well lead to lost coverage. Hash maps are also
> unavoidably sparse, which potentially requires more memory.
> 
> The approach proposed in this patch series is to assign a unique (and
> almost) sequential ID to each of the coverage callbacks in the kernel. Then
> we carve out a fixed-sized bitmap from the userspace trace buffer, and on
> every callback invocation we:
> 
> - obtain the callback_ID;
> - if bitmap[callback_ID] is set, append the PC to the trace buffer;
> - set bitmap[callback_ID] to true.
> 
> LLVM's -fsanitize-coverage=trace-pc-guard replaces every coverage callback
> in the kernel with a call to
> __sanitizer_cov_trace_pc_guard(&guard_variable) , where guard_variable is a
> 4-byte global that is unique for the callsite.
> 
> This allows us to lazily allocate sequential numbers just for the callbacks
> that have actually been executed, using a lock-free algorithm.
> 
> This patch series implements a new config, CONFIG_KCOV_ENABLE_GUARDS, which
> utilizes the mentioned LLVM flag for coverage instrumentation. In addition
> to the existing coverage collection modes, it introduces
> ioctl(KCOV_UNIQUE_ENABLE), which splits the existing kcov buffer into the
> bitmap and the trace part for a particular fuzzing session, and collects
> only unique coverage in the trace buffer.
> 
> To reset the coverage between runs, it is now necessary to set trace[0] to
> 0 AND clear the entire bitmap. This is still considered feasible, based on
> the experimental results below.
> 
> The current design does not address the deduplication of KCOV_TRACE_CMP
> comparisons; however, the number of kcov overflows during the hints
> collection process is insignificant compared to the overflows of
> KCOV_TRACE_PC.
> 
> In addition to the mentioned changes, this patch adds support for
> R_X86_64_REX_GOTPCRELX to objtool and arch/x86/kernel/module.c.  It turned
> out that Clang leaves such relocations in the linked modules for the
> __start___sancov_guards and __stop___sancov_guards symbols. Because
> resolving them does not require a .got section, it can be done at module
> load time.
> 
> Experimental results.
> 
> We've conducted an experiment running syz-testbed [3] on 10 syzkaller
> instances for 24 hours.  Out of those 10 instances, 5 were enabling the
> kcov_deduplicate flag from [4], which makes use of the KCOV_UNIQUE_ENABLE
> ioctl, reserving 4096 words (262144 bits) for the bitmap and leaving 520192
> words for the trace collection.
> 
> Below are the average stats from the runs.
Is there test without trace collection? Is bitmap only enough?
> 
> kcov_deduplicate=false:
>   corpus: 52176
>   coverage: 302658
>   cover overflows: 225288
>   comps overflows: 491
>   exec total: 1417829
>   max signal: 318894
> 
> kcov_deduplicate=true:
>   corpus: 52581
>   coverage: 304344
>   cover overflows: 986
>   comps overflows: 626
>   exec total: 1484841
>   max signal: 322455
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20250114-kcov-v1-5-004294b931a2@quicinc.com/T/
> [2] https://clang.llvm.org/docs/SanitizerCoverage.html
> [3] https://github.com/google/syzkaller/tree/master/tools/syz-testbed
> [4] https://github.com/ramosian-glider/linux/pull/7 
> 
> 
> Alexander Potapenko (7):
>   kcov: apply clang-format to kcov code
>   kcov: factor out struct kcov_state
>   kcov: x86: introduce CONFIG_KCOV_ENABLE_GUARDS
>   kcov: add `trace` and `trace_size` to `struct kcov_state`
>   kcov: add ioctl(KCOV_UNIQUE_ENABLE)
>   x86: objtool: add support for R_X86_64_REX_GOTPCRELX
>   mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
> 
>  Documentation/dev-tools/kcov.rst  |  43 +++
>  MAINTAINERS                       |   1 +
>  arch/x86/include/asm/elf.h        |   1 +
>  arch/x86/kernel/module.c          |   8 +
>  arch/x86/kernel/vmlinux.lds.S     |   1 +
>  arch/x86/um/asm/elf.h             |   1 +
>  include/asm-generic/vmlinux.lds.h |  14 +-
>  include/linux/kcov-state.h        |  46 +++
>  include/linux/kcov.h              |  60 ++--
>  include/linux/sched.h             |  16 +-
>  include/uapi/linux/kcov.h         |   1 +
>  kernel/kcov.c                     | 453 +++++++++++++++++++-----------
>  lib/Kconfig.debug                 |  16 ++
>  mm/kasan/generic.c                |  18 ++
>  mm/kasan/kasan.h                  |   2 +
>  scripts/Makefile.kcov             |   4 +
>  scripts/module.lds.S              |  23 ++
>  tools/objtool/arch/x86/decode.c   |   1 +
>  tools/objtool/check.c             |   1 +
>  19 files changed, 508 insertions(+), 202 deletions(-)
>  create mode 100644 include/linux/kcov-state.h
> 
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 
