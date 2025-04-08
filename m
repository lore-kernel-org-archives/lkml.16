Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4F207E18
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093910; cv=none; b=RJoqkThmuXPZ/RwmW4+BdfpUGT+WYve0djvgU8zXlZktYf4cRRvUr6Nn7Y1JYRygGC6adAOeHDDnEBeAPrpabi2LPMRGD0Jgdw6Hr3/qKQR3HVB4vkdplGC0VoC4c7LCSAkyV3WeSzikD52jmqvkYSIfenV1pkjBvmaWQ/RzFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093910; c=relaxed/simple;
	bh=Qp6kXPHYlHXPp7a4478Yj9Dljvp12+lbJBxpArDsEe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Acee6WpzHxbxHNKhH7ct1zy1Y2DfHZaAUviFwRFk+xKMQn2XISDmOxVXKcY5Eqf3SQ13Lhe3/nF3fKSM3TRQE0LiSofE+f/oA1AUCGp9iMSQY8NW7sNTND4+SijQx7jJJjxvpqtTK1cu2iqxKiT6MDe044je+YAbC+t75iIaSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ty7tgOXz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ty7tgOXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744093908; x=1775629908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qp6kXPHYlHXPp7a4478Yj9Dljvp12+lbJBxpArDsEe8=;
  b=Ty7tgOXz17tO31UUP55zL39/hvc07tVMltVrP0NPsvhi9M6qudgixLu5
   rJHfG49XQyd47icBsSyRlPN3bXOVoPOyH2OfK2qfDHrXbFd4V9zpsJ4sl
   rQQmxBjTk+ug9tsQTOy30TxPbb7uLKGY5c+cHfvMW2M+g1lI9ZqK7hHIS
   4/klvgr6dxCRVwVZa4d3OnaNes7QK8cBHIb04NzG4XH3bmRLi1ayVuizo
   q9Xk0Trkclw36pQS7hc9pYW/4OBIxVgozZ3IIHXFbmJt1aJCXgBiB6Rmc
   Q4TvkYLaRIIAFhP9E/snJpgQIQCBs92NPvzUuSI3pjgnoom1ohAUuqtmf
   A==;
X-CSE-ConnectionGUID: e00vp26aSBmwqpqgmBWRiw==
X-CSE-MsgGUID: CMRXic63QC+kdN7/H/QsJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44651576"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="44651576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 23:31:45 -0700
X-CSE-ConnectionGUID: +PcuRtnpRtWPMDSdAcuhYQ==
X-CSE-MsgGUID: SAIzYws+TWOd8sbrt8R1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="128503219"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 23:31:42 -0700
Date: Tue, 8 Apr 2025 09:31:40 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: jiangfeng@kylinos.cn
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, andrealmeid@igalia.com,
	christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Fix the length of event_string in
 drm_dev_wedged_event()
Message-ID: <Z_TCzOg2Q7Aeh-G1@black.fi.intel.com>
References: <20250408013219.26006-1-jiangfeng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408013219.26006-1-jiangfeng@kylinos.cn>

On Tue, Apr 08, 2025 at 09:32:19AM +0800, jiangfeng@kylinos.cn wrote:
> From: Feng Jiang <jiangfeng@kylinos.cn>
> 
> The format of the event_string value is `WEDGED=<method1>[,..,<methodN>]`,
> so method should be appended after 'WEDGED=' rather than overwriting it.

It's already appending it, the fix is rather for the potential array
overflow. So please update this in commit message.

> Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> ---
>  drivers/gpu/drm/drm_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..58babdab9e66 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -549,7 +549,8 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  		if (drm_WARN_ONCE(dev, !recovery, "invalid recovery method %u\n", opt))
>  			break;
>  
> -		len += scnprintf(event_string + len, sizeof(event_string), "%s,", recovery);
> +		len += scnprintf(event_string + len,
> +				sizeof(event_string) - len, "%s,", recovery);

Now that we allow 100 characters, you can keep this as a single line.

Raag
