Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333333196A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470501; cv=none; b=u8ciY/XPptoFsy5V4bsgjwtXgPBetyokMnl6gFtAr+kdF9TPeDAqA3yDM0J6n8tTkkkGIfYov51iDzA6dkDlUgxuSnX+yAFRSJD8rz27gL322wMyKdMEoyRVRfDwaxlsQIsikLtkkyiDtmW0xQNXuDn2xf4XB60m2g6SHPsrUdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470501; c=relaxed/simple;
	bh=X5Pg+wgXFm16CVeDFpFrkfl+l1I+ELDxLnT2XAFjN+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mctgPH0JG6rZwTrx/LZ4/C9YFcTcl24ZJGsnQg3L0XsWZ33bHwgCLisQDQC/NVtA8x9U/Oitfkpo7Ph7f2cwUw5u+68SzDLomlObeKt5YYoMeAGvzJgkvlYOnT8bJWJOUfiIw1YquTSXlHJm8emf78xd6mUg+oWo8p8kh7Mq7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CWIbQor8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CWIbQor8"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a43d2d5569so56233321cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751470499; x=1752075299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ua8RzrDoKZ7Kn0p7xIvCw4idk9i+4iHFHwyTPoenIU=;
        b=CWIbQor8G3rPGOfzKBiLCuRddu5c5x274c6nJYcOnMaBqrI2cdVvfJGNc4iwfUDA6j
         /C7EeKq9xtaoQ+9+k9gdK6S6AjPa7JfxXjB2sPRguqbPVs6ddP8U/m85QaALXQ7j/7c7
         f2ANjEG/4T/uWKhg6JLjDVF8a4RqiR4xwoTYSFdLuypJhXBLoKDr+Z39aMv/mFbpUECl
         QQzyKku/vCArVHIVj1LISSyHnylcG0SAbaAnGgtQcE+JJ5bYQ/mVpjCEvmjxlimnF2g0
         B0HZ+J3AqwZ5X62mZ+uR/D67UU64aMPkiHPa/HFals0XZIZyIYYdDQ6HxoRJxWKVOwko
         B3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470499; x=1752075299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ua8RzrDoKZ7Kn0p7xIvCw4idk9i+4iHFHwyTPoenIU=;
        b=UZJT+M+zlb3pfXnbElEyHAaICifHK7Hek3c9En77UVOyl9yQpS1XYdviIIb4l1gUAf
         PgMzN0WeW0Bz9p3sODmR771mCFxvNLephDHKgi/pP7SUK6+v7uIqgNX0f/NzsRu/GHqE
         66QKGZlgufOqzm47VotsVHuF4zquQa1GzjRk3zStxNfMSXmLnMFgGAVbWROEvEYnqVDl
         /gbYV0CGWCKan+fQJgVrgLpw157dZZL6mTu9s84PQuSYVYb5TitKOQXXSIpMx6eJuymY
         9AG+HPKfcLIO/Gqqn3z6SVqweDMc8RGOmAQa7Y1OWBqTtcvuG7qdrIGKmJIR8k3/5C/L
         MKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2qRzJnu6rYqLFRaNmMjauroKSO0Q2COQv2My3LtKCl5AhLAA4pxIMs0YMoDapQ26WUtuVMmyQvKttLqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdDdmONtCKPMnCSu55APvI9GIq0/0GkmEcEAQB2KyloH3InDmw
	IWOiwnTgAW8Q6iwDD8wjeuDjUDwaoKkljZOeI741bqcFwwDk3JEl8MnG0n+Q3ZN174zNSimn8yU
	/6WC9PlEARL/YplImd1D6Yg12WezXNjbTmrud3OX0
X-Gm-Gg: ASbGncvkkCaR/V0AdSAe3+uAUs04AyNiAME6tl2lyustICnuQfsq8uWvU8L2TnoHg/8
	vLv7TdRTiAGHGmRe8I6u0quE7D4nbwej6GlTqIEXh+6JPv2OJMjj+Nz9c1rkHC0wXHutcS4NH8b
	TRjG3yO61BsPsGe9AH75M3P/lMFxlX4ie/l7OOzj+/Tg==
X-Google-Smtp-Source: AGHT+IFpOBPmeAdBhhrmEqycOyHbAY2mEA2NG2sQ1+ED7v7Oou4lLiPkXSbxRz5Ry5wbchr7ZDqTH7qW9Jsw+HS7kiE=
X-Received: by 2002:ac8:5854:0:b0:4a4:3963:1e10 with SMTP id
 d75a77b69052e-4a9768b6d60mr68180191cf.13.1751470498608; Wed, 02 Jul 2025
 08:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702110039.15038-1-jiayuan.chen@linux.dev>
 <c9c5d36bc516e70171d1bb1974806e16020fbff1@linux.dev> <CANn89iJdGZq0HW3+uGLCMtekC7G5cPnHChCJFCUhvzuzPuhsrA@mail.gmail.com>
 <CANn89iJD6ZYCBBT_qsgm_HJ5Xrups1evzp9ej=UYGP5sv6oG_A@mail.gmail.com> <c910cfc4b58e9e2e1ceaca9d4dc7d68b679caa48@linux.dev>
