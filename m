Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFDC149C4D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738099; cv=none; b=e8T941JfkDTu6GU9Q3WxRJCXI9OPjce0Mk1dk9f1z+qL0ceBhYXSV0dB+AnvbxgYn/4S8tMyetDNoHsZlEPXS3lP+h7CFCMfbUGOCFFCQfe0JK3+3lKfhy51wmwsFM4/zyQCvkPx6f7Tc513I7orIGguJwedYoD7jb78TixXEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738099; c=relaxed/simple;
	bh=Hsc2T8sTIjfBEYE7rFx+jmDibxndiVANCGaWHaZkmjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czbLNfxIjnEEKnGtjPB3qrSKrr8dAXojiD5c9zaVglB+HWlEt6j7puP3ldM+VoIvaKgz+GHN+vGuChRmV9Rse4Eu4sEznN6vko54NCWDbwxkhW22d5lG+ECwesj19bUbcXxVLOfv/9h+pProMRYyO7nqEOULdm9hxsl4E9iRSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K9H6d31+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w5C638nu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K9H6d31+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w5C638nu"
Date: Thu, 12 Jun 2025 16:21:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749738096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pl4iD19u/tvG4+VMp89MNYtzMFEcmgmm0KnazjaFycE=;
	b=K9H6d31+9MSDUfhsh3uETF2aV+bxvrRnkXITk06U2irnbchGUxFYd6p6cmayprMF+ssuCc
	yjD0GboPXRQA5Ik6Xa7Mfd38YWkeq8gqD6z1Sln6e7zfUFCiAv0afA0XZsWx1DmfL1NITy
	GMw8ao7/9aFcNz8ywe8MURwC6z1rkHhIQg+vvn7fd/+kaCrjfndvn/IE+oismSkuVC579a
	k3nej/cHlRW8VGt/mgWZn/Vc9IUdoVVgYlHKw/riBvRWuJCVVwMtYBe9sHJc7sbULfn0OK
	XmY4OuSWxdJahtgarFLrjV0VlYZBSZgPYL9dG4icV4rHUV27JzJRfTWtp33Xhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749738096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pl4iD19u/tvG4+VMp89MNYtzMFEcmgmm0KnazjaFycE=;
	b=w5C638nukRzf0+OZcZmeo4QyuuSXTL2DL3gcUcZqmjrdwp0B4QgyFM4FxVoyn5cjvZrHuh
	Aguhg4aLMAgexLCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>

Hi Alexandre,

On Thu, Jun 12, 2025 at 10:31:20AM +0200, Alexandre Ghiti wrote:
> On 6/11/25 11:22, Thomas Weiﬂschuh wrote:
> > All vDSO code needs to be completely position independent.
> > Symbol references are marked as hidden so the compiler emits
> > PC-relative relocations. However there are cases where the compiler may
> > still emit absolute relocations, as they are valid in regular PIC DSO code.
> > These would be resolved by the linker and will break at runtime.
> > This has been observed on arm64 under some circumstances, see
> > commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")
> > 
> > Introduce a build-time check for absolute relocations.
> > The check is done on the object files as the relocations will not exist
> > anymore in the final DSO. As there is no extension point for the
> > compilation of each object file, perform the validation in vdso_check.
> > 
> > Debug information can contain legal absolute relocations and readelf can
> > not print relocations from the .text section only. Make use of the fact
> > that all global vDSO symbols follow the naming pattern "vdso_u_".
> > 
> > Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >   lib/vdso/Makefile.include | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> > index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
> > --- a/lib/vdso/Makefile.include
> > +++ b/lib/vdso/Makefile.include
> > @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
> >   #
> >   # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
> >   # dynamic relocations, ignore R_*_NONE.
> > +#
> > +# Also validate that no absolute relocations against global symbols are present
> > +# in the object files.
> >   quiet_cmd_vdso_check = VDSOCHK $@
> >         cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
> >   		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> > +			     rm -f $@; /bin/false); fi && \
> > +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
> 
> 
> This only works for arm64 relocations right? I can't find any *ABS*
> relocations in riscv elf abi
> (https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).

Indeed you are right.

We could introduce per-architecture configuration. Essentially reverting parts
of commit aff69273af61 ("vdso: Improve cmd_vdso_check to check all dynamic relocations").
The final logic for the intermediary objects still needs to be more complicated
than for the final .so as those contain relocations in the debug information.

Or we could add a C hostprog for validation.
That would be much more flexible than the inline shell command.
It would then also be easier to use an allow-list than the brittle deny-list.

Or we don't do anything, relying on the selftests to detect miscompilations.

I'll run this by tglx. If somebody else has any opinions, I'm all ears.

> > +		       then (echo >&2 "$@: absolute relocations are not supported"; \
> >   			     rm -f $@; /bin/false); fi
> > 
