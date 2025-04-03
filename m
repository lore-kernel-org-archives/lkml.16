Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92117BB6;
	Thu,  3 Apr 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689301; cv=none; b=XBSS8mJafbEHVr7re8EonOJmgL1WgIMXr/fAnMfNLXPdQf/1WdbM2D8MNjLISvm57eLeOQlTVvLRjbgujqm1yoTeQuci8ewt5fooLbiWGErnc08aS9qFsCOGePzQTilTHunhc68rwwJ5ZYqUhKfoiv4FoCaGAdhWV6upj+g7NoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689301; c=relaxed/simple;
	bh=7e2q0Qt34YzcyKMPAJZn2I4U9l7JZNhBc1fMhFKod8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Joxk1hu8hrk+iA3bSHNcwgQIvqMQMcTbfibIgoTteAhB/ynACyh0yyp+kdfFgEaH1wtE1T7XBS3/dHoDJo5uUPnikIDil4FtgdBCtxIMb2QOO7QpLJ7zWh3OIqpPd6SoRPt6lNYq8lfMEITTHuDKONlGEgFRNEJMF+yp6/844Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mzP3QOCv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mzP3QOCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85539C4CEE3;
	Thu,  3 Apr 2025 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743689299;
	bh=7e2q0Qt34YzcyKMPAJZn2I4U9l7JZNhBc1fMhFKod8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzP3QOCvjLBYHXRYCEOUsQaS7j8eD8Y2vVyi0Zwc3wnVqvHcijw4Pn3SsZC4XYpVM
	 bYnXcR5AMry3Vo29QjB2HOkwnIGJ+xLdhroCzJrtXwGU4pqNTkD2Dyt3rorOwDV/FK
	 S0NnJkDlVV6iVSIRbADMzuDUd/lE2eQfw1aRVmm0=
Date: Thu, 3 Apr 2025 15:06:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: modify struct field to use standard
 bool type
Message-ID: <2025040340-boogeyman-reclining-3cbf@gregkh>
References: <Z+05IEjV3pczMLNQ@HP-650>
 <4c35ae41-c834-e25a-ccab-5cdd34aa4680@inria.fr>
 <CADYq+faUTmNcUgk5jB3YHT4UCQZhf=Wsah1WUcPHqky6kp_cUA@mail.gmail.com>
 <2025040304-overdrive-snugness-8b05@gregkh>
 <c3ae531d-259c-4bfc-863d-45d08bdd6189@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3ae531d-259c-4bfc-863d-45d08bdd6189@stanley.mountain>

On Thu, Apr 03, 2025 at 05:02:45PM +0300, Dan Carpenter wrote:
> On Thu, Apr 03, 2025 at 02:54:01PM +0100, Greg Kroah-Hartman wrote:
> > > > > diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
> > > > > index b3535fed3de7..63343998266a 100644
> > > > > --- a/drivers/staging/rtl8723bs/include/sta_info.h
> > > > > +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> > > > > @@ -86,7 +86,7 @@ struct sta_info {
> > > > >       uint qos_option;
> > > > >       u8 hwaddr[ETH_ALEN];
> > > > >
> > > > > -     uint    ieee8021x_blocked;      /* 0: allowed, 1:blocked */
> > > > > +     bool ieee8021x_blocked;
> > > 
> > > > You should also check whether this is a structure that is read from the
> > > > hardware.  In that case, it would be a concern if the bool field does not
> > > > have the same size as the uint one.
> > > Hello Julia
> > > So following the conversation here,
> > > https://lore.kernel.org/outreachy/bf8994cc-b812-f628-ff43-5dae8426e266@inria.fr/T/#u
> > > I was able to compare the assembly code of the file before and after
> > > my patch and this were my findings
> > > 
> > > Original assembly code for
> > > # drivers/staging/rtl8723bs/core/rtw_ap.c:392    psta->ieee8021x_blocked = 0;
> > > movl  $0, 436(%r12)    #,  psta->ieee8021x_blocked
> > > 
> > > Assembly Code After Patch
> > > # drivers/staging/rtl8723bs/core/rtw_ap.c:392
> > > psta->ieee8021x_blocked = false;
> > > movb  $0, 434(%r12)    #,  psta->ieee8021x_blocked
> > 
> > So the structure size changed?  That's not good at all, and is what I
> > was worried about :(
> > 
> 
> You had complained about a different struct.  struct rx_pkt_attrib.  It's
> fine to modify this one.

Argh, sorry, too many different threads right now, my fault...
