Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C94C8E;
	Mon,  9 Jun 2025 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500372; cv=none; b=ALWw03egjmBVDlESdiSQs8Ti68K+xtZyLdQ8cLENcy5D5oTD4mdIBBTtXM9DOEjpWK39DhpKPGptrXnDHk+LH8ZyIe9Xr0DB6aafDDZdzX/t9gWcHqzqki/WXgX66CkjBgR5dwlIzbJvLRTfvK5n29u0+r3jSFzHo3WJMnEVI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500372; c=relaxed/simple;
	bh=xHki770puYpEzm3QMVlBGE3HdQKNbbHjet2ZCnU39dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh7iB9QoFHCQhKm6m89ff8uxcooih+eoBUfbgFiu1AxTgFHlEaZE0uLmlN7rObjVuh0hncjMv4oa956Hn2kUP52ABJxg83QEuti6RWyXZ/hIP66rnHzO3YZcfKUeONF10+tX9jNpCqSlOaQmJqFSdci6Q6UxjbMyMDCsQfzoQmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ+z6DR3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ+z6DR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749500372; x=1781036372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHki770puYpEzm3QMVlBGE3HdQKNbbHjet2ZCnU39dg=;
  b=cZ+z6DR3hOYZKjMV81kYGYYtRaMmVuGwMD6MD+7Al9v+CmDMNmtMLMVY
   Tzsz7mYliDLJCmVmUAGyMjINAG8CE/YqQw7AO+5IFbjNxjsQZwofCrk3i
   xgFbtUDucQNPO5z8C2E9Vt01kib+3jmukA/C0UqXkcuLu13hRlWAs+H0t
   RC4rXBAWkrsfJoUMl2aCiHAP070cmEawVMHl/KA+keV9adAdxR95gR7Kc
   VC67PxEtPCmBxRbhDPiKl1femtSDTtbDlkdCtWWeEMkwNNp+rbVU8B0m8
   OBcPt52pMJ9ERHuoZZ6WgVEWbGfe8j9rOag03ElGHKvDv1Vkm7gain9vt
   g==;
X-CSE-ConnectionGUID: udx6JnAdQueiteYDntjsfw==
X-CSE-MsgGUID: FIhDey8HS5Sb7B8OPCVPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74126652"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="74126652"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:19:31 -0700
X-CSE-ConnectionGUID: vCR4LmqaSFOMbLacU69nbw==
X-CSE-MsgGUID: GHyQfBRVRnCO/63aM5EzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151867743"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:19:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uOixo-000000059d8-0Xwz;
	Mon, 09 Jun 2025 23:19:24 +0300
Date: Mon, 9 Jun 2025 23:19:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, corbet@lwn.net,
	ikepanhc@gmail.com, hmh@hmh.eng.br, W_Armin@gmx.de,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
Message-ID: <aEdBy6m_6aQr8l41@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-1-mpearson-lenovo@squebb.ca>
 <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 09, 2025 at 08:27:25AM -0400, Mark Pearson wrote:
> Fix issues reported by kernel test robot.
>  - Require DMI for think-lmi.
>  - Check return from getting serial string
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/

> 

No blank line in tag block.

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

>  - New patch added to series.

Shouldn't it be the first one in the series? It seems to me that this is the
fix of the original code as well.

...

> +++ b/drivers/platform/x86/lenovo/think-lmi.c

My understanding is that you need either Kconfig or changing C file.

-- 
With Best Regards,
Andy Shevchenko


