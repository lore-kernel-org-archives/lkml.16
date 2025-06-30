Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D328B7DC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290102; cv=none; b=iusHf7LW0PmSMsggHw3yMLeXxVhE7H4/MfdZK6bhL7Pqh04avrt6M++T1UTYk3c5h83Ym+O7woB2DJvqGAaqf+INyY51pi8CXRNcl6bAGeOvCd6P9zDjqevh+ldaOVtFUlaRQWsPi4cr/juJ6aaLs4W4e14RMYDBVaun6V4S7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290102; c=relaxed/simple;
	bh=JOPlee8+H1wqCZ/ex4u70pd3NWavrS1JM0blGK0HgUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICc8tthJ56LLqFRIf0EeqJwsJ1p924mNPc6zyob9eKALON9y0F6Wp4mOCdIhbQD6Izb+N8oH1G3GKkcSF7eKgpU82GMiBusu8BdIHk/SrKR/wZvI+8+UodYe0pG5fBoAixgpTD6cyAldqH04gYk4S6kiOXF6oY0F66NGSNe208U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=KHPEZGc+; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="KHPEZGc+"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so3962651a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751290098; x=1751894898; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JOPlee8+H1wqCZ/ex4u70pd3NWavrS1JM0blGK0HgUI=;
        b=KHPEZGc+l3XTOiNeIK/SH4Vj3ktmjbktN86pSTlJpeSSubVlwrKT3rM2f94lb6sXVq
         Tb1JJzsbs0v9dK+zkz9ukRyQQnIkKjZxVX430ZovDeihIu47oGVkSJG0qci/lSc/jofj
         bnSqgi+yatHCXYVBHDKDKdJafTzKCXexyytrGoPANTNPh2iNzbqki71MrQJg7ioalQVt
         LAO6l3nEYmP0fx4nzSbXdg1kb2P5Q/XW/HXcLxFOiEU/6T+e38B5tF1mdYQZj0ZNOPoq
         Abj8fpg/yLm1lPTqsrhO9IwE+D8SY+7QJYPZR5R5g1x3XfjjCxLO0etvFvH80YKteyyx
         w3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751290098; x=1751894898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOPlee8+H1wqCZ/ex4u70pd3NWavrS1JM0blGK0HgUI=;
        b=DmXMoS16SQIaZSNttLCUsBUnGidF7KRABvY2aSGXK7phQl50bC6wfS69TYn5iRkZG/
         D3iT++jjgJngDr0/1qS70ycWXDeWPJOxDkBrIznBChQroFleTlTB7a9kdRnbHP7UCYIK
         J69t7KUmCwUG4ZLj2Y1AtNQU0mTWDg6ECscJIaECzDNvkN/+6CbvRVtptOSCQFkQoq2E
         7C44i6hL5QH3fccR7uKNpMSVhQs0tEDWJZJcS9aWImF9+VOvU4uOU1OyRBiPp5OWjF0w
         MDL2MTAOvgWfHkVA3pEjG4DhLIT6wS4dPhPCDZKUAB33dhKwVxXBk95mY4UPEftp28rg
         Fn3A==
X-Forwarded-Encrypted: i=1; AJvYcCXJLxYHalFrEu2SE4ASAIpIwiKnCAcrTqFMZ2P7Ev4QUAcohyqNffdZRGH9QhrhfsCmGETLrxDXlMZh5Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCGHxuGffvCjrtflzcPUchRPrXYYLn43BhzzX3j3lwyqPNrf11
	QumM2VeqkFeRuknXMNQRznQSJt3OnGgi40RzZbeM5MTHlYKaq/306qoQuMhXayEgEgQHR8roDxu
	dnxGR9VowTMc55fAScFN+ap9JdQI6KbMZ3XS9PyY+KA==
X-Gm-Gg: ASbGncvJFQr85YcAfWFKQQ0AOUXHnbWBlrF8HuQ7/lNa6+jFOAn0XeO+IqZuaDUaEcM
	tXv0dLME69TcJGvVv3XIwuFbhBh9UNlfpjhT0gSazNRi5u+s/uqGkirzcK29s+63d2W1p9nP/yX
	v7Rgq9EbqVjE5NAMLGhilvQBH1Q9QopCdAhPVafEzIDU8rkj15hkNW/ifKqfZWeYKJwKbUUQ==
