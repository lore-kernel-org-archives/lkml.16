Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817F017A314
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570924; cv=none; b=lKE5fZQi3bHifFywQB6aX8vr75kRldlJm8+UcKjmdwtM+i08FHErkL+aTlRaoKG92QOKypqc0lt/uUFonp7Ws0T8OLwjSqeRdOIKAc4n4rsZUQvHJkF/2rd64HFm6TgXOYDr5Q03rHESkOeSbRPTzwrmF1mBcRT8wMGS7jnt/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570924; c=relaxed/simple;
	bh=Z6Vt1Z3I1guU2hYZHvh38GC960N/SVGBXhEuV6XKHd8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BF/xIwzh+lrChU5hybj0Fz5bPuIkdmQWKjSZewCxuobtdwfMLuV5R2CBAlr5UQFrezd92DmG1Mvd93nFUnRNEWzohqp7AXkpRJuJessd1JCVRNokPnk9zLtaJRu7yHgc3lGTiTweBkDpnbuBVLrivtPVDFSHUUhgrOOciYirwHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZenOmOZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZenOmOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745570923; x=1777106923;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Z6Vt1Z3I1guU2hYZHvh38GC960N/SVGBXhEuV6XKHd8=;
  b=nZenOmOZ5ziDHHih9KPvtFfoAnqID04/w5z+3pCySzqnv7OYEguiKAuK
   HAlBeZOna8gzveZtQigwiDWYN2pfE9FpaKruNsBOkCC8vGMu4aDKTg3vK
   q87f4ptdqHpnOjcz5yM9o2kmmGCpRYz3NBAb9pgNV+ubefKDuQX28bniV
   w7NQIXbNJKAoGf6j656/peFM8bVprazO5iokr+qSgn6sriMtdMvp787QR
   XXCQgXhj95oxKWNN4olwgNcX//tvq1w651VViwIqxbjeOm3fIWT1CqDmY
   zwWGnixdbMsfz7J/srxcNz91CaIT4ehhBwIPhx3Qbx/i0+4Y5NvD4kwad
   g==;
X-CSE-ConnectionGUID: xcww+ymaQKOYFpNGkNn+aQ==
X-CSE-MsgGUID: aoGgRozWSD2QI5MxzEh93A==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51047831"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51047831"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 01:48:42 -0700
X-CSE-ConnectionGUID: vre/oGHZT5aTBp+dRxeO/Q==
X-CSE-MsgGUID: ZPjFH3Z0Tne3nrt8JpseLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132741259"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.83])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 01:48:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John
 Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Karolina Stolarek <karolina.stolarek@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 04/20] drm/i915: Avoid open-coded use of
 ratelimit_state structure's ->missed field
In-Reply-To: <20250425002826.3431914-4-paulmck@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <72ee57b8-9e2a-4cad-aaa0-1e3353d146d8@paulmck-laptop>
 <20250425002826.3431914-4-paulmck@kernel.org>
Date: Fri, 25 Apr 2025 11:48:31 +0300
Message-ID: <87selwy6cg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 24 Apr 2025, "Paul E. McKenney" <paulmck@kernel.org> wrote:
> The i915_oa_stream_destroy() function directly accesses the
> ratelimit_state structure's ->missed field, which work, but which also
> makes it more difficult to change this field.  Therefore, make use of
> the ratelimit_state_get_miss() function instead of directly accessing
> the ->missed field.

Acked-by: Jani Nikula <jani.nikula@intel.com>

For merging via whichever tree is convenient for you. Please let us know
if you want us to pick it up via drm-intel.

>
> Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
> Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: <intel-gfx@lists.freedesktop.org>
> Cc: <dri-devel@lists.freedesktop.org>
> ---
>  drivers/gpu/drm/i915/i915_perf.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index de0b413600a15..1658f1246c6fa 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -1666,6 +1666,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
>  	struct i915_perf *perf = stream->perf;
>  	struct intel_gt *gt = stream->engine->gt;
>  	struct i915_perf_group *g = stream->engine->oa_group;
> +	int m;
>  
>  	if (WARN_ON(stream != g->exclusive_stream))
>  		return;
> @@ -1690,10 +1691,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
>  	free_oa_configs(stream);
>  	free_noa_wait(stream);
>  
> -	if (perf->spurious_report_rs.missed) {
> -		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n",
> -			  perf->spurious_report_rs.missed);
> -	}
> +	m = ratelimit_state_get_miss(&perf->spurious_report_rs);
> +	if (m)
> +		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n", m);
>  }
>  
>  static void gen7_init_oa_buffer(struct i915_perf_stream *stream)

-- 
Jani Nikula, Intel
