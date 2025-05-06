Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8E280A58
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538502; cv=none; b=AGFvcXWB2UIicEXziU/STF9NjxZAMvYaFxPRqXv3BTiRscJqMkNYneS7w28HKYxKW2vb9U67VEmKWzQmI2okeZbEiVsckBUa1uFxfPlIabrP3aiKi4a7BdlhaNiNa96XhsAX8KsWM3XTwNHn7lpbSVnnp1QdimkQ/2+ztx/09aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538502; c=relaxed/simple;
	bh=2kMQEO2OriJkGJpX55hEsYnmu+hvezoN+vmiLvl+mpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bB/kVVGxiYaB60KCEmzib5In24qdQAy/Z9OdcPGna2ICFmxT5bV35eSH8y1H3zm4Y+1H0nMkFvkkDBbth4TGbWzBjZQfWS7eAq5ktDc6kXzH/+zka+xewtkZGR6i7UyrrFONaAcibiOzKFUS3bKtWUGJ5BjEhUiZeKj/msxv6EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/MI7J5d; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/MI7J5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746538501; x=1778074501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kMQEO2OriJkGJpX55hEsYnmu+hvezoN+vmiLvl+mpU=;
  b=e/MI7J5dqvz1B2r2p4FV5pErv5S/NzKMJJ6I3/14sRYILcC61UCIAiTR
   oLJWRQiU1T4OuMJXI0sQSS9ljqqVE3UhyF+UdEDDvi5sYxnaLhGVo9sYI
   kQLheQQxFsGMyFT/J3MZpQt99gTct/eGqKrUHHDpYEP0QZFihuk79i1y9
   0QaLN53kYPl8xa9lQHBExdTCWN0gkk4fp5U07IDr7VLbolHLt4ZwEcocS
   0DZr2IxUVf3DIHcid7nd2czy/OLccHMTUH/cFsDUK7Gr/Ws3S6sjBApw0
   4ZcDbYsOLfkd8OmPpuSzhR/ro0ZrMStXsbrGC4eSMNb+7RMwiVBPuiZvc
   Q==;
X-CSE-ConnectionGUID: 8gEDoW2RScytIah4QRk2KA==
X-CSE-MsgGUID: jV+RJw3ETjyQI3itYxHz3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59597953"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="59597953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 06:35:01 -0700
X-CSE-ConnectionGUID: 9ewK3vwlT7GxsMFqB+rx2Q==
X-CSE-MsgGUID: lUjOG8a8Qg+oFT5g5xbqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135503705"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 06 May 2025 06:34:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id D5F4C172; Tue, 06 May 2025 16:34:55 +0300 (EEST)
Date: Tue, 6 May 2025 16:34:55 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, bp@alien8.de, tglx@linutronix.de, 
	david@redhat.com, ast@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
Message-ID: <hqd7h7elpou6mohkdr2rqcz6u7xuanezuq3ti56ibsnccsb2d2@yokitckdkwqo>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
 <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9P3X0NLQMW5.1J74MJ7FDRBFB@google.com>

On Tue, May 06, 2025 at 01:20:25PM +0000, Brendan Jackman wrote:
> On Tue May 6, 2025 at 11:25 AM UTC, Kirill A. Shutemov wrote:
> > +	/* Bailout, since try_to_accept_memory_one() needs to take a lock */
> > +	if (alloc_flags & ALLOC_TRYLOCK)
> > +		return false;
> > +
> 
> Quick lazy question: why don't we just trylock it like we do for the zone
> lock?

It is not only zone lock. There's also unaccepted_memory_lock inside
accept_memory().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
