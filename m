Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894AA15E97
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748715696; cv=none; b=AL3fNLUUOMdmm+v5qeiDNykjB09uAdHJ6HeRpTisBxzCWzNPhfxKtlpOUUJVKwmHoq4fHwRV7MpF5wdBZYkJwyJAvYPgxUQIz9CgAGSspFQdb/ZEHrln73jCzq4kYwQEgSZRg1rKqKD2PobPXyNGBgNVouh+LA5NQ+S1DM3skSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748715696; c=relaxed/simple;
	bh=ZRs3XEXZ/16TYS3O7Fd6MNAano8g1IYm3h9QlzVAVlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRFSdUxB7tRUnfDo+CEdmuWgwfSDI4RfxcZMtSNNQECkBYqK67gzD+zsV1CVlquJ7Nk0zsC3T9MnUQ1rIF473+nkF66pxCq/OmMC1eSE0RMcwrNVxfxSUAWMYM/pH3dEs/g4eB5v37/+ZmSK5OQSe7HkjNzqJXfR5atY8NmZWlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwHvSVjK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwHvSVjK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD28C4CEE3;
	Sat, 31 May 2025 18:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748715696;
	bh=ZRs3XEXZ/16TYS3O7Fd6MNAano8g1IYm3h9QlzVAVlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PwHvSVjKAA1gISw48r/oJluJk+nTQf9kscgRvzkxJewYIeW4WCq6jlqrCJ2RIC96z
	 /JOYvHZlmn23/Gie2T2Uof/foZlv9FoMjOKKs/CSl31VSpihpXROYTLdS2BoS33uSH
	 1RuIA1TJ39+pHtVhusY0kdHNg6Ohba0OiF971CYLss+/D8gSqDdRTBfUIN7GsfmHVT
	 OBBW/QehstbYURiuEiKnM0vl0EPfv/P8IXvXjy6KIcvdtF7yKqi7SmFdruDBOH+z65
	 A1G1ZigpzA7yOqtgjxKPyATxi5os6z0MjwcopiZuqkDyrRCpiQbZNviFpna1N2QPP+
	 IbIDjUoZPxnSg==
Date: Sat, 31 May 2025 20:21:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 07/32] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aDtIqi9IL04233s9@gmail.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-8-mingo@kernel.org>
 <aCsjZW15Wh2lRC1q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsjZW15Wh2lRC1q@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> > Printing E820 maps with such details visualizes 'weird' ranges at a 
> > glance, and gives users a better understanding of how large the 
> > various ranges are, without having to perform hexadecimal 
> > subtraction in their minds.
> 
> Returning to the v1 discussion for sring_get_size(). Looking at its 
> code it seems to me that you haven't tried to use it. It should give 
> no .0 for the exact numbers. If it's not the case, please confirm 
> that we have a bug/feature. If it's documented (read: we have a test 
> case), then we would need an additional flag to avoid this behaviour 
> for your case. No need to reinvent a wheel here.

I briefly looked at get_string_size(), and it insists on the KiB/GiB 
sort of nonsense for base-2 sizes that we rarely use in x86 debug 
output, nor do we want to.

And I'm not convinced about 'struct range' and '%pre' either: I'd 
prefer to control both th data format and the output, while pra 
seems to insist both on using 'struct range', and on naming the
%output 'range', right?

I'm not convinced such a 'struct range' over-abstraction will actually 
simplify the code. The e820 debug printout code I extended in this 
series basically follows the data structure patterns and nomenclature 
of the e820 code itself.

It might or might not make sense to convert the e820 code to 'struct 
range' in a followup series, but that is beyond the scope of this 
series that refines the debug output.

Thanks,

	Ingo
