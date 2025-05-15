Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB117993
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304904; cv=none; b=YW+uYhPXZafG92i8d5ZBpHc4Uv+/MOYiPIJfiIqKiHX5dyavO0v8prf1htMwKD7+snHkt7DxXVCV7AKIUPw0yLyLi/0QzE8ouBkK9rd9ptZ3WpNymUtw3eFVB/rv8WcT/lhGAUUH5RHxpkoQvqqpO48VN3/xl7OnBmQ0Rq4oBSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304904; c=relaxed/simple;
	bh=YABCxsl4xwiZJGXhcufYKsmRD5GiA4ic5rurdzdDD94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIbEbiwbgN6nYiafzY7EBgyp5KJkh1g0y8s+i37YE0ymtq2OhmOCprl7yHEQxwWPtUooYddHeWB/4Xrx1j6Ycmicvw67fy7m0cYRn/Jg7ycC+9I4OXUWyrzmhYSTbIrvFF/1H5ZcMkYAJPrNTdhm/pbWwmDMMkdEbpObiY/nvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzfAniPf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzfAniPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011D2C4CEE9;
	Thu, 15 May 2025 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747304904;
	bh=YABCxsl4xwiZJGXhcufYKsmRD5GiA4ic5rurdzdDD94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzfAniPf+a8vlWrPhOFUQSaKU3O66KEqpfdUBEgszErOIpPwgTOsK9z6LPc8MFjrq
	 ucgsxyymR6kjgX0egzx5GV9mdUlNMJ2UHFNqwRkBu3VykvThG98WEl0EOcf90MxuMG
	 FtMI+HM4GXDakafnFMDB6/sJEJ/b33ovWWS1iB2R0AvAb3Us46ktnDL13VZdxqwcSL
	 anXzLPmC10Xp14y59cH3zSCy7yQC5eHiACc7wgBdMH95rRuNh0+58mZTqcha/w1SUd
	 LS3ll9MTLDdOKAbTMayk0w4W02wpTV0nKs1yCd0Pxs/W+v5JVLsEK7NlDqkDIxbOur
	 6nkIHchZFQYfA==
Date: Thu, 15 May 2025 12:28:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aCXBvRe6PrY_zlvU@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-6-mingo@kernel.org>
 <aAc6aj5FVMkwDo06@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc6aj5FVMkwDo06@surfacebook.localdomain>


* Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar kirjoitti:
> > Gaps in the E820 table are not obvious at a glance and can
> > easily be overlooked.
> > 
> > Print out gaps in the E820 table:
> > 
> > Before:
> > 
> > 	BIOS-provided physical RAM map:
> > 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> > 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> > 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
> > 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
> > 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
> > 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> > 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> > 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> > 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> > After:
> > 
> > 	BIOS-provided physical RAM map:
> > 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> > 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> > 	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]
> > 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
> > 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
> > 	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]
> > 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
> > 	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff]
> > 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> > 	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]
> > 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> > 	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]
> > 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> > 	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff]
> > 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> > 
> > Also warn about badly ordered E820 table entries:
> > 
> > 	BUG: out of order E820 entry!
> > 
> > ( this is printed before the entry is printed, so there's no need to
> >   print any additional data with the warning. )
> 
> ...
> 
> > +		u64 range_start, range_end;
> 
> struct range (from range.h) and...

Yeah, using those primitives makes sense, but right now the e820 code 
isn't using them, and it's better to have similar & unified range 
handling code patterns.

In principle I wouldn't be opposed to patches that convert the e820 
code to <linux/range.h> types.

> 
> > +		range_start = entry->addr;
> > +		range_end   = entry->addr + entry->size;
> >  
> > +		/* Out of order E820 maps should not happen: */
> > +		if (range_start < range_end_prev)
> > +			pr_info("BUG: out of order E820 entry!\n");
> > +
> > +		if (range_start > range_end_prev) {
> > +			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
> > +				who,
> > +				range_end_prev,
> > +				range_start-1);
> 
> %pra

This would be part of any <linux/range.h> conversion patches.

> with who mentioned the "gap"?

Not sure I understand?

Thanks,

	Ingo
