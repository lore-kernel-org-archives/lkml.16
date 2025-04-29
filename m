Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A025D913
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916624; cv=none; b=jeF98dQwLdMpoQRwHnH42aQRoQqUnorGrBHUeWXDpAy1lD5Qxhib7soR+rV+osnkSrt4GDWC37bMn423KGV15tVP6+Z1hoUkqoB8sA1Mr+3dNQehXnqD9GagywbwtobVWUO1/CYFujRuLiczXcISyLiGF0qdjxNYLOX7WibpwyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916624; c=relaxed/simple;
	bh=Lpy2B4NqYDw/ucAsX2vRT+Z6nz19QH1ATDxshtzczD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlZ6mUz1Q48wLfiHTeRmIMEGSEp9VhBIY9+WF8WaULmxaFO1Nrk/7QXEiD2pBA5yzYOcnAo68sslmKI7zT2uxMa1uN8lCUtZfQDWWr/nLj4pPJmx8rgWXcLom2wRd4HrUstZXAHT1U3XotMaZwgoouko9G5Zc9/PfdfOj9DUmhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QM2eqgG/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QM2eqgG/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LUvSMhDgoKK5D0Zv51YlRFJSyUwpsj68YgOYaXfZvaw=; b=QM2eqgG/djPA2tqRrAx0fnFRKb
	jChSQtpHyc5Sb687GUXh+NHTgzptTOl9Yn5zJ34IW7fv8nMSdpNrLQ3EhvYlbbKw6mWOf0YD/gySn
	HrwKuJYaRSxGijYlW3MdkWp0WXm2SwX2D2+t8gMKwLQOV1+puY2VGsCyrwlM5PRKa3oQT3MCzW/lw
	FJvBTde/sBpAwgMxozfdJ+bCJ53Kfi188e+cQtQQe9zgPZm7CY+zELO28lLQTRlPpl9H7p7wzcJjX
	kipIPFyY2ifrMGmfoc27G6XZNE/73B6oHPNaOLukSiL03SRpLNzZA3RlWM0tYEyCRxWH8IE3fIL6N
	+mqLE96A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9gfG-0000000DEG3-0bPX;
	Tue, 29 Apr 2025 08:50:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 56A2930057C; Tue, 29 Apr 2025 10:50:05 +0200 (CEST)
Date: Tue, 29 Apr 2025 10:50:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 2/2] x86: Stop decoding i64 instructions in x86-64 mode
 at opcode
Message-ID: <20250429085005.GE4198@noisy.programming.kicks-ass.net>
References: <174580488057.388420.1338751162448700082.stgit@devnote2>
 <174580490000.388420.5225447607417115496.stgit@devnote2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174580490000.388420.5225447607417115496.stgit@devnote2>

On Mon, Apr 28, 2025 at 10:48:20AM +0900, Masami Hiramatsu (Google) wrote:
> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> In commit 2e044911be75 ("x86/traps: Decode 0xEA instructions as #UD")
> FineIBT starts using 0xEA as an invalid instruction like UD2. But
> insn decoder always returns the length of "0xea" instruction is 7
> because it does not check (i64) superscript.
> The x86 instruction decoder should also decode 0xEA on x86-64 as
> one-byte invalid instruction by decoding "(i64)" superscript tag.
> 
> This stops decoding instruction which has (i64) but not have (o64)
> superscript in 64bit mode at opcode and skip other fields.
> 
> With this change, insn_decoder_test says 0xea is 1 byte length if
> x86-64 (-y option means 64bit).
> -----
>  > printf "0:\tea\t\n" | insn_decoder_test -y -v
>  insn_decoder_test: success: Decoded and checked 1 instructions
> -----

Notably matching objdump's decode behaviour in this case.

Thanks!

