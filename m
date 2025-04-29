Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F8219300;
	Tue, 29 Apr 2025 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938028; cv=none; b=UtxBO0HhrzW1w9iFABxdlddDKbcVTFUOdxm2GxrEQ9IzGR2iTOuGSMOu1M/lUa0eoYixF6hHy20hD5viaBvXnzqwv+vBRlZTwIh3F4TktTK1igZzEvlRN6zZoNS5WLFicd6Eg1ZHl0AE7oUKU346aNHhUjJXwQ60owOw9fGvKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938028; c=relaxed/simple;
	bh=b9pHEZj3heKTlZy5IQ5f1pxQ0ApodYttIeoH2ZynHxY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=usHxo03UvKn9qrDmxFfpPLcemkde8YSHC6iZypcF0hp+aMZ4SCxESof/gN4xSGtDgz8rLJw+A5aPBT/iu+8ii9qksARBkl+z/aOB+ONUw151moUNvI8RWZVg+5SV/6dkInQuPuX0ZN9o48A8O7jdjBPwAmysPQ5pS4c9qv3zLsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdWtPgQs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdWtPgQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745938027; x=1777474027;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=b9pHEZj3heKTlZy5IQ5f1pxQ0ApodYttIeoH2ZynHxY=;
  b=JdWtPgQsr75zm+2BOlSw5SLhbOoXqexT1HCfFRZGQ3lEb9+B/BYUXMbk
   NBdgOeNdrYYgzmJrIFl4LHVx/59yF5LCqb3kn9vtlC/M+9DnTZGIQMCYS
   Feq/ohSiLzF3llbRKFwsBrF+GhoO3KBOIZzeV2U+4UVPfsEHnV2ggCUMc
   jBOwgP4RO/Jn5zN4KuWQfdcUh0akUUcyVXHguAT0Zu5F/vjvpIzd7u+EX
   zWhlPZX9qzS0S0KdCyA0VTUmEDT8XS9tQGa1Ah8x7Zr5NXSkZDtpYxnca
   oqKosuF86xZ3mVGOjCRhzK+ZtKYRakbvOB4Vl27HVqdz0dPAol6Xyvg3r
   A==;
X-CSE-ConnectionGUID: yp5kgKG9RYiP8ozBfj00Fw==
X-CSE-MsgGUID: wOe8HzHPQTqWebuGWiOC9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46812032"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="46812032"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:47:07 -0700
X-CSE-ConnectionGUID: 9KyEILGXTo+doilF6/iDSw==
X-CSE-MsgGUID: C5n49VtEQ8GTqYT01bKRkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138650151"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.205])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:47:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Vadim Pasternak <vadimp@nvidia.com>, 
 David Thompson <davthompson@nvidia.com>, 
 Shravan Kumar Ramani <shravankr@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250423083103.5240-1-shravankr@nvidia.com>
References: <20250423083103.5240-1-shravankr@nvidia.com>
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Support
 additional PMC blocks
Message-Id: <174593801973.3519.12131064364710157373.b4-ty@linux.intel.com>
Date: Tue, 29 Apr 2025 17:46:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 23 Apr 2025 04:31:03 -0400, Shravan Kumar Ramani wrote:

> Add list of events and counters from the following blocks: APT (ARM Processor
> Tile), GGA (Global Generic Accelerator), MSN (Memory Stasher and Navigator),
> EMI (External Memory Interface) and PRNF (PCIe Request Node).
> If any of the fields populated from the ACPI table (like apt_num) cannot be
> read, assign the corresponding block count to be 0 instead of failing probe
> to maintain compatibility with older firmware.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/mellanox: mlxbf-pmc: Support additional PMC blocks
      commit: ffde61d15f16aa0e59ef6fca92cb362c21956a77

--
 i.

