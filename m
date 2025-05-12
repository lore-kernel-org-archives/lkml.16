Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF112512F1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075030; cv=none; b=Ki6wxGlTA0a/Gf95uCW3NcQsloDBVxY1m1OZBsA+wRUUqxtbNzPfuXhnr6wYjheGRDtI7kKYYoO8qLC2w1f9anZo8lMbVLKLvBRSQ2HuOW9Tp8XrUObvc/GKZLqBYXh6NB3zS5rXIM5ep0cWmPRCArVAI6LbukIbCeYcZkY0/Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075030; c=relaxed/simple;
	bh=V6/A2+RPCIUIQLcxtTCK7QdC1pnW1hlHvfVaLXm/ky0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVYaa2xmOjoe6tKEBNb1YnZSuIMvCUjSqLb+DsK9r8FQrpc2EUnE0GR0WqEBJpsXa9XKhFTU0/jdfW7fH3Qb69O8H9cMFI+kIXERDFqK6wN5k7hwRQZRATBnWuIWlxf8bQw6xVdyZ44Z/NHcL/kjI8D0ZFrnqmPAwumxHG/JEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFUVNnVh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFUVNnVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747075029; x=1778611029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=V6/A2+RPCIUIQLcxtTCK7QdC1pnW1hlHvfVaLXm/ky0=;
  b=SFUVNnVhOZgPDluEiFS/4ULOAXUtMV1ldhBQwPwWqrDen1FN/HDLmoS9
   mXCmGXYJqtpj3KbcFF4M8gmX7qvAl+kUktLm8Bcn7QtJd1xYMCRriDy/4
   xcj4D+rjUiB6ONMbpajGvGqqURXwNR0UfK4+SP5P8/33Ok5wYfUG6NUxe
   NKpHyUudaeX2UnXUNSdmwEH7fcahFeCXcoZ7bw30vcsJlarW6ya/J6LG8
   ntmPwzur1WvJmutnIE9wm+nYsi8j+FVMqxgQPGAPHYAs+DG1KOEhaO3Xt
   K9KGNKnc3A5HfO70t7X1NZdMLFBFAPxisoa16zWT/1f1/5quPm39tckxQ
   Q==;
X-CSE-ConnectionGUID: oSqDDwPbQuOBRzyjD9qwZw==
X-CSE-MsgGUID: AZ8rk3kJRk2P/D1rFRNMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48883940"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48883940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 11:37:08 -0700
X-CSE-ConnectionGUID: OoRlbdaERlSO23xZjhjMJw==
X-CSE-MsgGUID: yp++5YOQTvyecN9aypMRpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137298516"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 11:37:03 -0700
Date: Mon, 12 May 2025 21:37:00 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
	rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/doc: Add a section about "App information"
 for the wedge API
Message-ID: <aCI_zIJXm6rV5RO5@black.fi.intel.com>
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-3-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511224745.834446-3-andrealmeid@igalia.com>

On Sun, May 11, 2025 at 07:47:44PM -0300, André Almeida wrote:
> Add a section about "App information" for the wedge API.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 69f72e71a96e..826abe265a24 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -446,6 +446,21 @@ telemetry information (devcoredump, syslog). This is useful because the first
>  hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
> +App information
> +---------------
> +
> +The information about which application (if any) caused the device to get in the

I'm wondering if we should change the wording to "application involved in device
wedging", or can we guarantee it to be the cause?

My limited understanding is that we'd still need the full dump to find the cause,
if it's possible to also note here.

Raag

> +wedge state is useful for userspace if they want to notify the user about what
> +happened (e.g. the compositor display a message to the user "The <app name>
> +caused a graphical error and the system recovered") or to implement policies
> +(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
> +information is not available, the uevent will display as ``PID=-1`` and
> +``APP=none``. Otherwise, ``PID`` and ``APP`` will advertise about the guilty
> +app.
> +
> +The reliability of this information is driver and hardware specific, and should
> +be taken with a caution regarding it's precision.
> +
>  Consumer prerequisites
>  ----------------------
>  
> -- 
> 2.49.0
> 
