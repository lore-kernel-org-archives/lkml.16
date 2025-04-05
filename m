Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28AD1474DA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743871967; cv=none; b=NZAh+yzy6rcYW848+8tfG93P441M/tMqog++XYSIyRbqY4ZUyFmUMHkB3GzeRgipiqthy8wPueUjnSE50ojRUFWd6l176nzBLQLiN62eufg56q1Nutv02zEr4gZpU0B7MIqbgj9IvPPWNzFpYzOdTSG7b5Ql3WsyFZnjDsw5Wis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743871967; c=relaxed/simple;
	bh=jJ3mb4c3z2kc0eSvWidn9TeLPFxiIvBg/fYo5CDBNB8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qd+souEh3m1kJ49K4FHuRtQ5zQxMI0fBt8J6igPlvFxBWDJinCR7EvnPc2DUuQEAyNG1fPkjGh1M3GS1aGSC8thj4NiKbStS7YXFpj9OuDVTEuVDYu3tVI6v9WyHTk52dzzQX8ebfChJgBHfO/yAemiKn1GbyjjE7O7RfQgnDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 3a5c86d8-123e-11f0-9629-005056bdd08f;
	Sat, 05 Apr 2025 19:51:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Apr 2025 19:51:32 +0300
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
Message-ID: <Z_FflEgssFzw0tzC@surfacebook.localdomain>
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>

Fri, Apr 04, 2025 at 03:10:01PM -0700, Nathan Chancellor kirjoitti:
> Hi all,
> 
> This is a follow up to the complaint that Linus made at [1] about how
> the #pragma and #ifdef to disable -Wsuggest-attribute=format is
> currently ugly. Convert the #pragma and #ifdef to the existing __diag()
> infrastructure in the kernel to hide some of the ugliness.
> 
> I am sending it to both the vsprintf maintainers/reviewers and Linus, in
> case he wants to apply it himself (since it is pretty simple).

Hmm... You haven't put my tag, nor added me to Cc list...

> [1]: https://lore.kernel.org/CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com/

-- 
With Best Regards,
Andy Shevchenko


