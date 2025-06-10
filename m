Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0B17A301;
	Tue, 10 Jun 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562420; cv=none; b=aMbDtSrLWNbtNf2DDwwAh2po/7GfGO/ydkvZGRxzohYxRvMhd01aGZon/vOExl9y/IpNczHs9r3iDl847xmG5u1EVlsDWQx0xYtJq36FHgMn0jmkcadDp/iM/1CCZUWmsXse/kAy6rBjA6ceD1uEQmzseOrNFOfjhOVQZ8/J00s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562420; c=relaxed/simple;
	bh=4eF9/CmotdESBddggte8FL/5iJIVylN8R74UX+xQaak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYJJfTSSfpSfDtFVvBYghlOS98ajGueq5ETnnv/auEzCraqkbJa7BmOeVCBe5cfJdtRCzwg4mDuEBvxeELvhOF2d+HiYjmIdjGGLmnY1BJ2rOT1Nkubv0UXQ7KxwaFo9y02GpIo8s5dKS1SRyYy4qapqG845hcRO9nR+5oW9Eqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8qrUIzH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8qrUIzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749562418; x=1781098418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4eF9/CmotdESBddggte8FL/5iJIVylN8R74UX+xQaak=;
  b=A8qrUIzHaXRRmYiEqY20P+GZO6RUiNAxDoBFcOywqp0TeTjPkiS38vWd
   kA5kZZEVkBMcHSmqnH19FKqCCrTBsAzf6NNebKYAs5N2VNCHiBS1TcE6g
   2LLvmdDrWzvNGsySH/9AP6MHOnkUB0Erw36/KQyeF8rvbbI1hbKojncF4
   9pV40xP5eHdsk4PY9MsJbwyKMc5y7tvP8ojhIfkyZ7NSkt+F5QQkgjjea
   MWTNN1kEdud8FRRTBWAzKgBEMiDcmJOtS69P9fvXJ60muGI5xHvZ//mAB
   2zncrVHlEIYLAgg7itjTlvuxC8NDc+ffojEms9HyHxIcITZzeSgG5Wci6
   Q==;
X-CSE-ConnectionGUID: 3fXDgfZVSkCdmM0X69haiw==
X-CSE-MsgGUID: MjHCugElSjOY3j9b9gLdqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55464395"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="55464395"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:33:37 -0700
X-CSE-ConnectionGUID: 67tGi3H5SDaALS0eLrw+yg==
X-CSE-MsgGUID: eWeYUNL+RHS8Glqniw5VYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="146712823"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:33:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOz6Z-00000005MWZ-2ZGq;
	Tue, 10 Jun 2025 16:33:31 +0300
Date: Tue, 10 Jun 2025 16:33:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, ikepanhc@gmail.com,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net,
	LKML <linux-kernel@vger.kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
Message-ID: <aEg0K1OE6zhL97me@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
 <b792059e-44d2-82c0-574c-76c3f6a3129d@linux.intel.com>
 <f3b5c138-5576-4c01-b177-7450f1e91d24@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3b5c138-5576-4c01-b177-7450f1e91d24@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jun 10, 2025 at 08:28:49AM -0400, Mark Pearson wrote:
> On Tue, Jun 10, 2025, at 3:35 AM, Ilpo Järvinen wrote:
> > On Mon, 9 Jun 2025, Mark Pearson wrote:

...

> >> +		serial = dmi_get_system_info(DMI_PRODUCT_SERIAL);
> >> +		if (!serial)
> >> +			return -EINVAL;
> >
> > This should not return -EINVAL as it is not a problem with the input 
> > parameters. Perhaps -ENODEV would make sense instead?
> 
> Good point.
> Unless Andy strongly thinks I should drop this bit, I'll fix in the next version

If maintainers are okay to take this approach (both Kconfig and C file
changes), I am fine.

-- 
With Best Regards,
Andy Shevchenko


