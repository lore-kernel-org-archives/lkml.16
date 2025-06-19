Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E11189905;
	Thu, 19 Jun 2025 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344822; cv=none; b=XcQmQgOzSXUKYVqzKhLTzr7ErMgS86DKHaEVIQin7FsvZnE8AqSP6I9s7qgsF+45ghxg4mjGMOS0MY/q0Xeo/VOLa1mkZZupafDzZ8sHLWkHoYuqMSfweo8R5tbL7AgFB/16/JZXMezUWu0eL5tk05tCFD5mYaspcKLHEQGqSIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344822; c=relaxed/simple;
	bh=uLUavKaeFNiIlI5uBlzBb68X1JGcgvu6CQAOPa9USj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COLfF36+02yQsXHCMdkVDKyw40e0e2DLDz5DAdhJFq12jQYET3PVEnqZGhMg1HY7c88ncVW8Kou6kuA0PP2D8iltHevoty5Q2eZcOyLVTp7m/eq5m/KaS4IbN0+DtCj2wHNVt86g9ko7frKOdY9nYXzZ8hIxq5vl8+dur26CnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FNLN0j4O; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FNLN0j4O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p8jgOhEOMKkcTx5z4T3s9esdt47EB0o3uL2XjfooQi8=; b=FNLN0j4OW8wj03qY7CsyNi8yAW
	g9hiyvBIKudR5/QoWv2hhp6QqBRjRc0medra+NlOYh7mfwWVtZZvFKK9PGzMbKk7zCwXspraGI4CF
	cGKR4pr8DqvkjZ4PFwFxwbV6+ulif3ltXyrHN32oKy85jDDoWBvdU2hbsuAuSu/KX6f9Vh1yes7p4
	eXTkSc3atpxzUGcyZ1l4sIywH1dooyCRciVI8PS0u+8HvYwNUxEkd7dXdajlsIgG5VRiNWitZh9h8
	hyNEE0AwTa7aRYFUGBcnhSoO7ZSt8Rx+fWMREslvOAxtK0vPjk5vJ37UPHbJuM8mV6b7OCv089+Mu
	ip9v6tCA==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGdz-000000098Ex-0dPe;
	Thu, 19 Jun 2025 14:53:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B18DD30890E; Thu, 19 Jun 2025 16:53:34 +0200 (CEST)
Date: Thu, 19 Jun 2025 16:53:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Onur <work@onurozkan.dev>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, thatslyude@gmail.com
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
Message-ID: <20250619145334.GM1613376@noisy.programming.kicks-ass.net>
References: <20250619140656.498-1-work@onurozkan.dev>
 <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
 <20250619173344.6c72c48a@nimda.home>
 <CAH5fLggxqK+aZcynsq0koWZG5DD=Byc+DrqEZ9ZCr4+pdScMqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggxqK+aZcynsq0koWZG5DD=Byc+DrqEZ9ZCr4+pdScMqQ@mail.gmail.com>

On Thu, Jun 19, 2025 at 04:44:01PM +0200, Alice Ryhl wrote:
> On Thu, Jun 19, 2025 at 4:33 PM Onur <work@onurozkan.dev> wrote:
> >
> > On Thu, 19 Jun 2025 16:14:01 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > > On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur Özkan wrote:
> > > > +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> > > > +{
> > > > +   return ww_mutex_is_locked(lock);
> > > > +}
> > >
> > > Do we really need this? In general I dislike all the _is_locked()
> > > functions and would ideally like to remove them.
> > >
> > > Pretty much the only useful pattern for any of the _is_locked()
> > > functions is:
> > >
> > >   WARN_ON_ONCE(!foo_is_locked(&foo));
> > >
> > > Any other use is dodgy as heck.
> > >
> > >
> >
> > It's an abstraction of `ww_mutex_is_locked`. Since this is an
> > abstraction module, as long as `ww_mutex_is_locked` exists I think
> > we should keep it. FWIW it's also quite useful for tests.
> 
> We're not just adding copies of all of the C methods - instead we
> focus on the things we have a use-case for. If you're using them in
> tests, then that could make sense, but otherwise you shouldn't add
> them.

It might make sense to include the assert in the method. That is,
instead of providing .is_locked() that returns a boolean, have a void
method .assert_is_locked() that traps if not locked.


