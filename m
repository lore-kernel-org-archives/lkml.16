Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21E71DFDE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750647408; cv=none; b=eypITcebOZew7vvHT0KZZne88LAsu3XiHZGvW9WDjj89CiawP1aSfGLYfzoX//ZZtvtmseVuCyPLY0oaeLh9NNsZQRdSHgdDCMAfEE+fTv19nuUERiSpjUz2VfFrU8voNDXA4k1uv1AyLm1oylda8KbtFiU4kxRJWF0zwbzACNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750647408; c=relaxed/simple;
	bh=w0QDmXbE55Z0xatDGuGvmp0G0rLoqrwLRDhJuktAtW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+5FfKLBR/zg3dCT+7m12MbOqgugHh2qX3vN4lpIhGa+p8ansfWi7Ges83F4oKQKOn7wvGXOkgN9JMdOEHzuekY+AW1QJGNEMJ2sMBPs4L4TQf1Qrj0z1g6ise0KRxIOsN6CC3MvVlJeuYRXA5scyySUk1dllmUHSEpJCMI2GtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55N2uI86029018;
	Mon, 23 Jun 2025 04:56:18 +0200
Date: Mon, 23 Jun 2025 04:56:18 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250623025618.GA29015@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 22, 2025 at 09:58:52PM +0200, Thomas Weißschuh wrote:
> On 2025-06-22 09:19:58+0200, Willy Tarreau wrote:
> > Hi Thomas,
> > 
> > On Sat, Jun 21, 2025 at 10:21:47AM +0200, Thomas Weißschuh wrote:
> > > On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> > > > Modern programs tend to include sys/select.h to get FD_SET() and
> > > > FD_CLR() definitions as well as struct fd_set, but in our case it
> > > > didn't exist. Let's move these definitions from types.h to sys/select.h
> > > > to help port existing programs.
> > > > 
> > > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > > 
> > > <snip>
> > > 
> > > > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > > > index 16c6e9ec9451f..0b51ede4e0a9c 100644
> > > > --- a/tools/include/nolibc/types.h
> > > > +++ b/tools/include/nolibc/types.h
> > > > @@ -10,6 +10,7 @@
> > > >  #ifndef _NOLIBC_TYPES_H
> > > >  #define _NOLIBC_TYPES_H
> > > >  
> > > > +#include "sys/select.h"
> > > 
> > > Is this really necessary?
> > 
> > Not sure what you mean. Do you mean that you would have preferred it
> > to be included from nolibc.h instead (which I'm equally fine with) or
> > that you'd prefer to have an empty sys/select.h ?
> 
> The former.

OK thanks, you're right, that's more consistent with the rest,
I'll do that and push it.

Thanks!
Willy
