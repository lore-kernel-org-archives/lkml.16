Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74FB1BC9E2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799896; cv=none; b=uNJm9kl/PNNNyuIxiVo0AViNROkl4Je4F6C8V/K1FF9/qxcg++0ZIApPoGYrKfI01hNFfRhXYq6gcv3rGNREyrupDdQBlfS7KVkTt6YjW0x0bbaIdy8z/ugt+6qid8+sYU3tPtEmdKYCCL5chbmx15qNEA+tIRCQJNzL2BOMUco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799896; c=relaxed/simple;
	bh=/498mwjfnYlCU9pyZvO9bEzZdwQsgiwBm51YqjQFjmE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IisGi3rWFJXSHUkESiKjvPaBdfDTblGbcIZP6e/2CtSlkRjXWPfOcl05DBS0QKqLqjoY2fv/uX+biCfTcy3N8tgrmZRGSb1bcBp1ljTwbUq5kFAukHVg5jUga6HvQip4Z8urUgqYGXWUn3EFlz/D/zFqIfCg9Lk5N+9Vt0DDo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iu3rSvub; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iu3rSvub"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso3119615e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744799893; x=1745404693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj93qOMqFHl3tcMBbmsDJQxqfd74N+Y5rsy/X8u5r9M=;
        b=Iu3rSvubryFwZ4BMUNDRg5vKnlBAIxIlaEe5qjdNGwfMHpu0EOu4ooF94O5EMz97I9
         Yhijh3MLa05ZLnMbaY9ZUURhThdNjYdPufVpZMZG/fKn7LOO1v7sUp4aoWlbdN/8H+9O
         Av6WIafAf+ALhsJ0Rf9zRWnv1cwFtO/jJQqN2vvK1cBqG8IPfIHpPuOoPPiPVDCXDaai
         Ci3RiL82UwCr4uMzZAZTcueWI1okHh/6FyMoX74uL42eIH344w7bdJqX1WEfPlJ9H+b4
         GyJcFIBp3WZV0f+9yocIBid+CmpAHTOqJ4gTSAPvEiMGo4jc355gEh0y+gmhLt9yPy4S
         A2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744799893; x=1745404693;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wj93qOMqFHl3tcMBbmsDJQxqfd74N+Y5rsy/X8u5r9M=;
        b=afC6y3XcQkxjqJ0KXvCLkFZYEQRQHysbX5sVIKu/9ToTmdPzB6r7aFhGP6hMwoYaXI
         GlgTY3AamXJm/oEKSiH6E7oHyGxd12rIfwBsR4PAIDCDtjv5JoS05WCw7m63IAH6HXYK
         0JH526wVKOZ5xrRLmrSfNYb8ItFpFqBXOMWpHe7panICBM17uNjgiakib9odE1inBsgZ
         1lilkohVKbNpqe5ym7Th6xe5KThQFhqwZPw3ya1KogFtGUIyC0RNkexFH98hrCUkJ1wQ
         X+Vrt22RMrpdwsII+bUpknmPwD7Vh+crVw1O+7EqSxY8E6ZRWdrdOQtmE5nfSu11qLrG
         679w==
X-Forwarded-Encrypted: i=1; AJvYcCXO9UdemNktRP44o1VArfXRXIvNuzZzisG1sojyV+68brNkkx0BxO7ZimdVX6kIk+Y8rEO6E7pvptnNMcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmgN1oyR0KpZJXWvYgs/zk/vHz3LIn8PGjO8XP1hi3e93zEmpC
	cPrE/SRtlPKR+HLca9yM2CnLAbULqtB730Ae19UxpS+3LKCqFarZmZko2ZGNpdLAtM6ft4VW3f2
	5pb/oPXUeNhMTdg==
X-Google-Smtp-Source: AGHT+IH32aeGBvg2luv4gbioBUWBNQHausYBBTdgS9H6mIAClBxo2uw9CdlM5sOoYtH0AQXXEFBt8D2/a5SUY7U=
X-Received: from wmqb15.prod.google.com ([2002:a05:600c:4e0f:b0:43d:abd:278f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:cd14:0:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-4405d7f3ffbmr12296315e9.16.1744799892884;
 Wed, 16 Apr 2025 03:38:12 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:38:10 +0000
In-Reply-To: <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
 <CANiq72=k+tZ3ACEB5k9qwJ8ZYu-dXkA3=Lisg1b8ze-2D0STog@mail.gmail.com>
 <20250410132649.GE9833@noisy.programming.kicks-ass.net> <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
Message-ID: <Z_-IkqzGBg_dWvHm@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	"=?utf-8?B?UGF3ZcWC?= Anikiel" <panikiel@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 05:15:31PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 10, 2025 at 4:00=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > I submitted a PR that I believe should fix it:
> > https://github.com/rust-lang/rust/pull/139632
>=20
> This landed, scheduled for Rust 1.88 (2025-06-26) if all goes well.
>=20
> Peter: are you OK with landing a patch like this? Well, modified to
> look like this now that we know the version:
>=20
>     depends on FINEIBT
>     depends on !RUST || RUSTC_VERSION >=3D 108800
>=20
> (assuming we confirm the nightly build works properly)

With that change:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I have tested locally that the upstream PR works together with CFI,
although I did it by backporting the PR to the rustc version I'm using
rather than by using the latest nightly. Not sure if a Tested-by on
*this* patch is warranted from that test ... but if you think so feel
free to add that too.

Alice
