Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194E24889B;
	Tue, 10 Jun 2025 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586971; cv=none; b=Wjr+aBMbSvqrGIh7s551eLr+VHvo3gkJQz+UQDXiit6FGYO8Q3JZvHhmUg5/+A0A/FgMomSuy9ceRvXCec19K+iNAARH5ZGctNnxzoW1iXiUPTRqDfI43wmnjkXMT4hc+mgcHpAoDPe5HRxVY0WGu/MnVnY9IIiYGMhWejwSWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586971; c=relaxed/simple;
	bh=vbDwLegN4BUBvpYXglEaqbIzLIT07N8leHj3G127kVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5ENU4xt9QX3uSCSOQNZPIXjERDwZKGpDu4H7H7uYlCkVlsOBaeighcuxCYx2Y8IjfIFdEasIGdpdZMJJwgiIS6eGL/dhS5IKI6iM1aw1v1WKYUGDKvK1sso2u2m2mzkxcM68ATAnYjg0GMttAMIOeJI+dIeYhiwuBgBf5OJmTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/HB6LFb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/HB6LFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749586969; x=1781122969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vbDwLegN4BUBvpYXglEaqbIzLIT07N8leHj3G127kVc=;
  b=k/HB6LFbnmp5li6G6eUbxI/1Ljfg6RDBroNR7VbR1wGCq9hycuFmf9ez
   avG0KwmrNGbYzH9jPl2jLL+IfjXKis+lsdGeokSwBqsIiUT4u4gH0tBoK
   LDF5HkYpUceCMpWdh5JSNTzD4t4p3ReyIBr8h7VNpt4Gk3z0MH67qcjLb
   S7C2FX1sDxWeomo4opsB/UYaUQHZ2YQ6XQnzSMp7FKE5yFd7+nP9vw43b
   1gzAg5f3scTvm+ua+BHWbIVhUpEQCoFWAEHRarR+CtB2tAPHkBNfMJDXw
   2Gp0viVO2r7VQ9U5hM5Ymww8fdqdZxSgRHzqU4R9/XR1+1zpBd3heyuxq
   Q==;
X-CSE-ConnectionGUID: KeO77pRlSfK1zHUFCQntHA==
X-CSE-MsgGUID: 2mSAN0LpTzCBQUwV7cyh9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="69276511"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="69276511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:22:49 -0700
X-CSE-ConnectionGUID: RvTyyALoRBC+3Tpj5sFVwA==
X-CSE-MsgGUID: vjIlHbFnTEyci7HL5Yth0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="147516159"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:22:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uP5UY-00000005RYg-30TW;
	Tue, 10 Jun 2025 23:22:42 +0300
Date: Tue, 10 Jun 2025 23:22:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, ikepanhc@gmail.com,
	hmh@hmh.eng.br, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 1/2] platform/x86: thinklmi: improved DMI handling
Message-ID: <aEiUEjI2ZoZlO8Vo@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610192830.1731454-1-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 03:28:24PM -0400, Mark Pearson wrote:
> Fix issues reported by kernel test robot.
>  - Require DMI for think-lmi.
>  - Check return from getting serial string

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


