Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599E02192F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303496; cv=none; b=eYbP55Si0st57VvkhVYLn4F+KtZ1nQPo+1U48GIOrZomd4yQgOozmV0ONU5CkgyPI3TUCHSuy4zqI9koExjNiQOTr+Zxi3Xc2W/foOe+SXVCQoQxuw/2dDo078hB8/NIFsdWpR3+i2ZqQhjWYGB70f22bAF9FmKkifQAsGm0HCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303496; c=relaxed/simple;
	bh=2MaNizg3Uc+LkcxE/GMJMW3ZgFviKL4sEPfJZtzcaFY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOFKCuE2aoCxfAqYcG36SczSpES3ofo6GclnUfuupywzu7utD+IJB/XadtYfqagq/L/MQTO4ePoOz/7eQlVkgnkjoGzL5qT27Ivm34FH2FtWTtTe6ahVR2URuOycn7i0sJff0UzpWBL0jca2lot+mEZfeWkbJNEHRx3/S911x7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 6e4ddbf5-1f43-11f0-ac3c-005056bd6ce9;
	Tue, 22 Apr 2025 09:31:32 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:31:31 +0300
To: Ingo Molnar <mingo@kernel.org>
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
Subject: Re: [PATCH 08/29] x86/boot/e820: Print E820_TYPE_RAM entries as ...
 RAM entries
Message-ID: <aAc3wxUI2Jvqj2xx@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-9-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-9-mingo@kernel.org>

Mon, Apr 21, 2025 at 08:51:48PM +0200, Ingo Molnar kirjoitti:
> So it is a bit weird that the actual RAM entries of the E820 table
> are not actually called RAM, but 'usable':
> 
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable
> 
> 'usable' is pretty passive-aggressive in that context and ambiguous,
> most E820 entries denote 'usable' address ranges - reserved ranges
> may be used by devices, or the platform.
> 
> Clarify and disambiguate this by making the boot log entry
> explicitly say 'kernel usable RAM':
> 
> 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM

Can't user space use that RAM?

Shouldn't we rather refer to "OS usable RAM"?


-- 
With Best Regards,
Andy Shevchenko


