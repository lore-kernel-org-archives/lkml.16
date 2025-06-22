Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68D3153598
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750622337; cv=none; b=Hx8FWLMjsFcI1a4/BPpumo0rC/xSutaPbMOTyrcZvP5wKy07vAoyMMf6hfCvu/tESycGuaIWWJlekMT0lxbOuMWH13MoyCHWX2AiR5dUyEvRQ+1NyE5nlmy3hsfdFJVF/lgvBUTAmYG2W1ONXiJRxavkw/cArQuka64Nieqh0xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750622337; c=relaxed/simple;
	bh=5cc4lrUTVt5177oLnOvxoANkGbxpevHjnV/o5pYLj8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbN1pfTDEPIDW01SZex43au7DHvwQBj8sienhl7B4gmI2rSRuJTjJrBifTpi5r5v8e9NgSJe1z6ELbujrgENIag1CpwZHmuxAbEnq8OCufyAbqAV7NzE3pUMf+7hqITwytDC5M8LbEz9583zljY3ZlC0STpIoUVpSaktkvrHQZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=DABKzzmf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="DABKzzmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750622333;
	bh=5cc4lrUTVt5177oLnOvxoANkGbxpevHjnV/o5pYLj8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DABKzzmfi5VZYYRrs7+IQltyx/Rd2tX0wF8D/nDF3Y8xwH/rLu5Bn4EhInNS8Ssx+
	 ODpPAino51QJ+sWXW/FL5E9NXhWsWFKGaw9I/vS93d9T6vma/QL9Nqjbf9IXUaDXGK
	 QvaNz/PLYEXbpr1232u5x/h+UFo+qrfokJKgKFHg=
Date: Sun, 22 Jun 2025 21:58:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
 <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250622071958.GA3384@1wt.eu>

On 2025-06-22 09:19:58+0200, Willy Tarreau wrote:
> Hi Thomas,
> 
> On Sat, Jun 21, 2025 at 10:21:47AM +0200, Thomas Weißschuh wrote:
> > On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> > > Modern programs tend to include sys/select.h to get FD_SET() and
> > > FD_CLR() definitions as well as struct fd_set, but in our case it
> > > didn't exist. Let's move these definitions from types.h to sys/select.h
> > > to help port existing programs.
> > > 
> > > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > 
> > <snip>
> > 
> > > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > > index 16c6e9ec9451f..0b51ede4e0a9c 100644
> > > --- a/tools/include/nolibc/types.h
> > > +++ b/tools/include/nolibc/types.h
> > > @@ -10,6 +10,7 @@
> > >  #ifndef _NOLIBC_TYPES_H
> > >  #define _NOLIBC_TYPES_H
> > >  
> > > +#include "sys/select.h"
> > 
> > Is this really necessary?
> 
> Not sure what you mean. Do you mean that you would have preferred it
> to be included from nolibc.h instead (which I'm equally fine with) or
> that you'd prefer to have an empty sys/select.h ?

The former.
