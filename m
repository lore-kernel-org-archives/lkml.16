Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF49298C37;
	Thu, 15 May 2025 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747312659; cv=none; b=lxyoid1MkqOpjhZoUgfJdPt9I/rT7Fu3QA7kxkL5Ph7UogZ3iC7OCOkfL0pnPBlwtzBKaoAczwYCE5MDhauKiNSFWl/bo6AkQo1+DAJBYWak+2Q6d2IgXnNn3quNyzGwm+hJSByWA+VFFqZu2mH7LP1BVWj1l/lQtfIrx69HYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747312659; c=relaxed/simple;
	bh=V7NGCpEoGaOGQDfebTYdttgeG8ku2izNigxgicjHoT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV5PKfWQ3LlSX6EgqvJ8BCHg+CLXjcRp8MJWpizjyWkE57fVkiUlPuoe57GEGqvXRwsfabZv+Xi+znnYkOyQmLYo6omSbywiG+GZRdC8BwLIEGwtCUk28xlIaw1vHXasoC2iy5HRhIcq14jI5RPMk9I+2szrqFdUngotg2y1QMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqr8v2TC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqr8v2TC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4119C4CEE7;
	Thu, 15 May 2025 12:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747312659;
	bh=V7NGCpEoGaOGQDfebTYdttgeG8ku2izNigxgicjHoT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gqr8v2TCWC/a7oTUMHIbZYMulY59gpgtxv+sQvQfAXE+UoOYS14AFy8C1Xot+4Uy1
	 FM8MUgcLemOpbdpTVfylNuYp2CbSqOPJ5FJnAAJv9DWfSmcvJYPTYe+i+SNCAtAwRb
	 HbJvrhP6ePOZS2jf0NOA/9SX/v7nQHqAS8ni9o50WGNcTHWhh1hJ+90/xgBMzTBtVs
	 H/+kQQL3EBqhXV7EHUGgyZHXygRXgfzYIB64I1wxYNsPOwonJL3NdPWw2IF533IvM3
	 Ri9ZYP8TaD8a/hXxzvBU6PwcFxccoh9tiFCBhopCYIBjdhRzHEJvYSL+sW3XGR/Cmf
	 ej3piM20Sia2Q==
Date: Thu, 15 May 2025 14:37:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <aCXgDHtdXb7Wf92P@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025051524-festival-afterglow-8483@gregkh>

On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> > On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> > > On Wed, May 14, 2025 at 2:07 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > >> However, I really think we should keep the code as it is in this version and
> > >> just don't provide an example that utilizes ManuallyDrop and forget().
> > >>
> > >> I don't see how the idea of "manually dropping" (sub-)directories and files
> > >> provides any real value compared to just storing their instance in a driver
> > >> structure as long as they should stay alive, which is much more intuitive
> > >> anyways.
> > >
> > > We can't easily do this, because dropping a root directory recursively
> > > drops everything underneath it. This means that if I have
> > >
> > > foo/
> > >   - bar/
> > >   - baz/
> > >
> > > Then my directory handle for `bar` have to be guaranteed to outlive my
> > > directory handle for `foo` so that I know it's didn't get deleted
> > > under me. This is why they have a borrow onto their parent directory.
> > > This borrow means that you can't (without `unsafe`, or something like
> > > `yoke`) keep handles to `foo` and `bar` in the same struct.
> > 
> > Is there no refcount that we can use instead of borrowing? I guess not,
> > since one can call `debugfs_remove`. What about a refcount on the rust
> > side? or is debugfs not used for "debugging" and needs to have the
> > performance of no refcount?
> 
> debugfs should never have any performance issues (i.e. you don't use it
> for performant things.)
> 
> So refcount away!  That should never be an issue.

Reference counting (parent) directories should lead to a much cleaner solution.

I mentioned that previously, but also said in that context that it's a bit
contrary to how the C API is utilized currently, which usually isn't desired.

However, if we're fine with that I think it's superior to the borrowing
solution, which requires keep(). IMHO keep() is a footgun in general, even if
not callable for "root" directories.
