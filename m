Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B18184;
	Thu,  1 May 2025 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746057826; cv=none; b=tfRVLpc2FGEPBFGGTu+aPtrghW3xG2S39hPJhEIEwTukt5phi8TVVO8gUtGhq2vacuPQE5MpICqMzmYuizW9FGjQh7QOAiuA7+L7nwDlPtAsxBRANFIGATg8tkFb3KfRCqcP2POTIbWpBxmRAyepPbmF0Qas32id738gkRbupwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746057826; c=relaxed/simple;
	bh=HSvs1bnyg4BC3jbDRswxpJ+Je2fR1xo06Chn7aYglKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PC7uTjtT+OXSAlkzK3AbyMVgSABCDKrkB6WOKxKEGZmiSp033MECFdTh+kvX+UT2JnuikJLLh+c4jrqf+NoCASYsRuUET+3MTHmnA0z3HcMUiYNs6hcMaGU4LxzCFhbd2esKMLiNH9dLh6O1P/FB4LT6u91M5cnY9no54dI5ak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ht4eA7/4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ht4eA7/4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=gmIYo8lOgmwsi+UAiYPxPn0BlIBBZzW9tyR+fod3Ez0=; b=ht4eA7/4Q/LfFI9U
	D+dt4gYnwBBqdS5nJ3X59JIP3nK0paHNCizwcOFFQx03M+gM9D6/n+F2O3z2vyeuXPY44Wk8mOXaU
	E2jI0OmVUf/toi1ssOVN4H6kwvqsETIvWwzs2y23T6+JSZE2VGtUq2SykUSC9piO0O3Sd5t17/tog
	77+DKTKC/Qi6WSTZF97m2mmd9jTmNpFU7tCkLzaMdG9YAFcPp60mO0MYS2outXlX160gYur1G1M1Y
	m48bvghLWjTQPKIyxSW0szMElQ8ZTnnf3hmaeRgta2LeOBPuljSB5vdPWAFw2/hlgY4PbGPH79cg9
	MKD2jXRlPIICO9Kuhg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uAHOk-000oU3-20;
	Thu, 01 May 2025 00:03:30 +0000
Date: Thu, 1 May 2025 00:03:30 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Regulator deadcode cleanups
Message-ID: <aBK6UqZDx3tWnBcm@gallifrey>
References: <20250426175143.128086-1-linux@treblig.org>
 <aA5Ad6bXfH5jPiss@finisterre.sirena.org.uk>
 <aA5F-_kJO0jFgKpQ@gallifrey>
 <aBKvw3KEikfdQbn7@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aBKvw3KEikfdQbn7@finisterre.sirena.org.uk>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 23:34:31 up 3 days,  7:48,  1 user,  load average: 0.02, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Sun, Apr 27, 2025 at 02:58:03PM +0000, Dr. David Alan Gilbert wrote:
> > * Mark Brown (broonie@kernel.org) wrote:
> 
> > > Please do some analysis as to why the functions are there, don't just
> > > blindly delete things.
> 
> > I'd appreciate some more idea of what you're after;  each patch
> > shows where and when the function was added or last used.  Some have
> 
> Something that indicates that this is a patch written by a human rather
> than some automated noise, that considers things like API usability and
> coherence, or what people might do if the API is not available when they
> need it, rather than just mechanically churning something out.  None of
> your commit logs consider what the code you're deleting does at all.

I do manually write each patch, but I don't have that global feel of the
API; but I do use my judgement to avoid some things:
   * I tend not to remove one side of an obvious pair of functions
     (e.g. a set/clear or an alloc/free)

   * I avoid things that look like a function for every firmware interface
     where the functions are almost documenting the interface.

   * I only bother deleting one line functions if it's part of a set.

and some others.  It's not automatic, but I don't claim to understand
the whole interface.  I will try and follow a thread if I end up deleting
something which then makes it look like something else isn't needed.
I do have _some_ feel - so have spotted some bugs where a function
should have been called.

> > comments saying things like the devm_ version is being used (so it
> > seemed reasonable to me to delete the plain version if no one uses it).
> 
> Deleting the plain version of something where a devm version exists is
> an obvious example of making the API less coherent and hard to use,
> managed resources aren't universally appropriate and so you should
> generally be able to do the same thing with manual resource management.

OK, that's something I hadn't expected - I'd thought if one style was
used for many years, that the other was redundant.

It can be quite tricky to see why functions have ended up not being
used for years (or decades), some is making a nice API, but sometimes
it's people blindly copying another API or who had a set of patches
which used the function but those patches got abandoned.

It also varies a lot between maintainer - some really prefer not
to have unused functions at all.

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
