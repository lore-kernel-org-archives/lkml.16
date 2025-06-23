Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035F81F582A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750712875; cv=none; b=a1radprgaXFBTilddr7T4Fq8KZAAZJigrHI8M+RhxSvFT3JehiMdQJtQSAm21GD2ddy0btnmwe46Tadv+lDnTaoinwecOHamopAU3Fdb1bDZQSupZE0Cddr886EoIjaKsBLMFP8mQncbcb5ec09KjxURPzcbosyJ9oUHRV03kx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750712875; c=relaxed/simple;
	bh=QYSgA2r9Hoq/PyEKP+W5aS5hG/seCLS+yMuWGfPqxDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiSmcK6B1CZjmXzRjwo32+UoQjGIpF6ZzL90byNLW4cx+K3N6uEl11PQSNWdUCZVDTKPAYNOSNMunzbu1p0gTNrrEo06x5iUKrVc0/gW4EOSIL5PtC1ReVGpwfKoERWQApOxnW675SWzUrQYQzHv5HF1PeXUB5hWLXv5l3S4XM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=st8Buq1X; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="st8Buq1X"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so53285ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750712873; x=1751317673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4cX0phktxLtIZp90+OwfwSNf6uSHnahTRACJDaKBFA=;
        b=st8Buq1Xh6wu5Z1sLuJ4RrIdSnsppsQ3TgldF/7GlHufJ+8TbJM/NQRWdu3qFIq3mV
         IiSHJLJa8ya5q1+Wp84qZ/Vhc1Mtfg9fcnrjmdwQUEM6s5H5lPlMETVxS/AHs2OY1WCv
         MBwX3Bl5pqK5jPl3CJeBLB2HlXJ3BNbQ5JVQBfBT+8yf7RZBpOxX9lXzl0W+8LsUmN6c
         bKhAkkDSyEUILr0W4rnc/R5Y9rHwaWm9V0mMVKBcT6xEechSJ37Gio7cTtk4P1MWGXQn
         kDJWjKqyG2aaruN6Dp4Wv0e3V5WHikousykFg+z8jPbXi9SeJwO5p7X1uknTU6RWKLSk
         B2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750712873; x=1751317673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4cX0phktxLtIZp90+OwfwSNf6uSHnahTRACJDaKBFA=;
        b=YDFhDLsHURa6Da1hlq9660C43RXDy1XD8iGagwpykoFAfhQ89gyC0Dt9RvE/o2Et9P
         5EWUkvHCgtUMhZjaA1zlZ0Nsn7RjNqBFcyPKELrsB3EWhPMCT/NSZnm824ZymkJHRQc/
         V53EhAPRTT63XH9tSXpl+ccUErJnV679Cm7SC2FAnlnjqrE2VciZMfohmUzGMkFavkg3
         4l3MS7+P/tWI/pqzYCw6A+69zUiMKDlkhU6VZpa/Sq3lgJ30J/DCzlQHYI0GmorZyUnD
         cBzUFx86sWVeb3MnHWkkCp1wzUtrl9sKY7PlFWGOAfgd3N8u79SBhgexF/skfaD4jT13
         oIiA==
X-Forwarded-Encrypted: i=1; AJvYcCXCV6rTNftFndZbLikiWXsmjMMTzvyEadmaCWtXW5lENQrpo8XaXgwwhUGKvD3YtscGt+GPu33rnbWeG2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5LUNa2utHOAOlTJ8FOe62jKu6BICwW91krhOMVjrE5x2mdiv
	pVet1QGOqv7SJNpRIJcE8qZdj/4OI1QW8Mu83xmVJFDTkHEba3YWMnURHecICg0cgfmo/afZfcY
	mgtNh3m+lekJvmlScxPMCt9wxhf1rlBL8Mn+Zga1o
X-Gm-Gg: ASbGnctDanDtJtJk//hkOOq+PdUqGMweUYB+0FMa4aIuFvAzM2CjYsqHodvRV1hWt6W
	A0Ll9Dwpy+VdZVcV0LP+Hxow1QWIP+0FIx3p7RlsGOnT5YIb3j30A+6LvPFGLUO/6s8EMfjLfbA
	1Rh9FphMaEIWtsUL6rcFCvpLcrR5erFmM0/BBXRsfmfAaedsvE7GFDkgAFlVC3PBM7XGKVAgVG
X-Google-Smtp-Source: AGHT+IFQo7whZ43umpkON7cWHCeG6OEupE+1dDqM8Rn4tGg8MZoRe7tVwq2DQ7onfuTeRsVjhMgAyWWGJyuOZG8BsFA=
X-Received: by 2002:a05:6e02:3787:b0:3dc:a380:3ab3 with SMTP id
 e9e14a558f8ab-3df29806c65mr614355ab.29.1750712872755; Mon, 23 Jun 2025
 14:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620212435.93846-1-acme@kernel.org> <20250620212435.93846-2-acme@kernel.org>
In-Reply-To: <20250620212435.93846-2-acme@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jun 2025 14:07:41 -0700
X-Gm-Features: AX0GCFuW5EtyEiOg10N9QdQ_vnwsKRM3tQ-FpqSv0D_UnLEn_f4f-NRtdNqss98
Message-ID: <CAP-5=fWzHDsa18SjSJgdJsZ8myyA-JH6K7CjZQo8f8GfX7+rAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf build: Suggest java-latest-openjdk-devel instead
 of old 1.8.0 one
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Clark Williams <williams@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 2:24=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
> Just tidying up the suggestion to pick the latest and not some specific
> version.
>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Link: https://lore.kernel.org/r/
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

For patches 1 to 3:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/Makefile.config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index d1ea7bf449647eb2..afebd3b1e6cb9f58 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -1144,7 +1144,7 @@ ifndef NO_JVMTI
>        endif
>      endif # NO_JVMTI_CMLR
>    else
> -    $(warning No openjdk development package found, please install JDK p=
ackage, e.g. openjdk-8-jdk, java-1.8.0-openjdk-devel)
> +    $(warning No openjdk development package found, please install JDK p=
ackage, e.g. openjdk-8-jdk, java-latest-openjdk-devel)
>      NO_JVMTI :=3D 1
>    endif
>  endif
> --
> 2.49.0
>
