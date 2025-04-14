Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121A623D298;
	Mon, 14 Apr 2025 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636981; cv=none; b=sUo2Q9L2gAW+qn+a05Gc/V6L0dx9qaY5rHpbJUWb8BGA6/uqC/KrxOjINf/tI5HsJYOlrk8lV2llqgL7RqKzLY+7F5kX7xif7lAKWbhakH0sB/zrDYLXYC7d1Z22/FpwtAyiomCl4XSiXujGWw9bQf8W4eUgh/agEUfxtAw/i/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636981; c=relaxed/simple;
	bh=YqZznskXltnYKmBVLbbwElNix3jQOvyAnCNlCgTo76Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ii1moUu7p7pjvVgIE4KanJE+rUwVSPNTOm1n57cXphJ0ySNZPzA/Q7RlpilVEMKxrgbzIqCeG+EIykoGJylWv5ece2rh6eQqzX/lpQn4QajxXDN4i1AgtpxE3TvneJ2Xn++qcE7eTyR2i1jD2SJyhV/9HBR8qjxDbFGlgKz5vsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUBvirNX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUBvirNX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so813032a91.2;
        Mon, 14 Apr 2025 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744636979; x=1745241779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df4ZlcRCkKHa57BJ2xndOrkK/FrGdY+gTPtYXvqZp/Y=;
        b=FUBvirNXlyYNsQQ720KK9CNBXci40wAVWAPRaBmLf4osj6B4EOB0HubByzLc8vbcTI
         AbXNRNGZlXBiKzSkKCVn/ChOXOGN0U3I6xYZR8CHLwd0JjnltyGXK9R54MwtTizVwahD
         VYZmhC3aW6ilhU3PD/wIJ1K3E03t+IdvTuD1Olgrmi9/fS45VnUFmEqNMWl5iusRPPgT
         wU4nv4FG0dYULSGD7Fm0U2Lzqp3pz8NAsOBkjf9F6zxmMqaEqk0krZvWDxoXp+OQUlxI
         uqMJVOibsDw2sCKOrMOythQ4Q7lbmflgE3YUuvKtY3UQyrgIOXBw3/PVA0D657PNmDg4
         EfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636979; x=1745241779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df4ZlcRCkKHa57BJ2xndOrkK/FrGdY+gTPtYXvqZp/Y=;
        b=kqi83jEJHaVMJU46Kr5odwdhDJsgMzfNM5Ic9HFctpY9hFpXkCJb6OHCvlg0Q7dPkJ
         fwBH1K3YaHpFt226KluW96uAG+5QOizaxdRjSoLfeEj18cOtEqjO90SvN56UV1zbYQVn
         70AXMoWIsAzbzHqBOo6gMU0Z5tX7sn1Gdl9J8Ldcr+KddtLGv282FaKAxmQD892+PmFF
         7CFo+Mqw++61SKENmO8FquywHzfvdciRuUpI1WmWLdUfvBOiD3LcWEs6M7YU96WACjwz
         kEPHudE+G2/Z5v1drTPbQ+U8kivAgdKxag8cm8JSlFj3sIUHTdj7anofRL87KHbPQNJb
         XihA==
X-Forwarded-Encrypted: i=1; AJvYcCUmtMlhoE3tFZwTEaoQu2QZ1rLXPZJzcdfD9uMT22jCCCt3bAT1LBgDa4YBYLrtEGq8WXG4szJdy+K1t50=@vger.kernel.org, AJvYcCWEgnC5sM69+xVYQnUN4KH4n/4E4tV6Adg/FU0ODXc2+t0l5Wk0N5x2+GAZR58htUk/On+leniuSGeV+JD6bZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxucz0pVaKoZKaqIl4gtOb+kfY923tbYEeMx5EwF0HRLu+hjEEo
	8ozaVjrZXVotPrin6zXkb37Biq16gAV9piLkelBNKh4mt9BXlZitcgqt7LymAG1AqgFHO8PoKYy
	TPNiXJuBM1CuBon6rFMzcLRtcjh8=
X-Gm-Gg: ASbGncsXiMW5SNCSTzVBbdfYBSqYfrQOmmNZkglNBeSjXfbj1YPgRJIci5imsc5EjlF
	rxbhftOZWwzTxSS5jlvHE31jKz+GtsM6Wnb5X1NH4C0nqmefbdBwKeueHPx7HEHipe5ZrE7aFbn
	rr293zqVJYyxzhhx6prqoRNw==
X-Google-Smtp-Source: AGHT+IH3zMwiQZZF0MrooAxLxss2WjlELR7XDWfoKS8xT5Swj4kCI9USG4kreGACDD6msII1YqtOpACzPgTOIcNg6iQ=
X-Received: by 2002:a17:90b:1b0a:b0:306:e6ec:dc82 with SMTP id
 98e67ed59e1d1-308273f3c3amr5931863a91.6.1744636979074; Mon, 14 Apr 2025
 06:22:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413005650.1745894-1-ojeda@kernel.org> <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
In-Reply-To: <CAH5fLgiF0kZdOYaQi18_LTNx6Onq-5PBomA=bwS0m0z+C0wtvg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 15:22:44 +0200
X-Gm-Features: ATxdqUGEpSrfVFnwvmwXXDxiUjWRT_U8CHO5cnUITp-hEVmYDeKZxvObhfYQwF0
Message-ID: <CANiq72ngfTJ5PTYaJOOQ2NedERrLYzA62hL8Fgw5C4QkuZ2R-Q@mail.gmail.com>
Subject: Re: [PATCH] rust: add C FFI types to the prelude
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:47=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I wonder if it would make more sense to rephrase this section to first
> say that rfl has type aliases for the C integer types called c_int and
> so on, then mention that they are available in the prelude, and then
> at the end of the section have a note that we don't use the type
> aliases from core::ffi. I think focusing on how to use C integer
> types, rather than technical details about how they are defined, is
> more relevant for a reader who is just looking for coding guidelines.

Hmm... I see what you mean. In other places in the document, we start
comparing with userspace Rust in order to establish a bit of context.
But, more importantly, in this particular guideline I think it is
quite important to say "do not use the usual ones", because they are
actually different types, i.e. it is not just a style thing.

I have thought a couple times about perhaps changing the overall style
of the document to have a 1-liner short summary on each guideline --
some books do something like that consistently. And perhaps an
example, before a longer description. So something like the following,
which is closer to what you are suggesting:

    To refer to C types, use the FFI types (aliases) available from
the `kernel` prelude, e.g. ``c_int``.

    For instance:

        ...

    Refer to them with a single segment path: e.g. ``c_char`` instead
of ``ffi::c_char`` or ``kernel::ffi::c_char``.

    Do not use the `core::ffi::*` types -- they are different and some
do not map to the correct C type.

But even with this style, I think it is important putting the last
sentence in the "1-liner summary". Otherwise, someone may skip the
guideline thinking "oh, OK, it is just a style thing about using just
small paths, I will fix it later", without realizing they are actually
different sets of types unless they read the entire section, no?

Thanks!

Cheers,
Miguel
