Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA762253B7B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194428; cv=none; b=c9pfzq9NrlE+fMIjnZEUZP1zWCCbKogPY9nO44wPpxr6iD8hbjGjweSABB9T/7lKs6UTx3Y/1Ees1kOnC8YSkSaR8awAs0kxEZIaAouEqGSakB4LjH89PHntdPQze2qVT8Yxa6wILKcO+8AD2Be3NJXK4TxNzdIPbBAvjlDbeKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194428; c=relaxed/simple;
	bh=lnnL8JGgyWBzzwSxMhHtcvMzZM5o+MSNEYGAJee0dU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqfjSu0Ys1XHRjIxTtLchicH7l5ANlVQ20mNqZS5YQ9UrBqhvFtzSlNwJY69IZRpTpEjDmWKO70k4hRJU46fuyD9fQ1zb5ids3Z6bPGf4PnrzxbjsgziIw3VNIpRiCZBc0+ynzOM4DUFzaoPQuP6uCJDUVcju4xT9gndOpu1aP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LG04ZD4W; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LG04ZD4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746194427; x=1777730427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnnL8JGgyWBzzwSxMhHtcvMzZM5o+MSNEYGAJee0dU8=;
  b=LG04ZD4WdQdv7GRWezXat3q/EChGWnHSj6zRpx2gAt9+8aRqY6MU6S0c
   yPRWajQVIW3tcJwchhodC1TeVbovwBMOhjWCFlXYwuVSVD57fRWG8R8BR
   QH5nmXNLbT4hHBFDlDLEv5HrQ7UT9A3sQ3DmQJ0QcByL8uYpFEuyvSM8X
   G0DcBAxPt4mIyiD59S2NSY2s60+HKNKH+yecC0DslD7p4j+5FHJgPYYyv
   YIJkd4dVSsjMnPvlCLltXnOD3nnH9cZcZLumP6T512/2HDrXYqnswjoY/
   uhRGs8w0XfxWL7P6hpg3UiLeqLYdCuhPPZGSBXz1wjmzaYLhbHtmWgTwP
   g==;
X-CSE-ConnectionGUID: 94z4QcDeRHKiuqKc8Y2xSg==
X-CSE-MsgGUID: d6gqm8QuTMy5qsiE0g1QBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="50531574"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="50531574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:00:26 -0700
X-CSE-ConnectionGUID: aVgIMMrKTDmEQq/CHUT3ag==
X-CSE-MsgGUID: wjgDXYmLS52peqiLrVerEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139453040"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 07:00:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uAqw8-00000002DUl-2OrD;
	Fri, 02 May 2025 17:00:20 +0300
Date: Fri, 2 May 2025 17:00:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Move hlock_equal() to the respective
 ifdeffery
Message-ID: <aBTP9AaJ0uyzAjxG@smile.fi.intel.com>
References: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415085857.495543-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 15, 2025 at 11:58:56AM +0300, Andy Shevchenko wrote:
> When hlock_equal() is unused, it prevents kernel builds with clang,
> `make W=1` and CONFIG_WERROR=y, CONFIG_LOCKDEP=y and
> CONFIG_LOCKDEP_SMALL=n:
> 
>   lockdep.c:2005:20: error: unused function 'hlock_equal' [-Werror,-Wunused-function]
> 
> Fix this by moving the function to the respective existing ifdeffery
> for its the only user.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").

Any news here, please? The problem still exists in v6.15-rc4.

-- 
With Best Regards,
Andy Shevchenko


