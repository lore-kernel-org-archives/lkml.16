Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF01F9F70
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 03:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511969; cv=none; b=jO2mUbvYmnCJQXRMhDdqtefzQTL4bMEVRuj+gWeX3Th8tCDQ3SZgKHZj20dguqlnHI9FFoD6DcGvEH5DwfYLRXJIgTWbIw5UDj7iRWYRWZT0GX5v9Bbs4GDLicXcrdcojHoVUiSIpKtdfn/TcD4iMC4oX/5/Xy8P4b5ewpgCMeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511969; c=relaxed/simple;
	bh=Gz7QyMMOiN9IEeaAXi9wBI+uc/+zDRfW2GVvk1QUS98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZHo3qJ7qFL9gArZ+jT3n6zdKNrL1aL/9Gbra8fSHVDG7TG/CoYUFJKYioJl1pTqX/cqrRJ2WQTZG/Q/WE0hCs/eQIZt4d4RUxO8AaY14hsVn17LeTaANadekvqbnkuAwzTYeMdi5iytB3osZt86FNTQEif68xxUOYfPBP0B8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Jc94u+g; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Jc94u+g"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so118935ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 20:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751511967; x=1752116767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxdfTlo0silPVEDxOFE/e+T3VT60Hv2C4y6UmPeu/b8=;
        b=1Jc94u+gxNfXjBo1pyFrITNUbYa7XnlOn9CkwOYgfe1I2vjv/4WompUm/P89I2663T
         WlTAywAsICKtSYg2YQWkzPPrs6BarwgdFEGarOrASWqTXpNC21v6GQvWNgFidIUNp9u0
         noX4U5fi7iM3g26motAukpUfTfVLT77IIqvLhVePj+UPhnpwlw6/XKfrFv/pQ7WW4Ypw
         EQH0AOZfdBQmH/xsi2GHvdShSox27QTDUZt4SMldZ0VK1LFY4FBFd3XUIxTbwKEhiFSN
         ALgQOo1pQ9JCYWYJ+8ooDjs0NO3p+YbLwDBeQszyX+T7UMHE6MKikVkDt0NBnMAcm4h2
         O7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751511967; x=1752116767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxdfTlo0silPVEDxOFE/e+T3VT60Hv2C4y6UmPeu/b8=;
        b=CC3E9ZRWroZsnxogoQ2/y2NBRLd5BpIuG6ZFwkhbz3zndR+vkencwsCIWeJTttCSyT
         my+3HPsFiSwh1RAMYoaKhLpFTS6okF3x4cKG+S/gqA058kDCeYB0vjJbWj5YlOvsyBpy
         w8Vi8eDzSLSUPky4IBM9gku6Gc6h57ksCTDEZasj6F48kS2BktstGjQYNMpb9CdL4wAC
         kU0wtl92tDuP0ZKwTzDk4Oy0YIbLXkfoCch1Kjg+sGzXIZG167LE+NdiiZ2FfS2JG2xo
         YVL2DWEM+v0nEVeAHLUcwycZgTCgvpDcpv3VqcZnuscRpWN87JCuz154DEZofEy1zKVb
         3n9g==
X-Forwarded-Encrypted: i=1; AJvYcCU77T9Cpk+Qtrh5R7cOoPoEzxFG7ObFAxI1UCuPv9qWBaRnaOitw6wrxH89e1ePmIpWzNTyKwO8qnVvjA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQazT1nII3c5MFpgXTq2eDwVQ6vFkq8vEOCl/SdhA14CYz1Re
	AYCQs7xDTZkK8J6rmvT0Yi6LJyIKbgdTOJ1udcTlOr1G8k8dPE6U+E1REV9py8xjsWfx6sS+yd5
	A3X2VEASv+uGaw+H/kBzMNLkz1QxV/bItGls4SczA
X-Gm-Gg: ASbGnctl0QAHs+8da/9EOYFILj3g1eTToyV2pBPf15phUlxjuwd1L3froINSDIkue8s
	mpviuL9UcEc6grRi/eCBrJdsRAyz5mrW5ioV+oHTyoSipyJt3yRhSKVqIHjK96QZ88vZFHuCCE7
	ZDClgLBnboui47vaZ5ilWrYjFQ+96wlQM40urQXOCNa+ZR
X-Google-Smtp-Source: AGHT+IFltPa9ZfitakgGrPfxMm177FOio7h844aIIw+t6+x6VinRXhlR4cWwxS8sSOM3F5zAxRXT83GItPpdQs/dtXU=
X-Received: by 2002:a05:6e02:258e:b0:3e0:5a78:1dc with SMTP id
 e9e14a558f8ab-3e05c7ce7dfmr1823205ab.14.1751511966931; Wed, 02 Jul 2025
 20:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703014942.1369397-1-namhyung@kernel.org> <20250703014942.1369397-3-namhyung@kernel.org>
In-Reply-To: <20250703014942.1369397-3-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Jul 2025 20:05:55 -0700
X-Gm-Features: Ac12FXxWkHdkSMWNZ7YLK35QXYkZuhgk5-pc7dUVwAS2Kojpr9yIcqhAi08p6A0
Message-ID: <CAP-5=fVysPz0QMhVY=HniYxL3cqPnXakDR_c9a_WN_77Pu8HgA@mail.gmail.com>
Subject: Re: [PATCH 2/8] perf sched: Free thread->priv using priv_destructor
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:49=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> In many perf sched subcommand saves priv data structure in the thread
> but it forgot to free them.  As it's an opaque type with 'void *', it
> needs to register that knows how to free the data.  In this case, just
> regular 'free()' is fine.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/builtin-sched.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
> index b7bbfad0ed600eee..fa4052e040201105 100644
> --- a/tools/perf/builtin-sched.c
> +++ b/tools/perf/builtin-sched.c
> @@ -3898,6 +3898,8 @@ int cmd_sched(int argc, const char **argv)
>         if (!argc)
>                 usage_with_options(sched_usage, sched_options);
>
> +       thread__set_priv_destructor(free);
> +
>         /*
>          * Aliased to 'perf script' for now:
>          */
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
