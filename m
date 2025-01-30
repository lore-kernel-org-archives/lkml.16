Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E91A2658
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226182; cv=none; b=cAu4ywnA+ZHyh0Z5d+HTuBC3Cio4T925TtbjMNGCKzkAQRhOo8R0R9Z2lTgoipQt6xiJSkV84KiTVZi6VDIrhPjainVvfaPdt2astsgABTuU+cRPjyUoaPyZrEBSzAwkP/kuVEgpDBzM8bdejQSY6WdCeMEbXfxeeHkO//H34Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226182; c=relaxed/simple;
	bh=NpFyo031jesMq/Zs7w8Z4oMfinomKT3emG0OY9l0/eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIdk2bOhrx2RVa5siHWRxV+1NexmOni1lqTwTwCEMhdgPXT0kVJjmQxflQ6+5pF0ejSzB0yV8Y5Y7y3oC3JHgvaa9VquKBNcp8D8Hw3aBlXvqq9ozrRAK1WAst4hZjGYimzPuBlBzszVMII5YOQZ2VdnrCHAtda1YNfku+pmObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MsJq4RHI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MsJq4RHI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436281c8a38so3105125e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738226179; x=1738830979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpFyo031jesMq/Zs7w8Z4oMfinomKT3emG0OY9l0/eA=;
        b=MsJq4RHIl8IufiQVYIgM+1F+nb0Wvw/sM4/jU8+hIr+QHYFmBXHb+c06HN0iCyQ49g
         Q6YFpKwYDCK+xhYU2ULKMhuteAdT3wpWUqvxFYGGTMlB3nKSe+BtYyI/7Ylq+7/MiooL
         CAAvSDqz0mqzX1+PrP61vwGNradhtWnHfjp0EPNF9An2bezZ3pqpKw6nzfH31eQoBix0
         5Yq8hFSPSLe36+3kjj/Mgdww+GWvN/UNiapNV8uhOKc49a0pW4gdJNSpVXoSPuSVH8D1
         or/k+Z3aMmigTjcHLYwUI0BB/w3Wkl5DVA1Xf8MGXEFmkEPegw0F/Bklsfjum1XePrtv
         aREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738226179; x=1738830979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpFyo031jesMq/Zs7w8Z4oMfinomKT3emG0OY9l0/eA=;
        b=f9EFWTOKMcUm63ugh5uM8bRQloXTgOcpahTIqg00q4l6KOSogbY9u8xjJs9v4+TfaQ
         0OuCi9pANNHHldK7p44exWhFM1E/TJLb8btvhOGNWQmA+/2uIS1HQ+uUGKSdp0OyQDzI
         rU0AyU+jCut7rZkBwLHQ20QggjKW4TiIchmuFrilYyez9Wl14GqvQlwUf8ksKS8Kgd44
         9UNr31WWSlkhKwwWzWbNp7d+F3tnxGMdp9cBTFKkQ/kvZctpt87WSoqv2pcIs4iD0XmX
         +dkG+sjBzcxK/L+WCmpArrWBssFg/VrAB0+gydz2sSapNOkbLtzqEus2kmg18dvZ4cOa
         4DNg==
X-Forwarded-Encrypted: i=1; AJvYcCWxtKR2SvH0QsDhzYmd++RoteomrwnLGuITm9Yr0/x1JsruKq0s2sEarp0fWMLQH7o3/k6A7hbmnyow4hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8mAA92Lu4QDaGW3yUVXWr5ZmMpF/YZjmBFbs6oW192QlUQ2f5
	/WZyGpYPYZMIMVBdvGrZiw3PrcF4x85nLtjJnT6frQC38uJbs0vQYv4/07FrtR6nevDDCCVVMIq
	ZInrCAjDo0KVfrUayu82B7cDz6GF/dZqL1ZYt
X-Gm-Gg: ASbGncsLA9/XzDVjo4LJxixp4/umkY/aMau5+JJqTKgbVlwoLR9LbWtOsk/nabZx6hR
	nvQZwHardfdnqOM1245X2n1bGZBQwrrCfCwABpU/7yEEQJtlyePzDgdY7MUkMbuQG2D2MLyIGoh
	5jIcf0JG5kt5rXI++C81Um6U/kNCs=
X-Google-Smtp-Source: AGHT+IHnI1LtF7nMZcqEjh9+dE8jolzjd+ED3MCX4xDE+XblHr70MsiX8qWC3045swfSoBdwoYvH2IANJawqgHJUzTU=
X-Received: by 2002:a05:600c:2d45:b0:434:ffe3:bc7d with SMTP id
 5b1f17b1804b1-438dc3c38b9mr58766015e9.16.1738226179287; Thu, 30 Jan 2025
 00:36:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129215948.135486-1-ojeda@kernel.org>
In-Reply-To: <20250129215948.135486-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jan 2025 09:36:06 +0100
X-Gm-Features: AWEUYZmCbAuxOrTTVps7vRQ3a3AQ1uN8EqeAZv6sf-PzRBAhsABrooX2dsHc7Z8
Message-ID: <CAH5fLgiVA9wKoDmXH9KsnPt5B1_eiOwewE1pNsCusP=TE05vKA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Danilo Krummrich as Rust reviewer
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 11:00=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Danilo has been involved with the Rust for Linux project for a year now.
> He is primarily working on the Nova GPU driver [1][2].
>
> In addition, he has been active in the mailing list and most recently
> submitted the Device / Driver PCI / Platform series.
>
> He is also already a maintainer of `RUST [ALLOC]` as well as several
> other DRM-related entries.
>
> His expertise developing Rust abstractions and APIs for one of the major
> users of Rust in the kernel will be very useful to have around in the
> future. Thus add him to the `RUST` entry as reviewer.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Link: https://rust-for-linux.com/nova-gpu-driver [1]
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Alice Ryhl <aliceryhl@google.com>
