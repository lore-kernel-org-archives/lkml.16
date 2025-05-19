Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19803265CA2;
	Mon, 19 May 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675325; cv=none; b=nGIMcGotnu3hgZLxNB+C/c+HgGWSSaCd7Moqbm5Mp9CO/mp0xv6DoRPlboRsxIsZmQlQY84gpMRQQOpWaIg5UgJhf2P0/BhWS2Gtra5Y1NHsWKIU4lOH71IsZgrRNMOP6tfquFwafVfzgSfHAueOIoYuJnW+pnJ9y5FaMN21HMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675325; c=relaxed/simple;
	bh=+Z6sHxva2Miz5i/8VjX3xdw2TldXnaCrPCnGrtk+uig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OB9VTlw0MaBjECSQSK/It9lvR65tlpH/PubTs9ZlPQ4B9rPOk1pX2YyAGIXP4u28l7xVQC2X2CTLMfHg4x1O11XMz5sb6Dcm+JwZCbHm1TuLoncaClBDKU0OliuOQdFe3hpTwfEwB49D0Rs1cjEBNd2DALdZxiTjedl1uZob4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjH0E98c; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjH0E98c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747675323; x=1779211323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Z6sHxva2Miz5i/8VjX3xdw2TldXnaCrPCnGrtk+uig=;
  b=mjH0E98cxBbdNu7edCZASf4hRSJeOvmpXtgiHCnkyzawftxs292fY7lC
   eZzH7u8jHmioieLphm8UAgCkh6QZzlu+5eewzfPB5K8kahhQKuh3083rd
   3rCGRRpjXQgxCLmnR4+iD+q78pM1+CpkwUfo+1OyrlJeRSUDiaysWQSkS
   nav3TbdnX6WsM+S2RWN6ewy5uH7Nev6sbL2LF9Ipt8g3FjFuIsXlt72Gp
   NkOe83XJHOaUExyppE6hR5K+3s8Ms0X2r936SDCxYQIC7NXFTM8zYKEfd
   MIHnXtyX8GJ0bXLq1zbIFo3sP+hgnh65c8gnMjYZJCPk/uF+uN4plZ8CK
   A==;
X-CSE-ConnectionGUID: 3+P9048BR0q8nf9zA/6Y1Q==
X-CSE-MsgGUID: IXOVx8d4R6WRONoua65etg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="66998845"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="66998845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 10:22:02 -0700
X-CSE-ConnectionGUID: 9QVyv750Qei6+y2KQuQq7w==
X-CSE-MsgGUID: r1TriyShTtae8MBQL1UFBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="139319397"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.103.51])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 10:22:02 -0700
Date: Mon, 19 May 2025 10:22:00 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com, xi.pardee@linux.intel.com,
	"David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 00/15] Intel VSEC/PMT: Introduce Discovery Driver
Message-ID: <aCtouJ7Lz80srgBa@agluck-desk3>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
 <aCdaMel-zV8Qir69@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCdaMel-zV8Qir69@agluck-desk3>

On Fri, May 16, 2025 at 08:30:59AM -0700, Luck, Tony wrote:
> On Wed, Apr 30, 2025 at 02:20:49PM -0700, David E. Box wrote:
> > 4. Discovery Driver and API:  The core of the series is the addition of
> > the PMT Discovery driver. This driver not only implements discovery of
> > telemetry attributes and capability data (exposed via sysfs) but also
> > introduces an API to retrieve telemetry regions by feature, which is
> > essential for features like per-RMID telemetry counters.
> 
> This part of the series is the foundation for my telemetry/resctrl
> patches:
> 
> https://lore.kernel.org/all/20250429003359.375508-1-tony.luck@intel.com/
> 
> That series includes a fake place holder for the discovery driver, but
> I've been using David's patches for all my testing on real hardware.
> 
> Tested-by: Tony Luck <tony.luck@intel.com>

Ilpo, Hans,

Linus released -rc7 as the likely final rc before opening merge window
next week.

Are David's patches in shape to be part of that merge? Or will I be
using them out of tree for another cycle?

Thanks

-Tony
