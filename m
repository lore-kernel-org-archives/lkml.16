Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30B14831E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800542; cv=none; b=nZ3WV89Ui3jdQHhBz7y62jd5BAyXhUWO6CFQKDDwrwLIAWE9LS09QMGu5rO5RTkietMbmQypte/zPxwrbrMVM+YwP/siSU5lT6YBy2TVCfH2PgpoPUZPRNeij8RCyjq0GU4+0GuLTXcsx8hpvivAvVwvvsh0GQPgY+T+Cykc9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800542; c=relaxed/simple;
	bh=dp9Um/rFFCjAtIbn7CPCJ0Hg/NpOtNmhis5wQNdfO00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THzXGE1lvxOe0zVMJjiHjqp0KHwj8kUH/7Ck6OF8mGtHi5waNOEgTT2COt5js2MUeGAaaQlhIoyIlOvfe2OXtnqjthTWd3oSwRgxHUQvZSrtnryr50ZttxX8GmyTdpIYLd7xtd+9Td/jYaDbpWymZVkrf/p+YDZvPP0wtlcy+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgKuONl7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgKuONl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE25AC4CEDD;
	Fri,  4 Apr 2025 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743800541;
	bh=dp9Um/rFFCjAtIbn7CPCJ0Hg/NpOtNmhis5wQNdfO00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgKuONl7uw8hFePLNbiYr7AyLV+jHzVu50qasOhydeEg3QOPDmezpV+N09jhOpPxl
	 591hf/srUbVL0VZVWJ7WjJ9rIha6bpA3F1LksxKjvQQx0a94lFkStQ+Eh1wKUvFgU4
	 ePOf6LdIE8OFnJMJwdDaRPa7Ue5R7t3Y5+T/IwUCsSPwDLIWrklagoRosNYRLtBaxL
	 WXKG9XbfOze0ToxfUcH04IkBkBLx1ykX2DQV3updWwRKjELk07cdGbBZa+ZnUIj3RX
	 7jUf8ECITE0ORfksNzCmnSP+yo95yyLFKhWqCWoZGvuJPMa/Z885NQfLhr2DjEWEOD
	 ZpzYukZLFmfaQ==
Date: Fri, 4 Apr 2025 14:02:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] more printk for 6.15
Message-ID: <20250404210217.GA299251@ax162>
References: <Z-00cAEKkfvyNto2@pathway.suse.cz>
 <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
 <CAHk-=wic_SpqRhtFF+_9wFOiUf-NZcTsNH+jNdi0xLPxexNGXg@mail.gmail.com>
 <CAHp75Vf=tYmWXDUZDqcMK4i8k6_VBqGttw6-mEgt6VhvRVFwuA@mail.gmail.com>
 <20250402203422.GA655609@ax162>
 <Z-557YrwVr8bONq4@smile.fi.intel.com>
 <Z--V04jtF16r63eO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z--V04jtF16r63eO@pathway.suse.cz>

On Fri, Apr 04, 2025 at 10:19:02AM +0200, Petr Mladek wrote:
> On Thu 2025-04-03 15:07:09, Andy Shevchenko wrote:
> > FWIW, I have tested this in my case for both compilers and they are happy with it.
> > 
> > Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Great!
> 
> Nathan, would mind to send this as a proper patch, please?

Sure thing, I will send it along shortly.

Cheers,
Nathan
