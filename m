Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8923727FD4D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745511922; cv=none; b=I81GsrVz/Qf3WE1DT/z3tHzP2H+ivFznOfUlumRK8Rm2ZI119p26hjYd6IA6xuVyofF+TXbnjV6O+q7yi6p/MfIJ6IWEtq1lZI+TNc/1PyITYv1MRjX3noMG1CDiMVIIQ2wLCzIMzPuacEYe7bYMXmmuZlbjH1Wf6e+0wmNYxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745511922; c=relaxed/simple;
	bh=DtpT7xWNCKJCP1wtqX3ELlicJiarxdeHGximxQW4Xsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyLSDML2BHVnNXtYDktexDljWr0FSTamfQkO45zenKR3JfsYpfN3RdYqpF2k7fs5h5PZEHv++n26nmxcd3adEJREKKAsFJRqyzOYuuA9ZcAsptfE0OoRp0ZiTYXnIYXhZzcXnaMS1p7OIKqqhYu5C0Np4tpEtTUWOgauKj+axWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuf30jNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuf30jNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD233C4CEE3;
	Thu, 24 Apr 2025 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745511921;
	bh=DtpT7xWNCKJCP1wtqX3ELlicJiarxdeHGximxQW4Xsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuf30jNc9sPzyD9aqbcysibPXpg3o3SjWNpJb7KDQmn2G/DC9xlezLiKh0cVDMJYG
	 dPZ05ybqm5fU6eGUHDyCFaJMgfbrwYt5Fo4pMkDsTSX1kd/D/Ws9W3t1ydF1JZAnu8
	 LuixoK5ENSL+s4e1nGn0y/OsxRmuvRCTrL7EliSEyzRy7qXDIIQzV0Lmt2QZ2u8d/a
	 n5s1m8N6OpdM+WBu/ZMTWQmo/ySHXbvVb9YNrPACSDiiQiEATRYYz5HF5ZSjpUsfTF
	 5X+kuX7++NJhqqnplTqEZCMvdkDVmB3VZLR93wHjH25vb2BHOpFVcRSp6OdGdg4/9B
	 GdiQpixtr7oRA==
Date: Thu, 24 Apr 2025 18:25:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: phasta@kernel.org
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] x86/boot: Work around broken busybox truncate tool
Message-ID: <aApl7iqRl--uZFZE@gmail.com>
References: <20250424101917.1552527-2-ardb+git@google.com>
 <cc549efcd078fdefafc12442b08ae7ceaa197eb9.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc549efcd078fdefafc12442b08ae7ceaa197eb9.camel@mailbox.org>


* Philipp Stanner <phasta@mailbox.org> wrote:

> Thank you very much for this fix :)
> 
> On Thu, 2025-04-24 at 12:19 +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > The GNU coreutils version of truncate, which is the original, accepts
> > a
> > % prefix for the -s size argument which means the file in question
> > should be padded to a multiple of the given size. This is currently
> > used
> > to pad the setup block of bzImage to a multiple of 4k before
> > appending
> > the decompressor.
> > 
> > busybux reimplements truncate but does not support this idiom, and
> 
> typo, busybox.

Fixed, thx.

> 
> > therefore fails the build since commit
> > 
> >   9c54baab4401 ("x86/boot: Drop CRC-32 checksum and the build tool
> > that generates it")
> 
> Should this be marked as an official bug?
> 
> If so, I'd put this as a Fixes: tag below.

So I've added a Fixes tag, because it's informative, but 9c54baab4401 
is new in v6.15-rc1 so there's no backporting need.

> > Work around this by avoiding truncate altogether, and relying on dd
> > to
> > perform the padding.
> > 
> > Reported-by: <phasta@kernel.org>
> 
> Tested-by: Philipp Stanner <phasta@kernel.org>

Thanks!

	Ingo
