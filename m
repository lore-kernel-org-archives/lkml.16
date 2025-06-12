Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83970A944
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749687406; cv=none; b=cbyhzbt7A4HRJJhZTlSiQ2urIdpNt8eVCCBeYkO72jzTSzZt0NRbTbI20wF1/NgAm+Kh1df2JJaKaOg3n69F3Om9mH6aO33doJwKcEbiEfNgUdg63DvfUVp6ryBGcqN44vSUeSs4E5W3CQLLeUMt4Iy83rHLf3id4JOCiVtXvZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749687406; c=relaxed/simple;
	bh=qj5QS2sbbirxTbrQqn6si2l3oHZHSHeaoydlOC8MmRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAK+FOye8nZ+4M/G1vIg5waE29L55++Nx0NdG2lKKvsM2Ttq/xiGs9iP0WwEDiTXIKRqc529ZGFquFTgs/N2Z/jJ2UojVi04XPBvt5HDHQo0egPhEdhjYQ58eV97OJLFuFd1uknxQpy0UKK2LXIZvBPjZrk3Md/dib09WXeKnUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xiZRkSpH; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xiZRkSpH"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so71675ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749687403; x=1750292203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylgnLawNJtAmWY8kEGaV0f6rcg3R6c6dxmduNdDWPkU=;
        b=xiZRkSpHQgCR+sCWBnC600hQR8R3Dk4lDmWaaEbz0RaoSaDhYNuT2lTQFkxLg0lSp3
         SbrlQ6FkkXC4uuwx4j2KSkbE6lCsRrbmrfZRPgvcjn56GYk/yXdiuZlVH+kpoW+Mw0Mm
         PljmKmn2aMk6pEvbxGa8jpxMddCW1cy3HD2BXbgsPq6BcUe4skOOT/eUbRMjY6yRhb41
         n18X6nTizv9AVITIiCCzdcw7M3SBGme/5mh3I7qKr2pdGSRaMEI6GTZ4/j7GmBWI5Jlw
         kd6TCXp/qOZ0MdJqEFRDObX/nHCtlr0HeIW4055j1U0l6MFMlJCabapOkF5bDgsZPZRB
         5qWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749687403; x=1750292203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylgnLawNJtAmWY8kEGaV0f6rcg3R6c6dxmduNdDWPkU=;
        b=a1w+9XIRG+cBwvjL0WnW0wgx3jC37bR1QzlGeYa9zQAKrTQ/RVGcsoZtAEieQI139E
         IZ7PR9cHx7o9KzXnQ+/Uv4xJMr9eO1D9wy0KbPbEliYIfnGHzs08IS7iCDythpf6Wzbj
         G5mRKTx4W1n149vuV85zgcR7YKfSq21sWNQzKzPQLIRsMTrHzMTeWlb44bPr0wh4i7GB
         KSYxgW10Wn7MF+UrMWalP1WPyuf4/JYiiQ42aj9K6IboWjqwOId5wtd4k8uJMlUQBGMJ
         LNe6nzN1lg5xGKzqVQeptrnOp1RiZUzjphqGS89CpyTp2pM3qDvibfEBkwqcTuebxwaG
         oUDw==
X-Gm-Message-State: AOJu0Ywz+5mnds/IEEkuM9hN0n99xj7f8E+TZg1cKPSbf/Xd4QtRMBYh
	gJ6suSu3xCBUF+LZLdjwVkenPUfSyslUj7YCe/QkT2irjH/bx2q5UQ1CD3d2RJXeGrJfPfnYqT1
	LSdayeWVqa+wL9cMVps74d/+V+dUfvY2izaRUAn/K
X-Gm-Gg: ASbGncvu173V94hgjSc2iUfjBymTZv9Q1LHPW4t0SaQAWGtY5LvN6dolmIjpeUm8w3S
	ZPfIaYCtZQ9DQk7+fEdE+h7O8AlIqQ9TN/neQjocfJwWKRh1epnlpZDDQW0oG8eEKB952/LCQGo
	8jIvgBqB1SVQxAeKYOYyyhCtbM8naXwzai/MZ4MpsE3apM9x8AZeeRa8MrzGOMRVo1JeevxDg4
