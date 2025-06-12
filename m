Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C2F170A26
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749760774; cv=none; b=FXCJN4R/P4c3pHqBUpOF7aWieeW2PoTJsXGBNdBlf2CKsAqY5osH47pkaWEhClXNRQELP3SLsVUMdmgGTs0l4t9X5YM3UOqVfowB2kf05zc1NaNb7yEW0HqKsq1ONRC0zAoKL4OPWgBhcI1VeHG84hVlTjqq4b09sJWBlnR6HEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749760774; c=relaxed/simple;
	bh=5BmQuQ2Jd84gEDbo3C7bGMgpE6AM2wqblqvktJaY5rE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=j81mK+lBtg+E6CI/3wFoU0cIeizPiEJoTXIwQkYn3g0QGnWgt9vYQGHcOq84MDZLFqCaX/pXZqBVQKaGl46i5AGStLOubTzU6RPeDXSR4Ugfx5df+8P5JUl60IENHV/i2e8cISylWQjo8AVYJ4MsgiSEl1udNU2GbUmFPQ/RYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7c0078J; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7c0078J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749760773; x=1781296773;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=5BmQuQ2Jd84gEDbo3C7bGMgpE6AM2wqblqvktJaY5rE=;
  b=O7c0078J8rzcVrDFSbwGF/SAVg8W155BaaJPjcMH7+YvUEVsrm/IPH9A
   v0BUZG9spA4yKY5uj2Ji+0EL58n7p7a1TA1dPDhen+aCTYgS1yFoYdh+2
   SL7sukgNljn8ZKWBwVMaBaCQoZhsY6F6QU1fq3t7wu7+DbKGxI6yevwjT
   mEU/v6HHpuHSL3ZG9BKUClYH3lpvxmerPpOZPJ+u8DN3hcD2JcuaIT/6L
   vtUayi5yNFYiU+RBxjfOlF8ZeXegnI2TUKKIslwuWMVio38ZsmwpOpbKY
   jyhzvN15DD4Ff6UUYda4Gb2zNAB8WK5boGH4afvcYMkMs6vu4uAlrTcpa
   w==;
X-CSE-ConnectionGUID: 94t36wDcSayeWCFJcHlrVw==
X-CSE-MsgGUID: yIqj+2jcTc2c0hANeITpzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51829986"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="51829986"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 13:39:32 -0700
X-CSE-ConnectionGUID: xBvlgrQURPO8x6FfYwqy0Q==
X-CSE-MsgGUID: OZYBGpbQREmAC/u0/3Hy3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="170813756"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 13:39:31 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 07A1120B5736;
	Thu, 12 Jun 2025 13:39:29 -0700 (PDT)
Message-ID: <7470f1da-db48-4b32-b3a1-d9fec2a3c694@linux.intel.com>
Date: Thu, 12 Jun 2025 16:39:28 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V2 0/4] perf: Support Panther Lake uncore
From: "Liang, Kan" <kan.liang@linux.intel.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com, linux-kernel@vger.kernel.org
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
 <f3315aee-f783-4be0-aec7-c8c18eb6e4d2@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f3315aee-f783-4be0-aec7-c8c18eb6e4d2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peter and Ingo,

Ping. Any comments for the series?

Thanks,
Kan

On 2025-05-28 11:24 a.m., Liang, Kan wrote:
> Hi Peter and Ingo,
> 
> Could you please take a look at the patch set? Please let me know if
> there are any concerns.
> 
> Thanks,
> Kan
> 
> On 2025-05-07 10:34 a.m., kan.liang@linux.intel.com wrote:
>> From: Kan Liang <kan.liang@linux.intel.com>
>>
>> Starting from the Panther Lake, the uncore discovery table mechanism is
>> also introduced into the client platforms. The difference is that the
>> portal of the global discovery table is retrieved from an MSR, rather
>> than MMIO space.
>>
>> The first two patches provide a generic support for the extension of the
>> uncore discovery table mechanism.
>> The rest patches enable the uncore PMU on Panther Lake.
>>
>> Kan Liang (4):
>>   perf/x86/intel/uncore: Support MSR portal for discovery tables
>>   perf/x86/intel/uncore: Support customized MMIO map size
>>   perf/x86/intel/uncore: Add Panther Lake support
>>   perf/x86/intel/uncore: Add iMC freerunning for Panther Lake
>>
>>  arch/x86/events/intel/uncore.c           |  7 ++
>>  arch/x86/events/intel/uncore.h           |  2 +
>>  arch/x86/events/intel/uncore_discovery.c | 89 ++++++++++++++++++------
>>  arch/x86/events/intel/uncore_discovery.h |  7 ++
>>  arch/x86/events/intel/uncore_snb.c       | 79 +++++++++++++++++++++
>>  arch/x86/events/intel/uncore_snbep.c     |  4 +-
>>  6 files changed, 166 insertions(+), 22 deletions(-)
>>
> 

