Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FA828540B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747303455; cv=none; b=kpgXPQa8cqUwOOoUKJ3o5Bbqvo3+wmm9u6Svwg0xBm4iEfoCEedk2ym1Pa3vyY/W3DGkCdMBF+Op7+SzSN89QzwmsPyAufE/NpVU2i5NjZpZoqgJI1KrSVrDTWvjVP1GAetgMxhFSdK9+HUVYWePYuA5wjk7tI3ypwVESs76WIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747303455; c=relaxed/simple;
	bh=1cxZlBEP3YFzZId60YdAGIPAaR8l/aMw4RMguc4dS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MftrRn4QU7SFzHaFgC7xLcvFKJjp/UjwwrsJE6fIL8hxu+pVsgGti8Xd2WmH+ZiYNEO58/otObjGLHDgLrbazbXjyR+mmkC1yVoa2YoCIl6nHW0bhs0ojXWAQF2ZSFuM6uoVsYQVajXHnDBeFJHgBrHgxfuCM2hjO4aHjFmirbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G46pLiVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G46pLiVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3408DC4CEED;
	Thu, 15 May 2025 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747303455;
	bh=1cxZlBEP3YFzZId60YdAGIPAaR8l/aMw4RMguc4dS8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G46pLiVgVK+dGLHcb2Ku6aBhXv0Q9LwH0u8gcs13PgSocyMsjXWounCvfJwDsDP/9
	 2PLKpZqbDpLXm+94IN6cMr78jhl+ALvOaR8b3kjloN1wOVUCIEK5zs1oOvvJJT9/Q8
	 sAItLe2881I0A6QbUiHKnFyzM0SrMdZl9LGNEYqnhRbk2PuRzdtd25SvqpQR0eNnwy
	 RA4DMpS6t3C3V5O5c9GjBaRZTd+SE5DodfIfJ+eJeXMgdNfB+cjYA9ym0lhs6M4LB9
	 fuhZTnVANoeLdUjJpEBRDfVQDr1XlGGdC/YSPfBZ0Y79L0kXq8D1ThAbD/ZvQeGAwc
	 OJtgf0RIdKlfw==
Date: Thu, 15 May 2025 12:04:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH -v2 29/29] x86/boot/e820: Introduce E820_TYPE_13 and treat it
 as a device region
Message-ID: <aCW8GQMGg4O7oZci@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-30-mingo@kernel.org>
 <4632031c-fa17-48ac-a9ce-e6bbe1668da9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4632031c-fa17-48ac-a9ce-e6bbe1668da9@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> On 4/21/25 11:52, Ingo Molnar wrote:
> > Paul Menzel pointed out that ACPI specification 6.3 defines 'reserved'
> > E820 region types as E820_TYPE_RESERVED (type 2):
> > 
> >   > Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
> >   >
> >   > > Reserved for future use. OSPM must treat any range of this type as if
> >   > > the type returned was AddressRangeReserved.
> > 
> > This has relevance for device address regions, which on some firmware such
> > as CoreBoot, get passed to Linux as type-13 - which the kernel
> > treats as system regions and registers them as unavailable to drivers:
> > 
> 
> ... so we should handle 13 accordingly (and probably request that the 
> ACPI committee permanently reserve it.  It would have been better to 
> use negative numbers for OS-specific things.)
> 
> However, if we run into a value that we have never seen, say 
> something like 84, we shouldn't assume that it is safe to do anything 
> at all to it; in particular we really don't want to assume that it is 
> safe to place I/O devices there.
> 
> Note that devices may be a priori set up in type 2 memory; it pretty 
> much means "this device is treated specially by firmware, don't move 
> it around or bad things will happen."

Okay, agreed, this approach makes a lot of sense.

How about the replacement patch below? It basically implements your 
recommendation: E820_TYPE_13 follows E820_TYPE_RESERVED behavior 
(device region), while other unknown types are still treated 
conservatively: system region, don't touch, don't merge.

Thanks,

	Ingo

====================================>
From: Ingo Molnar <mingo@kernel.org>
Date: Sat, 19 Apr 2025 21:50:24 +0200
Subject: [PATCH] x86/boot/e820: Introduce E820_TYPE_13 and treat it as a device region

