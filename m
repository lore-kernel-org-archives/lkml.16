Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579D91C173F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015951; cv=none; b=nazR1dxjLoypDbUfdBOr0FLtUQVDC1MZZDh/Mh5qIvOJx6kw6n5lNk6UIzD8pK0hSS2ZIkWSWwkcz+kwWg9d+IyXIYkLtKg13iFeJvxHkS3gLK4O16nX5rcxnaQxhTVwBZqGT5JyF2WPRjV3WzxdX/pByaDFPvBhL2OO650ago4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015951; c=relaxed/simple;
	bh=OvhDiCfIW7F3Po3JmIAetfT+uV8brfLhLkiTndCsp6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUhJDSFPVemFX6SkDGi2JT2xIOl/V+7FyQ8IhI6E/cxwVkIzYr0xhPj/3P8mFMtjCxDyLbDu2sDKMzH92Nw9yA8pEfHcxGrm5CG1AM8SuSYjtmCskXdhrtNaXFbWgrKjvNhl4hGTVl7my1RjHzesRNqdRIP+5S/AsA4KEId5YxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=iP7H9D2m; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="iP7H9D2m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=8HVkoOLOWo5higWwpqBPXqJ4aIJ/4CrWkQaRfwTgh8g=; b=iP7H9D2mPbeY5/sB
	oL9H/1GSvuBRS3oCh2TA7/Et+XZdsKZB+MXB7y88A6x2liBxQeF9Ob3MUzArIEX0lqAuPrYM93rLi
	uQdod3m/IEY+coeVWwgc0w/6LX4bJpbBhi46E4l61JFGZjQoxz95gY08Zhbxo5+vQJJPIgLTDvOS1
	R+pFmu+PkwBnxhZkYWUpEDWDusHA5iFtZrxhxjMYw4IqFEqO31oFstoHrRQ8F3GErbjWLJvNBcUFb
	u8XeWtlhDKbQuEvO1UTUB68U9+oW8jTMHxi1H2rMtIwEidYQwKzjm2ryHKJYT2oHbQ1o2PdDu05Tz
	YnRcbWXbdvQ0zH5skA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uA6VU-000f9I-1Q;
	Wed, 30 Apr 2025 12:25:44 +0000
Date: Wed, 30 Apr 2025 12:25:44 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tglx@linutronix.de, fei1.li@intel.com, linux-kernel@vger.kernel.org
Subject: Re: [REPOST PATCH] virt: acrn: Remove unused list
 'acrn_irqfd_clients'
Message-ID: <aBIWyN3xrUIbLQU1@gallifrey>
References: <20250430003623.313541-1-linux@treblig.org>
 <2025043030-theology-driveway-20b8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <2025043030-theology-driveway-20b8@gregkh>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 12:23:15 up 2 days, 20:36,  1 user,  load average: 0.00, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Greg KH (gregkh@linuxfoundation.org) wrote:
> On Wed, Apr 30, 2025 at 01:36:23AM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > It doesn't look like this was ever used.
> > 
> > Build tested only.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > Acked-by: Fei Li <fei1.li@intel.com>
> > ---
> > This is a repost of the patch originally posted last in May
> > last year as id 20240504174725.93495-1-linux@treblig.org and
> > Ack'd by Fei Li on 20th May, in Zkq183IzBA6cV9FE@louislifei-OptiPlex-7090
> > No one picked it up.
> > (Fixed one typo in the subject line)
> > 
> >  drivers/virt/acrn/irqfd.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/virt/acrn/irqfd.c b/drivers/virt/acrn/irqfd.c
> > index b7da24ca1475..64d32c8fbf79 100644
> > --- a/drivers/virt/acrn/irqfd.c
> > +++ b/drivers/virt/acrn/irqfd.c
> > @@ -16,8 +16,6 @@
> >  
> >  #include "acrn_drv.h"
> >  
> > -static LIST_HEAD(acrn_irqfd_clients);
> > -
> 
> Odd, why doesn't the compiler complain about this?

Because it is used - by its own initialiser!
I filed a gcc bug for it:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115027
and someone has written a patch but it hasn't gone further.

> I'll queue it up in a bit, thanks!

Thanks!

Dave

> greg k-h
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
