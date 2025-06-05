Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0791C32;
	Thu,  5 Jun 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110636; cv=none; b=jh1ROOtnMBa4xtwtg86xuEGxAJQ1drHWz9lTXSPxUkJ/HTQFzhLy/N3OApElWbc3Xt94qFW1/nZQF358BoK+3Tm4dR0OulRoKKQUColLXZZY1TCdWWZuR/UZg38g+zWw9U6JC5lM2je7aHS0Xr7dV3oqc96uCyIRReBunDMMpus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110636; c=relaxed/simple;
	bh=GVU4Gvw7/QkvUOMwYa1MyK0yJkaG+dpjnoUe5fhC0Rk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KI47RKB6WfJmcQETtR7pxQ6y4bQdtOhZvXgD2jYb8Gc1mrbWUulkF4/lm+VUuyH7QXnMfNURijWa5uRyfu1n1eAeMc9dRRMiktK9Vgz5JELRnUGcHwUhVrGHfl0uySbyRh3d9IewNX8QJMlIocsKgZn/35IAqrCFUMsjV54xpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BblZ+dja; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BblZ+dja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749110635; x=1780646635;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GVU4Gvw7/QkvUOMwYa1MyK0yJkaG+dpjnoUe5fhC0Rk=;
  b=BblZ+dja/B8dEr3owGeVj9uM2Bzt9X2twX6zLm+MUoJUyg2JaRMBG61/
   wjOUxiHsYa8d2WOARJKlXl7vhlMR5O3SjRJO8fHxWwA6CGVL/tLcdoISt
   Xz/kM24/aCWg4XktlyrBxRq3WCD95peFWg87HJYsOYw4qDVe9nlCGjtXT
   cuzSwsGrxkvPNt8quFQ+jIsmivbm0vjxM8yC9znfA0U0yp4whTIeab7ad
   YWx71OtMLxePYktT7zaWEdPtvSRtC8VQEvxIir0f897Ly9SyUWmGNCkUh
   sfIbt2w5b6XivB3c491Z57y+eJv8vDH9R3LbbRE9vS4h0CuF++lPqQDvK
   g==;
X-CSE-ConnectionGUID: 7M6EV79fTye151pnJrMKIg==
X-CSE-MsgGUID: Kpsvjn6kTFub3BvNHykpQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51310352"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51310352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:03:54 -0700
X-CSE-ConnectionGUID: 0ZvabdKoQbGkfvKSzEZZSg==
X-CSE-MsgGUID: LpaLe2XjRFe4TDXFeEy9MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="145389173"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:03:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 5 Jun 2025 11:03:46 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, corbet@lwn.net, ikepanhc@gmail.com, 
    hmh@hmh.eng.br, W_Armin@gmx.de, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
In-Reply-To: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
Message-ID: <d6df0dcf-5786-0ad6-dd30-3a8c9f16426e@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 Jun 2025, Mark Pearson wrote:

> Create lenovo subdirectory for holding Lenovo specific drivers.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>  - Rebased to Linus's latest as requested
>  - Updated documentation reference
>  - Updated MAINTAINER file
>  - Removed X86_PLATFORM_DRIVERS_LENOVO as I was worried about
>    maintaining backwards compatibility for the distros.
>  - Removed 2nd patch in series splitting out hkeys. That will be for
>    the future

+# Lenovo x86 Platform-Specific Drivers
+# Lenovo X86 Platform Specific Drivers

Any possibility to be consistent in formatting that? :-)

Why does the admin guide contain a history book?? It should be guide for 
this version of kernel, not what was there in 2.6.x era ;-D. Please don't 
add to that any more, preferrably remove the history part afterwards in a 
separate change.

Other than those mentioned above, diffing per vs post seemed clean (I 
didn't check where the empty lines got added, Andy seemingly did already 
:-)).

-- 
 i.
