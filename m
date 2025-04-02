Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B771F0E40;
	Wed,  2 Apr 2025 20:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625781; cv=none; b=QozPD3KaGTEQQIGCeRnHrMLwTOvHmOtDK7He+ZE3UV3KeIcGDDRxn0rC5W7aDOpjmULguGBstQL2FZ3Rr+IlTjeUZliPDa+yWVtcRoz98fauYwqgkqjAHJOEUad5y6S1NhsUvytsPp2tJlWT5UmGpXV8XR98DDfM8xRrsYOtrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625781; c=relaxed/simple;
	bh=G2MDdEdO8z0KC+Zdy7504GbR+idMVp6LcuRq7ECu370=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKwJUg8FauB519DVB7sPIkxONHLBtFhaAvITgxqzrjrrdZPIBEVMjPUjAmP88oJlDOQFDUif3jitHKfZY4y4PulJT2Wno5ps+Z4+e89SMFP/zRRzyjlDr9R04s8NmbJBpOMS7jifei/k3XC/kS26EPQh1UreEZ6BDU6tMHbacf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3+zKsWE; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3+zKsWE"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so26605a91.0;
        Wed, 02 Apr 2025 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743625779; x=1744230579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2MDdEdO8z0KC+Zdy7504GbR+idMVp6LcuRq7ECu370=;
        b=Z3+zKsWEEs111SDpSpJEjc9z8HzDLkgSHUAR85c2qFtj7+y/w4bklUX1NVgEcMG27T
         s8IikfSSgmee8VUphPEUucyKXRhlYaOvdn18RpRxv3yeUKkzIdEVUGXWC5ktuDapZIpi
         Jj6RRqzZBCBi3KUKnVYtQYKAAT0E47sYKpg4Zkc5+mPctQduevlWumyqeINHcZUcqiuV
         iS/93ZAdAMViHlV/ePXVSyGq3KMP8ZzCnHBfQ9B7f0Qk/khBazcsSydZu9pIUSND4wRK
         ZaqzYZwNjlypYX6RbalCbHGUXBvjKD/ojw+nbdlpcE9Yqga6velrBZNep9LYeHcgk848
         RfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743625779; x=1744230579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2MDdEdO8z0KC+Zdy7504GbR+idMVp6LcuRq7ECu370=;
        b=kdMPIOWTDrndYMFNVNukVL5QBCK8QLZTFIlVWpx4huVX3B/VyoHmIlzSofaG9JWcAw
         WLENCRuIKRtGpjnWFdfaN0hcq4lax+CS7hOjK2ZeYLL7K751J6U0eoJBfd95/HDxHd73
         c8uAz4nl+4+8f/XBPNqyRpAurOTT3Dtj4N4gskBbXd24/N7pb9KjRjY20mtGHxSY0MTm
         1wSlTpomRlGUT65vPOdZj+xtfyKwergeUsd53KgpwLolz/GrlT2D+wPvKCRi8lbkk498
         sPitSpWAZ7poNadfPLT3wURMhG//tblbzLuqNZR9HMqAq3C6TAPgKswx2x1wwJlZMOWy
         BySA==
X-Forwarded-Encrypted: i=1; AJvYcCUbBAmwppbc1YfZFKhu8T5waB7WXuZ+eN3ZEuHHrAZS4uyInq09gvzIEsWLtCLyEG/P8+I0lLSV0Fzf+d0=@vger.kernel.org, AJvYcCX3nkhr2iYhZPav6VbcVUr28iTZ2x/GuJRSRKUhLUOK0bjkbk1aK9rnSg7oygLJLsXGN5GJscrsZiDW4BglQo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxshyyw3Vzv5Gmb256vyWaQwgQY+KiSRIfsL3gFhxKIfX7vOiPT
	M5t6PCcdRGFO0+47OEYXTBCUtgNkgr5q4xey3E4GC0QTVavS7FG028y2+3zAANMyNLrDO2NHKk5
	KRLNua96uQeEo6Jbvpaqd9knMR1FIyVII
X-Gm-Gg: ASbGncsoSGjWQVQcy7s3Xww+uWSCuSnxnn+FrT8GCSNwSp3WXiMKod0J+R0YOOLWY11
	y/jlOxE56tpU0QiHNbezV7S5Eb/JCOc8+7SF0cCIIlAoqskOpQmQgLnTqHZPxN5NoXxoOym4hRa
	CZmLKjdjOa1nxf9EDjlCgPY+s=
X-Google-Smtp-Source: AGHT+IFCmvkmz5a2ce/qEErTy+ix3lRxJsnJ8qatRbe6xQkTV1eTtqypTjSAmk71nyPy+VkbGf6oJPtgS+lqMyJ4Z/w=
X-Received: by 2002:a17:90a:e7cc:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-30562ddfce2mr4049565a91.2.1743625779225; Wed, 02 Apr 2025
 13:29:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
 <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
 <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com> <CAJ-ks9nfEg=sdn_-q+xOc+k9mU0pdMuumwRb76LXzE3RcOtg6w@mail.gmail.com>
In-Reply-To: <CAJ-ks9nfEg=sdn_-q+xOc+k9mU0pdMuumwRb76LXzE3RcOtg6w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 22:29:26 +0200
X-Gm-Features: AQ5f1Jr5D2JPo_bfn1lEtiLKIRtSrkGZ03A37KRZeYcdWqFq9fOb3M7KrVF5WBA
Message-ID: <CANiq72mERwbmXYq-pi=WUAZ_VYGcBVS7tzH4P5zSUVCMcL4-CQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 6:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> The counterfactual is hard to prove - you don't know what true
> positives the lint would catch. In my opinion disabling lints is
> risking throwing the baby out with the bathwater.

It is true that it is not easy to know what we will exactly lose right
now (apart from what it claims in the docs and its examples), but one
can easily test enabling it in a couple cycles and we would have some
data from kernel code.

To be clear, disabling now does not mean forever -- we can reevaluate
with that data and possible improvements to the lint that happened
meanwhile (sometimes they get improved or split due to feedback).

By the way, the lint is in "pedantic" in Clippy and disabled by
default -- so we are "only" disabling w.r.t. what we do nowadays.

In any case, my main concern is cost: we already require a lot from
Rust kernel developers, typically more than in C, and while one goal
of the project is trying to see how far we can go on being strict
about things like lints, I worry we may overdo it at times.

Cheers,
Miguel
