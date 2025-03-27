Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2342B17BBF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092297; cv=none; b=Gq0U6IDOERbOEiAd+faMJj2h8hplvF3fjP9zwviB3a5jK/1EKwlMC1McIz0FXHSNL3zzlB6gxnfmRAh6spY4BJmIbVMfeXvzotJqipskglXFDeNq3uu517f05bslurcadDmVpT30KgZsNFnjlAZFPwKdMUnDZZ8iB49O0Nd9KbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092297; c=relaxed/simple;
	bh=mqnEF3sEPkpqCxNnwMjJWdaf2hat+YThq07xRZFUJb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9mdaI7idzVzidHJ667S6HyPeNpnu9DCiaXX4vnrdrLqTWAJQ+wSm6H2S31bmWVJqFUyNvyLRn/76fs7RF1EPd+kV8ZyGrq225DYB8ukFlcPfAvEwU4wdULulhTVjH9/A2GaosF9ldGKnVYuvkP/h2H3sB3vL6ctkwvH7My15PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BIpapE5R; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BIpapE5R"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5fc447b03f2so334477eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743092295; x=1743697095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqnEF3sEPkpqCxNnwMjJWdaf2hat+YThq07xRZFUJb4=;
        b=BIpapE5RyVzk6V5S6VXODc9xlzG1qwHW5AlukVCmcjJDLTP896Sai/vyirlrgvy6iE
         CF4mEs0HJxCoVC3M0SQdDY3UIXtC8HV90jlJP96dtAcFD6ulsRhs8RU9gRaJIGW0ShFH
         hHrS8wp3dx0Ohos0mX0KqtjMf6qWjmyoU6Ym2BAc83cOO879ohQdU0CArpDhFG6nxP55
         erPcGfiWu4gST2PvJg3O/60MnArs0EKV1+Khi+yyBdXGXht6ca5U8gGf/7Gj6z5vbf13
         5G/DpG8nHXkhgkDI5k3B2XeeLtG8DKlKAj1wne3lucY8aQOnE8wqvXfyWkTYBTGBRlFB
         t/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092295; x=1743697095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqnEF3sEPkpqCxNnwMjJWdaf2hat+YThq07xRZFUJb4=;
        b=OJbKtwxcu/39owj71qry4Boj503yOuqs80O4xH4jfotrQWooPzZB8Sz8L34tIje+XD
         qoI/zHmz2zCLa92hMEXrzyUUCBGvERPHaR0eoT1jZhJZTe8ajt4wNVVd40hdR4/9FNLY
         LSMmw0Wvz2WP0rk3NzJaGy7k4J65dgZH+nBWpYxvmmjEUDkCeowN7SielDvlzJsnyQgv
         L5641s+8SbM/Y5nG2jXXyelIkjqxxJutix6got6Beyx/Vxf1kgZRv9RptcJLbm2fhdP2
         CYc27anIn305GMxtxYYMzorflCwu+H2TD8CcgLwV44fdx8RKTScSfrela6EAV5a2pL9Q
         qfww==
X-Forwarded-Encrypted: i=1; AJvYcCW5t2/6KyzhcX76IMA0p4BZRS587sdX7WeW0pXfI4CFslT95ghguH2q1DYSYARxnCS8z2E+On24dljdsN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85ATCnU1QQQBiOKiaaBQhv61JWjS44dTI1tD1Vd5z/o8WrxWI
	opj8ZMWU32h0aGo9NkTnFC7J4VLmiXy9hAE/ybzDKWfzasi4ltBsCildGYuFtmCos2XNO6Ml1+7
	r6BMgZ+p0uz05eQvI0STnZfg3JrC4X9NsnaLP
X-Gm-Gg: ASbGncvhovV83IWCnmqDzuT+1mIsXM3nR2GgjMn2qIlUXE8vW8xxU+CoQzWeBol+fTC
	+zb4W2PhRWwUlDzc2DiQrFXkyoCnWmJgTcx6mARx+lGK2nri8X0ELe8xPEq/OgjHAY10EXYVQm0
	NhfbUT0P2POSKdOkanZX4gBAn4o0WO4JM1Cja1N/U3kuLaQkw4JEG5PVX6
