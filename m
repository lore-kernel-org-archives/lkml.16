Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF1825FA04
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625191; cv=none; b=mZrbMXZ5emGloxfAgZ0568f+k0SSCEtZCCdz1G2oFGS9+wzVOPA5IFbgwWjbRF1UnUMDEXM1X8E8eQhOeBfFuJOIPLYvagY4z46UwATmu0OoRg2NRm8hz8xH0UauVO0Evv7jjjLP+d4vAdUFojer6s+i1YBBNvkDj+1xBR+F/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625191; c=relaxed/simple;
	bh=BiSUzfCDnNgIrJX+isw39+Vro9YCyJ6cdnHsguSEtUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOlF851Je1vDsGm/zOXEST7IUCBFG5saJg5ZIL9wYKxrOHAPVBfqI/3XvXbnjhkoysDayW/Q7OHDB7WHT1umariSjrlPWuMSL/YsHN9zKYjVUsAkW9CCHNsaewtUoY1XWNIEh9pBL+YinSSKBfdHD9hcuhoeZpNpU3oCj/1RraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Evv/3vmQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Evv/3vmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744625190; x=1776161190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiSUzfCDnNgIrJX+isw39+Vro9YCyJ6cdnHsguSEtUc=;
  b=Evv/3vmQE1VoVcZZrRmH5Q62nyNVfzxhyA8NXD+8Ws6IQ1M4Y0WYlFwf
   LF6VD6YtBus1ft2AnBCI9s5uprNArzuFirM+rJPOwGhXV5wR6Ty0Qx0Ok
   DnEwT/LT8boVoC2FmV5j3SHqZMvFMgofNOlIuMEcPagld0ML/zK34kCiY
   0QEVo/12zDBMMopj2SfATtTBm72mjK+ECnLFonzNPyM5lIiUdxhqpxJFI
   O6DaX6q9/etkZHBe91fFv75/qmDOf0RB/g9x1GXAaLpyye4SElptY6wYM
   GkoRjMeMzAUVA51Gp6v/WxaCoc6pLaZ5U8u+2M0PbvecteqseKY6b4Jw/
   A==;
X-CSE-ConnectionGUID: sktQJ78eQFCU8QIo0WMqHw==
X-CSE-MsgGUID: LaLexroRQ4iCshhQB7kBzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46177331"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="46177331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:06:30 -0700
X-CSE-ConnectionGUID: qTJjutGBRhqLYDoKfDvGew==
X-CSE-MsgGUID: PSjkCGfHS2ins9CPEqykHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129625952"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 03:06:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u4Ght-0000000CCbZ-3Dmf;
	Mon, 14 Apr 2025 13:06:25 +0300
Date: Mon, 14 Apr 2025 13:06:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct
 fwnode_handle forward declaration
Message-ID: <Z_zeIdZMhF31DL4o@smile.fi.intel.com>
References: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
 <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28dd049e-65b1-4111-8a24-ba9765bbb1f6@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 31, 2025 at 02:40:51PM +0100, James Clark wrote:
> On 31/03/2025 8:14 am, Andy Shevchenko wrote:

> Reviewed-by: James Clark <james.clark@linaro.org>

Thank you! Can it be applied now?

-- 
With Best Regards,
Andy Shevchenko


