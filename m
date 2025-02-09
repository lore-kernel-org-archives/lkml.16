Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131143A1B6;
	Sun,  9 Feb 2025 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739120504; cv=none; b=RyxPi5CyuGuMKQXkmarqXw7SsqnVOlRv6c8IIxe8N/vV3E/cbUC/wnd8WuRI56MFbFgzZnXMazv0Y6GLp+0+VRZMzlccKQfJ8Me2TFp1kkQs/sxdGh5eHYvtVJnnPSZge4SMsvO4Mhl4PnNUsEVev+tzAICTTl4Id7wjjraBOvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739120504; c=relaxed/simple;
	bh=lJ/YSHulpluAPORO1ftQRzAsV/sAmN7D/2mUlPNhs4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGkUyuILzSx0m2iAME78ZVd90gw5cdXrYlZFedAZHfW4Iu90FftPcezJ5mWjWdBZ0QityXRMN8FbM172a6Gr0wofFf0V1874aHXjnOX3u1BfL6T7ADnV02ygU66jJfcJYxmZ2F+xUUeXgWYX8jyBuwTj27jl5FK7GPIk7ywtHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCJn6Loe; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCJn6Loe"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9dcc3f944so895342a91.2;
        Sun, 09 Feb 2025 09:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739120502; x=1739725302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ/YSHulpluAPORO1ftQRzAsV/sAmN7D/2mUlPNhs4Q=;
        b=XCJn6LoeuzXpdhDJ/rOzy7bqrwO/PST0LaZMqva38q/c+gNnleFx4INRitJi6+iVzZ
         L3Ldcnzjfnl8y8IBkFUzG8eabBmSP77do8unZc9B6cPQNc6dj/iYeoR6FSlK/2tXwNUr
         u8soekBehrj6YqXB3B6bppE1u+xEpb9pZPqjIFZEaIIfwBSSo9JNOOD/0OOcXtt4aq1/
         vulCo0gmtrHMKem52y+o0NIx+D1YRCMx8oKl0MGWlrGYys/xficTG8fuj8B5+M/9etmN
         bFCoV7oc0LU9u28JksZ6SH82P5w8LNUAX+BbA7aCzCEvwcxdvABCDtOTJOystsUhcEDd
         fnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739120502; x=1739725302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ/YSHulpluAPORO1ftQRzAsV/sAmN7D/2mUlPNhs4Q=;
        b=r8S/2jP8fp23qbfHO3YaH8K8einUb02ybPveXWMTeeDSik27N88o6Y0q/jV4KQOD4C
         0FqYS8ha1VXirOZo21zKzaJC+jRlmHsPFx8HhU4V+C4W4RvBu2UeiwdNPzxA/MYBj1q6
         obslzyBc6IXulXyGPafbRLJxYMWIaaRy+3XDiHArOI9tmnUcn1LgvsITK2ONgSL6B0Rv
         z8A7LaUFJmVte+fDnlVR0LmX9FBx50ORweq3vbFWVmBREiubgZJdEg57iTBeQI6vDmhu
         gG6VeqDhNpS54xyQH2CYmWZU9SloNh1vRyNCGBwIWZuGohiELDbH1sTnsjVr4J8JlUrE
         ae/A==
X-Forwarded-Encrypted: i=1; AJvYcCUw7qzTRk1rTQ3trJQPii5Iwll0VpaDtZmW5+XX8ZlUTzb6XcXPl1Pdksb8GvRgSkRxUwQYCG+WJQ82IadHY6o=@vger.kernel.org, AJvYcCXpGQLKEM+th0HISnZXcsZB8N+a57vP+B3jhp7SzRj8TE4lpGisG2xMoHUMWq9k5dRHq8OZtvwD8txyPdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwrelhvXLPRuKKRHoqeNiA1mmpOc6rnIVy0F6lnInstvHilIN
	SP7qPsy+ZShOxMlR80au17R2BALzeYLC0ixGUiWDQ4lHWpcJcQkJx06KHgVMcQ6mCVGKbnqCpoV
	q8xmDDSzN2KPXJMOtDflTazWM1gw=
X-Gm-Gg: ASbGncvglXpvsNh3b9Upla9YlNFLDfLGEs3kxBbGkXLL5G1bRGhdZXPbJybxLZXoENG
	4Up8Mo+uN9sr0c1wwwwIiJVp3AQDRlljc6diNbUQlVGZn8krGQ2nugXc+eHtKxLKWt7gCMxif
X-Google-Smtp-Source: AGHT+IFKIwO5VBTWsnt/qkewHZWPxI3pViUPDyICGUFxxHAAq4HI4ZeG+WoxodwO4IWIQLoqL9fU1qq1ve8HpYxo2Vo=
X-Received: by 2002:a17:90b:1b44:b0:2ee:b665:12ce with SMTP id
 98e67ed59e1d1-2fa23f5ea82mr6534568a91.1.1739120502271; Sun, 09 Feb 2025
 09:01:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com> <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 18:01:29 +0100
X-Gm-Features: AWEUYZlcJ_oTcDwwxWPbzaXMeu0I1PJe3ql1PLglfvsPrWxCHeOfn9WSghksYj4
Message-ID: <CANiq72mgYL02C3TUn1q0MK2Yw2OCZC7yW7QNEgB+x9E+BKQHdQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 5:39=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> You're right to point out the difference between `kernel::core`
> (module) and `core` (crate). This confusion is solved below (because
> it doesn't actually depend on the `core` crate).

By the way, I didn't read this sentence carefully before: I was not
talking about "`kernel::core` (module)" -- not sure what you mean by
that.

I am talking about the `core` crate in both cases. One is the one we
build for the kernel, and the other is the host one which is used by
proc macros.

The difference may not matter, but one is built differently than the
other, including the `cfg` set differences (and at least the `cfg` set
is used by rust-analyzer).

Moreover, I think it does depend on the `core` crate, at least
indirectly, since `std` depends on `core`.

Cheers,
Miguel
