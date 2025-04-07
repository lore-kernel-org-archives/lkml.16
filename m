Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C87211460
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015752; cv=none; b=EwLPvzYe/wNPlu1Wmdc6Gh1Ex9sCL+CLR+n3lFgkirB/6p/h8ip39WLvCKfKJDhEguiTpnbvS5um/uc3bQYdWtCTnM2UVhzccSuSZE+QoT0AC+N+1ZfhfJRubFp9VpmoTXg2Y5OqX3DDBLFcgG3utt4RwC2GbrAlGVVI4KhTLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015752; c=relaxed/simple;
	bh=B9s3+XIfej7okK4vYfrCqfccezv34+jSd9MAmtp/xls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6xKACX5XZEoYcsWlECaNmJigJYBdtucNwLqW05NMl/Oo1ABJRpYEfnLyXvHTIId8zcbi6Zpq69uYsT8fSlHbjuS53FWUcFTL27lHFD9amPhmO9cZp8Rbmo59smpFa//hNghqebi6l9p+h9SYKWtM38a+4yyc/ajIQvE/qHS7wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5zqE+Oa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5zqE+Oa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744015750; x=1775551750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=B9s3+XIfej7okK4vYfrCqfccezv34+jSd9MAmtp/xls=;
  b=l5zqE+OahThq4YADMKQOuNsmJIiwvUaIVS2uBImvWd4PX1o3xQMQ5X/f
   96NZxWRVeB6t1ZeO94YFuxv2ml6YwKPVJ7SAM3DH1s1md3/fVoO2HRc12
   Pz4dwGiI0A/k29VaOh4VbeJ38jeUmndFlKeHOGuU0PFDKzcaE0oCE/TzZ
   UPBUK2FrwXH59uAYZfsv7llrx1A6Du+N9YSxHLIF2aMQkMvNGC2iCPpu5
   E9qhsKhQ58/Jys1hyPGC0tztXFuNaJOkZOyUSPBbJav4LOBlnwoyrDBqN
   Ku5hXGr0fUCCmEp9xfYxSOGw5wxm1hw7k7gKBt9BtbONx9KA20qeB+QBT
   Q==;
X-CSE-ConnectionGUID: fZ9Kz6nKRZWTgZV8iIaLWg==
X-CSE-MsgGUID: MmrpPs2xQba/VKMkX+5Nyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="55575712"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="55575712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:49:08 -0700
X-CSE-ConnectionGUID: BhwjL6KpSjOzhxDRYde87g==
X-CSE-MsgGUID: og5y1HNCSxC/neCN1hA9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127775164"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:49:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1iAB-0000000A0Yy-1PdI;
	Mon, 07 Apr 2025 11:49:03 +0300
Date: Mon, 7 Apr 2025 11:49:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v4] locking/mutex: Mark devm_mutex_init() as __must_check
Message-ID: <Z_ORf1lLqs7UuWY2@smile.fi.intel.com>
References: <20250407-must_check-devm_mutex_init-v4-1-587bacc9f6b3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-must_check-devm_mutex_init-v4-1-587bacc9f6b3@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 09:46:47AM +0200, Thomas Weißschuh wrote:
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using the devm
> variant of it. Tomorrow it may even leak something. Enforce all callers
> checking the return value through the compiler.
> 
> As devm_mutex_init() itself is a macro, it can not be annotated
> directly. Annotate __devm_mutex_init() instead.
> Unfortunately __must_check/warn_unused_result don't propagate through
> statement expression. So move the statement expression into the argument
> list of the call to __devm_mutex_init() through a helper macro.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


