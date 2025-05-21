Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DB833993;
	Wed, 21 May 2025 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802863; cv=none; b=XEJGedK+wCfzTuSIWBcgqThtuYcumPB0Ow9WfiyvKMRvOkxVewEmdRCFaTlhVVnzWQwddAdl2w8hMYqpcp61PsDnAqroIRLfA14j6Bx7QgTkAfIm5lbtSE4avsedU0bxEdN+WTmDvQRSJBRCbWnnRSlmFO4NXHB0GFcm6d+CMVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802863; c=relaxed/simple;
	bh=/xdrjkOx71cX945z+mCCHRJZV8JxwfrNR2/2hevWRnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X51cxzM0hjCN1/oHdZwPLzWoEIjN3PspwlgC/N1iSaBZlDC90kczJ0Qn3sQ7alapRc8jS1tL1qi5bVbq9R1olZe+CA1qFVE5c4TuI8j0fxLlNqv3AOc+dNgA68xW08VrtMEwmYrRdImZwRWRhEolpXDYGYpdtb9tHFmiA2BloZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vjd0EnWb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vjd0EnWb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7D3C4CEE4;
	Wed, 21 May 2025 04:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747802863;
	bh=/xdrjkOx71cX945z+mCCHRJZV8JxwfrNR2/2hevWRnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vjd0EnWb8s5rBQu/YVD25G0y0GvkavynWZkl89dGpJqrnE2bo3vOSo7BIMFOh2HaQ
	 G0SEi6/mXv+IM+bw2SE9+I6cFP3FqMn0ZaCoT8z9ATTbd5TAc72h32Bt5l5LUvDxRN
	 JulXL8HN2JU20iDo1hGApDkJURnwULgYOYZ66pik=
Date: Wed, 21 May 2025 06:47:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <2025052148-copied-riverside-6187@gregkh>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCzzBT96ktapP03e@google.com>

On Tue, May 20, 2025 at 09:24:21PM +0000, Alice Ryhl wrote:
> On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> > > On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> > > > On Wed, May 14, 2025 at 2:07 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >> However, I really think we should keep the code as it is in this version and
> > > >> just don't provide an example that utilizes ManuallyDrop and forget().
> > > >>
> > > >> I don't see how the idea of "manually dropping" (sub-)directories and files
> > > >> provides any real value compared to just storing their instance in a driver
> > > >> structure as long as they should stay alive, which is much more intuitive
> > > >> anyways.
> > > >
> > > > We can't easily do this, because dropping a root directory recursively
> > > > drops everything underneath it. This means that if I have
> > > >
> > > > foo/
> > > >   - bar/
> > > >   - baz/
> > > >
> > > > Then my directory handle for `bar` have to be guaranteed to outlive my
> > > > directory handle for `foo` so that I know it's didn't get deleted
> > > > under me. This is why they have a borrow onto their parent directory.
> > > > This borrow means that you can't (without `unsafe`, or something like
> > > > `yoke`) keep handles to `foo` and `bar` in the same struct.
> > > 
> > > Is there no refcount that we can use instead of borrowing? I guess not,
> > > since one can call `debugfs_remove`. What about a refcount on the rust
> > > side? or is debugfs not used for "debugging" and needs to have the
> > > performance of no refcount?
> > 
> > debugfs should never have any performance issues (i.e. you don't use it
> > for performant things.)
> > 
> > So refcount away!  That should never be an issue.
> 
> What I imagine would be the ideal API for Rust is the following:
> 
> * For each file / dir you create, you get a Rust object that owns it.
> 
> * When you destroy one of these Rust objects, it disappears from the
>   file system. I.e., dropping a directory removes things recursively.
> 
> * If you remove a directory before the removing objects inside it, then
>   the Rust objects become "ghost" objects that are still usable, but not
>   visible in the file system anywhere. I.e. calling methods on them
>   succeed but are no-ops.

Why not just also remove those objects at the same time?  That would be
more like what the filesystem logic itself does today.

> * Possibly we have a way to drop a Rust object without removing it from
>   the file system. In this case, it can never be accessed from Rust
>   again, and the only way to remove it is to drop its parent directory.

This too would be nice as that's how the existing api works in C.

> This way, you can drop foo/ before dropping bar/ and baz/ without that
> having to be unsafe.
> 
> Whether that's best implemented by calling dget/dput on the dentry or by
> having Rust keep track of a separate Rust-only refcount, I don't know.
> But I think this is the API we want.
> 
> Thoughts?

Sounds reasonable to me and should be easy to use, which is the key
feature/requirement of debugfs.

thanks,

greg k-h
