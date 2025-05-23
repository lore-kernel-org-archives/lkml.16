Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FFE191F6D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748000055; cv=none; b=e/zfzuc03JLdoj5+0Hp26+j2HayN/1WpvsWzGF1xzDFFYjxB1v9swZu+7fZg9PjN9tFSBtEDBLvBqqj8G56tVwpMYDUCIaKFQfOM7u8mgwH09BrRQ43YbWeA1N/GY0KjBtkR0kTDIqitEZtjowmRy9icnpVy+pYHRJW6VMINbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748000055; c=relaxed/simple;
	bh=MYfWXPtNFQT1KOOqC822XoD8Ig+VivQ64udlyOM9YfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cpk+r0K7P6Z9MVXWKvfzS6iwlilMGOKRxUbyGOxjCgujqpZdywHHl3qRsxfvOxRWYr8+ae7seNSRkEgaaMmT5XZNW4ouv+v8V4OdStDnvRG+SKSM5xndAyGq8S2WVEB/xa8DX+WY+3+HsCCmlG4kwfAJTGXbUbe9P4ElN1CSmuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iv8YGNCR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iv8YGNCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748000052; x=1779536052;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=MYfWXPtNFQT1KOOqC822XoD8Ig+VivQ64udlyOM9YfI=;
  b=iv8YGNCRrjwKxQ1G8xlqQbCyrQM/Ulea+/h+R2Y4dgAmFpcOt5llWLrq
   OtLQirTtgX/SibS7DbEG9X3fUl41wl+55OAPOIIUKOhV7p+xvvI/d7g7l
   COS7k2+R2zMlE/+4/6SjqhVr8qzJP7az5zURLiwCRPbZ/NQj7SWLrXoAw
   vWB/ip+1/siKYyA8/8WkqQEk/AJi4ErX5BuVmN2KO5YZjKqVPUsdoYbTJ
   b6M3T99tV7VzA1xzNVdolkttpnMNJOPY8l+D/uBBF3tzCLJiT6tFWOPrv
   JH/uWtre2ctgZf6uSmvSpLZKGnWDPQZAfFMeXWZDlEb11Sx9BUxT2JR7T
   g==;
X-CSE-ConnectionGUID: WHTAhFKASEOMmiNwC6/oGQ==
X-CSE-MsgGUID: Q3+9p2cKTeiAZ369H7uZUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50169903"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="50169903"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:34:08 -0700
X-CSE-ConnectionGUID: ievo+qiXQgGpHVyjzx9xew==
X-CSE-MsgGUID: lI09kxVaQOGWLQCmjpcNJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="141606037"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.101])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 04:34:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
In-Reply-To: <87sekztwyc.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com> <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com> <20250519-singing-silent-stingray-fe5c9b@houat>
 <87sekztwyc.fsf@intel.com>
Date: Fri, 23 May 2025 14:34:05 +0300
Message-ID: <8210f7fc0dbcfc5b1eea47ccb762c7e53b45236a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 20 May 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Maxime -
>
> I'm cutting a lot of context here. Not because I don't think it deserves
> an answer, but because I seem to be failing at communication.
>
> On Mon, 19 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
>> You still haven't explained why it would take anything more than
>> registering a dumb device at probe time though.
>
> With that, do you mean a dumb struct device, or any struct device with a
> suitable lifetime, that we'd pass to devm_drm_panel_alloc()?

I'm no expert in ACPI, but I think it needs to be a struct device
embedded inside struct acpi_device to implement the
drm_panel_add_follower() lookup for ACPI.

It would be natural to embed struct drm_panel inside struct intel_panel,
except we need struct intel_panel way before we have figured out the
acpi device. We need struct intel_panel at connector register time, acpi
devices currently get figured out after all connectors have been
registered. I'm trying to see if we can change that, but it doesn't look
easy. Separate allocation and initialization would cover that.

> Is using devm_drm_panel_alloc() like that instead of our own allocation
> with drm_panel_init() the main point of contention for you? If yes, we
> can do that.

As devm_drm_panel_alloc() forces embedding, and we can't easily embed
drm_panel inside intel_panel, even that would need a dummy wrapper
struct.


BR,
Jani.


-- 
Jani Nikula, Intel
