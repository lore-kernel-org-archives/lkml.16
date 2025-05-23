Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6C1C5D7B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996882; cv=none; b=sggwyvejsXMlFN3FbUgeDmcwDCeO9Zzd5nG8pJV6OiG9yktElj7KGvx4fL3TCs0XMPe0p3jninZn/KAR0JM0efHCim3xkUEOIRnBHkMvXETbLG6G6h3sJY+TMAnXoeyKUMbI91R4Ftsyqn0roi3ZsuBw8xnwi1MiJ+ihEinXpjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996882; c=relaxed/simple;
	bh=nEueIcfRiyFlM9JkkbxdtqIn/vSOGnTCKiQsAJa4RCU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rfdXPxS8fVKMJebXpvtAyeXtRM0sMnbbHkI9glINpGkPjTRcF1AH0l3egX/oc89wvsZDRzGw0Oe39CxgDB56+MTjiv9Uid0jtl0IVXQEh/NlQ+/xsGIPVlFCdDJlmgdPEbIAcAJ7LxD/0TBOidOcyzbna/7JzeiCdmR2YxUG9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cki2cogb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cki2cogb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747996880; x=1779532880;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=nEueIcfRiyFlM9JkkbxdtqIn/vSOGnTCKiQsAJa4RCU=;
  b=cki2cogbApLShAGHAqKl5TkeDkiTJ/SabpYZ3xHpflN5DHhL9rsGKQ86
   7V10mgxwRpfuCjiR2J7C+2YAXLVDJdO801NuvxWfBhukSAfAwOwE/vy7U
   uoJ95eQ2R3O1/a9HfiEZ9cuDqexL3ut952vDE787iO5+IPbus/AkiLGzw
   8yX8JlY3KQyvo8n1sCdUEKKV6csVAgwuPcAexNmlqGzHLP0P5Wvznc4Ye
   uB6KVSnbiTDGLBuHyrFHz7wZP/liBICTyQ8zxXefpxD+FXMtYgsL26eb3
   FO+pGUUGxkmygQQ4tJhqRPSnftess4EsgmYNI6aQPxb34zC70zrfr+UmI
   g==;
X-CSE-ConnectionGUID: 6c/YkEY5RtueSbwOYr0dgA==
X-CSE-MsgGUID: T7V/0SIdRJyYbr6O6ZckEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53846623"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="53846623"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 03:41:20 -0700
X-CSE-ConnectionGUID: QXrMci0mQIy2FUKp0YAN4g==
X-CSE-MsgGUID: jixBy+B7TKeijkliPvQv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="145050860"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.101])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 03:41:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: long.yunjian@zte.com.cn
Cc: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, fang.yumeng@zte.com.cn,
 ouyang.maochun@zte.com.cn
Subject: Re: [PATCH] drm/i915/display: Use str_true_false() helper
In-Reply-To: <20250523141422844GEA-yzba-OvN0lZirDsS-@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250523141422844GEA-yzba-OvN0lZirDsS-@zte.com.cn>
Date: Fri, 23 May 2025 13:41:14 +0300
Message-ID: <5ee0e214018c1a0cdf279cef5dabd4851a12a647@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 23 May 2025, <long.yunjian@zte.com.cn> wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
>
> Remove hard-coded strings by using the str_true_false() helper.
>
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 8d0a1779dd19..0e3e62468902 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/debugfs.h>
>  #include <linux/string_helpers.h>
> +#include <linux/string_choices.h>
>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
> @@ -972,7 +973,7 @@ static ssize_t i915_dsc_fec_support_write(struct file *file,
>  		return ret;
>
>  	drm_dbg(display->drm, "Got %s for DSC Enable\n",
> -		(dsc_enable) ? "true" : "false");
> +		str_true_false(dsc_enable));
>  	intel_dp->force_dsc_en = dsc_enable;
>
>  	*offp += len;
> @@ -1183,7 +1184,7 @@ static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
>  		return ret;
>
>  	drm_dbg(display->drm, "Got %s for DSC Fractional BPP Enable\n",
> -		(dsc_fractional_bpp_enable) ? "true" : "false");
> +		str_true_false(dsc_fractional_bpp_enable));
>  	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;
>
>  	*offp += len;

-- 
Jani Nikula, Intel
