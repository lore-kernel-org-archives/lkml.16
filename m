Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DF442C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747379009; cv=none; b=r8XuXYzKVe3x1q29JHC/mLa19p6rnO5AZ+SL4z56pGPz9nE2/zLQuJhKtceakA4RcPInk06rmswVJrhoveQ2DHTJO9IaLp3haDsrqFGY+CP2j0X5OhiiXFJWaORV1zK/BYoVC9PjCrbipr+ke0p8G+XyZ1tBd1nhch5RLWTwTCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747379009; c=relaxed/simple;
	bh=yhtrPlJ9qmNyVnIMkIRuxU21wfsbr+ewaXgbpucVwKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4e/ceQg/aOutoN/tEL477Sj+7Iq5vjPN5YQIiKMnSU0jtjnhpro758Z3aA3/nzxNp3R5E2NVHqzVhc4RPD4dl0iDuJ9pBtazd+w/U2+coYJXgh/FyT3+Rl/thkyCZ5a+EGrxYM25usrNr2XSW2btYSkdoOGQumoDNLy8hJCTNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxXWUALT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxXWUALT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747379008; x=1778915008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yhtrPlJ9qmNyVnIMkIRuxU21wfsbr+ewaXgbpucVwKI=;
  b=PxXWUALT6CJroVYhm487f0msRNuVn7xqyn40PdHmgQWQ3pEpWsbtyNob
   KnzeDSWnkxV9JyrQQYX8mHAM8ycztj86AsT+7eLDudKAOfx1rQrYe2Oxj
   5+IXM33+PIik82V6Uf28RMUA9y+Hq47daKCpQH1nzw25op0iBGpQghpZ/
   Ag864dm6JoB5s8Zr0RnPFFgVDloDE6XSe7MUhhUCKDob9EnOb08+Ko1qJ
   Aha5d6dbIuWRfBAPNs4Bf9DDJtrBJaKSfGT4A0o1wkNcBNh9b41Av95bd
   4HKF1fVh1qPIc2Nv0ZDxIL0124VFvEim3KPr1jOVto9Yoxiia3S6TP4IF
   A==;
X-CSE-ConnectionGUID: dVYSaEYDT9iDHd0nK9Nfzw==
X-CSE-MsgGUID: YVQi0j8mQgCI7fbR9HA45A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49477437"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49477437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:03:27 -0700
X-CSE-ConnectionGUID: vXCqJWCVTqKRwiW6nA2nnQ==
X-CSE-MsgGUID: ZVjwAZNZQ0OfN1RXidy/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="143724385"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:03:23 -0700
Date: Fri, 16 May 2025 10:03:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/doc: Add a section about "App information"
 for the wedge API
Message-ID: <aCbjN9lqP4ZWV_lY@black.fi.intel.com>
References: <20250512203437.989894-1-andrealmeid@igalia.com>
 <20250512203437.989894-3-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512203437.989894-3-andrealmeid@igalia.com>

On Mon, May 12, 2025 at 05:34:36PM -0300, André Almeida wrote:
> Add a section about "App information" for the wedge API.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v3:
>  - Change "app that caused ..." to "app involved ..."
>  - Clarify that devcoredump have more information about what happened
>  - Update that PID and APP will be empty if there's no app info
> ---
>  Documentation/gpu/drm-uapi.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..3300a928d8ef 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -446,6 +446,23 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +App information
> +---------------
> +
> +The information about which application (if any) was involved in the device
> +wedging is useful for userspace if they want to notify the user about what
> +happened (e.g. the compositor display a message to the user "The <app name>
> +caused a graphical error and the system recovered") or to implement policies
> +(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
> +information is available, the uevent will display as ``PID=<pid>`` and
> +``APP=<task name>``. Otherwise, ``PID`` and ``APP`` will not appear in the event

Personally I'd use Linux specific naming for consistency.

s/APP/TASK

But in any case,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> +string.
> +
> +The reliability of this information is driver and hardware specific, and should
> +be taken with a caution regarding it's precision. To have a big picture of what
> +happened,

Nit: what *really* happened

> the devcoredump file provides should have much more detailed
> +information about the device state and about the event.
> +
>  Consumer prerequisites
>  ----------------------
>  
> -- 
> 2.49.0
> 
