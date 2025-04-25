Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB2646447
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597893; cv=none; b=mD53tk+UnOZ+QG7jIceLBWIdXfDoKsBww8XEHcnkoP5WjiAya4xKUBQ+FsGsyROTfNHsJrp29wu/xBg7nmv9k/RZbryrmNlL6eWqIJy8J/X9ZUQHlqTAYveJmEtFUkgIISXrUTuAWNtL4j/Ev2yobKn/aisLoknsp+Ho38s9TVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597893; c=relaxed/simple;
	bh=hhEdWx0TaqieccjRrUOTOXqth7/WBsIJFh/aXA9jJWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDaW9roFiIPsaSD6pEq5YMDU+xhYdRvVsEqkB2tdBP8xaldTxvBcDugqjzpYaHzovxJY3SqrumVyKjRlSSArsePmrkwAjjdZ+VkzPsfFruwuipAAW1dPa6oZVB74Kcw9YiiNpXpExSc+Gu+awT/kQEvHhNELKNEayWzwWm6Ga80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ee0J3nS5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ee0J3nS5"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-603f54a6cb5so1572085eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745597891; x=1746202691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q4Av4wmnoBep6EgOglIhCSztC30QmirhqKqHb5xtew=;
        b=ee0J3nS5cq6Ftn596kPmvG3npKT0Cku0YYZCxNydeUTeB6v9qC9WybdOUqnhDNl08y
         AjvD/r6hAmjeplAn213d6OgDtI92Nm2Z+GOIjpmFgNBRVvj5eW5B8eNGMpkZLQuVxVkI
         3vNTGr3LI1NKVGiOkyBE3R4SkSFu9Vmuo+GYZh7FNRhAAz1dYc8v/kasXgSj+rpdeIki
         f8BT8pNljbahCOcLhui749lJyBuPLGv5PrKrFwBW3axNJeSZxcUOeBIUktXYSyXEYnyQ
         fUpQDhzc5y/d9o07OeL3Jnda8nazEu+waXxtdeGZnriELqd5Af+uoFvgNBCDG4tQSTdB
         unTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597891; x=1746202691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q4Av4wmnoBep6EgOglIhCSztC30QmirhqKqHb5xtew=;
        b=JWwF//WSlzf2WkpbxQdjfn2JOu4BIIZ9v8dPX6R6fp9N0QkOnkj2fivSViZRXLPSPF
         b7zv+udJ6m2Pq5n3voang8eyr0NqZoMfq1eyuOGoXKA+X8hBZUZsoH6AwSr3TB3nibP8
         0cmuSWCnQrvFV3y5OsTnMHjlkUSZZlfhhhEKwKHzY8aQabvqZumn5lyvTKJC/D0u9R4x
         +gKatiB1W76+Rc5iYX8FfVmU8QoyVFRC5t9cvBYSLKoUihRj9Ju3aykbQave7sA9edTE
         QvktpFstaToPl0VF9Fg7grZSj3V3snAXYeWJxVgZj8tNVMjjKecoUB0wWWV/UK9DXGMl
         5CDA==
X-Forwarded-Encrypted: i=1; AJvYcCXdUwHZ0wGTyF/R7n+ShUDZGDVvAi6H3wvM7enqi58S3L6SOaMislDYO8JYFObN09R6zwAc5sJ1pZdQ6h0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9APdVlyunbKzQ1JpzImqZhBqHAO30Z8NnTs+uA4uTzzDhOGR0
	jrr0tqX7r8okZ4qne5tznDobei+koos3rLp9Af+tlLd3JjTSZj5lym4JuyrkSiJmeNEKXWcZv7R
	G29TRKuoSMeVh8/+OEx9PfoWLbOEB2DN8eiMT
X-Gm-Gg: ASbGncv48ANRIi9ZCnfQtA7muEag8ouQklaE9lyeA2LaEQzQQdcKeed/RwSadXAowRm
	UBoCC7JeaLZdNpyzxYxge6g7zMaU2/4jAn5BldIpNcBPYRdY7hLKjsQSZbQpnhgPnn4yMx7q287
	9E1pKEWdnO+nqMmPm8g0aJ813pGpr2Z9mq/k8ZSK6GOISDp05uKLIJ
X-Google-Smtp-Source: AGHT+IGqWRa/7c2KqEjb5hiyHawUo4fzpKV/pkm6d4gqjAOjZbh6IUkmqCktNNCRdOlKFw7jutwgYNKijcI5os884Ys=
X-Received: by 2002:a05:6820:2718:b0:603:f191:a93c with SMTP id
 006d021491bc7-60652bb5ceamr1904747eaf.6.1745597891207; Fri, 25 Apr 2025
 09:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury> <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com> <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com> <aAuR_0om4FI5Pb_F@Mac.home>
In-Reply-To: <aAuR_0om4FI5Pb_F@Mac.home>
From: Burak Emir <bqe@google.com>
Date: Fri, 25 Apr 2025 18:17:59 +0200
X-Gm-Features: ATxdqUHNtjY6ZnBKg3jtnOR2VaCVgobpi0rSgzf58d01Twx5mD5WIYm92bZEv1U
Message-ID: <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 3:45=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Fri, Apr 25, 2025 at 02:20:13PM +0200, Burak Emir wrote:
> > On Fri, Apr 25, 2025 at 12:31=E2=80=AFAM Boqun Feng <boqun.feng@gmail.c=
om> wrote:
> > >
> > > On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > > > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > > > On Wed, Apr 23, 2025 at 6:56=E2=80=AFPM Yury Norov <yury.norov@gm=
ail.com> wrote:
> > > > > > So? Can you show your numbers?
> > > > >
> > > > > For now, I only have numbers that may not be very interesting:
> > > > >
> > > > > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (=
sparse):
> > > > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > > > >
> > > > > - for sparse find_next_bit (sparse):
> > > > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > > > >
> > > > > This is a VM running nested in a VM. More importantly: the C help=
er
> > > > > method is not inlined.
> > > > > So we are likely measuring the overhead (plus the extra bounds ch=
ecking).

Alice and I discussed that it may be better to do away with the extra
bounds check.
Micro benchmark, for the upcoming v8 that has the bounds check removed
(and the test changed to >=3D, as requested):

[] Start testing find_bit() with random-filled bitmap
[] find_next_bit:                 3598165 ns, 164282 iterations
[] find_next_zero_bit:            3626186 ns, 163399 iterations
[] Start testing find_bit() with sparse bitmap
[] find_next_bit:                   40865 ns,    656 iterations
[] find_next_zero_bit:            7100039 ns, 327025 iterations
[] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
random-filled bitmap
[] find_bit_benchmark_rust_module: next_bit:
4572086 ns, 164112 iterations
[] find_bit_benchmark_rust_module: next_zero_bit:
4582930 ns, 163569 iterations
[] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
sparse bitmap
[] find_bit_benchmark_rust_module: next_bit:
42622 ns,    655 iterations
[] find_bit_benchmark_rust_module: next_zero_bit:
8835122 ns, 327026 iterations

cheers,
Burak