X-Google-Smtp-Source: AGHT+IHCK0fPjZVZy4IAIBdmQg4VEfs7xo5JaePIp6jIQWk4rF8khpEsxLOS+G1AlpruG5EP5fXrkymRLvSpySiCwDQ=
X-Received: by 2002:a05:6402:5108:b0:5fe:7b09:9e27 with SMTP id
 4fb4d7f45d1cf-60c88b55d4dmr9970788a12.12.1751290097533; Mon, 30 Jun 2025
 06:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616095532.47020-1-matt@readmodwrite.com> <CAPhsuW4ie=vvDSc97pk5qH+faoKjz+b51MDYGA3shaJwNd677Q@mail.gmail.com>
 <CAENh_SQPLHC8pswTRoqh0bQR84HHQmnO3bM07UQa1Xu9uY_3WA@mail.gmail.com>
 <CAADnVQ+QyPqi7XJ2p=S9FVDbOxMXvVPU859n+2ApuRQv5T2S5w@mail.gmail.com>
 <CAENh_SQgZ5yVpshKRhiezhGMDAMvgV7SmwD_8u++mACE33oNrg@mail.gmail.com>
 <CAADnVQJgOyBCCySnBkTk-VCsz0dy+ppdGHpggxbtDpBBGhaXVg@mail.gmail.com>
 <CALrw=nFvUwmpjUMYh5iJqjo6SbAO8fZt8pkys7iDjZHfpF2DxQ@mail.gmail.com>
 <CAADnVQLC44+D-FAW=k=iw+RQA057_ohTdwTYePm5PVMY-BEyqw@mail.gmail.com>
 <CAENh_SSduKpUtkW_=L5Gg0PYcgDCpkgX4g+7grm4kxucWmq0Ag@mail.gmail.com> <CAADnVQ+_UZ2xUaV-=mb63f+Hy2aVcfC+y9ds1X70tbZhV8W9gw@mail.gmail.com>
In-Reply-To: <CAADnVQ+_UZ2xUaV-=mb63f+Hy2aVcfC+y9ds1X70tbZhV8W9gw@mail.gmail.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Mon, 30 Jun 2025 14:28:06 +0100
X-Gm-Features: Ac12FXx0fYS0dAUVkSwEgtfKWEJIu58_CB5GnzygkiN6a3f1tL111CFtlrAmvas
Message-ID: <CAGis_TUNfUOD3+GdbJn1U33W8wW5pWmASxiMa5e5+5-BqJ-PKw@mail.gmail.com>
Subject: Re: [PATCH] bpf: Call cond_resched() to avoid soft lockup in trie_free()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matt Fleming <matt@readmodwrite.com>, Ignat Korchagin <ignat@cloudflare.com>, 
	Song Liu <song@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-team <kernel-team@cloudflare.com>, Jesper Dangaard Brouer <hawk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 20:36, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> Good. Now you see my point, right?
> The cond_resched() doesn't fix the issue.
> 1hr to free a trie of 100M elements is horrible.
> Try 100M kmalloc/kfree to see that slab is not the issue.
> trie_free() algorithm is to blame. It doesn't need to start
> from the root for every element. Fix the root cause.

It doesn't take an hour to free 100M entries, the table showed it
takes about a minute (67 or 62 seconds).

I never claimed that kmalloc/kfree was at fault. I said that the loop
in trie_free() has no preemption, and that's a problem with tries with
millions of entries.

Of course, rewriting the algorithm used in the lpm trie code would
make this less of an issue. But this would require a major rework.
It's not as simple as improving trie_free() alone. FWIW I tried using
a recursive algorithm in trie_free() and the results are slightly
better, but it still takes multiple seconds to free 10M entries (4.3s)
and under a minute for 100M (56.7s). To fix this properly it's
necessary to use more than two children per node to reduce the height
of the trie. And in the meantime, anyone who uses maps with millions
of entries is gonna have the kthread spin in a loop without
preemption.

Thanks,
Matt
