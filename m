Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B926B20322;
	Mon, 12 May 2025 13:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057749; cv=none; b=tfkCWfI3TUO258Yx89tTpKPpp1NwpllEpLBGvzgok3wCtT9Skq4qDGGpnYudZ8SWDqL2ZolUq3NFn4DaAAKeqrvefB9OX8ZdyKgdqqVwPnckOOBW1lhEUfWAUnv58DD8bjS82Js4Gb2IhJvV9zCDI4S95qiAaoXTBblS4JNwHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057749; c=relaxed/simple;
	bh=ecOwOv/tl1SZggHfXmBR/Ac/gL88Z6uCeya51l7i5s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBe/jH5HSA4HmSBBurFN5bIVlE3JHLMq2RvmAWCc4t8HSP8T+RxLdpDUY00ykCZ5taLC7ZPzbNAIAJiPxCAAGYDeBEePIeX3hJqqH4QXeIfdYJ5h0UyMwYlzIYEjSziqBdr7cKKwcOVpHy35XyEQOxyikZF6kFOYGhsYsC2QxiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxMTFSny; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxMTFSny"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2300e7a3b71so1171455ad.0;
        Mon, 12 May 2025 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057747; x=1747662547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecOwOv/tl1SZggHfXmBR/Ac/gL88Z6uCeya51l7i5s4=;
        b=WxMTFSnyaX/FGYOyxBQ30hexV8Y5M9m2r2XaZJsatQXDMTCHCVP492rv9lVJFo7Cb7
         Ghf+r5KcW7x7dIzoovy1SMFIdqQRMn6AcTfMVTuP/0VzrE2JqWMaL3nCzDs6t27iuzvu
         C3H4TWP9dAM7W+yXNTUR++I3JGH24Lp4ldJXxj86wCc3wdM53PcT5CX4gmyDiMRmsber
         +8G8xItGvdYW6s+dpAgfFIqCLcMIte8OGEtMxJPgb630xed3R1ybcY/YdV5Lrl3F6Otg
         QKGIgXban/bHUQd+R1utTPjwzTOBhXlbc2xwpPuNR7euQm/PTUybyALkc9dsJJtQQa67
         mYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057747; x=1747662547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecOwOv/tl1SZggHfXmBR/Ac/gL88Z6uCeya51l7i5s4=;
        b=e9FqZ/wGbbZoN2Q3ozqMblV28dUQZLwobXTgHjSDH2A3cjLGQEXpGN9RoKjvIRMiuk
         oMNiex1LoekHF86C6SuQ0eysa0M7pE5F8cmQiM/CCUoeKOInTrX7mOP4ap9OctzYNB2P
         +5iOJ+NxioWWxZ54aUlUXmaFPBON0R4r0TarXpmmmr5PsNI1OKu586DTHb5lZfRtFftj
         GHDwJfarbY9NG7rc8WUKvcUTCREGf1J9/FTxh5E8//sQe85tcn+psgjoyTj2FTYXashr
         X8LNeOmBkSds2LZCNTWTX1hxC2AuniHR9hDNjbP5HFGrk1XnFM97K4q4NlLS0cXy8zBj
         uhUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3HBwE9gvCTYZYSTsk+ekBP7BpZr1p/uEhMWZEjGRuz6SsosWjndydwUMDYOL6hXB+msdoYVrYehblSWQPPys=@vger.kernel.org, AJvYcCWJ0I+8D5ngIBhi3iihE7gObCz6uVix3Qe1mp7tlZsDABkrvU9I3+PgqEYwffzPPj3JmTSZ58Qo9r7PjMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMPjsuaqnkqdhdKnQEa8GAeV7RroZPr+CJdmdNC9dCJz2J4gt
	A1RwH+7+O1R4T+zB9aIjcZXd194W5hUFqyDKbE07OMJDLOwIGKLD2Faq5qbQhAF5pxGGgWeCdoC
	6sOh+mkX1SqK2gmNByX0OfYb2sV4=
X-Gm-Gg: ASbGnctDifBQCASR5I7oE/a48fsQkLI/vDq9UlrnsOYoHhM1s8DotVicPsBrvYSIxiL
	Lyp3R30yedWWNNd1t8PSsqnkTkZGW66++Pb2Ogbn9EB0+aEYKNbWM0hA2EU2+1tRomPRLuM+Gom
	AbekvOy64IjIqSKOdTd6JPm53KtDq6zbA3
X-Google-Smtp-Source: AGHT+IHTTag+8vW0X11zkMUQsXFhHUEewmAyyfu0IIkctyB/3aBLXt/7xM6iegzN1p9dvov24n1X5WoMWcZY0VNXDjk=
X-Received: by 2002:a17:903:194f:b0:223:5c33:56ae with SMTP id
 d9443c01a7336-22fc917f6bemr67201325ad.11.1747057746917; Mon, 12 May 2025
 06:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429151445.438977-1-ojeda@kernel.org>
In-Reply-To: <20250429151445.438977-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:48:54 +0200
X-Gm-Features: AX0GCFsxmjZElBhRtsW5XAzgsdGMIFmsa9C1Hm1k-1Jh5fb2q-AD7f9ja3wKR8I
Message-ID: <CANiq72=2ZLrQqzVznA5O=2SDdHHETWUtc0MiLHP_Bx7n=vzLqw@mail.gmail.com>
Subject: Re: [PATCH] rust: uaccess: take advantage of the prelude and
 `Result`'s defaults
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `kernel` prelude brings `Result` and the error codes; and the prelude
> itself is already available in the examples automatically.
>
> In addition, `Result` already defaults to `T =3D ()`.
>
> Thus simplify.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks!

Cheers,
Miguel
