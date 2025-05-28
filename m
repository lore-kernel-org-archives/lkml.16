Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F5427815C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445859; cv=none; b=AyOahkUJBWMJs8CaDGrpLaqMrZAwm4Jt6Hx7IypOSPWS1sHMg6c70HBfXHAUXnb0M8+dHvVKX6nEK97REwOjtx5D/VbTS358oE26Bs1t6qQmcwT4Pj4IEVnu02P4LtNybHKjj0NmWwlfWOOofgEZDOPocHr0GFhOv3jRTDmgaO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445859; c=relaxed/simple;
	bh=wG0FNq+jW0uKrq/TkvyGn3RC8V3YAAUFr33TFVTJx30=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=um4sA0fAr5969VBAuNfTFf2b1hTxX0ZQ/qrbLZ448kK2VQQOU+JaLlEZc7X0fNbGbhTNpO5NIElZCbtcim8DaXHFsf2IWYY0RyUf++13WA8J1ZMShDnwSowTFzRxrYSmhKJS7NztoRuqBq47cnwOz98RBPXAPYDD97X/wGqOVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9w0yxk8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9w0yxk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748445858; x=1779981858;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=wG0FNq+jW0uKrq/TkvyGn3RC8V3YAAUFr33TFVTJx30=;
  b=H9w0yxk8gVNXPAm2o0N/jRDB5aBv08eA+ynt8uNfr0uJHPqRLeYAfG6N
   DVXbtJkRn3unAgTVTRx8/OD1WLkB3sI3TpADmfVmFftFr+hVPnKvIUH/5
   JtJsoF6BxqBtKvNzXCY4FG3Ards6gWpkJdq/9WAChefqLmDreVj8Y1nYM
   adrbdUIKVZ/dsdx/BAjNT3H8iHH1HuWZAYOR2r1dqNfnaPDxUMKW3/3Km
   2fAbA8zSXUNjeLb1RvK7lEmU+yrrs0gNIA/z2et8EiagB7mZyt6tGhcH4
   L/jXkbiPL5jftbcmUQjnF4ElFAUM04ZNAMs2lv8LDbNREKMWgzKTieIBP
   A==;
X-CSE-ConnectionGUID: +WPQ3i6qSNG+puzvZPNA+Q==
X-CSE-MsgGUID: YFEe6fI+Qi2GgUbxBv7eng==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50583032"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50583032"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:24:17 -0700
X-CSE-ConnectionGUID: KzDSNHTZSj2/KJIvqehVeQ==
X-CSE-MsgGUID: ylJGr8CLS4GzcLk9tP8n7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="174270773"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:24:17 -0700
Received: from [10.246.136.52] (kliang2-mobl1.ccr.corp.intel.com [10.246.136.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id ED18820B5736;
	Wed, 28 May 2025 08:25:53 -0700 (PDT)
Message-ID: <f3315aee-f783-4be0-aec7-c8c18eb6e4d2@linux.intel.com>
Date: Wed, 28 May 2025 11:24:14 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V2 0/4] perf: Support Panther Lake uncore
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com, linux-kernel@vger.kernel.org
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peter and Ingo,

Could you please take a look at the patch set? Please let me know if
there are any concerns.

Thanks,
Kan

On 2025-05-07 10:34 a.m., kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> Starting from the Panther Lake, the uncore discovery table mechanism is
> also introduced into the client platforms. The difference is that the
> portal of the global discovery table is retrieved from an MSR, rather
> than MMIO space.
> 
> The first two patches provide a generic support for the extension of the
> uncore discovery table mechanism.
> The rest patches enable the uncore PMU on Panther Lake.
> 
> Kan Liang (4):
>   perf/x86/intel/uncore: Support MSR portal for discovery tables
>   perf/x86/intel/uncore: Support customized MMIO map size
>   perf/x86/intel/uncore: Add Panther Lake support
>   perf/x86/intel/uncore: Add iMC freerunning for Panther Lake
> 
>  arch/x86/events/intel/uncore.c           |  7 ++
>  arch/x86/events/intel/uncore.h           |  2 +
>  arch/x86/events/intel/uncore_discovery.c | 89 ++++++++++++++++++------
>  arch/x86/events/intel/uncore_discovery.h |  7 ++
>  arch/x86/events/intel/uncore_snb.c       | 79 +++++++++++++++++++++
>  arch/x86/events/intel/uncore_snbep.c     |  4 +-
>  6 files changed, 166 insertions(+), 22 deletions(-)
> 

