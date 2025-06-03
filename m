Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA22AEF1;
	Tue,  3 Jun 2025 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748941837; cv=none; b=Ka8rYkzXLJtubrLC9D1ZOTZYE8tIPGdrz9RWJSyUexTGGRx1bSEdlDNWc3VZuII9TeDtburIZcK8hdAeTp+1egTKfb8ltzdD/Jlg2b135AdlADTihGcgIYYrWOuaGvUc8fftDS/CyhZh7k5pvk9xAfIlBJEw5dIr3X5KXkEV5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748941837; c=relaxed/simple;
	bh=mfT3zZm2UCkzq7F5XZ5058+cZdEASTo8PzB4aEiBNzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1qmC5RNVbyODqKgRvKgvZSQ+vz0IeWrJ8bqmgItQStwGweeVuL11BLGy5gFw76T8lopJg+l32QviyuUqjfxtepUGxB5ukjQhXi5r33CJcJ5svXd5MCHgFLvXZNinKXuTdTfB83/wxF1AfZiFzFf5/OgWXC26T9U8e51Mh0JbLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H73Y8iUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H73Y8iUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1C0C4CEED;
	Tue,  3 Jun 2025 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748941837;
	bh=mfT3zZm2UCkzq7F5XZ5058+cZdEASTo8PzB4aEiBNzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H73Y8iUcHOEdrdJbDPItdabDhVnXXe2Dj9XkzwoC+jkSVsuTRyZ5qRbiqdNhOLS6m
	 YcmmmlfMRu8uuKRtFszTIEDhLZo88f7RRLey/R9MJYcrDCHY2d3s/zdOjN5pcsdk/2
	 1/OrOICbG9ZeY+iTMWdVxQbpT7b7dy4iUy9aA9dP6rHpYpdQ2Zt7jp4tZ5edwVkiKQ
	 eprLdRLhVHrhPzZSn7y6kvSccw8yB/Z+T0EO6iYX+KzrFC6cR8LerQaZ0HUQfYZ/jw
	 mWrPGRSzbqP1gaSJJnKTi71h4I+Vv4c9fdjBn/Xk2i+uuXE4X2R9baPUK1wn2MTlog
	 0MDDjYxGTJvgQ==
Date: Tue, 3 Jun 2025 11:10:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
Message-ID: <aD68BzKRAvmNBLaV@cassiopeiae>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <aD3PCc6QREqNgBYU@google.com>
 <aD3f1GSZJ6K-RP5r@pollux>
 <aD6yOte8g4_pcks7@google.com>
 <aD62ZGBwqXxTroeX@cassiopeiae>
 <aD64YNuqbPPZHAa5@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD64YNuqbPPZHAa5@google.com>

On Tue, Jun 03, 2025 at 08:54:56AM +0000, Alice Ryhl wrote:
> On Tue, Jun 03, 2025 at 10:46:28AM +0200, Danilo Krummrich wrote:
> > On Tue, Jun 03, 2025 at 08:28:42AM +0000, Alice Ryhl wrote:
> > > That optimization sounds like something we definitely want, but I have
> > > one question: is free_irq() safe to use in atomic context / inside
> > > rcu_read_lock()? What about the threaded-irq variant?
> > 
> > No, free_irq() must not be called from atomic context. Hence, it's not valid to
> > call it from within an RCU read-side critical section.
> > 
> > I assume you're confusing something, free_irq() is called from the destructor of
> > the irq::Registration object, hence it is either called when the object itself
> > is dropped or from the devres callback, which is called after the
> > synchronize_rcu(), but not from an RCU read-side critical section.
> 
> Ok hold on ... I guess the issue I thought was there manifests itself in
> another way. What about this situation?
> 
> Thread 1                 Thread 2
> device removal starts
>                          Drop for Devres starts running
>                          devm_remove_action() = 0
> device is fully unbound
>                          free_irq()
> 
> Now the call to free_irq() happens too late, because there's nothing in
> the devm callback stack to wait for it.

This is indeed a flaw in the Devres implementation.

In my initial implementation I even thought of this, but then obviously forgot
about it and introduced this bug in commit 8ff656643d30 ("rust: devres: remove
action in `Devres::drop`").

In order to fix this, we should just revert this commit -- thanks for catching
this!
