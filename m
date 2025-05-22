Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78181F94C;
	Thu, 22 May 2025 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929931; cv=none; b=TJuEQhHGqpYjj37lWaWaQnmCFY3DIdByo7plQe857oZU+zSxJI3oJWDNehL80EE1qxp/FjCESKTQb7CP2o6Z2z48sbnVgBrZH5VXYJXdb6L1aR0gOqoEId64y1QUCEB0YcuDpWZgCg8bkBTgCO9Cw0dW/c3QfHJA79cAhwXP27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929931; c=relaxed/simple;
	bh=lXcZo/Pm+/t88dRoboEWB2Dhb1AAlhDP0aV2NXjyjVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksGZV7kVvNyfkmuMdPMvLOEKvanzGlIaK/PXJwjhwkr2fPAmXldMmDZYfyBZOXuAc8hFBnNmvy3n1d8HsslYCHZ6Qcz3nzcwJXYn6Oef58hJSWUPxITRLm7suSabsBSSiFr31ryvmLLlH9EMiO+TRI12O3BufnPwZP9nlEJ5F20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ynU8/xW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ynU8/xW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623F6C4CEE4;
	Thu, 22 May 2025 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747929931;
	bh=lXcZo/Pm+/t88dRoboEWB2Dhb1AAlhDP0aV2NXjyjVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ynU8/xW4jYhimq8ZQZJXx3PAr/speS4llL7jGk7Zw810zunMth1fyw+YThm476U/W
	 hRKKHArAJCXspS6S4OnpFbvhLP8o/s9nle4Q/iNBcNt1drSFpdCVuxtHPh/tjAZMbQ
	 mQR09Ma6W+Er9cS/pjqFFwaP2EtreRmNLq8enKgs=
Date: Thu, 22 May 2025 16:15:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
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
Message-ID: <2025052201-return-reprogram-add9@gregkh>
References: <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC8uNmrLUSS8sxHU@google.com>

On Thu, May 22, 2025 at 02:01:26PM +0000, Alice Ryhl wrote:
> On Thu, May 22, 2025 at 08:25:25AM +0200, Danilo Krummrich wrote:
> > On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> > > > > * Possibly we have a way to drop a Rust object without removing it from
> > > > >   the file system. In this case, it can never be accessed from Rust
> > > > >   again, and the only way to remove it is to drop its parent directory.
> > > > 
> > > > I'm not sure about this one.
> > > > 
> > > > IIUC, this basically brings back the "keep() logic", which I still think is a
> > > > footgun and should be avoided.
> > > > 
> > > > Also, we only needed this, since due to the borrowing design we couldn't store
> > > > parent and child nodes in the same structure. With reference counting (or the
> > > > logic above) this goes away.
> > > > 
> > > > I wrote the following in a previous conversation [1].
> > > > 
> > > > --
> > > > 
> > > > What I see more likely to happen is a situation where the "root" directory
> > > > (almost) lives forever, and hence subsequent calls, such as
> > > > 
> > > > 	root.subdir("foo").keep()
> > > > 
> > > > effectively are leaks.
> > > > 
> > > > One specific example for that would be usb_debug_root, which is created in the
> > > > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > > > 
> > > > The same is true for other cases where the debugfs "root" is created in the
> > > > module scope, but subsequent entries are created by driver instances. If a
> > > > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > > > device is unplugged (or unbound in general).
> > > 
> > > Where is the leak? If the file is still visible in the file system, then
> > > it's not a leak to still have the memory. If the file got removed by
> > > removing its parent, then my intent is that this should free the memory
> > > of the child object.
> > 
> > Well, take the case I described above, where the debugfs "root" is created in
> > the module scope, but subsequent entries are created by driver instances. If a
> > driver would use keep() in such a case, we'd effectively the file / directory
> > (and subsequently also the corresponding memory) everytime a device is unplugged
> > (or unbound in general)."
> > 
> > If the module is built-in the directory from the module scope is *never*
> > removed, but the entries the driver e.g. creates in probe() for a particular
> > device with keep() will pile up endlessly, especially for hot-pluggable devices.
> > 
> > (It's getting even worse when there's data bound to such a leaked file, that
> > might even contain a vtable that is entered from any of the fops of the file.)
> > 
> > That'd be clearly a bug, but for the driver author calling keep() seems like a
> > valid thing to do -- to me that's clearly a built-in footgun.
> 
> I mean, for cases such as this, I could imagine that you use `keep()` on
> the files stored inside of the driver directory, but don't use it on the
> directory. That way, you only have to keep a single reference to an
> entire directory around, which may be more convenient.

No, sorry, but debugfs files are "create and forget" type of things.
The caller has NO reference back to the file at all in the C version,
let's not add that functionality back to the rust side after I spent a
long time removing it from the C code :)

If you really want to delete a debugfs file that you have created in the
past, then look it up and delete it with the call that is present for
that.

The only thing I think that might be worth "keeping" in some form, as an
object reference as discussed, is a debugfs directory.

thanks,

greg k-h
