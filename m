Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9569F86338
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745902881; cv=none; b=e8BX1GYymh7FcbjMV7eZp06Hxzt6fCZQuCCxT0EUF3s68VnZOkI5DDOa4HvbdBnXaKhnPzCp6GKECnvoXr8Y89+7WXuZWmecjJbAqFi+OW0kxD37zFasU+7JIHr8nfT4lh0hxB1E7GseF77ROUIenB07D5/UU8irD5/F3y/kt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745902881; c=relaxed/simple;
	bh=9fWrwTu/pKD6etmx4FOBE9CwAgENRpHBHUT4MY7cQHs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq/gBVMFkqXUy2Inacc2vczDu3ogwkzrtXfHTsSY9ALkP889fz9klB3PwH7zBHjhIL8PRNjVdUL6EzHKcp2upUsoxhFZ1lt6LO8gkzJNvEm8WzHFOl3kWm8Q9fLOyrk5gNNTnPphfJTXJa1IRhOx7TKs5TAG/LKvuYnS96vUANE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id f79c0c62-24b6-11f0-ac77-005056bd6ce9;
	Tue, 29 Apr 2025 08:01:10 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 08:01:10 +0300
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit
 buffer
Message-ID: <aBBdFoBbdl8GI6da@surfacebook.localdomain>
References: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
 <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ybenmz2fmjxjpo3zhnrh2ptquikxrtb63664qbhhfv5d4ezx5n@c3p2tbosx2tz>

Mon, Apr 28, 2025 at 04:30:13PM -0700, Dmitry Torokhov kirjoitti:
> On Tue, Apr 22, 2025 at 09:56:45PM +0300, Andy Shevchenko wrote:
> > @@ -3094,6 +3101,16 @@ int alps_init(struct psmouse *psmouse)
> >  
> >  	if (priv->flags & ALPS_DUALPOINT) {
> >  		struct input_dev *dev2;
> > +		int n;
> > +
> > +		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
> > +			     psmouse->ps2dev.serio->phys);
> > +		if (n >= sizeof(priv->phys2)) {
> > +			psmouse_err(psmouse,
> > +				    "failed to prepare path to the trackstick device\n");
> > +			error = -E2BIG;
> > +			goto init_fail;
> 
> So you just broke touchpad of some poor guy who had it working just fine 
> for many years. For maximum impact you should add BUG() or panic()
> here.

Ha-ha. You know that your speculation most likely so far from the truth.

> In all seriousness, it is OK to have truncated phys, rarely anyone looks
> at it and if we get a report of it being truncated then we can consider
> addressing the size (or we can decide to live with it truncated).

In all seriousness, while I agree on the statement, the 4 drivers in Input
subsystem break the build. It's the biggest obstacle now to enable WERROR=y,
which is default, builds on `make W=1`. So, I already gave you chance to fix,
instead I hear nothing back for a months (to be precise 2 months and a day
passed from my first attempt that you didn't like), the problem still exists.
Please, address this the way you like.

-- 
With Best Regards,
Andy Shevchenko