Reported-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> 
> Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> ---
>  arch/x86/include/asm/inat.h                |    6 ++++++
>  arch/x86/lib/insn.c                        |    7 ++++++-
>  arch/x86/lib/x86-opcode-map.txt            |    6 +++---
>  arch/x86/tools/gen-insn-attr-x86.awk       |    7 +++++++
>  tools/arch/x86/include/asm/inat.h          |    6 ++++++
>  tools/arch/x86/lib/insn.c                  |    7 ++++++-
>  tools/arch/x86/lib/x86-opcode-map.txt      |    6 +++---
>  tools/arch/x86/tools/gen-insn-attr-x86.awk |    7 +++++++
>  8 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/inat.h b/arch/x86/include/asm/inat.h
> index 53e4015242b4..97f341777db5 100644
> --- a/arch/x86/include/asm/inat.h
> +++ b/arch/x86/include/asm/inat.h
> @@ -82,6 +82,7 @@
>  #define INAT_NO_REX2	(1 << (INAT_FLAG_OFFS + 8))
>  #define INAT_REX2_VARIANT	(1 << (INAT_FLAG_OFFS + 9))
>  #define INAT_EVEX_SCALABLE	(1 << (INAT_FLAG_OFFS + 10))
> +#define INAT_INV64	(1 << (INAT_FLAG_OFFS + 11))
>  /* Attribute making macros for attribute tables */
>  #define INAT_MAKE_PREFIX(pfx)	(pfx << INAT_PFX_OFFS)
>  #define INAT_MAKE_ESCAPE(esc)	(esc << INAT_ESC_OFFS)
> @@ -242,4 +243,9 @@ static inline int inat_evex_scalable(insn_attr_t attr)
>  {
>  	return attr & INAT_EVEX_SCALABLE;
>  }
> +
> +static inline int inat_is_invalid64(insn_attr_t attr)
> +{
> +	return attr & INAT_INV64;
> +}
>  #endif
> diff --git a/arch/x86/lib/insn.c b/arch/x86/lib/insn.c
> index 6ffb931b9fb1..149a57e334ab 100644
> --- a/arch/x86/lib/insn.c
> +++ b/arch/x86/lib/insn.c
> @@ -324,6 +324,11 @@ int insn_get_opcode(struct insn *insn)
>  	}
>  
>  	insn->attr = inat_get_opcode_attribute(op);
> +	if (insn->x86_64 && inat_is_invalid64(insn->attr)) {
> +		/* This instruction is invalid, like UD2. Stop decoding. */
> +		insn->attr &= INAT_INV64;
> +	}
> +
>  	while (inat_is_escape(insn->attr)) {
>  		/* Get escaped opcode */
>  		op = get_next(insn_byte_t, insn);
> @@ -337,6 +342,7 @@ int insn_get_opcode(struct insn *insn)
>  		insn->attr = 0;
>  		return -EINVAL;
>  	}
> +
>  end:
>  	opcode->got = 1;
>  	return 0;
> @@ -658,7 +664,6 @@ int insn_get_immediate(struct insn *insn)
>  	}
>  
>  	if (!inat_has_immediate(insn->attr))
> -		/* no immediates */
>  		goto done;
>  
>  	switch (inat_immediate_size(insn->attr)) {
> diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
> index 5e2fa3f7128e..de0be0462190 100644
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -147,7 +147,7 @@ AVXcode:
>  # 0x60 - 0x6f
>  60: PUSHA/PUSHAD (i64)
>  61: POPA/POPAD (i64)
> -62: BOUND Gv,Ma (i64) | EVEX (Prefix)
> +62: BOUND Gv,Ma (i64) | EVEX (Prefix),(o64)
>  63: ARPL Ew,Gw (i64) | MOVSXD Gv,Ev (o64)
>  64: SEG=FS (Prefix)
>  65: SEG=GS (Prefix)
> @@ -253,8 +253,8 @@ c0: Grp2 Eb,Ib (1A)
>  c1: Grp2 Ev,Ib (1A)
>  c2: RETN Iw (f64)
>  c3: RETN
> -c4: LES Gz,Mp (i64) | VEX+2byte (Prefix)
> -c5: LDS Gz,Mp (i64) | VEX+1byte (Prefix)
> +c4: LES Gz,Mp (i64) | VEX+2byte (Prefix),(o64)
> +c5: LDS Gz,Mp (i64) | VEX+1byte (Prefix),(o64)
>  c6: Grp11A Eb,Ib (1A)
>  c7: Grp11B Ev,Iz (1A)
>  c8: ENTER Iw,Ib
> diff --git a/arch/x86/tools/gen-insn-attr-x86.awk b/arch/x86/tools/gen-insn-attr-x86.awk
> index 5770c8097f32..29e939893082 100644
> --- a/arch/x86/tools/gen-insn-attr-x86.awk
> +++ b/arch/x86/tools/gen-insn-attr-x86.awk
> @@ -64,6 +64,8 @@ BEGIN {
>  
>  	modrm_expr = "^([CDEGMNPQRSUVW/][a-z]+|NTA|T[012])"
>  	force64_expr = "\\([df]64\\)"
> +	invalid64_expr = "\\(i64\\)"
> +	only64_expr = "\\(o64\\)"
>  	rex_expr = "^((REX(\\.[XRWB]+)+)|(REX$))"
>  	rex2_expr = "\\(REX2\\)"
>  	no_rex2_expr = "\\(!REX2\\)"
> @@ -319,6 +321,11 @@ function convert_operands(count,opnd,       i,j,imm,mod)
>  		if (match(ext, force64_expr))
>  			flags = add_flags(flags, "INAT_FORCE64")
>  
> +		# check invalid in 64bit (and no only64)
> +		if (match(ext, invalid64_expr) &&
> +		    !match($0, only64_expr))
> +			flags = add_flags(flags, "INAT_INV64")
> +
>  		# check REX2 not allowed
>  		if (match(ext, no_rex2_expr))
>  			flags = add_flags(flags, "INAT_NO_REX2")
> diff --git a/tools/arch/x86/include/asm/inat.h b/tools/arch/x86/include/asm/inat.h
> index 253690eb3c26..183aa662b165 100644
> --- a/tools/arch/x86/include/asm/inat.h
> +++ b/tools/arch/x86/include/asm/inat.h
> @@ -82,6 +82,7 @@
>  #define INAT_NO_REX2	(1 << (INAT_FLAG_OFFS + 8))
>  #define INAT_REX2_VARIANT	(1 << (INAT_FLAG_OFFS + 9))
>  #define INAT_EVEX_SCALABLE	(1 << (INAT_FLAG_OFFS + 10))
> +#define INAT_INV64	(1 << (INAT_FLAG_OFFS + 11))
>  /* Attribute making macros for attribute tables */
>  #define INAT_MAKE_PREFIX(pfx)	(pfx << INAT_PFX_OFFS)
>  #define INAT_MAKE_ESCAPE(esc)	(esc << INAT_ESC_OFFS)
> @@ -242,4 +243,9 @@ static inline int inat_evex_scalable(insn_attr_t attr)
>  {
>  	return attr & INAT_EVEX_SCALABLE;
>  }
> +
> +static inline int inat_is_invalid64(insn_attr_t attr)
> +{
> +	return attr & INAT_INV64;
> +}
>  #endif
> diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
> index e91d4c4e1c16..bce69c6bfa69 100644
> --- a/tools/arch/x86/lib/insn.c
> +++ b/tools/arch/x86/lib/insn.c
> @@ -324,6 +324,11 @@ int insn_get_opcode(struct insn *insn)
>  	}
>  
>  	insn->attr = inat_get_opcode_attribute(op);
> +	if (insn->x86_64 && inat_is_invalid64(insn->attr)) {
> +		/* This instruction is invalid, like UD2. Stop decoding. */
> +		insn->attr &= INAT_INV64;
> +	}
> +
>  	while (inat_is_escape(insn->attr)) {
>  		/* Get escaped opcode */
>  		op = get_next(insn_byte_t, insn);
> @@ -337,6 +342,7 @@ int insn_get_opcode(struct insn *insn)
>  		insn->attr = 0;
>  		return -EINVAL;
>  	}
> +
>  end:
>  	opcode->got = 1;
>  	return 0;
> @@ -658,7 +664,6 @@ int insn_get_immediate(struct insn *insn)
>  	}
>  
>  	if (!inat_has_immediate(insn->attr))
> -		/* no immediates */
>  		goto done;
>  
>  	switch (inat_immediate_size(insn->attr)) {
> diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
> index 5e2fa3f7128e..de0be0462190 100644
> --- a/tools/arch/x86/lib/x86-opcode-map.txt
> +++ b/tools/arch/x86/lib/x86-opcode-map.txt
> @@ -147,7 +147,7 @@ AVXcode:
>  # 0x60 - 0x6f
>  60: PUSHA/PUSHAD (i64)
>  61: POPA/POPAD (i64)
> -62: BOUND Gv,Ma (i64) | EVEX (Prefix)
> +62: BOUND Gv,Ma (i64) | EVEX (Prefix),(o64)
>  63: ARPL Ew,Gw (i64) | MOVSXD Gv,Ev (o64)
>  64: SEG=FS (Prefix)
>  65: SEG=GS (Prefix)
> @@ -253,8 +253,8 @@ c0: Grp2 Eb,Ib (1A)
>  c1: Grp2 Ev,Ib (1A)
>  c2: RETN Iw (f64)
>  c3: RETN
> -c4: LES Gz,Mp (i64) | VEX+2byte (Prefix)
> -c5: LDS Gz,Mp (i64) | VEX+1byte (Prefix)
> +c4: LES Gz,Mp (i64) | VEX+2byte (Prefix),(o64)
> +c5: LDS Gz,Mp (i64) | VEX+1byte (Prefix),(o64)
>  c6: Grp11A Eb,Ib (1A)
>  c7: Grp11B Ev,Iz (1A)
>  c8: ENTER Iw,Ib
> diff --git a/tools/arch/x86/tools/gen-insn-attr-x86.awk b/tools/arch/x86/tools/gen-insn-attr-x86.awk
> index 5770c8097f32..29e939893082 100644
> --- a/tools/arch/x86/tools/gen-insn-attr-x86.awk
> +++ b/tools/arch/x86/tools/gen-insn-attr-x86.awk
> @@ -64,6 +64,8 @@ BEGIN {
>  
>  	modrm_expr = "^([CDEGMNPQRSUVW/][a-z]+|NTA|T[012])"
>  	force64_expr = "\\([df]64\\)"
> +	invalid64_expr = "\\(i64\\)"
> +	only64_expr = "\\(o64\\)"
>  	rex_expr = "^((REX(\\.[XRWB]+)+)|(REX$))"
>  	rex2_expr = "\\(REX2\\)"
>  	no_rex2_expr = "\\(!REX2\\)"
> @@ -319,6 +321,11 @@ function convert_operands(count,opnd,       i,j,imm,mod)
>  		if (match(ext, force64_expr))
>  			flags = add_flags(flags, "INAT_FORCE64")
>  
> +		# check invalid in 64bit (and no only64)
> +		if (match(ext, invalid64_expr) &&
> +		    !match($0, only64_expr))
> +			flags = add_flags(flags, "INAT_INV64")
> +
>  		# check REX2 not allowed
>  		if (match(ext, no_rex2_expr))
>  			flags = add_flags(flags, "INAT_NO_REX2")
> 
