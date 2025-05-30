Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD2E220F5F;
	Fri, 30 May 2025 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748641846; cv=none; b=MpIhdan8eflO4IdkEE/gzGNFQ/9TSQAP9yxk726bmwLlvtHqr4CuMcV7WlntKEvhOmuRWxsDtajfy1SNGD8KpHJHNMv5EGwrM8TnU2ktLAkagpHL5B6RcFR5ppMOGrXDhqJI+f1GprNZTSFP3fE04dTP4ZaY1bywrMKhgFkRoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748641846; c=relaxed/simple;
	bh=4yuA/iak0CSNITlPSlCCHMWfAv+IT2xKlGMIOL/Tnvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trgfKWNxdEoNmKl/wUCWLv+bmiril+g+ccyTNBHEsUkp0HWU7KgyXmPmnE2CSSurl56cmWExlP00bPZ0p9Nyj/yuju18p3i0NU9x0mtkMppLy1JkncBNjmlTrQ/uxjWLKZZ+w3aTxerk4v1sBuCPotHwki76smEaPsirx7550Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R83lPP6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R83lPP6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475DC4CEE9;
	Fri, 30 May 2025 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748641846;
	bh=4yuA/iak0CSNITlPSlCCHMWfAv+IT2xKlGMIOL/Tnvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R83lPP6JsIWq1HekWvJmi89r5vI2LoTp5PREV2J60yVEdgpvqwXrMc0BeYNd5MBtb
	 JkbYcsIRfj1ezasnzhMGLaDp89mVdDDJSDQYx4x9BXe3lpe1iFw29tcWCxbz0tyhHi
	 GejvZ75kqkdEZj3pD6E7RAmIJp+pXqgnDbKEvm0CMsAPuSjavcUl7ip6MkhxKPOuu/
	 vdlzAdmCm0zOtaA/rMLLKz/2Iqxk3XusRuK9isVVjrYwgKxsd6YcE550xlbiifftat
	 ynXsZd/QnB2amfvv/aydp5CqFm5mqzT2Ek8fPMenxf/BVs/0NZ/LAIHcVZBWvNEDSi
	 W9ULCzCMAULOA==
Date: Fri, 30 May 2025 23:50:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/9] More Rust bindings for device property reads
Message-ID: <aDooL3zCPV6jePUY@pollux>
References: <20250530192856.1177011-1-remo@buenzli.dev>
 <aDoNczwEWCDows_-@pollux>
 <DA9TOWRKLFUF.3AWTUTNDPI8OR@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9TOWRKLFUF.3AWTUTNDPI8OR@buenzli.dev>

On Fri, May 30, 2025 at 11:45:38PM +0200, Remo Senekowitsch wrote:
> On Fri May 30, 2025 at 9:56 PM CEST, Danilo Krummrich wrote:
> > On Fri, May 30, 2025 at 09:28:47PM +0200, Remo Senekowitsch wrote:
> >> changes in v7:
> >> * Fix a typo in a commit message.
> >> * Fix bug in `FwNode::display_path`. I took a slightly different
> >>   approach than the one suggested, using `Either` to handle the
> >>   owned and borrowed case. That also removes the conditional
> >>   `fwnode_handle_put` at the end.
> >
> > That's a good idea, but also a bit unfortunate; there are efforts to remove
> > Either [1] in favor of using - more descriptive - custom enum types.
> >
> > Can you please replace this with e.g. an enum Node with a Borrowed and Owned
> > variant?
> >
> > [1] https://lore.kernel.org/lkml/20250519124304.79237-1-lossin@kernel.org/
> 
> Sure, that seems reasonable.
> 
> Btw. what's the normal waiting time before posting a new version of a
> patch series? The requested changes have been getting fewer and I could
> crank these out much faster, but my gut feeling tells me not to spam the
> list too much. Or is that wrong and people can deal with quick updates
> just fine?

I think the pace was appropriate. For the current state, I don't expect much
more feedback, so it'd be fine to send an update for the enum change rather
quicky.

However, we're anyways in the merge window currently, so I'd recomment to leave
the patch series as is and send a v8 once the merge window closes -- I'll pick
it up then unless there's some further feedback.
