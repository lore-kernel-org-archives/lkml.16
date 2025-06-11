Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2981459F6;
	Wed, 11 Jun 2025 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654108; cv=none; b=uQdLIMpdaUTYNSYf3pLfqq0OAGiBtCTvDs+lige9Z2jMCLXzLlj6wKdWjnBjkl2nPRcp/lUNpA/yc/tF8tEQtM4BLyKCxjAPtiy+pxLklzSNX3LXcmr1qvTdWH3wm4g429meh3vL37BF8yiWzZp0nK+ppzxHCEjAP3V17hWhTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654108; c=relaxed/simple;
	bh=AyJ3hfRbuzfBaQbtE6GZ6eXkPyAo8i4WOgDzMr/lbgs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YMfo7mOtzCF28y/Y9Bcmvg7Jg1LCnpy1znvwLr2C+x7WoAWUx8gzl4KOVKxOmZ8twRfJMdN+lLBf5ZBjcFpPMFrJXHVBKXedALrQxFjdiqFVTcYsy6r9CZ2DmfC8jJYc7WRlp+++dqJ9g5M+9k2aLmGmdicRiDE1VMSYJiYqzd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2WcgYe/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2WcgYe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654107; x=1781190107;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AyJ3hfRbuzfBaQbtE6GZ6eXkPyAo8i4WOgDzMr/lbgs=;
  b=b2WcgYe/e3R48pjbEU4vnRtWkOb/iFaMdxJnj1mD8FfB162txHlhQRvi
   52JB+4+F85xNL9VVjJqIB/bhlQPM33cJJhoBmhReNHBwZwY6j1ak245Tq
   ZNpeHJFo8Anb292CAIzFEzu1Ky9WnhoUbqCSTOjOwbMnAMMnXzmY/m5Ls
   IbWNLcZ/clrKSDiX9f5NFBwY+IH4ox2yuJ4y5fHEl/3D34ppBa5heRsZk
   rM3miBH/qssQoqP/L8bHMByujz7JfOoElxvhg8qK/tel7GSmz78CVgEdh
   SySp0M9XkOxLBXK/XQ3jhon7clG14UNGzKPwttJhKcgZENkJ3pj2f2o/O
   A==;
X-CSE-ConnectionGUID: Eg92oKdzTFOz72Hn7JdsyA==
X-CSE-MsgGUID: EDYTyorXQ2GBU/qm7Px7Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51715502"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51715502"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:01:44 -0700
X-CSE-ConnectionGUID: oxe68/56SVOdM6C+h2ZynQ==
X-CSE-MsgGUID: 49SVVpVeRtalW905Sn70sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147125280"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:01:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 18:01:36 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Jelle van der Waa <jvanderwaa@redhat.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, ikepanhc@gmail.com, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Armin Wolf <W_Armin@gmx.de>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] platform/x86: Move Lenovo files into lenovo
 subdir
In-Reply-To: <002d39fe-44ed-45a4-9410-4fecf1c2163f@app.fastmail.com>
Message-ID: <b8af4da0-bd7f-1d65-8645-73dbd08ff3a8@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250610192830.1731454-1-mpearson-lenovo@squebb.ca> <20250610192830.1731454-2-mpearson-lenovo@squebb.ca> <aEiVHXI4vS9BDOPW@smile.fi.intel.com> <002d39fe-44ed-45a4-9410-4fecf1c2163f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Mark Pearson wrote:

> On Tue, Jun 10, 2025, at 4:27 PM, Andy Shevchenko wrote:
> > On Tue, Jun 10, 2025 at 03:28:25PM -0400, Mark Pearson wrote:
> >> Create lenovo subdirectory for holding Lenovo specific drivers.
> >
> > Assuming Kconfig entries have mostly been copied'n'pasted, the rest LGTM,
> 
> Yes - no changes from what they were previously.

Indeed, no changes, too bad that the addition "depends on DMI" was missed 
because of that ;-). I've fixed this for you to not delay this patch 
further.

A diff-of-pre/post magic trick helps to validate while preparing and 
review move changes like this:

diff -u <(grep '^[-]' patch.patch | cut -b 2- | sort) <(grep '^[+]' patch.patch | cut -b 2- | sort)

The sorting is not always needed if no core reordering is done in the 
patch but regardless of sorting or not, the unexpected differences are 
usually pretty easy to spot from the output of that command. It's how I 
found out the lack of depends on DMI on the post side and have found 
plenty of similar issue when changes are rebased/reordered in a series 
that does contain a move change.


While applying this, I realized I'd taken Jelle's ideapad patch which 
resulted in this move patch not applying cleanly, so I ended up moving 
Jelle's patch after this change to make things easier for me.

> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> Thanks for the reviews and help with both patches

Thanks for doing this, hopefully LKP will be okay with this change too
and we can once again focus on less conflict prone work. :-)


-- 
 i.

