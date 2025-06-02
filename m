Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F454A0F;
	Mon,  2 Jun 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748864634; cv=none; b=VaSfN7yafrIkWeA4Qk41nLFnNtKAf+FuaMiyW065oFjBshSMe2XTW5gUVqnyeudwe0Ahbr25MG6ydDdWoWSpokZaVrQxCsrfLM553z7Ib+QRB3OpZjbf6SjNoCHEnKxi+b3yfWyAaEq6DzpFBI/a0mzxosE1stblopIkmJm/wAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748864634; c=relaxed/simple;
	bh=l3/2Fh7F1pQtWmjuYMcKP5otHEjexAq08ZOrM1rZRDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSqJk5iSO529xvbnlu+WXYYmdorrKZSO8n6KK6F9VwjcuYIV/A5ei5stkDEtzsIRZYvyJFag+y48OI3dHS5fVsNiJLVnNrilSbqSZgZ6npPAjdgaB80UMgsNhzfoIIQeE4MPjdx8BYNbh/LGKmhHZGiuzBoVDWygJloMflhanrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHpjELVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHpjELVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5A7C4CEEB;
	Mon,  2 Jun 2025 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748864634;
	bh=l3/2Fh7F1pQtWmjuYMcKP5otHEjexAq08ZOrM1rZRDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHpjELVjDRGvZAylEFZHufGSGD8PLh+PVGUgY6O+ym3daYnOZFHC3gglK0aRPjjaP
	 cxJr3U2IAgtyQgOru8qQcjCh+nx6GRGegnpO38Ujg9VF8gyDVbBND8I1oQn7XajsqP
	 +zkjAeUiRWkFZCkYGTNtIy2ADFd2mVs7ncT4XcQujMuDw+c+RiYQ8G5qjFrgXaqW0Q
	 g9/YB3gbQFz9bibWoJTO/TrZT6ykxYGG/uz5b0Idbj9wSRh5lWiuGeyQTb4ysLlpdP
	 HJHnxuvuGWkrX2jKsfFONN2rWHyUZg1GRqCzsIrLAyMC3TaIRR6N0fawRmq+6go3Iu
	 PHTMIMoKo4q4A==
Date: Mon, 2 Jun 2025 12:43:49 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	nathan@kernel.org
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
Message-ID: <20250602114348.GA1227@willie-the-truck>
References: <20250529073507.2984959-2-ardb+git@google.com>
 <20250530133811.GB30622@willie-the-truck>
 <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
 <20250602100932.GA919@willie-the-truck>
 <CAMj1kXEKMyR0PoQnY2zvQ=BVPJfEb4EO9HCUWKURUW+_Dj5h4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEKMyR0PoQnY2zvQ=BVPJfEb4EO9HCUWKURUW+_Dj5h4w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jun 02, 2025 at 12:18:33PM +0200, Ard Biesheuvel wrote:
> On Mon, 2 Jun 2025 at 12:09, Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, May 30, 2025 at 04:23:16PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 30 May 2025 at 15:38, Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > >
> > > > > It turns out that the way LLD handles ASSERT()s in the linker script can
> > > > > result in spurious failures, so disable them for the newly introduced
> > > > > BSS symbol export checks.
> > > > >
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> > > > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > > > ---
> > > > >  arch/arm64/kernel/image-vars.h | 6 ++++++
> > > > >  1 file changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > > > > index c5266430284b..86f088a16147 100644
> > > > > --- a/arch/arm64/kernel/image-vars.h
> > > > > +++ b/arch/arm64/kernel/image-vars.h
> > > > > @@ -10,6 +10,10 @@
> > > > >  #error This file should only be included in vmlinux.lds.S
> > > > >  #endif
> > > > >
> > > > > +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> > > > > +#define ASSERT(...)
> > > > > +#endif
> > > > > +
> > > > >  #define PI_EXPORT_SYM(sym)           \
> > > > >       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > > > >  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> > > > > @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> > > > >  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
> > > > >  #endif
> > > > >
> > > > > +#undef ASSERT
> > > >
> > > > What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
> > > > affected by the bug, for some reason?
> > > >
> > > > Also, even with this patch applied, I still see a link failure:
> > > >
> > > >   | ld.lld: error: assignment to symbol __init_end does not converge
> > > >
> > > > with the .config you sent me off-list.
> > > >
> > >
> > > That is a different error that has been lurking for a while now; Arnd
> > > occasionally hits it but I haven't seen any other reports of it. AIUI,
> > > the issue is that INIT_IDMAP_DIR_PAGES and INIT_DIR_SIZE are defined
> > > in terms of (_end - KIMAGE_VADDR), resulting in a circular dependency.
> >
> > Ok, I'll ignore that one for the moment, then...
> >
> > > The config in the kernel test robot's report [0] appears to build fine
> > > with this patch applied.
> > >
> > >
> > > [0] https://lore.kernel.org/all/202505261019.OUlitN6m-lkp@intel.com/T/#u
> >
> > ... but I'm still not sure why the ASSERT()s in vmlinux.lds.S are not
> > affected. Is it just that we've not hit a .config which breaks with
> > those yet, or is it something more fundamental than that?
> 
> The former, as far as I can tell. The BSS patch just adds a fair
> amount of ASSERT()s so the attack surface has become larger. And
> perhaps those checks are more susceptible due to the fact that they
> compare symbols living in different sections? But that is just
> conjecture.
> 
> > I'd have
> > thought we'd need to so something like below (on top of your patch) to
> > fix this issue properly.
> >
> 
> Yes, it is the more thorough fix, but we'd lose coverage for those
> ASSERT()s which are arguably more important than the ones I added.

Alright, thanks. Let's go with what you have and I'll try to stick some
of this rationale in the commit message.

Will
