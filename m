Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69887235041;
	Wed, 21 May 2025 07:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814256; cv=none; b=GSLiikk8UtV+Q9YaNx/NrXvlQNX9dO9ztDulUzRRCPfRr2hQEXibwpfQqGkPpD+uoB7bcntjEl//IjMKrR7vgn9GSWesVDxNWT0LyrnLktNIYObmtnU7WjTqvx5r54Ix2Jgs053ABR1Nw0MqZT1pLE74LJCSvvIrVxutOga8k1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814256; c=relaxed/simple;
	bh=MHWGAPWpziP5huR9TIH8wZAZmnhA3WW5t97xCAWUmGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXwmT6TBAh7MA4pJrRhM98zOAnLAaSVux6n9vkAAZk6JGJfE9XXHQ2W9jvxWAkLJAmKkcd9AYO586rtskK5DTahmZ7hv8ZQYzhpMMXAR1GDbPBoDyQMRDpTVgnhECsifGMdJ6rmMKM69eBgL1bZq1rueHXVgtaR4/fny13+RQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIHtLvO1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIHtLvO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A64C4CEE4;
	Wed, 21 May 2025 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747814255;
	bh=MHWGAPWpziP5huR9TIH8wZAZmnhA3WW5t97xCAWUmGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIHtLvO1oZCWSWwEVSDYC2natdJxOh1JFUZdlzLs4BDRQ33zt/yRX12B5GIjp6B2X
	 SvABv8HG7JPyNmOdtFmrWBd6MoX2cC4hotCNLpZIwtY2VTgSMFYwBtwzawuOkQ1dmV
	 xCLDw/p6s9vegdw6xCeg6t0v8tBfdHsiXtAdLF2OzP2YhvJwYsIkjXt/AbsyZ+crp7
	 6LpoXzEjRoZd6lfjbXXVwVW6rkvTdmyOuC80Q27p5G0kvqk0C08j4c3NNnjLoqKp7o
	 nHDCbgfgut07BqEDj0q1AYT4CqYcMX2Ru69Q8WIyAdPNrY9m2MnNmW7vPRqWbB1QBf
	 UZYoXj8nTVQyQ==
Date: Wed, 21 May 2025 09:57:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benno Lossin <lossin@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aC2HacSU7j5d9bzu@pollux>
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

If we would want to keep an entry alive as long as there are more leaves, we'd
obviously need to reference count things.

But what do we need reference counting for with this logic? Shouldn't this be
also possible without?

> * Possibly we have a way to drop a Rust object without removing it from
>   the file system. In this case, it can never be accessed from Rust
>   again, and the only way to remove it is to drop its parent directory.

I'm not sure about this one.

IIUC, this basically brings back the "keep() logic", which I still think is a
footgun and should be avoided.

Also, we only needed this, since due to the borrowing design we couldn't store
parent and child nodes in the same structure. With reference counting (or the
logic above) this goes away.

I wrote the following in a previous conversation [1].

--

What I see more likely to happen is a situation where the "root" directory
(almost) lives forever, and hence subsequent calls, such as

	root.subdir("foo").keep()

effectively are leaks.

One specific example for that would be usb_debug_root, which is created in the
module scope of usb-common and is used by USB host / gadget / phy drivers.

The same is true for other cases where the debugfs "root" is created in the
module scope, but subsequent entries are created by driver instances. If a
driver would use keep() in such a case, we'd effectively leak memory everytime a
device is unplugged (or unbound in general).

--

[1] https://lore.kernel.org/lkml/aCR9cD7OcSefeaUm@pollux/

> This way, you can drop foo/ before dropping bar/ and baz/ without that
> having to be unsafe.
> 
> Whether that's best implemented by calling dget/dput on the dentry or by
> having Rust keep track of a separate Rust-only refcount, I don't know.
> But I think this is the API we want.
> 
> Thoughts?
> 
> Alice
