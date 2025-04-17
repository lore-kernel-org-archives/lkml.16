Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998522D7BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878295; cv=none; b=ts/8GRrgAvqdDnzXD0UACI+jIiY9fI8S7jr16w6oJfoxg99APlL6JHkhHn/w914WAcqV/cMJyUVYbiNqZLCAP/8CnjN5IIUxarwFwUk8otyxkE/uTvxloxzv/KzkNyR4xrryKeKh7IzgNdvn6TY32gnBIz26WI3kjpQHp05Bokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878295; c=relaxed/simple;
	bh=2eFZUqd8LNQyJ2AbgA5Q96JYQLgnSnZcWIgYSav7cuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaEdE1bW4XS0UiqE3dGtBxt3TuqVZ/qJX4XyajRS1muFa/xVAagYY3mf1/HMeprhp2+hSyg2JZ8uAPCyQO4TbC5ICS4jgGApeUy0gzlwZSfWRJhNGvr/6l1TU0OH1BM9wC4/5I6bzbmMk+/QfWZuIQJoQolqIV2usS+wfT8acFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1o1t+Ta; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1o1t+Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744878294; x=1776414294;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2eFZUqd8LNQyJ2AbgA5Q96JYQLgnSnZcWIgYSav7cuA=;
  b=X1o1t+TatgTw9yMDTlvdr6P2J7O2u8qt4QpTwKG6A0EuEHlseAUXsE5y
   dbZjIXqG6YoprKREfGU156OU2FPi9eXdTcQZlwnsH0UQ8jTnuTQRhFavV
   CveDnOATDxxnI8cmlQowJ/KH9ChFBFvnbtmyEy6yDRtuwvYp5WPk0CTFp
   uhsE5zN0q9mQUPnG924WsYRnmCiiUp0Cyzuo12AqlV5U8LZSM2yEm5bMx
   +YxNWP9gQuCUIZDWBotQ1Db5kEqQMR/MX/iTDaEL/l9Iwu/MMIuOoXF06
   x/o1jJgaFLh+HypJyONfD6n5aQT1UMPpEQq5h333Ii1Ch7I13S82TrbZC
   g==;
X-CSE-ConnectionGUID: JcIr7ihxRtGAvtBF0ukKnQ==
X-CSE-MsgGUID: SQh8+EFeQdCbZyxRAnqLmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46350947"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46350947"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:24:53 -0700
X-CSE-ConnectionGUID: nYI263VVTYeLdPq9t8m1vg==
X-CSE-MsgGUID: 5abUC2BQTG22nurUQtYJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131632704"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.128]) ([10.124.245.128])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:24:49 -0700
Message-ID: <2d101164-724d-490f-b080-b53f99034175@linux.intel.com>
Date: Thu, 17 Apr 2025 16:24:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] perf: Make perf_pmu_unregister() useable
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, ravi.bangoria@amd.com, lucas.demarchi@intel.com,
 linux-kernel@vger.kernel.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 james.clark@linaro.org
References: <20250307193305.486326750@infradead.org>
 <20250307193723.525402029@infradead.org>
 <a0e3eccd-314a-4073-a570-0fe7b27c25c8@linux.intel.com>
 <20250417080725.GH38216@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250417080725.GH38216@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/17/2025 4:07 PM, Peter Zijlstra wrote:
> On Mon, Apr 14, 2025 at 08:37:07AM +0800, Mi, Dapeng wrote:
>
>> It seems this patch would break the task attached events counting like the
>> below command shows.
>>
> Right, found another report for that yesterday.
>
> ---
> Subject: perf: Fix perf-stat / read()
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Apr 16 20:50:27 CEST 2025
>
> In the zeal to adjust all event->state checks to include the new
> REVOKED state, one adjustment was made in error. Notably it resulted
> in read() on the perf filedesc to stop working for any state lower
> than ERROR, specifically EXIT.
>
> This leads to problems with (among others) perf-stat, which wants to
> read the counts after a program has finished execution.
>
> Fixes: da916e96e2de ("perf: Make perf_pmu_unregister() useable")
> Reported-by: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
> Reported-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lkml.kernel.org/r/77036114-8723-4af9-a068-1d535f4e2e81@linaro.org
> ---
>  kernel/events/core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6023,7 +6023,7 @@ __perf_read(struct perf_event *event, ch
>  	 * error state (i.e. because it was pinned but it couldn't be
>  	 * scheduled on to the CPU at some point).
>  	 */
> -	if (event->state <= PERF_EVENT_STATE_ERROR)
> +	if (event->state == PERF_EVENT_STATE_ERROR)
>  		return 0;
>  
>  	if (count < event->read_size)

Good to know it has been fixed. Thanks.


