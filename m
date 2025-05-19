Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392C1CB31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694932; cv=none; b=QfvpOuBPgnGzYeptiA68LtSKojYZC/Cbmy4t8vbgZzzQq+v+2fF9eUmDn2Naj6oiOgbYxwpyteLZcV9Oe56+SrMmFceTDnyiLwMBMK8DI8TVneZ5QJD9Oz4hQSSXIgCy5Dpmt3olGfqC3WaHLPr61ypQ5oLTsN7W1/+hG/3Nt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694932; c=relaxed/simple;
	bh=cVm8sNhJLvigFmNAQ4va6QvpymBy7T27kGYskviLMuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAHgi7X2XvelGPOdMB2EIT+GqfoDf62v68oT0B/GqFtVW4bbhX7AOQrf8ei1y1a5WU+0MGRRX21jns+jAl3AqtLB0rn0t/tRopSZ5gWi5pyzLYdJxLhBrkIo+QE+GtV81Sgp6V2dyzyivwXFlf20U5CQn6W5kJjok+pbPpY/VL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IH0AH0fo; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IH0AH0fo"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so598305ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747694930; x=1748299730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhkhJR/SnYegZ1S178DxVA53AIGiCba8KnL0repEQmE=;
        b=IH0AH0folYr3mIX7P/KM8eHtI+yf+RjngbEx5PKE+vk0NyhvfrOCk32mDJihxpcGq1
         BUMM3iUJen5xsGJ9I2WDZsQWT+x/gcUfTtDmzckwxm78s2JJ0jqrHwVpJ7Ppd7MrHJV/
         +xJgd02WenyA3cB9sFfMLkE4cA7vpW6qbivho3n/BmMkrIM6No5E1AdDik84NnPg8AWw
         n8GDA86a2SdhmnzF9gDkY+XiLCaTIOYY4MZloaaS2W2hD/d2HHOXIxPo/WQZZeTgu69U
         fR3QuqPD7x0q/FuxDgtSAF/m+hgtATSFl9nmm0ZsKsC4GmVVzP3EAsZRP2aNmmS9NOai
         +ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694930; x=1748299730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhkhJR/SnYegZ1S178DxVA53AIGiCba8KnL0repEQmE=;
        b=C+hHvjmMuo340u+Zedt6W69HTt+2nM2Z6H3bfapwh+BDZuAhf4LVMv8yZflDCtDqrU
         BLliO9BC8b4LtZAOmGKOT9q6fUf33ohEt6x6aKpFWsPj4YPtTtH9OOu1PlvKrP8ROm6/
         iYtZCHR31qnDHJ+OgNBiVK2hofOlOWC4t0Bx75xvwXmF0n+g8zIFVLsUOsWQR5ux2TNb
         ojWG+AJWbKF4CtLYd8eWzznCAX5S3bYONU10uBHsleC4NiQJpfKnNZQZduRI99/+jVeQ
         riUE8PfHqOGlsk2+TEMA01QTnOr/DfYw6xZP3vY9c7mNpPNd6uKWKocd777l80MT9eVN
         PHFg==
X-Forwarded-Encrypted: i=1; AJvYcCUmmZPKtW8e2r61aL8RSRBwtTRfZKHY9x+LSbO1nqeXh3zy6L93DCisk6zXllFtsal2XTYJOg4KxGpiK+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfhYglkGrtpqb8hcEVcVu5gqXkh7YTvvUW/CQ5aM7RYRw46RS2
	DcX5iEUUiSLigwYIfMy2VpGypXunq53l82SH/GhFj4DI2kZD/VwCfkg/VnBsQ4b7HGts0jBgkEq
	fyBEa+nJXLAhbxiCBVD/W00f0LdqKavzBmH96rSzc
X-Gm-Gg: ASbGncus4J+VxXZL/ioREIKDSK4OZ0FiF5YkpKE4RbfMmxLbXGa3/7WPvDQC8XGV5eM
	wP0B6ukQx8kJimH/uEaoSU/ebE/H1dfAeQh6kAVHln7+hln1eWON7HXKw2Q1jgAb4rUJ3o3uYsY
	HSwBo8BztRuGRRcLR03QKOnJyW5Jbl38awYlPZa6iNelDlY45AVwRvJYdsdz/+GQ==
