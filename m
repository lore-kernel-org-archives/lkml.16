Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33613C67C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304175; cv=none; b=XL3v9ZTfQCYZUmk8bG10tAA97v86Ay/wr7us1eSWHCFYQVGWmTvA8Tv20eyYg/75yM72UgbbG2vxGTCWEiK+OX5hdbr7xLNncLDxA8chBMb3+t1ChQtITlKjH/qQrbYW7oTKQ6AHmrkTI5C/PQeeWSuyv5rn78ZKnoWjvHqLYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304175; c=relaxed/simple;
	bh=65j8OL0xwnRR+jTsZIZcQBA3JL1tghAdVnAsPmPe/QY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5U13oY78ukb6Tp0/PL9n4n2grYwDUmKmrWWqE6XLTDGofjiUJL5j9Uzi2gKc0o6MoUeIOPwJ51J6rwl3TMDjOGFiYNaIc9VfPKD7Dvmc1cbVyBGwgQzSeBUWBRazqltQkyDm08vrOfjvQWZRavJBo98g10DVaHnr1IMP2ye/kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 028bdea2-1f45-11f0-8efd-005056bdfda7;
	Tue, 22 Apr 2025 09:42:50 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:42:50 +0300
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
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aAc6aj5FVMkwDo06@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-6-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-6-mingo@kernel.org>

Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar kirjoitti:
> Gaps in the E820 table are not obvious at a glance and can
> easily be overlooked.
> 
> Print out gaps in the E820 table:
> 
> Before:
> 
> 	BIOS-provided physical RAM map:
> 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
> 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
> 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
> 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> After:
> 
> 	BIOS-provided physical RAM map:
> 	BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> 	BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> 	BIOS-e820: [gap 0x00000000000a0000-0x00000000000effff]
> 	BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff] usable
> 	BIOS-e820: [mem 0x000000007ffdc000-0x000000007fffffff] reserved
> 	BIOS-e820: [gap 0x0000000080000000-0x00000000afffffff]
> 	BIOS-e820: [mem 0x00000000b0000000-0x00000000bfffffff] reserved
> 	BIOS-e820: [gap 0x00000000c0000000-0x00000000fed1bfff]
> 	BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> 	BIOS-e820: [gap 0x00000000fed20000-0x00000000feffbfff]
> 	BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> 	BIOS-e820: [gap 0x00000000ff000000-0x00000000fffbffff]
> 	BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> 	BIOS-e820: [gap 0x0000000100000000-0x000000fcffffffff]
> 	BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> 
> Also warn about badly ordered E820 table entries:
> 
> 	BUG: out of order E820 entry!
> 
> ( this is printed before the entry is printed, so there's no need to
>   print any additional data with the warning. )

...

> +		u64 range_start, range_end;

struct range (from range.h) and...

> +		range_start = entry->addr;
> +		range_end   = entry->addr + entry->size;
>  
> +		/* Out of order E820 maps should not happen: */
> +		if (range_start < range_end_prev)
> +			pr_info("BUG: out of order E820 entry!\n");
> +
> +		if (range_start > range_end_prev) {
> +			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
> +				who,
> +				range_end_prev,
> +				range_start-1);

%pra
with who mentioned the "gap"?

> +		}

-- 
With Best Regards,
Andy Shevchenko


