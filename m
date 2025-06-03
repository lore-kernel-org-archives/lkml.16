Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57791C3BEB;
	Tue,  3 Jun 2025 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748987544; cv=none; b=UpWEx+Cl1jSwcZRMQfldi8pDK2CjPsQbqcFeZ1RQLv2fdoxbYbfRaNLlV1xrYyET+C3QJPRRyzNjisgPJ54hOOAJ0+e8hcfqWB0GfeQYKZNIVYpgsuN0MIZCFP21YkXfzVvFghwu6nEvUeNf4csG4zGLKHnLhxgOgRtQKo7wbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748987544; c=relaxed/simple;
	bh=Hd230v7UYvXFWhsu9Ll50VumM2+7mBmKgU8gOgz4uMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry3M4tmTdFP/hgW1HzvuZrPF2yfv0u0hDTkZTH2zePr1TkOr9Y9yGs44U4g8DDP7dCSsnF/C0nerDRmVzrneiREajvKVCOre6A/Q+DWoTHOZ5an77wVeOoamZRJnUqX1zO8We/sJ4FHn4mJtK+H2pYbxhTL9KoG6Bi/mdrjBR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKNXXsHZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKNXXsHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1E3C4CEED;
	Tue,  3 Jun 2025 21:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748987544;
	bh=Hd230v7UYvXFWhsu9Ll50VumM2+7mBmKgU8gOgz4uMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKNXXsHZZPss1CqcoHEt1E33Ml7MwCPs9Y6UkucIcgHQ8tgfi8hn8A17nNevgaFBb
	 P/nuRMqz2epHfEypVkuLj+B5Y7H2gtJCyh2+pc73HTSruyOOSDDks6wyPTm8vG+Y9B
	 Cze9mj3gQXchkrWY/gVNrB21yNaEx8LRHvzhmfq0Fff9UX88M3o7BtTbq+UzkMPOIX
	 P0URTvafvziugJMadTz5djFv7hqmoD7L+O6ddzdD+26K7mAt/qWl/BNoIMBRL/o67c
	 OkqkndZPea1do65OnYH4SKZieFCklxPLHdzauER6B6I9a4QY8fYdkoqzzEc5lLQv3C
	 QsV8SVA8P/YkQ==
Date: Tue, 3 Jun 2025 14:52:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Fangrui Song <i@maskray.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
Message-ID: <20250603215218.GA3631276@ax162>
References: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me>

On Mon, Jun 02, 2025 at 08:48:44PM -0700, Fangrui Song wrote:
> .rodata is implicitly included in the PT_DYNAMIC segment due to
> inheriting the segment of the preceding .dynamic section (in both GNU ld
> and LLD).  When the .rodata section's size is not a multiple of 16
> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
> readelf and llvm-readelf's -d option decodes the dynamic section using
> the section.
> 
> This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
> ("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
> placed .rodata directly after .dynamic by removing .eh_frame.
> 
> This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
> specifying the :text output section phdr.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
> Signed-off-by: Fangrui Song <i@maskray.me>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -30,7 +30,7 @@ SECTIONS
>  		*(.data .data.* .gnu.linkonce.d.*)
>  		*(.dynbss)
>  		*(.bss .bss.* .gnu.linkonce.b.*)
> -	}
> +	}						:text
>  
>  	.note		: { *(.note.*) }		:text	:note
>  
> 
> ---
> base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
> change-id: 20250602-riscv-vdso-13efdee34a24
> 
> Best regards,
> -- 
> Fangrui Song <i@maskray.me>
> 
