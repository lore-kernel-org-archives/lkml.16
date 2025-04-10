Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE3A1E22E9;
	Thu, 10 Apr 2025 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296875; cv=none; b=dGiOQSMnR1HSJebzqmA3CxwVyAlQ1d1Wb3igBnHVfquW2I9fOVMo6sYTOjH3y/hNyfuJOSH3pb6BuULTSzDZg7oKXYrHFeRbz2LXnJCZ6RzXNR2L6THDZY1G3vSTX68Qh9JQ2vIOux+IeFSe4rGT75/S3wlW+vNNKfBLBFyyEeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296875; c=relaxed/simple;
	bh=rX5kZ+bccYTQ+0IvJleOyXcCOn1HAAv27541P9DyPAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlYG426AsKK6q8dsWX8BbWMYzjTAMvkAg885VYEkcpIT6t4Xsb9mtuV6jMZFVXiZZEScjk9tTJuR0Cm81Vdu9G4TulGx73/6bw+2Gp8TZOeixp4m+3dlPWpJk6TqVdxWaOKDb1hKLZ+Gi1eob4NLyTSK4qHXEhoKbsAV87wwDdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic58JeaG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic58JeaG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223f7b10cbbso971875ad.3;
        Thu, 10 Apr 2025 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744296873; x=1744901673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rX5kZ+bccYTQ+0IvJleOyXcCOn1HAAv27541P9DyPAs=;
        b=ic58JeaGKZryei2NieulhgfiWJSOatbSuX4196OA6m5fFMElKoGlGeF9bSDoqNubed
         jtmjFEfETE35jwLEivGk64g6ZR15b1JKwRqPoch/9WN+H/4Q9rJsxxSVSM9tw4kd2XzW
         jTZVwlXlcrQCuyyZH0ejh9g1J+OXWp6cNFsEBHhUPzjNgi4GXJoyDCz2ckhbARFZe4Rb
         U2O8xk42/g7kLGoEJ+2ThmUzW5nGjubFQVpa3TTibLrH6rxuzPluyJZLTq1TAtjWn+Oi
         V2vOh9aJtPcm8N+qOQiXyEAaa/tuI/1BSvjnWI2ZuBrYjg6eL9s5gHUrydjFQMlkW46r
         OGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296873; x=1744901673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rX5kZ+bccYTQ+0IvJleOyXcCOn1HAAv27541P9DyPAs=;
        b=AA2KMPyLmuqKiVZy1x5d6GgAxZ5yJQQTtP17r+ZHtruqT+wcWk3pnv8L65R/QSXuG7
         RUzYENe1XUXuLqaMvsaCTqHx84BkOjMJtZyH96AAQ5qMkd1QvZ84y+6efrRPQjhSLudt
         xh3Ycj6DrA6BpEGqTg3ZgsEGcZvViMTKUEtJUI/gbQj5yGp36mbERgmDVLDU+yWDnw2l
         zUU5iCL+0UkjWFLc2XtwC+r9eR1MZjK2T+aElf56iBUmMO8ZjISCOVeMmrAScBCseU1D
         jbJgDviK/Zg17mx2yUHA8f+OykbWQqqTrL2RcmhpXDLCz3IV4PRXqHgxoc9DIgot85HF
         Qvcw==
X-Forwarded-Encrypted: i=1; AJvYcCUYCWlaflN3zUDCefWKg1dGiOqYwZkwG1HhpeJex8iKG1TMed2Ux2JIuWBSZRl9akMAecGkHdytuOcBNS/YZdI=@vger.kernel.org, AJvYcCXW/1hlxTZmFgXIwZ9NTEtbxh3dID1WiqRJOKC7drG5zxrkJaqYxS1oKpp9+Q/cTstctfUog3Thxd2zfs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzhJ27lrLldygCvRTlbI8kLUOeuzGcNY61uv5gE+pCmyZAol1
	4t+QWS4rTPetQD1UA3I5dEI4DULHeGVLa782I5nuuKXxoHdtr4CYdj10RHFJ7ouBiK0PYqUwkkc
	Q3J+eI98yQUwmD+goFmNShvMdb7Y=
X-Gm-Gg: ASbGncugxITh8WGLDGoMw3IDnz3mFVaESs5fQPJvCloyYA9Gb3+ncGN6FVD9GJrFwVv
	3WGU6YxR8Te/bFGuhCk+l3+SapAUU381YjU32DnjhmcKB6V/VUL7ukquxxviJZE6ohvyv1L5KYQ
	YS7UpIJyANRKdqz37DGEywFA==
X-Google-Smtp-Source: AGHT+IH/teFH0GAeMFWUUAN0o9igIHTNk6ZnoXIBDxlIZAuMYIu9p9AWBhYxZWHithkHjzP+NE64LN3USkBXXEGlMvs=
X-Received: by 2002:a17:902:db0d:b0:224:10a2:cad1 with SMTP id
 d9443c01a7336-22ac3f13978mr40535325ad.10.1744296872720; Thu, 10 Apr 2025
 07:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <20250410140850.GH9833@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410140850.GH9833@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 16:54:20 +0200
X-Gm-Features: ATxdqUHR8wwXZti54G-PQeVefzHiZq1sWXFagK8MU_TYdSzWKWWoTFQ9gPgItSo
Message-ID: <CANiq72kS8kfCcaqtG0KUN4Ywh6i4PHaFOg12jF+Y7CAb5SJLbA@mail.gmail.com>
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

On Thu, Apr 10, 2025 at 4:08=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Maybe I've been living in C/C++ land for too long, but you either expose
> a full language feature and then everybody can use it, runtime,
> libraries and user code alike, or you don't.

I find it unlikely that C++ stdlibs happen to build and work properly
with compilers they are not tested for. Say, MS' STL with GCC or
libc++ with MSVC.

At the very least, you need to agree on builtins or `#ifdef` stuff
manually for magic bits, and you need to avoid to rely on any compiler
detail (or bug... :) anywhere (say, the non-conforming template
behavior from old MSVC), and so on. So you need an active effort to
make it work, I would expect.

And with new complex features like modules, I find it even more
unlikely the first implementations of a compiler's stdlib would happen
to work on the first implementation of the feature of another
compiler...

Now, it is true that Rust's `core` uses a lot of internal features,
precisely because they don't expect to be built by anything else that
the current (and current - 1) compiler, so they actually take
advantage of that.

It would perhaps be nice to split the "really requires magic" in
`core` from the rest somehow. In this case it wouldn't have helped
though, since the formatting machinery still uses builtins last time I
looked.

Relatedly, GCC Rust's goal is to build an old `core` at the moment, so
that they have a fixed set of things to solve.

Cheers,
Miguel
