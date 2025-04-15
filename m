Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD01A2632
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704046; cv=none; b=EEwJmqQ0xCzz8ZDVxWf0IBxDhccRJtn8hK+ytZ6LKMQMw6sAq0OFOE/7q991JcnyQ1EUoRigpr49NES4uksVWACe7emS/OIEPOrO8fg9DFoUcCygvLeQOLXPob4fNbqjTErZhm50W5FHUhBjGiFZ85o7OxtnUfpj4eC1qpdzEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704046; c=relaxed/simple;
	bh=4Ur2iLFXVNDMSA4UyjCsAo3d//HF4XrSG3il1Wfcctc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=byCKBtC2/7fXKOrLjYrM3fbn6FpuQwthGcvUAEgk20q5/qVhQ2Ia/NBpaJ4WP34D52tgvtKIAiquFXcG2ePDs+e6EZb5U0h7/wAFzree/oxewS37OrNVwdI0rpw/yhiybkYdIGBUjNOKujqK3zr76jcG4G8GnWDpmWN8XD+E6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3SyIZZm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3SyIZZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744704044; x=1776240044;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=4Ur2iLFXVNDMSA4UyjCsAo3d//HF4XrSG3il1Wfcctc=;
  b=D3SyIZZmLveSWSFpz/ISlJoGJcwPXVfx1rICpaMsIHMfreG6VFA6u6Ep
   hwxVOtfaLyk53TurClnbcqoz053se19+pvMXUX25fGwvQi02IwXa6iyw6
   ti1PwkatmihI5EoSon455T0xtYH3Ozvdz7Uhi/+wWsHsjVO6b4Kh0w5yq
   sKjBdBXX7a1HvZHM8PhjeXiVDsqwgfVyBApEU8b6ffhLPGfQ3Ud5AtZGR
   KQMfZHte4NfTfOJVjigpekyxEgtU77OJfpHBaDUXIATLkBEUbF1xPLBJJ
   f7zI/VRj9nFiDv++Ag3qAYRgfTT199PuQA6ySDG/9XKrVQYozev8Y/0dY
   g==;
X-CSE-ConnectionGUID: aDca0G4sSSmNfOQi9tjqlw==
X-CSE-MsgGUID: 8kSIUBWITmy3atnGSMacrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="48899216"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="48899216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 00:59:37 -0700
X-CSE-ConnectionGUID: uilGWqnDRbKxbfHhE4Q5fA==
X-CSE-MsgGUID: R80a86u/SQKUjfMQ31ACHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="131029783"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.249])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 00:59:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Linxuan <chenlinxuan@uniontech.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen Linxuan <chenlinxuan@uniontech.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
In-Reply-To: <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
 <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 10:59:28 +0300
Message-ID: <87sem9svmn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> On x86_64 with gcc version 13.3.0, I compile kernel with:
>
>   make defconfig
>   ./scripts/kconfig/merge_config.sh .config <(
>     echo CONFIG_COMPILE_TEST=y
>   )
>   make KCFLAGS="-fno-inline-functions -fno-inline-small-functions -fno-inline-functions-called-once"

The change looks good, but I'm guessing the real explanation is that you
have CONFIG_DRM_I915_PXP=n and that appears to be broken.

Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

But how do you want this merged?


BR,
Jani.

>
> Then I get a linker error:
>
>   ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
>   kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> index 9aae779c4da3..4969d3de2bac 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> @@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
>  
>  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
>  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
> +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
>  
>  #else
>  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> @@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
>  	return 0;
>  }
>  
> -#endif
> +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
> +{
> +	return false;
> +}
>  
> -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> +#endif
>  
>  #endif /*__INTEL_PXP_GSCCS_H__ */

-- 
Jani Nikula, Intel
