Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E719BBC
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 00:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371323; cv=none; b=bx40y7IITpsTKPK2HO8cWDbOjmNF5BpmQs75ykAq/KNuLpzqdoHnSeT0vaVpL7iP/ZPr72tr+vcT3D+Hym/P88ziVkit0Te/o7IRpWRGvobbRyEU+tKhzHIkGITVTwYw/2wqb517ljSR4FztOw7DDWsMi1e1+x0EdH/hpeLpGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371323; c=relaxed/simple;
	bh=BUBqmBSIVKg5rx1sAnnhZLP/Oo7EAKUfD1TEBOq6GG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnb0jOSy1bGKyk70Qbos9/zng6oifHFszH7fgpM4EJ0zfSx1XsqU/uVaXL2NhrvTImXGRnVDzCgZI5wpSZ6af5U2t28ho3exC64nXlpK9pxwr95Tb8oyqUyKZVFdjVQae4Q7fY7MbNgNrZZL5XWjsgNT3sKkJSe5Y6hhAD2pfpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UKF5A6G9; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UKF5A6G9"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso4792260a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738371319; x=1738976119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUBqmBSIVKg5rx1sAnnhZLP/Oo7EAKUfD1TEBOq6GG8=;
        b=UKF5A6G9NeroP++vzQndO6gqFbVIKHGuo0kcuryQwNUPpXetw+QmvATNLfa1L2ls/j
         q0/8VmLk6mlYJUjI9HeifPaGRcbQ8pJKWMZyv/gYas+LXQoPDo7cS0TYXOdpRJcuwUov
         HpfyuAoZJhpoLRjjMp/rkRz78H1KXQn4teGlpWLEmBYAzzU504Cft6xUov5JfCmOxJGK
         +ibO7AX8a/jnrWcmGQjFGImDXinPBJhgwTFJsdJyl3w1zbUQiFDI/yjnOKUf9eoKZmQI
         hUyV4y+OzA1jr/PZ3JprGxdRiYLkn5GsJCsM4qADyiAlud97c5EF6k+G8gUA73pMHjvI
         Yx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371319; x=1738976119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUBqmBSIVKg5rx1sAnnhZLP/Oo7EAKUfD1TEBOq6GG8=;
        b=Ly0VOWgcCx/MGZ0XAIGmwbEhh9jpwiA8BYy/VNj/QvnOSBL6rKrWW+hu4/UCQuba3w
         wXu9CzGDjm9Q+ymN2a3wXbp+FjDow+T8xFvrKJExmyVewSi43+TKossm4wgQXdSYTB6X
         rq5ctpyUNFhMRutpoM1tpnbW2yaefzzmbEua8jheDSnKrhWMiywQDOUf01Rz0hSkojgx
         H3LQPVqEIhL///zLDswlLC8IGM4YFtCVH45uTr2FqbD39mUfBzKXDaBUtkNJFbSq+tM4
         WFLm2/HSor9jx/32KmG1UeHYDPhtusQEby5k5Ncc3xwvuXLz7MJsTeig0MJitHyq6qVR
         kw2g==
X-Forwarded-Encrypted: i=1; AJvYcCXDrhWHMx4vlcaN3nKVPk1qPHzI188x4rrauKzokYD3VxeseLrBdzBgad9S2fRWv/ysdqgJTSHS1rIQ/lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3aAUFYNphu8CmoH3wb8bn4/oIeswgnIeJWGFQB1gDdabPLgo
	X2mB/TzkRCBvTNIfC7SI+CrYmFAD+/OHpC+W5IUgbC/dA1mPYvWUdOw8l2koKTgKVBgT36rCI8w
	4y3IfXm4ux/YTQhBHJ7VGpwKXsHH5dvJZwXfPFw==
X-Gm-Gg: ASbGncvHtd5Hqshwc1RICyzVMTrkfu+5fIaypGe0o1+Z4yPQwtI9ptv08GrfTt1JL/i
	+/VqlzkLzhLT6KO95zoqGHhzDQ4LnN7FkloMJFPyY1yRYZjUp9mW6Zyd7HrOutLCzQpwoOXJMeF
	ijUOaHSjwX5sA=
X-Google-Smtp-Source: AGHT+IEfN430KVGzVEIC67t7KB8Mz02piO2RrmwOf5NQLjY0z4Kp54i/0ziMFVn+Dpd/gcIikyhjz2Me5teiomW7EuQ=
X-Received: by 2002:a05:6402:847:b0:5dc:783e:3efe with SMTP id
 4fb4d7f45d1cf-5dc7fbb58ebmr6065766a12.6.1738371319511; Fri, 31 Jan 2025
 16:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131232851.36345-1-kuniyu@amazon.com> <20250201002448.43472-1-kuniyu@amazon.com>
In-Reply-To: <20250201002448.43472-1-kuniyu@amazon.com>
From: Yan Zhai <yan@cloudflare.com>
Date: Fri, 31 Jan 2025 18:55:08 -0600
X-Gm-Features: AWEUYZnxrKPAr54D2ma1963U-V2YxxP27RimDdh5gFD3F1NlBRrlthhxtNDpDLM
Message-ID: <CAO3-PboVUb=ZPVVsELrhEh_Z_0PNbwcTdMxfKhoRtbagPy2ovQ@mail.gmail.com>
Subject: Re: Unchecked sock pointer causes panic in RAW_TP
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 6:25=E2=80=AFPM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
>
> From: Kuniyuki Iwashima <kuniyu@amazon.com>
> Date: Fri, 31 Jan 2025 15:28:51 -0800
> > From: Kuniyuki Iwashima <kuniyu@amazon.com>
> > Date: Fri, 31 Jan 2025 14:38:38 -0800
> > > From: Yan Zhai <yan@cloudflare.com>
> > > Date: Fri, 31 Jan 2025 12:32:57 -0800
> > > > Hello,
> > > >
> > > > We encountered a panic when tracing kfree_skb with RAW_TP. The prob=
lematic
> > > > argument was introduced in commit ba8de796baf4 ("net: introduce
> > > > sk_skb_reason_drop function"). It turns out that the verifier still=
 accepted
> > > > the program despite it didn't test sk =3D=3D NULL. And this caused =
kernel panic. I
> > > > attached a small reproducer and panic trace at the end. It's stably
> > > > reproducible when packets are dropped without a receiver (e.g. run =
iperf2 UDP
> > > > test toward localhost), in both 6.12.11 release and a recent bpf-ne=
xt master
> > > > snapshot (I was using commit c03320a6768c).
> > > >
> > > > As a contrast, for another tracepoint like tcp_send_reset, if sk is=
 not checked
> > > > before dereferencing, the verifier will complain and reject the pro=
gram as
> > > > expected. So this feels like some annotation is missing? Appreciate=
 if someone
> > > > could help me figure out.
> > >
> > > Maybe __nullable is missing given we annotated skb for tcp_send_reset=
 ?
> > > https://lore.kernel.org/netdev/20240911033719.91468-4-lulie@linux.ali=
baba.com/
>
> Just for the record, I posted the fix:
> https://lore.kernel.org/bpf/20250201001425.42377-1-kuniyu@amazon.com/T/#u

This fix in the other thread is working as expected, thanks for the quick p=
atch!

Yan
