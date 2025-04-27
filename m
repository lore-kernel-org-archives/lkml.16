Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0602810942;
	Sun, 27 Apr 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745765891; cv=none; b=quM04Es4LDh8ZqIr1P0Pm9P5PPxBkIVYNMK5MkfSb2VSTM5TebJy74PD2W3w7LX/mglj/bkrPL6ImCC38uL3srTEzovg3JqopYXow5b6BkqOM34lCp8Fxi4QPVSvdVELr5nSuhunTRICkNKfcGpP8c3NbG4Aj4yAqihoZ6Pd9W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745765891; c=relaxed/simple;
	bh=jg94VLsINpu8YEl40duGRf8dqgQxrXXgUAScLGneAU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSBkW7ZseSSMn/cVfnLU7TMqjZJKhWNafBW9n2GSox3jXdDAfMqvcTfU7SML1JzBV0VAXUINtkY/fSPMHpyEy7lDea7JdD+Jaes4PbwJ/WiXu30KphG5tTLpu7i1AzMxrX1vTuPVtP5mM/0/U/Nmqwc2R8ClUYQu/9UjGUtaTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=eL+zur8z; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="eL+zur8z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=KLoXnd2vz/RwoKw+jyebA+BqhR28jj4sOIBNnWN/wkw=; b=eL+zur8zvg7AgkWD
	NwI4zPxFUD7ujB9vQ5EkogHAn6qwDNWe/y2jl/QEwN3m5EnihRXylkh37OvnLab7+VTDs7As0Mk4A
	W1pEpv4tVnMjGlFrmiUTTKMWenqQVHNJGoT3shxBht/wHVvezd9vEq+dxcWiy3ApDz/pmufXFQVPB
	dgICazlnB0wA/b03uuCaChife2ukqHN++OCK3Aa2Dy+UFXzcxnoT5jJkL0O33f5761FXuhQtxfxhf
	bqaEc97lZMhuJTyxAQPyItyEId2YuWlueNM2NEh8FdUqba4WpuciIBxKi1wRr7GreOhLurnfYquMD
	9HG8r7yTZQJ17Rw+7g==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u93SF-00E97A-1B;
	Sun, 27 Apr 2025 14:58:03 +0000
Date: Sun, 27 Apr 2025 14:58:03 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Regulator deadcode cleanups
Message-ID: <aA5F-_kJO0jFgKpQ@gallifrey>
References: <20250426175143.128086-1-linux@treblig.org>
 <aA5Ad6bXfH5jPiss@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aA5Ad6bXfH5jPiss@finisterre.sirena.org.uk>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 14:47:03 up 354 days,  2:01,  1 user,  load average: 0.13, 0.03,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Sat, Apr 26, 2025 at 06:51:38PM +0100, linux@treblig.org wrote:
> 
> >   This is a bunch of deadcode cleanups for functions
> > that are unused (for quite some time).
> >   The first patch was originally sent in October last
> > year but didn't get any traction; the rest are new.
> 
> Please do some analysis as to why the functions are there, don't just
> blindly delete things.

I'd appreciate some more idea of what you're after;  each patch
shows where and when the function was added or last used.  Some have
comments saying things like the devm_ version is being used (so it
seemed reasonable to me to delete the plain version if no one uses it).

For each one I've checked _when_ it was last used and not deleted
anything that's been used in the last few years; I've not deleted
anything which has been recently added or only recently unused.

That level seems to have been fine on the other ~300 clean up 
patches other maintainers have taken; you seem to be after something
different - I'm fine to add that if you can just explain what
you want.

Just point me in the right direction and I can have more of a dig.

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
