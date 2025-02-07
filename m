Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059401DE2DE;
	Fri,  7 Feb 2025 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953466; cv=none; b=Kp923cC1I0mbrxrwxWuOTjY4peGKsVEFnJpoqYaTGdFe1ef3rN9K/zIDl0IcP+bcjIOpdIHN4jBXMeTRUSYCjknVxfFHk1PN7fbarAnwqCohsTuWk8oE0KlgKZY9np1jtI+hYEmqQtwuxRfOg4cR7XmjjpyaO9vAM+H6sjE2jyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953466; c=relaxed/simple;
	bh=MFR0IPXShSke6YzpYs1oNJCsIi+r/vcNrJEnFJm+wuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7OdP3uvJvrZiGC3NfK4MCcHa4KD08ErW80K6uHjh42pLkCjLKHT60BMPBckXQZhOjw4SdR3ULECcHLmzzKqQzchwXcxN6tVjGVw/4+NHjiM78QZhojPWE235ZtquCAZ7TLbR4vxTfUH1LaiSISxlsTLcQgc9jZMnEdIXXaxv50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiTOT32n; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiTOT32n"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-307d1ab59c6so22485241fa.1;
        Fri, 07 Feb 2025 10:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738953463; x=1739558263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFR0IPXShSke6YzpYs1oNJCsIi+r/vcNrJEnFJm+wuM=;
        b=NiTOT32nXVuL3i9AK0rwFCWrgZnKNxPeTuIWNn3qV6q8/LDTBusyQ+icibYe0C5fX3
         Vco17JH5ngQ4JejtP56yaVQs20z2fWlnBPGJqATtyXaeM6vn6/iF2amNaGV2Hedfmf0D
         hR7ksyI8O5y9K1RhPYzHfpKwP7flD5RIpek2Pfodra0I5OKJzGEjVYMWhaUaMcq+oGKq
         NIoy+zQ6c9GD9wO/Oy8DKzewD9K7b/sPh+RhfC2ydCooW8Kr2OxSKBudHlM1Ls4NI/zT
         gcJ36qpBGsE4mdqvHjJMR+DLcAoaUPaH01hVsDoBYd7DJQtog370C8FQX382wEsymyFG
         rnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953463; x=1739558263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFR0IPXShSke6YzpYs1oNJCsIi+r/vcNrJEnFJm+wuM=;
        b=eqyt1YnevfSFh3pem3TCWnoEdEuKsxASf7yIzz/JfhuNO6NBbcMXS5H4doBQ0zoyDt
         7iiTkBHc6F8Qr9M7ScS2FqivERBHI6Rq6nvE2Gr8bpLZnwhN5DyrDSUH/YC8QNTFkIxB
         OZaf+hCJHaXsF4OjLLhcPFgX/GJ8NEg8AKYYzoO7ZvsKMt3rW0fHAVgeKo0zbahn9bI5
         pzVyR8jk/r/Ati1rHSWeCs2I0gTGXikb5muZ26p+AoXzxz5srYeyNdqXKgmpy/Fdkbph
         FQ6M2JMVeC8p1yCA9jNnb+Lhljj6IU25tkA6Z/w00OGjax2NfmTlvS66G6DY+hM/ahzT
         fq3g==
X-Forwarded-Encrypted: i=1; AJvYcCUZABcRyfAxnItcYcrFo3lpDrIzDXRQEUXS+tvpRv7ZRjVQXMhJEK5L5uP+lSYXdrA1sFA4nfBg1G+AkImxz7c=@vger.kernel.org, AJvYcCWuFPj7cOmSgtxfyUUXD4pXWrXPMK8uA1bIIKcNfosRWF5CoUUTfnJt1V7lXrqD0p8SeLOf2GdKlDZNHX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6u/4bFqfSSyJhsCxNouNivlOuFJ+wkX+hs9q9hr3wk0xa7yF
	Lg4RdmQcfH9RtBqkIMyjtN8IDJDs0i29rIxlXl/1NVfwhNA1L/oRabPpPasTs3pLXaxhLrtnEJw
	TyD9EVpRgUp5G01rPk9Ivsp6Y+pQ=
X-Gm-Gg: ASbGncsligpD9t44IodkM8kM6FMZc7k7znJFf4j0mhPiUPzBzdoYHpLD4VGZ4DEyJ8e
	EUezyZRZyM8H2jBoIjLfadUpG1Ac9miCJIOEwB1VxOOPbgT0k6tgqQKKX5xFAf0d4aKAFZYIqFN
	tKi/tXIGRAeFZtcXKd+hs7eMrILAcJ
X-Google-Smtp-Source: AGHT+IHoVTvbn8dfrm7pYO4U7BaOZmlNozYbp+GIewBkEbdserZYKnoFqTZekG62+TNJ2ArFfqEgtXi+e99QPaLJUXY=
X-Received: by 2002:a2e:be8d:0:b0:307:e0dc:b823 with SMTP id
 38308e7fff4ca-307e57f2525mr11803681fa.10.1738953462873; Fri, 07 Feb 2025
 10:37:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
 <20250207-macros-section-v1-2-8f018cb05a20@gmail.com> <CANiq72kGvZkpamxEFJqYO3As5POhrVDonFPZvKu8+UZMtVcvFQ@mail.gmail.com>
In-Reply-To: <CANiq72kGvZkpamxEFJqYO3As5POhrVDonFPZvKu8+UZMtVcvFQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Feb 2025 13:37:06 -0500
X-Gm-Features: AWEUYZmadLr3IXcqV3PDxaX5P46ndbJadKDnLdpl0rLc-otWK8mCWFVsAwZ5CCk
Message-ID: <CAJ-ks9=5Cstco8qdyk2PgTYRhN61aDRtQUUou-VurL6-9jaaAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: fix `make rusttest` build on macOS
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 1:13=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 7, 2025 at 6:22=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Do not emit `#[link_section =3D ".modinfo"]` on macOS (i.e. when buildi=
ng
> > userspace tests); .modinfo is not a legal section specifier in mach-o.
>
> I thought the changes we already applied were the ones needed for
> macOS support. Oh, well...
>
> Cheers,
> Miguel

Yeah, that's on me. I didn't know about (and hadn't tried) `make
rusttest` until the cstr series[0].

[0] https://lore.kernel.org/all/20250203-cstr-core-v8-0-cb3f26e78686@gmail.=
com/t/#u
