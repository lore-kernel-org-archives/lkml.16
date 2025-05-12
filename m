Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29F2B9B7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045369; cv=none; b=ltDPUwOxXuXPtWQroZzuAiwOfkzYTRwh/10EvPAQB41rUZXgz6W1MqMTKHcc4a9TeHe4Xefu1RwTcrDRwaTyoiIeb+IUv7kZQKGoc5uQIOOduNUTZYAi1pI/7GSF48M6BFqm3iSh/wz1YGQ0nzuA1mUSgoZtbjrB35qE3det7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045369; c=relaxed/simple;
	bh=hy6dZlCXBrMC7R8bvN+Vgrk0dgZbOaUl4Uqs8FQUUCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BowUXRM/6nSSurw5me2tQcrjqtllGnYausDmFzjcZc2/u4sz4ixqEv8xfpxa3snekMq15d4Sekr4QZG34DERl7B7JNN+f7o2ujoCT1MoeNqnpg8x8pxabWcfeQrZs/chqUVE1mBw172hVG7n4zVrX/yG0S0mRZFUGE8jYppbP1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftCmj1IB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftCmj1IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747045368; x=1778581368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hy6dZlCXBrMC7R8bvN+Vgrk0dgZbOaUl4Uqs8FQUUCU=;
  b=ftCmj1IBhhyNHkUf7KhX/lbyQhnxznS3WhdWgoI0+w3jcpJQOWLNC6SC
   C6Am6yItXFPIr/ayAJMaPK3vc7lVjdHQ1r2zDOwtOe1gVZkv3YqIcLAiI
   BMDSFsRBAFsT4L/TZhgdsl62TnLoANxp0GqsOAI0m0N4SdxG9xu99rEYE
   OyCGtKRXBGFFdNKX19l3sMG2BCQNpXRuiINSXuACFEwPljVc6gMhVP1F1
   JQSSVeogmyxM5p9CKT9HCwu9jp74TtZbtR76bausdTYfafWU1Ew09nJXq
   cuIdMsisXC6soFI7e8Zu9/Ndy7xpN1Tdi+Fend3XNLkOig8cAnRSLqTiy
   Q==;
X-CSE-ConnectionGUID: pIjo15myQoy9tPcDkDWuiw==
X-CSE-MsgGUID: Ys9V9Q2qQd+Xf1TQzfVK3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48700764"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48700764"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:22:47 -0700
X-CSE-ConnectionGUID: L8AGSCanR7WDHI9bKgHHjQ==
X-CSE-MsgGUID: O/ZNLsxUR4yXP9QobEqbng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137252507"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:22:45 -0700
Date: Mon, 12 May 2025 13:22:41 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Lee Jones <lee@kernel.org>, gregkh@linuxfoundation.org
Cc: david.m.ertman@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mfd: core: Support auxiliary device
Message-ID: <aCHL8WWV-Wt7OrII@black.fi.intel.com>
References: <20250428060207.3170325-1-raag.jadav@intel.com>
 <20250501125028.GM1567507@google.com>
 <aBVArb-zJ_aqicHW@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBVArb-zJ_aqicHW@black.fi.intel.com>

On Sat, May 03, 2025 at 01:01:23AM +0300, Raag Jadav wrote:
> On Thu, May 01, 2025 at 01:50:28PM +0100, Lee Jones wrote:
> > On Mon, 28 Apr 2025, Raag Jadav wrote:
> > 
> > > Extend MFD subsystem to support auxiliary child device. This is useful
> > > for MFD usecases where parent device is on a discoverable bus and doesn't
> > > fit into the platform device criteria. Purpose of this implementation is
> > > to provide discoverable MFDs just enough infrastructure to register
> > > independent child devices without abusing the platform device.
> > > 
> > > Current support is limited to just PCI type MFDs, but this can be further
> > > extended to support other types like USB in the future.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > > 
> > > v2: Introduce a shared struct mfd_aux_device
> > >     Introduce auxiliary device opt-in flag
> > > 
> > > v3: Fix device_type ABI breakage (Andy)
> > >     Aesthetic adjustments (Andy)
> > > 
> > > v4: s/mfd_aux/maux
> > >     Allow num_resources for child device (Andy)
> > >     Fix build warning (Andy)
> > > 
> > >  drivers/mfd/Kconfig      |   2 +-
> > >  drivers/mfd/Makefile     |   2 +-
> > >  drivers/mfd/mfd-aux.c    | 156 +++++++++++++++++++++++++++++++
> > 
> > This looks like mostly duplicated platform device code.
> > 
> > If you are _certain_ that it needs to exist, you need to push it out to
> > the auxiliary subsystem and remove any traces of it being MFD related.
> > 
> > If it's needed by MFD, it'll be needed by other auxiliary users.  Even
> > if not now, sometime in the future.
> 
> Greg, if you are okay with this, please let me know. Or perhaps suggest
> a better alternative.

Greg, any guidance on this?

Raag
