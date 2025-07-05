Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57B9134A8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 18:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751739556; cv=none; b=SLcDM7h3ztM+oCihpT3GEEj9VgaYSbHVEpjghip5tFSZXyQw68pABsB9fMJQjKbz3vNPLdivPbKhP6qdbITR8XpBEA1TDwxFl0ZE3xp1iTSzmqP/n/d5RUQ+vJRvrhlYXMIRWpXejbCZj97Cpbtk6JAgUQqtVTA3PyV6UON7msQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751739556; c=relaxed/simple;
	bh=7hthfrc7tTdg4jCbIpZXZsXxRkwD5UHIMJ/9LVWFQrU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKpp37tCS3Y4tfyg7cEB/bx9jGOToLLmZswTYTGicIiVOI5RvsmIyq/XP5MBK3D/kI+UeZASFHCDxf7Smgx0Lf+BRu6r2PzE05l6pCHyrrnniuNzWxJMPUMMDtUcOS+Q+mKQ8+90yNSOQpCMoys2QSgdmLqTot4+gVhTFxV95YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 82ce853c-59cc-11f0-a04e-005056bd6ce9;
	Sat, 05 Jul 2025 21:18:57 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Jul 2025 21:18:55 +0300
To: Andrew Ijano <andrew.ijano@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>, jic23@kernel.org,
	andrew.lopes@alumni.usp.br, gustavobastos@usp.br,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	jstephan@baylibre.com, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] iio: accel: sca3000: simplify by using newer
 infrastructure
Message-ID: <aGlsj1m4TygpRkjt@surfacebook.localdomain>
References: <20250618031638.26477-1-andrew.lopes@alumni.usp.br>
 <CAHp75Ve4yAp6sViUWZY+0abRoNZ0W+rQLCmsbijEcrh8kguVOA@mail.gmail.com>
 <CANZih_S9_8OdY=oKyVPBCTSTqYm_z_rkE=xbPym3uHOSsHMv6A@mail.gmail.com>
 <aFL6PE-8KLLKZun_@smile.fi.intel.com>
 <CANZih_QeeA_G5mFOAb=TMNYiR4eo9SUD5iW1G-5LBGL27NpTRw@mail.gmail.com>
 <aFQrgEw4zw9RSAO3@smile.fi.intel.com>
 <CANZih_S=7-ArpBT3NF54-RH_KYER=mdS9nf1bUO3djEiDY_RWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANZih_S=7-ArpBT3NF54-RH_KYER=mdS9nf1bUO3djEiDY_RWQ@mail.gmail.com>

Sat, Jul 05, 2025 at 12:03:37AM -0300, Andrew Ijano kirjoitti:
> On Thu, Jun 19, 2025 at 12:23 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Wed, Jun 18, 2025 at 03:20:06PM -0300, Andrew Ijano wrote:
> > > On Wed, Jun 18, 2025 at 2:41 PM Andy Shevchenko
> > > <andriy.shevchenko@intel.com> wrote:
> > > > On Wed, Jun 18, 2025 at 09:24:19AM -0300, Andrew Ijano wrote:
> > > > > On Wed, Jun 18, 2025 at 2:56 AM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > On Wed, Jun 18, 2025 at 6:17 AM Andrew Ijano <andrew.ijano@gmail.com> wrote:

...

> > > > > > I haven't found any reference to a base commit here. Have you
> > > > > > forgotten to use --base when preparing the series?
> > > > > > In any case, please clarify what this series is based on.
> > > > >
> > > > > Thank you for pointing this out! I think I forgot to use --base for
> > > > > it. In this case, should I submit a new version of the whole patchset
> > > > > with this information or is there a better way to do it?
> > > >
> > > > For now just reply here what is the base. I asked this question above.
> > >
> > > Ok! No problem. So the base for this patchset is the commit
> > > 3c23416f69f2870bea83697d7ab03c6a8497daa7.
> >
> > No such commit in the repository. :-(
> > You are doing something interesting here [1].
> >
> > So, make sure you are based on the iio/testing or so, make sure that the base
> > commit is the one that may be found on git.kernel.org. Use that in the next
> > version. Due to above this version is ambiguous to even start reviewing it.
> >
> > [1] I have connected IIO subsystem as a remote, so I have access to many trees
> > from kernel.org (but not to all of them).
> 
> Actually, I think I didn't fully understand this part of the
> contribution process and that's what was causing confusion.
> Basically, the base commit appeared in the previous version of this
> patchset but I removed it after it was approved, to prevent it from
> being reviewed again. However, I think I could just add the
> reviewed-by tag.
> 
> I'll send a next version with other corrections and the missing commit
> based on iio/testing.

What you just described is a normal process of rebasing your local tree against
the (updated) upstream branch (in this case we are taling about iio/testing or
iio/togreg whichever suits better). Hence, if the commit was approved, the new
base should be provided. Under "approved" means that it made the subsystem tree
and pending for the upstream.


-- 
With Best Regards,
Andy Shevchenko


