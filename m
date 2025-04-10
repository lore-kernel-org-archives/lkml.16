Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B0E1A3BD7;
	Thu, 10 Apr 2025 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308079; cv=none; b=adJKFspQ+SpjhAHQGbB+nMpyvTx1hjxpDFjJxCTLHUJQ20fWXXoOccA3SWLZNIr/a8vKSDBP7YE2Hykb0OaSZTz03/NfWnlY+Rk7Ss8fro5nlXve5DTfOB8pnbWeoka+ULbes+2eBRlYIuhse3jEKGCHSM9yR4O5K/C6WGh4efw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308079; c=relaxed/simple;
	bh=N+vhPm8xte9yeggzzG+H9AHlZsgrUF4oVUvy+QxaKW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb9gB/0PC6IFGbPlN0/fzQu3hAmV6sPdbJkCJ4lBhVmQf2x1hjPXn+2ZS8kRfZ1k1vhGZOQRFQVqmaZF9gsIPcVzrPGYbwAG3r/FibYb+UZheJyVaOOQUyEaJFFitSNatj53O+HdiK4p8tdMGyg8fiemau2Ey/NqmToqL1WJrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COvqrPdL; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COvqrPdL"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301a6347494so168012a91.3;
        Thu, 10 Apr 2025 11:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744308077; x=1744912877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+vhPm8xte9yeggzzG+H9AHlZsgrUF4oVUvy+QxaKW8=;
        b=COvqrPdLSzpQgKp+k7jN2r6Llif7ISalMya2PaQGK4qXu/p+bCgiRUAtjY2t59Q8Dv
         SqhZKR/1QtrTMiqV+RltPib8QRGyvnBgks74TqV/GwIbke2/B0BEeSdmnBAFqSU1TDNV
         m85Q5ElW7dXftvC9kulmVPN+K9scub/isBHN0aGWS72y1LqSh414qUYTYcFp5NZlMcwU
         G38cdggvFrBxh3JGdfyJ/8tl0iwasftNJJi6pzk4vpHb1iMAVgDNbyld78llFtYHTSAl
         wdVHNTo55FZMbar+N7cJOP9pFn7uYqjOPYSjjUhntoVm04ZZ5Ly9UmDKFmo9ginGgLgB
         gi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744308077; x=1744912877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+vhPm8xte9yeggzzG+H9AHlZsgrUF4oVUvy+QxaKW8=;
        b=w63NI/Rp6RAKj/GPhSSjC6nez22wNI2ZRCWsKw/ls90XqAQAxqjXKvmQRAmBFzErn4
         L3L0SfiufVKoX1J7X6Oc0Cv2YfYNhkqpf2VbEBcdfUcwh2NtcIkoreU0VwT7sBTkOGQO
         9bUq58zYuS5zW1btnakOu9iPGekSuK7n2VZu0VgOutyEkZ6nNtDEKhLJGNXckjAPjSG3
         WAVtcKMIKjVVzmKAaiOJIoo+LtZAlBAw3MyCiKZw2+WRQzwd8IkWMR8JS0+nPqRcJsos
         Y+bTnCoJ+YvpLTmnZq9iUpN/m5RWvebyBCHiXM2jMeUGOpK71Cb2JO7uoV2Xxhdv1X8j
         TWxw==
X-Forwarded-Encrypted: i=1; AJvYcCUQmxZ3/g1WMzuPBGUxPi0D7oa6jjbppu2BPSpSuy9NKs0lmPWJvxF59ewCzAnxQKP4AalGXd23MQI4OTfCji0=@vger.kernel.org, AJvYcCV4UBa/aSbcJ6/msXWzR8ArEgtveznSohI5jqENEZ4eN3Vn5GsYOYJsmcBcH8OcxmOqkDTvM6d8Z24oI7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YysUoqltkpXlskioRYT8KggoWd47tliSUd8I0zOYySpmIv+UWry
	mEAdP3qnjbKBpsS6TN5Csb+E3l4MmvQ99KVk5hKB0lwILmla2rzxX+L7prJwtGnb/S2dcvayZE1
	7P79wtHaZdKbfwlSdxn+rrWtB+bQH1MSrXAI=
X-Gm-Gg: ASbGncuSV8O5HkVVTPIE+25vMn0E0nxRdXvmhOVKCoEi+pvNLQKZnbnBlRrBaOW3pay
	eN4zvAGTlPLlPdyvZJdFVlPfvhfbTI5cILa2rYY5WJ8btoR8ookoZX+voVPsyCLs2MdeCFSMfNN
	16caz+H4xUt7FmJ8N2uQfeiMXX3oPgUy+i
X-Google-Smtp-Source: AGHT+IEiBPAnKByRED0OTMJvlH3bps6wKzTDzK/IbVCTFG55PZTv9PCNHw7CZ61yUjEbnkV8wcYR79umSxB8Hwqo7P8=
X-Received: by 2002:a17:90b:3512:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-306dbb66b4bmr4264364a91.1.1744308076591; Thu, 10 Apr 2025
 11:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <20250410140850.GH9833@noisy.programming.kicks-ass.net> <CANiq72kS8kfCcaqtG0KUN4Ywh6i4PHaFOg12jF+Y7CAb5SJLbA@mail.gmail.com>
 <20250410151446.GJ9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410151446.GJ9833@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 20:01:04 +0200
X-Gm-Features: ATxdqUFnoPjbSS4cZwhGyRDU33M_xG_03_73M1jIf2b6SiWodaDXeqD4w6LceX8
Message-ID: <CANiq72kVJkR=EufaZwtjgs+_Vqet3oNNBi9U9LAu_92U6BOuoA@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 5:14=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Ignoring MSVC, which is a horrible joke of a compiler (or did Sutter
> finally cluebat that team into building a sane compiler?), there are
> definitely cross compiler STL implementations around.

Definitely, there are, e.g. libc++ and libstdc++, but my point was
that it doesn't happen by accident, i.e. it requires effort (perhaps
even on both sides).

[ As for MSVC, last time I used it (2020?), it was way better compared
to the VC++6 times -- at least they started to try to be conforming,
e.g. all the work behind `/permissive-`, including the two-phase name
lookup I mentioned. They also improved a bunch of thing for C to be
able to build projects out there. ]

> Again, with the exception of MSVC, Boost builds on most C++ compilers
> and is the staging ground for many new library features.

Hmm... I am not sure what you mean -- Boost works with MSVC, and Boost
tries to use standard C++. Even if it may rely on hacks or compiler
extensions at points, Boost does not need to implement e.g. a magic
`std::launder`, and I hope they don't use builtins etc.

> And the old STL (although STL really is far more a library than runtime,
> it being fully optional) will most certainly build on a new compiler
> from the same family.

[ To clarify, by "STL" above I was referring to the Microsoft's STL
project (i.e. they call it STL, but it is the full C++ standard
library). ]

The pure "STL" stuff, i.e. containers and algorithms and such, yeah,
that may not require any magic. Some Rust `core` types and functions
can also be reimplemented in normal Rust too.

> And I know Linus hates on C++ something mighty, but in this parallel
> universe where he doesn't, I would still recommend the kernel to not use
> STL and instead build its own libraries (or borrow some nice pieces here
> and there).

Yeah, we take that approach when needed; e.g. nowadays we don't use
`alloc`, which is another part of the Rust standard library that
contains things like the equivalent to `std::vector`, and we also have
our own equivalents of `core` types sometimes, e.g. our `CStr`.

And, yeah, I agree it would be ideal to be able to reuse/customize
some parts more.

Cheers,
Miguel
