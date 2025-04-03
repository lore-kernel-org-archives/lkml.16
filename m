Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1000C1F7569
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687476; cv=none; b=mDwKqFFZY/kuiJlbpKJi7ruQwlxA2hci78A9n5ZQ9S26tVyft2APAUA9EVI2E5lmjKqacq4jCr/5JprW6QUDjpx8sH/YJFGKTtwwA7B4Y1gguDTHa2PtQrG9BNVlEqPrGH3yhKWo7oKsDJ+xtibnOyMrER17AO4xDqfZypx3IQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687476; c=relaxed/simple;
	bh=lYaM2zB+znxQum2Uxjkfosf1OvpehFmeq4rBRpYei5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoQYfvRR487lffY834EHx+rXjAJheMRmdGGTzzI6p91FyOjaYzovSLjXN3PczsGO+ficD/9mNmssOvBYxZoEbpdqhetF6rQnYjBfJ+x/nSXTCOhbPYIOKMY48rvuGMpVQfjsojElmoavgJTHTO2DayCbWluUIkvuzSMKIKcGMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: LKBIKGfKRoWykZaWkanmHQ==
X-CSE-MsgGUID: 0WI1QCo8Tpu9Jk9K1xD8bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44350992"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44350992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:37:36 -0700
X-CSE-ConnectionGUID: YnOmEHlAQRu3QWK7ENXfCA==
X-CSE-MsgGUID: U3PYzZXyQF2sN4E9FhFwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127858682"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:35:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u0Kil-00000008p5Q-10Mm;
	Thu, 03 Apr 2025 16:35:03 +0300
Date: Thu, 3 Apr 2025 16:35:03 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 2/3] staging: media: Remove duplicated NULL tests on a
 value in av7110
Message-ID: <Z-6Oh1QJJGTnDSg1@smile.fi.intel.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <76351e135cf7ec4d609e60461bae4ba6d3c3a445.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76351e135cf7ec4d609e60461bae4ba6d3c3a445.1743685415.git.abrahamadekunle50@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:26:42PM +0100, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle

Missing period. And Subject should be like

"media: sp8870: Remove ..."

When in doubt, run

	$ git log --oneline --no-merges -- $YOUR_FILE_OR_FILES

and look at the result. Use common sense and age and frequency of appearance
for possible variants. The more recent and more often wins.

...

Code wise the change looks good now.

-- 
With Best Regards,
Andy Shevchenko


