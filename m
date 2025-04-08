Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FA267399
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105002; cv=none; b=c/O5UEn+nvrzfTrLBrWr7Wpi1IV98dnSDwvPrKgaLxWgTklkKCOYqRLD9DuLY/lrqY7OXgxEcb7AgifHMQwfZ5azM34Q5NmM2zPWvt2A8zpR7/Ynk4rpFTIfC/9AGU3tGrg4GGIrS3d8T5Moz5ZoulTr0IooNBkWxq2kgKDzK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105002; c=relaxed/simple;
	bh=/wAMfOnvbOyuKLm6VluHvI2FFGfc5RccaFxv0fPTMdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGYDk7wuND2f+oCu/oo/y/WqvwPUymVZLn4Ibu2t23OYkDWP5VWrppKHfc0P/fU/dsEQd7EwSQxHqJoIdYYflXAk0P0Ry5YfobgKmQd5nklfFDzAt6grPTgmGIW+8e0nNaa4YhugGL2MB/vmWk9qbg2nQOr0NIsGeEjptB7SWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: 7ysTNudcSFWkCcoJkzwOXg==
X-CSE-MsgGUID: oPxU0bPtS0OZfv9tDECJVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45242221"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45242221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:36:39 -0700
X-CSE-ConnectionGUID: aDwbZGqRSGSggUrZ9cScyA==
X-CSE-MsgGUID: Vb/4ZLnuS9KyIyn17FIcPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159205187"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:36:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1u25Ni-0000000AM4Z-1xmE;
	Tue, 08 Apr 2025 12:36:34 +0300
Date: Tue, 8 Apr 2025 12:36:34 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	julia.lawall@inria.fr, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
Message-ID: <Z_TuIjwuihXF3mbM@smile.fi.intel.com>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75VcCdS30LHPMwk3HO1o6db_0p+LDQoASx-7oCVw__MpMdw@mail.gmail.com>
 <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYq+fYeXCUgXqWu_97gvUBOvTG+H4Q76TSX2M1s5jV7EWcuyA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 10:28:36AM +0100, Samuel Abraham wrote:
> On Tue, Apr 8, 2025 at 8:21 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Apr 8, 2025 at 12:54 AM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:

...

> > > Changes in v5:
> >
> > This is v6. Are there any changes in comparison to v5?
> 
> I added a cover letter and named it v6 to show it's a continuation
> from v5 and to show I added a
> new patch for spaces.
> I was not sure where would be best to add the change log so I put it
> in the cover letter.
> But as it concerns the patch for the % operation, there is no change
> between v5 and v6

Then it should have

Changes in v6:
- none

which then questions the purpose of v6 :-)

-- 
With Best Regards,
Andy Shevchenko