X-Google-Smtp-Source: AGHT+IHi/yk2VLxWNlRgQHIdydvCFdW8Pn4TABTgo0AZYTWi7HVy6oo4mtI83E0GardJ1MPFVXWR5Xlw9TlArgIgINQ=
X-Received: by 2002:a05:6820:6704:b0:601:b2b6:aa5 with SMTP id
 006d021491bc7-602785c979bmr2021645eaf.2.1743092294836; Thu, 27 Mar 2025
 09:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-4-bqe@google.com>
 <Z92N8dyIE42ROW2t@thinkpad> <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
In-Reply-To: <CANiq72kYzx7JTVqrJuP0Wo9=1qtaN7s7fqkD5DDcjA59SgMizQ@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 27 Mar 2025 17:18:03 +0100
X-Gm-Features: AQ5f1JqK4tvGF3XTiYKmmHBK6VonsiKsvurd5yTSrJFY6pmEub1Sn5wAN5tQNz0
Message-ID: <CACQBu=X2KFNO4r_jVNLkCFJQh1qh9ErGN_BJpYOvJF6mHpE_Ag@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: add bitmap API.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, David Gow <davidgow@google.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 7:50=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Yury,
>
> A couple comments in case it helps regarding the docs/comments discussion=
...
>
> On Fri, Mar 21, 2025 at 5:04=E2=80=AFPM Yury Norov <yury.norov@gmail.com>=
 wrote:
> >
> > In C we separate declarations from function body with an empty line.
> > Can you do that in rust? Can you point to a rust coding style? Do you
> > guys really use 2-whitespace tabs?
>
> Please see https://docs.kernel.org/rust/coding-guidelines.html.
>
> You are right that the example block you quoted should have the
> formatting fixed.
>
> I am not sure what you mean by separating declarations from body here.
> I guess you mean variable declarations in C vs. the rest of the body
> -- in Rust it is not done, i.e. declaring new bindings in the middle
> as they are needed is expected (and sometimes needed).
>
> > I think I already asked to make the test a separate unit. It's amazing
> > that rust understands scattered commented blocks of code and can turn
> > them into unit tests. Unfortunately, I'm not.
> >
> > Please create a separate unit and test everything there, just like we
> > do with normal C code.
>
> APIs should have examples, ideally good ones etc. The above looks like
> an standard example, but maybe I am missing something.
>
> The examples are meant to be documentation first and foremost, that
> happens to double as a test (so that it does not get out of sync
> etc.). It is how we document everything else in Rust, and in fact we
> are becoming stricter in requesting more examples when people add more
> APIs (otherwise they never get added :)
>
> If actual tests are needed (i.e. on top of what examples provide),
> then we just finally landed in -next `#[test]`-like support, i.e. unit
> tests that can be written separately. We try to have tests as close as
> possible to the code they exercise, too, but in some cases it may be
> best to separate them (e.g. if there are way too many).
>

I tried this in today's mainline and got errors "undefined reference
to `bitmap_free', `bitmap_zalloc`..."
Is the version that landed in -next fixing those? Are there known limitatio=
ns?

> > For find_bit functions we have a lib/find_bit_benchmark.c Can you add
> > a similar rust test, so we'll make sure you're not introducing
> > performance regressions with your wrappers?
> >
> > Please don't use KUNITs. It's not ready for benchmarks, and tests built
> > against it don't run on major distros.
>
> Cc'ing David here in case he has more context around this...
>
> I agree having a good "integrated benchmark" system would be nice, and
> being able to mark particular "tests" as benchmarks etc.
>
> Regarding distributions, it sounds an orthogonal issue to me, but I
> may be lacking context...
>
> > Are you sure a public method description should bear implementation
> > details? I'm not. If implementation changes in future, the public API
> > should stay stable (yes, including comments).
>
> To clarify, it is describing the invariants of a type (i.e. it is not
> a method description).
>
> The invariants in some cases refer to private details (e.g. typically
> a field), and whether to allow that or not is something we discussed
> several times in the past.
>
> We went with allowing the `# Invariants` section to refer to the
> fields of a type if needed, as a practical decision. However, if
> something is a "private invariant" that others must not rely on, then
> we should still point it out explicitly etc.
>
> I hope that clarifies.

Thanks, it does & I will leave these as is then.