X-Google-Smtp-Source: AGHT+IFFcHIvBuqmgSE8wSBCUm8XGGpkfpTJdDVqXFDwoXNq/Q70MgEkXqSf4ahaHQUelFlcvAvQ6A0sy2wBSPYE17A=
X-Received: by 2002:a05:6e02:2181:b0:3dd:f68c:87ac with SMTP id
 e9e14a558f8ab-3ddfbefacf6mr458965ab.7.1749687403304; Wed, 11 Jun 2025
 17:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611233239.3098064-1-ctshao@google.com>
In-Reply-To: <20250611233239.3098064-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 11 Jun 2025 17:16:31 -0700
X-Gm-Features: AX0GCFsp_xt0KJi2mHuIfKsQiSrIqRQayI46uKJ3vfOt5OcTrM91v8bQ6KI35rI
Message-ID: <CAP-5=fXyB3H-msiSUGH_XqOntJNv-A2X7DtjvZO=nLzJgdTY+A@mail.gmail.com>
Subject: Re: [PATCH v1] perf stat: Fix uncore aggregation number
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 4:36=E2=80=AFPM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> Follow up:
> lore.kernel.org/CAP-5=3DfVDF4-qYL1Lm7efgiHk7X=3D_nw_nEFMBZFMcsnOOJgX4Kg@m=
ail.gmail.com/
>
> The patch adds unit aggregation during evsel merge the aggregated uncore
> counters.
>
> Tested on a 2-socket machine with SNC3, uncore_imc_[0-11] and
> cpumask=3D"0,120"
> Before:
>   perf stat -e clockticks -I 1000 --per-socket
>   #           time socket cpus             counts unit events
>        1.001085024 S0        1         9615386315      clockticks
>        1.001085024 S1        1         9614287448      clockticks
>   perf stat -e clockticks -I 1000 --per-node
>   #           time node   cpus             counts unit events
>        1.001029867 N0        1         3205726984      clockticks
>        1.001029867 N1        1         3205444421      clockticks
>        1.001029867 N2        1         3205234018      clockticks
>        1.001029867 N3        1         3205224660      clockticks
>        1.001029867 N4        1         3205207213      clockticks
>        1.001029867 N5        1         3205528246      clockticks
> After:
>   perf stat -e clockticks -I 1000 --per-socket
>   #           time socket cpus             counts unit events

I wonder if there is a better column heading than "cpus" given that
these are imc PMUs.

>        1.001022937 S0       12         9621463177      clockticks
>        1.001022937 S1       12         9619804949      clockticks
>   perf stat -e clockticks -I 1000 --per-node
>   #           time node   cpus             counts unit events
>        1.001029867 N0        4         3206782080      clockticks
>        1.001029867 N1        4         3207025354      clockticks
>        1.001029867 N2        4         3207067946      clockticks
>        1.001029867 N3        4         3206871733      clockticks
>        1.001029867 N4        4         3206199005      clockticks
>        1.001029867 N5        4         3205525058      clockticks
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/stat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
> index 355a7d5c8ab8..52266d773353 100644
> --- a/tools/perf/util/stat.c
> +++ b/tools/perf/util/stat.c
> @@ -527,6 +527,7 @@ static int evsel__merge_aggr_counters(struct evsel *e=
vsel, struct evsel *alias)
>                 struct perf_counts_values *aggr_counts_b =3D &ps_b->aggr[=
i].counts;
>
>                 /* NB: don't increase aggr.nr for aliases */
> +               ps_a->aggr[i].nr +=3D ps_b->aggr[i].nr;
>
>                 aggr_counts_a->val +=3D aggr_counts_b->val;
>                 aggr_counts_a->ena +=3D aggr_counts_b->ena;
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
