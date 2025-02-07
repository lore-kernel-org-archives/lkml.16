Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC59223ED69;
	Fri,  7 Feb 2025 15:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941768; cv=none; b=C5Yhrs/qKQN79P/7l1gE1m54CPm9piGLvlFgOrXF4BKp2A/+bdptCTnzQej4+sDO7eEdGTBc025cp92Z9ySOedGxszL3MiqWf21Rt4DGmiY5R1NrA3phJyTSBTWH39JgeGShIYaI4/M4dcGjRvOs8OtKY/saYibncuwXjMkyv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941768; c=relaxed/simple;
	bh=PR0tfB45jqB2uo/pROjozw09esVcNGC4hCN6ACw47j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQs4ohBhsvxYie4R2J+jPqjvvSDt1X4cv4Hrx6G2DPKeBsk1ZeQ0JWuwMhA87GLyCOYj5bcr/Sokk+j7EWIfqL7xRRgd7qQ/qMdBAadIgZ7+JdpAsss0FxaP10msi4kTm+CExnx8pclSb5cwevTzQQRHQwnle79swzA8+e9VP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mODrNBza; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mODrNBza"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73268C4CED1;
	Fri,  7 Feb 2025 15:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738941768;
	bh=PR0tfB45jqB2uo/pROjozw09esVcNGC4hCN6ACw47j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mODrNBzaE3UW5T8CYw7qvdAnwa7CDeIf9RMKt6bm+SzG+yLWrAsVF/tRJAYO3MXyv
	 O6FNL0vcUCT55oMPHTUcFib0G0IgpEVRlPZR9ekylwQOtcrmFAiCzyYVGmrQSLp5Vt
	 jDywP04b0F7F+agXbm5LTnhsixf0qE45Z03oRoFE=
Date: Fri, 7 Feb 2025 16:22:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <2025020706-procurer-snowfield-b4ea@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com>
 <2025020702-garlic-kindly-8377@gregkh>
 <CAH5fLgixWd862P_mma0BObtT=gm9fTzQOZot62aet1qx4mai+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgixWd862P_mma0BObtT=gm9fTzQOZot62aet1qx4mai+g@mail.gmail.com>

On Fri, Feb 07, 2025 at 10:32:16AM +0100, Alice Ryhl wrote:
> On Fri, Feb 7, 2025 at 10:25 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> > > This introduces a crate for working with faux devices in rust, along with
> > > adding sample code to show how the API is used. Unlike other types of
> > > devices, we don't provide any hooks for device probe/removal - since these
> > > are optional for the faux API and are unnecessary in rust.
> > >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Maíra Canal <mairacanal@riseup.net>
> 
> > > +impl AsRef<device::Device> for Registration {
> > > +    fn as_ref(&self) -> &device::Device {
> > > +        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
> > > +        // a valid initialized `device`.
> > > +        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
> >
> > Just curious, this is returning an incremented "struct device" to the
> > caller, right?  And then when it goes out of scope it will have the
> > reference decremented?  And do you need a wrapper in C to get to ".dev"
> > of the faux_device structure or are you ok doing it like this?
> 
> This uses the &_ pointer type which does not involve any refcount
> increments or decrements. What you describe only happens if the
> ARef<_> pointer type is used instead.
> 
> Safety is ensured by the borrow checker that fails compilation if the
> returned reference is used after the Registration object is destroyed
> - i.e. it's assumed that the value is safe to access without refcount
> increments as long as the Registration is still alive.

Thanks for the explanation, my rust-foo is very very very basic, so
much appreciated.

greg k-h
