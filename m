Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C2E21B9D3;
	Mon,  9 Jun 2025 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488863; cv=none; b=CjdyzZ6Kmjuz/4XUUPicXWuQCbTzV73drdbrJLKigvBY3I6Lp1y/wBfO0QNOv4CcD71B1cGiiG6k6FDhi4A3bEU0ocu6asdqdzRfKR+ylxlN/PrCn4w/+lRkB3eJttqN+TDTP8zmix4374K0RRMm3xNyh4vUV7rBSqWE1Vj3UgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488863; c=relaxed/simple;
	bh=Dq8MSayO5mzVOULGgwVoSeT6C6CVYRN6SRzVVuf80Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XfXDEqtSQUKhdatVPNbasFqW3l7Cn/qfu7DfHSr5jEGP/ZWteuA52w2jO9WKiUFaJ3PXkci2wgbN5dUyvhCExEyCAOX4dYPnIuBye4pHVxH3bqVr37v5ZQ3tB5kB9OOV3vx40QUzXCUUXARTbS9BLK3Cg4RhVBS5EQ/kIezc5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geLQ7Lcu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geLQ7Lcu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313336f8438so792182a91.0;
        Mon, 09 Jun 2025 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749488860; x=1750093660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1N0UDdK8lLC+QVYwRwO/3SBz0UncRxF7iQSLzkDX7M=;
        b=geLQ7LcuO2sus7IM/mGYUl4gLTAU+GaYpx5RDFIFkrWIG+DVgph5+s+ew5ha5HJQM1
         sDyQypN3wGyZDRYqrEmWxRNFNVC4QS5iAJnYNK9YSrwD7K37hT/Bk0WzdOrBTne0YJlb
         F2TzOwMYe56eB0T6YRbA4wH7cWQlfFtlRQt3r+m71ED5IhcBoZgU3l9r5EdQ8vEyaE9G
         o9bFcxbxPXYWPO/Kwn3ONSe/4nLMKiH63mFf5WR2myQpe9gwSIqXkQaSeo6cjPz7kOQn
         SV7R4N4Wv/owmE7L+Ui2JrVoa8YhNqfyg1EaGbzFZ9tLD9n/bv0bNdVmQBs2T+oq7FGG
         aiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749488860; x=1750093660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1N0UDdK8lLC+QVYwRwO/3SBz0UncRxF7iQSLzkDX7M=;
        b=WxZ2fW8vDs40zP8q+TKSYdyE12CKw90+wWl3iiOkTOF3KepNoeRXWOq4pQKSNPkQlb
         r8YIeOWgWNguU36awRMu9pVdO4l7zwSa8Q+TM9GtKMOrvtBQCixCPYiGh1KXNknVUIiF
         m5SGFg8nv8H/K7hmgpDOC70FAtm6nhsWYGez/TzUoZIQghle5ItkQm57oP4GEVdducZo
         y2KUOipG/xf19IhebXLwJf7AkmoayYnzn+R5Nbr3hXfghn02gEfKWQU9JLu0lgzb44ka
         1YFv1lIrUSygzI0G4WJcmUe045dT2WHB84Gc0myrVV7c3G4noziJUCwsD6WQ/IC3P1hc
         ac2g==
X-Forwarded-Encrypted: i=1; AJvYcCXCV5gz1wd1fmmrQ2RHQWkIfm7vmqlzjWkD6xcT7pDr9i8WBya1Gy6u4bNCyQqtlitmjXhE1FMB5weNV29K+d0=@vger.kernel.org, AJvYcCXZtaTNLyC58SpFa4LiktDqx4wcAhdmHkmWbsgUaqiwiJPupjNdhfDKRUIpdZNabazVkbEZcRHPc9R5bAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vSs1fA3+Nqi7/g/Dk2kvbNdzVNUM3Qp9TDCD46Ihdq7LYbtS
	O4a6eZXxwGXi/Kj+rD4Hhz1FBKWYyX0t7aIq/lb5WgYgYzSirt2dxiiHj5qEW7mvr8wMPaDGhpX
	x22osEM3PMOZiQxjaTElE4j3PDruVdfISyy74oVUCxg==
X-Gm-Gg: ASbGncs08Pl1lt01sL966E7n+GEoqVmiHaTrF4NKXhb67ZGDWhC/ESwsZmwxNUL1z9f
	yEQlNl3On0sP8DWw3S2GMpbug958L9PNk5ktq7ekJmS5VX5whzN2F3G8Teaabo7jc5Hu6SclvVP
	28OJm1KuzuMBZ1ha6SV0XjVZzExfjKAPO+KC5GPfL54Bs=
X-Google-Smtp-Source: AGHT+IG3VIlZlpjeF3NZRjbSmcCyVMzGm1PFJaoEe/UUkN+nG0qIdp/t1yKZBLZ8w0UWd/DWxh6CT3ktRTBJtAfk5JM=
X-Received: by 2002:a17:90b:268e:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3134e3e4268mr6262130a91.3.1749488860287; Mon, 09 Jun 2025
 10:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
 <CANiq72kcF-CqUwvCBRt5FjX2Yrj517UYjXHA9Sf7-Xevsy=2Kw@mail.gmail.com> <09F9A01B-70CA-421C-9A48-E0FD0A192026@collabora.com>
In-Reply-To: <09F9A01B-70CA-421C-9A48-E0FD0A192026@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Jun 2025 19:07:27 +0200
X-Gm-Features: AX0GCFuJt8-DqTgw_q8FYRdfSv1LGXRu4JVE6Zd2lw2Y71ekmTbWOgzWkA5p0n8
Message-ID: <CANiq72kNo94Wym-FGoYx=A7OK0N5itZaD8Jm7TbBB2P6s_zTOw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: regulator: add a bare minimum regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 6:31=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> By the way, are you using some lint to generate this?

No, just my eyes :)

But I try to report upstream things that I think could be automated so
that eventually we need less time to catch this sort of thing, e.g. I
was just opening this one inspired by this patch:

    https://github.com/rust-lang/rust-clippy/issues/15023

Plus these other two, which do not happen here, but are related:

    https://github.com/rust-lang/rust-clippy/issues/15024
    https://github.com/rust-lang/rust-clippy/issues/15025

Some of our suggestions did get implemented in the past by others
even, so that was great.

> Did you try to render this? I tried it before submitting, but it did not =
render
> correctly after the first time it was used, i.e.: only the first subsecti=
on was
> rendered correctly and the others remained as-is.

Yeah, I did -- it works fine for me.

I even checked that it generates a higher level HTML `<hN>` tag vs.
the main one, as expected in Markdown (I checked that because the font
was fairly similar in size, so it was hard to see).

Do you see something different?

Cheers,
Miguel
