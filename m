Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B3202C4F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539025; cv=none; b=LL0G4yWIapsfAnwC4tkf/goIvQ3epVJfnaYmXdrTb2pzfEQDryYFBpQbKEgd+7k2xZpSmYcSJ3CgyXPJvuRuxIBfeTnkPBICTOyjTiZI7AbPHOMkCcMyTj4JMhzoLE2Axcy6BbeBYnjaSIZZvNLeJgbOxZA//cGLKU/WWB2ivZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539025; c=relaxed/simple;
	bh=8D1xT8a0b7CgbI8gOlxA5+JoUXDPbXW7nrtKvBPf/R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXjt39LbukBftnrylUh3Ej5Z8tC+NY2QW8s56eP5CwjIJX3lEH7fqkMczIlZNXKvsVbBUY1YB7VVmsaB0d69j+LBs0FKZ0ZE4ELLIJ4luOwMO1m3I8o65wmkna9R3u76vXaP3RM40SWazst5U38PpbJPSi/6qoJGz1+I0UADy4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYgVcuQz; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYgVcuQz"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240aad70f2so59225ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743539023; x=1744143823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZAcMUbqSMQxpNYoKMoe9LwWg1kIJPyXPHsJmNqOlVU=;
        b=FYgVcuQzKsta09szEvJWwFpJE2WSXCJsjTO/G2f9OkThlBKRodY9xEyxfdJbhJpI4/
         n+xP51y1u8PGu+rADx8kWwdX1vNjH8JDJGYT2XoQr2zq6Syat8ansKtPzFfQX+yNCudm
         TSblbcH3KIBsBiqCoZfuyF2xnJM0GYuxHAGy6M/igdQQwl5XGgJw1/dr6jecD3hgjHmr
         74VyjAifj5wi78mTy4eeM2+187bclMfE7BSzfTqpkZTqhfKOMqQ4Ul+JukKWStfjwLBq
         RfBjO0P6YeGGbwv3v1pYunGq+KVuunFOGKWU38Fk89oxb4R0edPBJuRA6DB52zg4egaS
         Rjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743539023; x=1744143823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZAcMUbqSMQxpNYoKMoe9LwWg1kIJPyXPHsJmNqOlVU=;
        b=pG9/UG5mz/5iZxxU8LngNfOu9OGAj21Jm+3Y2je/51PwV+mHrQ9NP6qkCnUVxUoTag
         XSSuM8gYgrsQiSF9ULYdcjL+9kTQu9Y3TijHwfFqyvCPBDVnnUKaDrsHCdhIJn3D8y1s
         v4tGHgaF1RERe5gg+bDizeJ3spuJ2pCPhYvLhol/lF7rgD69RM+kPSZ8kC2jDbL0aYcY
         L4H2ZZpO0+dhGEUrbqJcHPAHhro7zw+nD1pJapn1YagFGJvxhBx8E/JjPa8ZkuFMdxO9
         ORfnY0hSS6ad9MI27MLFI65S5W2Micuv+ZvuU/sBVTx2bgOosSEKHZMOpqUpeXuPTG3h
         jBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuthuht9a7U/1wzH22fuKbfw5gHQ4mg/4YZ2zqND18/e0aOihs70Azc07ymHZ+LGcpjtusVaJElQUugNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRv5RfZbBpVA2GO2FsE2wyOJuwPb0+YP9epEFkQ2qiKHMx4WvE
	eCN0YZ564BhJdCgu+soNDr8BalQ5Fa0Gc4O4bwyICxVXCeYAx7ZcBHZDEzdMjWy+X/0XknXkcsL
	fvIidWx30s+w/BjE6JihyjiMxO9Px6aVmN1L2
X-Gm-Gg: ASbGnctKlLHWKZjvlC+tquj7gWSO1mt7RJxsiNVbzlsuZzZ0M9NgTnRHlIeB0y3E5DO
	haozEDiUJlVs+oNOaOPctoZTJ3MxB4ovrkeYUTOaFOKKpZxg7Tr23guBh9Q+BmsDuyuMS9njikJ
	x8/bq1F4YHitgNN/G08L29SnqTAxeUtcHaIZ+H5/oUEZRmYXdp9FJyZaXlO4RsBpOT
X-Google-Smtp-Source: AGHT+IFCjw/qVBDjA/mm5foS41L30Ts3NcNRK1D/PrgXZKzythsTSFQf+gbitg18EFV9GzXU6K/bWIf1y+y2OWix3VQ=
X-Received: by 2002:a17:902:ed12:b0:21b:b3c4:7e0a with SMTP id
 d9443c01a7336-2296a01c9cfmr504615ad.13.1743539022991; Tue, 01 Apr 2025
 13:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331184638.3856982-1-namhyung@kernel.org>
In-Reply-To: <20250331184638.3856982-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Apr 2025 13:23:31 -0700
X-Gm-Features: AQ5f1Jqt-SYxYK_Z4LJUtRH5N5zNduKl7fj7RvF0IPB6x629cLIhgyPKjGfEfrg
Message-ID: <CAP-5=fXUiHMK5jGo6CDBCGramH2OaqWFi_TyjMofM43dqST+FQ@mail.gmail.com>
Subject: Re: [PATCH] perf trace: Fix some leaks of struct thread
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 11:46=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> I've found some leaks from 'perf trace -a'.  It seems there are more
> leaks but this is what I can find for now.
>
> Cc: Howard Chu <howardchu95@gmail.com>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-trace.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> index 3d0c0076884d34cb..10cd99888a9a11b5 100644
> --- a/tools/perf/builtin-trace.c
> +++ b/tools/perf/builtin-trace.c
> @@ -2835,7 +2835,7 @@ static int trace__fprintf_sys_enter(struct trace *t=
race, struct evsel *evsel,
>         e_machine =3D thread__e_machine(thread, trace->host);
>         sc =3D trace__syscall_info(trace, evsel, e_machine, id);
>         if (sc =3D=3D NULL)
> -               return -1;
> +               goto out_put;
>         ttrace =3D thread__trace(thread, trace);
>         /*
>          * We need to get ttrace just to make sure it is there when sysca=
ll__scnprintf_args()
> @@ -4123,8 +4123,10 @@ static int trace__set_filter_loop_pids(struct trac=
e *trace)
>                         pids[nr++] =3D thread__tid(parent);
>                         break;
>                 }
> +               thread__put(thread);
>                 thread =3D parent;
>         }
> +       thread__put(thread);
>
>         err =3D evlist__append_tp_filter_pids(trace->evlist, nr, pids);
>         if (!err && trace->filter_pids.map)
> --
> 2.49.0.472.ge94155a9ec-goog
>
