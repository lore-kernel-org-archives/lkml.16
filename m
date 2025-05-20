Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A84EEDE
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751422; cv=none; b=AH1W1M9HiKbMY1R16griWHiNCTDA6dXrrRdmkqz4TKAMOe0botX0UxcwX9RCdv/Rxqg1mZxXUtc3VRRevBgskBDdE88z5ag6xOoIhQVFhjlFsvGqVry+X3945BSr/RQ9tzS058vF8KRCXv9+KoyGvtOIahgpNMpAx3FtXtyadlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751422; c=relaxed/simple;
	bh=tDxFg5u7htARHr4/+5MkmgEU9t8HaQ9XdhHL6oCTbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLdDlcbFY9pRa5+uQ6L25LVEDEgv1ZS++Xj/GiKPbMOMNfdiN59OqczkJw79s1pnP+Tkbh6nlEAdr0YUJoCC4antRmXapvZ6CnEsb3QEYs7+fSzhY8sKQvNtYizRwoTAQYTjYF9sYXRLjONAdnAPjKBUA57B/RQVmA2rK3OLbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0i9OMxnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0i9OMxnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF68C4CEE9;
	Tue, 20 May 2025 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747751422;
	bh=tDxFg5u7htARHr4/+5MkmgEU9t8HaQ9XdhHL6oCTbIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0i9OMxnJZc8zYB9c3yoqFwnbfGGIK4pwY7ZJI1uEHMYiYQHZ791OpXV57EQfzzIYg
	 k0+/7CCayFJkYr8ZnvQ5OCRUIJMF1BtKDiF8MD+jti2fu1iVGaS+oaB7W0ASXLqrZO
	 aHoWyg7RTsSoazl7uvqL2y9A7xYnz3Ms38mdyPV8=
Date: Tue, 20 May 2025 16:30:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <2025052000-widen-lip-350b@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>

On Tue, May 20, 2025 at 05:16:45PM +0300, Andy Shevchenko wrote:
> On Tue, May 20, 2025 at 01:34:37PM +0300, Sakari Ailus wrote:
> > There is a warning in the kerneldoc documentation of container_of() that
> > constness of its ptr argument is lost. While this is a faible suggestion
> > container_of_const() should be used instead, the vast majority of new code
> > still uses container_of():
> > 
> > $ git diff v6.13 v6.14|grep container_of\(|wc -l
> > 646
> > $ git diff v6.13 v6.14|grep container_of_const|wc -l
> > 9
> > 
> > Make an explicit recommendation to use container_of_const().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Greg, Andy,
> > 
> > I guess we generally agree the additional constness check in
> > container_of_const() is useful, but adding the same check to
> > container_of() generates warnings -- there are some errors, too -- such as
> > this one currently:
> > 
> > In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
> >                  from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
> > /home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
> > /home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
> >   291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
> >       |              ^
> > 
> > As noted above, 646 new missing constness checks were introduced through
> > container_of() macro use during the 6.14 cycle alone. Most of these are
> > likely harmless, but with so many new users some are bound to be ignoring
> > constness.
> > 
> > Once the warnings from bad container_of() use are worked out in a way or
> > another, the constness check could be added to the container_of() macro
> > and the current container_of_const() be dropped altogether.
> > 
> > If this patch is accepted, I'll see how to add a warning on container_of()
> > to checkpatch.pl.
> 
> Hmm... Wouldn't be better to fix non-const cases and add the const check, etc
> to the container_of() instead of doing these comments?

Yes, fixing up the existing places where it is broken would be best, how
many of them are there now?

thanks,

greg k-h
