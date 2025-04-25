Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB41F6694
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610985; cv=none; b=SJeaO1RYhQ91TbieFo34x39jqWuUajNsrlc3OfyRvANdKxmTshrSvLptPYDRORNnq4VbHgTIpNCBHKliVipZreEV6sPx9jCuTV041LARpdgVYuDfeEEtjS8TaDTQQtD9RrgOlCScflUSwcaIsrRgBK/5w1DjRG/a6EJAUDumS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610985; c=relaxed/simple;
	bh=3BFpzPNhGoEvlgWJA66CMPCNVCIyPcxU5w0nVetTTVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erAjwSTPCpaCTrdthZ+S0VphCXs/jjigvH3cqp5BGXcXY8SfmSB0r4VmKcZbB6RCfWy7qdQZKFmSg5afpUozvmcp8E/BZUVNJ3KSN0G3k4GQyZD0cD8b7H1NExsWsVTrnir5kEdeox453VEkt03ynBIVrr51KbfR/mB6bNLm50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRS2/ztl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRS2/ztl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4821BC4CEE9;
	Fri, 25 Apr 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745610984;
	bh=3BFpzPNhGoEvlgWJA66CMPCNVCIyPcxU5w0nVetTTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRS2/ztlUG0AIAC3y4OPWTTjG1HrkNkqEFroTJSVrgpw6FOWNjoTWr2niFagTwrIA
	 Bg5a4Po8oPmkMpKJLrUTJ3mh8giuvpQgLeIx4a79TyiDPUdlrXzPXcjXPS082UiXgD
	 SokBmtDgYkmcmjB3NZ8tiYb7v6HxqVti0fqViOAPKjMjt3KtE3fm5TqpQ8VN4XlQUp
	 jY1VLPu27QHpLdMpcfPSKacUu6TlHQzzGLDy6r+KPwRDC7NGmrJDI+Tzd6ojVkilyz
	 0PApMN5h2jRlwiDZAdeE7iVkymsJcThsPRNFBcionN9Ne06KpZgHtKCoFnetmsxMnq
	 3kaYGOa25YCsw==
Date: Fri, 25 Apr 2025 12:56:21 -0700
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <202504251158.D3D342410@keescook>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
 <aAvWchSUlnAfg42x@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAvWchSUlnAfg42x@arm.com>

On Fri, Apr 25, 2025 at 07:37:38PM +0100, Catalin Marinas wrote:
> On Fri, Apr 25, 2025 at 01:41:31PM +0100, Ryan Roberts wrote:
> > ldconfig is a statically linked, PIE executable. The kernel treats this as an 
> > interpreter and therefore does not map it into low memory but instead maps it 
> > into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
> > vvar/vdso gets mapped and fills the hole right at the top that is left due to 
> > ldconfig's alignment requirements. Before the above change, there were 2 pages 
> > free between the end of the data segment and vvar; this was enough for ldconfig 
> > to get it's required memory with brk(). But after the change there is no space:
> > 
> > Before:
> > fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> > fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> > fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> > fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> > 
> > After:
> > fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> > fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> > fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> > fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> 
> It does look like we've just been lucky so far. An ELF file requiring a
> slightly larger brk (by two pages), it could fail. FWIW, briefly after
> commit 9630f0d60fec ("fs/binfmt_elf: use PT_LOAD p_align values for
> static PIE"), we got:
> 
>           Start Addr           End Addr       Size     Offset  Perms  objfile
>       0xaaaaaaaa0000     0xaaaaaab5d000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
>       0xaaaaaab6b000     0xaaaaaab73000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
>       0xaaaaaab73000     0xaaaaaab78000     0x5000        0x0  rw-p   [heap]
>       0xfffff7ffd000     0xfffff7fff000     0x2000        0x0  r--p   [vvar]
>       0xfffff7fff000     0xfffff8000000     0x1000        0x0  r-xp   [vdso]
>       0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]
> 
> This looks like a better layout to me when you load an ET_DYN file
> without !PT_INTERP.

The trouble is that !PT_INTERP must be loaded out of the way of the
binary it may load, so it cannot be loaded low.

> When the commit was reverted by aeb7923733d1 ("revert "fs/binfmt_elf:
> use PT_LOAD p_align values for static PIE""), we went back to:
> 
>           Start Addr           End Addr       Size     Offset  Perms  objfile
>       0xfffff7f28000     0xfffff7fe5000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
>       0xfffff7ff0000     0xfffff7ff2000     0x2000        0x0  r--p   [vvar]
>       0xfffff7ff2000     0xfffff7ff3000     0x1000        0x0  r-xp   [vdso]
>       0xfffff7ff3000     0xfffff7ffb000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
>       0xfffff7ffb000     0xfffff8000000     0x5000        0x0  rw-p   [heap]
>       0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

The revert was because, among various additional problems, that this low
load would collide with things. The static PIE alignment was finally
fixed with commit 3545deff0ec7 ("binfmt_elf: Honor PT_LOAD alignment
for static PIE")

The ultimate brk location is determined near the end of load_elf_binary()
(see the code surrounding the comment "Otherwise leave a gap").

> With 6.15-rc3 my layout looks like Ryan's but in 5.18 above, the vdso is
> small enough and it's squeezed between the two ldconfig sections.

I think there are two surprises:

- For loaders (ET_DYN without PT_INTERP, which is also "static PIE") the
  brk location is being moved to ELF_ET_DYN_BASE ... *but only when ASLR
  is enabled*. I think exclusion is the primary bug, with its origin
  in commit bbdc6076d2e5 ("binfmt_elf: move brk out of mmap when doing
  direct loader exec"). I failed to explain my rationale at the time
  to have it only happen under ASLR, but I think I was trying to be
  conservative and not change things too much.

- vdso can get loaded into _gaps_ in the ELF. I think this is asking for
  trouble, but technically should be okay since neither can grow. But I
  never like seeing immediately adjacent unrelated mappings, since we
  always end up with bugs (see things like commit 2a5eb9995528
  ("binfmt_elf: Leave a gap between .bss and brk").

For fixing the former, the below change might work (totally untested yet,
I just wanted to reply with my thoughts as I start testing this). Pardon
the goofy code style, I wanted a minimal diff here:

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 7e2afe3220f7..9290a29ede28 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1284,7 +1284,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	mm->end_data = end_data;
 	mm->start_stack = bprm->p;
 
-	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
+	{
 		/*
 		 * For architectures with ELF randomization, when executing
 		 * a loader directly (i.e. no interpreter listed in ELF
@@ -1299,7 +1299,9 @@ static int load_elf_binary(struct linux_binprm *bprm)
 			/* Otherwise leave a gap between .bss and brk. */
 			mm->brk = mm->start_brk = mm->brk + PAGE_SIZE;
 		}
+	}
 
+	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
 		mm->brk = mm->start_brk = arch_randomize_brk(mm);
 #ifdef compat_brk_randomized
 		current->brk_randomized = 1;

> > Note that this issue only occurs with ASLR disabled. When ASLR is enabled, the 
> > brk region is setup in the low memory region that would normally be used by 
> > primary executable.

Out of curiosity, why are you running without ASLR?

Thanks for the report! I'll continue testing the above fix. Just for
making sure I am able to exactly reproduce your issue, this is on
a regular arm64 install of Ubuntu 22.04?

-Kees

-- 
Kees Cook
