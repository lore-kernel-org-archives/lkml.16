Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8020A5F3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603257; cv=none; b=mSrKpHDxdz4T3g/SYK+DDlfu7rqZaUqQLe1/7TS51QqwwPd8dYuBkkvvmtGgP25FM5aZwx7NQ20s3I9cGsc7v4XlzMCyEzi4mKg3ujMpChav85v3Ot4Om/mA5mR+x+2/U9+IuAT8m32RW+cATW+kn9SzyK2TVV8cmlOZl5WZ6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603257; c=relaxed/simple;
	bh=n3RbJZylO787qTWZAKdwolLcAFAHnPKhoSSc8zdAD28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV/Jm0SkPRUro4ikFJavVAHN7yBUk1ZkcwPp+hciNevcwTr4gnoQ4Qc0JvrG5NKMqwyJ1d0kkNMIzuYbUV0KqvoriYBEBeC+mY9WVHQ41pqTz0d3rFsJpAwBE79ZPjTmPLoanx+0XKqB0iuW7YLGU7beaDEd+NwnGw/KFc2Svh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxqqtLOe; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxqqtLOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738603255; x=1770139255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n3RbJZylO787qTWZAKdwolLcAFAHnPKhoSSc8zdAD28=;
  b=TxqqtLOepzhRQFds6ARcZdsUDjE7zkNge3pE4IHciHk1fpUEjjCzrUCf
   GxDd2gHayz0rVN/ODn+sGCrRalrqTLwEO9WzYwNeMNSm0VBRLMtUkU8Pw
   DycCsTL8wbz5KgAQ5ukPuSgQcq7WEHrznG0uAO6XKYZTUhNqwBXBmRRLX
   Ul0QEYQLpxw7CqMT49ST5al2fo6eNF2Xn4J5IxwFPdw4HNiqo/Cpbnauf
   lbPFzMIGXqCY8sgoBd3arAzJ5EJv/+slJYUQoH4r4L1yjUXXZN4MMLiG9
   fjkF8lH7TmGAv4K0sffwZuF2akJdo4UIO2WUtmujgRmOe7DNwGLndQRWH
   g==;
X-CSE-ConnectionGUID: sTLXg/shQSidkrTqsSLeGw==
X-CSE-MsgGUID: xbaFGZwgREu034oXfTfseg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49361214"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="49361214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:20:54 -0800
X-CSE-ConnectionGUID: b/E38t/ASIKJ8HOCJE+eUg==
X-CSE-MsgGUID: ULHW+cdtQtG4Fa8hBG51zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147553531"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:20:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tf07u-00000007toN-3vZg;
	Mon, 03 Feb 2025 19:20:50 +0200
Date: Mon, 3 Feb 2025 19:20:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: g@thinkpad, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v1 1/1] bitmap: Align documentation between
 bitmap_gather() and bitmap_scatter()
Message-ID: <Z6D68pt6IF8y8NmS@smile.fi.intel.com>
References: <20250203121919.3184930-1-andriy.shevchenko@linux.intel.com>
 <Z6D2aLzVwNh-jhc6@thinkpad>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6D2aLzVwNh-jhc6@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 03, 2025 at 12:01:37PM -0500, Yury Norov wrote:
> Hi Andy,
> 
> On Mon, Feb 03, 2025 at 02:19:19PM +0200, Andy Shevchenko wrote:
> > First of all, the bitmap_scatter() mistakenly refers to itself for
> 
> It seems there's no 2nd concern. So I removed the 'First of all' part
> and applied in bitmap-for-next.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


