Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4020E00B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303278; cv=none; b=me3cd+DZb6Hu9hk4dA/UUTp6DihVlmObwDwzjCnYAUz5ei4JqtLFUOmh9Y59cW8YdWHRyTs4ZzJvmV6NoBgVUN+o0Q2U7/lEUdekomKRoQ0ihIcK5EETNc/wVqpQxT+IOoNIKFZZXw5vs/ufcTqdnLgfS4YdLmrbOchqWcRIea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303278; c=relaxed/simple;
	bh=OIrO+axsxOVWdzQPFkIcBmWA2pNG7MbayD+oYBhB0Cc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEAa3Ah4k+0Pfg4e5sAkUBpYiq2H0NrI6URJirZvvM7GCxe8q3lmSicBcXDAcHq2GJpYEhmOyBJ4OlPkptkTlIjZyhbL9vvTnrG4Autrp4EM0hcEZ4n2/klkkQDFYSAnhjJdh2TDnNr647azGXUrtMDIOUavg3FRkC9esEYg0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id c2936954-1f42-11f0-ac3c-005056bd6ce9;
	Tue, 22 Apr 2025 09:26:45 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:26:43 +0300
To: Mike Rapoport <rppt@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 05/29] x86/boot/e820: Print gaps in the E820 table
Message-ID: <aAc2o_W3ZIYPwMre@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-6-mingo@kernel.org>
 <aAcwYKtGMDv-AoL1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAcwYKtGMDv-AoL1@kernel.org>

Tue, Apr 22, 2025 at 09:00:00AM +0300, Mike Rapoport kirjoitti:
> On Mon, Apr 21, 2025 at 08:51:45PM +0200, Ingo Molnar wrote:

...

> > +		if (range_start < range_end_prev)
> > +			pr_info("BUG: out of order E820 entry!\n");
> 
> Maybe "BIOS BUG"?

FWIW, we have FW_BUG definition, with that

			pr_info(FW_BUG "out of order E820 entry!\n");

-- 
With Best Regards,
Andy Shevchenko


