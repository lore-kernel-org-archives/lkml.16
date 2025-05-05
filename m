Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786B26A1DD;
	Mon,  5 May 2025 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462559; cv=none; b=lSecSMvNJS+dCKZNH27dgIuu3P+1dTVFHjmBqnkXG3o40dKFbqIzxcqdsIjNqkgbqTV7G5/npls6IXgjmVDOSibwh2xtwvDLZ9Gni+2tCF7h2aiiQEWGKmg7ULip2IGrGchVZTNs2O1yUKR1tPSTO+zC0Qs+o55rpnGVRXmsLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462559; c=relaxed/simple;
	bh=ajbCwWftDfvs+1Id/YDxdYFbVBlzFvZKJLyOCpC3Gbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8KvEiX2vFHr+tnoFBAwYuBHRdBrMdsj0I+VYxG2kMWLYAho1HZb5Aw7xRd8RKlVs3rfhlZwcznsvtyBA2ZlFqOSNZgfA+9jjEeqaAqpKc975gDrOrZpIloq7+Dm2EdtvZCCDmZSVAf/ak9IJlQKFUa37RLpdWtnzqn0xVxFIGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JFO/HnX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JFO/HnX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DBAC4CEE4;
	Mon,  5 May 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746462558;
	bh=ajbCwWftDfvs+1Id/YDxdYFbVBlzFvZKJLyOCpC3Gbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFO/HnX5Dd9A3AJO6wj9kT4YM2ctqQhmhHrsW3Y+nmzUmUoXa5vOwuCpwl4038yUZ
	 prsCI7Mk4mV+guHuu+/t+Sctl9aqq6azRa13IFfwb8BfL+sKrRGYZTUL+8tcFOFNro
	 2ubmV/Xc4MkFkxwDIX8uxMgqJ9VbAMTjxkd4Wmx4=
Date: Mon, 5 May 2025 18:29:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Subject: Re: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025050510-landmark-probing-17f8@gregkh>
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com>
 <aBYNyqTRlpGAJVuB@polis>
 <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com>

On Mon, May 05, 2025 at 09:21:51AM -0700, Matthew Maurer wrote:
> On Sat, May 3, 2025 at 5:36 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri, May 02, 2025 at 07:49:30PM +0000, Matthew Maurer wrote:
> > > +/// Owning handle to a DebugFS directory.
> > > +///
> > > +/// This directory will be cleaned up when it goes out of scope.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
> > > +#[repr(transparent)]
> > > +pub struct Dir<'a, const KEEP: bool = false> {
> >
> > Why did you move to a const generic, rather than a new type? What's the
> > advantage? AFAICS, it just makes it less obvious to see from the type itself how
> > it will behave. Reading Dir<true> doesn't make it obvious what it does.
> >
> > While I prefer a new type over the const generic, I'm fine with it. But I think
> > we should use something more descriptive than a bool. Please see
> > device::DeviceContext for reference.
> 
> I'm fine with a new type or a using a more descriptive const generic -
> I did the const-generic to avoid the need to make one variant the
> derefee, which can sometimes complicate structure. I'll default to a
> more descriptive const-generic.
> 
> >
> > > +    /// Create a DebugFS subdirectory.
> > > +    ///
> > > +    /// This returns a [`Dir<'_, true>`], which will not be automatically cleaned up when it
> > > +    /// leaves scope.
> > > +    /// To convert this to a handle governing the lifetime of the directory, use [`Dir::owning`].
> > > +    ///
> > > +    /// Regardless of conversion, subdirectory handles cannot outlive the directory handle they
> > > +    /// were created from.
> > > +    ///
> > > +    /// # Examples
> > > +    ///
> > > +    /// ```
> > > +    /// # use kernel::c_str;
> > > +    /// # use kernel::debugfs::Dir;
> > > +    /// let parent = Dir::new(c_str!("parent"));
> > > +    /// let child = parent.subdir(c_str!("child"));
> > > +    /// ```
> > > +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
> > > +        Dir::create(name, Some(self))
> > > +    }
> >
> > The default should be that the directory is removed when the Dir instance is
> > dropped.
> >
> > The common case (which people expect) is that an object is cleaned up on drop().
> 
> In general for Rust, I agree with you. For this particular case, I
> have a strong disagreement - take a look at calls to
> `debugfs_create_dir` in existing C code - new code chooses to discard
> subdirectory handles when done and rely on the recursive remove of the
> root directory to clean up subdirectories. If you and Greg K-H both
> agree that I should make them drop by default, I'll switch it, but I
> think this is me following the subsystem maintainer's intentions here.

I'm ok with the directory being cleaned up when it goes out of scope.
That makes way more sense overall, and will prevent leaks and other
messes.

For the C api, what I really don't like is when we were returning a
dentry to the caller, as then they had to manage it.  Ideally I didn't
want them to have to manage anything, hence the "lookup_and_remove"
function I added, all that was needed to remember is the name of the
directory, which the driver almost always already knew.

With Rust it's simpler, you can save off a reference and when it goes
away, it gets cleaned up.  You don't have access to the raw dentry,
which takes away my original objection, and if debugfs is not enabled,
there's no additional storage requirements.

So let's keep it simple here, and rely on lifetime rules when we can.

thanks,

greg k-h
