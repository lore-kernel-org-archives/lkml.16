Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3D13B58B;
	Sat, 19 Apr 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079249; cv=none; b=LbT22MPpbvxFNdCSFLiz3IqB4gQjxCiOQqyUm0LWKc/04MaqIeJKW2uTArUADWo/slfftSquyXQD0O/rx5DKFjt4acfOX1qnqfflfrpF/OGH/ZP4eB4mLKXJCrPrQIBaY/zuLITPElalM25Pu9FKEMzAKXgqPUaTeLo4CSsst4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079249; c=relaxed/simple;
	bh=yDjXvO55wm9O85eQLNkvpsS9tISz7H6vbjq3Lh/jusk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJT7WcPJoYD7we6yQ+DJne7kq/C3M6tvSKEAE2ZX7d/t4LNiSoRRJ+hauTCbg0i2Y/VU7lDCBxej3+rWOcY2XgQd/D5qlwx/RDpMwVRce3/hn/lDxlstU/M0N/U9DOAwpNTwHWj0Lha5JFDosvmlXqMSLVkuZGUuLb802r5RNOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfAhJRb1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfAhJRb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745079247; x=1776615247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yDjXvO55wm9O85eQLNkvpsS9tISz7H6vbjq3Lh/jusk=;
  b=UfAhJRb1nNJrJfYmjrAQec6cImG7Ryecpid9PrWDbrDosaAJ3+qgs9Wn
   w+aAz2+WbQwFE0prXOJRR1mkNMhWWd8sB0qTpCoIa0Qnqw8+yjXleDVP0
   TTgtmD7zeGjfgk5vsl3mUTmv6qB7iHXh2aTj531Wez6Yx250ggiBY1sYt
   dECpmWjPAWKwkb12Nj9+kvuP9g2kgRB+90ze/ImDAY4hd/bvzpV3efcaU
   tkfvp8Q3xYiZVbLg0tQN1IJvD50H4vGWsgF2KpAFjEnRpY33Ea3vFunOe
   9GLFfypFUGPYHMNhCmax7B73ToPx2uugrJHjTW3zwNnKquC+KIeElGxs3
   g==;
X-CSE-ConnectionGUID: mMD3r0ieShyfT4MyiirQ4A==
X-CSE-MsgGUID: ZZMFiwJrQKOw0KEffIguvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="58059111"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="58059111"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:14:07 -0700
X-CSE-ConnectionGUID: ZBMmhvxoR82GITb508wq0g==
X-CSE-MsgGUID: 7+qgmhl/SOeSudj3d0Q4nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131648533"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 19 Apr 2025 09:14:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 64E75170; Sat, 19 Apr 2025 19:14:02 +0300 (EEST)
Date: Sat, 19 Apr 2025 19:14:02 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] .gitignore: ignore Python compiled bytecode
Message-ID: <aAPLygDGs6SoBZEv@black.fi.intel.com>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
 <9bbcb399f6b6f68e6525131fea41dd0fc9c6978d.1745019660.git.mchehab+huawei@kernel.org>
 <CANiq72m5YW1aL+mAg4tcUwB7bKFC_4ZSGyeD8Z+mKzyPYG830g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m5YW1aL+mAg4tcUwB7bKFC_4ZSGyeD8Z+mKzyPYG830g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 19, 2025 at 11:17:33AM +0200, Miguel Ojeda wrote:
> On Sat, Apr 19, 2025 at 1:50 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > +*.pyc
> >  *.patch
> 
> I think the list is intended to be sorted.

+1, I told already twice, I dunno if my messages were seen.

-- 
With Best Regards,
Andy Shevchenko


