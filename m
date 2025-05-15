Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B43B1AAE13
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304407; cv=none; b=NSTAUAagvK3FyYHFujItEVZbacVmHgjdwRil6ggR9EBaO0OjCyMMbD3MI1B43RcC6vSHElD2JKtkSd8jBRGnWa8oV3SuSzaOOUddbat/S1ah4UBX1DJqacB1JsOcfVrrJi/nTeaYk0jylkkwcVFBLViPsq5diARZkSCPXEH2S+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304407; c=relaxed/simple;
	bh=9DzazpLoGL/Nkn9c5iEDlVYv1IDLgL/gC21JRfg2o1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKqKQ6DbCpYjx9bzWazNc2jIsUizzgseuc/4RJrIhgoVyC7IMT09itBXv1t2G02WUINtoQnulsAtCgJHw7yV2I5zJXfY0o+PfuGe/ir2VwFRZfmD4zAcCCDpvDkbrRRsF3ggQ/3zEAiYnEJ+ugMqujsPr07eahRtnUHvH1z2eAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfkfy/YI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfkfy/YI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F35C4CEE7;
	Thu, 15 May 2025 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747304406;
	bh=9DzazpLoGL/Nkn9c5iEDlVYv1IDLgL/gC21JRfg2o1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfkfy/YIW4/NzC5Rt62EY5HwE43k84oTbKql43knvBFkg2vACULXysJCjlEncq/la
	 YECQ0fxHD8Vd/9A1QeDgXF5WlFTycJqr4TFn8gGrUHZGh1/IiHC5ABLhtynSTKJqd0
	 ksm8o8uKBdHnK2r6SsUdOESp+BtcJtIqfF7byzaOjdqFBcx7CLoHvtjidbDiQEnjRB
	 YspukPxuhlYqsv0hlPdmyRdkGAUi7OIuYoxK3jBzrEFlN5gvVuEKmatJbYVQBeh7aN
	 Xwn+8XVlorhB1e87wxSCbwCT7ZXMHi5lK1X4cI42mdQrJZcvWE+pnt7YRfVrVSaB6Z
	 VMerQu6I7Gr7g==
Date: Thu, 15 May 2025 12:20:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 03/29] x86/boot/e820: Simplify the PPro Erratum #50
 workaround
Message-ID: <aCW_0VyzQU10kwPx@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-4-mingo@kernel.org>
 <aAc3LGfa7HTBJqWx@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc3LGfa7HTBJqWx@surfacebook.localdomain>


* Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> Mon, Apr 21, 2025 at 08:51:43PM +0200, Ingo Molnar kirjoitti:
> > No need to print out the table - users won't really be able
> > to tell much from it anyway and the messages around this
> > erratum are unnecessarily obtuse.
> > 
> > Instead clearly inform the user that a 256 kB hole is being
> > punched in their memory map at the 1.75 GB physical address.
> > 
> > Not that there are many PPro users left. :-)
> 
> ...
> 
> > +		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM, E820_TYPE_RESERVED);
> 
> Perhaps, 0x40000ULL --> SZ_256K ?

Indeed! I folded in the change below.

Thanks,

	Ingo

==============================>
 arch/x86/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index a1e2d64bb28d..f40dffc3e014 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -985,7 +985,7 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_X86_32
 	if (ppro_with_ram_bug()) {
 		pr_info("Applying PPro RAM bug workaround: punching 256 kB hole at 1.75 GB physical.\n");
-		e820__range_update(0x70000000ULL, 0x40000ULL, E820_TYPE_RAM, E820_TYPE_RESERVED);
+		e820__range_update(0x70000000ULL, SZ_256K, E820_TYPE_RAM, E820_TYPE_RESERVED);
 		e820__update_table(e820_table);
 	}
 #else
