Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1D1553AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617487; cv=none; b=Hsi586o75HOSxzmAB/IOld58S+DrPqq1F5jNevvmcZJ5VHZ5GFkgcG11FODcIEKw29Nd2X8PCYBe8gPYOoNFuW/Rl8VRDGmawPQ7GE7h2C3r63UmTYsh2Bjaj4U+FS5mPE2GCb/zDZyLbKMXYIprtTQ3aX85ncee2SeYcoYzrcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617487; c=relaxed/simple;
	bh=pEwgZPRHQzwFzvyDIQXsfWgDoSet2K+lRqvl3iPcKfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNvlACXCSDxO9kri8scFNa2dXONlPtdeO39CRl0GnAqQOTQHBURQ8dqals9JyDcC7XQEkf+PjyAt2WHHGvDzNbQptnrSxEn3Z9yOnGEt68uR0C0IS/nN2wID90kx8PvcfuGQACPQF5dacnfX8PCx/Y4NWdcoXZ/wdOlGdPeLFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhjVA1Xa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhjVA1Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746617486; x=1778153486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pEwgZPRHQzwFzvyDIQXsfWgDoSet2K+lRqvl3iPcKfk=;
  b=EhjVA1XaybqJVQdVH6eLqFve8WXVdw2UxBe24feCQT/Oins/3nIX85t3
   /vcfgEguLVAWFs0lwmFM6GuMiJReyeLStJI/OVFZpsTM5ANksopQ6gwQy
   QUgaHu554tvdhsnGZaxtmsaISfqJUfw2QYGgEBmjtgzt1o/rWNmFa7RdN
   dAKQizF8rB+QjnqNvA8GcagRbmyw3bwma9pDxPLAMS44+MSya3Tk1CxZr
   zIA8G+v4b/vKs4OEQk5Hk8XpPADWS231WqNv9PO5p3PLMWNIaWfGbXAmA
   cgAUpHPiCzWOV1lioWprLgJxw3iy/mdTq3QnXE6XzvQTaZHEfDfxG6c7e
   w==;
X-CSE-ConnectionGUID: w5QplIrbQ5qZyoNKS55vFA==
X-CSE-MsgGUID: vEfYImQcSpG90EhjfvDmGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35973087"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="35973087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:31:25 -0700
X-CSE-ConnectionGUID: xsKlk5JLSEe3fBwSNq1BSA==
X-CSE-MsgGUID: Yv86otj+TK+6vB0Yraph5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140675466"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 04:31:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 619061BC; Wed, 07 May 2025 14:31:19 +0300 (EEST)
Date: Wed, 7 May 2025 14:31:19 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: vbabka@suse.cz, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, bp@alien8.de, tglx@linutronix.de, 
	david@redhat.com, ast@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/page_alloc: Ensure try_alloc_pages() plays well
 with unaccepted memory
Message-ID: <pvznson4tlwz4tavawlcotqouooemysjlv46mclo4hs3hyr43d@ek4cav7m4nrp>
References: <20250506112509.905147-1-kirill.shutemov@linux.intel.com>
 <20250506112509.905147-2-kirill.shutemov@linux.intel.com>
 <20250506170034.2c6cb08808e60772c207233f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506170034.2c6cb08808e60772c207233f@linux-foundation.org>

On Tue, May 06, 2025 at 05:00:34PM -0700, Andrew Morton wrote:
> On Tue,  6 May 2025 14:25:08 +0300 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> 
> > try_alloc_pages() will not attempt to allocate memory if the system has
> > *any* unaccepted memory. Memory is accepted as needed and can remain in
> > the system indefinitely, causing the interface to always fail.
> > 
> > Rather than immediately giving up, attempt to use already accepted
> > memory on free lists.
> > 
> > Pass 'alloc_flags' to cond_accept_memory() and do not accept new memory
> > for ALLOC_TRYLOCK requests.
> 
> What are the userspace-visible effects, please?

I cannot say I fully understand the implications.

The interface obviously allows failure, but the caller might expect
eventual success on retry.

So far, only BPF uses the interface. Maybe Alexei can comment on what will
happen if the function always fails.

I noticed the issue by code analysis because the second patch removes
has_unaccepted_memory().

> Was the omission of cc:stable intentional?  I cannot locally determine
> this without the above info.
> 
> If the cc:stable omission was indeed intentional then it would be better
> if this series was presented as two standalone patches.

Given that the second patch cannot be applied to current Linus' tree
without this one, it is better to add stable@.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
