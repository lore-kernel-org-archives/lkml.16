Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61E288A5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589263; cv=none; b=NuSn7Jp7U+Ndr1WIcWAxop1Ea/RQPIgVLI6epSAXLHptVMzm2h2OFloPeYliWb0iaBA+caiDJ7baGZeGXRjh1Tsy3g9mZ/TbXNfvoouYt1ri6r9Y3w9ZyfyHJKtsXxZV5/YCt8UEbXdxNynL4bObSY3GJozJck/9Z6cQvtZL4gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589263; c=relaxed/simple;
	bh=3zvfee43E+7OopCkTYkkPp7qMzZFVlrE2lTwOoa1kVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmKXlz81NhIDzxl4+pCnYn9xGA5WsIqW+1buwl1gUpj7Qj7GOsOslfQcJp6GOWIwEISgYUzXG1/QChOUY3n/eUSy9yqWlh/CoLUDrd/bJiizk4F2rWjo7VmfxTs1DTTqlVssr7053y2I7gDAKzxjMAqG5xg0sToRN68T5qjYDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJBV6Uye; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJBV6Uye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745589262; x=1777125262;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3zvfee43E+7OopCkTYkkPp7qMzZFVlrE2lTwOoa1kVc=;
  b=PJBV6UyenaaRPtfr/Z13ij5NW2xibQ5GT94OxgBjubcGDfL7sMBmjTfV
   2NQAOeAdf/fgA+UxaNh6V9Go/M5OZoYrph184SXtSmJRZVTfgyt8sCvIa
   Odfqza6YvGkXaPfa87gHn5KROmXPEO/9Xn+0ej+h0uuMjwHdb2cTrY0YM
   MryXfRwFQUMCI8Py7oKiv96YbKKnibAz0SUp2j5sFBoCJu34KiDzev+jl
   ajLK2n1n7UdMae9XLjmcjG9eIL4GLS+L7O4ivBDnczv+UdMakOiK63lKd
   gZ0haoFqpk3GK2CnxacPjFwBx2xedjEhS9ucjcO4Ze/YraATbOoqvvODD
   g==;
X-CSE-ConnectionGUID: 54MtYyN6ThOvqylVWEoUpg==
X-CSE-MsgGUID: 5PirQgyiSQ+GDdXKsZDXYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47378890"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47378890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:54:21 -0700
X-CSE-ConnectionGUID: Ie4pCktjRuGTJenEFn20XQ==
X-CSE-MsgGUID: 93lM721eSdy38pQG3qCNuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132827116"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:54:21 -0700
Received: from [10.246.136.14] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id AFAC220B5736;
	Fri, 25 Apr 2025 06:54:19 -0700 (PDT)
Message-ID: <1c9acb0c-50ae-4343-8deb-c5d04e75ca2a@linux.intel.com>
Date: Fri, 25 Apr 2025 09:54:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/5] Several fixes for group flag and
 counters-snapshotting
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, linux-kernel@vger.kernel.org
References: <20250424134718.311934-1-kan.liang@linux.intel.com>
 <20250424142528.GD1166@noisy.programming.kicks-ass.net>
 <c919a36c-f343-48ce-a262-401159c5bf30@linux.intel.com>
 <20250425125556.GD22125@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250425125556.GD22125@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-04-25 8:55 a.m., Peter Zijlstra wrote:
> On Thu, Apr 24, 2025 at 12:00:02PM -0400, Liang, Kan wrote:
>>
>>
>> On 2025-04-24 10:25 a.m., Peter Zijlstra wrote:
>>> On Thu, Apr 24, 2025 at 06:47:13AM -0700, kan.liang@linux.intel.com wrote:
>>>> From: Kan Liang <kan.liang@linux.intel.com>
>>>>
>>>> The patch series includes several fixes for the new Intel features.
>>>>
>>>> The first 4 patches are to fix the group flag issue which impacts the
>>>> branch counters, PEBS counters-snapshotting and ACR.
>>>> The V1 can be found at
>>>> https://lore.kernel.org/lkml/20250423221015.268949-1-kan.liang@linux.intel.com/
>>>>
>>>> The last patch is to fix an issue of counters-snapshotting.
>>>> The V1 can be found at
>>>> https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
>>>>
>>>> Kan Liang (5):
>>>>   perf/x86/intel: Only check the group flag for X86 leader
>>>>   perf/x86/intel: Check the X86 leader for pebs_counter_event_group
>>>>   perf/x86/intel: Check the X86 leader for ACR group
>>>>   perf/x86: Optimize the is_x86_event
>>>>   perf/x86/intel/ds: Fix counter backwards of non-precise events
>>>>     counters-snapshotting
>>>
>>> It didn't apply cleanly,
>>
>> Sorry for it.
>>
>>> but I stomped on it and pushed out new
>>> perf/urgent and perf/core branches that contain these patches. Hopefully
>>> I didn't mess it up ;-)
>>
>> Something is missed in this patch 5d4d71ebc737 ("perf/x86/intel: Only
>> check the group flag for X86 leader")
>>
>> diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
>> index a73b1ff031b2..1f72a4f77b5c 100644
>> --- a/arch/x86/events/perf_event.h
>> +++ b/arch/x86/events/perf_event.h
>> @@ -119,7 +119,7 @@ static inline bool check_leader_group(struct
>> perf_event *leader, int flags)
>>
>>  static inline bool is_branch_counters_group(struct perf_event *event)
>>  {
>> -	return check_leader_group(event->group_leader, PERF_X86_EVENT_PEBS_CNTR);
>> +	return check_leader_group(event->group_leader,
>> PERF_X86_EVENT_BRANCH_COUNTERS);
>>  }
>>
>>  static inline bool is_pebs_counter_event_group(struct perf_event *event)
> 
> Right.
> 
>> @@ -1123,7 +1123,6 @@ static struct perf_pmu_format_hybrid_attr
>> format_attr_hybrid_##_name = {\
>>  	.pmu_type	= _pmu,                                         \
>>  }
>>
>> -int is_x86_event(struct perf_event *event);
>>  struct pmu *x86_get_pmu(unsigned int cpu);
>>  extern struct x86_pmu x86_pmu __read_mostly;
> 
> See, that isn't there in tip/perf/urgent :-)
> >
> I've pushed out an updated set. Please check.

It looks good to me. Thanks a lot! :)

Kan
