Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9B19A2A3;
	Tue, 10 Jun 2025 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749587240; cv=none; b=AHYi7GksAAZ9QEQqSI0IZvPfXc+6aFvMbkO7skvhtdR6Z/SwJmoF3+0j08xwSrewvXoubbYsPwNL/Hv+otjm3l4H6uVjBaZMkeddD/sHuyWgxQIR/7GTdkKgAwuWYjvbCiaEvoUEx7hEvwIoG1xCuPQ9zvxD1crWixcEJSjPkDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749587240; c=relaxed/simple;
	bh=a0fsVYzJm3+G88UxdB0B0y4YgNQAiF04/BzeC7n0bFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWd85FwAynetcYXEFFdDz1XPVABx8Wo/15O0uOPBLhC/fFN8r21lDGsBxQCiFOxRCuOmEgw6TdVrW34+6zOZ5kVOaknnf4kIWG2Kb6Whk3TSyLyfdPXUIUu7CGAajipk4/4LazzaemEIL0lDmu5zLuIhq/tdvA5QojGQB3+VruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPLsBrgK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPLsBrgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749587239; x=1781123239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a0fsVYzJm3+G88UxdB0B0y4YgNQAiF04/BzeC7n0bFM=;
  b=lPLsBrgK2giaK16KT6+XMW34OhWLMvjQFV9bnUfxGgFCVtMvoTFwiCH3
   UyxGEIyGuneLI1KbiXnviYxVHQlgWWN5s/ZwkK6i0RXQwwJcaJ3XF3AXk
   tfuIJ4Km38a035s9r5VKuEIlCnYjvqpauT/4B/TrYM+mpRDrjTCxIpZBD
   4bLgmUsUnhIs0WUQwUpjwKdSAATTwtV93bV4dOHsVFW33TZ97eY61Xlfu
   bZKLINMXwR0Tb+5c5rHRzNfDH/9UJ7unzT3ZFPiyfBcyqRBeoibMWDYAp
   5yPMmJLwGVrisrLAPmDWrWeHLGBXEVLsDc5ETLw8AhLe9ZYK4lsJGelgU
   A==;
X-CSE-ConnectionGUID: Noxo5AgHSsa+6KU9Sbq3zg==
X-CSE-MsgGUID: t0upGzxuQlO+xrBIKXuKPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51812187"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="51812187"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:27:15 -0700
X-CSE-ConnectionGUID: P3dVhLlURDeKL62XEUj5QA==
X-CSE-MsgGUID: hx91AJa8SgCOP+/SdpGtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146867111"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:27:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uP5Ys-00000005RbS-06B9;
	Tue, 10 Jun 2025 23:27:10 +0300
Date: Tue, 10 Jun 2025 23:27:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, ikepanhc@gmail.com,
	hmh@hmh.eng.br, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <aEiVHXI4vS9BDOPW@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610192830.1731454-2-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 03:28:25PM -0400, Mark Pearson wrote:
> Create lenovo subdirectory for holding Lenovo specific drivers.

Assuming Kconfig entries have mostly been copied'n'pasted, the rest LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


