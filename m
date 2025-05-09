Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481391990A7;
	Fri,  9 May 2025 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776511; cv=none; b=OIfWmBjcyiOEJV7DXapiQHNQ99nL173yja442f25a91ZrtdvFq37bR9Khpiz4cQ1mahBnKhUu4gdZpOePkwoQns9g7C5Gye6ajwgMhPr7pnnxMz9VdPCMmO038sF7iJT3uUOyax9FW3koOlGj6gYrmHnM7CGDXTygd8Nwu6kyVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776511; c=relaxed/simple;
	bh=tcdXYt+d9QC9Jlh1NzRG+oQJPwhMPB5zQsOLpL3DEq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q3wzXlmjSFJcef4aLitQGVb8pSBhRYwCmiLKOS2NGp8FQgGiX3nJPdAgkJXRccyj4woULiQ3XvFWdoZsSL9X3/GeRG5rqvsnuWMo/hYVJUglJY4tgM9babLZaKt+3CHI788r5Z69fQ3fvoZllkc5VU1UcKoMK7xUEfYEWmUQYyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WffbsTHq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WffbsTHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C723C4CEE4;
	Fri,  9 May 2025 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746776510;
	bh=tcdXYt+d9QC9Jlh1NzRG+oQJPwhMPB5zQsOLpL3DEq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WffbsTHq6x06a9pNizrSBArDb919iHJ0oRrCsLjoZNTJ1/mZFWsY7NcJstMPCqvHg
	 e/aLaVrtKIg4T/dBQbQFuCgqC9GyfwEOJoi6HUzx6IjEVkZ8GAtdSocMK+um3wrUi8
	 mNJ/TS9vP2T28xaPkESMGAm8DxAu2rVdvyVhzTCdunWvZVXhryxVxW1F2kK4NtFQZv
	 FDYJMeaWJtIE/fMu9mUSqtfQyUXvtZFgJ0N+vCRheqA+dOkt6+0+u5NP+yqQUt8oGC
	 4IxyWyTdc+O6F9BT1qlO5v/TEwymwPJAhgGfHR903x42kEntjY2CAS3I3sru9DNsbT
	 iAta2lcHsuZBg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,  Peter Zijlstra
 <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>,  Juri Lelli
 <juri.lelli@redhat.com>,  Vincent Guittot <vincent.guittot@linaro.org>,
  Dietmar Eggemann <dietmar.eggemann@arm.com>,  Steven Rostedt
 <rostedt@goodmis.org>,  Ben Segall <bsegall@google.com>,  Mel Gorman
 <mgorman@suse.de>,  Valentin Schneider <vschneid@redhat.com>,  Miguel
 Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Gary Guo
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno
 Lossin <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,
  Trevor Gross <tmgross@umich.edu>,  Danilo Krummrich <dakr@kernel.org>,
  Nathan Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>,  Bill Wendling <morbo@google.com>,
  Justin Stitt <justinstitt@google.com>,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>,  Tamir Duberstein <tamird@gmail.com>,  Kunwu
 Chan <kunwu.chan@hotmail.com>,  Mitchell Levy <levymitchell0@gmail.com>,
  Martin Rodriguez Reboredo <yakoyoku@gmail.com>,  Borys Tyran
 <borys.tyran@protonmail.com>,  Christian Brauner <brauner@kernel.org>,
  Panagiotis Foliadis <pfoliadis@posteo.net>,
  linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org,
  llvm@lists.linux.dev,  Daniel Almeida <daniel.almeida@collabora.com>,
  Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 4/5] sched/core: Add __might_sleep_precision()
In-Reply-To: <aB2aAEELa3253nBh@gmail.com> (Ingo Molnar's message of "Fri, 9
	May 2025 08:00:32 +0200")
References: <20250506045843.51258-1-boqun.feng@gmail.com>
	<20250506045843.51258-5-boqun.feng@gmail.com> <aB2aAEELa3253nBh@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 09 May 2025 09:41:36 +0200
Message-ID: <87plginscv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ingo Molnar <mingo@kernel.org> writes:

> * Boqun Feng <boqun.feng@gmail.com> wrote:
>
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> 
>> Add __might_sleep_precision(), Rust friendly version of
>> __might_sleep(), which takes a pointer to a string with the length
>> instead of a null-terminated string.
>> 
>> Rust's core::panic::Location::file(), which gives the file name of a
>> caller, doesn't provide a null-terminated
>> string. __might_sleep_precision() uses a precision specifier in the
>> printk format, which specifies the length of a string; a string
>> doesn't need to be a null-terminated.
>> 
>> Modify __might_sleep() to call __might_sleep_precision() but the
>> impact should be negligible. When printing the error (sleeping
>> function called from invalid context), the precision string format is
>> used instead of the simple string format; the precision specifies the
>> the maximum length of the displayed string.
>> 
>> Note that Location::file() providing a null-terminated string for
>> better C interoperability is under discussion [1].
>> 
>> [1]: https://github.com/rust-lang/libs-team/issues/466
>> 
>> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>> Link: https://lore.kernel.org/r/20250410225623.152616-2-fujita.tomonori@gmail.com
>> ---
>>  include/linux/kernel.h |  2 ++
>>  kernel/sched/core.c    | 62 ++++++++++++++++++++++++++++--------------
>>  2 files changed, 43 insertions(+), 21 deletions(-)
>> 
>> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
>> index be2e8c0a187e..086ee1dc447e 100644
>> --- a/include/linux/kernel.h
>> +++ b/include/linux/kernel.h
>> @@ -87,6 +87,7 @@ extern int dynamic_might_resched(void);
>>  #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
>>  extern void __might_resched(const char *file, int line, unsigned int offsets);
>>  extern void __might_sleep(const char *file, int line);
>> +extern void __might_sleep_precision(const char *file, int len, int line);
>
> Ugh.
>
> Firstly, '_precision' is really ambiguous in this context and suggests 
> 'precise sleep' or something like that, which this is not about at all. 
> So the naming here is all sorts of bad already.
>
> But more importantly, this is really a Rust problem. Does Rust really 
> have no NUL-terminated strings? It should hide them in shame and 
> construct proper, robust strings, instead of spreading this disease to 
> the rest of the kernel, IMHO ...

Not to discuss this particular patch or language interop in general, but
I am curious why you think that null terminated strings are more robust
than pointer + length strings? From the paragraph below, it seems you
also believe that pointer + length is worse for security. Why is that?


Best regards,
Andreas Hindborg


>
> Rust is supposed to be about increased security, right? How does extra, 
> nonsensical complexity for simple concepts such as strings achieve 
> that? If the Rust runtime wants to hook into debug facilities of the 
> Linux kernel then I have bad news: almost all strings used by kernel 
> debugging facilities are NUL-terminated.
>
> So I really don't like this patch. Is there no other way to do this?
>
> Thanks,
>
> 	Ingo

