Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12181289E37;
	Wed,  7 May 2025 18:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641814; cv=none; b=FDRShwz9UFHjiKhZTMo6fO1GACa6Skfo1g5VlUgcYRlErg/oAcpcY+g4ZyK3dg9Nlxj62xSiMqNqM9tQnYagPW9gt2z6hRuXotf24ORKRXP27IPLbDQWPrATTt+yOUNUZrXFcHDRPp1mvvRzd0OvhIbPiYw2RJgsJOzt4bLC5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641814; c=relaxed/simple;
	bh=iT5b4gP/fALQSydyw3Jbwc+B4ZvC2tSd8zd2qFQUEiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/V90/aGOdO6CvOSuIEuyy2ojzUMV1+ds+dfSNaYVi1j9DJGci3QGh/phKlMkFoPGo3zhC1Z9vq92xfGRFNkstkZxGQRQebYAkA579IJnPv3N8phuYqOl8OXbCf7Vnw9LQZS61zwHyL3Bi4JHRnPa1NZJ9oIuPHWKRSeVc6Rigg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poiNSaX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poiNSaX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29114C4CEE2;
	Wed,  7 May 2025 18:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746641813;
	bh=iT5b4gP/fALQSydyw3Jbwc+B4ZvC2tSd8zd2qFQUEiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poiNSaX0NwuISHO5UOosm+EkfsbReKS5OJmVMqPn3UETLBmuQvV+kHfyXFGY5hpzE
	 v4ZJiuiAa4IJ6dizqC40xQls6PwFYVEIzRLZUysaA7EpTbnHiGEba94L782Jz5iWtJ
	 kdDyTXxaWfYZFlQDcP5Wn/qawxQkEE0WUv9a1DGyMgW4i+njb6D2zlqNLSjiz3MqjJ
	 lxKsxiXVuw/hoZw2KdMnqFfk/CpB2S+Xkb+c73AHo+tYUWLy2kBAEzA1ybhbHl3Uue
	 O2kWgEYdoR4qKLjn0BSUyVHWLRKJPp3auUbElX0hODbFGZ+hCK+VuKv2qvh8PcCPHV
	 BJMGGdDP2IhFQ==
Date: Wed, 7 May 2025 20:16:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH WIP 1/2] rust: debugfs: Add interface to build debugfs
 off pinned objects
Message-ID: <aBujjJN9nz6Ib_lt@polis>
References: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
 <20250503-debugfs-rust-attach-v1-1-dc37081fbfbc@google.com>
 <aBectw_2jridu43O@polis>
 <CAGSQo03sHhUX-Eo31cMmeNMaNnzWxU0c-ObTkr7Z1CJ2uQ6c4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03sHhUX-Eo31cMmeNMaNnzWxU0c-ObTkr7Z1CJ2uQ6c4g@mail.gmail.com>

On Mon, May 05, 2025 at 10:32:39AM -0700, Matthew Maurer wrote:
> On Sun, May 4, 2025 at 9:58 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Sat, May 03, 2025 at 12:43:59AM +0000, Matthew Maurer wrote:
> > > +/// A DebugFS directory combined with a backing store for data to implement it.
> > > +#[pin_data]
> > > +pub struct Values<T> {
> > > +    dir: Dir<'static, false>,
> > > +    // The order here is load-bearing - `dir` must be dropped before `backing`, as files under
> > > +    // `dir` may point into `backing`.
> > > +    #[pin]
> > > +    backing: T,
> > > +    // Since the files present under our directory may point into `backing`, we are `!Unpin`.
> > > +    #[pin]
> > > +    _pin: PhantomPinned,
> > > +}
> >
> > This only ever allows attaching data to the root directory, correct? What if I
> > want to remove (or replace) a file or a subdir? Then I'd be left with the data
> > for this specific file (or subdir) until the root is finally removed.
> 
> The intended way to deal with this is that your debugfs root has
> structures or handles that let you compute what all your debugfs files
> should see, not necessarily fully populated if you want something
> dynamic. For example, one of your entries could be
> `Arc<Mutex<Vec<Record>>>`, and this could get updated elsewhere
> without thinking about DebugFS - you just need to know the shape of
> all the handles DebugFS will need.

Well sure, but what if we can't initialize them (yet) at the time we create the
debugfs root?

Also, what if the data that should be exposed through a file in debugfs is not
supposed to live for the full lifetime of the debugfs root (which might be
forever)?

