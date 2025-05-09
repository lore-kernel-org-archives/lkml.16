Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2711CBA;
	Fri,  9 May 2025 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770443; cv=none; b=JAchwb+ztLo6HvYazQr7sRtTomRuzJzWl6H6NlDwH2niAWOn6X+G0UT4bMIrGVWvXQhw1KN5KaJRrYP4BkHOVf55CWwOz/mhdQ6GAH9b3k4yjI4xRiRdXAZz2Fn97MtYVXBDqoK/h3bLXq1MXQUKMy6+FEloGnMU9K1jOIKURPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770443; c=relaxed/simple;
	bh=2F9C7tIL0E1UVn2MTuipbuWXEc0JNCxH2nHehw68R0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjvphs9mPurMLxxHCLYi0soAVblhP/DvgwE2FnGDWzjlMPEhQdiSCWwhGxtIMzZFTIjUkf1w2IE+vL1sOBrrarLBAAPEUWrJi74cf3JcTxnUMxSoLsIFNx0ilzYcTE7Rlf85Il2NM7vLGI6DNm+fNdh5+EFZh+L9dt6Nl2wRG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwRtefw7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwRtefw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E85C4CEED;
	Fri,  9 May 2025 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746770443;
	bh=2F9C7tIL0E1UVn2MTuipbuWXEc0JNCxH2nHehw68R0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwRtefw71D3zLS7KhS59GNlxf0NDjxLfSFg3UDnGLi82Bdt9bcuUsHDxgLpjVHYTt
	 2sTBwATargPCOdzsUo7jUtkIYVhKBZUF1lKX93oLY2OzZFwPH4WIT1QpvdDhAwJF3f
	 lQaGRFapkRKzfLU6I646LD/XcWUOidIy0GSso1yk4JgR0+TATk+8xe2LeHmehitf3k
	 nkyhQbPaf1MuYANTzoUkYBrLSit4RWFuM6hEiNekBAz7oK9+qHr7siu6DGt+s/A2K/
	 DZAHG5zw3u1tAnHCHcm98AOtz3ifAY43sQt6ZU0s1+9pm+7fjZkFj4H/D2+skPNFT+
	 I0NuuhQ9nZ9/A==
Date: Fri, 9 May 2025 08:00:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, Daniel Almeida <daniel.almeida@collabora.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] sched/core: Add __might_sleep_precision()
Message-ID: <aB2aAEELa3253nBh@gmail.com>
References: <20250506045843.51258-1-boqun.feng@gmail.com>
 <20250506045843.51258-5-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506045843.51258-5-boqun.feng@gmail.com>


* Boqun Feng <boqun.feng@gmail.com> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Add __might_sleep_precision(), Rust friendly version of
> __might_sleep(), which takes a pointer to a string with the length
> instead of a null-terminated string.
> 
> Rust's core::panic::Location::file(), which gives the file name of a
> caller, doesn't provide a null-terminated
> string. __might_sleep_precision() uses a precision specifier in the
> printk format, which specifies the length of a string; a string
> doesn't need to be a null-terminated.
> 
> Modify __might_sleep() to call __might_sleep_precision() but the
> impact should be negligible. When printing the error (sleeping
> function called from invalid context), the precision string format is
> used instead of the simple string format; the precision specifies the
> the maximum length of the displayed string.
> 
> Note that Location::file() providing a null-terminated string for
> better C interoperability is under discussion [1].
> 
> [1]: https://github.com/rust-lang/libs-team/issues/466
> 
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
> ---
>  include/linux/kernel.h |  2 ++
>  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
>  2 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index be2e8c0a187e..086ee1dc447e 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
>  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
>  extern void __might_resched(const char *file, int line, unsigned int offsets);
>  extern void __might_sleep(const char *file, int line);
> +extern void __might_sleep_precision(const char *file, int len, int line);

Ugh.

Firstly, '_precision' is really ambiguous in this context and suggests 
'precise sleep' or something like that, which this is not about at all. 
So the naming here is all sorts of bad already.

But more importantly, this is really a Rust problem. Does Rust really 
have no NUL-terminated strings? It should hide them in shame and 
construct proper, robust strings, instead of spreading this disease to 
the rest of the kernel, IMHO ...

Rust is supposed to be about increased security, right? How does extra, 
nonsensical complexity for simple concepts such as strings achieve 
that? If the Rust runtime wants to hook into debug facilities of the 
Linux kernel then I have bad news: almost all strings used by kernel 
debugging facilities are NUL-terminated.

So I really don't like this patch. Is there no other way to do this?

Thanks,

	Ingo
