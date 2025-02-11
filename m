Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00E71D63D2;
	Tue, 11 Feb 2025 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739292673; cv=none; b=aY/SMeksRkFdShTfs3kxDANAQEdCzG6Ocbv3OHGNFUomafucgqerhWf8r7zToHjVtQiePlJckPaUm7R358qds5IHdRCOT1lvvKyejFKWypFQ8Eg2+yg294fQQ7eir13mq9MYXUglX8rpCbj4YQ9yyLWADwIijvPcMy0UjKIpDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739292673; c=relaxed/simple;
	bh=zz+i5abNqh8BM/UT04F9MeeqWMJMFwZ7KzeiZg+geoM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GzCnDyHZMUKyDMCmcEH/6s1mnT/7FFAFQ4OT2IEx4QDaclhx1kkXhnFUQlARxvw+JcnCepB6KPDYX3lwoykdubArdeYHWAJoGCfwdAM8bLX+4mO3HUeEZ/b0RwJQdpMmQaAdaTeXGz2I7tTZlOo2nGYAHm9Qv5+xZukin+ReH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9iGsfNm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9iGsfNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739292670; x=1770828670;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zz+i5abNqh8BM/UT04F9MeeqWMJMFwZ7KzeiZg+geoM=;
  b=H9iGsfNmGd3l7Oqu+B7eOhTmTHK2VncPdxZ1yRvuhdrYFXv31qLvA2xw
   TCSSQ0dfP2PhyEsYvDjw58y+V8bZ71sbMAtKkj03mUkHktX9hU+Z/u2gp
   gLQt663hTG+ZhaTcRtwl4g91bdm7FjhGZAKwGZGPE1avkWdZxcNevmYc5
   tI3JyZJW5gft+wne9KwTV0W/cI4xaGIPHY5j+7eLNyxxg9avl+asNJISt
   AI/N9DsO/PyWQVHicrkgh+/PrLRaeoAWghL9Aywd4Gn+mxPR5K+zbQ6nL
   OTVSG49w8mMmBu7iMYL7kpKycKTWoix4qarVhlNXhzi5gAFcDnkcWjEvx
   g==;
X-CSE-ConnectionGUID: WkHF6aNQRR2uGEu5Mwz8LA==
X-CSE-MsgGUID: 7o/5OAMhR9SKlSKwFdtXuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57457244"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57457244"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:51:10 -0800
X-CSE-ConnectionGUID: Z3bzb2TxRPid5FjF4ZFlvg==
X-CSE-MsgGUID: S+2sLaHQRh6Irpbdi3zlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117179229"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:51:07 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 18:51:03 +0200 (EET)
To: Andy Shevchenko <andriy.shevchenko@intel.com>
cc: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    Armin Wolf <W_Armin@gmx.de>, Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 10/14] platform/x86: Add alienware-wmi.h
In-Reply-To: <Z6t-msAAi1lVHzN9@black.fi.intel.com>
Message-ID: <2c56e2de-02eb-d653-987f-69e674aab3c7@linux.intel.com>
References: <20250207154610.13675-1-kuurtb@gmail.com> <20250207154610.13675-11-kuurtb@gmail.com> <Z6t-msAAi1lVHzN9@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, Andy Shevchenko wrote:

> On Fri, Feb 07, 2025 at 10:46:06AM -0500, Kurt Borja wrote:
> > Add a header file for alienware-wmi with shared resources to support the
> > upcoming file split.
> 
> ...
> 
> >  static const struct attribute_group *alienfx_groups[] = {
> >  	&zone_attribute_group,
> > -	&hdmi_attribute_group,
> > -	&amplifier_attribute_group,
> > -	&deepsleep_attribute_group,
> > +	WMAX_DEV_GROUPS
> >  	NULL
> 
> I don't like this change as it makes code harder to understand (at one glance
> you can't answer the question "what are the groups that being listed here?".

Over having #ifdeffery here, I've no problem whatsoever with it (and in 
fact I suggested goingthis way). It's pretty much boilerplate anyway 
having to list them yet in another place.

-- 
 i.