> It'd be pretty easy for me to relax this to allow attachments to
> subtrees. I'd just need to do `Values<'a, T>` and `Dir<'a,  false>`.
> It'd also make the argument for the safety of the builder interface
> slightly more complicated (things that statically outlive the lifetime
> of the dir would also be usable in the builder, which is safe, but
> trickier to argue for).
> 
> You wouldn't be able to do nested attachments, but you could do
> attachments starting with any subtree. So for example, you could do:
> ```
> let root = Dir::new(c_str!("foo"));
> let foo = root.subdir(c_str!("bar")).owning();
> let bar = root.subdir(c_str!("baz")).owning();
> let foo_values = Values::attach(foo_data, foo);
> let bar_values = Values::attach(bar_data, foo);
> ```
> 
> The tricky business here (and why I didn't do it in my initial draft)
> is that because `foo_values` and `bar_values` are restricted to live
> no longer than `root` (since they will be invalidated if `root` is
> dropped), it is hard to store these objects in a module context or
> similar object, which would make it tricky to use. Attaching to a root
> directory on the other hand is not tricky, because their lifecycle
> isn't dependent on some other object.
> 
> A legal way of using this kind of scoped interface (but not
> immediately obvious to me how to design the safe interface to let
> users build it) might look like
> 
> ```
> struct MyDebugFsInfo<T> {
>   // RawValues is a fictitious type that would be like `Values`, but
> with the actual lifetime parameter erased.
>   subdirs: Vec<RawValues<T>>,
>   // Order matters, root must be released last because earlier values
> are borrows
>   root: Dir<'static, false>,
> }
> 
> impl<T> MyDebugFsInfo<T> {
>   fn new_subdir(&mut self, name: &CStr, value: T) {
>     let subdir = self.root.subdir(name);
>     // SAFETY: We don't allow the root to be destroyed before our structure, so
>     let val = unsafe { RawValues::attach(value, self.root.subdir(name)) };
>     self.subdirs.push(val)
>   }
>   fn get<'a>(&'a self, idx: usize) -> &Values<'a, T> {
>      let x = self.subdirs[idx];
>      // SAFETY: We know all our subdirs are children of the root we
> own, so if we have a read-only reference to ourselves, that's an upper
> bound on how long the value struct can live
>      unsafe { RawValues::ascribe(x) }
>   }
> }
> ```

Yes, I'm aware of this possibility and its complexity. That's why I think per
file would suit better.

> If I wanted to do better than this in terms of ergonomics, I think I'd
> need some kind of refcounted wrapper where holding a subdir prevents
> the parent dir from being cleaned up, which I could add, but would be
> a Rust abstraction layer on top of the C one.

I don't think something like that is desirable.

> >
> > It would also require Option<V> (where V is the type of a field in T), if I
> > don't have an instance of V yet, when the root directory is created.
> 
> `Option<V>` won't actually save you - once you create a `Values<T>`,
> you are intentionally unable to mutate `T` anymore, because it may be
> read at any point in time after that by someone reading a debugfs
> file, so you can't do a potentially racing mutation. If you wanted a
> value to be attached to a debugfs, but didn't have one, you'd need to
> do `Mutex<Option<V>>`.

Sure, or some other kind of synchronization. I left that aside, since it's not
relevant for the point I wanted to make. Which is that with the per root data
approach we'd need to work with Option types when the data isn't yet known when
the root directory is created and if we want to be able to free the data before
the root directory is removed (which might be never).

> >
> > I think we should store the data per file, rather than per root directory.
> 
> This doesn't match what at least seems to be a common usage of
> debugfs, where a debugfs directory is used to represent an object with
> each file in the directory representing one of the properties on the
> object.

Why not treat File as container, i.e. make the property of an object a File<T>
with T being the property?

> This also means that we need to store N handles in a Rust driver (one
> per live file) compared to 1 handle in a C driver.

I can't follow what you mean here. Files in a C driver do need a handle to the
data they expose too, no?

> 
> ===
> 
> I do think that the normal idiomatic way of doing this in Rust would
> be to attach refcounted handles (e.g. similar to `ForeignOwnable`) to
> inodes, and when the inode is destroyed, have that refcount be
> deleted, but we don't currently have any `release` implementation for
> a DebugFS inode afaict, so everything has to be externally scoped via
> this attached pinned data setup I've been producing.

Why do you think that this would be "the normal idimatic way" of doing this?

Does this imply that you think tying the lifetime of the object exposing a value
to the value itself wouldn't be idiomatic for Rust?