Paul Menzel pointed out that ACPI specification 6.3 defines 'reserved'
E820 region types as E820_TYPE_RESERVED (type 2):

 > Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
 >
 > > Reserved for future use. OSPM must treat any range of this type as if
 > > the type returned was AddressRangeReserved.

This has relevance for device address regions, which on some firmware such
as CoreBoot, get passed to Linux as type-13 - which the kernel
treats as system regions and registers them as unavailable to drivers:

	static bool __init e820_device_region(enum e820_type type, struct resource *res)

	...

        case E820_TYPE_ACPI:
        case E820_TYPE_NVS:
        case E820_TYPE_UNUSABLE:
        default:
                return false;

Users of such systems will see device breakage on Linux, which they
have to work around with iomem=relaxed kind of boot time hacks to
turn off resource conflict checking.

Partially follow the ACPI spec and add a limited quirk for the
E820_TYPE_13 type, and allow it to be claimed by device drivers
(similarly to E820_TYPE_RESERVED).

Don't change behavior for other unknown types.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/types.h |  4 ++++
 arch/x86/kernel/e820.c            | 11 +++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
index df12f7ee75d3..2430120c2528 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -27,6 +27,10 @@ enum e820_type {
 	 *   6 was assigned differently. Some time they will learn... )
 	 */
 	E820_TYPE_PRAM		= 12,
+	/*
+	 * Certain firmware such as CoreBoot uses this type:
+	 */
+	E820_TYPE_13		= 13,
 
 	/*
 	 * Special-purpose memory is indicated to the system via the
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 6649d49c9c0f..e2579e385181 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1075,7 +1075,7 @@ __init static const char * e820_type_to_string(struct e820_entry *entry)
 	case E820_TYPE_PRAM:		return "Persistent Memory (legacy)";
 	case E820_TYPE_PMEM:		return "Persistent Memory";
 	case E820_TYPE_RESERVED:	return "Reserved";
-	case E820_TYPE_SOFT_RESERVED:	return "Soft Reserved";
+	case E820_TYPE_13:		return "Type 13";
 	default:			return "Unknown E820 type";
 	}
 }
@@ -1090,6 +1090,7 @@ __init static unsigned long e820_type_to_iomem_type(struct e820_entry *entry)
 	case E820_TYPE_PRAM:		/* Fall-through: */
 	case E820_TYPE_PMEM:		/* Fall-through: */
 	case E820_TYPE_RESERVED:	/* Fall-through: */
+	case E820_TYPE_13:		/* Fall-through: */
 	case E820_TYPE_SOFT_RESERVED:	/* Fall-through: */
 	default:			return IORESOURCE_MEM;
 	}
@@ -1102,7 +1103,8 @@ __init static unsigned long e820_type_to_iores_desc(struct e820_entry *entry)
 	case E820_TYPE_NVS:		return IORES_DESC_ACPI_NV_STORAGE;
 	case E820_TYPE_PMEM:		return IORES_DESC_PERSISTENT_MEMORY;
 	case E820_TYPE_PRAM:		return IORES_DESC_PERSISTENT_MEMORY_LEGACY;
-	case E820_TYPE_RESERVED:	return IORES_DESC_RESERVED;
+	case E820_TYPE_RESERVED:	/* Fall-through: */
+	case E820_TYPE_13:		return IORES_DESC_RESERVED;
 	case E820_TYPE_SOFT_RESERVED:	return IORES_DESC_SOFT_RESERVED;
 	case E820_TYPE_RAM:		/* Fall-through: */
 	case E820_TYPE_UNUSABLE:	/* Fall-through: */
@@ -1132,6 +1134,7 @@ __init static bool e820_device_region(enum e820_type type, struct resource *res)
 	 */
 	switch (type) {
 	case E820_TYPE_RESERVED:
+	case E820_TYPE_13:
 	case E820_TYPE_SOFT_RESERVED:
 	case E820_TYPE_PRAM:
 	case E820_TYPE_PMEM:
@@ -1140,6 +1143,10 @@ __init static bool e820_device_region(enum e820_type type, struct resource *res)
 	case E820_TYPE_ACPI:
 	case E820_TYPE_NVS:
 	case E820_TYPE_UNUSABLE:
+	/*
+	 * Unknown E820 types should be treated passively, here we
+	 * don't allow them to be claimed by device drivers:
+	 */
 	default:
 		return false;
 	}
