Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457ABA53;
	Sun, 15 Jun 2025 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749995862; cv=none; b=ZuTObas9pEHZL2mgDH/4p060GKTNdSMklX9765ByEhgPqE7tlFe2g6mrjTdCvTzcLY2Ak58U3da2eZi834gkkz9bs+OKQew0XLa5Zo/7vPBIupJgwqrNgZlubNGEBEN6ej50malsb18ab2PefzjJFicJN45Pdfh0FCd+3/IyLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749995862; c=relaxed/simple;
	bh=Jckay2AROottNSnVhzhOmQXbFQQ4ezlEUUJy7bGaIm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1k0WudRsmsDASbBv/XgPDgoTatRBmJpcXxCRLIgYE6BPq+6Z/tTEuLzHEjB7iATe6JxIhRYbruywF2y00r9yVw2b6qa4Rxl/iviLdZOswjnTcfjBnEJLitOqdumV7RkQGmp7uwjFAdRTQrRmqwcETqLKxSjZN8MGh0zpDGB114=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs5oo2W3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs5oo2W3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so636281a91.0;
        Sun, 15 Jun 2025 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749995860; x=1750600660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPSoOTRNa0m2Ill5Be+ApwfPHUL1rTDHbjgZpDOpOSo=;
        b=Rs5oo2W3OHGTw9ZftKaRTVmq4QWsPsg7vXS45xvGosEmDLPpH2jrrTEG6CMSgjUeiD
         ECfgKxbM5/anuupvNd6GH6HI2FzWQvNznUNbymhc5dgGolbBmjF/Auy+LqksEqmuLtQq
         G5CaykKEAGDrujnNmcrGipdf7TZkDj7qQf6XGuWDrGY7vEaH0B8f6JYjcMoZ0Ju5KxJf
         8bQ8rCfegcQyfaoriOXVFIv3H3GvYGiiCm1HLjQpyhav/zkRNmklsAvA4Txamj8vnXOe
         5Wc9raq7G9Ot6Zz3pRsVLOJQBK/5RSwQ1UiEXKhHTXhNCMqGTyEDdg0uoiJp4uWq9pdD
         ybBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749995860; x=1750600660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPSoOTRNa0m2Ill5Be+ApwfPHUL1rTDHbjgZpDOpOSo=;
        b=sebKRpWLukZ4oqI7+HnocOJVehjJt+KR0KVzlxeTkl1QXuuBxhtuLUwR+dGdj6pAfP
         RrpslCOC1/AruR/cQhwgBYg1Yd/3odymbmqZs9hA9jcvtKAbTCNes5TZsHM23V3mWSJg
         mK43U+32wOSJuu40UJgL7b1cb4yZjRP9CEAf/ELDMmLy0xeldnLOEozYGzDZ0dvrBl4l
         VsjJyLVxRbgaiMHeYhcwKtfYBfdyqMkbE9iToi1J69z/kmBYwGSr1t5oE/+z067MgXS+
         cZcimhL6ledf9acZR6FEkqxFFqmG03XyuF3m/+xeVmzji5bfkhUNExubAr4bndED7wnJ
         2Csw==
X-Forwarded-Encrypted: i=1; AJvYcCWFLg12Oy/njHXSlPnTvqDDxwtcUOPJ4B4MNocfH6DGZWl7a5+YolygyO3Yn0cDpzXNor5URxvcVAdcubl7kaA=@vger.kernel.org, AJvYcCXZszLSO4ConfuyZBI7rxc+2joY+0QV7sORf52JT5uWejyh8aUsjSWveSxCHGdFx+VnA4P3Vpp7HyMr5jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkCKrlxGIb4Av+rO6Mgdh6InTir2sNxSipubOtSqU2UMMoIJt
	bmN8nb4q/YvqGhYJfuY4X8FSxHEKBmV5EJ7r4IFaLjtGILrHWmEBuyhShfVjeS30CXRb5Nn7OF/
	jL6dR6+U3LM4Q2bBp/I3/QEW/hAdOfrI=
X-Gm-Gg: ASbGncuPQuThgzalgiSD/2oTPhbU+HT+ZYfJ0GTGRCsUqozzdgOauJkeWxOneuvbRG5
	B2pyrj6+k6eZXSTKElAGAlNJYdmBeHMtEzEFFfQXp+DSciJTX9jaSGKJxEGk9rJRHieSesc9Wto
	oxKI6BEs7eHKef84vAYT/51sAE6bCrTnIkHkORDiDArCk=
X-Google-Smtp-Source: AGHT+IEFEPFyxdv4JFElPt5jjrTcnVQMLugO/SaAPwlpZLQUwUjsmfPuBAzLdpYbTdU7v33FSYxQ39ymsg5Yw8e2NAA=
X-Received: by 2002:a17:903:244a:b0:235:ed02:2866 with SMTP id
 d9443c01a7336-2366afed396mr34828215ad.4.1749995860498; Sun, 15 Jun 2025
 06:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com>
 <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com> <CANiq72kmN1iK=AD0yzj5TyMGJowaFzGMZjEXfUM3TCSRJkYuNQ@mail.gmail.com>
 <DAN5JZIZEIIR.3DJEY70B1TZJT@nvidia.com>
In-Reply-To: <DAN5JZIZEIIR.3DJEY70B1TZJT@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:57:28 +0200
X-Gm-Features: AX0GCFsBxvgBTzX3WLf6aBLf0sIem2HXa1bE0n-l1eigP0Nu78-5akz3h16QQGI
Message-ID: <CANiq72keko32qoc9OHnQsJx8ae50c2x=kij6r_gkwpdF-9n6jw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: str: implement `Borrow` and `BorrowMut` for `CString`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 3:48=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I thought I could get away with it since it is in a test, and clippy
> does not seem to complain about it, but...

Hmm... It should:

error: unsafe block missing a safety comment
    --> rust/doctests_kernel_generated.rs:7973:24
     |
7973 | let foo_borrowed =3D Foo(unsafe {
CStr::from_bytes_with_nul_unchecked_mut(&mut str_data) });
     |
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Do you have the doctests enabled? i.e. CONFIG_RUST_KERNEL_DOCTESTS=3Dy

> ... as penance (and for symmetry with `from_bytes_with_nul`), let me
> implement that so we don't need a safety block at all. :)

:)

Cheers,
Miguel
