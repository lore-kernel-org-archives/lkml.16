Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE12E4246
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076039; cv=none; b=mFODgdxSun7aoEp1W41QCdxuzjQgEyu+qY/f6FzhaWmJf8t4CvYtlJPGaZa74IwtJyt6zflbktawXOYVIFQHZ7o6mzpF1aMC5I6Fv2llzT+INUo0JMlMLQeagMT9DDXvXayvXz7xnEFsfZGA0XjHXv5Q3fQOPXofeY/RqB1StYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076039; c=relaxed/simple;
	bh=I+7zHqlcUgl5RQ5alAtZZ1LmERnzYAgseVjcxK+zizk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TaBS6QxjBzqe1Y9XuGlsKNt6GX19VGowIoJFZVoKNt2eO8qkuQf76RZjbDpWfR7kGRMi83tsiu+4lNI9EckgJq5jd1jO4JLUCI0Rm+SPNfzGaXjODnJF3gQEzoQf8aFX5cgQGTiC3QAhwIeNK+F0ry7WabHou1RHpIDCZuBjtBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SqW6QiCy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SqW6QiCy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a53359dea5so3001576f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750076036; x=1750680836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RhKiRlCCs0IRZurAump6WGQZLFAsTIozbu73EzZAuE=;
        b=SqW6QiCyiTMh8CIqdYR78QGHYQByaDlhzWwt12V0QBxTuo4Pma+EtBxS+9GVcx6PzM
         AmFNLWciX0G2AhvgKEygPR1Boyv2W1z1w4vozf5H4NxBggcsr3ViCGC5+t2JEm8z0jvq
         uP5aYUoT4inbcr47MrK+lHX4VyZ94blkSNa1abPVbYdoQnH2CW7kkYUMWH440jQCW+4h
         a3tSHNj08FqFO0K5LxfW9ktQNO4aObeDfywvMRtg6BTqzyUK6k9vE5cjbZCLIEx1oYyS
         IvcnLjylA3rFzB4NWTp0/1kNy9eXZ4YTKrhkeD9JySl97S3l6B7KkUELEWXmN9c+ecIX
         mS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076036; x=1750680836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RhKiRlCCs0IRZurAump6WGQZLFAsTIozbu73EzZAuE=;
        b=VWDTkTjDTNIN6/+G9y6/MMPsf4UYx5mdi/lM6Vh7WrZZw06GSeX1cFOHS0W34L5nXo
         2i6HxWC3194RZB8hlvP2CRMBqHCHvbJdMWKNxOm8SH7YEW4r5Kto/FBga06wBz+/ImHz
         yzl1m/ZHKgfb7UMbM/izjalTX7J1HoGxnFLY3MU6pi5akjt3LGR/e5CvebCJZ/KJdzpG
         Q7fkvMUxzPijdRCo1smDmIcXFoBQWydJu1RYbxHzaW6ssAlCbJ1lJgccAbZdu1yjcznW
         LKo57nHP3P2SsNN2p1yhP2d1MI2NoKX31Wrz01CsErNRXjAaeSiVx0hhZ93iEtFFHxU4
         JeWg==
X-Forwarded-Encrypted: i=1; AJvYcCXDZRyKCVfvdel+SEfr//ET/Ofv6h2C6BDZGnZSpZ6cUIxFlvPblPvUfoVqS1UmhRFLdkFs9NJFVXwc9XU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkfuM2kSdUkUw+45xI9AXfavd3fBXGDAmDSPqUALqRy+OHyLdG
	fzFmVfgLNF37uf62KT5gzItg9L4kDx6RUahoxy65Evwr+bSW85P5xxinSbxVsTceELYGTeElWz2
	L0J40yOg2f5u1APybapxrTdPzWO9e1A2AAABfsVhb
X-Gm-Gg: ASbGnctWpDdtZHeecXfUUR9r/Fa7hzhrH6RbgQ7yieiWSBhx6D4m6dmCZmhjq0xx2Mb
	77PtgQX+kr8Bf12z2cBQLMhGBNlk65wwc0OhlIn2d2UR54VikrInjD9fjqn/9Rr3yRmnqb5eRsK
	0w/lBkSe2wGdyxNBayVPcLki4t6RyKbGyG1n2+9VF8gnNk
X-Google-Smtp-Source: AGHT+IFyjKifnw4nJRdSku3PfjoVUiF1cHVDjz4vD9go7tk98USfWK5+Su8jtqkQ7OhDV/5ugWmX3JcVAUGW2BHxuXo=
X-Received: by 2002:a05:6000:2308:b0:3a5:25e0:ab53 with SMTP id
 ffacd0b85a97d-3a5723a399cmr7284379f8f.32.1750076036156; Mon, 16 Jun 2025
 05:13:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <20250502-unique-ref-v10-2-25de64c0307f@pm.me>
 <aBStYylT7wy9JiDx@google.com> <aFAGeu5FwaEEUZD8@mango>
In-Reply-To: <aFAGeu5FwaEEUZD8@mango>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 14:13:44 +0200
X-Gm-Features: AX0GCFulNDKTw_W_UJNLS2CnL1V2yleJgmKBT2DpUiM6GmIfGgzrQi0qgZyZLdY
Message-ID: <CAH5fLgh4H8mVjjPT3ya9Seop+xnzrwMEfSWF7eEcT3e16oV5FQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rust: Rename AlwaysRefCounted to RefCounted
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 1:56=E2=80=AFPM Oliver Mangold <oliver.mangold@pm.m=
e> wrote:
>
> On 250502 1132, Alice Ryhl wrote:
> > On Fri, May 02, 2025 at 09:02:37AM +0000, Oliver Mangold wrote:
> > > AlwaysRefCounted will become a marker trait to indicate that it is al=
lowed
> > > to obtain an ARef<T> from a `&T`, which cannot be allowed for types w=
hich
> > > are also Ownable.
> > >
> > > Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> > > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> >
> > >  // SAFETY: All instances of `Request<T>` are reference counted. This
> > > -// implementation of `AlwaysRefCounted` ensure that increments to th=
e ref count
> > > +// implementation of `RefCounted` ensure that increments to the ref =
count
> > >  // keeps the object alive in memory at least until a matching refere=
nce count
> > >  // decrement is executed.
> >
> > It looks like "keeps" now fits on the previous line. I would reflow all
> > text in this patch.
>
> Say, this means you have a tool to do that automatically for you? I'm doi=
ng
> it by hand currently.

In vim you can do it by selecting the text and typing gq.

Alice
