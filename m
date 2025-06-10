Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3033426AE4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564934; cv=none; b=n1RgB69+dYtTWDm0o/HzWmQ6r7QqN60svZ4mXQjM2SIUV5DvlVzR9e1kn/+z0h7vr1vRjxqEil3NqWC4nTbNZN1HXFZ5D+BCByGet+g4eIQj3y66LbZIp2N7o1ScAXOqP57vH6Y6kA4KsRbMppHMV3j4g2mZCbM3tMgB48h5f0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564934; c=relaxed/simple;
	bh=ge3yCP/EpuKpuiy4jzTLuqiWaqL/+und+D884iis2JA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQoUeBFYIFhpWksK8M+DmNVrYv0P5WYIQEeyqSeP9jT9pNCKBWVdhfEmdj8fWXhQhTrKdqBuRMWtHSXr0UvuHk/8rBupE9rfGXk8DA2J/4GyGqHW9NhBPxsqhc53b1ugAclRH8tAFzSFrWyovSqWuNIW+TCfMulkXpEdQEvAPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ST3VQig; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ST3VQig"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so44214465e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749564929; x=1750169729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywuko/Vi2Gb4rS+WbwhLfqtlhHLHm9Z1txYypp0EudE=;
        b=4ST3VQigNEJANw8ZH3fjbHaSjqYWRpIdbmVPFIyAnsh12X9vop6tee19tz2fKiZudw
         4WFLvDac/UnuX/2zOnchPHU/dJfDJ9Tq4Xt7szeNENa+vZeupD38VYkPC69vPMRQtUBP
         U8hwMqsdj3i9IsNu6szpl3rlzsK76oYDuijxvl2NrkkmAoyQYfOc8gKtwHirN9MGoP6Y
         wwvy76nNnM5mO/0sqHixK8XtaU8Tj/yMeRNDVOkt/sncYatQM7tXbsRUmjZi2A3qRnPw
         QdFkGeNtioFEpU5z3ISvTJ5ayDfglyysuHXhjAaSUpBoQFU6ugOt6iIhhrruJgG1g9et
         2Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564929; x=1750169729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywuko/Vi2Gb4rS+WbwhLfqtlhHLHm9Z1txYypp0EudE=;
        b=Pgb4EQpO81DLP3qEHZCP4J6BVWKWRu4fCFna3XgWE0UEBV1/zvxQcLlYC6fYPIklNZ
         V9wYklcpWPbwIOhOi2cEp+vCdguYy1AQb3ee7XUO/MvRRJn9WXPL4609Nqz9Kj0oLgat
         JnaFAPevgxHXEAyYn2Si9RTdVRPwL48Cwl5v4pTlz4X0amp5g0vsgnFKQxmuzt0txKXw
         xPNChd5nWraR43kqtRN5FtMpkBfBbGd6QCbk0qYDjqRg1RLPivcjqcJwOG3GLx7yg5kh
         PhSXA6Db/7ozNdO0k1kFfVoqsKpgFm/Ieppbpie1daHhV0CamlxobTuquEgGwR6+k+X7
         hk0w==
X-Forwarded-Encrypted: i=1; AJvYcCWwvGwlBWd+IL1BMUzW4cWfmHr+nA6cuhCLYd+f8BkdCAJGDiiPvJvNw19lrjLmCj0hP9mRR08gSQqAZvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJXRzHnAzdtXonwkkc/YqOR55jHlRlhIfXqhD3Po8wxrXZFlW
	nUyYmQsFxHJz4YKtHoEqG3XkLFrVIY6Gc3welYx1JH325WKsU6V3KeJuAS4ITrntqrOerK4XAxC
	Cz5BcgjmorPDDH9IDfL/AcJ+n3mk+qoNQL00pNdFq
