Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D34619F40B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747969332; cv=none; b=bQ78sBxEU9Y9wAGfS1hyaQGM2pH/Ym/+VprOb2LawecJ9UtdyWX8Oh8Tk6qzxWXPBNWI85N2sP62zOQZHctoC0takLWBDaLK5opm/9nXl6P6Z+ZqdAKlOT+Z17kPFhw6B24b6qj6klwzeA6kgVLUTlFaDce7e+ImLAjsD8ZYgTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747969332; c=relaxed/simple;
	bh=wplwYI7GgC9kB2y7v0LF84mYlsoFz02XT65yeJzSsCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9fxtMgraN08oWsbxREpceyws6JXvmF3uxdCnCs0JshQXXLNeRswJHqPrXCru+UeRbDjFKRUv3oCzXfYEmxQTD2duVAuv2BLnGqJ/E5ZrfARtS8MVC7KkUlwYRGVivNUnwPkjy3MDHVUjRcLNXrOwv8j/6Y3u8gwVlzchitdYlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFM2M7HH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFM2M7HH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747969331; x=1779505331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wplwYI7GgC9kB2y7v0LF84mYlsoFz02XT65yeJzSsCI=;
  b=mFM2M7HHvrhyBkJcughNOM02j67TGgjXIXwX5haRaKaeYsb7G9T+BNIM
   RHy8mtAwqSQhYQSKi206C3AUmjIDzl8P99CCECvHHDiI4zgqhlgRYtaX0
   2l2EKp3e8jTNV3oHCReM6tGDv87w3qhA5BTf5q8MvAo6G43eqvcGpp414
   vj7xPRfrcRhwAE3+TBjNDFB8kcYPnKjLl7g6afBKMNr+/sg27zzyFBeeJ
   Vw0Y9ZH0evjXW8/x32R13cgkIptu49GafhA0cX//gc1Ro8daZVASSoCma
   7xvE9dfJt0E7YA0j2fcu+TsNUXKW4c4EaEPpzdf3Nmz7JgDhxaxg85r7W
   w==;
X-CSE-ConnectionGUID: 9dqWZ9rwRPOfSpOgfmtGXw==
X-CSE-MsgGUID: OJdkBGNxQ8WJhiFVcG36MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53811562"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="53811562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 19:45:43 -0700
X-CSE-ConnectionGUID: lPJiDiioS8qyMY/cX+2KUw==
X-CSE-MsgGUID: rh8X+AASQBiFD9N6/1cKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="171873796"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 19:45:39 -0700
Date: Fri, 23 May 2025 05:45:36 +0300
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
Subject: Re: [PATCH v6 1/3] drm: Create a task info option for wedge events
Message-ID: <aC_hUHyLhaY40aSl@black.fi.intel.com>
References: <20250521153323.935974-1-andrealmeid@igalia.com>
 <20250521153323.935974-2-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521153323.935974-2-andrealmeid@igalia.com>

On Wed, May 21, 2025 at 12:33:21PM -0300, André Almeida wrote:
> When a device get wedged, it might be caused by a guilty application.
> For userspace, knowing which task was the cause can be useful for some

s/cause/involved

> situations, like for implementing a policy, logs or for giving a chance
> for the compositor to let the user know what task caused the problem.

Ditto

> This is an optional argument, when the task info is not available, the
> PID and TASK string won't appear in the event string.
> 
> Sometimes just the PID isn't enough giving that the task might be already
> dead by the time userspace will try to check what was this PID's name,
> so to make the life easier also notify what's the task's name in the user
> event.

...

> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
> +			 struct drm_wedge_task_info *info)
>  {
>  	const char *recovery = NULL;
>  	unsigned int len, opt;
> -	/* Event string length up to 28+ characters with available methods */
> -	char event_string[32];
> -	char *envp[] = { event_string, NULL };
> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";

Most likely there's no need to initialize these.

With above changes,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
