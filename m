Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1440845C18
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613495; cv=none; b=NOnh2C5RWWodmWehrgfXKfOEC0QNWmc1Me5odoXWMQZgTmo5W5TlnVBLQ95dAAsIf6WrQueSB1rHRiyI/1Iiuy4nxse/xzwBwTCAotLfcXCM1UByHz4kVbcXAIjngdUeRDDxFvFMAlM5s8KIt4galRI6MduYUTgUF9q8rXggqsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613495; c=relaxed/simple;
	bh=+Ele0F1poW+d98mRXmolJyecgMIOJ5Yg0Z0vGLasXMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwOUsjV9/DB2DWJ8oh0BRem1bqm9GGSbJN2KJrx6AzTRe1qWS2bncYdufYVOgX1UbyCzqavDDsmz0wlgNGmQfofME2DXNNgiSh6Cf3AcvYL7qyPPLrzx0PLz7gmgfmncREbizYTlF0981rQXrg9oh6xzauTw0hrQDO5XUC1yp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mr5LhCg7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mr5LhCg7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744613493; x=1776149493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Ele0F1poW+d98mRXmolJyecgMIOJ5Yg0Z0vGLasXMM=;
  b=mr5LhCg7ePRN8b4ysheTJFx7w/zJQS2XgooTTaAT9rXuH3x/AHc5Q3no
   KCkI1Ify2zIVyRpGFP6fIfatPXLs18o9o3whK5EGYfPsTLAoSAyGcxird
   RfQ1nDCM1rFDMJc2nOEfFQDIUjnN/mcTnaonoHEy49r2GjEAQ/b65Kukb
   CAebOVkoW6dnGUXF+rILiG9wd6CLDqhOiKG96PO1ALC5D+Xw46UEAHloj
   mnt5R1bssATyn9TDRdyBl1+o69vp1OqwLPNX+bcpmk13wVh+i38PzkK6b
   B0suz93ETInEiaEy2z3zv4XdKH+A/9+8zMKuCgZ7hpsy5W04AM+cUiVRW
   A==;
X-CSE-ConnectionGUID: 6PR9JjgQQoOSRKRmwrdurw==
X-CSE-MsgGUID: e1Q3E1nFS5Sq0TsQ9WxzJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46203110"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="46203110"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:51:29 -0700
X-CSE-ConnectionGUID: g/VZw56JRP6WlA831XPG0Q==
X-CSE-MsgGUID: TU5W4yAoRUyNfwzJ82kq7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130279695"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:51:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Dey-0000000C9iZ-2r4k;
	Mon, 14 Apr 2025 09:51:12 +0300
Date: Mon, 14 Apr 2025 09:51:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alessio Belle <Alessio.Belle@imgtec.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] drm/imagination: avoid unused-const-variable
 warning
Message-ID: <Z_ywYNsYjuZy8v9x@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae4be5c-b115-405e-aa57-caeaa206775b@imgtec.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 10, 2025 at 11:22:05AM +0000, Matt Coster wrote:
> On 09/04/2025 13:22, Arnd Bergmann wrote:

...

> > Rather than adding more #ifdef blocks, address this by changing the
> > existing #ifdef into equivalent IS_ENABLED() checks so gcc can see
> > where the symbol is used but still eliminate it from the object file.
> 
> Possibly a silly question, but wouldn't adding __maybe_unused to
> stid_fmts be a simpler change here?

I'm not Arnd (and I just have read his answer), but I would like to add that
__maybe_unused should be the last resort as it has more cons than more invasive
solutions. In particular, it makes build time increase with a lot of work to
be made at link time, and also it might hide the real bugs when somebody simply
forgot to use it (depending on the configuration options) or so.

-- 
With Best Regards,
Andy Shevchenko


