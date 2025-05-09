Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8923535B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746812173; cv=none; b=cE2JRjHDO6p7IN05RRcF9Yyy49s0K+ZIeotAciyjzFgiqs2oUs+KhvlAnO3sdIEhVYJrA12+XBL5rkmWR1fzWuVdZ2j5EeQcP16ILYhqEGF6BPWpQ39tZG1GpsQVEP9sy6JG9lMaVxX5IDZqf6dvW/GkMCwBB05f5W9kZOg3+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746812173; c=relaxed/simple;
	bh=p/HkqmeWqXcl+NmY60t42MGEK9dVO94OTagr+6UU7oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyUAv4tVNZ+wI6PvISjHUNwGXTOjCbRBakoa1E4srJqH9ge3UpRctBlfChLhdbueRQWZml/1Jh1coeJCHszPGE3WJma6zQZ6dN5VH9IqpobPF9KmpM+RZirxtcQUd9m0YvHi4JR7rOgtdwFIdPbFsrhIupnEErd+VVPWyFSgEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=hGE8249x; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="hGE8249x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=0xspxWDvDTHB9zeZZsUEHKBZ5YKd1smCBy8bz97UshE=; b=hGE8249xXTGeZDgZ
	wC/9ggj/hHECEUie4uiOuJpkU8SQWAY8CsBb+FKW/aYHNVBdOukuD1vjGVXa3FVLAamL52vSJ30w6
	4Ovfn0AbyRWE6dLQHHvpF0wydbGg0ealq+x7huFI6nYRD3fd9lAPtiiwd9pq06jGh8a0ti4hHJDBp
	8DM9MdKWbQVpXs8eiNkuhv/lMiZA89v7f3bz9gjDfOGrAArXDGFnYEBfw0jH5Q++mxIyE/Sl+jNgW
	SK2Ttax2B2lKD6lC899t1/EIEhL0XHoPHv/yP50xjHlD13Cy2C+q89Qp85ULB3irqO7YXZbUW7w/t
	bzJoOL2YlLH3yVh30A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uDRdq-002jHl-19;
	Fri, 09 May 2025 17:36:10 +0000
Date: Fri, 9 May 2025 17:36:10 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: sm501: Remove unused sm501_find_clock
Message-ID: <aB49Co-q19pf3yO0@gallifrey>
References: <20250508002227.204836-1-linux@treblig.org>
 <20250509142945.GH2492385@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509142945.GH2492385@google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 17:35:41 up 12 days,  1:49,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Lee Jones (lee@kernel.org) wrote:
> On Thu, 08 May 2025, linux@treblig.org wrote:
> 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > sm501_find_clock() was added in 2007 as part of
> > commit b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
> > but hasn't been used.
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/mfd/sm501.c | 43 -------------------------------------------
> 
> Looks like you missed: include/linux/sm501.h.

Oops! Sorry about that, v2 posted; message id 20250509173521.49596-1-linux@treblig.org

Thanks for the review,

Dave

> >  1 file changed, 43 deletions(-)
> > 
> > diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> > index 7ee293b09f62..bdeea0047e1b 100644
> > --- a/drivers/mfd/sm501.c
> > +++ b/drivers/mfd/sm501.c
> > @@ -631,49 +631,6 @@ unsigned long sm501_set_clock(struct device *dev,
> >  
> >  EXPORT_SYMBOL_GPL(sm501_set_clock);
> >  
> > -/* sm501_find_clock
> > - *
> > - * finds the closest available frequency for a given clock
> > -*/
> > -
> > -unsigned long sm501_find_clock(struct device *dev,
> > -			       int clksrc,
> > -			       unsigned long req_freq)
> > -{
> > -	struct sm501_devdata *sm = dev_get_drvdata(dev);
> > -	unsigned long sm501_freq; /* the frequency achieveable by the 501 */
> > -	struct sm501_clock to;
> > -
> > -	switch (clksrc) {
> > -	case SM501_CLOCK_P2XCLK:
> > -		if (sm->rev >= 0xC0) {
> > -			/* SM502 -> use the programmable PLL */
> > -			sm501_freq = (sm501_calc_pll(2 * req_freq,
> > -						     &to, 5) / 2);
> > -		} else {
> > -			sm501_freq = (sm501_select_clock(2 * req_freq,
> > -							 &to, 5) / 2);
> > -		}
> > -		break;
> > -
> > -	case SM501_CLOCK_V2XCLK:
> > -		sm501_freq = (sm501_select_clock(2 * req_freq, &to, 3) / 2);
> > -		break;
> > -
> > -	case SM501_CLOCK_MCLK:
> > -	case SM501_CLOCK_M1XCLK:
> > -		sm501_freq = sm501_select_clock(req_freq, &to, 3);
> > -		break;
> > -
> > -	default:
> > -		sm501_freq = 0;		/* error */
> > -	}
> > -
> > -	return sm501_freq;
> > -}
> > -
> > -EXPORT_SYMBOL_GPL(sm501_find_clock);
> > -
> >  static struct sm501_device *to_sm_device(struct platform_device *pdev)
> >  {
> >  	return container_of(pdev, struct sm501_device, pdev);
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Lee Jones [李琼斯]
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
