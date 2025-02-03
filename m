Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A93202C2F
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 16:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599260; cv=none; b=Z9Dd/k3zZW/1gqA5PlapWOHHtn32ZywS6POkCW1XeaKEVrEV3tv4pKYM61OHalU1PVZW47hvc0sfMYr8VbM7S/cU7UaPfQhHIwV9XJjts/VeNH6wFro3aXtexpm8PhxPP/BAlHOG8Sks0eBu3vT0sQ9F0i7X/9in/oMeM6JCapA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599260; c=relaxed/simple;
	bh=b2JOUkIYh6C7SR/NDzXSOGXjIDLsFLX8XgBG4uI9Nn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyDbXxjOAikICQt5hVnQPUGI1ipZXPTxdoBkcP/6LUE5uYEagJZ8T901byn+niYWlXU8ie4pkFW6eK4eAwBR8oOraLcOrmw87+zFVXKCMkiryoV8tFJ0Q9D25uEdytOWBo5ec0NxAuZhiaC/NVV3SBzfBBlOYRbXPCTugym6DZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZt0I+dl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZt0I+dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738599258; x=1770135258;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b2JOUkIYh6C7SR/NDzXSOGXjIDLsFLX8XgBG4uI9Nn8=;
  b=TZt0I+dlLJthLp9fJKYdKYyr+lJBhPgyKun7YrVyg9rorqsesE4uCNbH
   xuviEAdWxigQnbkmwG2ty4Ak9kIlF0TDS/dKCotGPgv9K8v3lwYHmHMdj
   llHo+KAT/hWgaGqAsJVuUWSnIesJkCp8o3bkRjuy+UmNcCljTqRdTjELl
   kchHTurh+hKmycSjkAOruX9w9JxGEsYbaCbSm65guKVCSu8LuNHha4HU4
   Fp8KJFPxnxekVNyJQxE398R0irrXFqJY4nOBuNXSGLwJk2usvL3Vu/huK
   ziSiFBoHte0YMAX9/1YPqpucgEOqaeql373HW42kXxSN72zK8uX+uOU9/
   g==;
X-CSE-ConnectionGUID: t+vwlwxrRLKI8duDoSCSsg==
X-CSE-MsgGUID: q0lxp3gVRNmIersO25foEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39129514"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39129514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:14:17 -0800
X-CSE-ConnectionGUID: DvlgXxWgTZqP6iniT7WhKg==
X-CSE-MsgGUID: s5AYetY8TJ+Egl9KFJNEQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147538490"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 08:14:18 -0800
Received: from [10.246.136.14] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id C78FB20B5713;
	Mon,  3 Feb 2025 08:14:15 -0800 (PST)
Message-ID: <5341a60f-087b-485f-8988-4a57f1d0cee3@linux.intel.com>
Date: Mon, 3 Feb 2025 11:14:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Cleanup for Intel PMU initialization
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
 irogers@google.com, adrian.hunter@intel.com,
 alexander.shishkin@linux.intel.com, ak@linux.intel.com,
 linux-kernel@vger.kernel.org, dapeng1.mi@linux.intel.com
References: <20250129154820.3755948-1-kan.liang@linux.intel.com>
 <20250203131600.GD14028@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250203131600.GD14028@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025-02-03 8:16 a.m., Peter Zijlstra wrote:
> On Wed, Jan 29, 2025 at 07:48:17AM -0800, kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> The patches are to clean up different features. They all touch the
>> initialization code. There are some dependencies. So I put them in
>> a patch set to facilitate the review and merge.
>>
>> Patch 1 is to clear up the PEBS-via-PT on hybrid.
>> The original V1 patch can be found at
>> https://lore.kernel.org/lkml/20250124183432.3565061-1-kan.liang@linux.intel.com/
>> This is the V2, which only update the comments.
>>
>> Patch 2 is to clean up the 023H enumeration.
>> To close the discussion at
>> https://lore.kernel.org/lkml/20250127212901.GB9557@noisy.programming.kicks-ass.net/
>>
>> Patch 3 is to clean up the counter information update and check codes.
>> To close the discussion at
>> https://lore.kernel.org/lkml/20250127164406.GN16742@noisy.programming.kicks-ass.net/
> 
> So I can take 1 and 2, 

Thanks.

> but 3 is part of that arch pebs things, and that
> series is not in a shape I want to apply.
> 
> Also, I'm not at all sure 3 improves things, it might just make it
> worse.

There should be some improvements for the initialization code. At least,
we can reduce the is_hybrid() check and move the 0x23 enumeration in one
place.

Anyway, I will think more and see if there is more that can be improved.
Then, put it as part of the arch pebs code. We may have further
discussions with the V2 arch PEBS code.

Thanks,
Kan


