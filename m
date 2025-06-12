Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427B22AE6D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749707327; cv=none; b=Nk/vA7gQfa04B1PVhQ9f9vLUKBVcrDRNmIQNfb/n0vN6K6ggMgHnixQ/wJC+MuobXxEnZjqofcTEuXwY1jWR3G7+MTZJMJgHZ0iheiCnMwrFVM2nWumDr3b4+98e9sybsZYRemRDiS18oWa4QKFZMGDSLdONEBSZ5cUAY/f9ZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749707327; c=relaxed/simple;
	bh=PqdmBja8h/jtnI5RI3kaCZ9JX/ReVxJjOv00r3wi1YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm6DvWxOKNNykWewJCnDmhYRaIiTtW9B46PJJB6lESQarZjju5qZLGwteR8rh2W0OXdJjjgCmVcD9kns+5BiICeSdHi8DmVVlqRDyCow+Li8EoYJj7YeMopQyuIKm9NluiHfITlBGe9SJNvYlhmYAa+TssRsRGyICRVucmWPQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=olTyEhgw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y7bqoEpl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="olTyEhgw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="y7bqoEpl"
Date: Thu, 12 Jun 2025 07:48:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749707322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=295phvnTuFSsjCeDnZlmZK8h66QjeJ1T36LZwhmRjSs=;
	b=olTyEhgwS/t3rNkPXTYpL2F3CiUjR0QAWA0eK4PoRBErCgNIecxmzOAEZ4a42wnt8+oYDP
	IRc4QT9MPm7b1YSVBlF7F3yP0C+mgKerU7s1ZaqYymWGYT5njMiKcyHp6FQS/sGQdgb6jF
	1rdwFd+NHAZRBNInJKmgLcY64NSLI7TLwrycUyUS+HuPpAUWmO+WQW2Yc7bspbTUb4f1iP
	7ZGzgqJij+F53jCOAH43yKvPmjtSswjW1T6Sf085xdpcmKIYjTYfiRMwE3IGoy2ZLLaYp9
	u4y3+z7isw0DylgZiUKfiYIwOSGnyMhab6E/SHcAZjFdxCsXhdhPtJKDBcj3Zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749707322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=295phvnTuFSsjCeDnZlmZK8h66QjeJ1T36LZwhmRjSs=;
	b=y7bqoEplIrvlHxVMSD4+8ltJzhGmrMmGEI4hc1n9mNmGQvFx8lwhdJSR1MClRSs4xltoFs
	ZYsB7jM7xPy45PBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Message-ID: <20250612074301-ef094934-158c-4fa1-a2ee-92d2f749fe39@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <20250611185727.GC2192624@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611185727.GC2192624@ax162>

On Wed, Jun 11, 2025 at 11:57:27AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 11, 2025 at 11:22:14AM +0200, Thomas Weiﬂschuh wrote:
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
> 
> I ran this through a few different architectures with LLVM=1 and did not
> see anything interesting.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> > ---
> >  lib/vdso/Makefile.include | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> > index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
> > --- a/lib/vdso/Makefile.include
> > +++ b/lib/vdso/Makefile.include
> > @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
> >  #
> >  # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
> >  # dynamic relocations, ignore R_*_NONE.
> > +#
> > +# Also validate that no absolute relocations against global symbols are present
> > +# in the object files.
> >  quiet_cmd_vdso_check = VDSOCHK $@
> 
> I do not see VDSOCHK in the normal build log but I do see the check
> being executed with V=1. That's obviously an outstanding issue but
> figured it was worth mentioning.

This is because nobody actually directly uses the command "vdso_check".
Instead all users use the variable "cmd_vdso_check" to build their own command:

quiet_cmd_vdso_and_check = VDSO    $@
      cmd_vdso_and_check = $(cmd_vdso); $(cmd_vdso_check)

$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
	$(call if_changed,vdso_and_check)

So you will only see "VDSO" in the logs.
Which makes sense as VDSOCHK does not produce any output, so integrating it as
its own command would be iffy.

> >        cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
> >  		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> > +			     rm -f $@; /bin/false); fi && \
> > +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
> > +		       then (echo >&2 "$@: absolute relocations are not supported"; \
> >  			     rm -f $@; /bin/false); fi
> > 
> > -- 
> > 2.49.0
> > 
