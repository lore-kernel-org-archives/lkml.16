Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8F6158535
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989408; cv=none; b=ary4k2032j1W/AOo/Lg+9Xu9W9x4MjQdKnIEuYTDsMUXi0MpeuyugBXGfulFR9aGiTgjy7O/OZywxWuyqXgVOY3RYmfugfguLeG2Qj7zTgik3BmRHUjM9ITV3UQ8Kzr1QYQEnEmFM5EWKoAGGFDFmPFgGsfaH26xYPmJ2CUxVlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989408; c=relaxed/simple;
	bh=V+cVhh0+RqApElsqrP57oXouUjLJ6b/UgVZaqBCH0Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHyybDWByME0Up19pnwehP4xmqpr5xfBtJNtpSUBcs/eq9ibgbYlfFgG0/A1LXNQCe6Go7wTYPH3Trl1ygGqg1PhnEpkF5B+HVw8mf5kq1v71qEU40LuFp7tApU+RKArPbjIlyUzcytPrEVSVGo6KcEzmzvHRdo/aq3YZko6Fus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZYmH6Mhq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZYmH6Mhq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7E2C4CEE9;
	Fri, 23 May 2025 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747989407;
	bh=V+cVhh0+RqApElsqrP57oXouUjLJ6b/UgVZaqBCH0Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZYmH6MhqzKFKCVONX+z7lJPBI+vhRS82dN6qe/cWt3G1Qaz8ao8XyCVD4lnhzJUvm
	 qmSE0JzBqe7cFsVaaV8uMdd83mS4o9Ofg0AQxteMROYoMPLv/ARry5AovB95JzEWd1
	 XZa+HPASts2I+fKsgNMiNHmD6mv4axwTjZ4+QfNM=
Date: Fri, 23 May 2025 10:36:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <2025052306-childlike-operating-d9c7@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
 <aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
 <2025052000-widen-lip-350b@gregkh>
 <aCz9jlMcXDooqx0s@kekkonen.localdomain>
 <2025052138-carport-applaud-61b8@gregkh>
 <2025052121-drastic-hacker-aab6@gregkh>
 <20250522220142.14876993@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522220142.14876993@pumpkin>

On Thu, May 22, 2025 at 10:01:42PM +0100, David Laight wrote:
> On Wed, 21 May 2025 15:31:36 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Wed, May 21, 2025 at 03:27:19PM +0200, Greg Kroah-Hartman wrote:
> ...
> > I tried it for the whole tree, and ugh, there are some real "errors" in
> > there.  The nfs inode handling logic is crazy, passing in a const
> > pointer and then setting fields in it.  So this will be some real work
> > to unwind and fix in some places.
> 
> Perhaps change the really dodgy ones to container_of_deconst().
> And fix the easy ones so they compile with the 'const' check.

Ick, no, let me fix these up properly.  I'm picking them off, and have
found some real issues here.  It will give me something to build patches
for over time while doing stable kernel test builds :)

thanks,

greg k-h
