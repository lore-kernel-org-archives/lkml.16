Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9C29B777
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716588; cv=none; b=RauL3bhzDPVT7xg5hjrOt8Ci4i4Pb/jNygdkojmGQ1fq0nnMMrZYEOV+puvqJB+rrayXzufvwDyb4Hw8EFdbcsB7zNfoVYCCteL/hgyD4hkEVl1uMY3FhbikM1tVJ1LNarpbYgEv/wPlUveAWxOi0efCJ7+yskh8OlH5iX3z0j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716588; c=relaxed/simple;
	bh=08slndZrhwWzSSw3zfjB5kHoXn+Rs6C+EUSqMFJ3kjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAGK22X7Lm+ayR39cSR1SxQLWjfoxWH019zgCwzmKT6f1QYGrp3/rp46sQDRXdhuLRRgzxKeJuLHHw8w9UpX54NBsCAiAUODuZStmqZVY3rd3nnEhkpeDsBdqPy7avd5EThiot5wloG7oQO6MIDNi6XgsvhOPpcIbYK4KA3VXDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WLxYe3EQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WLxYe3EQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C883BC4CEDD;
	Tue, 15 Apr 2025 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744716587;
	bh=08slndZrhwWzSSw3zfjB5kHoXn+Rs6C+EUSqMFJ3kjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLxYe3EQMidKbd/78ZL7fhrrgiyGOMGPPMB2ThSeX1vXcVZkatVSIX5hbkALvznpC
	 mbFXJW2ovcK9Y24f5LYYaLgR4P2XO8ZbFgJOezTSkzupuRnUw54+rbYT5IOkJWhwgi
	 5L480r+xZApqC7TA4hUSs+JLbvm8kB1buHsa7ixM=
Date: Tue, 15 Apr 2025 13:29:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 RESEND] intel_th: avoid using deprecated
 page->mapping, index fields
Message-ID: <2025041536-exact-chief-f2c9@gregkh>
References: <20250331125608.60300-1-lorenzo.stoakes@oracle.com>
 <Z-q5Gf57y9LEZcUE@casper.infradead.org>
 <2025033142-rack-viewer-80d4@gregkh>
 <Z_0c1TGH27ecE4hM@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_0c1TGH27ecE4hM@casper.infradead.org>

On Mon, Apr 14, 2025 at 03:33:57PM +0100, Matthew Wilcox wrote:
> On Mon, Mar 31, 2025 at 06:15:14PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Mar 31, 2025 at 04:47:37PM +0100, Matthew Wilcox wrote:
> > > On Mon, Mar 31, 2025 at 01:56:08PM +0100, Lorenzo Stoakes wrote:
> > > > Greg, as we're late in merge window obviously now, could you roll up into
> > > > 6.15-rc1? Thanks!
> > > > 
> > > > This does not require backporting, as this is a critical change for mm
> > > > moving forward, as page->index,mapping are deprecated and will be entirely
> > > > removed extremely soon.
> > > 
> > > "extremely soon" as in "There are four places in the kernel which
> > > currently use page->index, and three of them are gone once Andrew
> > > sends his pull requests".  So this will be the last user, assuming
> > > nobody else decides to add a user of page->index in the meantime.
> > 
> > I'll get to it after -rc1 is out, thanks.
> 
> -rc2 is now out.

Sorry for the delay, now applied.

greg k-h
