Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315819CC0A;
	Tue,  6 May 2025 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746570162; cv=none; b=eU7yXKIMHvqqrZCtSyi6Tu8dck/so3McpsByQ4Iyk5VM4ktIMlIdUpU07wrAnWaG1XSExoqkIq12Fa7tJSCXZQVQdBnSGqKrTo3tmgZscc0GBT632tPiE+c4bLwt0NfFQFTaTLhcA1cdA5E0FfZIIU84VYOk5DzAvu1iwkuvafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746570162; c=relaxed/simple;
	bh=Fjs8/oqdYEN5TLsTGrbw69UBcedciUbp7Y1O4mot1nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvIIasVld4Bk5D8o53jU+HNH26fuuaGSTz1+5mn36aB32+xNSk2gqAKNW8XzTkp03XLVEUt/lwPspsQfFph9U/K/2NP0uXWYBC6khLoxfXM2M0uWSge8esbK5Mz0Gzd/ds2ZNzY52sNGgyMbosx2KAJy6PED7Lbd7vnOtp1ZDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkyQi4sh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkyQi4sh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30a8831e462so156137a91.0;
        Tue, 06 May 2025 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746570161; x=1747174961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJu/VrmZH7dKgyhsnTdC5BHM2TwuIMvm6m0HjhtoteQ=;
        b=ZkyQi4sh/TL5Q+VWZLc/TDG7kWz3m29077681VB8/9Sp+t/mPOrD+z/4LP2AUb5ThK
         toRykgILuzo/21vxs+59Uac/cdpazFm7qTADiCkfBKWaLOoCzvHgxMaRQOG+lkfuQ4sc
         80hBh20RRt273vKaFFte0jPZv2l8OEtmT1qm/saZZ6kqLPMpu4NZlFpHnpveo2NQsgwz
         CFIYjQpZNDJqmfMfdd6CqKFKcLuYHGSUluL2pUVde8FSE/hvgDCLZh5pZYyKHTzPfPq4
         uF7wxhqDQfqABCALPphBruit6j7drJx31Uoq6qbWxiybR12W8C/ytOKxQrQGBSzeEN0r
         JSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746570161; x=1747174961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJu/VrmZH7dKgyhsnTdC5BHM2TwuIMvm6m0HjhtoteQ=;
        b=iE/FIwgyMQwXogMr/+xIgva4EVTl5JUkFtbdp7ZDdqVEgZJpvUCg15zt7+Fu1ntm2m
         bksS/va8GtxqG0FP8k8C8EDPqvzwMO7CiF6JjP9grFdUC7W1iKHelUjMC/IfsGAkeTjF
         Eb6+5OBUVUU1zwzMy/mjz4S5DTBd6Dm76LjZMV2S7wY2isJzOn7d3nlZwYD/zmwk/hIw
         TxQ4oc19bX1mDArP11QDhDOSTyH+m5KQBayBTvSNXNqFkrlhlwRyl8b8GB78ejWnumqt
         TLhai3v9vdJU7FysHElM+xsvAfHC7GUF8G8t10/cR6F1aR8Vs/xDVFR1teJOGb1RAXLq
         xA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUirQP9+YBzSAmh4ZXp01ozvDv3P8kd5fYX5/lmXAFEkw2QW6JUOVuPWRAfihBgw9/60/FyQDThOInzTGXTVUM=@vger.kernel.org, AJvYcCXqwsBzV90hGd8nG+Qmk8AmGwYFjpTynzCuN9PlhocGmi3BDJgwAPkjjX79Vl2tMWduZW6tEmDZiSbq6Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQWSVVYZ83z6KAIAylk7C4uMaTtaSvwSg8ag4GCkTuMrNJhUxm
	jUoXZQLdB+lASmhM/YUUZnhDFLXMZQIg7wylEwbhD0M/ucSs//4bZd6o+cDQxpnMC4HjNqcocmm
	eyG8HoSNXmpozauXvsBcDpuH0uCs=
X-Gm-Gg: ASbGncsFm9YylXE2+YiON89mbMXACXVtIM0PzSYCHWU85RLCiKyqWJQgNx9r136Xoju
	HleKhRAedUenmVPNyYYgs6TTEA/WwSYfbbAW71MGh+bWT0zhxHqmu00hh3ql4n+e80Y7myPqQNz
	1r32oORopLzzvtg6tQU2jmQg==
X-Google-Smtp-Source: AGHT+IFVLfOMX/7uUSXM/y7pjZowtfQ1j0vsDZTjQNHCA4pIMb9jQEvGqs1TBHX2E5FSF2e0ZGIxAaTuGCDFxHIVLrs=
X-Received: by 2002:a17:90b:33c1:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-30aac16c2e2mr652470a91.1.1746570160569; Tue, 06 May 2025
 15:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502140237.1659624-1-ojeda@kernel.org>
In-Reply-To: <20250502140237.1659624-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 May 2025 00:22:27 +0200
X-Gm-Features: ATxdqUHsnz3OpIfXfRrsahxajrnMcgxR0wuYrhnN4_-kpgUu_iZsj3JsP3IAULE
Message-ID: <CANiq72kb69a8=2GR32_+NeJ0TsBM2XP2--tJf75+JDLjkaPZ5A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rust beta (1.87) and nightly (1.88) lint cleanups
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:03=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Now that Rust 1.87.0 is close to release, clean up the new lints that app=
eared.
>
> It may be that one of the patches is not needed by the time it releases, =
but
> I prefer to not wait much longer since I would like to land this for -rc6=
 so
> that it is clean for release.
>
> In addition, clean some nightly (1.88.0) ones too.

Applied to `rust-fixes` -- thanks everyone!

    [ Converted to `allow`s since backport was confirmed. - Miguel ]

Cheers,
Miguel
