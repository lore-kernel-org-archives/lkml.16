Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C441C63;
	Thu, 17 Apr 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922178; cv=none; b=d9aU1n/62eWVP1IW9wLihA2Tr5AKgHvitxGhWBiyDPvK2GVgoUUTQyj5wOzOf8zbAs3dH2zqIR03/I0MsZY0nATj8jDDc7Rgl2CWd66DkddykQfHA0za7++UigNoLtFwuXDCsP6VqdchUgOtrY+W4coQmDzfBfWmuXJz4Tp9F8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922178; c=relaxed/simple;
	bh=TJBw7hzRm0pclI2UfUvquj4FkU2UVt08LL8fo8kchb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psjMxRcRr5WERbOnq2KD3TMITwD5Tgy+iBnFlG0ENHftkoERNz++vzbqe8RpduJbVkazn7kKrzJqgwjlnHsXyiMalXWzcVTcHkSwQLheA4Rn+Blt3Tb7QQwJinQ1dC3ARqxl3BzBj457H5kWFVlxeSWheIHWeZW6Sb5xHhMvj5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtZjWXCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtZjWXCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45480C4CEE4;
	Thu, 17 Apr 2025 20:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744922177;
	bh=TJBw7hzRm0pclI2UfUvquj4FkU2UVt08LL8fo8kchb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtZjWXCbR8CkAy7jhwWK7Aphg3G1rHrRwej1d3PuexsNhI53vevjI3fgeqJrh8qmC
	 nIRuevWIFDvuCgO9dLuDvIOZSY/p+l4a6bM/ec6bulBQFB0SbObz+6C+69URG8UDm/
	 jmiKPo1QNzFUZ+Y1p9utalE/5MA2izYwZJZCuf5l+93Deqmr8rEw9XF+kXnkvNwI8R
	 ardH22spwg/boEfr++UtTnQ+ILkqeI8q54xx0Xr/e4ej1F7tl9GwKavpNN0oJ7PvN6
	 PpKoaOL8Qyxfosv1j0orHNUpJ8sV7TETCWeXtDVtSxSw0gTdNT3YdQJh5xt7gzp6zL
	 OX3hSFNn5MnYg==
Date: Thu, 17 Apr 2025 22:36:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, phasta@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
Message-ID: <aAFmO0FhHrzG_F8H@cassiopeiae>
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae>
 <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae>
 <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
 <aAALmSjLyWqrcQ45@slm.duckdns.org>
 <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
 <aACtqnC7okO7eZEg@slm.duckdns.org>
 <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>

On Thu, Apr 17, 2025 at 10:26:04PM +0200, Alice Ryhl wrote:
> On Thu, Apr 17, 2025 at 9:28 AM Tejun Heo <tj@kernel.org> wrote:
> >
> > On Thu, Apr 17, 2025 at 09:22:40AM +0200, Philipp Stanner wrote:
> > > I assume you, ultimately, mean that the list of delayed_work's would be
> > > accessible through workqueue_struct, correct?
> > >
> > > And then destroy_workqueue() could loop over all of them with
> > > cancel_delayed_work_sync()?
> >
> > Yeap, I was thinking flush_delayed_work() but maybe
> > cancel_delayed_work_sync() is better.
> 
> But doesn't that have a cleanup problem? If the work item owns an
> allocation or a refcount that's cleared by the work item's run
> function, then using cancel_delayed_work_sync() will fail to clean
> that up. Whereas flush_delayed_work() avoids this problem.

I also think it may be a bit unexpected to users if pending "normal" work "will
be done first", but delayed work is canceled instead.

That sounds like a good source for wrong use. :(
