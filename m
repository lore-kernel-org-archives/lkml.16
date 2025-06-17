Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC9CA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120579; cv=none; b=jQshSDZKdzN7Sc5IsaKmhpp/sngBuX77wJfYibSC5dMH/N2rKSt/Jh+pmEfS0B2DLIK3hMl5uDxShF8nwudgXzknvuqW8G3rjzU3ju3ZiPgL+7jPUw5RvF5/iW7RU6SHVBdOM7CzWxhRsBHIDAmCwtaM7OH4+RtNqu7ZP7M2WI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120579; c=relaxed/simple;
	bh=JuBTSztdRmKPHzRbqL2cxBw4TBn+Dbm187VF807ZEC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERhk9N5esLphhqVEax/LNZq/dpBgmiVbodsFszKT58tL8xD+Xflk0b2GVXesl1Y+eLEXSF7jNhOY5RzVdqgCnQgtqGLA1I3EpudHDPKW5W8Doh0ZI0WQFu7mwXfR5Cj3qJ4rRv84+ztLPV+YlqBSJx1Nl7JyfjiFaAPtyaTpSXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=kkGlGFav; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="kkGlGFav"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=7hWqOMXV3EuW3+rxnWEfLBOUrnfonUmK2Izy+zK27mU=; b=kkGlGFavs66xVJUF
	e6MLS8pq8sBrb4GO6wrZdVhsJNVswWjJ57Ec3B4tO0yNzJI67+BRGOm864ApWezyUNFjqfLgTTUQH
	U1EQFA31Aij/1BGThajVkPi5hGIjpNwWqX4gyITlySpyJjpP4hHi/TtEUySCOr8E0aGS6L3jKPrcW
	FqeYXwIJZx9UyHCdg/gtwl/LMN7sV0mZ2+dCHd574RGR2yN6Ooy3vl1X112Mix00I5U0nrDGGAGHs
	YYmGB4Mb1vseY3jdUceRCLuQfWIMVHpRWzWRiYSbqJnUGgHHqeXFzWHCcN1/n9lZBvuiCy+9bWITH
	el1TDUzaLp2odtGI7A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uRKJE-00A00N-05;
	Tue, 17 Jun 2025 00:36:16 +0000
Date: Tue, 17 Jun 2025 00:36:15 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Of mei suspend/resume unused irq code
Message-ID: <aFC4f9Z9J1v84Il5@gallifrey>
References: <aE9MIykCS71RFnA5@gallifrey>
 <CY5PR11MB6366E9288400660CC23AA8A8ED70A@CY5PR11MB6366.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366E9288400660CC23AA8A8ED70A@CY5PR11MB6366.namprd11.prod.outlook.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 00:35:30 up 50 days,  8:49,  1 user,  load average: 0.00, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Usyskin, Alexander (alexander.usyskin@intel.com) wrote:
> > Subject: Of mei suspend/resume unused irq code
> > 
> > Hi,
> >   My scripts noticed that vsc_tp_request_irq() and vsc_tp_free_irq()
> > were unused, since your:
> > 
> > commit 9b5e045029d8 ("mei: vsc: Don't stop/restart mei device during
> > system suspend/resume")
> > 
> > they were only added just before that one, in the patch that fixes;
> > so I wondered whether those should be deleted as well?
> > 
> > (I've been doing unused function deleting - but don't normally do
> > recent ones, so thought I'd ask).
> 
> It looks like the oversight while removing actual HW operations from
> suspend /resume flow.
> These functions can be safely removed.

Thanks, please see the patch I've just sent:
 ' [PATCH] mei: vsc: Remove unused irq functions'

Dave

> - - 
> Thanks,
> Sasha
> 
> 
> > 
> > Dave
> > --
> >  -----Open up your eyes, open up your mind, open up your code -------
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
