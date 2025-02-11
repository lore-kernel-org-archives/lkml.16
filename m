Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805AC1E47A8;
	Tue, 11 Feb 2025 18:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299826; cv=none; b=sHa435TsdN/t9uatECjat4/XUZ243SSZ7FfJIMBwMgHPV5yNNibitNIo+v2B4Vijep3Wc68wBpCmdDpzV+pg4MITTb4KBqW36tEo0R0rObuj34YwgNIZOrbUXALr6wLzNT9cPtDaPF/dWNORluLHn7IvkFHh6rWAIoH7MpBJK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299826; c=relaxed/simple;
	bh=bfPLwDMpcQGshUKyls/F2RDBUxnCt5e4VSo29/7bIO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lF4aA/Za7WfW8ZKZcC7aklNGChzTtJI64eQpyAIRgX85ncZirpNXrTY1RE3QJkFxkmIq7PxLD5R3XHGMJMyrTAXL0ytRoCiEtNJ6BtOQxL4YT/U5Y+rMZa9518VZTLAjN65fFPrTOZ9qD/K9oBWnzaQfA9TWQW+k2ERSrkGyjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ar58Fzed; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ar58Fzed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739299825; x=1770835825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bfPLwDMpcQGshUKyls/F2RDBUxnCt5e4VSo29/7bIO0=;
  b=Ar58FzedY9W0c9NgRNMilXRobUyuv14rzy5RCerzmzg5LNU8OE2iUe2L
   w2nbOzhEY56f2KlkdalfDEgIjWOJfiI+EmEsc0QM6RLJ5LBHDKF9apugA
   I3j7lWEIN2NsQItgHhsld5J75w2mlUkdmfvXEl2ZHELYo3uI2B29ovuMJ
   +tT3poIJUj6IqN0AUd88QhAbNRMBsD5QVuKDVkOkKKsuKTpwTAAJvbsmA
   Lrcto663OqNm1K4KWbhpq973m7bk3CKLJL27wD01cbCKVtNs3YgNlDiBJ
   2+PCFIAsXA15p9YWG2g92CpSmwSk+tcT7QlFzrnZjY6TfVEW3/0PvgKBJ
   A==;
X-CSE-ConnectionGUID: zZMVUcI2Q42dqJ2kdYRZDQ==
X-CSE-MsgGUID: A8v7ML0wRQmH73bwJK5ZBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50158952"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50158952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:24 -0800
X-CSE-ConnectionGUID: DfRunfYnSMCtGU3OlxCzyw==
X-CSE-MsgGUID: 6VhfUPryTVm45gWMOg6IJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113073524"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:50:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1thvKs-0000000AbBn-24bt;
	Tue, 11 Feb 2025 20:50:18 +0200
Date: Tue, 11 Feb 2025 20:50:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/14] platform/x86: Rename alienware-wmi.c
Message-ID: <Z6ub6n5ks2oR6Llg@smile.fi.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <20250207154610.13675-10-kuurtb@gmail.com>
 <Z6t9naLPpVl_L9hw@black.fi.intel.com>
 <D7PSNJVIIQ6Q.99BIJKP7H2YU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7PSNJVIIQ6Q.99BIJKP7H2YU@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 12:31:34PM -0500, Kurt Borja wrote:
> On Tue Feb 11, 2025 at 11:41 AM -05, Andy Shevchenko wrote:
> > On Fri, Feb 07, 2025 at 10:46:05AM -0500, Kurt Borja wrote:
> >> Rename alienware-wmi to support upcoming split.
> >
> > (the change that is caught by my eye and induced this review session)

...

> >>  obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
> >> +alienware-wmi-objs			:= alienware-wmi-base.o
> >
> > objs is incorrect! Please use correct y instead.
> 
> I want to understand what is exactly wrong here. This `objs` pattern is
> used a lot in this file, so I just copied it. For example [1].

It doesn't mean it's a good pattern to copy.

> Is it wrong to do it here for a single file? Is it wrong to do it at
> all?

If the compilation unit is in-kernel unit (either built-in or a module) the -y
should be used, for the user space tools which are build inside the kernel the
-objs should be used. This all implied in the respective documentation.

> My goal is to split the file, but link it all together in a single
> module.
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc2/source/drivers/platform/x86/dell/Makefile#L14

-- 
With Best Regards,
Andy Shevchenko


