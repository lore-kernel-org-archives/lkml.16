Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4F3139D0A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748339997; cv=none; b=alX1hdaCh/qEi3DHs7r29bY1BvNAn4hw+Tz3copgQ1LzIGJYc6SHVWVs+ff3UjSPJl9Z+RU23y8kvyaQ7JvJbcnIlAFr6bchuxDBVAf2jn67ppMsmlcawGvXgTGdqL+BcjMwYiwhDnqGACcw2rSkQCUVb/oAy4cvoueI8YzeJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748339997; c=relaxed/simple;
	bh=MzOvGX8O+4utQ4eU3Iajmah5bipRwCmAxAIkr/YrneE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHim2iW97+PdgnP8c6APTxs6/iWfjZKqsOX4V25cNAy1ja4K8iAFCM5PmMT6CQLciYvnSCfLeYTDe9uXTReMBdKNVZS8TtRDUbOiUnHKjYlICSGUTtYHHy31Mo7W//wqrnbdyVqPfVgp5TbMzMyqNwcJpjyJ0d47wpkA1rwboaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VnQLdZeL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VnQLdZeL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3267286f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748339994; x=1748944794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=VnQLdZeL7eOji61GOi7HPGKca7NmU8WKZcqkehppqcA4IRKmDSOKCJrlYt4HlmKPpa
         eU6KKNINEfg8PZk3Pwek9poAcCqF/Tv5Y4by5Yc6Apt0pdGRpVlB/T+CcDEV60/pGIHu
         MD5er/23EVDP2Bsyzxdj7696KH8cZjSXkY23qXG7Q7/ekSiI8NR5tZb85VCPQC04iWMS
         PrsdakJ7e0TJbq451Nple24CBk5DGAZpZW0pV0BWfN2SZi6wBNb8MfOlIXHXaaSjM+Ky
         Dd4wTBqQQ79dVBtPHsIj2JaAzYTbC94IWzgcAp1PZDmkyI4cbQEUh9+2m8p6VnXPfS2C
         bb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339994; x=1748944794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=cLBgW20lpIfmbWxz0Moev2/4aE49hErkYlA3+fmJhgYo3PmumP8YjrB2HTWGIiunUT
         ndCeVv3mw1eTubWPOPzgltyPGj76D6HVql/2hGNE+M6PlyJ0jsiB/1g/dulxJ4+j2Fl+
         J1xzWUCaDxlv6/YJXdsDOqk0kWT/HPNedNijBcZsLPUds5oY/Fma18Ypm1h2Wx4Of7Fm
         lwY7QVk1k7u6c5c0lXihCesRT210SLdTCXYxX1nwVEjiDX5IRoaRhMGN/oXTcOKIM9y9
         XuYrNkSyNLpo7rbYtW4TRRg7fF2rbmb/mkWgehoxLIcTex4fqSZXc4EE2JRoaMjOT5rs
         i8/w==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5K7PogYGmgpdhzZxuDICTEzP6J2JyOoMmJHMfDtonHGjvLAuuvgATSScxLqM0I3WJIVopH8NRvPgLDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZku3eF1+qYYz0kijzQobiyRhHl3+fZ7S2lCIG7ftVCTYA8X3
	n/iPi6INwqEfnRKUQDkQcdxUOs6QegSgx59a3W4HgybsCsQFE/ebJxIsDa5qFyTlsLcg35Ukb5V
	XZhNgv/43n6qQkSbAKI5ZFkszDUCwHxhLODnsb5VeWg==
X-Gm-Gg: ASbGncsqppaR1BViVCC0WI8T1oqLAW7X9WulC60ukA3TNpD/iXAxHTM395r1k3sKJcV
	sUUSN9Eg2sxSxENMWumt9KkCFWqsqcWHcuNrm7LiZweKhfNUbZG1kf9IcDeP47OoNa29E6UWT2e
	1pD4WMziApErSecytbNGupTA8ESzxIzfc=
X-Google-Smtp-Source: AGHT+IEW4jiGzBYUUJeQ+hZ9q3VAC3c3XCEXdCJkYQj3sC6I500v3SraZXfwDAQYqmh+I1E3eL9qo1sRnEJZg8HQc9I=
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e07 with SMTP id
 ffacd0b85a97d-3a4d6eda68cmr5556606f8f.32.1748339993821; Tue, 27 May 2025
 02:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com> <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Tue, 27 May 2025 10:59:41 +0100
X-Gm-Features: AX0GCFvLUhtMwBzFmk1b4gn3Tur4pK0okxD3qyqun7XWisCr-irbPglToM7Uhec
Message-ID: <CAECbVCvPCsHVvm5QKQrw+DDLsZGaHMgCHyJ=cp_gFcAyiFA4ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: ak@linux.intel.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Andi Kleen as this was originally written by him.

-Rajnesh

On Fri, May 23, 2025 at 12:26=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.c=
om> wrote:
>
> RISCV CTR extension supports a maximum depth of 256 last branch records.
> Currently remove_loops() can only process 127 entries at max. This leads
> to samples with more than 127 entries being skipped. This change simply
> updates the remove_loops() logic to be able to process 256 entries.
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
> ---
>  tools/perf/util/machine.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 2d51badfbf2e2d1588fa4fdd42ef6c8fea35bf0e..5414528b9d336790decfb42a4=
f6a4da6c6b68b07 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2176,25 +2176,32 @@ static void save_iterations(struct iterations *it=
er,
>                 iter->cycles +=3D be[i].flags.cycles;
>  }
>
> -#define CHASHSZ 127
> -#define CHASHBITS 7
> -#define NO_ENTRY 0xff
> +#define CHASHBITS 8
> +#define NO_ENTRY 0xffU
>
> -#define PERF_MAX_BRANCH_DEPTH 127
> +#define PERF_MAX_BRANCH_DEPTH 256
>
>  /* Remove loops. */
> +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_ENTRY
> + * so it's safe to have an unsigned char array to process 256 entries
> + * without causing clash between last entry and NO_ENTRY value.
> + */
>  static int remove_loops(struct branch_entry *l, int nr,
>                         struct iterations *iter)
>  {
>         int i, j, off;
> -       unsigned char chash[CHASHSZ];
> +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
>
>         memset(chash, NO_ENTRY, sizeof(chash));
>
> -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
>
>         for (i =3D 0; i < nr; i++) {
> -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is not
> +                * needed as hash_64 will anyway limit the hash
> +                * to CHASHBITS
> +                */
> +               int h =3D hash_64(l[i].from, CHASHBITS);
>
>                 /* no collision handling for now */
>                 if (chash[h] =3D=3D NO_ENTRY) {
>
> --
> 2.43.0
>
