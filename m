Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31A22F16E;
	Fri, 30 May 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619764; cv=none; b=iivlASSRIDwOBq5aLpGJ2i84/yobUM5uCehnZ7fw23UjIr2DDUInxv7z9GIMJ5r+Y550R2WOpqJeCuhiRTAOSfZnfR1zpK3MMAvPmKS7WzWL7JswL/b42HT/F3KhZ3yFGfufG/iHL+k7v76HhanZ7NVca1WJvddXma1h5ChmAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619764; c=relaxed/simple;
	bh=eerddEGy8q/TIRT+VDnCH6+umVxn0GP6ycAivqXdX1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCX/9K/eODd+/CjxwAnyal3IBYz7AAmHrCHmWpHjJgEfSorxACKq7WmX6m/eRb4Rpj8lZFOd+KeTcvUqddzwrsiaC/Ibm2UYj++DsJVynF7vbkKKhuCX14YAAwha6HWi/jQRmWQTR8zunQXwYQ2z8zWNktlZxI7bg55tshO7/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CmEhs9Ip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CmEhs9Ip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B00C4CEE9;
	Fri, 30 May 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748619763;
	bh=eerddEGy8q/TIRT+VDnCH6+umVxn0GP6ycAivqXdX1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmEhs9IpOE5Yri4Y5NzJ+LkrchygFNPbk+s6vq8Mcd3hX7y3NqvA1ixqRNOWWL77b
	 cCGsE0MFo5kb7BNY6yeTuaCz4FJWDpMBLMpDXAFiFreCurNKolymnZy5Oz15VPEZKE
	 ylX98Iy2dOHnfnh7zYgUS/Iplq7LoSxUUFjcGkIQ=
Date: Fri, 30 May 2025 17:42:39 +0200
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
Message-ID: <2025053039-reselect-thinness-e0a2@gregkh>
References: <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>

On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
> On Fri May 30, 2025 at 6:01 PM JST, Greg KH wrote:
> > On Fri, May 30, 2025 at 03:59:03PM +0900, Alexandre Courbot wrote:
> >> On Fri May 30, 2025 at 3:22 PM JST, Greg KH wrote:
> >> > On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
> >> >> However, Nova also supports a couple of older chip generations that use
> >> >> the same GSP firmware -  it is for these that the ELF unpacking must
> >> >> occur in the kernel. IIUC this has to do with the capabilities of the
> >> >> microcontroller that ultimately does the loading (more capable RISC-V on
> >> >> Hopper+ vs. older and more limited Falcon).
> >> >
> >> > Why specifically does the kernel have to get involved here?  What
> >> > requires it to do it that userspace can not?
> >> 
> >> I don't know of a user-space tool that is readily available and could
> >> perform such extraction of the ELF content upon kernel request. Is there
> >> anything like this?
> >
> > libelf provides you with the needed tools for this.
> >
> > And you didn't answer my question.
> 
> Yes, extracting a section of an ELF file is as trivial as calling
> objcopy, no issue with that.

Great!

> What I don't understand is, who calls objcopy to do that in the first
> place, when, and how is the extracted section passed to the kernel?
> After digging a bit I found out about CONFIG_FW_LOADER_USER_HELPER which
> looks like it could help, but that option is disabled even on my Arch
> stock kernel.

Yes, userspace is the thing that does this when it is told to do it by
the kernel.

> But even assuming it was readily available, how to use it is not clear
> to me and I could not find a single actual example. I assumed a udev
> rule could catch the uevent and call a script that extracts the section
> and load it through the sysfs loading interface, but
> fallback-mechanisms.rst mentions that "...however firmware loading
> support was removed from udev as of systemd commit be2ea723b1d0". Which
> makes this idea look like a dead-end.

Look at how all firmware is loaded on your system today, this isn't a
new thing, it's been working well for everyone for decades now :)

> So to try to answer your question, I am not disagreeing that userspace
> is capable of doing what we currently do in the kernel. My follow-up
> questions to that are: how do we command userspace to do that work for
> us when we request the firmware, how do we provide the result to the
> kernel, and is this something that distros can adopt easily? I'm happy
> to consider doing things this way, but would need a few pointers to look
> into.

Again, look at how your firmware for your devices in your laptop are
loaded today.

thanks,

greg k-h
