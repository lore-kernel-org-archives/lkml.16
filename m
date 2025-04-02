Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2C139D0A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743612927; cv=none; b=Cwj3Z61L+ELFeIlQIHBSR1mTB/WHWjHzrxg9mZGfUOZ1v5qsi3Zg3wMh7OGj5Oz/yMQYNORB8I5Vval3k79CZmKS4L01S8CPpT0a6Kx3/UQFtdhs//tJRv7C8V/DrfsjhQg1oz5mIfyp2lGWJ+YMPBsXs8tPnGLL3kwQHRST2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743612927; c=relaxed/simple;
	bh=ulrdwPEfmjUk8IT8rXc1Llbn11efOcN2yH0jBBhPp3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuwFpjrLY6SGpIG4KSaYTCRoTtdvnr/KvCyAt323f/lPDXjgUJ62vp4VlxZ9RqkboOISo+kYIIhcriVvrKbjtMmNtDqu5t1brmeh9pj2O4vfOnlS/iDV+lsWmGsHp7pBGZ0EtbfQ+vooVAg7825XeK44SkrvQG/zCe1uO9s6Bj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SYvGSHae; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SYvGSHae"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240aad70f2so298955ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743612925; x=1744217725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1+p+u7oJ2fOG6rupJyrqrL/J3r7aOOvHki3BBz9/Y4=;
        b=SYvGSHaexKJ9udT1dfaiiML5+yF5J/wlcE1Gy1wLZ+Q6Sz6tc88yKJYOTXXI5dXhd6
         x5T+T2IlNiaAsXCsV/ZoTnWIOfSgqDR8dFA1nM2bd0mk24x0B09gSGzrHtYDMoQaNBPp
         ZRKTULvv59Ud2b/ecsLh5yvuHO8FtXIZnuw0AHIXeoB22VNmje7K05qpJcQgZDwl033r
         /63YLyWVyS3GibvbEdI213zS8XYCw+6ztVPxPH1v4iI1QUUf52/XnQ0lSIaqLkmPM/OT
         QKRNx/7iR0+wBfM14ZqovkBknHAN7rSwonKop+tojhGBmPyjgQV+BL3RrQ1qAKX7n+jO
         8h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743612925; x=1744217725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1+p+u7oJ2fOG6rupJyrqrL/J3r7aOOvHki3BBz9/Y4=;
        b=PTDQmaiVz5r7/ZWMTCPo1PNdPyGYhRvDEOCxWW04fAjwXistH1I5o1aTeJcBfr1jSw
         KpAaSW0arsQgTaaChzJjYUWuAE+4RXz9WwIkDOMpy8SWVFGNRDXBIQ8nHaZwoJmTVeMv
         Dbs2UqEb71ga2LbRYO9eD+JUUDHL5lG1TQ8Kg21T0efSaAdUVXYj3wGreEC5wazJcZQ6
         ByV8WGeXJeMqUfE2gKiqw2m1dlcozY3pQQI6BkYxxBMg6gCjCkuTRO3LOyPHBgdeDRNV
         fKP4OHpb/tVcML558teG+P+H8/JixoHdValZudJfwPKu9enoEZALij6j20lMSGMmRcDj
         b5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXxfzU/XCuAZ3mazEfhM7JvcHMM0oxctey0fq940wWnZ5k7voQX2Adyu7b07JDsGzoFdBMaZPHsNokXyx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/vWTFfTMp+NTnLcKbI0E++bW1i6eAVooFQJXDAe8gkyKGEmFT
	gW8vRgz+vLu/d6t/ew19aqi37B9LWjsMtP1XhwnY6bxmzWjZoAJ+pNZJbpN/sbp1JzdhwNTT1pO
	Ali8+5hmCTlwDACY4bwv42ezoc+IW+1EsJyr7
X-Gm-Gg: ASbGncsQjA7RpBF5pllrzfmjXt2ckehK6oLo7tDxUuPakuJpcvQ1SczyFjE1iYwMM5D
	inuKx/YkC3+KZBrU/cUD7hTssxqEMhEhv4Q5DvISjR1MVHQFYWIArMpfXmBobEvYmMOgw7UjiJi
	bJRWykcFnbFwcc8nUPyRZIhqsyKIA0kL12x8+UizyAew4lfC2sqE4jqw==
X-Google-Smtp-Source: AGHT+IFxeDB0yIrClam9o1iXY8gJunDBb+Z/vkv/PhtQ8HyON4Llg9ykIV90m3xXDAPGCFc76xoWv1HznNT8aLnAlQ4=
X-Received: by 2002:a17:903:3dc8:b0:216:21cb:2e06 with SMTP id
 d9443c01a7336-2296bdaebffmr2098315ad.19.1743612924583; Wed, 02 Apr 2025
 09:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402082106.103318-1-dapeng1.mi@linux.intel.com>
In-Reply-To: <20250402082106.103318-1-dapeng1.mi@linux.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 2 Apr 2025 09:55:13 -0700
X-Gm-Features: AQ5f1Jrf4VkU9NzoUMTfo2fkSLhuzPQGMbEaKh67unWrJZb2x80Qvws2gcP6TGc
Message-ID: <CAP-5=fU3Tam3PXd94ibVQZU=Kk4Q_=z0i9o7kx-Vgm9qwK-mHA@mail.gmail.com>
Subject: Re: [PATCH] perf tools: Fix incorrect --user-regs comments
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dapeng Mi <dapeng1.mi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 8:58=E2=80=AFPM Dapeng Mi <dapeng1.mi@linux.intel.co=
m> wrote:
>
> The comment of "--user-regs" option is not correct, fix it.
>
> "on interrupt," -> "on user space,"

nit: I think "in user space" is more grammatical.

> Fixes: 84c417422798 ("perf record: Support direct --user-regs arguments")
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> ---
>  tools/perf/builtin-record.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index ba20bf7c011d..f21b133691d7 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -3480,7 +3480,7 @@ static struct option __record_options[] =3D {
>                     "sample selected machine registers on interrupt,"
>                     " use '-I?' to list register names", parse_intr_regs)=
,
>         OPT_CALLBACK_OPTARG(0, "user-regs", &record.opts.sample_user_regs=
, NULL, "any register",
> -                   "sample selected machine registers on interrupt,"
> +                   "sample selected machine registers on user space,"

nit: "sample selected machine registers in user space"

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>                     " use '--user-regs=3D?' to list register names", pars=
e_user_regs),
>         OPT_BOOLEAN(0, "running-time", &record.opts.running_time,
>                     "Record running/enabled time of read (:S) events"),
>
> base-commit: 35d13f841a3d8159ef20d5e32a9ed3faa27875bc
> --
> 2.40.1
>
