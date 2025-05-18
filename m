Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5E191F7E;
	Sun, 18 May 2025 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747601371; cv=none; b=tPVo5lOoTU2qGn10Ti28a0NZq840l0AdCzaUVpCsUcWBdqJrQikG28CU3Ur+z5UwwfyI7ocWGxzIDWe53XwbyOTTZFdpPXpsee1Im667YZUO+kRX1HNueKMZbXW8cKfJN//gXFStKEg3zNSpHm1V/mMTdlPIq+GtP/Ttw6kvWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747601371; c=relaxed/simple;
	bh=9hDqs9MMwZQUfnXJWU6RNr0cphKaLTZ92d5yRHYEm/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcnNCP+iMoZ87sJCJsd1lPXjvvqV6OlgEShj11cC0qxe1aCwAaxSKr6CG3ovKrn9BI1jaB/Si8Rl/nLGLL/NQmTYZ+7bQROPs8LyJWv4z9TY8jor/K/g5c2qBxhvrwwN2Tyh7InODb5Q62GgIqhKhJlYKbR/KlFxxHifFN6Fuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DB7+ym3s; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DB7+ym3s"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-551edd96410so137888e87.0;
        Sun, 18 May 2025 13:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747601368; x=1748206168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeTW78MNqvGftN8fIK5MEyPv1Alh9zRjNLUlVM6lYBI=;
        b=DB7+ym3s0HOL5zlWqV8lcGVSfjsEKr7tvweYLyig3UMyV+eH4nu5D5TI5ibWMp1EqD
         CD+Mnts9B3oxOrp8pktbupKqD5+0E+xS271whJDEk69TMLzj/uFvTA6Fa2v/mjttqjkz
         VsUWwlU47GObUEfDabFsm+VEN5TcNl23lz9Ul/VzZkv9LxRpGPrXj6B/bxcgJgLQUA0u
         vEYcStWIDCK9wJk8H4kcthqRE94GbwC5c7La4LNCy9fgj7owSNmuoFPOQAMWgcvWAe2z
         2oD3/zPOhOl2PqPPRRBEDI+jjGK8lXKEaxNzMC3Dp8VL6sHlmmZJFq8mOc//SuqHHJi+
         G6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747601368; x=1748206168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeTW78MNqvGftN8fIK5MEyPv1Alh9zRjNLUlVM6lYBI=;
        b=dRTmVw4gucCI09LhDda71ohACoCNdvaqBUFszQ0W8FRYxILf3NUkeQbvJZuG/QdRRk
         PGVyDL/TfXpZtUhGdrtCSswuuKzP7/Bbu+YZv78BiEvyj/WqzAKH5pnh8Ylzs+DFMfJU
         00y7edAP++d1HOfPqQl6yUsnFAeLhoTgU2KkzzAUaknTyiGrI2/W/Q9eQSIEP/uLXHOU
         YEvixRqMhc/rHuYK7hLO0nQRP3NfhzWI4Fn2VSwiTDWcgAQY6MiK0mvFEe1V8j/y08hs
         fTvWUiD6uM8JeYEJtuzdcknaTYqXuiBjBfJJttejCw+0l6gBJCYm4xF+LaIGf6JhY97u
         j16w==
X-Forwarded-Encrypted: i=1; AJvYcCX+qbYEOXvcTarlGrQ75u9wyEtWNKO2J4rRWNy/Y1CFplAizYU9eu15AtvJwoN6CKGb/avPUOL9iIy0UDjfJ/4=@vger.kernel.org, AJvYcCXii5wmZo7YtmG2CYBY6pLRQpb2gXFCkKVlxnhqxgDujQtdkXV/hNlcVA618itRGN7nse5iNllX44BdH9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6JVgxHrK7EkMhyqHjOwk2xYlRjdh7+a9FeRJcrzjHdiguevb
	rz0YFeZ3QrAoN0upRcl69tEmMLf+yBrFp8LA5JFneRNmvZqkhzhjCxiPiF9wqtIbiyvIOw5fCGF
	Ij87uCfvGzVPWhWiarz2VMQ4bx9VnkEk=
X-Gm-Gg: ASbGncukw1cwXA9ZHVOOAyEx+izlAVVVJYxT6RBJMSmFZa3i9LzIFNRRZbqbfoSLaCX
	BKnz+vjcMsDKhsxh87Y7sxCelenbgun7YXOVUjTyBmlg8ppgpBc8tqH7qp02NgRMxlPa6+4Uenn
	Cy+TjuyL5L7LoekZrPGRLSnWryO/A+l4Mn
X-Google-Smtp-Source: AGHT+IHOUWvH5P6pr3+FMKh/oIbQ2Purj5IyCXX6NEgLiQJbQOvLGvjRhJ0QMHLsYh5ZTEXp/6SBSLR0iRekACMe7JA=
X-Received: by 2002:ac2:4e07:0:b0:545:280d:bfdf with SMTP id
 2adb3069b0e04-550e71987d5mr860310e87.3.1747601367404; Sun, 18 May 2025
 13:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aCMYI-phNWE1PZGz@pollux>
In-Reply-To: <aCMYI-phNWE1PZGz@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 May 2025 22:49:10 +0200
X-Gm-Features: AX0GCFsPvIzjgU4xaD1UZ7ksRGyiNG8cs1NqfPsDDytDJErIqSHUvwTQcZQCmj0
Message-ID: <CANiq72nr_uE3tx+UhFMjE1zaXOhgJnEECS0sTyNyxqNxv97zKg@mail.gmail.com>
Subject: Re: [GIT PULL] Rust ALLOC for v6.16
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 12:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
>   https://github.com/Rust-for-Linux/linux.git tags/alloc-next-v6.16-2025-=
05-13

Congratulations on your first Rust PR!

Merged into `rust-next` -- thank you!

Cheers,
Miguel
