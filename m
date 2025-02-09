Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FF199223;
	Sun,  9 Feb 2025 15:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115808; cv=none; b=WpSd4EaPyhh/RVvV3ty0d6axXX3dwEt4KhwcAv67N0nwYU6epKOBUswGLZC5LnIq8/PzNpoG3qUvBbcHzqIZAPSq2/Mcw5AI6hxchYfJoWT94nErXxABqTxyuo8y/EXL20EKCJ7JCdgvYExCdXIGKH8u4PIW3D7seCzFkRRAjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115808; c=relaxed/simple;
	bh=qsmcmem5zXi9evcSLYdJszKgU3/24x3uo6KjCVKhQxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fro6IRconj/CeOCEIJ+vVtabC6IzNSILyH/9ueRKNBEG+fXYH9L5YqW7y9SJggcz2E+HheiJEv0pL4caZtD8KixMGMQNIBDI9GkGj56fWcgKkakp+iCzzrDCJXTZynyZH6TQPCjwkOLj7yZrf1/Rw95Cds/0sLdRsshxVTFTXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IM9kIAcM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IM9kIAcM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF234C4CEDD;
	Sun,  9 Feb 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739115807;
	bh=qsmcmem5zXi9evcSLYdJszKgU3/24x3uo6KjCVKhQxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IM9kIAcMtB/bhmgg/yXym2l/UJkWdOjQ+Y4RE/XILD0qifnSbvX/937kThVrjN5s7
	 a0oMbOD+oUVXxkKkQtkeQpAcN2AkBPBlGb6qhxKxG329CvyS/J7xvJfriYX3BbUnmH
	 YYZGteudpj5MXUmOj1jgZp6v0UC6izsRYwZLFV6I=
Date: Sun, 9 Feb 2025 16:43:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <2025020904-defile-juror-67ab@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com>
 <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>
 <2025020715-subsonic-silenced-36c5@gregkh>
 <2ac39b766dbf5f9606107d3ead216ba384cfdd2b.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ac39b766dbf5f9606107d3ead216ba384cfdd2b.camel@redhat.com>

On Fri, Feb 07, 2025 at 05:10:29PM -0500, Lyude Paul wrote:
> On Fri, 2025-02-07 at 13:16 +0100, Greg Kroah-Hartman wrote:
> > On Fri, Feb 07, 2025 at 12:42:41PM +0100, Miguel Ojeda wrote:
> > > On Fri, Feb 7, 2025 at 1:42 AM Lyude Paul <lyude@redhat.com> wrote:
> > > > 
> > > > This introduces a crate for working with faux devices in rust, along with
> > > 
> > > s/crate/module
> > > 
> > > (also in the module description)
> > > 
> > > > +//! C header: [`include/linux/device/faux.h`]
> > > > +use crate::{bindings, device, error::code::*, prelude::*};
> > > 
> > > Newline between.
> > > 
> > > > +        // SAFETY: self.0 is a valid registered faux_device via our type invariants.
> > > 
> > > Markdown.
> > > 
> > > > +// SAFETY: The faux device API is thread-safe
> > > > +unsafe impl Send for Registration {}
> > > > +
> > > > +// SAFETY: The faux device API is thread-safe
> > > > +unsafe impl Sync for Registration {}
> > > 
> > > Perhaps some extra notes here would be useful, e.g. is it documented
> > > to be so? Especially since faux is being added now, it may make sense
> > > to e.g. take the chance to work on mentioning this on the C side.
> > 
> > How can or should I mention this on the C side?
> 
> This is a very good question :), especially because it turns out I actually
> think this function is not thread-safe! Though I don't think that's actually
> much of a problem for Send/Sync here:
> 
> So - my original assumption was that since faux_device_destroy() just wraps
> around device_del() and put_device() we'd get thread safety. put_device() is
> thread-safe, but on closer inspection I don't see that device_del() is. It
> _can_ be called from any thread, but only so long as there is a guarantee it's
> called exactly once. I think that's fine both for C and rust, but it
> definitely warrants a more descriptive SAFETY comment from me.
> 
> So for the C side of things I might actually add documentation to device_del()
> for this that would look something like this:
> 
>    device_del() can be called from any thread, but provides no protection
>    against multiple calls. It is up to the caller to ensure this function may
>    only be called once for a given device.

You are correct in that device_del() has to be called only once, but the
idea of "thread safe" really isn't a thing in the kernel because we have
processes entering/exiting the code from all different places so things
better be "thread safe" almost everywhere, what matters to us as you
know is "context" due to sleep/locking issues.

So how about this wording instead:
	device_del() must be called from process context, not interrupt
	context, and also provides no protection against multiple calls
	for the same device.  It MUST be up to the caller to ensure that
	this function can only be called once for a given device.


> And then I suppose we could refer back to device_del() in faux_device_destroy()'s
> documentation if we want. For the rust side of thing the safety comment could
> just be like this:
> 
>    // SAFETY: Our bindings ensure only one `Registration` can exist at a time,
>    meaning faux_device_destroy() can only be called once for a given
>    registration - fulfilling the driver core's requirements for thread-safety.

Sure, but I think we are going to start getting "thread" confusion over
time here, is this something we want to start thinking about or am I
just running into it for the first time here?  I know it's a userspace
thing but not normally thought of in the kernel subsystems I'm familiar
with.

thanks,

greg k-h
