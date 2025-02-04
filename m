Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B517F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679341; cv=none; b=mYvMVTh/hK5qqiYNIhM8OYvwpbGAMFUm8BN/GCC3BWCq2+3DAyAvMmjyK9FW2/LGuN3E1UjV1D1i9F1sS4JDgoXklGEFOuDIj78+aqP3ylMggBIvSd4ZABL6BMaivYky7TfcdrJXLNuCwLSR9u8YEs3BE+/9Xmq08eq5pVgaF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679341; c=relaxed/simple;
	bh=T2TIRe4lR/T96WuNNDxpqp+0dtHlRZfCetfwcWQ61B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pL66TSMbTo8cgnQmmaII5uKVAEuA0VBt+bab9DLYqNN2bnpLWSKsoBPqSZNiShL/N463rnUT3fpCljxJcJPkV29BqIDGYhm9pU2xsPqEVMoD0/8Lzs7L9NYGhshSD05S9Fwdut0EvA+Zfdzo02tnGQ3IHh04O38rNdyoz5Nelr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jhii1801; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhii1801"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738679339; x=1770215339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T2TIRe4lR/T96WuNNDxpqp+0dtHlRZfCetfwcWQ61B4=;
  b=Jhii1801msGrltJ021kcquBzMHxKUIuJMgiUgb3XO9zsbmGhLuUzlHCN
   ZnhCnwgNhQf+Rm1yKHd7IbuQe43pir6qgB4XfdkUhrK87cc92JYAKHnqV
   JleIzFNYKxvvwbzX9Li9yl2yeLqGF9ZQL3f7sIt6XxSEliw8O4RRGqlSP
   lXPThJasJ2rF2DaSRVXpIpatL9PTokSUvB9Gc2xA/RJ4o2o4a5Ws6OLe4
   C3IKDYOdv8MGndL6k9VE8xZ8UHjt8IKSDYiPUQ9It0NPVNrnwCUf110S5
   G4L4C6v6wX9XXVXxTQJCIeEv5nuentFpACNbGC0pQyiCZhBl1JNGAPDRI
   Q==;
X-CSE-ConnectionGUID: 6GHtlrxERbqbIRwlgbvhhg==
X-CSE-MsgGUID: wpCPzwXaSPWNGnl0KBXlfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49464415"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="49464415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:28:41 -0800
X-CSE-ConnectionGUID: pRpssm+FT4mwvov2OwHU8w==
X-CSE-MsgGUID: m/MSMVYyQimiicu+0jWzkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110431150"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:28:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfJun-00000008A9L-3ZZp;
	Tue, 04 Feb 2025 16:28:37 +0200
Date: Tue, 4 Feb 2025 16:28:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kthread: Return the assigned value rather than 0
Message-ID: <Z6IkFec26HmiwM4H@smile.fi.intel.com>
References: <20250203164855.3699026-1-andriy.shevchenko@linux.intel.com>
 <Z6FjGV1-CxE12f8L@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6FjGV1-CxE12f8L@pavilion.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 04, 2025 at 01:45:13AM +0100, Frederic Weisbecker wrote:
> Le Mon, Feb 03, 2025 at 06:48:55PM +0200, Andy Shevchenko a écrit :
> > Recently introduced kthread_affine_preferred() has a bug that the value
> > of ret variable set but not used. This breaks the compilation with error
> > (assume default CONFIG_WERROR=y and `make W=1` to run the build):
> > 
> > kernel/kthread.c:862:6: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> > 
> > Fixes: 4d13f4304fa4 ("kthread: Implement preferred affinity")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks but I already have it queued there:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git/commit/?h=kthread/fixes&id=1b0332a42656b798bea867631d739de023633ec6
> 
> I'll do a pull request shortly.

I'm fine with any approach as long as the issue will be fixed rather sooner.

-- 
With Best Regards,
Andy Shevchenko


