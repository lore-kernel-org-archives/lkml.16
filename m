Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C2B187553
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880138; cv=none; b=NWzz5DqDGrWyxaFPfQN4wU45blw5kFT4sJg4z3HnL+xugkTb2rPPN/yuH4FrBurXUrTBaXOneS74eqa9ApsqfnZMCT8lCL1+m8iT1CRjYZPz73m2lC3RCd6vO3j9PQuthNsf04rGQIDI4aR/CZhOhRruqbabcO0CX4IbDV3i6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880138; c=relaxed/simple;
	bh=HY0IJdZ0xUrLxc/f5sk/9tuJaU9s69AQTdtLNO8zLPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XDEq3EUpn4JEXpW5OLIs611CQ2581+VjhYw+oZb3E+IYOptcvxH2krqHuR+rVtKxPBFP39B9kddKBl7rPwLLwOYIFLbCSCYGvmQ8dM1yHvAP2uwMytqNKKwv8YrMBnc7/xdOPibDj5K/iTCPB1iEhEq1LLdawvCu4CWjUIiGNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lC6/c2R7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lC6/c2R7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744880136; x=1776416136;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=HY0IJdZ0xUrLxc/f5sk/9tuJaU9s69AQTdtLNO8zLPo=;
  b=lC6/c2R7axAaVMOz57lb30QDs/RGIQwufP8PxMso7imC4GhvQh+KHu9w
   bkF9mckeFgcNO6ziOg1d9jjJ/+cSY8HbYPBDuTZYTzfDGaGeQOxW3cWrj
   4zJPcyn+GM1FqfD9pC94ItiuFZdLmOSlIieDfgsh2kxri+VzGznHjWkUE
   nE6PQLwte4QtnOFfTckXwyIq9TpxC3g0jvaqF+4HFJHwVM5a9jsBbBjwy
   iQnESXAtZNlX7rlhMKLUIGQCWExx4XPN3C/a7vGFXzip3XK+VSc1yiDjE
   QI+8jiOluVbSZ+6nggAeQdi2eXg4qUvpcvcymg4sBXoJCWqpEYW4xMl3i
   Q==;
X-CSE-ConnectionGUID: gQBvCp87TEiFzfub1DFmHA==
X-CSE-MsgGUID: 9r1MpsodS4CDGweeJZIYFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45691688"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45691688"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:55:36 -0700
X-CSE-ConnectionGUID: MRFAzu9HQV21dmpc4DID/Q==
X-CSE-MsgGUID: FfP6mRDuQm+XTQKAEhNA5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131284750"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.139])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:55:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luke Hofstetter <ldhofstetter@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil
 Khatri <sunil.khatri@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, Dominik
 Kaszewski <dominik.kaszewski@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Luke
 Hofstetter <ldhofstetter@gmail.com>
Subject: Re: [PATCH] drm/amd/include: fix kernel-doc formatting in amd_shared.h
In-Reply-To: <20250416091143.67704-1-ldhofstetter@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250416091143.67704-1-ldhofstetter@gmail.com>
Date: Thu, 17 Apr 2025 11:55:26 +0300
Message-ID: <877c3jp3pd.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 16 Apr 2025, Luke Hofstetter <ldhofstetter@gmail.com> wrote:
> when doing make htmldocs, Sphinx complained about in-line documentation
> in enum DC_DEBUG_MASK, so reformatted documentation to define each
> member in kernel-doc comment above the enum instead.

Why? What's the error message exactly? I think what you have now is the
preferred style. If it really doesn't work for enums, kernel-doc should
be fixed.

BR,
Jani.

