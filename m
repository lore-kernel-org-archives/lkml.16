Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECA423C384;
	Wed, 30 Apr 2025 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016674; cv=none; b=fkulgRzdECW3xpyUcegeIeQOrcJAQnpByX7sUYhpO4R5r9daEEwUttz6CFqnR98sj0viD7M3aDq210DHRTw4neK9V2rSTrebvyBnl6kU78643GOsM9U3yDUfZ+xB5Nldh4znrPkgGi0KyvtW4tIE8oWQhQjc9Uq1u8vw5uXzQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016674; c=relaxed/simple;
	bh=rmRQ5wp4uWHdfYSKbJ9Aw4PRmQnVzVOzB/ll2+935kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RorjeP010vDLtUWJN0z1DE8B2ZAtxiYPK7yv4K/qWUVEBAvZdBufGO3VE7KqWc0g9qW8c27ukbowI+/nx6dhmg1l8uGhdNAbcWfNyiMlN5tRorXkGUrUAsyEw+JA/K3loCO3CsglFSNHCxzeHMvsGkvzYyvkMf3tOO0B0UtfHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqGDlESL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqGDlESL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746016673; x=1777552673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rmRQ5wp4uWHdfYSKbJ9Aw4PRmQnVzVOzB/ll2+935kg=;
  b=eqGDlESL5Decypu04638ZXZ7KqVcy1JacNbK5Y85TKGItjfJ/+W+VcT+
   cSGWFlbpQeUgrhgGGJ02XMh2K/KoE/Ll0NWUEHKOpdBjGUCI4I6/wzJmX
   ixjNNSphYqSLhgM6TMGkQH1b+szAiWHbXWl+Y1e2e0nFD05ztZ4gWkTsq
   hh9elDu0WxZHDQrJFDVHQVwW/UDF4/oy+KeVLyqHW/RnW8UdIGoFfbXyC
   J3Ax5HnnRkxd9My81dNTEDu87Vb/CVR76l+KXGjoPVThxv+9sAMsofVj1
   6YWc8UIkti8C3+DZwXQJ2yRhoKf8VlqT8VeX9KxJ0/pUg7MtnPJD/EKiE
   w==;
X-CSE-ConnectionGUID: ZoGXnscFQYmmuCBtwDLfEg==
X-CSE-MsgGUID: z2H349ucT26yyghLYROj8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="57871563"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="57871563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:37:51 -0700
X-CSE-ConnectionGUID: wXPnGUn5TAiSCGg5KbQ4rA==
X-CSE-MsgGUID: L3VajdjdRiSkd46fIlKQSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134414365"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 05:37:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uA6h6-00000001cry-1QQ8;
	Wed, 30 Apr 2025 15:37:44 +0300
Date: Wed, 30 Apr 2025 15:37:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Zhu Jun <zhujun2@cmss.chinamobile.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: Use min() to simplify
 aw_dev_dsp_update_container()
Message-ID: <aBIZmC6ax1BUuS_L@smile.fi.intel.com>
References: <20250429071032.65391-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429071032.65391-2-thorsten.blum@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 29, 2025 at 09:10:13AM +0200, Thorsten Blum wrote:
> Use min() to simplify aw_dev_dsp_update_container() and improve its
> readability.
> 
> No functional changes intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


