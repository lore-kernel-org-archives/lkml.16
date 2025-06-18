Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0C6285C8E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256860; cv=none; b=ubu9iPkMetzcnT1iSKu0IkZQ3y88SsA5iAUJxd67HSLYzS2FfOYheFxy3ALIsJtJ8rLRdOd9WVHpWnWuhLy5dJHIPIxTaJmdd8Czn/z2n5pmyipBZ+ELA8SOD1sMStMEMLGZDqjvfEoNMUuuJMKorPZF0T6spaVfA9I9t0edduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256860; c=relaxed/simple;
	bh=0R04X2IxAUZ+Y0jSm7qz0sa4qxhk6NzAtpPdgD8xbVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DT168LoWruTS/KGmCZ/z+QCMNIl385C7Wc+rMKwbU+5DO07G0vbQZIRu9qhmDdWqs9BTLyEhtF9dOXmK1H5u4yUdPdDPmUGouUwpL0LmnI4SGVqEWAGflz5O/w4zS9UX2B+XVMJwWycWAtPW3erMHyRoJy2FRLJ3u5g+MIpZTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=M8F939s6; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="M8F939s6"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32addf54a01so73028001fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1750256854; x=1750861654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R04X2IxAUZ+Y0jSm7qz0sa4qxhk6NzAtpPdgD8xbVQ=;
        b=M8F939s6AEUCMyHjj+jeloh3DP6d22N7SImeAmZ0qEzWxA1fhP/5tFCK1U5OsJ0kPG
         si6gpln635DkGCqpQX7pZ44u0T1Fuqq1LH9OQA18hHD+xgEyNPGZM/p0xXeyn7nowqMK
         Gfck6hyqQmu2QsIcQVr3qCWVChMW4ZLCEu2RNJypBcfXWSW5G+2TjRkJlUR3TSoVjoBu
         k4nYslmXfLO03hEHcTl6tfRs8ltl88u1Q9ZGbymcAGajCajMDq039AHx6O9syvYyKim2
         xWYmI9BA80QODd+z/b+ldOr6YXmrgj5vS2aJNMkxYK9kEn/793ejXhnoj9pKgq+ZdKi1
         Hq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256854; x=1750861654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0R04X2IxAUZ+Y0jSm7qz0sa4qxhk6NzAtpPdgD8xbVQ=;
        b=Kj61aaKzdDpjdQ5pPtkFbAze1ZSID4ljFO6XdOCwI+fXyvEFIan9uHK/+jiWnH28t7
         xqA6NSEKzKwgyDCQ9h5MFAH8nXotPZqBHkUy/yXvl1SjfFWjhy8ouSKKYKvcGf7nug81
         ZqBtm+Ir2dhdE0xactQLppBFyUE2yYEIiNz9Fv0Si8BMwoT0D1yCybBIXYTbs01j7kuf
         pCZ2ITC3Axd9ryXGduaEt2xEfeMlZ6KbAIMXzXPYOIVfKeBlQY4WXKSPGd1EQJDZeqdM
         LaWILEZiLE/5+ec+XgGChjCwJRSBzKsHrhxdRB3Mfe4vFNHyWHYyIRLrkcVs0el7yx4s
         We1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKEE/26ubU/uZrn6SP0rZGQYE/LAvM2NRD775uVijISddj7ExmfNhyW2ovX8Oy3D+BvFIzmFADJU8RXzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2T+dPmnIJdcG1qFqtKB5qHO5TarSYdCgVOSFOeaqBhN0VT33j
	/2CDrFuNRem4+NgiinIjlOtbl9dTBJM9MGPqsB1JKXpaRr9/553NmwG5wvSJQg/N6Iy0MvFabD3
	7/KDzhlXgXgQ/s//NiSiqwEPtLYn//y/4IYqmPJzHUg==
X-Gm-Gg: ASbGncvuPtVPqM1swYgvLaA+BGnX6F9tnn0Uuf8OsoneP5yDPHW+MWTu+BbSMrUThKt
	t/AeW34v7z3igo7VZCTbaoyuoYsOT9MBe7Kb1dbMKliCNUGxb735WpMQDViHfU2ja6ih1bYIsiA
	K8KnrzXascMsc/gTKCVRO4t+v5kKouXOru07WeE5KfRtkUScD8nrHrW3Q7WY+wVw==
X-Google-Smtp-Source: AGHT+IGGgI3FTwdOcK8RLKdtKdhn3U4LuZlr6R5KwqYquv0mpgnRFvgV/Xu6G6n/cNU5rLBns6CPyI5rMhviN4oJemU=
X-Received: by 2002:a05:651c:1987:b0:32a:ec98:e15c with SMTP id
 38308e7fff4ca-32b4a5ca0f9mr60085391fa.19.1750256854524; Wed, 18 Jun 2025
 07:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
 <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com>
 <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
 <CAENh_SQgZ5yVpshKRhiezhGMDAMvgV7SmwD_8u++mACE33oNrg@mail.gmail.com> <CAADnVQJgOyBCCySnBkTk-VCsz0dy+ppdGHpggxbtDpBBGhaXVg@mail.gmail.com>
In-Reply-To: <CAADnVQJgOyBCCySnBkTk-VCsz0dy+ppdGHpggxbtDpBBGhaXVg@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 18 Jun 2025 15:27:23 +0100
X-Gm-Features: AX0GCFsaM9DGTqH4WJ6Z032fn61el3PhuhfhzVPYIHaWfMnL8mcSuRqckaKRyAc
Message-ID: <CALrw=nFvUwmpjUMYh5iJqjo6SbAO8fZt8pkys7iDjZHfpF2DxQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matt Fleming <matt@readmodwrite.com>, Song Liu <song@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, Matt Fleming <mfleming@cloudflare.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 3:01=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Jun 18, 2025 at 5:29=E2=80=AFAM Matt Fleming <matt@readmodwrite.c=
om> wrote:
> >
> > On Tue, Jun 17, 2025 at 4:55=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 2:43=E2=80=AFAM Matt Fleming <matt@readmodwri=
te.com> wrote:
> > > >
> > >
> > > > soft lockup - CPU#41 stuck for 76s
> > >
> > > How many elements are in the trie that it takes 76 seconds??
> >
> > We run our maps with potentially millions of entries, so it's the size
> > of the map plus the fact that kfree() does more work with KASAN that
> > triggers this for us.
> >
> > > I feel the issue is different.
> > > It seems the trie_free() algorithm doesn't scale.
> > > Pls share a full reproducer.
> >
> > Yes, the scalability of the algorithm is also an issue. Jesper (CC'd)
> > had some thoughts on this.
> >
> > But regardless, it seems like a bad idea to have an unbounded loop
> > inside the kernel that processes user-controlled data.
>
> 1M kfree should still be very fast even with kasan, lockdep, etc.
> 76 seconds is an algorithm problem. Address the root cause.

What if later we have 1G? 100G? Apart from the root cause we still
have "scalability concerns" unless we can somehow reimplement this as
O(1)

Ignat