>
> Signed-off-by: Luke Hofstetter <ldhofstetter@gmail.com>
> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 124 ++++++-----------------
>  1 file changed, 32 insertions(+), 92 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
> index 4c95b885d1d0..7074ec3b467f 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -255,120 +255,60 @@ enum DC_FEATURE_MASK {
>  
>  /**
>   * enum DC_DEBUG_MASK - Bits that are useful for debugging the Display Core IP
> + * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
> + * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
> + * @DC_DISABLE_DSC: If set, disable display stream compression
> + * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
> + * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
> + * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
> + *	 							if mclk switch in vblank is possible
> + * @DC_DISABLE_MPO: If set, disable multi-plane offloading
> + * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
> + * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
> + *	 				does not default to it.
> + * @DC_DISABLE_PSR_SU: If set, disable PSR SU
> + * @DC_DISABLE_REPLAY: If set, disable Panel Replay
> + * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
> + *	 				If more than one IPS debug bit is set, the lowest bit takes
> + *	 				precedence. For example, if DC_FORCE_IPS_ENABLE and
> + *	 				DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
> + *	 				precedence.
> + * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
> + *	 						*except* when driver goes into suspend.
> + * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
> + *	 						there is an enabled display. Otherwise, enable all IPS.
> + * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
> + * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
> + *	 					  eDP display from ACPI _DDC method.
> + * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
> + * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
> + * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
> + * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
> + *	 					        path regardless of reported HW capabilities.
> + * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
> + *	                              path failure, retry using legacy SW path.
>   */
>  enum DC_DEBUG_MASK {
> -	/**
> -	 * @DC_DISABLE_PIPE_SPLIT: If set, disable pipe-splitting
> -	 */
>  	DC_DISABLE_PIPE_SPLIT = 0x1,
> -
> -	/**
> -	 * @DC_DISABLE_STUTTER: If set, disable memory stutter mode
> -	 */
>  	DC_DISABLE_STUTTER = 0x2,
> -
> -	/**
> -	 * @DC_DISABLE_DSC: If set, disable display stream compression
> -	 */
>  	DC_DISABLE_DSC = 0x4,
> -
> -	/**
> -	 * @DC_DISABLE_CLOCK_GATING: If set, disable clock gating optimizations
> -	 */
>  	DC_DISABLE_CLOCK_GATING = 0x8,
> -
> -	/**
> -	 * @DC_DISABLE_PSR: If set, disable Panel self refresh v1 and PSR-SU
> -	 */
>  	DC_DISABLE_PSR = 0x10,
> -
> -	/**
> -	 * @DC_FORCE_SUBVP_MCLK_SWITCH: If set, force mclk switch in subvp, even
> -	 * if mclk switch in vblank is possible
> -	 */
>  	DC_FORCE_SUBVP_MCLK_SWITCH = 0x20,
> -
> -	/**
> -	 * @DC_DISABLE_MPO: If set, disable multi-plane offloading
> -	 */
>  	DC_DISABLE_MPO = 0x40,
> -
> -	/**
> -	 * @DC_ENABLE_DPIA_TRACE: If set, enable trace logging for DPIA
> -	 */
>  	DC_ENABLE_DPIA_TRACE = 0x80,
> -
> -	/**
> -	 * @DC_ENABLE_DML2: If set, force usage of DML2, even if the DCN version
> -	 * does not default to it.
> -	 */
>  	DC_ENABLE_DML2 = 0x100,
> -
> -	/**
> -	 * @DC_DISABLE_PSR_SU: If set, disable PSR SU
> -	 */
>  	DC_DISABLE_PSR_SU = 0x200,
> -
> -	/**
> -	 * @DC_DISABLE_REPLAY: If set, disable Panel Replay
> -	 */
>  	DC_DISABLE_REPLAY = 0x400,
> -
> -	/**
> -	 * @DC_DISABLE_IPS: If set, disable all Idle Power States, all the time.
> -	 * If more than one IPS debug bit is set, the lowest bit takes
> -	 * precedence. For example, if DC_FORCE_IPS_ENABLE and
> -	 * DC_DISABLE_IPS_DYNAMIC are set, then DC_DISABLE_IPS_DYNAMIC takes
> -	 * precedence.
> -	 */
>  	DC_DISABLE_IPS = 0x800,
> -
> -	/**
> -	 * @DC_DISABLE_IPS_DYNAMIC: If set, disable all IPS, all the time,
> -	 * *except* when driver goes into suspend.
> -	 */
>  	DC_DISABLE_IPS_DYNAMIC = 0x1000,
> -
> -	/**
> -	 * @DC_DISABLE_IPS2_DYNAMIC: If set, disable IPS2 (IPS1 allowed) if
> -	 * there is an enabled display. Otherwise, enable all IPS.
> -	 */
>  	DC_DISABLE_IPS2_DYNAMIC = 0x2000,
> -
> -	/**
> -	 * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the time.
> -	 */
>  	DC_FORCE_IPS_ENABLE = 0x4000,
> -	/**
> -	 * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
> -	 * eDP display from ACPI _DDC method.
> -	 */
>  	DC_DISABLE_ACPI_EDID = 0x8000,
> -
> -	/**
> -	 * @DC_DISABLE_HDMI_CEC: If set, disable HDMI-CEC feature in amdgpu driver.
> -	 */
>  	DC_DISABLE_HDMI_CEC = 0x10000,
> -
> -	/**
> -	 * @DC_DISABLE_SUBVP: If set, disable DCN Sub-Viewport feature in amdgpu driver.
> -	 */
>  	DC_DISABLE_SUBVP = 0x20000,
> -	/**
> -	 * @DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE: If set, disable support for custom brightness curves
> -	 */
>  	DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE = 0x40000,
> -
> -	/**
> -	 * @DC_HDCP_LC_FORCE_FW_ENABLE: If set, use HDCP Locality Check FW
> -	 * path regardless of reported HW capabilities.
> -	 */
>  	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
> -
> -	/**
> -	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
> -	 * path failure, retry using legacy SW path.
> -	 */
>  	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
>  };

-- 
Jani Nikula, Intel
