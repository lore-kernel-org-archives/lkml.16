Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AE1D6195;
	Thu,  8 May 2025 14:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714776; cv=none; b=kw1XkX5jwK3ZU6aYA1BnuwdnFdIkiubFR9Dz6N/YJNehyFqM+9JJWBAtWVyqBWll1mnT2Pv1+xsLP+RWTbcTgyP/xDNQJ5vw10gj3z5fXusoeJbQ9rIImnjsbY2HOf1jgfygX+aqIKAj1BuzcV6JW7Djda/UwDQ0PSgMjlzXiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714776; c=relaxed/simple;
	bh=32/8Jvhnysr35wzEFLALrVHvT0vk1DBONh6gDqPky8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDGgieVy5WnEsHabAwYbg14x9Wztt+vtMAzw0BaTS17/qVkWB78PwaI2GjEr0REXfM6XKqrUsmuJL97yMftfyf2kqEb3Nc2X2WTIsI+aVukUdimswlN1ERGrPiqu4ObArJNlN2/gbwu30ydhYD6XWnXqHybFoc3FNOenZMjO11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYoxPWFF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYoxPWFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714776; x=1778250776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=32/8Jvhnysr35wzEFLALrVHvT0vk1DBONh6gDqPky8Q=;
  b=IYoxPWFFw0Ii7gOXrFY1PW2uwoKPvwxHjlmywaCKYP0+1pdwItisDPgH
   7UXayELSwsNrY4lj5TFukR5YOVnjjmjgHPBuh+Zp9D2orWJ4ezbq6p51k
   M+jWngNVmGmlMOt7vKPIRRwF9vLpzpGidj1m+Y9v4dRb6Wac9u3xZha2k
   YNjUXwZ4w7DMlZW5W91yYZcm6FY8gyTtF2L0VmruaU2x/XrUBuB8N9cLt
   IlUd+pFQweWwdJaOgOuHz6zXRfGry6kir6VzNFewKRJYQR+I7vwkgEgG+
   13H8vI8VpaWU2DOFd7bdQn4RTXtyWQ437KPG39jCvp/QJcntSK2B5N8F7
   g==;
X-CSE-ConnectionGUID: FfN/wDbgTE6Bq980W7Aepw==
X-CSE-MsgGUID: MTgU8FZ5RoWNPXz6fk3r0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48369126"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48369126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:32:55 -0700
X-CSE-ConnectionGUID: 6m4ImnWlSN+IiBuYyMby0w==
X-CSE-MsgGUID: 3Hk7sTD+Tmu9nvrdhnx+xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141523299"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:32:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD2Ir-000000048T2-33Wp;
	Thu, 08 May 2025 17:32:49 +0300
Date: Thu, 8 May 2025 17:32:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, ikepanhc@gmail.com,
	Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 2/2] platform/x86: export thinkpad_acpi handles
Message-ID: <aBzAkfJvVA04r-2U@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-2-mpearson-lenovo@squebb.ca>
 <6feeae5a-3928-8198-7ed6-2080c929d7c5@linux.intel.com>
 <c8ad9e6d-772d-4954-a3b9-ecafe7e3bdc7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c8ad9e6d-772d-4954-a3b9-ecafe7e3bdc7@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 08, 2025 at 10:28:26AM -0400, Mark Pearson wrote:
> On Thu, May 8, 2025, at 10:03 AM, Ilpo Järvinen wrote:
> > On Wed, 7 May 2025, Mark Pearson wrote:

...

> >> +EXPORT_SYMBOL_GPL(tp_acpi_get_handle);
> >
> > Please put these symbols into a namespace.
> 
> Sorry, not quite sure what you mean here. Could you point me at an example?

Use _NS variant of export.

-- 
With Best Regards,
Andy Shevchenko


