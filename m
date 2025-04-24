Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18271A072C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502614; cv=none; b=ahhIkQdILEyc8lNPbJYFBEQQidtRZXXcjru7O9cdo9L+EUhb9r/Bx05vjHZRYyf4qNkRjHMdTxpGWNuNz+5IEhEev0gC7cCQvd+UiNeYTc736OkOK34g9EBGAQueHddtD8qQ2pMxV7F3qS1p9xwbux2RNXRSyINlVX9qm4RN5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502614; c=relaxed/simple;
	bh=JeRtCnykC1lfDP46Ck7YP/X8UYXjdOlNF02tk0RwGV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7L1q8Baj2bI1uB8RfLcprKmfCz260r+QieQFyQ+jZkxzsPa9r+qVUh/8sji/os0Z0JvJQcCbPqix592C5YaI+L7lFhoyj+yUI+Kskq02UqA2L+d/8or1TSrNsxOmPyfH3K/TE0FrlR6l+RBy32jzY8cyFTggc+E7MMFA8YRtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIspYMgb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIspYMgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745502613; x=1777038613;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JeRtCnykC1lfDP46Ck7YP/X8UYXjdOlNF02tk0RwGV8=;
  b=SIspYMgbdbMX6U2UUZQHVgJBTMj5DnqQMp3nxhULKuYT5Z94mEAPiUSq
   aBLEa69HCLg2k/OFQF0+JPatKnmd7pzG/f7/WZsLBmCI4zEXKnDAxUntO
   vfvqmb/qIZskaelMA690g/MEV61dNWyq/4SPwIXJE6VSpxX2xNbkFTANV
   VFG5ubO6zQGkqTpCNOPcZu95i2S8kD6NAr2J5FkO1YCTkQtkaztybRZHA
   0AiqgtXCqb/EWWsEWKjwOTVQAQTDakgXHJ4Is+qa1wPpvqjRLGSeFJ8br
   hdpaxZLabCqJ1XASBAaOxkD0wIE3TXR+BBCXnoca3SiOgCEzqWmk8G+1J
   g==;
X-CSE-ConnectionGUID: IQzgVoIJQpaJoWjhy0smRg==
X-CSE-MsgGUID: mJ4DSmISTu2y7THk4gNJRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46257822"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="46257822"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:50:12 -0700
X-CSE-ConnectionGUID: fWASd60YSI2zdoK5UHyyeg==
X-CSE-MsgGUID: +duHSKeARSmpN0aK/gzTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="163592945"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 06:50:12 -0700
Received: from [10.246.136.14] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id B386F20B5736;
	Thu, 24 Apr 2025 06:50:10 -0700 (PDT)
Message-ID: <27d1c070-9644-4088-a0ee-e005d1542874@linux.intel.com>
Date: Thu, 24 Apr 2025 09:50:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/x86/intel: Only check the group flag for X86
 leader
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, linux-kernel@vger.kernel.org,
 Luo Gengkun <luogengkun@huaweicloud.com>
References: <20250423221015.268949-1-kan.liang@linux.intel.com>
 <20250424094050.GE19534@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250424094050.GE19534@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-04-24 5:40 a.m., Peter Zijlstra wrote:
> On Wed, Apr 23, 2025 at 03:10:14PM -0700, kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> A warning in intel_pmu_lbr_counters_reorder() may be triggered by below
>> perf command.
>>
>> perf record -e "{cpu-clock,cycles/call-graph="lbr"/}" -- sleep 1
>>
>> It's because the group is mistakenly treated as a branch counter group.
>>
>> The hw.flags of the leader are used to determine whether a group is a
>> branch counters group. However, the hw.flags is only available for a
>> hardware event. The field to store the flags is a union type. For a
>> software event, it's a hrtimer. The corresponding bit may be set if the
>> leader is a software event.
>>
>> For a branch counter group and other groups that have a group flag
>> (e.g., topdown, PEBS counters snapshotting, and ACR), the leader must
>> be a X86 event. Check the X86 event before checking the flag.
>>
>> There may be an alternative way to fix the issue by moving the hw.flags
>> out of the union type. It should work for now. But it's still possible
>> that the flags will be used by other types of events later. As long as
>> that type of event is used as a leader, a similar issue will be
>> triggered. So the alternative way is dropped.
>>
>> Reported-by: Luo Gengkun <luogengkun@huaweicloud.com>
>> Closes: https://lore.kernel.org/lkml/20250412091423.1839809-1-luogengkun@huaweicloud.com/
>> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> 
> Can I get a Fixes tag for this such that I can stick it in urgent?
>

I have split the patch series and sent a V2.
https://lore.kernel.org/lkml/20250424134718.311934-1-kan.liang@linux.intel.com/

There is a fix for the non-precise events counters-snapshotting, which
is buried in the LKML.
https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
I've also added it into the above V2 with a fixes tag.
Please take a look. If it looks good for you, please stick it in urgent
as well.

Thanks,
Kan
