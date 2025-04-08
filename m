Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F526460D;
	Tue,  8 Apr 2025 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101705; cv=none; b=j8D4F22gYTcgnpaOljZnrezrDT3OX9EGS3YAbsGoluApUkbgkS+eZFmuIblgJibN8oUA7TuaDeeKtQto61BqdqxDw+Zvs2IQ8o20dwCAa16XnW60vimgy4/mDTZt+Spvge723xiKDWWi5IO1du0a7gAQy1oSh/8fq7nRzR9MKMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101705; c=relaxed/simple;
	bh=5WteQ7YdNoFXvIEtbsDbq4fbGNek1M2TYmJsBLMEzgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFmaREbd9zUMA6rCgsGmzOQNrDfTVC0C8r732UBO/i4w92bv5mPWgK4b2nPFoKULVTqJFyD9524viMfXRMP5jw0CQkS8JYoJ+ivfVDEqyEsySzBZbW3v7oT29p6eNpJmI7TGzpbK2a7+IYhNmSHZpqu/MQM01SpOS/lkimgbC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAWC0gEw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAWC0gEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744101704; x=1775637704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5WteQ7YdNoFXvIEtbsDbq4fbGNek1M2TYmJsBLMEzgo=;
  b=dAWC0gEwTZ+fJAYbEC8LS4lwAleRlOdDZlWeQ1KNw0OJ1+tCHMlJgZyA
   NJMwuGSHEw8OjbPfA1a/DKyVnvOS5KRb8gn9XwwfJfyq6ZU7zHAjGkPCB
   YmCrQaFKpN3UlZTdoVpOsE6zbHJ4r+XucSHgMb9P5ikm8vwdRQQvRh6Jg
   WVht82pzzMhXOSYx8/rEDg2a1vOQAqkOJAucfVZevpBu+FL7l2dp2qPJg
   cI24zaHmerSIkiu1Yv2LiBBDXOZUCbXNwoUvAK4my/BW4UEJMkxzIm9Jn
   xahNJJQImAd0r6X9Rb2ETFO9RlFoc10Eqx2fh8jMC9QbnvYoK1uXIbxJ8
   g==;
X-CSE-ConnectionGUID: U9zooZwqSxS9Fi99zEpRrQ==
X-CSE-MsgGUID: j3wTnsKBRYmq0l6wIaWkkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45410329"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45410329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:41:43 -0700
X-CSE-ConnectionGUID: e4xa6mZKSgiZsPgdHaLFpw==
X-CSE-MsgGUID: FbaDQkLOSt6Ln5P2KltInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="129152257"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 01:41:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u24WS-0000000ALEM-3zpw;
	Tue, 08 Apr 2025 11:41:32 +0300
Date: Tue, 8 Apr 2025 11:41:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 12:17:13PM +0530, Aditya Garg wrote:
> The vsprint patch was originally being sent as a seperate patch [1], and
> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> them via DRM.

You need to do something about your tools, really.
Now it's patch 3 threaded to patch 1, while the rest, including cover letter,
seems okay.


-- 
With Best Regards,
Andy Shevchenko


