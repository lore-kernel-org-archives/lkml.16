Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B69028EA4F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335844; cv=none; b=AN80AMQD0HUXetutHq0b4O0xgl5cLnAV/LMUSRbMGXAmV66KKLVxC+9737mGVENz6Pf5jaNtPiEYhLVHEbml9AdMHOdH4bBLUnYgLRJx32YFC3sR6XZGclG2vfaHbNWRURzm0d9+0frOInHWesne2HpJNI0hVX9DoRdaWoCW9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335844; c=relaxed/simple;
	bh=c7cOL5At3DU0Qwp4ugX/l2BzHuRQ2cVTud4nRHqWId4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsZr9lcpq9u/ber+R4MXeFJRTKgQX0dmtTal7bjjUirNEZNfJVnhK9TVxLlHOu2/LwT/D0QdrAO2J0qxYnXrJ7tqexy5Nl2OVW8wsX+UQ+4QQb7opUmOw6K+8zI6L8c96MLlLK0uuDozrUK53QTvNYPy0YYExTVEClZb8DVb7Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqYeDESJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqYeDESJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745335843; x=1776871843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c7cOL5At3DU0Qwp4ugX/l2BzHuRQ2cVTud4nRHqWId4=;
  b=gqYeDESJP2ZNfblho/hTiBq3kjjVdkdfakWqV+jd03OqMIGUc2I8RjB5
   e7xsgiFCqxAF90oE/9SCGJ50J+huHRDgt+1OzELS5rso4IHs5v1iUn8xY
   tilKK843bvC3y//q44pVo868osqDAZTwjsZuzu65bppyv0ASP5HAXILiv
   jX/G51cu5ICE45ElvZ3z+P+gYgt/Nb2g2WUoQIN5vdIR0gNR3RQLhccVT
   MjLbZ0Sk+DaqLfBnWOz9eKrCDJQL2RoFbgGucdAK7ZXhyj8vcxDjEuicL
   ZVClNkk2q8BSruJOQlVQmIIewNMiERvRGTmzZRsS9gIt+MQJPbTBgUgU4
   Q==;
X-CSE-ConnectionGUID: 34b0bOd4TT6uW+gcD+t1BA==
X-CSE-MsgGUID: iYvXuJxJSBaNE1V4Ay2MnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69391161"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69391161"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:30:43 -0700
X-CSE-ConnectionGUID: pw7R1Jv/SWaa9skVuaq6xg==
X-CSE-MsgGUID: Sh3rZaquRJKIiJg4z9oU1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132366779"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:30:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7Fa2-0000000ElXg-23r5;
	Tue, 22 Apr 2025 18:30:38 +0300
Date: Tue, 22 Apr 2025 18:30:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	xiaopei01@kylinos.cn, xuwei5@hisilicon.com
Subject: Re: [PATCH 2/3 V1] lib: logic_pio: export function symbol in
 logic_pio
Message-ID: <aAe2HooDhmxc1MTA@smile.fi.intel.com>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 07:31:59PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> export some function via EXPORT_SYMBOL, convenient to use in
> kernel modules in the future if somebody went to use this lib.
> This is one reason for this library exists.

Btw, why V1?!

Really, stop sending new patches until you assure that the format is correct.

With standard tools this can be simply achieved by running:

`git format-patch --cover-letter -v3 --thread ...`

-- 
With Best Regards,
Andy Shevchenko


