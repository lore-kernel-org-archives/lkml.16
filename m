Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C03527FD41
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510408; cv=none; b=F4JGhqnXNZMpA60VisdA5jmd80FqgL2EfkKDY84f8bNOQTrQ0HUOfksSau3/+/gCjMCjRVoUm9Um5UbvvBi9Le52B8Y1yYR3ZNhtU9CDW6+OUaug8vPX0hiejEC6bAvwrnLYH1XtkgjBzFdwG/KbyyAPixE9irlFrkFOKUABbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510408; c=relaxed/simple;
	bh=8I6ecEen3jB/8oO46SzxrrlKurF+HNzCakWB2dViDfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTvTRz/PCQ65A4p2ho9R3wunRTBvOAZ6x3114L0BH+XD/kqhDoldrbGI2Cmw5lGUhSqZQ0BZ2z0sx1YSU8e+KiMfKDzHcLnNdbQrwvHOLTHoZFvXsNeHE2xWswRSudlKHsmT8b8KvcN4bASFEn2fAUto77KaG4RPQT8WNvi2rA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfzK48vL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfzK48vL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745510407; x=1777046407;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8I6ecEen3jB/8oO46SzxrrlKurF+HNzCakWB2dViDfs=;
  b=NfzK48vLlaYKQlouGQSE+7Y8Czh75tLLW2Vy2UhCgOF4ekJb7OKUtufA
   DJnf+bd8MXx83X8kRqz14UALFRqrnDRQlhkA0FKlMAEbXJKS/oPQX33y9
   JWSe5r8Ozx1D91k1wOLxWmrkMYr7/DVCApeJFRIXrHO0hIhbeiQoDP+dj
   Jatv1BuXc6FZvG7Tnq+Sw/tij5BviFw907F7cTFbP2RJNQjgE2a/2hUM9
   N3Md/m1BbAS/4vnvqSbgxNwlNVAv1wzFlAWvw2RviV3/diE1sUNcQqjiT
   oibrDWSTejMw1ncW2SeIsuxEFUzHESo0I7wipteVaaVNsGHhlWRel3wQd
   Q==;
X-CSE-ConnectionGUID: aMBfbbRiTYeA4NnkzOTatQ==
X-CSE-MsgGUID: GdW5JgOITo+OoulhESVrQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69641694"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="69641694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 09:00:06 -0700
X-CSE-ConnectionGUID: xJLNGBHtTSyq+v441V/Liw==
X-CSE-MsgGUID: x3P7wEiYTzqvkP3NhmBINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="137751355"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 09:00:05 -0700
Received: from [10.246.136.14] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id EDF0120B5736;
	Thu, 24 Apr 2025 09:00:03 -0700 (PDT)
Message-ID: <c919a36c-f343-48ce-a262-401159c5bf30@linux.intel.com>
Date: Thu, 24 Apr 2025 12:00:02 -0400
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
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250424142528.GD1166@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-04-24 10:25 a.m., Peter Zijlstra wrote:
> On Thu, Apr 24, 2025 at 06:47:13AM -0700, kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> The patch series includes several fixes for the new Intel features.
>>
>> The first 4 patches are to fix the group flag issue which impacts the
>> branch counters, PEBS counters-snapshotting and ACR.
>> The V1 can be found at
>> https://lore.kernel.org/lkml/20250423221015.268949-1-kan.liang@linux.intel.com/
>>
>> The last patch is to fix an issue of counters-snapshotting.
>> The V1 can be found at
>> https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
>>
>> Kan Liang (5):
>>   perf/x86/intel: Only check the group flag for X86 leader
>>   perf/x86/intel: Check the X86 leader for pebs_counter_event_group
>>   perf/x86/intel: Check the X86 leader for ACR group
>>   perf/x86: Optimize the is_x86_event
>>   perf/x86/intel/ds: Fix counter backwards of non-precise events
>>     counters-snapshotting
> 
> It didn't apply cleanly,

Sorry for it.

> but I stomped on it and pushed out new
> perf/urgent and perf/core branches that contain these patches. Hopefully
> I didn't mess it up ;-)

Something is missed in this patch 5d4d71ebc737 ("perf/x86/intel: Only
check the group flag for X86 leader")

diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index a73b1ff031b2..1f72a4f77b5c 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -119,7 +119,7 @@ static inline bool check_leader_group(struct
perf_event *leader, int flags)

 static inline bool is_branch_counters_group(struct perf_event *event)
 {
-	return check_leader_group(event->group_leader, PERF_X86_EVENT_PEBS_CNTR);
+	return check_leader_group(event->group_leader,
PERF_X86_EVENT_BRANCH_COUNTERS);
 }

 static inline bool is_pebs_counter_event_group(struct perf_event *event)
@@ -1123,7 +1123,6 @@ static struct perf_pmu_format_hybrid_attr
format_attr_hybrid_##_name = {\
 	.pmu_type	= _pmu,                                         \
 }

-int is_x86_event(struct perf_event *event);
 struct pmu *x86_get_pmu(unsigned int cpu);
 extern struct x86_pmu x86_pmu __read_mostly;


Thanks,
Kan

