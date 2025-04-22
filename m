Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA47B1F4E59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303903; cv=none; b=Fb0j/wjlVPoJisnd4pbZyWkIwaPmQy5xpdgIjTzP8zpxwd34FHrYr3k3ZBqw74j3DnXCIVMyaO2kEqXLqdmIheI/N1TVOdLdZkH1kKr92Isl3U0aYeIV919kIenKGYtLzlMpxHtIGxdz8oSKbmtnC6qgpVreKjbr95Ry3vyvSUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303903; c=relaxed/simple;
	bh=7usx94h/DwkKANbRL3I4CcV2ppwSaJp7Xo547IrqQns=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV16EKFi7KV006VWJGiaL8rJi7GjcyK1EOusZ9ZfL1WDdvqB+Xwq/aMiTGVlIlblqv/JsdhkL85PxpxtfvfXAfFm1bzWm7XPRyPhm8XQuZ+w1psBvwMl/2ETL8nva0G6OAl0oFjWq4uliBXBLM4gzGyvFQWpTTix17Jq7x+YwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 607958c7-1f44-11f0-8efd-005056bdfda7;
	Tue, 22 Apr 2025 09:38:18 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:38:18 +0300
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
Subject: Re: [PATCH 07/29] x86/boot/e820: Print out sizes of E820 memory
 ranges
Message-ID: <aAc5Wlwj4gaBApIy@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-8-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-8-mingo@kernel.org>

Mon, Apr 21, 2025 at 08:51:47PM +0200, Ingo Molnar kirjoitti:
> Before:
> 
>         BIOS-provided physical RAM map:
>         BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
>         BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
>         BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
>         BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
>         BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
>         BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
>         BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
>         BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
>         BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
>         BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> 
> After:
> 
> 	BIOS-provided physical RAM map:
> 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff]  639   KB kernel usable RAM
> 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]    1   KB reserved
> 	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]  320   KB ...
> 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]   64   KB reserved
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff]  144   KB reserved
> 	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]  768   MB ...
> 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff]  256   MB reserved
> 	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff] 1005.1 MB ...
> 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff]   16   KB reserved
> 	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]    2.8 MB ...
> 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff]   16   KB reserved
> 	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]   15.7 MB ...
> 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff]  256   KB reserved
> 	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff] 1008   GB ...
> 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff]   12   GB reserved
> 
> Note how a 1-digit precision field is printed out if a range is
> fractional in its largest-enclosing natural size unit.
> 
> So the "256 MB" and "12 GB" fields above denote exactly 256 MB and
> 12 GB regions, while "1.9 GB" signals the region's fractional nature
> and it being just below 2GB.
> 
> Printing E820 maps with such details visualizes 'weird' ranges
> at a glance, and gives users a better understanding of how
> large the various ranges are, without having to perform hexadecimal
> subtraction in their minds.

...

> +/*
> + * Print out the size of a E820 region, in human-readable
> + * fashion, going from KB, MB, GB to TB units.
> + *
> + * Print out fractional sizes with a single digit of precision.
> + */
> +static void e820_print_size(u64 size)
> +{
> +	if (size < SZ_1M) {
> +		if (size & (SZ_1K-1))
> +			pr_cont(" %4llu.%01llu KB", size/SZ_1K, 10*(size & (SZ_1K-1))/SZ_1K);
> +		else
> +			pr_cont(" %4llu   KB", size/SZ_1K);

I would add some spaces here and there for the sake of readability.


> +		return;
> +	}
> +	if (size < SZ_1G) {

Can be written in one line as

	} else if (...) {


Ditto for the rest.

> +		if (size & (SZ_1M-1))
> +			pr_cont(" %4llu.%01llu MB", size/SZ_1M, 10*(size & (SZ_1M-1))/SZ_1M);
> +		else
> +			pr_cont(" %4llu   MB", size/SZ_1M);
> +		return;
> +	}
> +	if (size < SZ_1T) {
> +		if (size & (SZ_1G-1))
> +			pr_cont(" %4llu.%01llu GB", size/SZ_1G, 10*(size & (SZ_1G-1))/SZ_1G);
> +		else
> +			pr_cont(" %4llu   GB", size/SZ_1G);
> +		return;
> +	}
> +	if (size & (SZ_1T-1))
> +		pr_cont(" %4llu.%01llu TB", size/SZ_1T, 10*(size & (SZ_1T-1))/SZ_1T);
> +	else
> +		pr_cont(" %4llu   TB", size/SZ_1T);
> +}

Don't you want to use string_helpers.h provided API? 
string_get_size().

-- 
With Best Regards,
Andy Shevchenko


