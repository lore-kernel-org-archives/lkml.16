Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AB1B0409
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172887; cv=none; b=SefQnYS4cfPl5A8tKrbyYutwbWLFE3+OQfxfX1eHf0y3JLlWFm0sENBMAxPDUnwmHaU6ggaUqcaQGQlY0m7alnNRdn7iadZAi54WN1G5PJjC0AHM5JZmyfhlbwXtnD0CuUMk9iGPMARBuMDAbl3fAbyFIkg1PPAqtGehXh9EH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172887; c=relaxed/simple;
	bh=Go5+klD8HkKk7Li1unDEFaCuNXVJsJzv7y6c6Dnpxg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rrf2Sf0K1WWqaBEK/XKTsvHalwrX8ncpJayDzptXBrIpNSMtW1VpAWk83nu2HduHXaXUYS6fIXSRWCAQCl5sXV+koU7f8UyTB6X8nBG1mGV7ESzA92aFB2FCHQNfTUB1g4eI88KMe7NnfFMu6Oqfbll4e2RiQgPiPFmszeAFBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X8V7pgnB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X8V7pgnB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e1eafa891so64175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747172885; x=1747777685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Go5+klD8HkKk7Li1unDEFaCuNXVJsJzv7y6c6Dnpxg0=;
        b=X8V7pgnBH7ps++IOxXnTrN9yjBAUYocMo9Z5qTyjFIw+rlmqZX8EQb38EeRm+03MGB
         B8OCOr6yi+DGnUF30pdJNNkcFYM/vfS2jyRauIgy7UqXh3AFQ9cbrERao7WV6aE5mgSB
         KOj91koSc9Px/Ouuh8YETGValXz9LoDoY9IT2rA0NF751kGemDviM5aKMdUKOkvCOVUQ
         EOlgc2JxrePPB7LL+T895UkxJICyVuJtKyHGT4jd2ijuudZ51r6jOStpdnNUO+S8I0WQ
         fOID76fVBdnVhQ8As1e5aKjsQe0M+g/4y9c8B28u1jVQjMzlKLgP64o49g7DPU7tJ2IO
         mwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747172885; x=1747777685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Go5+klD8HkKk7Li1unDEFaCuNXVJsJzv7y6c6Dnpxg0=;
        b=PUvKR5qpMV4LTH92yoe7q7JSn/8HVZ7FddZsj37VpmdTcnbDhvnEMOGlgHVKeEVxyL
         tjSAXx0HOIgYIl+rczZyre/ehcQFva2PBs5tJQlv+I8gInzojTB9FPywXzKxipZZT12y
         CdlgdFC45Y7ya/dVV48t0DaNOI4X8tlgYq37rKKTTWJHLuwQ4V50HdZhTTse4lUPNe+q
         /D1NQ8c5UhKXV8B2hTTymNsEwv+dKvkudIuKQ3fxsywOi5maXK9+xwnTofBxOVUzJ3xa
         e0L1E/XC9plQ+UVLkedKaSrvMQsxjNo+gwR+QKHHrEjMw+pc1lOFjj9C+8JJpVdJb15z
         XOFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkb1/CmK2mXW7K08AdOJ+L7iuOswgozepnzcLIR+j+DD2xxF6z8cbxFT1BG+uC818Z/5Yk7cc+rL9y2VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSEqpWQ506XnFUR/A37PGfD+0Mvkuzk+X2TugYtqAoN840pEI
	wfn2ACiNAz3e1nEfHkn1yZB0NTaEUHVRUJ6pn4nMJKTg2X+L6EG5KYmkGXjDdUf2orwZ4Sr8e7C
	TNBPeM3EEW7eA7Lta9QM22yrAw81JTANNxkmRR4tm
X-Gm-Gg: ASbGnctAskITwGdeoABpY31hXiM9Ccgzw23iM8NUIpya0soELMomIjGIjI2eH9mwyNA
	XXy5Ot9T2A3N8KxnPR3DRqWv+AEB/YV6UbSAp75F+cDGkpu2s6VQ88ej9qeQZWIGBWOKPYSGBfe
	BMPfjOwO7hk5Yev952boyvzZSBi/1+Ln/HojSVV4Z2RjANNi5EgLPxxpjsmKdwDw==
X-Google-Smtp-Source: AGHT+IGWnW2WGxzwBbXWKiTn3MvoWiCD0XtTUgC4Dyy6a5CfSo+75wPjhsjn9A6aqbNxMFJ5cC9rThSPTVN3I4JESDE=
X-Received: by 2002:a17:902:f708:b0:21f:3f5c:d24c with SMTP id
 d9443c01a7336-23198fb5195mr1065335ad.0.1747172884970; Tue, 13 May 2025
 14:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512055748.479786-1-gautam@linux.ibm.com> <20250512055748.479786-5-gautam@linux.ibm.com>
 <CAP-5=fWb-=hCYmpg7U5N9C94EucQGTOS7YwR2-fo4ptOexzxyg@mail.gmail.com>
 <aCI0oDBSz86S9fz-@x1> <CAP-5=fVYXRzQjRzcDX0aJv5yg3bwDO+PWHfP-Laig0s3cnzcaQ@mail.gmail.com>
 <aCOwnUUVKx798Uza@x1> <CAP-5=fXK9Jru+ZqeTSuaTmOTmpF3JDHDswUOcmdOyLSP1Go_Gg@mail.gmail.com>
 <aCO2nJG8i3S6vUid@x1>
In-Reply-To: <aCO2nJG8i3S6vUid@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 14:47:52 -0700
X-Gm-Features: AX0GCFvwPjF_wCWYPn7MYZ-YTSuih7Z6FiFjJVGe-Qu4_P_r0R8eZp_JhA1M6xk
Message-ID: <CAP-5=fX8xkO8jXqvgksTF_5m+gknhZ2p1NuPZ_Lb0fzbDMDJ=A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf python: Add counting.py as example for
 counting perf events
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Gautam Menghani <gautam@linux.ibm.com>, namhyung@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 2:16=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, May 13, 2025 at 01:59:28PM -0700, Ian Rogers wrote:
> > On Tue, May 13, 2025 at 1:50=E2=80=AFPM Arnaldo Carvalho de Melo
> > <acme@kernel.org> wrote:
> > [snip]
> > > Right, I like the effort he is making into having perf more usable in
> > > python, and I encourage him to think about the issues you raised so t=
hat
> > > we can come to some good abstractions.
> >
> > Thanks Arnaldo, can we be tolerant to API changes in the python from a
> > "regression" point-of-view? Like avoiding the notion of indices?
>
> But correct me if I am missing something, aren't indices only introduced
> with this new patchset?

Checking the code I think you're right. Unless you do something like
the range loop:
```
 for thread in range(len(thread_map)):
```
so I think we'd all prefer indices not to be a part of the python API.
On the C side we can get indices via helpers like perf_cpu_map__idx,
which will introduce O(log N) overhead - thread map is missing this
currently I believe. For compatibility a CPU and thread should remain
an int.

Thanks,
Ian

> - Arnaldo
>
> > Presumably such a fix would also need fixing in all the perf python
> > scripts, but the external users I worry about. My sense is the number
> > of external users is minimal, for example, toplev I don't believe is a
> > user [1].
> >
> > Ian
> >
> > [1] https://github.com/andikleen/pmu-tools
