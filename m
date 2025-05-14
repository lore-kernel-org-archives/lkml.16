Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F811323D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261408; cv=none; b=ayjsAs86ef5G2f+i8yJZq6OQC7YQ81cVdA7/XL0E6kw/ymr9Y756Qiwb290T1vxYEvWLWAoCRDl3HtSLC2vv6aZzo9kYLfds5FPu/9j8bVsnUoRnhVfq+pZmtrTedco/iA9UOErD8Pl3j+/+FPGF05UzAWW4ByTM6ldqfNixpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261408; c=relaxed/simple;
	bh=RwTNmCvNmlnw9Kgd5xGr7CHXS0izABe2RbMN9CFXMS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFOYvUWHYD5YSRwBw6pYLEW7vK9MOjUFPUIOme/tdmaHZOysWhI8GAKK6pg6KmqugXHbGOdb0up10J2ZGcTduX6wYKman2BXhnmNZNwyetBaSerVnHx0eT+vxLVr5M4e7VL3G08/TfQZ4yvvSUPPH1PwTYGQvwNhuColRrHg1Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FwniQTTN; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FwniQTTN"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5fce6c7598bso4077a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747261405; x=1747866205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwTNmCvNmlnw9Kgd5xGr7CHXS0izABe2RbMN9CFXMS8=;
        b=FwniQTTNxiGxg9jBgkUyfHCL0ypZMyho/IgHGGK79kk71Wn47gMm0Ozi2K/D7Cd9f2
         r07Sssy6rWd8knUoeas8IMFZfwsq4Hr1As+P8NJmV6Ca23uE3hi0vzT2KsBXF69lJH8I
         7cTTiLmHBbQ2PGIaKL4E4tU2IkD32zEivIor0r0Az875cj/1YhBoqDkldG1TgwP01Owz
         AtgF6S0D7cUAE907Z9zRbSAD7QVgTpLJTSiq8A8bklxq6ROafP9vXwcL89XaeZ3KBRn6
         BE49fqUDvCNw0rwJqcJkdYk9YINLKMpnTBoVngL41nupnKB7aLamR6LwpxFnXJw1jTDh
         VGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261405; x=1747866205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwTNmCvNmlnw9Kgd5xGr7CHXS0izABe2RbMN9CFXMS8=;
        b=GZojebgov+rM/KPOmu7Z7e8aNR++r7tltWri36OL3ZkY0vN8HJuJq39SQ1EdKJa1CY
         WqDMBNtKGA46h/54LOsITbCciw0UalMScLHoSzk3X0vf9MtF7ucvM9YQ6J/PT6KZ17Xe
         bUqoaB4MTG8ItCZEGWX+kmnkk81dxWCtlmlkqVEvYm9Tj/pkEYxiWojmodXv9TekkFWs
         nqqs6uecxaZBtCrrq+1HMnnSUD0CPLMoqxu8KHP+HsGTQ2ZS4O2ChL++xvEEuAW+N9WZ
         ZAn7MerLJafzq+drkJJ41T99o3CD//l0juLCzW7iPT4gpTMKnsxBYhW2CpN6IgiITTIK
         CJEw==
X-Forwarded-Encrypted: i=1; AJvYcCU87Ie/nSqFUfRN/nJFvS+3LgFMc5VdSVMHoffAMzFZcbNaJPtTr49CXd96nDCIKMjmtemSW6OEw9tAWbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5TYUuNpT1OXzXdIJ4XavCjnRH1vrahCJ5vlK1XFSbDpmLHc+K
	MjAvqoSBHbQzlY3j4Y55o8q1gD/M1or3mG36eratmIMIIPi9F2QwhzI2PQ56keWsF/kd+a3I3yf
	xZSGkW4LsVVZsb0BkYXDyGR4/NpdJ80XO6lN2vN1M
X-Gm-Gg: ASbGncsBuuY7OCT+vr57AYQpDTfHmbu0m7QS/cT6i3gyIPYh8Ob1ZyzsgKllWunqfZ0
	O+4xn+B/d6szPMjdocKbImcJmFA2ozJks5XBt958C/nrv+8yia87a/rHPcZuXBo8wpbZN3TRb0B
	mVMOkvFkf9D1nQfk0W4UYvqfJXK4lNnQCO5Qk+rlWkBwlJ4UPOZorLCbNOPs3wGMo=
X-Google-Smtp-Source: AGHT+IEcioS8IOc5TbxfNIfZ5cXjNsWw1XzQAseXhhNfXHRz90x7fLQmbiM1kAMbf0vqYJtrywQKEHAKfnDImrrK8/w=
X-Received: by 2002:a50:c049:0:b0:5fd:28:c3f6 with SMTP id 4fb4d7f45d1cf-5ffc9dbe5b8mr28640a12.4.1747261405302;
 Wed, 14 May 2025 15:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com> <aCUVuXO_jORqlxwr@pollux>
In-Reply-To: <aCUVuXO_jORqlxwr@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:23:13 -0700
X-Gm-Features: AX0GCFvRzMPG5-jMuSJFNadqt7uft43BjTBD2x5kHBJ84bqUjANdigcojvCVTLY
Message-ID: <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, May 14, 2025 at 03:08:21PM -0700, Matthew Maurer wrote:
> > On Wed, May 14, 2025 at 2:54=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> > > Another problem that only affects complicated debugfs structures is t=
hat
> > > you would have to store all subdirs & files somewhere. If the structu=
re
> > > is dynamic and changes over the lifetime of the driver, then you'll n=
eed
> > > a `Vec` or store the dirs in `Arc` or similar, leading to extra
> > > allocations.
> >
> > Yep, this is part of why I tried to follow the "Build it, then hold
> > the needed handles to keep it alive" approach rather than keeping the
> > entire structure around.
>
> I already replied to that [1]:
>
> "If it changes dynamically then it's pretty likely that we do not only wa=
nt to
> add entries dynamically, but also remove them, which implies that we need=
 to be
> able to drop them. So, I don't think that's a problem."
>
> It is much more of a problem if we can't remove certain entries anymore w=
ithout
> removing all of them.
>
> [1] https://lore.kernel.org/rust-for-linux/aCR9cD7OcSefeaUm@pollux/

I think the main question here is this - is it OK to land an API that
does static-layout or add-only-layout first, and we figure out how to
do dynamic modification later, or do you think we need to solve the
self-referential lifetimes issue in the first edition of DebugFS
support?

If you do think we need support for dynamic layout modification in the
first patchset, do you think we want to allow static layouts that
forget things, or mandate that we always manage all of the handles for
the user?
