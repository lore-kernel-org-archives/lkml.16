Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8321F4171
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303352; cv=none; b=CbB/mJIj/Mq96LXTEuhP1kiJq+lqFcwGqAsL7TnT4lZrZCsskUBfCh89B0AuokDWfSQDQgOmvu0YPIB3QjWKiAOROG8Cs5jHr820Tn5sjGCPrWUsobyLIaf+ywUMzJ5tzoGZHIqmaLKZVjT8LvUNuoOe17Xyisy2xICnpFRoNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303352; c=relaxed/simple;
	bh=lrR7Z8avgqYU9c+BPlVtVNEtth3qUmeM5ogYYTQ240A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cfb6pf+Z87JjrbHztXbZwGytBqUXsOig35h83fu5H2i4y3O0DHGpcv4wp9mPyNvcJBCYIxSZYTa1ycjGYDcAgQqcuoH5AHFg3xLhmsUK9kRSVLoDW5JcvwyHaRZFPWKzsGksl4M8EVEGOJf1AmyA2szafynuIR9gFQ8fCxOw7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 13ac9f14-1f43-11f0-8efd-005056bdfda7;
	Tue, 22 Apr 2025 09:29:01 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:29:00 +0300
To: Ingo Molnar <mingo@kernel.org>
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
Subject: Re: [PATCH 03/29] x86/boot/e820: Simplify the PPro Erratum #50
 workaround
Message-ID: <aAc3LGfa7HTBJqWx@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-4-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-4-mingo@kernel.org>

Mon, Apr 21, 2025 at 08:51:43PM +0200, Ingo Molnar kirjoitti:
> No need to print out the table - users won't really be able
> to tell much from it anyway and the messages around this
> erratum are unnecessarily obtuse.
> 
> Instead clearly inform the user that a 256 kB hole is being
> punched in their memory map at the 1.75 GB physical address.
> 
> Not that there are many PPro users left. :-)

...

> +		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM, E820_TYPE_RESERVED);

Perhaps, 0x40000ULL --> SZ_256K ?

-- 
With Best Regards,
Andy Shevchenko


