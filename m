Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5A309A5D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470077; cv=none; b=KBVCcV296MED5d2P6Y6eea8w/hpwCoQVAMMWoTuPIorbAw6nMnSPw6aGAWz6l3nizqgSJoh1Zp3ptJ5Vu7gp75tabwta5w+ba4SkHmYLMC+8FIFk2sksVO+c9Vi8FdqGTtqC7VMt2LiqeMZyz/mFdLwkb3F07VFKngFDpLaIMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470077; c=relaxed/simple;
	bh=R3w2XCZ+9hC/UQRD0VOIOyl0Fwy/AYwdVSqZytDRbyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2li3hvjt8ecUgh0xzaI5KfprTDnZVMeHpo5MWe7tmJeAcuTxm0pLLND2DTjOFHYnAKK+nsqy5Afhf46CtX9jp9ygzgikc88pr72RYJcPXEtV2s2D/x1M04wyqdpDsV6crnWQs8L+r7YKlRVj3B9a8EWOs8IhwfUXhS0lGJB85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSRIFJpu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSRIFJpu"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso7503794f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751470073; x=1752074873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=fSRIFJpuj7EbDCIioeymFx4JpGmeIBGUU8TNs2Sms+ZzpNxPexJaygwc5h8jJjC2kh
         h3GjtjDlVwuNtZAizzbxzdybHmIO5zRDx3J9V9c+jX8C+h648/XqhIWcA1jfPfeZR9O0
         keB+6i+zgTBlWaET3Y3/oPjvY9QcU1WUObl0VHr2uLw2rcSxNCKhF4w909PmbLbf8ysC
         66TrsnLYfhmQBMsy9rErWxotOedb5jOOI/j5kH0a+bOayASKLHwWyC5Dpf+E3gchb51M
         BHdprCwvo3QGnXASC1fryotJTfXSeMS4GadXHyyLduDGbkBw+7t2Td1WtIIsYIxaPDw2
         4KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470073; x=1752074873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=sfS1U6E/aTN+RDcgcn6eaV/0JIqsNr2DIdZlvzlq9SyIGii6XU9iCb5eqn3i4Ie3eO
         H+swwgufuInV29aDxUyOGI5tuxm/SVHEIt00847depycDkwc7kIjq0FqsWV+1ockKcNX
         IMHPdfNidz8OprZUZAHm2pDUY6gzOZ6W4b5F8HVt2xsBaFZnEk0Qmt46IL8Wjpgm0q7n
         ZOgPhbkLkuvjwDDMYZflRCQPOfxXHIwXeN6bniN3WW9wdUKg8TsIgRwSjzRmevKkuKqk
         UVyyLN+lHcsWfQeaEH7RFIkdQNK5oWtkstQefF6n2kFzds3Mi264KziUNs1R3h1Gaf9E
         EaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL1p4NTA+dIi86wOhYCyiNIEIfJ/ToJ6Mc3QlK4c5pf6tNQ7zH3qRMyC/XILrBRxTxTP1UhOHvs4wlrms=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPgRS3KMX1GlrzyED/PSh0GzX4iJ7o4KFvtaCuTS/vPRRJmTn2
	sgmc95Tp1Ka4+VCZ3npLQRjcgzMlzyG8nfdeKdazUJWNkAhNdMJnDGACMzwGbp0Z8eqmR0Wp/pi
	0c5JFz2tF3M9H/XI8xc7CeQog8TwGsqrhYZQN7tjU
X-Gm-Gg: ASbGncufMLWyTn4MOKoj2BIGAOKdcRcZwYDchfB6M9VYnzEiKlZZSjIv5i5Lb7uXCBV
	ZtFjk85KNNcV0QIPussXPpV6wiuaByAJ0H8dV1XuSNMrZHPfzHR4vrjoNU6RRMFxae4f5I8cvR5
	XOvemmX8Bvnu55WZxjDuQTz+0Ty2tEVITt1hVKmFdz95+M
X-Google-Smtp-Source: AGHT+IEXxgvMAbbclIedX4dgfJFsqC/LVdMO+VKlBTNEwybEIPdTuBzGSh5PvnP88V7tuXnmlGMxd5H2vPZ17Yd18gg=
X-Received: by 2002:a05:6000:2891:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3b1fd74c9bbmr3330783f8f.1.1751470073141; Wed, 02 Jul 2025
 08:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org> <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
In-Reply-To: <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 17:27:41 +0200
X-Gm-Features: Ac12FXw61cMF6EsKoC5KmH0MvT9whf775volIzyT9NHNJ14IR5rW7yw5x1K4H9c
Message-ID: <CAH5fLgiOK-zA0qT1dis-BsrEAk96R+E8e_F_361w7kCq_uxn7g@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> > +impl<T: Copy> OnceLock<T> {
> > +    /// Get a copy of the contained object.
> > +    ///
> > +    /// Returns [`None`] if the [`OnceLock`] is empty.
> > +    pub fn copy(&self) -> Option<T> {
> > +        if self.init.load(Acquire) =3D=3D 2 {
> > +            // SAFETY: As determined by the load above, the object is =
ready for shared access.
> > +            Some(unsafe { *self.value.get() })
> > +        } else {
> > +            None
> > +        }
>
> The impl can just be:
>
>     self.as_ref().copied()
>
> Would it make sense for this function to take `self` instead & we make
> the `OnceLock` also `Copy` if `T: Copy`? Maybe not...

Atomics are not Copy.

Alice
