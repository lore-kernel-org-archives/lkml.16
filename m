Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5C1B87F0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746424772; cv=none; b=pAviTQXcHxi+uUXSi0kKIZck2BpFq7azsS5vKqeoJCHwTRaCb578AvyLxJfD+1OfMyERXpbEr2QD53XzQvZAsRkYNnefTyGEYG2uneX4BroiMy8thZRmHbZ3gDiNbP+4NNL1NituKlplRcED+0DlsdCYXxYwHZPZhPSVtRMTLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746424772; c=relaxed/simple;
	bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmnf3hSlMBPrl2BZ2lg7AedHYlPNyNAf4tqO5t7W+xAbmkZ5BW3//ylIt06bFsXfo/gC4SUlFWCxmFHpgf89QNByoCOHDEoCz++027NW0HMsleA4AR7n+oz5ZUtzucGc3t3WIrL/3wZbzttQe9K/F8YCjYjleenU4mTFiUOw84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZoU+o4H; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZoU+o4H"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d6f933152so5609783e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746424769; x=1747029569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=UZoU+o4HWvakX2nxmiB9eKOzNpzeS2xKKeVbm1wrONUXlfK+Hyb6JkBP5aS2thQouu
         vI/mJ2/dK1oDKJkn3BCsoMMzN0k3C2dG4qT0E0U6KemwFOOo2NxpDEyIoVVqZnbuKcdO
         VoM6jIiMGWvfCszwv6Rwd2Vsq4UuBAwpwEEfHeKctkptM9g11or6SlBb7mrb/QkTH/ED
         l8AyUeV7Sz7XOUxejmJiNYkv/2RAbNBfkh3cuZGjwgTsiPJpCDXeJBLZdkbPQ1GtFuXT
         b/3dtTIt/9nHROwnmuM/KJkTovXhbZGnxasysqCGdPRaxahnWJrjRdVkudOWLPJsw+Kj
         r9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746424769; x=1747029569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKbHiB4RZA41z9Ie8R/mefcD/M19yRwwyT/XOpBK3WM=;
        b=KjpFS/oo5kuv2xeAKSctVZSyY19qH/4pXA0pQpQktiPwm3iJsjF9UJDsefnwzJGZxI
         Ok2t+ZRPTV615WView9cyeh9dJTcH+zfbslEKu3GKPwb37hRKp4lr8qWsezka0uXXKMw
         xfJ1nIGZX5V/EOxaAun3xKSvId/z6PbYK6Kma6Ryv0nqCtv+nMT6n9rDMnUqu+n7sTgU
         /jlo4imiT2dRHsiIr03PV3TfNEjf7JyOfCs8x69qLg/REk175MNigzJXjTEAH8HkRbxr
         hvN0le3i48S9bNaQc9AD6cdoZjxUsc2O4MAE54M1H3cqpIZBpjkBvvTEoW3eNZKnqrgp
         W/rA==
X-Forwarded-Encrypted: i=1; AJvYcCUu7tH0nvtNPdTyQnSu/yTpKXZiGLLquJDK8jOUoz45iy2p4EGVxS/aouBE79KgzqTcYLd4E1b7TLgSeAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhGfaj7Sg5UdgjaPcXjXNUKAN1xpcuwQ0Js6ZbOugbYjYvuX5r
	EHr0deV1GjIuKD/x88tytq2xym63+7jw2UZ1BC0oHJ+/rzopF2BauugdJsXhO9JUkyEBeX9rATA
	+P/S+u1zAY97f9SWSsXvv195ug/GTg65Clbhx
X-Gm-Gg: ASbGncvMD3TIBEE0ECIFuXxnQXnXJbLEX5z/EKkZGUmDQr+j+rWNp1SJkdgxs6B+1s0
	fQd+lfl10J9Een2rBH9wn6XlvWg/erMOqUG55ZDNU/kgmJiIp+l1c3BYBc5ltND+nOtzcannnAZ
	a8T1d3N/qjfh0rzQYInlHfaCXW0DgYRQzh3dyFwzR1y1eN9QK4kSWPrQ==
X-Google-Smtp-Source: AGHT+IFD2StGXXU4LRBTieMiBl1477i7opw2k6zaQzZpZT7Xzqji9FSBQHuj++vQYVldHnNlC03ywPxgJw7rDH3n0w8=
X-Received: by 2002:a2e:a585:0:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3233ebe48fdmr15610161fa.0.1746424768540; Sun, 04 May 2025
 22:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
 <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com> <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
In-Reply-To: <CANiq72m7GAZ4gfgiU5bXSb86R3-UMG2vsvi5J1Ua1EpVV5EdAQ@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 5 May 2025 07:59:17 +0200
X-Gm-Features: ATxdqUE_jDd0HC0IONKRAtQ24jV76OHs3LwnQnbNgHzz6cgeJxyFcYPBg_mcEL4
Message-ID: <CACT4Y+Yavh4GkocO01GSP+0hWXZNVBEaD4-9W2V452Z5+C+kZA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2 May 2025 at 15:47, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, May 2, 2025 at 2:36=E2=80=AFPM Aleksandr Nogikh <nogikh@google.co=
m> wrote:
> >
> > Thanks for incorporating the core.o change!
> > I've tested the v2 patch on my local setup and it works well.
> >
> > Tested-by: Aleksandr Nogikh <nogikh@google.com>
>
> Thanks for testing, very much appreciated.
>
> Dmitry/Andrey: I guess you may want this to go through your tree
> (although I don't see a `M:` there), but if not, please let me know:

KCOV does not have its own tree, it's merged via MM tree with MM
maintainers effectively serving as final accepting maintainers.
