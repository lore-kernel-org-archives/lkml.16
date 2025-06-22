Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A415A1537A7
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750576806; cv=none; b=ussOL4ktnCQvHeeSCX89LRbdhvds5bE9CO1ckfHewstwn6QQbGwDxp2FHiaMnI5m5fW29F867hkR45zaSHOUxtTQc2Cxa92MXm2tGgrBN5rr1AqvR5eI1DuBAtJIp/BHQjDm64ttysbQiCeIBRKOsGY90P59KsLfa87CmXM2fhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750576806; c=relaxed/simple;
	bh=5BB3iDtxPiN7wmjVuZ1ayOeMfGJZNuVaVYUYOS/bylY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GE5x8y7krtlE9Ol6j2dCpG3tct7fK3XS/4sHAgC0NEDX3VlLysoarYQRo5qGjKR9whWP6vpSZ7M4I4i3/ppKGMjPvWj9tINUkHLBmVtbGfjF9PqDH+jXgJzvvcvsgHzJKr7oHGyH3QORykUWBoWCXAvlDpLaAXgMqZeHLEJ1dQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55M7JwNc003678;
	Sun, 22 Jun 2025 09:19:58 +0200
Date: Sun, 22 Jun 2025 09:19:58 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250622071958.GA3384@1wt.eu>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

On Sat, Jun 21, 2025 at 10:21:47AM +0200, Thomas Weißschuh wrote:
> On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> > Modern programs tend to include sys/select.h to get FD_SET() and
> > FD_CLR() definitions as well as struct fd_set, but in our case it
> > didn't exist. Let's move these definitions from types.h to sys/select.h
> > to help port existing programs.
> > 
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> 
> <snip>
> 
> > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > index 16c6e9ec9451f..0b51ede4e0a9c 100644
> > --- a/tools/include/nolibc/types.h
> > +++ b/tools/include/nolibc/types.h
> > @@ -10,6 +10,7 @@
> >  #ifndef _NOLIBC_TYPES_H
> >  #define _NOLIBC_TYPES_H
> >  
> > +#include "sys/select.h"
> 
> Is this really necessary?

Not sure what you mean. Do you mean that you would have preferred it
to be included from nolibc.h instead (which I'm equally fine with) or
that you'd prefer to have an empty sys/select.h ?

Thanks,
Willy
