Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41451A072C;
	Tue, 13 May 2025 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163077; cv=none; b=GsJkgN2PLGCiYLz1pQwdswWud0ufXLvG8TyNeOkcfx1SgAo0ZCNHu1pWggU6RF8EiBPou4qyRdp+8gknUAhdh+AwahfKaNpEioeJJUJbeQeambssRNdYyYOb4KpAVuZ0Z6EWSMWybtV8p7qAHj52V/v36iIRhu8VcDfJ/Xrukt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163077; c=relaxed/simple;
	bh=sDuHo93isYghiiBYv+xqLuH+UyDBbRsgyEi0EpzCMko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMQYke+yRdhab2wnH1JAIkKr/7IRAoK5Yojo4U/z0aYfUCviGd4PZV1VD4upc0ByDV4QlS2XtttXyRxUOCJpDOia8KOTOn+7xCstw7HGsKSQk9xCQKrxWgNyoCuzrpXUQX/1eld9JX0Si5qQTuBqVjX57cJQ8E6NMh2r3xjb7wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=X/25d2Ts; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="X/25d2Ts"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EBnofz+eGN9yhf1pLEiuUA0D374b3jLSqxG9c+iVTrg=; b=X/25d2TsutOp5hIOpE4y4FroYq
	7EPlPDA473wZMu/twwo1zDWCRPIhbMKaoG8/qBG9tpRQnoncOCw0m0zQrUJ+2w4R5TbgfOy1v61MZ
	Y7UZz8fAi/Vagg9wgD1vcZYGyxV/3rkFlyNKbokYGvTZUmZFBjMjJGYIx+8SEocOOs6ItmMmU1XAq
	//6TGLBIM9wXc+1CVMRfRo7/WvBALWZIlW2FrHGBHOaIMutltOM3wOhhp8snFO5HcPR8cOKTke7BL
	AugyBGN2S5Y6WlTV4fZmxufzeWgYvfSqpYbMDLGdVjsX5Wd8GgIEZMQiw7suNVPI4TgmhW+aEhxxM
	faN8AY+A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuvV-000000041rc-3rGi;
	Tue, 13 May 2025 19:04:30 +0000
Date: Tue, 13 May 2025 20:04:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <20250513190429.GH2023217@ZenIV>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <20250513041249.GF2023217@ZenIV>
 <0e43117a-d92c-4563-ad2d-de6cbd02e986@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e43117a-d92c-4563-ad2d-de6cbd02e986@p183>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, May 13, 2025 at 09:33:34PM +0300, Alexey Dobriyan wrote:
> On Tue, May 13, 2025 at 05:12:49AM +0100, Al Viro wrote:
> > On Mon, May 12, 2025 at 07:08:53PM +0300, Alexey Dobriyan wrote:
> > 
> > > I split them like referendum ballots to see where the consensus at and
> > > not have big single discussion thread.
> > 
> > Just in case - consensus would look like a lot of replies in support and not
> > simply the lack of replies, right?
> 
> Well, it is l-k, so absence of NAKs counts as OK.

In your reality - perhaps...

BTW, somebody ought to inject a bit of reality into the ridiculous wikipedia
page on LKML.  Starting with
	* a lot of developers are not and had not been subscribed to it
for decades.  That includes Linus, among other people.
	* those of us who still are subscribed to it have to choose between
reading through literally thousands of postings and dropping most of them
unread.
	* an l-k posting not Cc'd to saner lists and/or specific people 
is quite likely to be missed.

So absense of NAKs on l-k may or may not count as "OK" from your point of
view, but it does not mean that there is any kind of consensus.  

More to the point, if your... suggestions would go into D/CodingStyle,
replying to objections along the lines of "where the hell has that come
from and when have I agreed to that?" with "why haven't you replied
when I posted them to l-k?" is *NOT* likely to be well-received.