In-Reply-To: <c910cfc4b58e9e2e1ceaca9d4dc7d68b679caa48@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Jul 2025 08:34:47 -0700
X-Gm-Features: Ac12FXx6jtg32Uv0ROfXCLrCxBt-tQEIP4ICXS08gQYhuKIX3AmgxQnC49weVtw
Message-ID: <CANn89iL=GR5iHXUQ6Jor_rjkn91vuL5w8DCrxwJRQGSO7zmQ-w@mail.gmail.com>
Subject: Re: [PATCH net-next v1] tcp: Correct signedness in skb remaining
 space calculation
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, mrpre@163.com, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 8:28=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> July 2, 2025 at 22:02, "Eric Dumazet" <edumazet@google.com> wrote:
>
>
>
> >
> > On Wed, Jul 2, 2025 at 6:59 AM Eric Dumazet <edumazet@google.com> wrote=
:
> >
> > >
> > > On Wed, Jul 2, 2025 at 6:42 AM Jiayuan Chen <jiayuan.chen@linux.dev> =
wrote:
> > >
> > >  July 2, 2025 at 19:00, "Jiayuan Chen" <jiayuan.chen@linux.dev> wrote=
:
> > >
> > >  >
> > >
> > >  > The calculation for the remaining space, 'copy =3D size_goal - skb=
->len',
> > >
> > >  >
> > >
> > >  > was prone to an integer promotion bug that prevented copy from eve=
r being
> > >
> > >  >
> > >
> > >  > negative.
> > >
> > >  >
> > >
> > >  > The variable types involved are:
> > >
> > >  >
> > >
> > >  > copy: ssize_t (long)
> > >
> > >  >
> > >
> > >  > size_goal: int
> > >
> > >  >
> > >
> > >  > skb->len: unsigned int
> > >
> > >  >
> > >
> > >  > Due to C's type promotion rules, the signed size_goal is converted=
 to an
> > >
> > >  >
> > >
> > >  > unsigned int to match skb->len before the subtraction. The result =
is an
> > >
> > >  >
> > >
> > >  > unsigned int.
> > >
> > >  >
> > >
> > >  > When this unsigned int result is then assigned to the s64 copy var=
iable,
> > >
> > >  >
> > >
> > >  > it is zero-extended, preserving its non-negative value. Consequent=
ly,
> > >
> > >  >
> > >
> > >  > copy is always >=3D 0.
> > >
> > >  >
> > >
> > >  To better explain this problem, consider the following example:
> > >
> > >  '''
> > >
> > >  #include <sys/types.h>
> > >
> > >  #include <stdio.h>
> > >
> > >  int size_goal =3D 536;
> > >
> > >  unsigned int skblen =3D 1131;
> > >
> > >  void main() {
> > >
> > >  ssize_t copy =3D 0;
> > >
> > >  copy =3D size_goal - skblen;
> > >
> > >  printf("wrong: %zd\n", copy);
> > >
> > >  copy =3D size_goal - (ssize_t)skblen;
> > >
> > >  printf("correct: %zd\n", copy);
> > >
> > >  return;
> > >
> > >  }
> > >
> > >  '''
> > >
> > >  Output:
> > >
> > >  '''
> > >
> > >  wrong: 4294966701
> > >
> > >  correct: -595
> > >
> > >  '''
> > >
> > >  Can you explain how one skb could have more bytes (skb->len) than si=
ze_goal ?
> > >
> > >  If we are under this condition, we already have a prior bug ?
> > >
> > >  Please describe how you caught this issue.
> > >
> >
> > Also, not sure why copy variable had to be changed from "int" to "ssize=
_t"
> >
> > A nicer patch (without a cast) would be to make it an "int" again/
> >
>
> I encountered this issue because I had tcp_repair enabled, which uses
> tcp_init_tso_segs to reset the MSS.
> However, it seems that tcp_bound_to_half_wnd also dynamically adjusts
> the value to be smaller than the current size_goal.
>

Okay, and what was the end result ?

An skb has a limited amount of bytes that can be put into it
(MAX_SKB_FRAGS * 32K) , and I can't see what are the effects of having
an
"not optimally sized skb in socket write queue".

BTW if you have a tcp_repair test, I would love having it in the
tools/testing/selftests/net :)

Thanks.

> Looking at the commit history, it's indeed unnecessary to define the
> copy variable as type ssize_t.
