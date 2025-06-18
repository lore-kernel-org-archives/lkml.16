Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC2274FC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252643; cv=none; b=UAxrBzIiLlOc4lnqetCGiXjF/syfK0chJHVWcBKdlWYtkaVfXEsD3hG+wKzh+aHyPNgxdFEZ+oIifjVD4hqK5oHLBpiz5u3bYgaZfi+3DHl6+1boxfPTVUf8kxqn0Wv8SVgFbKdJcaLypYEhcrObI17AuDqLBZ0MJVz8AQin1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252643; c=relaxed/simple;
	bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvIw3eJ/HwEWyDaJ24tRSOi8M3xOE5XhQ2p/O9QtnSlEdVLumlqZQbsmNoqxcCtz4I0vSpfI1IQvODJlFVnKxbm9abKmPHVCJ2c2FEnCuiJAi0oI9Vx2MDL+MXwQ0lSKHBUFEgWlUrqd99t8mXAk4pLcLymAfFm63/Rv0gAN0Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CBiLosDI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBiLosDI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso4899680f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750252640; x=1750857440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
        b=CBiLosDIHt4lQhD0rnoUCzQWiyYZUVY6uZzi1Ype+YZQEtFyu/ZMDvuqfvL1bYSo/I
         XWiYNI2CfL3IJyOUNRKa6U1GaUyiFID9weCaUio/ThDL14Majavl3augQROtFlRRGviH
         gc/MBBFKZiRd5vrHqsgV/PfLsaG6t7G8WQl1f25KPHaaFv0UVhRDg9ZwFp/N6k73O6eM
         0CevzCtgkBaDp5iLr7e7LaotsEOei9263RFXQy3j0TjNqCcpitFkvosLGgnkHDDY9BxK
         +PJdPXYhULgYIutIpO9vFwITbxbkcyAjJtS4K6XU8AXN09nPLBdi/rBDboi+5googomT
         8bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750252640; x=1750857440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j71+FHwXxzkJNhkEuldNJWlnltsLeZCK4+/HOIEh/3s=;
        b=MUMhHE+NxsaCw3ZXB83o+05gEkwfFLNKnoYmO8YxSIbKss7JgwAyAimk/eRMa0P6Jv
         O4SVtd+xO+A9NunLh9P7XIwXX9FlbrOsAcgksrbGva7bJmhQ48XvAHvOAcnO5+PpJuWM
         CVOv+2zNgudAH570Xk5dsqT4FZv70ouL3+0xOGAfDkbT7BWuPGUqAF9jUnQnJSFo/XkM
         aXYV16haWXcZYQQPGI8Y8AgWieVVDX4ylbcyzIbLP27SD5oSGoKLUzy9g/jj0pMmOcB+
         cnxAtBprxseEucpRsskNvbQBC7o0yT2j+MNR44tTX+UFTCmBkYkIzY5XpTx5mEUaxb39
         supw==
X-Forwarded-Encrypted: i=1; AJvYcCXgx5nWTu8WO5QVjrYfgCLJfzWt/359pJao6PEGI06Z6aq+2CJhXl/G+YkRxFwbFu3YK/RxonccTbGWzS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaokzmKJivZlKz0QLzX5Z4N/fTQK9MobNhCm+4SGF/xf7tGpE2
	+GhN/yo+X8GW4n9HktAi6CmWmdZ/z6AaC2BxZpRQoyhIp0aNtUX+UO0kMSvgNobHouedXmK3TSc
	YrwViref7jwHNkCEn+MVfvuQtkZ30O8lErabreCei
X-Gm-Gg: ASbGncu7gPU3U93qUeT7KtO0udLP/bP56fIivTWMSZL4tW4rSSM5KmO/9DbTZj4pofT
	J2IO5pnMuz7ZUkEgF+3x18bnpLoWh0eoIuyxUBwEzELLnMoRsF2pCu9aNJ39TWm9Z50UGZWd/Qw
	sTER1AFy8ARade82PZcXBjzLo8Jv7RLx96hmms6bOzf392kRfdU8ggJ/hIc1nNlu5kVoRox0UIi
	T21MhI6I5cQ
X-Google-Smtp-Source: AGHT+IE54Mw4btJqPpNbSSpqoTSI6AFGE4jmq5am1hmD9ADgXWf8v89gzNYl8ztGOk9f5H82BKn2Aqr2Hu/1qveZ00w=
X-Received: by 2002:a05:6000:2dc4:b0:3a3:7077:ab99 with SMTP id
 ffacd0b85a97d-3a5723af862mr13358543f8f.45.1750252640017; Wed, 18 Jun 2025
 06:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
 <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com>
 <aFKMXqak-mHraxU_@google.com> <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
In-Reply-To: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 15:17:07 +0200
X-Gm-Features: Ac12FXyzvouXkA7KD80cuhCpPswpg_uQRqj2ZXDFSfljelYYcD3AE00K3wJtTs4
Message-ID: <CAH5fLgggDKUwmU3oCTMS1dQGzA5Whp2fnXoLmbGmNF1W89Ar_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:03=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jun 18, 2025 at 11:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Yeah I think using as_* naming for cases other than borrowed->borrowed
> > is relatively common for Copy types.
>
> Hmm... from a quick look, I only see a few: on raw pointers, `NonNull`
> and `Component`. But maybe I am grepping wrong.
>
> There are a bunch on unstable and private stuff, e.g.
> `ptr::Alignment`, so it may become a bit more common over time.
>
> So far it seems most of them take `&self`, which seems to align with
> the guidelines.
>
> Either way, I agree that what is important is that it is a "free"
> conversion/access/...

There are also methods such as Duration::as_millis(). Yes, those take
&self but &self is equivalent to self for Copy types, so there is no
difference. And even if we did treat them differently,
Duration::as_millis() is actually borrowed->owned as the return type
is not a reference, so ...

Alice
