Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031BD2857F5;
	Tue, 22 Apr 2025 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335970; cv=none; b=XEnTp6yXipXRVqMvD8Ors0fgpftzyIG5cKlgokrR9CoQMO253OW2Fe5WcFXOvZHyb7SKi+T1/SxAKND1dSqgOyOT9I9eN1Af3gcOC2/C8FYkjQ9/XHM+eW0Jhgt8sKAdL6MzBoB3owbhC3dZtxme5YM/2ohfSlwDOvf1HQiX0AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335970; c=relaxed/simple;
	bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvIgCumgFk3LDUdMWFPNu/07is4LoMVegxHAGGWscvPAgqKIVnnw/RMC/nTC8NIyEisFdypM82dFXwZrNgK2sAD5nsw54Jqr7HnU6ZHiVLcaw5inBQwwVkAl1OvA13zWufUp5S/GZJ1K60HJlKWR+NLqzI82rlHpZn2FpS6mA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0iJ2KOk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0iJ2KOk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af5f28ecbcaso465711a12.0;
        Tue, 22 Apr 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745335968; x=1745940768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
        b=C0iJ2KOkVRKySklagBbh06EAFQRZdH1Fm6HzzMumn9ezSAkW804tXHVH6z6y55IHbL
         v3IHO+WExLyhs1uPHLbvhSgPLyrWtmHNx4GhEkX1dI0WrZf9qZx2q02fRdYvbhPtyeUu
         O4PZbS+4egI8GK0AeaG/36X7jicksPTiwK/RxD9crZaEcaLNzcI47tGqzkziJQrvcdzY
         8idINGtPAjtkYda1IIMlDkq2CvIe2sKWUU6vGAfHHwcBZycfzBCyNdzN7KdMdnCUsstM
         t+v2XL6dpS5Jt45fdGTatcw54a1o6YlIbOwV9LOvllLnhoUVqoBkW+wQ/eh97YQDQ02x
         k3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335968; x=1745940768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neen4h+Sr7UzQXr/KVLWuYqZab7QgjUeYkFx+38UhR4=;
        b=Y7plJLmo8MEsNa9PdaN8me9Hi1f5UJcCp9r6eeN8/Ao1befO1Yf2D1gVj9mOgrBwv9
         G5J5MVtYRiyDl/912wIIIRN/OghTu/kS2TbsAqgelG94Y31oNeVgq+lzri+euQzCCRup
         amDU2IRVpg2wKNJqvy4iJTaJsBK+ucOcrzWZX1ZESUAlsglEJA/jfwazRNEfqcIcYU13
         WcMhfpGB5l8hZUJ+bhzwL2Ha+TFRkbRERW0qp5mj8aXHoaW1Xf73QEhMCTgzpzYuio5b
         aNffR217aOM4sY+XQ7axUvxr4HIxYlx3u+NhRXFkFpY12CJyDwO0OA8Ahb1UfYIDtfuo
         BkFw==
X-Forwarded-Encrypted: i=1; AJvYcCUKoC85vZJB7G3SVUXm7zbGsY1vBSI49kXIGeD0adiO/b9tVpHGZjVBzw+fZcEnFTw5GHV5nlrYHNvXalc=@vger.kernel.org, AJvYcCXr4WZQBBB/d2TgNPo0ikzWoIFrrfnhbLKPBA9xk0pFuyXmKtCNfzMyNSVYvzHUE01RiAaiTC319lt415sGJ38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3hBLBas41DVHms+4D2abJN6yErReTEg2EcbhXXFaNTjq+p/+F
	x97qw35/9mtcGz7IOmsNHPgjPF3E5F976Fm/aP7hB9fr7vVM9AJRl4D8sSIVxfjEx+dFzlUakgM
	zP/1oKTuMW+xnPe1RZdCUX+LAx9Y=
X-Gm-Gg: ASbGncuuQg1BPehUxC6fRp3k6XG4xTmEstgQ0Y1KkKifzxnX09KAr+/v65NIWjQ04G9
	KuNg+jRw45eTPoMlnAwn9FC2RkroU/HXxc9x9n3ykw3N11ijOdCdQwwYBbxcMyWIIU3JojaGA37
	+0kdhI6kDvTPHijIG3mJFfsw==
X-Google-Smtp-Source: AGHT+IE4k3qmenB2kafCYTV14I6rIbjlGAOhs2dY1THietnVOi9X9wnempMQ5qfY8fdWb6E9LzDysHlOZ2hKTE3pwvs=
X-Received: by 2002:a17:90b:1c0a:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-3087bb3f364mr8784892a91.1.1745335968072; Tue, 22 Apr 2025
 08:32:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
 <20250422125824.30525-1-contact@arnaud-lcm.com> <CANiq72n41Oj4K-yZCWbNXJQEEjTqjXHYgrkffAg_mUg8dKLWQg@mail.gmail.com>
 <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
In-Reply-To: <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 17:32:36 +0200
X-Gm-Features: ATxdqUGLGad79DCYWTc2GUf7UvBVG5jfl201Q-Z7BM1Apnk-7A7USXEN5LtVCAU
Message-ID: <CANiq72=UOOyf-esnRUCR0_gxFptdpNOymCz02vgesdNL7zTvHg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] checkpatch.pl: warn about // comments on private
 Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:37=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> As mentioned earlier, we can reduce the score of any heuristic which
> could lead to any important false positive.
> In my opinion, as long as the heuristic is relevant, we always have the
> possibility to diminish the score associated with the heuristic, hence
> preventing unnecessary false positives.

Definitely (my comment above for this one was just a note, i.e. there
may be nothing to change -- I just thought the commit message referred
to just checking "Return" and not "Returns", since it said
"imperative").

> I think that you are definitely more experienced with what's done
> commonly in rust code. Let's maybe change this heuristic definition with
> @ related to types or some other annotation. Do you have some example I
> could have a look to come in the next version with a relevant list of @
> we can encounter.

What does "references" mean in that heuristic? If you mean external
links to some URL, then we typically use Markdown for those. The
inline ones like `<https://...>`happen in both comments and docs. The
`[...]: https://...` ones are way less common in comments I think (I
can't find one).

As for `@`, if you mean the actual character, I grepped for it in Rust
files with the /.*@ regex and found just ~13 matches, and all were the
emails and disambiguators I mentioned. So I don't think we really use
it for "references" (assuming I understand what that means).

I guess you already looked in some `rust/kernel/` files -- some of
those are really the best examples of how docs and comments should
generally be written.

Thanks!

Cheers,
Miguel