X-Google-Smtp-Source: AGHT+IGxb81TbQgq92KSSPhVw02ICcWRvIPLYO/umEzZbBM6CcBhcL8FryNoh85kgXf/MlJLx0C8xA3jFbkHSyPMsqg=
X-Received: by 2002:a05:6e02:17c7:b0:3d9:6e55:2aae with SMTP id
 e9e14a558f8ab-3dc5d47c3bemr8018805ab.0.1747694929763; Mon, 19 May 2025
 15:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519114836.611110-1-langfei@huawei.com>
In-Reply-To: <20250519114836.611110-1-langfei@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 May 2025 15:48:37 -0700
X-Gm-Features: AX0GCFuC2ov5jZcsW9a4dtwgc5MYDwCv766rlaUN9xH3LhW8DHZCtl2TAvFSDkE
Message-ID: <CAP-5=fW3UcqwnwDPye=+LxG1vPGZEaATH-ggbR73yZQnWkA03Q@mail.gmail.com>
Subject: Re: [PATCH] perf comm str: Fix perf top coredump due to concurrent
 read and write
To: Fei Lang <langfei@huawei.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	james.clark@linaro.org, linux-kernel@vger.kernel.org, hewenliang4@huawei.com, 
	liuchao173@huawei.com, laihangliang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:56=E2=80=AFAM Fei Lang <langfei@huawei.com> wrote=
:
>
> (gdb) bt
>     __strcmp_evex () at ../sysdeps/x86_64/multiarch/strcmp-evex.S:314
>     sort.comm_collapse () at util/sort.c:202
>     hist_entry__collapse at util/hist.c:1312
>     hists__collapse_insert_entry at util/hist.c:1620
>     hists__collapse_resort at util/hist.c:1704
>     perf_top__resort_hists at builtin-top.c:303
>     perf_top__print_sym_table at builtin-top.c:350
>     display_thread at builtin-top.c:700
>
> Link:https://bugzilla.kernel.org/show_bug.cgi?id=3D220096
>
> Fixes: <3178f58b9894> ("perf comm str: Avoid sort during insert")
> Signed-off-by: Fei Lang <langfei@huawei.com>
> ---
>  tools/perf/util/comm.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
> index 8aa456d7c2cd..0438870d31d2 100644
> --- a/tools/perf/util/comm.c
> +++ b/tools/perf/util/comm.c
> @@ -209,13 +209,16 @@ struct comm *comm__new(const char *str, u64 timesta=
mp, bool exec)
>  int comm__override(struct comm *comm, const char *str, u64 timestamp, bo=
ol exec)
>  {
>         struct comm_str *new, *old =3D comm->comm_str;
> +       struct comm_strs *comm_strs =3D comm_strs__get();
>
>         new =3D comm_strs__findnew(str);
>         if (!new)
>                 return -ENOMEM;
>
> +       down_write(&comm_strs->lock);

comm_strs are a uniq-ified set of strs to avoid memory overhead from
comm events. A comm_str is reference counted and immutable. Using the
comm_str lock on the comm struct isn't something I agree with as we
already have thread__comm_lock.

From the bug report $rdi is non-zero but comm_strs are immutable and
reference counted, perhaps address sanitizer and reference count
checking can point to the problem (add -fsanitize=3Daddress to your
cflags). I put together some thread safety patches to see if the
problem can be caught, but nothing that looks particularly likely:
https://lore.kernel.org/lkml/20250519224645.1810891-1-irogers@google.com/
I couldn't repro the problem locally.

Thanks,
Ian




>         comm_str__put(old);
>         comm->comm_str =3D new;
> +       up_write(&comm_strs->lock);
>         comm->start =3D timestamp;
>         if (exec)
>                 comm->exec =3D true;
> @@ -225,11 +228,22 @@ int comm__override(struct comm *comm, const char *s=
tr, u64 timestamp, bool exec)
>
>  void comm__free(struct comm *comm)
>  {
> +       struct comm_strs *comm_strs =3D comm_strs__get();
> +
> +       down_write(&comm_strs->lock);
>         comm_str__put(comm->comm_str);
>         free(comm);
> +       up_write(&comm_strs->lock);
>  }
>
>  const char *comm__str(const struct comm *comm)
>  {
> -       return comm_str__str(comm->comm_str);
> +       struct comm_strs *comm_strs =3D comm_strs__get();
> +       char *p;
> +
> +       down_read(&comm_strs->lock);
> +       p =3D comm_str__str(comm->comm_str);
> +       up_read(&comm_strs->lock);
> +
> +       return p;
>  }
> --
> 2.33.0
>
