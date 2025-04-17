Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E3225A22;
	Thu, 17 Apr 2025 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881302; cv=none; b=PYUU7J2P44OwoLaeY4ju1m3gvqQjUWa1omIhSxCFV+jhVgWRMGAaFXUtDhnqEDhMBFx0/u2FPFXFcPL02o9U3P514GTpC2GgE349HhEjeMnyU6vsJiZxMokeGMG1lBUBoaZNb6NX7ggsZPGmaU4xlL1py75nXfz44EdthNYRjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881302; c=relaxed/simple;
	bh=Z7NTpZ0nEG3ynbwc2X/V/VqBUTzzuWAmCSR5JVqRIQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqitTP/OAN0OeWT/ZOJI0gkoWyfjIqq+/b33KhYc14iRlVTmIyCJZsw8FkWODuqPJ8VtSzQkn8EdzznybFcGotEza3WnvV1UggOKmx5X4Hv+/8uXDShWHtPBDxw0jl+bwlUZjXhwyrJ6LFYxQ509ZGgSRwrJUvF321Al7ESvfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v4ADDzSW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v4ADDzSW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B240DC4CEE4;
	Thu, 17 Apr 2025 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744881302;
	bh=Z7NTpZ0nEG3ynbwc2X/V/VqBUTzzuWAmCSR5JVqRIQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v4ADDzSWCqGjjDj88whX+Y9ipXj/9Qbrt8PbWuAAqz0Jzqre5F+QeiFHm+SQYxNJq
	 Rk6l1Fb27DiUDOOnLZS2kFvGxxVi8fEjv4YpAoRgn1wkFp/KddI2i9Kr4mRHilzLIg
	 25foBpkVOIIWLyaDqvndE70UW6zvZvZThl6k0xM0=
Date: Thu, 17 Apr 2025 11:14:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: gpib: Removing unused function CFGn
Message-ID: <2025041717-unnatural-scaling-f4d7@gregkh>
References: <20250409181809.401724-1-matchstick@neverthere.org>
 <2025041522-startling-parlor-aa65@gregkh>
 <aABR5Ykv5lawt_BE@tiamat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aABR5Ykv5lawt_BE@tiamat>

On Thu, Apr 17, 2025 at 12:57:09AM +0000, Michael Rubin wrote:
> On Tue, Apr 15, 2025 at 04:47:34PM +0200, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 06:18:09PM +0000, Michael Rubin wrote:
> > Already in my tree?  I'm confused, this didn't apply at all.
> 
> Sorry for the hassle here. I will be keeping my tree much closer to yours
> going forward.
> 
> I just did a comparison of your tree and mine with the following commands:
> 
> $ git fetch origin
> $ git rebase origin/staging-testing
> Current branch work-next is up to date.
> $ git log --oneline origin/staging-testing..HEAD
> 01bb7ebee650 (HEAD -> work-next) staging: gpib: tnt4882: u8 over uint8_t
> b362526c049a staging: gpib: lpvo_usb_gpib: u8 over uint8_t
> c0086ac9f8c6 staging: gpib: gpib_ioctl: u64 over uint64_t
> dfde322a6458 staging: gpib: pc2: u8 over uint8_t
> 0d68978f157c staging: gpib: ni_usb: u8 over uint8_t
> 6c1d83dae00e staging: gpib: hp_82341: u8 over uint8_t
> 6e47dd2b355e staging: gpib: hp_82335: u8 over uint8_t
> 066df8151ebc staging: gpib: gpib_bitbang: u8 over uint8_t
> e2f98401b6cc staging: gpib: gpib_os: u8 over uint8_t
> d39283e31564 staging: gpib: cec: u8 over uint8_t
> 76ca6178f5ac staging: gpib: agilent_82357a: u8 over uint8_t
> 83a4047b9a77 staging: gpib: agilent_82350b: u8 over uint8_t
> e3e09b3c0b18 staging: gpib: gpib_user: u8 over uint8_t
> 7de94cbc8071 staging: gpib: gpib_ioctl: u8 over uint8_t
> 98b2ae8ac973 staging: gpib: Removing typedef gpib_interface_t
> 9d1d6dfa3871 staging: gpib: tnt4882: struct gpib_interface
> 914975f8fc96 staging: gpib: pc2: struct gpib_interface
> 64c745a7adb7 staging: gpib: ni_usb: struct gpib_interface
> c303323266fe staging: gpib: lpvo_usb: struct gpib_interface
> 576eb9e6c1fa staging: gpib: ines: struct gpib_interface
> 5f2fb6ca422e staging: gpib: gpibP: struct gpib_interface
> 0033454014c8 staging: gpib: hp2341: struct gpib_interface
> b1ab383f5d09 staging: gpib: hp_82335: struct gpib_interface
> 41ebb7c070bf staging: gpib: gpio: struct gpib_interface
> ef391db774c0 staging: gpib: fmh: struct gpib_interface
> 701c5a45b91a staging: gpib: fluke: struct gpib_interface
> 88d5e0847f06 staging: gpib: common: struct gpib_interface
> 77b611bf3468 staging: gpib: cec: struct gpib_interface
> 803d5bfacf86 staging: gpib: cb7210: struct gpib_interface
> 294e66a9b7bc staging: gpib: agilent_82357a: gpib_interface
> 6eafa79e636a staging: gpib: agilent_82350b: gpib_interface
> 7a309862d53f staging: gpib: struct typing for gpib_interface
> b248b9d75062 staging: gpib: uapi: Fix CamelCase and IBA Dup
> $
> 
> I sent over the following series:
> 
> 1) v2: u8 and u64 remaining patches
> 
> 2) v3: the gpib_interface_t series (I broke the tree with v2).
> 
> 3) The IBA Camel Case patch.

I've taken all of these now, thanks!

> See if you can apply the CFGn patch after all the clean up. Not sure why that
> does not apply cleanly. It does in my tree right now after the sync and rebase.

Can you resend the CFGn patch, it's long-gone from my patch review
queue.

After that, I think I'm caught up, right?

thanks,

greg k-h
