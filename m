Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8F58834
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748570618; cv=none; b=ul7zCJlc2+hjzGBPNHsgN8s60/Rsa4zTgaCS1gnPL0Wm7AVXqdQSfUGn9b6yy7rcRBRAmJOVMcKcb+8WIS2O884au9niUGl2y81Nm/JgzYlEmNVWEepgXuFqS/sEcK+E7wyKjXnhVjz+VO0Cyg1Ch1Z+JMGU0ys4Fn8c15JaoNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748570618; c=relaxed/simple;
	bh=cC+1Td4jMswjJMmANlG4ZK0JS3/VivVD8M+vllg/HDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAUS/2+3d8ODMzGWQnjO2QX/0kDZs8nrZe5mJlc94WKMZrOxy/5aO2ghByqlsOEg3skSPyLta0SIyPbPyM8OlpGBdd9FbfSP1n049fi3A5+a4H5P2uWqqM2pw8HHbOeLFYQMGq8HvWujdCCM/nFmH/J8N1sqjwP2Na4VBg0Jgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Mnm8C3Sm; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Mnm8C3Sm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748570606; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WjSoE2jZwml6DQx8LRZ94BS0oU+lYfnOs//MHn97YYg=;
	b=Mnm8C3SmTIok2px+mb7ajQ8hHNHJYb2PEM55seVrVxYOFdpVH45f/6TioCrdIzlh95AIcgTd96e74x89ofAKuGqTgvITLUdLc7PA/HGHt95E6eZT5+yrEKmeKw4BzwwOw3r1PIfziOEicN1XPLa9KAY0aMxIQrczH1zmbSAzkUY=
Received: from 30.178.81.156(mailfrom:qinyuntan@linux.alibaba.com fp:SMTPD_---0WcJNzay_1748570605 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 May 2025 10:03:25 +0800
Message-ID: <c33047c5-8ef2-44f6-bad9-7e618d62476e@linux.alibaba.com>
Date: Fri, 30 May 2025 10:03:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: =?UTF-8?B?TW96aWxsYSBUaHVuZGVyYmlyZCDmtYvor5XniYg=?=
Subject: Re: [PATCH V2 1/1] x86/resctrl: Remove unappropriate references to
 cacheinfo in the resctrl subsystem.
To: Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20250529031650.63880-1-qinyuntan@linux.alibaba.com>
 <20250529031650.63880-2-qinyuntan@linux.alibaba.com>
 <b0b3e665-4c4e-46d3-aae0-37853482938a@intel.com>
From: qinyuntan <qinyuntan@linux.alibaba.com>
In-Reply-To: <b0b3e665-4c4e-46d3-aae0-37853482938a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Reinette Chatre,

Thank you very much for reviewing my patch and for correcting the commit 
log content. With your modifications, the commit log now looks much more 
reasonable.

I appreciate your patient guidance. I will resend the third version of 
the patch to you shortly.

Best regards,
Qinyun Tan

On 5/30/25 1:37 AM, Reinette Chatre wrote:
> Hi Qinyun Tan,
> 
> Thank you very much. I have a few comments about the changelog that
> I think will help explain the issue while aiming to have it follow the
> "tip" rules documented in Documentation/process/maintainer-tip.rst.
> 
> On 5/28/25 8:16 PM, Qinyun Tan wrote:
>> In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
>> structure previously relies on the cacheinfo interface to store L3 cache
> 
> "previously relies" -> "relies"
> 
>> information (e.g., shared_cpu_map) for monitoring. However, this approach
>> introduces risks when CPUs go offline:
>>
>> The ci field in rdt_mon_domain is initialized using the first online CPU
>> of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
>> to contain only the offline CPU itself. Subsequently, attempting to read
>> counters via smp_call_on_cpu(offline_cpu) would fail, but returning zero
>> values for "top-level events" without error indication.
> 
> Last sentence of above paragraph can be modified slightly to keep it in
> imperative tone:
> 	Subsequently, attempting to read counters via smp_call_on_cpu(offline_cpu)
> 	fails (and error ignored), returning zero values for "top-level events"
> 	without any error indication.
> 
>>
>> To resolve these issues:
> 
> "To resolve these issues:" can be dropped. There is only one issue and the custom
> is for the solution to follow the problem description.
> 
>>
>> 1. Replace direct cacheinfo references in struct rdt_mon_domain and struct
>> rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
>>
>> 2. The hdr.cpu_mask maintained by resctrl constitutes a subset of
> 
> "hdr.cpu_mask" -> "rdt_domain_hdr::cpu_mask"
> 
> I do not think "rdt_domain_hdr::cpu_mask" should be defined as a subset of
> shared_cpu_map though ... especially since the problem description highlights how
> shared_cpu_map can contain offline CPUs. How about:
> 
> "rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> domain. When reading ..."
> 
>> shared_cpu_map. When reading top-level events, we dynamically select a CPU
> 
> drop "we" (no impersonating of code)
> 
> Considering the context it may help to be specific here:
> "select a CPU" -> "select a (known to be online) CPU"
> 
>> from hdr.cpu_mask and utilize its corresponding shared_cpu_map for resctrl
> 
> "hdr.cpu_mask" -> "rdt_domain_hdr::cpu_mask"
> 
>> to determine valid CPUs for reading RMID counter via the MSR interface.
> 
> You can highlight the motivation for doing this. For example, "Considering
> all CPUs associated with the L3 cache improves the chances of picking a
> housekeeping CPU on which the counter reading work can be queued, avoiding an
> unnecessary IPI."
> 
> Above is quite a mix of changes. Below aims to put it all together while also
> adding more modifications as I am seeing the full picture. Please check for accuracy
> and feel free to improve.
> 
> 	In the resctrl subsystem's Sub-NUMA Cluster (SNC) mode, the rdt_mon_domain
> 	structure representing a NUMA node relies on the cacheinfo interface
> 	(rdt_mon_domain::ci) to store L3 cache information (e.g., shared_cpu_map)
> 	for monitoring. The L3 cache information of a SNC NUMA node determines
> 	which domains are summed for the "top level" L3-scoped events.
> 
> 	rdt_mon_domain::ci is initialized using the first online CPU
> 	of a NUMA node. When this CPU goes offline, its shared_cpu_map is cleared
> 	to contain only the offline CPU itself.	Subsequently, attempting to read
> 	counters via smp_call_on_cpu(offline_cpu) fails (and error ignored),
> 	returning zero values for "top-level events" without any error indication.
>   
> 	Replace the cacheinfo references in struct rdt_mon_domain and struct
> 	rmid_read with the cacheinfo ID (a unique identifier for the L3 cache).
> 	
> 	rdt_domain_hdr::cpu_mask contains the online CPUs associated with that
> 	domain. When reading "top-level events", select a CPU from
> 	rdt_domain_hdr::cpu_mask and utilize its L3 shared_cpu_map to determine
> 	valid CPUs for reading RMID counter via the MSR interface.
> 	Considering all CPUs associated with the L3 cache improves the chances
> 	of picking a housekeeping CPU on which the counter reading work can be
> 	queued, avoiding an unnecessary IPI.
> 
>>
>> Fixes: 328ea68874642 ("x86/resctrl: Prepare for new Sub-NUMA Cluster (SNC) monitor files")
>> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
>> ---
> 
> With changelog polished:
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> Reinette

