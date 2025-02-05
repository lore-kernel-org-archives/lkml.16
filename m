Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAFA20E007
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797144; cv=none; b=SXLUQQxwqUd+mUbH69jf/NA7PqFnX/SDEMrkcgOYZ/UspFMQFaukRiXF5lFC/Oy33Asqy4PwnYHdjvfiF+gFUvkw2AAo7lnrQN5AWeKwOUhCcKqg8juMsJANIgAc4Xc/iiq/pjf6bffxdT/ycInG1ja1SjJ8skTVxOZX1MXlH7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797144; c=relaxed/simple;
	bh=4zHAng6HdFa9VjdxzgdDnt1PL3lyWq1Aclh+Z83mzYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SD39T+RZUCvg2uunyx1Yi3npHfsreiFdcM10XbF2znLIyz6rCUhonBX7W2Ufn/nsruJGZgC8yRmfBQ879nJuEte6HHT3pYRRxUE3TD0S+1NIGOzk7WGxymZs5a4E6crReLC/EPUXautUxNyC+XapnR36uq2UbFQXNZ49pyL0R2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U8GJhbdq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U8GJhbdq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dcd43726ecso395a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 15:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738797141; x=1739401941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zHAng6HdFa9VjdxzgdDnt1PL3lyWq1Aclh+Z83mzYg=;
        b=U8GJhbdqgWf2McHiJB1SLne+54/dLfTE9r+PV2cR+nus19BO5gGvT2dcnpgauTzmW/
         eT3OLXc2zs+LkvFqTCVswXCjXgP6fh8FxnWRw3SXGBw7vyK9zGg3CoH2DDQP+kGjg0ei
         CW5pLcDf2oO9/9OuY4eQ51n+h/dxyokPtJB18OR5qa5dspPTFeM1jGNbpu3VuxOSSUnD
         tHNIcjUcHsBRLFtrF38RimOgmCy9E1yBZ21igdW0qDYYIpWfK+0i0AsducGGQpIKhuG2
         GDR1E3+Cn8rNfNSNjAkBMLubzgG+V5GGJWzaq15SpSo6SIdOhWi7F/+s9WEyyFPcdAoZ
         3gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797141; x=1739401941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zHAng6HdFa9VjdxzgdDnt1PL3lyWq1Aclh+Z83mzYg=;
        b=hTa5wMNdU+V/aSO8WrQMT7dNqrIf1CZnFXJzRfTzzHZE3kJOVC4Ns1UdQ7j1Nn/dvu
         2SfUKdzLquvWZNS/oDpZWEY+aVahapgmSafsaszF6cjenwA3kuSaH/oGlz7Ztfx+Sc+t
         txlMkRJs8tG3oK1pJuMXQdwKikFAjnHdiZP0NMAbzP3OT3IUolSsX3T41i3LrppgoJp2
         Jp0+f1YLNHdl3F/o/j2n3YPGXQjAQqdjLsIZDwVwvvFg8ObT+XJpUGT8i//LItEB5VlQ
         2qD9bfPugSD0xJ6awhZ5748aa6FsiF51JJvxzrBsaHqo2ezx9fmfV27JkHM86FSR/kE2
         x2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWR1TR30vcSmSPtRxEEZPFawGBcWgYcPmxBmRg6MbPbrswuoNQPV8eCejmOZGLK1zOOvGV6uxPKvgxOPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFTclJF5GOp2scWfJW8qUf7wgiz06MQ2koEDQXOnyJ6dTlIWa
	5JNTMCZBn8AjcjRLSpuFsozEL1xAnI3D2J5cZMqXK6vZvqa5p1/6bMTSM0lY+yf5Mi07BhGR9Cv
	54PM170m+iBIbT9zzKWKh++wWlp4H7LE07W/E
X-Gm-Gg: ASbGncsnfDC+zdgwEPZoRpGpi7dsnSc6U4Z/qkPNpNc1Kf8jIuFMjdVtXX2fLkKQuwk
	wazrO1J5D3XUNVAhj+OUwmePIS+n5jfctqXM5ofG/+0M2FEelR0rimMVu16b7hezdTFwk5DH6Xj
	TL3OXsILsLXbKVVG4RR+nDllQYW1o=
X-Google-Smtp-Source: AGHT+IEy8D06ym9OFvBFxNDWOLA3mpnur8aFPFxDU+aIsQd7Z5dcQwZCDB3Rc9uXU2+Il5yHW8OsIbsEDjD7/GVrGOU=
X-Received: by 2002:a05:6402:644:b0:5d0:eb21:264d with SMTP id
 4fb4d7f45d1cf-5dcefeb0e4dmr3424a12.1.1738797141035; Wed, 05 Feb 2025 15:12:21
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
 <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
 <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com>
 <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com>
 <CAGSQo00uUYdjeiRHEz465WyN_kDyiV2L0Ojaomr8ckMYipmp6w@mail.gmail.com> <CANiq72ksOc_ncUXycySPS+JUur8GZZSHSSEQYOg9aKtpBRvnPg@mail.gmail.com>
In-Reply-To: <CANiq72ksOc_ncUXycySPS+JUur8GZZSHSSEQYOg9aKtpBRvnPg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 5 Feb 2025 15:12:09 -0800
X-Gm-Features: AWEUYZk63DXwzsdzpkKGzbhmaLKhtF4EH60XsK48xOQrl7YUbPdqDb59fHj8Esk
Message-ID: <CAGSQo02wJrawHfCJ7HTo+_o0wgk2zv+SefMmORoNcM5NNS7LqA@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Correct, I don't believe it needs to be backported. `gendwarfksyms` is
the only in-tree tool I am aware of breaking on this. It is possible
someone else is dumping DWARF for all exported symbols, but I don't
know of anyone specific other than Android for kernel ABI monitoring,
who already has this patch in-tree, and does that monitoring on
non-ASAN builds.

On Wed, Feb 5, 2025 at 3:08=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 12:03=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > Fixes: e3117404b41124c88a4d834fc3222669a880addc
> > would probably be most appropriate
>
> Thanks for the quick reply!
>
> In principle, the backport to 6.12.y nor 6.13.y is not needed since
> gendwarfksyms does not exist there, right?
>
> Cheers,
> Miguel
