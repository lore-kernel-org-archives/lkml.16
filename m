Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8641151982;
	Wed,  5 Feb 2025 23:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797518; cv=none; b=p1w4QwihJlNNwSoTBHiz2xm6OQEAPsQEj7cPanQgqadbjW5Zsp+5A8DEy45BJUDLwD0N2M+EHifp0lZIhdxwVwVPETfwst/OLd+cwpiExX9Y4u3evAIay7ZvRiV3Cr9PmyQ+mBDUbe8ov/lP9YGZ8f5tiN+yWwKiCwCxcGd1i94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797518; c=relaxed/simple;
	bh=fTS5kkRiT5iov7u0NdIhvvBNlqd43XAj36fSoYjlcLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JufC3hWUTTHZuL4kAsZ9Q1lIcJJOMUXT38v9NCfJF2uTDCrdFo2IEcB+NCiC9GdgLoY2Xn1W9njfCwPlMDFxLWsPIXQ/0bJ/f5i+l39EIa90LH3DAVIeGuzT3jRbLNazfpCpDwH+pfWo+3TNfqUwRmxxr14Jajf5lIPjlfewLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUiUBRMT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUiUBRMT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21bb2c2a74dso837085ad.0;
        Wed, 05 Feb 2025 15:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738797516; x=1739402316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTS5kkRiT5iov7u0NdIhvvBNlqd43XAj36fSoYjlcLs=;
        b=gUiUBRMTCPQ0gi+4to9QaLRbEuVBmv/kKLpmCmPj6SLSLvRuXO8jL3+O3nmUzmkTJ/
         wnqsgMky69h6kqGaLIqIfMAO5Wt1+XBNcvIj+pq6GBUfIqd8gYt+ZdTq4fRWWwX0cXv3
         b5hJeiW6WNkno1GgQ2YVneMny7yJlziQIpGqGwk67TJVD4wVKYJCQCByGu8/pLrMkvIq
         SXbRv/UgMbt7IKZ5ZqlxngoHvT/ZTMc1aqAwC19nZi0ZcyEnA2X42aypa4DSJWmwx6f4
         kyD/c5DrDJTxaSLu+fTNOyxeTBMTogDRdN0eM3p86IjFwv5hk04KAWkyEU/82fByk4Oo
         f35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738797516; x=1739402316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTS5kkRiT5iov7u0NdIhvvBNlqd43XAj36fSoYjlcLs=;
        b=o508wOP/NEraXgz6bkRumdOLw3OL/HnDVvXlCbxfKM5zB61mnLX58/QBLYsPp32QrA
         IiUyAw3uHQzrPA3Y224tBVYzhEFzxmVFah6OAVEemZ8N+W9pm/R5hDS0mBqEBTlSbpcF
         EpU+Sohou7rEJYgB4qTyXn6k36X0YP5FObUX9wuSdKYRC5Ef4+LOTxuyddu2zXHHSACB
         dNFP6oceXGA2hJ4OZM5bBcF22hFasuE2wghsy7q6E4VaVJiATcHsg+WqplmOJmbvkxEa
         QbwVO5Ljm0GhszdIuOsD2DU0X9kMYj+y2rFaXLsCFDcKBtf1hic8K3o8YHbn6/7j/DVP
         4LKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHTmp9ZOaQrqJFAYh8rEY0kUNfiZW9B1aD/Ip5ar3i3oLslLknf2y+LaStzjH5bdRsaDAHF9fEeSCgZvUq514=@vger.kernel.org, AJvYcCVI0B5m3SEDs9zF+foqvKGgxKN9DGnXcfAkuGEslF9+Nf0/LX4GU+gHQirt67CRu3JZibUiaWkeoEm0m3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFFlEd7raIvfp4qALNHb/+f95ukqB3ry9ivi1wXFzNIyIoV71
	L0lYJcK4V+FFrEUJ4OgOAY+HMFQHhhuTg5vSWd7GbyYMb9SoOMCOMoFTY+rbZgZ+37G8jolwgFI
	0WU3TnOz8Te6FPrAlDbRt8IOSHvU=
X-Gm-Gg: ASbGncsX9gT8R5ciiXr5NJyvbIjSrhxkct54qmCOKeOfOdaNsVCyOVOz4PoobhASYIs
	7y0tFVQTTT9rf+sLhMml2C4/f/POI/jW/XVueD6GL320pAQrL/BcRBWDyfSaODTNuKISB6p0X
X-Google-Smtp-Source: AGHT+IFWRFp3qPYpdUxS+lP8VvZZad2txfBx/CfxCHzV3mHRF/MJNPdlgU17tBd768zBU2L5/J0QhSflOhL9Ap6f7qo=
X-Received: by 2002:a17:902:d48c:b0:215:2f19:1dd with SMTP id
 d9443c01a7336-21f17ebe960mr28812655ad.11.1738797516180; Wed, 05 Feb 2025
 15:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129215003.1736127-1-jforbes@fedoraproject.org>
In-Reply-To: <20250129215003.1736127-1-jforbes@fedoraproject.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:18:24 +0100
X-Gm-Features: AWEUYZkHfbSzXVG3UDOVm2PdeFkOPbGi45OSGXrvCy3zTLZpmNXEuYakcDkpsLc
Message-ID: <CANiq72=GpSe4stOb+EqiP_FGUNZbbLW0opTu_Bpqr3w0Cc=J4Q@mail.gmail.com>
Subject: Re: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
To: "Justin M. Forbes" <jforbes@fedoraproject.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:50=E2=80=AFPM Justin M. Forbes
<jforbes@fedoraproject.org> wrote:
>
> This seems to break the build when building with gcc15.
>
> Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-=
fzero-init-padding-bits=3Dall'\n")
>
> Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>

Applied to `rust-fixes` -- thanks!

Fixes: dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=3Dall")

[ Slightly reworded commit. - Miguel ]

Cheers,
Miguel
