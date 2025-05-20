Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77A226280C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747729428; cv=none; b=EtPS7mbvO6m1wCL9oSofhzcvReKI4VatTZjSfjg1GnrA09oGIAqEZ2+H/IZ+uJD9EYOWkjDwfDNMFjHUPHkUyr5KUGOK0I+w5xxVvdXCVKGvy8HwLLzSKjfRWJ7TfXt7qdOqvxNpLyyFGuIy5a/q9kTLaPTDowtC4TmmaVMS01I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747729428; c=relaxed/simple;
	bh=Z3mWB6fazXiDZ09nycUaCv631uVbUC/xPeimFswAWVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHY2uYAhUcZa9aB6fwGGuymGf+Di6vtgCQfVsSOfYRshj8Thnm1rF95xXgPcIDAxqt6iMt8jKwKBevAaBeV5Hg7Y6kDTNgo2cPoC+hf59aqk0SKW3UfQ8SJEU8bbzu1xARTwbu33spU62k1GPRsuE4DuFuwrAc4rC6kcLj2p7f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDI9gUlo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDI9gUlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747729426; x=1779265426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Z3mWB6fazXiDZ09nycUaCv631uVbUC/xPeimFswAWVQ=;
  b=jDI9gUlo2A4SAOEPmxbtC7O4R9upH5gQvaQczPex2R+goZUh+wOjAw5N
   vZMmlyhZe3fY5QuDr3aAK/0yS0N4SwZZiyDaHOydU4vRa0/YiB+1SNLyn
   HnpGsE3wMOUP4ZLBZSQxUrE00AFHIbRwOGa5Kn1fzDLkKxLWeNRQuVx+0
   pq98JPFvq3i/NzAMwnPl9SlHAqwIPnRwBFOpC6b8Wx7oxEQU2jPn82uTl
   cPN86G/h3cfzQZzUhzvsXG1fzgN7u/BvvaU1xTK88jxT7XGU1lKCur67f
   RA1DnHuAR52aPTJ/zAAwhR3lov2msztsnXu8+zag6Scz3Moj9/vLueHgV
   Q==;
X-CSE-ConnectionGUID: p22vShcCTPqPAge5VHfCpw==
X-CSE-MsgGUID: du8J0fOXQAOYRu2EBBeCTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="72161967"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="72161967"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:23:45 -0700
X-CSE-ConnectionGUID: lO27bfipSamXHy8546OwBg==
X-CSE-MsgGUID: O2M989Z8Snqk6KbkRuNhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139655504"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:23:41 -0700
Date: Tue, 20 May 2025 11:23:38 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] drm: Create an app info option for wedge events
Message-ID: <aCw8CtDyciN3EFVp@black.fi.intel.com>
References: <20250519220333.101355-1-andrealmeid@igalia.com>
 <20250519220333.101355-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519220333.101355-2-andrealmeid@igalia.com>

On Mon, May 19, 2025 at 07:03:30PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which app was the cause can be useful for some
> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what app caused the problem.
> This is an optional argument, when the app info is not available, the
> PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the app might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the app's name in the user
> event.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (for i915 and xe)
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v4: s/APP/TASK

With this in place I think it's better to use the same terminology
everywhere else for consistency (code, doc, commit message and subject).

> v3: Make comm_string and pid_string empty when there's no app info
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                  | 16 ++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             |  3 ++-
>  include/drm/drm_device.h                   | 11 +++++++++++
>  include/drm/drm_drv.h                      |  3 ++-
>  7 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4d1b54f58495..d27091d5929c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,7 +6363,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
>  	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index acb21fc8b3ce..a47b2eb301e5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -166,7 +166,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3dc7acd56b1d..c428d05a8e7c 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -542,6 +542,7 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   * drm_dev_wedged_event - generate a device wedged uevent
>   * @dev: DRM device
>   * @method: method(s) to be used for recovery
> + * @info: optional information about the guilty app
>   *
>   * This generates a device wedged uevent for the DRM device specified by @dev.
>   * Recovery @method\(s) of choice will be sent in the uevent environment as
> @@ -554,13 +555,13 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>   *
>   * Returns: 0 on success, negative error code otherwise.
>   */
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";
> +	char *envp[] = { event_string, NULL, NULL, NULL };
>  
>  	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>  
> @@ -582,6 +583,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);

Are we allowing callers to pass empty members?

> +		envp[1] = pid_string;
> +		envp[2] = comm_string;
> +	}
> +
>  	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>  }
>  EXPORT_SYMBOL(drm_dev_wedged_event);
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index dbdcfe130ad4..ba1d8fdc3c7b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1448,7 +1448,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
>  	else
>  		drm_dev_wedged_event(&gt->i915->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index c02c4c4e9412..f329613e061f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1168,7 +1168,8 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  
>  		/* Notify userspace of wedged device */
>  		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> +				     NULL);
>  	}
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index e2f894f1b90a..8a3368dfc7f0 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -30,6 +30,17 @@ struct pci_controller;
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>  
> +#define WEDGE_STR_LEN 32
> +#define PID_LEN 15

These are not shared macros, perhaps move these to drm_drv.c?

Raag

> +
> +/**
> + * struct drm_wedge_app_info - information about the guilty app of a wedge dev
> + */
> +struct drm_wedge_app_info {
> +	pid_t pid;
> +	char *comm;
> +};
> +
>  /**
>   * enum switch_power_state - power state of drm device
>   */
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..8fc6412a6345 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -482,7 +482,8 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method);
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_app_info *info);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
> -- 
> 2.49.0
> 
