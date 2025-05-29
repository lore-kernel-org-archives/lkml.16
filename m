Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C9B67F;
	Thu, 29 May 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748505696; cv=none; b=UJZN/EI1kwjygEuyekaiYAbOZ0ncRBm4uRu+wxwq3qK/w+0gpLlcXXMg2N4B5Dx97QbE6nS25fwOIpA8zaZcEcWXRiaqnqJ/i18fZKNRc2iT+zwNfi2X3hwjLqkTDkwXRiaeZxMPCnVXY7TfDyHcyM4Y8fzGamoVSORvZD/vP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748505696; c=relaxed/simple;
	bh=XRLoSqmyoqw5/XwdG6FsxrALYtKJ3ELCysFhWxyY5y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSsM8w0fVwjTD/s/mZYlrUWy24OLEDlhxSR6clQW6yOAOKk53i2+L2F2mT0TzvFXuP9bjN1RX3fncYrEAxFnlX8hqDNh8t1a0nqiB7Onr5yB4E3V6uTcQZpNhrQQ264eHvW9jbE3hsws27CnOGVxpmiacwQfdLFxZwhP7ZPQD4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vT4JkUp/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vT4JkUp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC241C4CEE7;
	Thu, 29 May 2025 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748505693;
	bh=XRLoSqmyoqw5/XwdG6FsxrALYtKJ3ELCysFhWxyY5y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vT4JkUp/rDGeiTbnnr++ysZYhM/vggIvDIwBe7zDkvgQ6rwMygSNaiehbnKdgwjzD
	 DXBkXj0cx4TyjLe5gDw2gQ98kRsscJpKOK6ZYdIVMVeiosnQniOxWXe+MucO5T1Ppz
	 CBJYzB5OttG6YvDj05j6gmdcLmq8yctmrZOF9joE=
Date: Thu, 29 May 2025 10:01:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <timur@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025052932-pyramid-unvisited-68f7@gregkh>
References: <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>

On Thu, May 29, 2025 at 03:53:42PM +0900, Alexandre Courbot wrote:
> Hi Greg,
> 
> On Sat May 17, 2025 at 9:51 AM JST, Alexandre Courbot wrote:
> > On Sat May 17, 2025 at 1:28 AM JST, Timur Tabi wrote:
> >> On Fri, May 16, 2025 at 9:35 AM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>>
> >>> We use ELF as a container format to associate binary blobs with named
> >>> sections. Can we extract these sections into individual files that we
> >>> load using request_firmware()? Why yes, we could.
> >>
> >> Actually, I don't think we can.  This is the actual GSP-RM ELF image
> >> you're talking about.  This comes packaged as one binary blob and it's
> >> intended to be mostly opaque.  We can't just disassemble the ELF
> >> sections and then re-assemble them in the driver.
> >>
> >> Unfortunately, for pre-Hopper booting, we need to do a little
> >> pre-processing on the image, referencing the ELF sections, and based
> >> on data from fuses that cannot be read in user-space.
> >
> > I'd like to reinforce Timur's point a bit because it is crucial to
> > understanding why we need an ELF parser here.
> >
> > On post-Hopper, the GSP ELF binary is passed as-is to the booter
> > firmware and it is the latter that performs the blob extraction from the
> > ELF sections. So for these chips no ELF parsing takes place in the
> > kernel which actually acts as a dumb pipe.
> >
> > However, pre-Hopper does not work like that, and for these the same GSP
> > image (coming from the same ELF file) needs to be extracted by the
> > kernel and handed out to booter. It's for these that we need to do the
> > light parsing introduced by this patch.
> >
> > So while I believe this provides a strong justification for having the
> > parser, I also understand Greg's reluctance to make this available to
> > everyone when nova-core is the only user in sight and the general
> > guideline is to avoid processing in the kernel.
> >
> > OTOH, it is quite short and trivial, and if some drivers need a
> > packaging format then it might as well be ELF. The imagination DRM
> > driver for instance appears to load firmware parts from an ELF binary
> > obtained using request_firmware (lookup `process_elf_command_stream`) -
> > very similar to what we are doing here.
> >
> > `drivers/remoteproc` also has what appears to be a complete ELF parser
> > and loader, which it uses on firmware obtained using `request_firmware`
> > (check `remoteproc_elf_loader.c` and how the arguments to the functions
> > defined there are `struct firmware *`). Admittedly, it's probably easier
> > to justify here, but the core principle is the same and we are just
> > doing a much simpler version of that.
> >
> > And there are likely more examples, so there might be a case for a
> > shared ELF parser. For nova-core purposes, either way would work.
> 
> Gentle ping on this, as you can there are other drivers using ELF as a
> container format for firmware. In light of this information, I guess
> there is a point for having a common parser in the kernel. What do you
> think?
> 

I think that the other examples should be fixed up to not do that :)

remoteproc is one example, that elf logic should all be done in
userspace, but as it's been in the tree "for forever", changing it is
not going to be possible.

Same for the existing users, changing their user/kernel api is not going
to be a simple task given that there are running systems relying on
them.

But, going forward, I think you need an explicit "this is the ONLY way
we can do this so it MUST be in the kernel" justification for adding
this type of api.  AND if that happens, THEN it should be in generic
code ONCE there are multiple users of it.

But for now, doing it in generic code, that all systems end up loading,
yet very very very few would ever actually use makes no sense.  And
adding it to a driver also doesn't make sense as you can define your
user/kernel api now, it's not set in stone at all given that there is no
existing code merged.

So again, I'm all for "do NOT do yet-another-elf-loader-in-the-kernel",
if asked.

thanks,

greg k-h
