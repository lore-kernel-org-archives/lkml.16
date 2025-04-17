Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD6523BCE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888902; cv=none; b=H+EEjNv06tUNtDkuJyPLEZ1Vc8U8qkN0cd0YQV0sfCEL2E9gKYNj2JUeIb59JkD+Jx9RZ0bu172et9Kiz7Jn9GpnSbRpbKFNhNNTiaw4ZpYhiIUIdYD6cBNXmR+vs/hsY8EehuGapyKhbbM1R+pEqXc763suYr4nOsql0Qa5dDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888902; c=relaxed/simple;
	bh=M6WbNWFK+7yxpok3/0G3FmMZywX0+R9ItoATORfrhdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYmmwMIeI/Gh/6g0ghyrThLTVngR4ZY3F+SeNu07TadIXpYuouBKbBKe3vbNSrvFsMIK72XHWpABeJlA91PcFUgAMty36D7Xi1tQcAzWjXVDLmL3oG6Vll5mAAhRCsROHN8ce6jnkI2EpL6NeU2hOqdR1EQ04jZcs0kTL41u5Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpbD37zE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpbD37zE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4ACC4CEE4;
	Thu, 17 Apr 2025 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744888902;
	bh=M6WbNWFK+7yxpok3/0G3FmMZywX0+R9ItoATORfrhdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpbD37zEa31s+D7I39GXd7pIxkqfnW+V85R3hjezEj0uxud9bU04S6kKST1Mq+8qM
	 zgsp/hf717x2+3gXV9g+wzwjepjBJgsXzHnqET+e+deQTBbvq0s8eLDk++Js8wBmD2
	 uOCa9tA7nmWdHPeYau5OVPvbO7+nZFc6T5BYu7O174Tsch7mgpWXw0z/+pgNJg2rCW
	 /L0K9v8H1YPSL/yDZhMUgzULwosOoT0rs6yDmBWMDav+eFFq3ibCcVD3L+wE8G7Cfn
	 kL1rnmfVy2HzSxD8Z6iT0iO/SmONElihM7tulDEkOWdG7EwshvtTZQLmFQayO9JEGk
	 oiyumqiTxOwIA==
Date: Thu, 17 Apr 2025 13:21:38 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: e820: Undefined type not treated as AddressRangeReserved
Message-ID: <aADkQoJE62OdWMhu@gmail.com>
References: <074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074c2637-1b65-428e-b3e2-24384780e936@molgen.mpg.de>


* Paul Menzel <pmenzel@molgen.mpg.de> wrote:

> Dear Linux folks,
> 
> 
> Some firmware, like coreboot with older FILO payload [1] or GRUB as payload
> [2], mark memory regions(?) with type E820 type 13 (Undefined), that is
> reserved for future use. Other payloads like SeaBIOS mark it as 2
> (AddressRangeReserved). As a result, userspace is not able to access this

Just curious: why do they mark it type 13? What semantics do they 
expect? It's not just some random value I suspect.

> region, which can be worked around by booting with `iomem=relaxed`, or
> probably with the `memmap` parameter.
> 
>     $ grep -A1 3ff7b000 /proc/iomem # FILO
>     3ff7b000-3fffffff : Unknown E820 type
>       3ffa1000-3ffa8fff : BOOT0000:00
> 
>     $ grep -A1 3ff7b000 /proc/iomem # SeaBIOS, that marks it as reserved
>     3ff7b000-3fffffff : Reserved
>       3ffa1000-3ffa8fff : BOOT0000:00
> 
> Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
> 
> > Reserved for future use. OSPM must treat any range of this type as if
> > the type returned was AddressRangeReserved.
> 
> Could and should Linux be adapted to follow the specification, and fix some
> real-world use cases? I looked at `arch/x86/include/asm/e820/types.h` and
> `arch/x86/kernel/e820.c`, but failed to find the place where to implement
> this, and how to name the macros for the undefined regions. 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://review.coreboot.org/c/filo/+/51120
> [2]: https://ticket.coreboot.org/issues/590
> [3]: https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf

I suppose we could make unknown types fall back to 2 
(E820_TYPE_RESERVED).

> diff --git a/arch/x86/include/asm/e820/types.h
> b/arch/x86/include/asm/e820/types.h
> index 80c4a7266629..1b341914d438 100644
> --- a/arch/x86/include/asm/e820/types.h
> +++ b/arch/x86/include/asm/e820/types.h
> @@ -14,6 +14,10 @@ enum e820_type {
>         E820_TYPE_NVS           = 4,
>         E820_TYPE_UNUSABLE      = 5,
>         E820_TYPE_PMEM          = 7,
> +       E820_TYPE_UNDEFINED_8   = 8, /* reserved for future use */
> +       E820_TYPE_UNDEFINED_9   = 9, /* reserved for future use */
> +       E820_TYPE_UNDEFINED_10  = 10, /* reserved for future use */
> +       E820_TYPE_UNDEFINED_11  = 11, /* reserved for future use */
> 
>         /*
>          * This is a non-standardized way to represent ADR or
> @@ -28,6 +32,8 @@ enum e820_type {
>          */
>         E820_TYPE_PRAM          = 12,
> 
> +       E820_TYPE_UNDEFINED_13  = 13, /* reserved for future use */
> +
>         /*
>          * Special-purpose memory is indicated to the system via the
>          * EFI_MEMORY_SP attribute. Define an e820 translation of this

That patch is, as you suggest, not enough to implement it:

New E820 entries are generally passed to the kernel by bootloaders via 
boot_params.e820_table, processed in e820__memory_setup_default(), plus 
for larger systems, e820__memory_setup_extended() will also process 
additional E820 entries via setup_data's SETUP_E820_EXT node, in 
e820__memory_setup_extended().

Internally both the regular and the extended E820 tables from the 
bootloader are processed via __append_e820_table(). Which function is 
where I suspect you'd want to add any quirks modifying the type.

I'm not against adding such quirks, especially given that the lack of 
these quirks appear to result in unbootable systems on bootloaders that 
use them, as long as a pr_info() warning is issued about the type 
override - ie. the change in behavior is announced and above board.

I suppose the reason for the boot failures is e820.c:do_mark_busy():

        /*
         * Treat persistent memory and other special memory ranges like
         * device memory, i.e. reserve it for exclusive use of a driver
         */
        switch (type) {
        case E820_TYPE_RESERVED:
        case E820_TYPE_SOFT_RESERVED:
        case E820_TYPE_PRAM:
        case E820_TYPE_PMEM:
                return false;
        case E820_TYPE_RAM:
        case E820_TYPE_ACPI:
        case E820_TYPE_NVS:
        case E820_TYPE_UNUSABLE:
        default:
                return true;
        }

Note how only a strict subset of E820 regions will return 'false', and 
allow the region to be marked non-busy, which frees them up to be 
claimed by drivers.

That is also what iomem=relaxed does in essence:

                /*
                 * A resource is exclusive if IORESOURCE_EXCLUSIVE is set
                 * or CONFIG_IO_STRICT_DEVMEM is enabled and the
                 * resource is busy.
                 */
                if (!strict_iomem_checks || !(p->flags & IORESOURCE_BUSY))
                        continue;

It will ignore busy resources.

It would obviously be safer to register type 13 regions as type 2, and 
allow them to be claimed by drivers - instead of weakening sanity 
checks all around via iomem=relaxed.

Thanks,

	Ingo
