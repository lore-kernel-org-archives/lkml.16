Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30E727F010;
	Fri, 27 Jun 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014819; cv=none; b=thFQgE4NUODYOsEZs9OUHLa+7UjKQp+KCPOk2G+6BaBAYu+O47kcPE5rjbkqUyHCDP96dPl0mmKg4yX4qN3t1v0LjV8XWA40vhlIZLjPA6iVQeHVRb3+QTHldKENU7QM/+TijN3qq5Rb5BH9CTyEzL6caCFV7wwS6Uwq49uGkjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014819; c=relaxed/simple;
	bh=OFGGtjh9lLAJpazPZciAUtiSAFEWyX3zAFFdP5TVjw0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ofH4DBCcHK0eoSR1aEQPHPUqCPy/H7pQ+cmSQ8fnlYlHJIalEoC3HOCEnb7R8mADHW0deAbsmf5tLLV4/ZghtixA2Rjw5O/O1glbD/X44szZ54OedTszqwdtyTFFtQHbV7jUByftFwRriYCYxMWXl7COmgScbmuYP3413+eEUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USx4WGd6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USx4WGd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751014817; x=1782550817;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=OFGGtjh9lLAJpazPZciAUtiSAFEWyX3zAFFdP5TVjw0=;
  b=USx4WGd6Dnh6DjAt53BvJrgNiRpOGlQpvdaHSnwaQfEouOX/d8hYke4Z
   lrwrpXouO5mp5qKDs8OGzURvrDF6WlDj2DiMaqnXbRlmJg1FUPmkLDMic
   D9AjaT54WSo2NH5R+QYKb/RuRXbJ6hFyHSChRrZNCi7XXsfXIqE2sGj1o
   vCF9ZLe9sLqGrX8u0NBWWEaJAB0caphhxX8osnmSTRcEz+pTE8FG3eMGx
   mFXq5gGzAs1l1HUScHLqY5kG8zLvQjTPz3CLLe3SRzcd0Bbzr6TvkuvIv
   BA384VMmy3N57GzT8ig7Q9tI3sJmZazS4ULLuTr07SOD8Ym4mlxDXuglT
   g==;
X-CSE-ConnectionGUID: Vqhc97DRTrq7JhGcQB601g==
X-CSE-MsgGUID: aCneS0ZKSU+FI49aQHM/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40944766"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="40944766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:00:15 -0700
X-CSE-ConnectionGUID: JqUZiAKiR46VDN/gPt4Vyg==
X-CSE-MsgGUID: emlWJGyaSl2vPUpGyYcGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183790537"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.146])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:00:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kevinpaul468@gmail.com, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] workaround for Sphinx false positive preventing index
In-Reply-To: <20250627071628.30258-1-kevinpaul468@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250627071628.30258-1-kevinpaul468@gmail.com>
Date: Fri, 27 Jun 2025 12:00:07 +0300
Message-ID: <462a34d3027f22a65c129e2305c7aa4d4fda0e43@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 27 Jun 2025, Kevin Paul Reddy Janagari <kevinpaul468@gmail.com> wrote:
> Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
> indexed in the documentation because there are structs with the same name 
> and sphinx is only indexing one of them, Added them to namespaces as a
> workaround for suppressing the warnings and indexing the functions

I think there's a Sphinx bug about this that should be referenced.

Cc: Mauro

> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst  | 2 ++
>  Documentation/gpu/drm-uapi.rst | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1..da865ba1c014 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,6 +357,7 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm_fourcc

I think using c:namespace-push and c:namespace-pop is the better
option. Otherwise c:namespace will be in effect until the end of the rst
file or next c:namespace.

I'm not quite sure what the namespace names should be, but for
referencing anything the names here are pretty bad
e.g. gpu_drm_fourcc.drm_format_info.

As a workaround this does hide the worst fallout, but it's not even
generic enough to handle structs and functions with the same name in the
same file. I'm not sure if there are such cases, but I wouldn't be
surprised if there were.

A more generic (but also invasive) alternative would be to have
kernel-doc always put structs/unions in a namespace, say "type", so
they'd never conflict with functions. The automagic referencing in
kernel-doc could produce those references. The downside is that manual
references should include type.foo, and the produced html also contains
type.foo.

BR,
Jani.


>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c :export:
>  
> @@ -473,6 +474,7 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm_modeset_lock
>  .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
>     :export:
>  
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..37a2bc461326 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -554,6 +554,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
>  .. kernel-doc:: include/drm/drm_ioctl.h
>     :internal:
>  
> +.. c:namespace:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
>     :export:

-- 
Jani Nikula, Intel
