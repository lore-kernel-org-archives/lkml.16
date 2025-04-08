Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96B426656D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104912; cv=none; b=upqFEW3afn/jkCYcdVw0x9Mm2J7M/r8K6T4lHCe0enV82V5qwjFLbp1S64gu9IZVTUce7DHVIpXGhRqMM4ro/vHGBu8Ifsxd8VlmD2p+L0rimRtGu3n9lC6fHqyPncWOvFrwc+TAyrZdaXFvTVlGe/W9KxxLaqods30PYc+QvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104912; c=relaxed/simple;
	bh=meg8T1f2j9qmjDA75iYwFYqIY6mdsFqngS70291dSDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=af22cnO/yZHzSlT0QPg0eUqLs8i7vXjW4LkG9L2OYDljnLKFCcfg5b8WoNskisPQvJGxBZK2gt6UIdPRUpEv8X8oyizaZO2kKWycEBlK14Vpk0F9wZH9CoiZ2CpJVp2zKSxt3ElXEu22X1F8CYRiUNui6Til17UL4mOlzklzXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: gV2tUCd2SB+L7+zScfHgIQ==
X-CSE-MsgGUID: lGc2HkpGTuy60kLxEOR/cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56506726"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="56506726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:35:10 -0700
X-CSE-ConnectionGUID: Nt5rjS7JQEW77MsFy3Mg5Q==
X-CSE-MsgGUID: bs+LmZQgSpyq701fU7/ZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159206889"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:35:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1u25MH-0000000AM3W-47Xy;
	Tue, 08 Apr 2025 12:35:05 +0300
Date: Tue, 8 Apr 2025 12:35:05 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	julia.lawall@inria.fr, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around
 binary operators
Message-ID: <Z_TtyXwkOBK1MXGy@smile.fi.intel.com>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> On Tue, Apr 8, 2025 at 8:20 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Apr 8, 2025 at 12:54 AM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:

...

> > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
> >
> > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
> >
> > You mentioned Linux coding style, which also requires lines not to be
> > so long. These lines are. That's why a few versions ago I suggested
> > you to change these to be two lines each. I don't know how many times
> > to repeat this (it's third one).
> 
> Okay, sorry
> I will add a third patch for a line break before the patch for %
> operations since each patch should handle a single thing.

I am not sure you need a third patch for that. It lies into category of space
and indentation fix.

-- 
With Best Regards,
Andy Shevchenko


