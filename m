Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB417D2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649475; cv=none; b=DT4kHlGtC76vWs+vbD+n2RPSeXEEYcj7CvU/X8QV4IdNLoHksKl+3p/eF4E3jH3Gz8m8YOgFIdIlHag2Fn0ZJWgLvquoIxPbMdF64Hw1nElzsrBvKAvKhmClMNyQgnv34qJGClQMzJP5cCgMvHhBiHUqeWC9aOSzUyoQJlZBzwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649475; c=relaxed/simple;
	bh=r7PVrf74ItTR/ep8MImxlxwoMtPvqU/ZtRsdpeTPTaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDvZ54tWPvVdIw5y8cKgB1wHdqR9f2zk0pqTlkRUyuRJU608ZTlyK57SmFJ7pYNkYhu7KJp1S2AvbN4X+KHJV/Z8STzctIGopZJUng5HVJtQlwTNoA0H69p8YVfBSvXYcFOjhwyCi1kXd4ewXzP1LU7r2smInigDwNGen4elAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5c4dmqj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5c4dmqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744649474; x=1776185474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7PVrf74ItTR/ep8MImxlxwoMtPvqU/ZtRsdpeTPTaM=;
  b=i5c4dmqjGvRo6zF7zC4A4k5JgFbpHh01SXDXizWihDsmT0xVxD3lWNbY
   XAaQ6dpq/h/j2OyUMCAsyRsGBu1umZs0oZ5lqGLu8NmjqhHjo3ps8p0Hg
   n8bA0FHHogzqxEYlFHazo45kNGOGhVjCW0clvGmqgUzL5x0Xyhac4bRbI
   AGwRgW+B0WMYCeVnfLdheE3X6SU1iGgQAXZFVfDxuc3VJX0CXkYHSCGnH
   cxsL1yA1AGW342HGuOAUpDqMh+qa68sbmkOhs1PrshM3cMVKBM/0uxpNi
   XElONcV8FIAdN4wjiB03XcrRUXR66wbk8acJx3d8KUFID0r+ALR/iW9g+
   g==;
X-CSE-ConnectionGUID: 7JoPIDdbSheqOMf9QJ1Xww==
X-CSE-MsgGUID: Dfw9YLk8Q+ua54mgS420Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49962647"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49962647"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:51:13 -0700
X-CSE-ConnectionGUID: 1v/GUOEHQxyzLmh//jTPqA==
X-CSE-MsgGUID: KUiJp73BTFCOuMTDhnpxNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="133978089"
Received: from jamart5x-mobl1.amr.corp.intel.com (HELO desk) ([10.125.145.223])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:51:11 -0700
Date: Mon, 14 Apr 2025 09:51:04 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Borislav Petkov <bp@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	David Kaplan <david.kaplan@amd.com>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] x86/bugs: Remove X86_BUG_MMIO_UNKNOWN
Message-ID: <20250414165104.2ivcicu32vfxk5qv@desk>
References: <20250414150951.5345-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414150951.5345-1-bp@kernel.org>

On Mon, Apr 14, 2025 at 05:09:51PM +0200, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Whack this thing because:
> 
> - the "unknown" handling is done only for this vuln and not for the
>   others
> 
> - it doesn't do anything besides reporting things differently. It
>   doesn't apply any mitigations - it is simply causing unnecessary
>   complications to the code which don't bring anything besides
>   maintenance overhead to what is already a very nasty spaghetti pile
> 
> - all the currently unaffected CPUs can also be in "unknown" status so
>   there's no need for special handling here
> 
> so get rid of it.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
