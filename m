Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA122259F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876420; cv=none; b=odiZ5ZZ5fE6R2ZzZFZ1zhfCNVNzDq7okJjqYUf6Dn0DXMFZpo74fBqm7EfzegGYPOeHDNo4o4AqeT9pcrgdE5HKnV8JhjUvvfeiqsc/YTz5ztxpNchB+bI7/8yn8IZkKQjerrarS1Nb1zzgbHMJxY6X9Zx6Rd+c19iuYFQL4njM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876420; c=relaxed/simple;
	bh=wWb+Nid5VUOH38Jde4+YnT8vvEysVcJMVJwzOim0Hds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxc+j9nvXhTOf2aMVSCCJ/Lf3LZfwV5nMUbQ53HzoeNrlgb2eXak2XjMkz3nL9MvG2o+lTB9iM+QDJDTCEDorp0vgUbdo4IEQ/xxBSWO3iekwBs5YNY6OFdqqfUS1HEBhpl7UOTt9G6dmyAsxuXn/Lbd1+pQ7dvYnMo8wuRpkXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=in305YNH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="in305YNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748876419; x=1780412419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWb+Nid5VUOH38Jde4+YnT8vvEysVcJMVJwzOim0Hds=;
  b=in305YNHY065nbLuWd2PgBk6OVJoay8s/ltTZvHBSnzFZ8dkYJikPOEL
   uA8aUF1NUDpAE1eTzu6x3ljpEOtiVcX/kq4Xdwx80yOwuJRP/AbAJGUP1
   A5d7ehycTaG84lpPeA8yGsbocEgPSWF6H4XahpYBFM+UkwgdmNAo1kTP+
   NrhFf7/ipAV+MHfVeJXbdsJ8Y46rhO7Yz7RDTgu8Wi8nGQw8gHXG/ES4v
   d651953KtFW5BeWho5ba8/FfzYv5Vgw8Ttik4IiaIK1FexSNOL7gjtGU7
   IsP8SPd23hXHItacFTk7CBNun4aH8ekiOFqHSVeu+dICv2jHF4jPJPHvx
   Q==;
X-CSE-ConnectionGUID: 7tKWUuXPTwG3RyLRCGrtVg==
X-CSE-MsgGUID: lYSJs8fKS0uQ7x7yeCdiQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68436666"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="68436666"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:00:18 -0700
X-CSE-ConnectionGUID: 8ihRZWE+RUWHuwZTejsogQ==
X-CSE-MsgGUID: mpsLBosnQASZ6yAnaxw13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="144594788"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.35.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 08:00:15 -0700
Date: Mon, 2 Jun 2025 23:00:11 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, yi1.lai@intel.com
Subject: Re: [PATCH v12 14/21] futex: Allow to resize the private local hash
Message-ID: <aD28exSNTcRKCCkl@ly-workstation>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
 <aDwDw9Aygqo6oAx+@ly-workstation>
 <20250602110027.wfqbHgzb@linutronix.de>
 <aD22/Ra2jHOsHJ9W@ly-workstation>
 <20250602144422.GIWEDzbT@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602144422.GIWEDzbT@linutronix.de>

On Mon, Jun 02, 2025 at 04:44:22PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-02 22:36:45 [+0800], Lai, Yi wrote:
> > Will trim my report next time.
> Thank you.
> 
> > After applying following patch on top of lastest linux-next, issue
> > cannot be reproduced. Thanks.
> 
> Does this statement above count as
> Tested-by: "Lai, Yi" <yi1.lai@linux.intel.com>
> 
> ?
>

Yes. Please kindly include it.

Tested-by: "Lai, Yi" <yi1.lai@linux.intel.com>

> > Regards,
> > Yi Lai
> 
> Sebastian
