Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C3B1FF1A1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845128; cv=none; b=UnAz37RcJHMRFBtVht4dMWHLmkJ38lWrlo/1cTdXWrFcAmyKQRFwbZgJEe1sDVDuXajuY78s/TDYaGcNZ6dvhTq5OIU9PjIsGk5qce17wceFv9ftpiW3ha3NXOyY+BF4uX3EbH+AfqhCXk2T46U4SkS8SmmBjj0dZv+tv/FuGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845128; c=relaxed/simple;
	bh=gmn2IeMhW40VIwFyOegsnZI+vS3HH21BgBRu98Mv8YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKciIbB7o8wRxls5JRAb7GBaaa43rdxRcc5jR0mv3naFxn4TYzWRVnizq7g+Dm0l8rmM498GYDpdWUInSUWDl62Vri30uiqWEySEA3KXVYeDW/MxDVMLG5J45FFWrukaUETsl0UrhEPhKeBJsDh3VLn5QhFcUHwX9lfHMYBvEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TclL2auC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TclL2auC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750845127; x=1782381127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gmn2IeMhW40VIwFyOegsnZI+vS3HH21BgBRu98Mv8YU=;
  b=TclL2auCKV2nzlLIhd/gzlApOrhg/b6/eXCeEdY0rJqGl4N/UGUVWXMn
   P02j+sbFFwpcqIPrE2LVGCaAj/BAg+E9cLH6gp/53hsmrxVnx3HXhCWG1
   NUhT0MlfT3XM697kD0gFloWAxs0qTp8jW+TQM/mYqpivcOlkGaGX1q+gH
   tFcpjwm92G7481Lri54NGHPudXBz71bBbGyJjVMCRzS5+aL3CHovBFNQr
   2C3ViY601MY0wRsBGlMRp7akjYUHMAy3GI4LNXHg6P7VM2W7wXxOvp5QF
   YI8bBiHvU0Pe4CLKI9iiFaeNxotPBhsG0SSA6VpZ6ZChAhbUqY7EjOlu+
   w==;
X-CSE-ConnectionGUID: J+yKAuLmQl+Ga7F71uC0tA==
X-CSE-MsgGUID: 9c6KEd1mTzGsYQ9c6/IqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56786481"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56786481"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:52:07 -0700
X-CSE-ConnectionGUID: TS7JZHS1TkuGXO5DiNVGqg==
X-CSE-MsgGUID: S2ffql/iSUyqlPPj3wsuig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156742942"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 02:52:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A16011F742;
	Wed, 25 Jun 2025 12:52:02 +0300 (EEST)
Date: Wed, 25 Jun 2025 09:52:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] mei: vsc: Various bug-fixes
Message-ID: <aFvGwlin0q8YWkZO@kekkonen.localdomain>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>

Hi Hans,

On Mon, Jun 23, 2025 at 10:50:42AM +0200, Hans de Goede wrote:
> Hi All,
> 
> When running a kernel with CONFIG_PROVE_RAW_LOCK_NESTING on any laptop
> with an Intel Visual Sensing Controller chip, the vsc-tp code will
> trigger a lockdep warning.
> 
> While investigating this I noticed a bunch of other issues / bugs in
> the VSC code, resulting in the first 9 patches of this series, fixing:
> 
> - An unnecessary 11 second delay on shutdown / reboot
> - Destroying the mutex while the threaded ISR which uses it might still
>   be running
> - Racy use of the event_notify callback
> - Dead event_notify callback still being registered after remove()
> - Thread ISR waiting for hard ISR to run a second/third time
> - The lockdep issue starting all this
> - And some cleanups while at it...
> 
> Patch 10 is a generic mei debug patch to help catch similar
> use-after-free issues as the on I fixed recently [1].

Thanks for the set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
