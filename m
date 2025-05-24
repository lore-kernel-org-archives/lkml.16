Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487D14D2BB
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748099214; cv=none; b=UBRjDOGbVaZBuWMhsYE0Cj0d5P3ZzhYX+CVNC2piCOR2blGYbOtIhmn8YQkH/l6Bf3ybfHH3ozfQXnMCXWHbF/HL6Vx0mideb7VtVANTvfT4hEelqGkmYAPBt5ISLghU+QjFZubN5bxVe/kVqaEytLo+YeqfdHTQ1vAAxUHOiKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748099214; c=relaxed/simple;
	bh=tosEC4/ZOr1yqe2TKpJgAAQh8CIin3qlMSDYdQLf6Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryrAuSO03PE7yq6JsEDM6GR90+gWLQjry+/RlSu1m0+prIqXaKYlUTxQeRiFYSjUfIEwGMqbcC+j066V+IdVj9Gz46hh+9XvxQhcV0eLk7q58EwpopBL3Yjik++lFNaRtfyiFl3lmStIiTwV78qKLxVy4loiOmCvfOGQaeDgqJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=brCqruZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="brCqruZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6C7C4CEE4;
	Sat, 24 May 2025 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748099213;
	bh=tosEC4/ZOr1yqe2TKpJgAAQh8CIin3qlMSDYdQLf6Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brCqruZZhOqmhXJ/GMSHWreAtgX8/f6NOxWpcQB0vvDaL0qZJAlo/QnZvpSE7LDDx
	 KwKmg4vOcb4q1yhCiDuD048D1mWmNmV8BzizwOn4O4mHHJnNoTpmjt+0O8JS0XFpAn
	 eGbme2O4TctzSc6KOUakO5P+cvHM+PpOIce/pdTU=
Date: Sat, 24 May 2025 17:06:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <2025052413-freebie-salvaging-9ce6@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
 <2025052000-widen-lip-350b@gregkh>
 <aCz9jlMcXDooqx0s@kekkonen.localdomain>
 <2025052138-carport-applaud-61b8@gregkh>
 <2025052121-drastic-hacker-aab6@gregkh>
 <20250522220142.14876993@pumpkin>
 <2025052306-childlike-operating-d9c7@gregkh>
 <20250524134526.28285a0b@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524134526.28285a0b@pumpkin>

On Sat, May 24, 2025 at 01:45:26PM +0100, David Laight wrote:
> On Fri, 23 May 2025 10:36:45 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Thu, May 22, 2025 at 10:01:42PM +0100, David Laight wrote:
> > > On Wed, 21 May 2025 15:31:36 +0200
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > >   
> > > > On Wed, May 21, 2025 at 03:27:19PM +0200, Greg Kroah-Hartman wrote:  
> > > ...  
> > > > I tried it for the whole tree, and ugh, there are some real "errors" in
> > > > there.  The nfs inode handling logic is crazy, passing in a const
> > > > pointer and then setting fields in it.  So this will be some real work
> > > > to unwind and fix in some places.  
> > > 
> > > Perhaps change the really dodgy ones to container_of_deconst().
> > > And fix the easy ones so they compile with the 'const' check.  
> > 
> > Ick, no, let me fix these up properly.  I'm picking them off, and have
> > found some real issues here.  It will give me something to build patches
> > for over time while doing stable kernel test builds :)
> 
> I was mostly thinking of it as temporary measure help find the easy cases.
> 
> But having container_of_const() that preserves 'const-ness' and
> container_of() that always removes it seems wrong.
> Wouldn't preserving const-ness for a W=1 build would be a more normal way
> to do it?

Maybe, yes, but as container_of() has ALWAYS removed the const-ness,
that's what the codebase is used to, so let's just give me a release
cycle or two to clean up the tree and then I'll just move
container_of() to preserve it and all will be good.

thanks,

greg k-h
