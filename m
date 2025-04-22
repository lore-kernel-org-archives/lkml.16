Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D221E503C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301608; cv=none; b=Jxgjoi419TmIVb6bvu8T+3VQNXhVvHqpoZ/KveqPlK0wydxe7cSlR18z2NKQVh45Nyy2sfOid0bzDt2TpOnp3UYp4k7elkhj+lF1BhLNe55EDiqIy86Zyp9mAoJPfRIDQaqfEkt0lTx1wYbu9ng9miDNn954AobnEvf8/5u+zR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301608; c=relaxed/simple;
	bh=ERGYLnOT0kxkE5gPavRHLTTzjwfOuigaJAmQMfDVgGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMwqHPt+qOBkzYi0avW2zSYtxtTzXsetg3UPTE1gNtAuMS1NSBUH4Bw2UB9s7Aet8ZxsiiCrWvUzFC80Z0n7QDvA+9QjQnW5vKWb8NgiQsmIPsGE6dCMux7swbywHWQDlFrlqVeSlDzGvwMuhXbVdlLXAtEvYidoGim6E4em+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJqo7Dr2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJqo7Dr2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB82CC4CEE9;
	Tue, 22 Apr 2025 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745301608;
	bh=ERGYLnOT0kxkE5gPavRHLTTzjwfOuigaJAmQMfDVgGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJqo7Dr2/sEhQxGy3gWYh5G/GxawK9Bno5gxj7BV8LlZS5J6jKR3k4slhG/uvzyJo
	 hz0jE/iZ17tn3izgMqnV/8qVoIqX2uy3SR/mRkOvEoUdWdz3vIYmO6jLP7VT8oU/Nm
	 ML3bc3274hj+lFONyxIt15r+HctgcoBZYYCLWXTNoaHfYd1aUpTp7VJaBQkhMthXBB
	 tv/1KPVSk0yOgrWaLSfuaZaLJUpCg4vDu8iKy6l98qagOST0ZyBt3d1/ClTOybjZB+
	 P6NUdZVN4Q+C/b7UVJ1vonwtpdAqfW/us9edXBxVhnTQWPYj45zmpD6DDJiwcibKzg
	 +zSXdH2IZlDPw==
Date: Tue, 22 Apr 2025 09:00:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aAcwYKtGMDv-AoL1@kernel.org>
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

On Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar wrote:
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
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/e820.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 4244b6d53fd0..a8edfa375fbd 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -201,18 +201,32 @@ static void __init e820_print_type(enum e820_type type)
>  
>  static void __init e820__print_table(const char *who)
>  {
> +	u64 range_end_prev = 0;
>  	int i;
>  
>  	for (i = 0; i < e820_table->nr_entries; i++) {
>  		struct e820_entry *entry = e820_table->entries + i;
> +		u64 range_start, range_end;
>  
> -		pr_info("%s: [mem %#018Lx-%#018Lx] ",
> -			who,
> -			entry->addr,
> -			entry->addr + entry->size-1);
> +		range_start = entry->addr;
> +		range_end   = entry->addr + entry->size;
>  
> +		/* Out of order E820 maps should not happen: */
> +		if (range_start < range_end_prev)
> +			pr_info("BUG: out of order E820 entry!\n");

Maybe "BIOS BUG"?

> +
> +		if (range_start > range_end_prev) {
> +			pr_info("%s: [gap %#018Lx-%#018Lx]\n",
> +				who,
> +				range_end_prev,
> +				range_start-1);

range_start - 1 ;-)

> +		}
> +
> +		pr_info("%s: [mem %#018Lx-%#018Lx] ", who, range_start, range_end-1);
>  		e820_print_type(entry->type);
>  		pr_cont("\n");
> +
> +		range_end_prev = range_end;
>  	}
>  }
>  
> -- 
> 2.45.2
> 

-- 
Sincerely yours,
Mike.
