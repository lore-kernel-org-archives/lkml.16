Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8432853E5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089896; cv=none; b=avKT6z9kBekCMLePoFrVmaYTFInOctK/R2DjE2bBIA8JJRelPPjmT1n+6WxadQqg0JukoxUmVssBW6h8wH1/Vht7d+Ri98fzcyOG8RPC8GoB0LcpncID7cTy3ufQ/2KJMLsPHSAPS0XALphrrwtCGLwUCf0AMp/LqYWXn2P6870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089896; c=relaxed/simple;
	bh=CTXOaQxjF5s8cpOyCgodMvW5akYuAc8hUy1j3ISoOi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=XTOcqOV1B8xgyPGFAM8rV0/53Txq/8hSj3A4e45gGi0xokysbcPMc0PduDeawEZgxzxCgpLqcwoUVnEJS8DFHNQY8G0ZEzl5AuD4ds+rG7wRre97zelTpRRBiIWorp49oqgOcG/Yv9FQ4j6z5YcRs+v1eWvQH2TVfRcxSwsk+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wdTGek4m; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wdTGek4m"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3de210e6076so13755ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750089894; x=1750694694; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZRZa1Ua98kJCyhFA7LJvzcy8GOGnWbcpi55ofKuebY=;
        b=wdTGek4m+HXIx4GeEUOq/DUtaSpqLaBzrtKTSVGpB/PPRoE5WFiM/kaDllxZivkCsf
         RkmxHJrdJqqEpTlX8FFm/9xOs4XOizeZZ2sJ6IJIHZfQRuA/xaakOlkB0Tm+hhu6ICIc
         0cfbnabhDP4uj6mQtZSVTmjZMFsZlPNMlJwHWZNz41DTke46t+Uxin7dldg7WVwIQJzA
         0vn0wQSGHqEf0KvvfxJXkOzNZ52QO0yuu50vbhqu6vZd2TDQeBaoKirA9DMiiDZb7aYG
         TjpYKR84+P0tZpC0bNL/vCyFN5nqJXzoluaPfyWCui5fSpN3SESYupnumFo2gdeY9ozV
         SxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089894; x=1750694694;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZRZa1Ua98kJCyhFA7LJvzcy8GOGnWbcpi55ofKuebY=;
        b=ge3dG0gj1wzH7rK2Gleo0eaaIxQ+dPhix+VX5xh6XdT+f+vgfnIT3L26Udoe8Zuvt0
         +oLV1NnDeTFeSOP2D6Jz8FHwvwCY9X+uqeFnfG5Hvag3R8tvCfNuXZlNrEIzS852455e
         S19GCi3ur/p8VuaEHe8ysXtAnmtS8oljkylzmOHbhLBxT/bno8dupZiRhYA4TwrVlEoK
         UNDNTFbqw+rZd38qS5nl9+7gK/ser5Lw+cI9oCty7oVwHlmwhrK/uB/8YRnbaqw01L4+
         qFmdE5F1cDogvGvzB+icI6574k43w54tjODf7/MzKXLHd/6oKtbGxaedQGsPbarrcvLL
         wC+A==
X-Forwarded-Encrypted: i=1; AJvYcCVjsJEfQkLkNcSl7DWdqC1O+jpzle3ZifJfRZ6MWw6mmLAy+rX2///b5TFncfdILlcGlb25U8fKT6TNchU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxovqVjdoN07boM/82manQXVgEnboSQUvjdbEcrLnK+s1i66W1n
	jl/CPsgNugtnKQppH7jMepc2rT2higBMNQ3NnW0YVTDwod7UrrUOrskMCpRT9D7oS6m0Oi6OxCP
	DtrLmRaKysSVFd94qxBsLYkNbrXeGBP8F1LILC03NE02atecNOrAYTm68
X-Gm-Gg: ASbGncseJzuSYeJIeZAvj2n3O+B3kg8H9AKavZ/eqRSp+NaY++jJSzGs/a3wIVTnH29
	k/Xvw4p2r6pvN6t+kQ9ynOQpxH7Y6G9+uVsEVkgdpRFtEsCRyMEUEf4gAXoE3XZS1uLGoN8Zy6Y
	8rpxbwZRGgEHlL582LiTu+wQsQImlI217G1pYpJNNHQ9Smbgv/CrTrOG98el0nMt8UFWO5IA==
X-Google-Smtp-Source: AGHT+IG3s4dWQu5k75FFg5Yy95b2Uob76LNgIUsDXZ3AvKrlpHPFiygRDTyyDD1PQcX6Hb/G0QbUrYNCfpz1yIUcwM4=
X-Received: by 2002:a05:6e02:3786:b0:3dd:c526:434f with SMTP id
 e9e14a558f8ab-3de09fa7707mr5386615ab.9.1750089893690; Mon, 16 Jun 2025
 09:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614004108.1650988-1-irogers@google.com> <20250614004108.1650988-2-irogers@google.com>
In-Reply-To: <20250614004108.1650988-2-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jun 2025 09:04:41 -0700
X-Gm-Features: AX0GCFuZNNCRbeo7C9EMdLxcNcUJ_Vg7ND5sifhQ9SMwnI_SNioYAxkmOzjkhH4
Message-ID: <CAP-5=fUz6ViPHDdS9GCAEYUN39L4MpAnRR4CzJWggg0S8vn39A@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] perf evsel: Missed close when probing hybrid core PMUs
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Michael Petlan <mpetlan@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 5:41=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Add missing close to avoid leaking perf events. In past perfs this
> mattered little as the function was just used by perf list. As the
> function is now used to detect hybrid PMUs leaking the perf event is
> somewhat more painful.

Given this leads to leaking perf events on hybrid systems it would be
nice to land this 1 liner in the next v6.15 rc pull request fixes if
possible.

Thanks,
Ian

> Fixes: b41f1cec91c3 ("perf list: Skip unsupported events")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/print-events.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-event=
s.c
> index a786cbfb0ff5..83aaf7cda635 100644
> --- a/tools/perf/util/print-events.c
> +++ b/tools/perf/util/print-events.c
> @@ -268,6 +268,7 @@ bool is_event_supported(u8 type, u64 config)
>                         ret =3D evsel__open(evsel, NULL, tmap) >=3D 0;
>                 }
>
> +               evsel__close(evsel);
>                 evsel__delete(evsel);
>         }
>
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
