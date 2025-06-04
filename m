Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD4028B7E1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030249; cv=none; b=bMYSbJgcz9YauHfiSzhYX48rDGerDnYV/9XM8KZ14KSpLpZ43i3SSZ0ySg07z3YWkq9dOEoV5Qpq2V4xrtUE+kjLKZo8H55vODrUDEgydgnTtkTcprDGelWrjKo5F6Wbc3shzWwbvb8ZvO1DEcOA44UHlbSllgQ9kwqrPVKCT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030249; c=relaxed/simple;
	bh=8lsgt4lYbx9qeHWoJ//m4adykVeulUH7zxixSoJF3wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuwmIaMUN008sBdChYeNhiuebW5cCgpPj4bW48n2ipG3ZOoGrEq5c0WkCJhX5xhe4lKIq0ymJJV97yvulfRTp9vaQnDpfG4iCTcREkpaSGCfdBznO1KAx8oc7Iy95sZDVk1yBGC8sghS0UmdLJQk421YQQ1hrjl5GtLlH0PZLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYaxHj0y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYaxHj0y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so27355465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749030246; x=1749635046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwmXxEStKu/KsGcy7lzyMmwCyyMR9O88p/WT4fw4xb0=;
        b=LYaxHj0yGzDxSwGkcw7mKGAjOC74mfmhvBpTvHTtSlGXX/B7eI4kVQkwcyyaiu4IuL
         LMBbQupfEz+y3oLabV83hImec6FPgngKeghifCa+Hqn3/VVZDVUlePu5xTMGjNyaUXCA
         M6aHxVO2sSbceoFQuZEzboGJOgZ8L+wmaVgH/E5qORGWFN7yNyJIPTBB2l4KTEaeie3t
         jdISmul4bsuuOJWsZC5UPVgDMyxpFX6kj341qWf5lXfsED6KVkQ8zebpfgSh0CCxu4zu
         ov0JD+8j2Ptwtbtsi61QQvswtZsvtMBLkAmuwKJlRgKuSVyxEci4ilbINn886sxfS5p9
         weXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030246; x=1749635046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwmXxEStKu/KsGcy7lzyMmwCyyMR9O88p/WT4fw4xb0=;
        b=ZZ+xc6gzmxbx/f9wMq1G4goAwvcVPUATGvtstbP0hmtO6NZYi5Uxw8J6GypqQ4qJhW
         Xi58wHO025fFmzCb+h3KSgyHmS4MdTtgD/J59mLxdNVTDJLgJ8LmY/E3+hsV82poFw07
         6p07boWT/kLNXJpcGz1xtYp6uRd7yM1cKrIQgRSpzpDz86b8Rqfx8A4LsnhueacrEdOk
         kDii7DG1s0q7Kp//d53wGd0SRNmDMCbrXAYPNXB8W7VPApKVKcB8iV2IiUa9mZ6DUr6T
         k6F/uBhxvOn4pCEnPiNNb0+C9Hmg2/4IlU+97llGNfVuj2dw+v0cgP01wRgsfft5kUIn
         OR4A==
X-Forwarded-Encrypted: i=1; AJvYcCUiLu/GASnl6erDkTkKW+Fdij1hK4B8JBEHS1cARo7z7Jjl92z5A4vcix9m03tCpS6DuAXkgaQAtssJ1Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFpE107QqwoG89kqZsoFFv3mPzYSrqa4S2w7N7QqGIaGmyATV
	yBZBNTmGdM8PiEOJl2IFQ1h0R/hsd9b3J7UZjsVGxEnVURDeMw4+nYJIeE9Z0NgNDSKSL4yQeQ4
	cdGHkga5GAMeaSyUE6zhLJh8K/x3m2PmUedMTdatQ
X-Gm-Gg: ASbGncv2RPzv+G5MRmccdQpsM84XvpeN+sj3sErIam3fqmUDwGDVjmQlBlD2tL+CO8Q
	mmgKQ7u6eTnSrh408Zytb76/ahv3MtiukvMExiLMyg1opBX77YGNUUPX554GUNYZ1cERoohSj2e
	azdy4vLNr/7qy7ZDDlpgin8E+cX9jIpjBZxXcgH7+zLieseCQk/qH8YrFVWTUsupz4fo2XeE78l
	Q==
X-Google-Smtp-Source: AGHT+IHbH0sbOu2aLCykXmUYG/Z0HR7If7xStvI/5Hsw8iqmRB0BuG1Q75yKx8Ud65YPZh31Zc39TybJPsJRkOst3QM=
X-Received: by 2002:a05:600c:6287:b0:442:f482:c42d with SMTP id
 5b1f17b1804b1-451f0a88f40mr17637945e9.9.1749030246080; Wed, 04 Jun 2025
 02:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <aEAUlvPbX9vFWhdI@google.com> <311a3039-286a-49e6-b47a-75f5a173e922@gmail.com>
In-Reply-To: <311a3039-286a-49e6-b47a-75f5a173e922@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Jun 2025 11:43:54 +0200
X-Gm-Features: AX0GCFuYXOtsO_7aTKEy1dYtvgjIP7i0rumgMFrVhehopyYitpLczg7J7iD0CuA
Message-ID: <CAH5fLgiwDTAqZqHgvtC3VqJQVpqDD3ScucCdSn_1gQ9N3MkT3g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:42=E2=80=AFAM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> On 04.06.25 11:40 AM, Alice Ryhl wrote:
> > On Mon, Jun 02, 2025 at 11:16:33PM +0200, Christian Schrefl wrote:
> >> On 31.05.25 2:23 PM, Benno Lossin wrote:
> >>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
> >>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
> >>>>      }
> >>>>  }
> >>>>
> >>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
> >>>>      /// What kind of pointer should `Self` be wrapped in.
> >>>>      type Ptr: ForeignOwnable + Send + Sync;
> >>>>
> >>>> +    /// The additional data carried by the [`MiscDeviceRegistration=
`] for this [`MiscDevice`].
> >>>> +    /// If no additional data is required than the unit type `()` s=
hould be used.
> >>>> +    ///
> >>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
> >>>> +    /// [`MiscDeviceRegistration::data()`].
> >>>> +    type RegistrationData: Sync;
> >>>
> >>> Why do we require `Sync` here?
> >>
> >> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
> >
> > Even if `MiscDeviceRegistration` is non-Send, the registration data mus=
t
> > still be Sync. The f_ops->open callback can *always* be called from any
> > thread no matter what we do here, so the data it gives you access must
> > always be Sync no matter what.
>
> Right I meant to write `Sync` sorry.

It is still the case that RegistrationData must always be Sync no
matter what. But I guess that also applies to MiscDeviceRegistration.

Alice