X-Gm-Gg: ASbGncv9FqE+E3amdC1UO3GWxAodXMQdmy1gOJjh9UFC52+i/OA48aJVnS19xzpqfSF
	6BBd0HTfkYw8DB+eTVu9o9Or0Iwi/cnOCRS5gsMWLHNpQbeh6N414pO77O5pX3oqV58wX3eIEkE
	bSz11O99R1EtlwdV4m8H4QcF7w+07zPBalZn6G2fJdrEPA
X-Google-Smtp-Source: AGHT+IHEZWxT8vLb5epoa72haZQMQGOIBDRZJX7TGh1VU1y65oHmN2JLqqZBnn/8FKnCdVfpWAZ8D/yHCKiE8e1W1SU=
X-Received: by 2002:a05:600c:c087:b0:43b:c592:7e16 with SMTP id
 5b1f17b1804b1-4531ce8c02emr28577645e9.3.1749564929419; Tue, 10 Jun 2025
 07:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-pointed-to-v2-1-fad8f92cf1e5@kernel.org>
 <HCd56HpzAlpsTZWbmM8R3IN8MCXWW-kpIjIt_K1D8ZFN6DLqIGmpNRJdle94PGpHYS86rmmhCPci9TajHZCCrw==@protonmail.internalid>
 <DAIV6MJAJ5R0.3TZ4IC2KO9MOL@kernel.org> <87v7p3znz6.fsf@kernel.org>
In-Reply-To: <87v7p3znz6.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Jun 2025 16:15:17 +0200
X-Gm-Features: AX0GCFuqgtB8tzHReseQOluZ2wIpAgQISZzJ6tdMFaABhvsx6guDSPD_zbdtZu8
Message-ID: <CAH5fLgi3B_Wyz2OzBLhHHgWrg7hboyFUcQe-+GUrrvXiX9di=w@mail.gmail.com>
Subject: Re: [PATCH v2] rust: types: add FOREIGN_ALIGN to ForeignOwnable
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:10=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Benno Lossin" <lossin@kernel.org> writes:
>
> > On Tue Jun 10, 2025 at 1:30 PM CEST, Andreas Hindborg wrote:
> >> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> >> index 22985b6f6982..0ccef6b5a20a 100644
> >> --- a/rust/kernel/types.rs
> >> +++ b/rust/kernel/types.rs
> >> @@ -21,15 +21,11 @@
> >>  ///
> >>  /// # Safety
> >>  ///
> >> -/// Implementers must ensure that [`into_foreign`] returns a pointer =
which meets the alignment
> >> -/// requirements of [`PointedTo`].
> >> -///
> >> -/// [`into_foreign`]: Self::into_foreign
> >> -/// [`PointedTo`]: Self::PointedTo
> >> +/// Implementers must ensure that [`Self::into_foreign`] returns poin=
ters aligned to
> >> +/// [`Self::FOREIGN_ALIGN`].
> >>  pub unsafe trait ForeignOwnable: Sized {
> >> -    /// Type used when the value is foreign-owned. In practical terms=
 only defines the alignment of
> >> -    /// the pointer.
> >> -    type PointedTo;
> >> +    /// The alignment of pointers returned by `into_foreign`.
> >> +    const FOREIGN_ALIGN: usize;
> >>
> >>      /// Type used to immutably borrow a value that is currently forei=
gn-owned.
> >>      type Borrowed<'a>;
> >> @@ -39,18 +35,20 @@ pub unsafe trait ForeignOwnable: Sized {
> >>
> >>      /// Converts a Rust-owned object to a foreign-owned one.
> >>      ///
> >> +    /// The foreign representation is a pointer to void. Aside from t=
he guarantees listed below,
> >
> > I feel like this reads better:
> >
> > s/guarantees/ones/
> >
> >> +    /// there are no other guarantees for this pointer. For example, =
it might be invalid, dangling
> >
> > We should also mention that it could be null. (or is that assumption
> > wrong?)
>
> It is probably not going to be null, but it is allowed to. I can add it.
>
> The list does not claim to be exhaustive, and a null pointer is just a
> special case of an invalid pointer.

We probably should not allow null pointers. If we do, then
try_from_foreign does not make sense.

Alice
