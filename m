Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2CC819
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309185; cv=none; b=rNfFJVbXEQPtEzRSil7NQltZSpEvSMaEefnqAeeDdAaegpkTljnQaQZOIctLDiceHZ3pmmIyZt1xyC7A08XWGhGee/BV3dJDyypRSMdsY3pzQA2CjD8HFtMYHtkTEC/j7B9yKT24U8k62B/dtGieG+FBv0VvyHXtIpzcGlfUyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309185; c=relaxed/simple;
	bh=FTog6xxvXss+4dG1CPAAINsSmF219u0RcG576nSeTGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct5jvglBw9xiStNrxTyepfx/RId7F6EAmfOs90K45Cnf8hGtAsjMYS24vFnHHyoUkW5Ly5B/IgdnH/BIz00EPdtmoiVVDY0IuqTz7astIEmK+yoshF3eh851VEpbeBvkpByx3MCROhGovDL9v0aeC/KlnSLFbZQFcgKOrF8wWXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDMx1BUT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDMx1BUT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6719C4CEE9;
	Thu, 15 May 2025 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309184;
	bh=FTog6xxvXss+4dG1CPAAINsSmF219u0RcG576nSeTGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDMx1BUTCdR9TOl/O+Vz1BvsxfzoJy/YzP58fFY31rDcMK/myTAorywDc0biF06JO
	 X/Q9CmTNshs69PGlLjEgGj8oy5aBpADkdFOGJ3lH0KhDo6ipUWqirSFXb5mP/klB6U
	 3d7y5HQ2kNQWTv8kq1FR/zYNUtdnkcyE0R2WlUXOX+KE+a+OEzBSSsx8fxI0J4COxw
	 5AHVzsG3Ma1QbRDcTiVfMgOUtSB3bSE31xkWAvA+a+F6GNDOYaM/K5XljppcLAPlcd
	 jU3Q1Cmb6hKiNfZ6O6zf7L8vV0l50NNJ8AxsUSR7poIt5VRrboOOuK4C2YxN7A+fax
	 jtlAfwv0OiiHA==
Date: Thu, 15 May 2025 13:39:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 19/29] x86/boot/e820: Standardize e820 table index
 variable types under 'u32'
Message-ID: <aCXSe8XnJfswiShd@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-20-mingo@kernel.org>
 <aAeyL9yxqXl4pazK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAeyL9yxqXl4pazK@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 21, 2025 at 08:51:59PM +0200, Ingo Molnar wrote:
> > So we have 'idx' types of 'int' and 'unsigned int', and sometimes
> > we assign 'u32' fields such as e820_table::nr_entries to these 'int'
> > values.
> > 
> > While there's no real risk of overflow with these tables, make it
> > all cleaner by standardizing on a single type: u32.
> > 
> > This also happens to shrink the code a bit:
> > 
> >    text      data      bss        dec        hex    filename
> >    7745     44072        0      51817       ca69    e820.o.before
> >    7613     44072        0      51685       c9e5    e820.o.after
> 
> Ah, here it is! You can ignore my respective comment in one of the previous
> patches. Perhaps better to group that one (which converts to use idx) and this
> one, so they will be sequential in the series?

Certainly, and done, the order is now:

  x86/boot/e820: Standardize e820 table index variable names under 'idx'
  x86/boot/e820: Standardize e820 table index variable types under 'u32'
  x86/boot/e820: Change struct e820_table::nr_entries type from __u32 to u32

Thanks,

	Ingo
