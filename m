Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF544D8CE
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748714962; cv=none; b=mogi/cmdvQ8LPcLWax6FpoaqYbNZN/Zh5j3aNYor4gszAjRz1EG+P+KTlMYBiZQe2da3vW1N8cvIHgNJiWbEW71Lelm9creuxOQ0gL0IAF92z7cAV4dGAL2rewTYD1jJYOLAbQpQraggF+eTM9HhXoC52PWIvB9CC/guwoBRYjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748714962; c=relaxed/simple;
	bh=WWlrY9er8h6X1eA1p1CShRyP68Nw8AbO6/HC5H1vYeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHD1L6ovl59RJzOnt33A6n30gJwZ/fTRNJEBn6N5fKvVwDg6b3+/djreLUrAMCM+y4Q9cSZ+SkHa/cvezDg4HFtvcetKbejZMLAhRx6Q62fKVlZX10KHavc4C4RJvnUraUvM+1zmnRbYqv/FLXRKmU1c8dXx9aDcH7+kj/l8dtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU+KXZE9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU+KXZE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D238C4CEE3;
	Sat, 31 May 2025 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748714961;
	bh=WWlrY9er8h6X1eA1p1CShRyP68Nw8AbO6/HC5H1vYeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VU+KXZE9ySt298FyisW7/vvGGU5Mtc/EbnfRImhsQzsMFlhZywretVlTMaO6Y2/YW
	 EhEquuCk04hJ5D1JasJ3ZVs3/rpmoRQZ/NY7ICdOlnK9KeI7l0Xe7PVWqfYaQrAXFI
	 aZvyuUPWlrWcafAZRVymRftu8SlXGKVCBwj3pAnGQTU3i3bCmxTJHnB3c41BzgQRFs
	 pSCOOcz1ntQ1eomUv3nRKq7qtgCgdj10QzAlo3H6oFLZf+s5BrTsVk2R44FdBJb97v
	 rN4806sgEt6c3L0RaCsJj5nuGeNQlIIQRcOi/XDfb7e+mjpOF9DEusIopLuWgpyLnp
	 WUcggkqzQEMfQ==
Date: Sat, 31 May 2025 20:09:15 +0200
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
Subject: Re: [PATCH 09/32] x86/boot/e820: Call the PCI gap a 'gap' in the
 boot log printout
Message-ID: <aDtFy1Fw5HUZtfcc@gmail.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-10-mingo@kernel.org>
 <aCsjvKT_FO7HxIt4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsjvKT_FO7HxIt4@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> On Thu, May 15, 2025 at 02:05:25PM +0200, Ingo Molnar wrote:
> > It is a bit weird and inconsistent that the PCI gap is
> > advertised during bootup as 'mem'ory:
> > 
> >   [mem 0xc0000000-0xfed1bfff] available for PCI devices
> >    ^^^
> > 
> > It's not really memory, it's a gap that PCI devices can decode
> > and use and they often do not map it to any memory themselves.
> > 
> > So advertise it for what it is, a gap:
> > 
> >   [gap 0xc0000000-0xfed1bfff] available for PCI devices
> 
> Why not use word 'range' instead of the 'gap'? This will allow to switch to
> %pra without modifying the output.

Well, it's not a range, it's a gap in the memory map. Why does %pra 
dictate details of the output in such a fashion?

Thanks,

	Ingo
