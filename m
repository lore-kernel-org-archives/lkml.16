Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF661F540F;
	Mon, 10 Feb 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188441; cv=none; b=O6+3+Kjwl5iH5S+Vd6sWao49OszYAYQwQO8kkMEIyYHKSgtbW0gWB02wr3f9D1KOEKIHHeNMMadDBVz1rA0rejCA3VC8XOoSCGLVPweGtudMLrq8efzFXd9e5o/VLVLWEE2nEcvXzX2tNNdyG9UrZm98egnXqWZe8bO/k0KY4J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188441; c=relaxed/simple;
	bh=fwBsOwRN1A/Jp7S+cgWPSpot60MFhxTObVWy6wVXaWY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PXPu0xqcYtF2QTW0mLXP84wmJeB/yp1Mou66zj40w9RO1h9KyyX9ez+hnN5pwXORJE5s2R7Z69XoBkyDrvnjq8JlUizGCM4S0pYKQ9j0ScJiNCkUKdB5omzNNSIPoIiM5n+FeV2dyCeKP1+dZIPvMdoXiB7d2scS1uR7q9WOa6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3QKSvvP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3QKSvvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739188440; x=1770724440;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fwBsOwRN1A/Jp7S+cgWPSpot60MFhxTObVWy6wVXaWY=;
  b=P3QKSvvPSTE7vHbbLPll4gsnEQMxlMiV/jwdasDJqH+uW5eSxTbRi6Da
   oir3b79zEYEFTpribBseRMl3JHPSGSoMv68jyWRbezdxQr3R4KsobEMTn
   /UlpsE6iYiWpug8YzYbfrj5JePdWpyV2jms4Om0XZQUVWucWdmx1tTxXO
   gCLNFkfYZfvdG+bMF4sQfCgTqyfxOkfNt/nArvv1YrSqZoGHz7pCZiOBs
   mT+IE+EVBnT+/eySNUbdlrnENcfB/UbOFxtcVjrPAShyrhNCdjldHY3GB
   UDD4o9vxpYnhayVOAraBEfa12ScvSP3QUZRla3PgCFhnOHUYL1qjBs7Pe
   Q==;
X-CSE-ConnectionGUID: Fm5Ke0DgQkeTprdrYyzznA==
X-CSE-MsgGUID: xs8tzpQ+RumJ4t6+5auusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39000496"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39000496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:53:59 -0800
X-CSE-ConnectionGUID: FiJr0id7RuC+tG52n0RUwA==
X-CSE-MsgGUID: XcnpHrcASLSf1HV2vEzS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="143036069"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:53:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Feb 2025 13:53:53 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/14] platform/x86: alienware-wmi driver rework
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
Message-ID: <fd4524a6-0b1f-d929-61a5-b1ad188c938a@linux.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Feb 2025, Kurt Borja wrote:

> One more correction. I apologize for the noise!

Applied to review-ilpo-next. Thanks.

-- 
 i.

> ~ Kurt
> ---
> [11/14]
>   - Fix .driver_data of Alienware m16 R1 AMD
> 
> v9: https://lore.kernel.org/platform-driver-x86/20250207140743.16822-1-kuurtb@gmail.com/
> 
> Kurt Borja (14):
>   platform/x86: alienware-wmi: Add a state container for LED control
>     feature
>   platform/x86: alienware-wmi: Add WMI Drivers
>   platform/x86: alienware-wmi: Add a state container for thermal control
>     methods
>   platform/x86: alienware-wmi: Refactor LED control methods
>   platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>   platform/x86: alienware-wmi: Refactor thermal control methods
>   platform/x86: alienware-wmi: Split DMI table
>   MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>   platform/x86: Rename alienware-wmi.c
>   platform/x86: Add alienware-wmi.h
>   platform/x86: Split the alienware-wmi driver
>   platform/x86: dell: Modify Makefile alignment
>   platform/x86: Update alienware-wmi config entries
>   platform/x86: alienware-wmi: Update header and module information
> 
>  MAINTAINERS                                   |    4 +-
>  drivers/platform/x86/dell/Kconfig             |   30 +-
>  drivers/platform/x86/dell/Makefile            |   45 +-
>  .../platform/x86/dell/alienware-wmi-base.c    |  491 +++++++
>  .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
>  .../platform/x86/dell/alienware-wmi-wmax.c    |  768 ++++++++++
>  drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
>  drivers/platform/x86/dell/alienware-wmi.h     |  117 ++
>  8 files changed, 1523 insertions(+), 1276 deletions(-)
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>  delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> 
> 
> base-commit: e75394bbf4838857f57b6c5d00f1e56c46cd6c11
> 
