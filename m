Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD22A1CA;
	Sat,  3 May 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273500; cv=none; b=C4nSnS3CdxC0P0JKa17037+g7OgUiN/i2WtNu5A07DbZnBu0QwwNpTiCsm+JFbA9N/XjynPHu2nFlC0i3X89VnyDO+zLCgkvkuO4BzHA3ZZoRM9A6/GPBO2KkiH/N3qEnyrhPeZ2HOMJU23GLv2ayINtoLUDQ9hv2dmoJzT/4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273500; c=relaxed/simple;
	bh=Bo2kM4vpWeOzKCXc2t+PVRRC6F4rzJU4RcIaI8kD8nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0kaJWmasd7FE0+op9wzuq0udKRzxZ7BUZdXtrcevMZvSnGwvzEG+ZvGQbiqqV0jDZYaofA2am4t1UIKxRekaKJyMTEEhYJCAl9lbXw2fpcqKyAc7SNysUd1dYkABAo82ikWMpDrhFGHvesNu1NsXokx7GfKb8FgAxh+4SxrxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpC5CK+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpC5CK+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23DAC4CEE3;
	Sat,  3 May 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746273499;
	bh=Bo2kM4vpWeOzKCXc2t+PVRRC6F4rzJU4RcIaI8kD8nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpC5CK+opqWUTeYkEKlTYv7V5RumKqveSSjujEpqSr/YXAnoj+I6qY+Ucvjl85sNh
	 bxS5DgYLALN3eb67OW/hpt1bDy3aFJemupmEckOfX6//31XpwTwYCnsp36+EPm2Lj3
	 BqJgJx3gwebE7VjH382cbtEBjzu+XLryBgnRUuwHLOOFYdNxeFs6fXJ9h3gh3SdvTa
	 dcZI8hAc3Fm1JOJMVGKsN94+GWeGbpBNY4FEn40bxcPrbnNSYR8xWk0fK9waWUwWkr
	 3/KrH2TL3dcyOu5wwJqXHWp5NmiuyIW0azkaznW1gWVBFRRIa5+BFSYlVn0AhF1EyA
	 ymbnXYg1yWhEw==
Date: Sat, 3 May 2025 13:58:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBYE0rPmS6L6PJbs@polis>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <aBRoNKjB063QhGZo@pollux>
 <CAGSQo00hYLubqJy9zkO3_O3b6V15WtmoSybC+Ep5uJeU6k3t4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo00hYLubqJy9zkO3_O3b6V15WtmoSybC+Ep5uJeU6k3t4A@mail.gmail.com>

On Fri, May 02, 2025 at 08:48:36AM -0700, Matthew Maurer wrote:
> On Thu, May 1, 2025 at 11:37 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > > +/// Owning handle to a DebugFS directory.
> > > +///
> > > +/// This directory will be cleaned up when it goes out of scope.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
> > > +#[repr(transparent)]
> > > +pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] *mut bindings::dentry);
> >
> > Should probably use Opaque instead of a raw pointer.
> 
> Opaque usage is problematic here:

Yes, when I wrote this I was back at your v1 in my mind -- the raw pointer is
fine..
