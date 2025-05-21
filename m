Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971174040
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834043; cv=none; b=GPj3kZbfY89IiamEctB2HuOXWNuvRoySIP0IV10TpyXBHUQLWAcNHVUTbpktceEuOri0ypS8wAkwwL/dJl9ABsQfDXy6ZVyzOkKN8Ll8py80oZup/IKPCxo13ZM/ZPL86qDzAJlO4pF29Bx0j1ALKwqu0CMFkykvY6SbF6ZQaE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834043; c=relaxed/simple;
	bh=xjFng9sdMzEFMX072tCQ9nsFr/cdpH/wI9japwTPBBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADdFrtt9/CnximiieKWoS1texRKYEQuE9qlv6oCH1oWtWKc8msJhPGbmRgNKFpiCv0t4xCiCR1i/ZvolDoPyeN7cRC/K4cjYDzhEi1nbFplui2Xa0vbuBZ20BZbvg1di+k0uHbGQLUM3LSQ2UfX2uh6w/xIjZzuAWQmK2O5Lygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jv+kAAAq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jv+kAAAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67908C4CEE4;
	Wed, 21 May 2025 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834043;
	bh=xjFng9sdMzEFMX072tCQ9nsFr/cdpH/wI9japwTPBBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jv+kAAAqFeIsWMj8Fom2dnW0M/SGE7/3t5nV5bOsMFtR8UAR5LGitH2MvyMyAxldl
	 LakRF6XRNDeh3wDkqCbzkdBkDoqHjboCtagxWQ/2vOjBa5CCkpgJXQuMWjmEpot0c4
	 iztYMnZk0NZ/TSRxPsNgKps4CaSf6Wg0aPc4u314=
Date: Wed, 21 May 2025 15:27:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <2025052138-carport-applaud-61b8@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
 <2025052000-widen-lip-350b@gregkh>
 <aCz9jlMcXDooqx0s@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCz9jlMcXDooqx0s@kekkonen.localdomain>

On Tue, May 20, 2025 at 10:09:18PM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Tue, May 20, 2025 at 04:30:19PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 20, 2025 at 05:16:45PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 20, 2025 at 01:34:37PM +0300, Sakari Ailus wrote:
> > > > There is a warning in the kerneldoc documentation of container_of() that
> > > > constness of its ptr argument is lost. While this is a faible suggestion
> > > > container_of_const() should be used instead, the vast majority of new code
> > > > still uses container_of():
> > > > 
> > > > $ git diff v6.13 v6.14|grep container_of\(|wc -l
> > > > 646
> > > > $ git diff v6.13 v6.14|grep container_of_const|wc -l
> > > > 9
> > > > 
> > > > Make an explicit recommendation to use container_of_const().
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Hi Greg, Andy,
> > > > 
> > > > I guess we generally agree the additional constness check in
> > > > container_of_const() is useful, but adding the same check to
> > > > container_of() generates warnings -- there are some errors, too -- such as
> > > > this one currently:
> > > > 
> > > > In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
> > > >                  from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
> > > > /home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
> > > > /home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> > > >   291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
> > > >       |              ^
> > > > 
> > > > As noted above, 646 new missing constness checks were introduced through
> > > > container_of() macro use during the 6.14 cycle alone. Most of these are
> > > > likely harmless, but with so many new users some are bound to be ignoring
> > > > constness.
> > > > 
> > > > Once the warnings from bad container_of() use are worked out in a way or
> > > > another, the constness check could be added to the container_of() macro
> > > > and the current container_of_const() be dropped altogether.
> > > > 
> > > > If this patch is accepted, I'll see how to add a warning on container_of()
> > > > to checkpatch.pl.
> > > 
> > > Hmm... Wouldn't be better to fix non-const cases and add the const check, etc
> > > to the container_of() instead of doing these comments?
> > 
> > Yes, fixing up the existing places where it is broken would be best, how
> > many of them are there now?
> 
> Adding constness check for container_of(), with my partial build on x86-64
> I'm getting 893 such warnings. A fair number are probably duplicates or
> repeat of the same pattern, but also the compilation didn't succeed --
> there were multiple compilation failures.

So who is going to do that work?  I just did it for drivers/usb and it
was pretty trivial, just declaring "do not use this!" feels like the
easy way out, absolving yourself from any responsibility here :)

thanks,

greg k-h
