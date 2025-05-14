Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1719CCF5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237942; cv=none; b=bvSfr6Rv/Jg8VtXjD1DC8q6diSe6Vd2E6vOn38PBK2l/9bEQFTMADPjU2W+ajS9ZP84hy4YMAp9nTlyy0s8J1wNNDgizOIuEWV6kWJBbncBYWsDNRxIc0QMEU78KHHI6wOmOQBS+fj8NRaqkZFw1GG2JtkXL3Y/eoz37+BijaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237942; c=relaxed/simple;
	bh=Fdymo7U/XQEsHjtymqpQe81QQ1ZBEYcPOe4F2NEP0dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdAuOj6usV5yyDVNi53kmDhkfFDw/Z/jFWcGA2UYGXEwHBdTsqVZi8y5ksyg7oWq2DriKt58AKM/DqzN9naY2Q54yYpQcw79DbPh7y/uyVGsVkxjT0ag6nEscBY0PIQNxiR7WqwPwvD34NP0i/TQt9X0g84If09ERaJUZNCvUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH6D9Bpo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH6D9Bpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747237940; x=1778773940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fdymo7U/XQEsHjtymqpQe81QQ1ZBEYcPOe4F2NEP0dA=;
  b=ZH6D9BpoA6g/fMzCLsEWcg3stAUITwU50YSmC1/Xm73zn0rv56qiwLU0
   ZiIcUL3MZ5zGcayTGj9ZKT6hxG3KCq6zwuo3PoYfRHPO3yyhpyIEUshbj
   9I+K3MI3wYRoFNIg0qjhbW1eGoRQu4DD9gUDDV0sWGrNn4VltoEcAoEqe
   6Uhd138mZsdo3lsStdH5v158YZaxRHWjgUyPG92DmN5QjI8u9ke1NXzUW
   7Ej+rhYFor40uyKtLESCM4orsqldz9kAiRA8uZrthWxn4dfW7UYckXYY/
   y+7CTbwlvfc8BeYOWkgiHAC0dkQAFnMxWPCVs/CqHruqHCfd4dEJcLTFt
   A==;
X-CSE-ConnectionGUID: ZQCw9QFIQK2lAkwUeGojIg==
X-CSE-MsgGUID: b+LEqMVBTk64UIbQuf9sKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51782772"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="51782772"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:52:19 -0700
X-CSE-ConnectionGUID: rQSTQNjNSJOC6i4n3g2xKw==
X-CSE-MsgGUID: jqP9JqDoT+OHu+94y0EHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="161369778"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:52:16 -0700
Date: Wed, 14 May 2025 18:52:13 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <aCS8LThO37Vt26im@black.fi.intel.com>
References: <20250514122432.4019606-1-raag.jadav@intel.com>
 <20250514122432.4019606-2-raag.jadav@intel.com>
 <2025051433-fade-flirt-d3e0@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025051433-fade-flirt-d3e0@gregkh>

On Wed, May 14, 2025 at 02:35:01PM +0200, Greg KH wrote:
> On Wed, May 14, 2025 at 05:54:31PM +0530, Raag Jadav wrote:
> > With more and more drivers adopting to auxiliary bus infrastructure comes
> > the need for managing resources at auxiliary device level. This is useful
> > for cases where parent device shares variable number and type of resources
> > with auxiliary child device but doesn't require any active involvement in
> > managing them.
> > 
> > This reduces potential duplication of resource APIs that may be required by
> > parent device driver. With this in place parent driver will be responsible
> > for filling up respective resources and its count in auxiliary device
> > structure before registering it, so that the leaf drivers can utilize in
> > their probe function. Lifecycle of these resources will be as long as the
> > auxiliary device exists.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/base/auxiliary.c      | 145 ++++++++++++++++++++++++++++++++++
> >  include/linux/auxiliary_bus.h |  18 +++++
> >  2 files changed, 163 insertions(+)
> 
> Sorry, but again, you are not following the required rules for Intel
> kernel submissions for this subsystem.  Please work with the Intel
> kernel team to fix this up before you resend.

Apologies again if I have broken any rules here. Since this is following
the recommendations[1][2] of community maintainers, my understanding is
that this needed their attention.

[1] https://lore.kernel.org/r/2025032514-ipad-schilling-9928@gregkh
[2] https://lore.kernel.org/r/20250501125028.GM1567507@google.com

Thanks for guidance, let me fix this.

Raag
