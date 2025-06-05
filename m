Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A945D198A2F;
	Thu,  5 Jun 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136899; cv=none; b=KSjNpqYd7K3aCPNumY9e7DfQovVZUdH6e1J19wdTd6Ltrit94zlMAbFxi9c+4lWwKZPa9slnI/1zFQ2rXD+TQW80/XyudGeJ6Q9oCBUzRSo9z7V7o5TW3Us22avRqhipQPpf66pN6mkP/aK6OVTYixIc2Vp2GTxp1ug+GqBdifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136899; c=relaxed/simple;
	bh=9ueHukwHpA7c7Ig0/BfLIL8H36ipvq5+RGsnKZYxwno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owxvcg5UScYkyLcJXaWlabcvolsKV+aQ1sbUeATgv1viWLahw3qBrhl4XAh+be9Zy7BegmYrYiIh6x1ceTN9wA5XBsfGPIH6w5JXgf3MNQNWmrB8zdLiy+6obBg1GhjhXxYNm1rJRBQ49kKHLMbBky9BlOvWP0mWECjJvcCVcWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCY5MjyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCY5MjyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F848C4CEE7;
	Thu,  5 Jun 2025 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749136899;
	bh=9ueHukwHpA7c7Ig0/BfLIL8H36ipvq5+RGsnKZYxwno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCY5MjyGtREaH4wIaUtsvO82Yp7vf4Jh7SVRj3zd2bMihQZ9DoZcOhuAqxOdLs+JS
	 1h0pX39Ad0T8KxNYhvdcgxBBMbPei/HHBVkPnKPHtl/34PVi0HxzgjGFvLkwzAJOg3
	 Wo8NT+xbgh/myTaLBCWbX2jZTzC9t2xsnFSmx93lxQWI601ZAXtfihTLUebxaPltYW
	 tvofFAh/Hx++sme6FcUFBqElmvaCj4FOKsG7YVASHrdL2yrIJu+bK/6IDqCQUSYXob
	 pLPmmKdfQq9iKj1F+Z26PgLD+um+CB+cjXml6IMwQsj7ptRXOoGm5y2Hk9g/YyZGj5
	 vzrfIR3xaJ8lg==
Date: Thu, 5 Jun 2025 10:21:36 -0500
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <20250605152136.GB2539727-robh@kernel.org>
References: <20250530192856.1177011-1-remo@buenzli.dev>
 <aDoNczwEWCDows_-@pollux>
 <DA9TOWRKLFUF.3AWTUTNDPI8OR@buenzli.dev>
 <aDooL3zCPV6jePUY@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDooL3zCPV6jePUY@pollux>

On Fri, May 30, 2025 at 11:50:39PM +0200, Danilo Krummrich wrote:
> On Fri, May 30, 2025 at 11:45:38PM +0200, Remo Senekowitsch wrote:
> > On Fri May 30, 2025 at 9:56 PM CEST, Danilo Krummrich wrote:
> > > On Fri, May 30, 2025 at 09:28:47PM +0200, Remo Senekowitsch wrote:
> > >> changes in v7:
> > >> * Fix a typo in a commit message.
> > >> * Fix bug in `FwNode::display_path`. I took a slightly different
> > >>   approach than the one suggested, using `Either` to handle the
> > >>   owned and borrowed case. That also removes the conditional
> > >>   `fwnode_handle_put` at the end.
> > >
> > > That's a good idea, but also a bit unfortunate; there are efforts to remove
> > > Either [1] in favor of using - more descriptive - custom enum types.
> > >
> > > Can you please replace this with e.g. an enum Node with a Borrowed and Owned
> > > variant?
> > >
> > > [1] https://lore.kernel.org/lkml/20250519124304.79237-1-lossin@kernel.org/
> > 
> > Sure, that seems reasonable.
> > 
> > Btw. what's the normal waiting time before posting a new version of a
> > patch series? The requested changes have been getting fewer and I could
> > crank these out much faster, but my gut feeling tells me not to spam the
> > list too much. Or is that wrong and people can deal with quick updates
> > just fine?
> 
> I think the pace was appropriate. For the current state, I don't expect much
> more feedback, so it'd be fine to send an update for the enum change rather
> quicky.

Yes. General rules are no more frequent than 24 hours, but generally 1-2 
weeks. It also is a function of amount of review. No review, wait. If 
there's enough review that the current version isn't going to get more 
review, then go ahead and send another version. When things are close to 
merging and the changes are small, you can pick up the pace a little 
(outside of the merge window). 

> 
> However, we're anyways in the merge window currently, so I'd recomment to leave
> the patch series as is and send a v8 once the merge window closes -- I'll pick
> it up then unless there's some further feedback.

You'll need to fixup the user drivers/cpufreq/rcpufreq_dt.rs that 
landed in the merge window.

Overall, this all looks great to me. Thanks for continuing to push this 
forward.

Rob
