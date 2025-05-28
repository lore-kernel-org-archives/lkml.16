Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D009C1367
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748403137; cv=none; b=PLWnqtEywDRs3e/3fhDJ2e97fj4XZGbin0QX2kllh0XKviqJpmSJqAEiFhdUdpew4pvTxQJToQSFJ1xuPMZc2SPrCqFdqR3i/8jZn14USRthIBLhwGNoHBO6sWEvEk+Toz1g4UZ0dZ8s1obCNpj8Gv3OXxGbYeLU8MdtFrNDqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748403137; c=relaxed/simple;
	bh=VluvKjbbQH105ItemVeQF7gLo9Bw44WFYGH88u6rT2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mxys9/DrWL1yP8fLmSJvBWAv6MK/lksBlY6NLcpPUMNx35L3HIqHc4dfkJmw7GgvH9qHRXjXcwpzaWIwYcl1iKl9mlkw3/Db0jtdzMNp8Iaw3DNljo0D/ATH0gveNiO3ZpEj30+cJ3a3iISS61athmApH0DUgtjfUyXSt+ZZ4vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jhhHEGF8; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jhhHEGF8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748403125; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=X829loQdjZMRMLJn95qVnLpfmXgsxTO1cLTqaD979QA=;
	b=jhhHEGF8JOsciuH88ls3CdaVp25oyMSG24f3U3py1Y+brLNXq2jkmCUV9aZSteGOiXMF+K4n9wmoBAA8ETIu+bjTixEW0udqai16jd9vpwJ5wtmPp4hyPzBEIJGzGiBdftFnGm1MWx/yitXzOAZoqP6cV4RHsNpUYWaAg03pN/A=
Received: from 30.178.82.30(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcBfXY4_1748403124 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 May 2025 11:32:04 +0800
Message-ID: <b67949b8-7eac-47b4-a667-6343837226f7@linux.alibaba.com>
Date: Wed, 28 May 2025 11:32:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH] x86/resctrl: Remove unnecessary references to cacheinfo
 in the resctrl subsystem.
To: Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20250526073744.62520-1-qinyuntan@linux.alibaba.com>
 <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
From: qinyuntan <qinyuntan@linux.alibaba.com>
In-Reply-To: <c4382156-a51e-4d07-9ccb-e6db2ca9d719@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Reinette Chatre,

On 5/28/25 7:36 AM, Reinette Chatre wrote:
> Hi Qinyun,
> 
> Thank you for catching this.
> 
> On 5/26/25 12:37 AM, Qinyun Tan wrote:
>> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
>> structure previously relied on the cacheinfo interface to store L3 cache
> 
> "previously relied" -> "relies"
Thanks, it will be corrected in the next patch.
>> information (e.g., shared_cpu_map) for monitoring. However, this approach
>> introduces risks when CPUs go offline:
>>
>> 1. Inconsistency: The ci field in rdt_mon_domain was initialized using the
> 
> "was initialized" -> "is initialized"
The same as above.>
>> first online CPU of a NUMA node. If this CPU later goes offline, the
>> shared_cpu_map (managed by the cache subsystem) is cleared, leading to
> 
> "is cleared" sounds like the shared_cpu_map is empty. Looking at
> cache_shared_cpu_map_remove() it seems that the worst case is when the
> CPU goes offline the shared_cpu_map only contains the offline CPU itself.
> If there remains a reference to that shared_cpu_map then it will thus be
> to a cpumask with an offline CPU. Are you seeing other scenarios?
> 
Yes, you are right. Once this CPU goes offline, its shared_cpu_map will 
only include itself. If we then try to call this offline CPU using 
smp_call_on_cpu, it will result in a failure.

>> incorrect or undefined behavior when accessed via rdt_mon_domain.
> 
> Could you please elaborate what "incorrect and undefined behavior" you
> encountered?
> It looks like reading the top level event would not be able to read
> an event from one (or more?) of the online domains since the shared_cpu_map
> will contain an offline CPU causing smp_call_on_cpu() to return with a failure
> that is not caught ... the symptom may this be that there are no errors but
> data is wrong?

Yes, there won't be any errors here, but when reading the top-level 
events, it may not retrieve any values.

For example, in the SNC-3 mode, suppose cpus 0, 40, and 80 are the 
firtst online cpus on node0, node1, and node2 respectively. If cpus 0, 
40, and 80 are all offline, At this point, reading "the top level event" 
will result in a zero.

Why hasn’t this issue been discovered earlier? The reason is that CPU0 
is always the first online CPU on node0. The cacheinfo stored in the 
first rdt_mon_domain corresponds to CPU0. When rdtgroup_mondata_show 
reads the top-level event, it iterates through all rdt_mon_domain 
entries, using if (d->ci->id == domid) to find the first rdt_mon_domain 
that shares the resource. It then selects a CPU from the corresponding 
cacheinfo to perform the monitoring group data read operation. In a 
single-socket environment, all CPUs typically share the L3 Cache, which 
means this traversal action will usually lead directly to CPU0's 
cacheinfo. Additionally, since the mainline kernel no longer supports 
taking CPU0 offline, that cacheinfo remains valid indefinitely.

> 
>>
>> 2. Lifecycle dependency: The cacheinfo structure's lifecycle is managed
>> by the cache subsystem, making it unsafe for resctrl to hold
>> long-term references.
> 
> This is not obvious to me. Could you please elaborate how resctrl could
> have a reference to a removed structure?
As mentioned above, although the cacheinfo of each CPU is not freed in 
the latest mainline, the shared_cpu_map within the cacheinfo will be 
modified as CPUs go online or offline. Each rdt_mon_domain directly 
references the cacheinfo of the first online CPU in the node, and the 
shared_cpu_map is used in various processes. This situation is bound to 
lead to some problems.

> 
>>
>> To resolve these issues and align with design principles:
>>
>> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
>> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>>
>> 2. Use hdr.cpu_mask (already maintained by resctrl) to replace
>> shared_cpu_map logic for determining valid CPUs for RMID counter reads
>> via the MSR interface.
> 
> I think it will help to explain why it is ok now to use hdr.cpu_mask instead
> of the shared_cpu_map. In support of this you could mention that the original
> solution aimed to read the counters on any CPU associated with the L3 cache
> that the sub-numa domain forms part of, but this solution uses the
> cpumask of one of the sub-numa domains that is known to be associated with
> the L3 cache. This is a reduced set of CPUs from previously intended but
> known to be accurate. Alternative may be to build a local cpumask from the
> all the sub-numa domains but it is not clear to me how much this will
> improve things.
> 
> Considering this I do not think the references are "unnecessary" as the
> subject claims since the solution does not replace the original cpumask with
> an identical one.

Thanks a lot, you are correct. hdr.cpu_mask is a subset of 
shared_cpu_map, and we can almost use hdr.cpu_mask to replace the 
functionality of shared_cpu_map.

In fact, in resctrl, the only purpose of using cpu_mask is to select a 
CPU that shares the cache resource for performing monitoring group data 
reads. Therefore, I think there is no need to build a local cpumask from 
all the sub-NUMA domains in this context.

I will provide a more detailed description in my commit log moving forward.

> 
>>
> 
> Needs a "Fixes:" tag.
Ok，it will be added in the next patch.>
>> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
>> ---
> 
> Reinette

--
Thanks
Qinyun Tan

