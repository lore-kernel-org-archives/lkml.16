Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B2119DF49;
	Thu,  6 Feb 2025 18:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866194; cv=none; b=d6L+/7INtg58O3Kha2OHSL0e0DiUYzs2SgvsqSUoExwNhAthcgNMkkhMet/aCAcx+xx46A/PkjagpEMD7zFR7zVT0FMWyWstiWbOxuIHVMKYVqSTqibtrv+KUmKguGyoSzbfPVzwXhikv7ODwJNDuen8RhFiK76lCA56ohBSN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866194; c=relaxed/simple;
	bh=NGWWcTOnRxKvjP1ZHS+rmLqexa3JgWq/3tiCyOgRkkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFV4xsZqlL6ot7PtXh2AN9fXn0yV5UVMNROlZqGA1kTZK5szQCFnVFJEYnQdLcpkx9nB7PvxgYR7yRH65Ow4F9f7Y9yFcezyHow3RywrrvfIQoi5fiBDEB7n4ewos6fvibtt11nodoTyPQCWgK0l52F3CkGw+HTYvJmccKFXlOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYkHMzYk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYkHMzYk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f45526dea0so243362a91.1;
        Thu, 06 Feb 2025 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738866192; x=1739470992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGWWcTOnRxKvjP1ZHS+rmLqexa3JgWq/3tiCyOgRkkY=;
        b=jYkHMzYkv3LwA73VXuuQXuPkbFZ2fCQ3JTpJJy8hj6Sd+uvBuahXlUELE7Kur/hLzb
         Q0W23rBdV6PYARzfccLNGoW/a59/TbO7ml3GBHEOG52GmcMW6sFzpP5kYxqbpSNqIZF5
         2+DelzxF4/1IptNyMpjy3gsLMT/f82m0oikgiqoAEgApLZ3WeIEKBcF/vOCBiyfAT9Ei
         R8IJ5fC5abYQSae/MD17DEMQueYsYMmpmEUhPUe5d4elYPUKeCULi1BobpkVb/DpLMhy
         t7kmVX/pQXyIZv7Moqqe9795alUZS7aNYWLyLGg+LSUfYsuVObOIyYTEoE7eeyMImC3d
         CkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866192; x=1739470992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGWWcTOnRxKvjP1ZHS+rmLqexa3JgWq/3tiCyOgRkkY=;
        b=gsXo8b0kq+1pxoYmZME6sW8TR8K3vRq0MljTqo0gwRlcrEoJnJvjPYjyUAhUxy+pE+
         ksxUV88njDdE3HBR1miJvNiErfAkTVXGUSYCV0haELLp49N7puHwSzCUbyw5tzNimHmj
         BKQQqtAsLeH+TzliT4Gi/AFT1KVltqcCO3CESxi5rbHqlVB82rpolAfdIEbZoRloZKid
         SpirBC7NgXBuu/rx/NQXrPA8FCkJFKS/Sz4KwxSmAWFbxzkIUbSRJYBfvVCWA8vuob75
         WLdjNEPB8Ya3MYK4DYZBC2ZlbaZKisvDoYNR2Cw1sxL2yyYmZGjpx0qEediv7lDecWiO
         Aizg==
X-Forwarded-Encrypted: i=1; AJvYcCUijxBX83ZXWCWWW3TABlaQpm01o2iXsUq5thmIaQhe86vyMzYLAPj/W3rDF9XS0QguaH5f5/08jYZjKJs=@vger.kernel.org, AJvYcCVdTBu8jgUSQXtrej6f6u3/3x/N2hYeRb7QHqo5xflJ7tMlbLLjnArxXBDglt0V8wPsCftAuiajbZDUbsw7ZvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDfe4h0pQSNI4sLEBkLiuQ3URWdevZ5b7bljpUsZqqgtW+GC2
	SN9inAJUiSWU5FuGD54QHDJ4PlcUNANDeWa9Vg2V+Vuswzu7GoG369ORa1Z06Tu86OAITjDac5q
	6LNW7U0D46lWrtwf9ctQS1CozxBU=
X-Gm-Gg: ASbGncstk4sJhL2xx3yUv6iufGiGYg/lyx0P27ZTZ9AxkAmhSjyIidSdJVmSzvK00uK
	oOci69tqmZPE8g2YMAzVxctXa+I1NxrShJFw37vgsdxGaVa7TlGiyu44QxEcSd/eKEWqdVzzr
X-Google-Smtp-Source: AGHT+IHl8Y9xxuRED6e4MqHuTuIwGCZPqF9D8RC5C0QEqt420Nn1YJaD6UsHdqJqttrpTJMY0Ftcz8UoVgi2t6IqLYw=
X-Received: by 2002:a17:90b:1b44:b0:2ee:b665:12ce with SMTP id
 98e67ed59e1d1-2fa23f5ea82mr28813a91.1.1738866192329; Thu, 06 Feb 2025
 10:23:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux> <CAJ-ks9mokMqBYEucYBgL-72c3o=+L7A8O=6Q=cc9JofFEmseXA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mokMqBYEucYBgL-72c3o=+L7A8O=6Q=cc9JofFEmseXA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 19:23:00 +0100
X-Gm-Features: AWEUYZlMNWdIMv55M91tONpHTgm_s1RZNJ2MvwXW1S8s38YV_jiLdhfJ0QtTw-0
Message-ID: <CANiq72mzJbX+_tpqSOsWpgtAeYD0rutVJ2V6u0wDO+zGcB51Ww@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> The note on cppreference addresses this:
>
> > As an example of the "supported by the implementation" requirement, POS=
IX
> > function posix_memalign accepts any alignment that is a power of two an=
d a
> > multiple of sizeof(void *), and POSIX-based implementations of aligned_=
alloc
> > inherit this requirements.

Yes, at least some POSIX-based implementation inherit some
requirements, but the commit talks about the "documented requirements"
of `alligned_alloc`, which didn't seem right to me (in fact, some
implementations seem to be extremely lax (e.g. glibc)).

> I could rework this patch to use posix_memalign which seems to be more
> completely defined, or I can try to capture all this detail in a code
> comment and the commit message. What do you folks prefer?

I suggested going with that "macOS" etc. line because that is what we
are doing and so that we avoid having to put a lot of complexity in
that comment.

In other words, we are changing it so that it works in macOS, right?
And those requirements seem the stricter ones vs. say glibc ones. So
going with the "why we changed this" may be an easier way to explain
why we are actually changing this, unless we are sure we know those
are the requirements for everyone (which is what the current comment
in the code looks like).

But if using another function makes it clearer, that is great too.

In any case, to be clear, I didn't want to delay the change -- it is
just that the commit message and the comment didn't seem correct.

Thanks!

Cheers,
Miguel
