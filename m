Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7523297B83
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747307105; cv=none; b=uXVoowTF36hyUbUm/d3RqXZZDevwEn4eT9IHaNW8YO8/Z+eA+/P+uObxbB3InUWnLqAPF2yXrqBe6g8GUf+5aAAG7YuppC00HFJtc9SmXLzoUsWrV5mXsBNxsr1c3pJARnoSPrDZrOlAE/08fExyEulGJETjfoU7BpLcJBEdfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747307105; c=relaxed/simple;
	bh=moQ40G4bcXJhXwHAkWLaFER6gPIKY+j+rfwG8h61z4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPmcDfboN5DpW5QLTCxDmAw7tAcMGBnRgcaL+5HTOWgsb9HAjHgX52hDfMErlKZg0y1tQOE2i4aeFhTk+bP+er3bJzKTLx9x3jljbqLBBfMABLxM5rnZwNauKcwIrJG+SPd2YVku0/nDqgdYHpggp629uggfxnWVYH91NVvlVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDP5elaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDP5elaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6B1C4CEE7;
	Thu, 15 May 2025 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747307105;
	bh=moQ40G4bcXJhXwHAkWLaFER6gPIKY+j+rfwG8h61z4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDP5elaF9yZlRg+O/h1WHEY4PIJ0htvUNP9fb1TFnnB2IDNMJAnMZUzIVVJC3KJ2V
	 6F/6rSndrRekM/fAYXk9WgD6fvGf8y0TPDxKrjmNXYmTlfdAxDRXGbW+STFoTOKpQc
	 pm9hIw5WUm4Se3iJWvHZehkydry0CJbWEV0oEUlBeTIYG8SOpq2CpQFTUbY3OvVaJx
	 QU/p5d8g6wgPI5gchF28bY0JYm7Y8rxu+UAnJrn9D9MG/rz6XoxY598is/Xk4Vp4av
	 8UIj6zfos5uMnpc5f/TAWPtgdBwYHwVWmyGAQRgX1thOXkEztZi8XkfJiLAYQiPZgb
	 fOeK8QWG+fCjQ==
Date: Thu, 15 May 2025 13:04:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 08/29] x86/boot/e820: Print E820_TYPE_RAM entries as ...
 RAM entries
Message-ID: <aCXKW3sBBtIr9Bcl@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-9-mingo@kernel.org>
 <aAc3wxUI2Jvqj2xx@surfacebook.localdomain>
 <aAc6rS_eiFr5WCAw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc6rS_eiFr5WCAw@kernel.org>


* Mike Rapoport <rppt@kernel.org> wrote:

> On Tue, Apr 22, 2025 at 09:31:31AM +0300, Andy Shevchenko wrote:
> > Mon, Apr 21, 2025 at 08:51:48PM +0200, Ingo Molnar kirjoitti:
> > > So it is a bit weird that the actual RAM entries of the E820 table
> > > are not actually called RAM, but 'usable':
> > > 
> > > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable
> > > 
> > > 'usable' is pretty passive-aggressive in that context and ambiguous,
> > > most E820 entries denote 'usable' address ranges - reserved ranges
> > > may be used by devices, or the platform.
> > > 
> > > Clarify and disambiguate this by making the boot log entry
> > > explicitly say 'kernel usable RAM':
> > > 
> > > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> > 
> > Can't user space use that RAM?
> > 
> > Shouldn't we rather refer to "OS usable RAM"?
> 
> Or "System RAM", just like in /proc/iomem

Agreed - I have folded in the delta patch below.

Thanks,

	Ingo

=============================>
 arch/x86/kernel/e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 8b84261173cc..0a324d0db60e 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -187,7 +187,7 @@ void __init e820__range_add(u64 start, u64 size, enum e820_type type)
 static void __init e820_print_type(enum e820_type type)
 {
 	switch (type) {
-	case E820_TYPE_RAM:		pr_cont(" kernel usable RAM");		break;
+	case E820_TYPE_RAM:		pr_cont(" System RAM");			break;
 	case E820_TYPE_RESERVED:	pr_cont(" reserved");			break;
 	case E820_TYPE_SOFT_RESERVED:	pr_cont(" soft reserved");		break;
 	case E820_TYPE_ACPI:		pr_cont(" ACPI data");			break;

