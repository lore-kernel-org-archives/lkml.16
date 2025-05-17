Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660E219EB
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747487599; cv=none; b=JvDc2tJVGiauVrJwqC29yJy7xvn/TIdnUEhbtRq8RROl+S8vQhlHaT1v5AzbGk7l00cNh/FTm6Fe32XOKIAPxvQUwSOzGr+Vq4BQm6avdDS9AfkNHc1PTzsAPDqPMi5PqWlH2V3GjEPb+c47RCtKfSfxk1xgBg7QxLw2/i1BOh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747487599; c=relaxed/simple;
	bh=4DE8qsSzBMjxskvZIcLJD3IWjAGEMkgDzWpDBN2L0MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3GRnGBJ/BgDaTr31NUwQd4hsqq2YJrO54j2yeBGZOa97YcK0xk/PYLmmoZxNktOLrbpsfTY4KxMjXdCyOqSCVnqX6MtYKJ38PJgFIkonLZUEMvjTL67wL7hzsToOaYaGr4ABQ01PLOQnJQW7Oe9UvHOvbmuxYSKJYyS2xL7nPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9S524AQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9S524AQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61278C4CEE3;
	Sat, 17 May 2025 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487598;
	bh=4DE8qsSzBMjxskvZIcLJD3IWjAGEMkgDzWpDBN2L0MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W9S524AQoa40jeowWpzSOEwbmR31NyCekBKleN3kFzfcpSoOv0Oo5rE1WQ6f8xMIX
	 LciGR3boa7LI+OHcUQHJ7E9B7tjyrC+jHAwYcN+NE+AslthiSujdKZzpp0Up6hBTBH
	 dgSKl4mShWsRpuGLHxcKHQatdJzzwCye6ND2S6mlF3CWfO5mWeXFfzvUYza8uS9wU+
	 dkPgSPtQG6yYrmeFKTZ39BJSyxrMaIBqHO2v+Rxy8y7GtFuR+FKEJwAR3AbJRhZLUd
	 ATyWDn0dknRbgFpJu6JYrmVCNsrEFuNmT7bqxIxwat0Po/AgolMaUftjPjwmoZhzTk
	 O1Ez5pErBjcpw==
Date: Sat, 17 May 2025 15:13:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 32/32] x86/boot/e820: Move index increments outside
 accessors in e820__update_table()
Message-ID: <aCiLaAWLu4OOmfyx@gmail.com>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-33-mingo@kernel.org>
 <77BD029B-35BF-4033-8CCD-DFD0752237D6@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77BD029B-35BF-4033-8CCD-DFD0752237D6@zytor.com>


* H. Peter Anvin <hpa@zytor.com> wrote:

> On May 15, 2025 5:05:48 AM PDT, Ingo Molnar <mingo@kernel.org> wrote:
> >This kind of code:
> >
> >	change_point[chg_idx++]->entry  = &entries[idx];
> >
> >Can be a bit confusing to human readers, and GCC-15 started
> >warning about these patterns.
> >
> >Move the index increment outside the accessor.
> >
> >Suggested-by: Andy Shevchenko <andy@kernel.org>
> >Signed-off-by: Ingo Molnar <mingo@kernel.org>
> >Cc: Arnd Bergmann <arnd@kernel.org>
> >Cc: David Woodhouse <dwmw@amazon.co.uk>
> >Cc: H. Peter Anvin <hpa@zytor.com>
> >Cc: Kees Cook <keescook@chromium.org>
> >Cc: Linus Torvalds <torvalds@linux-foundation.org>
> >Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> >---
> > arch/x86/kernel/e820.c | 6 ++++--
> > 1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> >index 10c6e7dc72d7..afb312620c82 100644
> >--- a/arch/x86/kernel/e820.c
> >+++ b/arch/x86/kernel/e820.c
> >@@ -421,9 +421,11 @@ __init int e820__update_table(struct e820_table *table)
> > 	for (idx = 0; idx < table->nr_entries; idx++)	{
> > 		if (entries[idx].size != 0) {
> > 			change_point[chg_idx]->addr	= entries[idx].addr;
> >-			change_point[chg_idx++]->entry	= &entries[idx];
> >+			change_point[chg_idx]->entry	= &entries[idx];
> >+			chg_idx++;
> > 			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
> >-			change_point[chg_idx++]->entry	= &entries[idx];
> >+			change_point[chg_idx]->entry	= &entries[idx];
> >+			chg_idx++;
> > 		}
> > 	}
> > 	chg_nr = chg_idx;
> 
> Really? That seems easier to miss to me.

Maybe writing it in two groups:

			change_point[chg_idx]->addr	= entries[idx].addr;
			change_point[chg_idx]->entry	= &entries[idx];
			chg_idx++;

			change_point[chg_idx]->addr	= entries[idx].addr + entries[idx].size;
			change_point[chg_idx]->entry	= &entries[idx];
			chg_idx++;

makes it a bit easier to read? The chg_idx++ are pretty prominent in 
that form, while it's easier to miss when it's embedded.

Thanks,

	Ingo
