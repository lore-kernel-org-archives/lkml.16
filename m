Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F79248184
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739030329; cv=none; b=d5gFea6eu9xv8Ww/UEv2VLrIsj3zllrh9wyuVL4dQCWl2KgY3EGEVSq6o9HtpA8rg3J7DPqtCroVVxdrPUmkSgsDPt254FtKAHDmUy8PhMynGAKEJ1ey3/vsulww50gtz0aFYRSCbqY4NMIjOtuCpETPK0zrSaMt/rV8SodvLFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739030329; c=relaxed/simple;
	bh=VruUlVMVabBGJe6x03ULqVMChydUyEZ5333+XkGxjCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0BGQwhuENNeqk8tB+He3qy80PL8++V70sghrFEW+0XRboxj2BEyTACg4asOuHBxFqU/VgdI3sTAhxIq6TiIwEz/fWzCFt1NNJue4x7ItLdor7tt5D0kw32zGrVYObYDgveng3YqsOVs83K29Q8s2KYDuBi6uPsDtV1FIVkObAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=V0cS+XNY; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="V0cS+XNY"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa122f62b5so607725a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 07:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739030326; x=1739635126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnldKxmzBqwKinjZR1oDYDVj5xkQePqA06ZEDoTPiUQ=;
        b=V0cS+XNYCw3tjOuacOyjtN4H4yNSVyv7mudK67bfmtuc81ZbQoe1FygLLVyjqMhwb8
         HjRThDR5KqOvGE6mJMdIB3tSXaK79SfLxB+ZynRZvqt9VxOBVHbBJe16ZtXJDnLpi98o
         tnEt4zDdPo9r68wyX37fvs97n7lVMB8pQ/xJb/w7T7gJV/DY37fNbvT1hDQm3XboyS1T
         PEjCEHSTe+V09bbA2HMS5V/A1YYUgs6fi77fypnjqP0MP21fuOxsCrqTFCfg+ZfiQfze
         hgctJw2iFbBxQUJ+/kFxWSVuV1fmw5qtnA/pt3pr4i8iuhPxjy4op4GAdEocxu44HWQ4
         pLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739030326; x=1739635126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnldKxmzBqwKinjZR1oDYDVj5xkQePqA06ZEDoTPiUQ=;
        b=hee9NkSZCXnfjMXLogzDLptxufkjhf+NHyI5W56/Ul5PeHQEW97tJ8BJrOS+TiaPLY
         3MoEH1Xjqyz5qwnb2EZpDg5zjHd1N/MXj0tQ6+Y2mmTkZbDvgOx8hfgU1EsUs44OO0EK
         vMFKlDWtS7b831VNbSMXofNe2xnCuYvxdgtXl6gQQ3YiKdd4TRsEsPL9Fr6OfnB3gGK6
         P4CYinPGHqx5OD18YWXaIbQ+8NQr0Op6qPCHyJ++5KhFFCkertylmBGTxyxnI6ASCqnm
         bbmFfnJm8dmxEInj+IZyqUVgyBpkeub8Mx/SIUnLiTtm1VcIEik+19WvdDyyiXlXt/Iy
         gg4g==
X-Forwarded-Encrypted: i=1; AJvYcCV+oNBeF+IvqqhI8hiSoOWb0RNmLXpXtiM5d56eJf52PIRcsn6yfDUDDaDjZ7iqZpTjPs4NQufboUUYBC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/W9rtSpDj5TDhkp4YfAx0xOzzX+BvNUN2eBK8gABjTmiqA2YL
	VLQCS/+9FqX5jEib2+cxlPU17LTT0xoV2lQxnT5I6lzsgSMs7gWrc3Q+rU+Ss+ch0R7PeountAP
	n
X-Gm-Gg: ASbGncvAGg8q6AB8AnP024gIeFoTpMk4IqACktSdzyEslll0gVJ0EKzHU2vS9jtk/ZA
	0apewalZFoLfna1sdTVfsNiSOC3Yz1DemXVQ0ne2qmw3v/7l/seb8GnBK17I5n0es2xjz78UWu/
	tXLEz4olV5W47zo3sYwb73iD3XFa+EfIyKii3E1BKKjRW1ucpPNavi2FJN95t49+ZcsYcUcIb/A
	M8xCPCizxs7g+W9MLZp0GO/mBuU8pRLkhs2EZolFg26BdAr6+lmUTak85OdkW/opsaf/X7WzPW2
	IjRH13pCGF4aEsmjTkUQe99qkVmS6ey1GX0Q
X-Google-Smtp-Source: AGHT+IEp3jhINNJbAaq0fhtM3ghHgJhMNzOT+lO6NXSocYRA+5prw0KJxYLU6aLGqfrWgIWd9yeIDQ==
X-Received: by 2002:a17:90b:2243:b0:2ee:d9f2:2acd with SMTP id 98e67ed59e1d1-2fa245452bdmr4474697a91.6.1739030326531;
        Sat, 08 Feb 2025 07:58:46 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad53bff9c82sm1231302a12.37.2025.02.08.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 07:58:45 -0800 (PST)
Message-ID: <f37da359-bad1-4685-aa68-1d2a2d0f8bf3@bytedance.com>
Date: Sat, 8 Feb 2025 23:58:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v3 2/2] cgroup/rstat: Add run_delay accounting for
 cgroups
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bitao Hu <yaoma@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Chen Ridong <chenridong@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 "(open list:CONTROL GROUP (CGROUP))" <cgroups@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250207041012.89192-3-wuyun.abel@bytedance.com>
 <202502081318.c9fYNNx8-lkp@intel.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <202502081318.c9fYNNx8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/8/25 1:47 PM, kernel test robot Wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tj-cgroup/for-next]
> [also build test ERROR on tip/sched/core akpm-mm/mm-everything linus/master v6.14-rc1 next-20250207]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Wu/cgroup-rstat-Fix-forceidle-time-in-cpu-stat/20250207-121257
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
> patch link:    https://lore.kernel.org/r/20250207041012.89192-3-wuyun.abel%40bytedance.com
> patch subject: [PATCH v3 2/2] cgroup/rstat: Add run_delay accounting for cgroups
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250208/202502081318.c9fYNNx8-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081318.c9fYNNx8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502081318.c9fYNNx8-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from kernel/sched/build_policy.c:19:
>     In file included from include/linux/sched/isolation.h:5:
>     In file included from include/linux/cpuset.h:17:
>     In file included from include/linux/mm.h:2224:
>     include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       505 |                            item];
>           |                            ~~~~
>     include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       512 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>       524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>       525 |                            NR_VM_NUMA_EVENT_ITEMS +
>           |                            ~~~~~~~~~~~~~~~~~~~~~~
>     In file included from kernel/sched/build_policy.c:59:
>>> kernel/sched/cputime.c:254:22: error: no member named 'rq_sched_info' in 'struct rq'
>       254 |         return cpu_rq(cpu)->rq_sched_info.run_delay;
>           |                ~~~~~~~~~~~  ^
>     3 warnings and 1 error generated.

Oops.. SCHED_INFO can be selected by either TASK_DELAY_ACCT or SCHEDSTATS.
Will fix. Thanks a lot!

> 
> 
> vim +254 kernel/sched/cputime.c
> 
>     251	
>     252	u64 get_cpu_run_delay(int cpu)
>     253	{
>   > 254		return cpu_rq(cpu)->rq_sched_info.run_delay;
>     255	}
>     256	#endif
>     257	
> 

