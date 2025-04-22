Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8331A00F0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336889; cv=none; b=NeNhRwVAzBre/SdKuDuHEX808O+GpHlyZl0hPaQA+8vILzwdY4D7Wwfgp+Ts0+/LE5BYbQBlRkUsxD15w3QPkIK44yYdi8rx5RSLioTbs9RFmONIV/snfxWm2QsHnoVszuAAV2UzkFXNq2J2S5zvhMAqVueGiR7kDSQc55NqviA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336889; c=relaxed/simple;
	bh=f8KratvhnYtDY+UGUUbiuM6eMLJBk4vSwz0F+UWZovE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4+MtW2M4Bi9MXvhxBIX21I3+A13N08x8Q5LCc6PUOBEaEqn/KZo78Z2px6z9VZHj+5dLs913Sd6rhBFniRyFkl6j36rykMuNUNo2mVNKP82yjhaohO5gRLivtB4LyuRnpV9eOqRsIOsDVPzC8GsucFPUIuliKskFUUrcBTDP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVYieEe3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVYieEe3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745336887; x=1776872887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f8KratvhnYtDY+UGUUbiuM6eMLJBk4vSwz0F+UWZovE=;
  b=nVYieEe3Y7RO7keDTo/PDf+qmE2o8i998iU65QYTG6Auq9/YRlW+QTGG
   nekOocFPe7tvzD4smrvBPZ2Qyd6NvOjHvaKgNe+t9M529o9z6nW1H3Nk2
   IbnEZZj6s8wkfdkUBxfGI0r9fU3IH03c0a/P73jToD9T/FZ9hILxUwNIO
   r5l+TXURxL5/QvnUu153MX4KYpVJxTZ9xxO+3kE3jdQq5pa7TN2vhvWaA
   J8ce73eBPZD/nJ3qTa1xa27sYT9AJkL5v3dFnHL7B5GJLFiQRVlt35H0g
   eYqqwcP/akmUYwKK35wgKFd7CsohFQAPkILPdcIIfGGLTb5B4QuR7La2M
   g==;
X-CSE-ConnectionGUID: 8JS75YjrQWSIgOfsUS5dEQ==
X-CSE-MsgGUID: 4x8h45WVTIyFzqjWDSVShQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57092614"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="57092614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:48:05 -0700
X-CSE-ConnectionGUID: qqJtUUh0RG6tlY4sHllSrA==
X-CSE-MsgGUID: RHE9EYX5TtO3bHo+xqVagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="169254397"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:48:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7Fqp-0000000Elml-3Mkx;
	Tue, 22 Apr 2025 18:47:59 +0300
Date: Tue, 22 Apr 2025 18:47:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	xiaopei01@kylinos.cn, xuwei5@hisilicon.com
Subject: Re: [PATCH 3/3 V2] lib: logic_pio: Add detailed comments for
 find_io_range() and logic_pio_trans_cpuaddr()
Message-ID: <aAe6L0GyQO-yXZrE@smile.fi.intel.com>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_3FA290FB5E6F27C37304AEA91143DC0F5408@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3FA290FB5E6F27C37304AEA91143DC0F5408@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 07:32:19PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> Add comments that we were previously overlooked for find_io_range()
> and logic_pio_trans_cpuaddr().

You effectively ignored part of my comment. Please, run kernel-doc validator
and see the result. There are missing "Return:" sections. That's what it will
tell you.

-- 
With Best Regards,
Andy Shevchenko


