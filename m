Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F5E1779B8;
	Fri, 31 Jan 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320204; cv=none; b=XlrwWA51Hca+gKnvz+QIpcstrVmKuNGo89cIhhQNuL53MHJlP0oPPmjWtd4KA813ghOnN7R6U5pWZ7hUczhECL67YYmVXkk0FevtG3Y7tIEtXA2HpaVtWlZD+74NwJDJAEGy+4oCK65MnyrreowzIho2lei8+HN+OzewSPuuSOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320204; c=relaxed/simple;
	bh=ZWG0gtq9Ld/u0lq9c4WKxP1tC7iM89FIhVVtWYEbjGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhW74ISqW08uaRP28Oc3aG9j0ALlMvY6w7SjNNEB0y4s9Rl6T8pYjxffY59/mndlXuw7x1ukNfgKgSIoHXBZ/m2mxOueqVXIZI3XfXkw1kNhQqskq8wIP5ujWjcF+jHuSWyo81nddMiW93iFmERHPeyGDZmGO8ORNerxOaCI9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WApixKRD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WApixKRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738320204; x=1769856204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWG0gtq9Ld/u0lq9c4WKxP1tC7iM89FIhVVtWYEbjGo=;
  b=WApixKRDda0jOVIjQopahOWbh+/VwX3HXq+ma0Ioa6XBVSHlAEQUQh+1
   psu0vg+3d0kTUhycI7pxy5FeFqLaXIJJCB/9yTAlZBw9HjOx76qPA3TEj
   j5qPeFApr8zlfAW1bxt6duGCCwJfNXXp7cXdOJz48usdAtfKhO65nKzah
   Fi4MqFbFqcZihfki/yxw19EcoMufyvnzN1gih89jOX1BKNIlEqe70l1NJ
   TpWboqTljdz6KkuD0uBOQkNKkYjk0r3OnEYQDXAlXUN9U/QGM6DodC6CU
   Mx7KaDFjnbGOOYbJqcRlmQRCcQwV5jOgkvQzd/P6R8uRofrStmTsxjoUC
   A==;
X-CSE-ConnectionGUID: +kk2ZOh4T3OPPQUTR7tk8Q==
X-CSE-MsgGUID: 5PHwBFk3QOWyJCD6KJCT9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42637334"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="42637334"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 02:43:23 -0800
X-CSE-ConnectionGUID: pyLhMJXUSO+Mm0U9Y0on5Q==
X-CSE-MsgGUID: dAP8UAtLSMedtqjIOcR2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114592164"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 02:43:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tdoUW-00000006wRn-0QEo;
	Fri, 31 Jan 2025 12:43:16 +0200
Date: Fri, 31 Jan 2025 12:43:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <Z5ypQ3VdJw_pLKBr@smile.fi.intel.com>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130212843.659437-1-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> for the taking - but the vast majority of device drivers concerned with
> virtual devices do not use this and instead misuse the platform device API.
> 
> To fix this, let's start by adding a simple function that can be used for
> creating virtual devices - virtual_device_create().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> 
> So, WIP obviously because I wrote this up in a few minutes - but this goes
> off the idea that Danilo suggested to me off-list of coming up with a
> simple API for handling virtual devices that's a little more obvious to
> use. I wanted to get people's feedback and if we're happy with this idea,
> I'm willing to go through and add some pointers to this function in various
> platform API docs - along with porting over the C version of VKMS over to
> this API.

So, if it goes anywhere, please be sure that:
1) it's implemented in a separate *.c and *.h;
2) it won't abuse header inclusions and add into dependency hell;
3) it's documented.

Additionally would be nice to have one user to be converted to see how it may
be done in practice.

-- 
With Best Regards,
Andy Shevchenko


