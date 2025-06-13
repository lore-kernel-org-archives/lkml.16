Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71172254B03
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848016; cv=none; b=YIhcGfMzFwhjuqgo/OOwpQQRTELNimZuJf9T5+hJTmjA4jDboUnD2mQzaCAvq60nDk6clmwYvMBFMLXn4XyO9nfVR2INiENm37TFmzY6ZvLkPjPONNVBA6/WlJO0DhQEy2/4LV1vVjoRQFq5MtQCyhPjFZMNOZfrnBf0Oii9RrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848016; c=relaxed/simple;
	bh=NPEA+c9CfoZwJTAGqgOR53eLP23ZZxJAV9+SMOL2j0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SF2qiwRphOU9k1sroTc39a6O3oR5/Blw31AmWrBWuvIRX8Dep09bZarOKjKqW8dWJSoATwEQlWlho7E8XqMpeau87p68Sf0lrjcon8gEE5Ws4nDpSjzHl4T1n+TIxq/DcrtSv51ThZNgmgHMUdEGOm1UAN2sl2Hol27SMEvpw+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XerQ0ot5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XerQ0ot5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-236470b2dceso24052375ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749848014; x=1750452814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkWUru2eJeXREUI2UfitHIw2f0R8s/T499pHMEQRF6A=;
        b=XerQ0ot5fKAdXuCfLXLlICiQslTslXwFtiyZY4+ZidI1CTS7m2+VbRoXQtzVRu/Eb3
         //Rb75d6UgRiCM+6w69fTZak/XgZQm9VLKrr9xSOgI23HOZu7U51Pl9GdEmE9BAT9Z9Y
         /kEfQil8lxFECLgeTJRCtInn+EdpNEbNkoKjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848014; x=1750452814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkWUru2eJeXREUI2UfitHIw2f0R8s/T499pHMEQRF6A=;
        b=TYznuMDdxBpSOqaMydE8akoQdTaxKi6AB+KMThYcx9LxVg9hsVvaknPtF9OTyjww+t
         fWlfjjupw8IJIWyzUT82dEhRQ8nYehD3Og8V4RfwMgT6yiErw7uIS8nqpfRHbrvuYhoG
         E9EHg9GCoRuTD7iz2gc4jySLl9TJt+6hkmRfC8nQqNo7HS6eVE1ibMNp9aE3lHhRBRFF
         VbWVX9iph8fuVDgEVOLv7b7EQuuZc7kGJ7+Y/geHs7DlW7PJwpXnCaoRqn78K/UHhYQR
         Q+G4FXDiasRZDFnf8SHtRBeryQS0K9Ina+S1ofjWVmTnN5jrWVfeJHN2W6VpYjvv+fiO
         cjUg==
X-Forwarded-Encrypted: i=1; AJvYcCXrYOZjOQWUQdebONB3ZeRFI+seV0S3zsEIBeyzIan/nhMKspWnXaFNHlgTE1rJBjB/4ya1KmsOv+QVOLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYpPtCR8aHSAbVsijyhl+HtAgoKeOiN1GxZRkFXlkEk4Vf5Vt
	KMmyL5FXQCs810rmjTWXQfIbZzx6an7aXjxLTXXemF0/IQLOeWyDwxrOWm2gYG3JhgvX1k3m0m5
	tLWs=
X-Gm-Gg: ASbGnctxRST8AX0EfsSF0tf8kQnBrHfHqUiIYiDW0ZbKvVs6ikdD1se/LSC/GcQqAZM
	LhoBRmKq/IScNkiuplYnrzHwWmaNubsB1vOQ7dXk2Kr7qcIHIXonfFMVvnfqZTvTbyBXx+OxVl7
	KPSEuxSlPTNEMZScq7JtOrIxztPoVqV++6zHrF4K0a9a1yK0u94AUZ3uBu/s0PvOkp3DLc+bOX+
	6xm8dv2x9ZgR/mBSTjE7NW5ddc2U+NzXfYlbf254EjAsBYWq2Z3eY86SnoN6fBvw36Mg36xrOsJ
	Bo26Uzk/PyLKHl4MhLlueih88uFar2VctIY3juVE7SShxWWgbhO/D6rNqCz/7bS8dkRVT6UQ7QE
	mhG0EBvCMBGQuQkEZO60qqq5EpK3W7Q==
X-Google-Smtp-Source: AGHT+IFEGQxk/68ZHTVU1zmfhvFh3MM+wgIsBz3Xwa1tOQciKU3j4dXtdfMG2ulPDontjNRvdFh+Zg==
X-Received: by 2002:a17:902:c943:b0:234:8a4a:adac with SMTP id d9443c01a7336-2366b32d048mr10158755ad.20.1749848014037;
        Fri, 13 Jun 2025 13:53:34 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com. [209.85.214.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e522sm3846414a91.26.2025.06.13.13.53.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 13:53:33 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236470b2dceso24052125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxGUjywz7vGY1J8NtG+aRyQT1m49Q+wvgLjmlgv5OyhwcBZeeDOfKyoTF+5sgQ1/Fkzd1TlnGINXXqoek=@vger.kernel.org
X-Received: by 2002:a17:902:ebc6:b0:235:1b3e:c01c with SMTP id
 d9443c01a7336-2366b3c3a6dmr12592195ad.39.1749848012320; Fri, 13 Jun 2025
 13:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aEyGg98z-MkcClXY@x1>
In-Reply-To: <aEyGg98z-MkcClXY@x1>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Jun 2025 13:53:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrG+1vVPRGp+CM9Ws64DJd01G6qq+JunF06kaiMJ=zXg@mail.gmail.com>
X-Gm-Features: AX0GCFs-3NENn0x8QY1twjMEt-gvjgpzIjf528Oi7YT6EPKjBmMI3F4uCxcovlg
Message-ID: <CAD=FV=UrG+1vVPRGp+CM9Ws64DJd01G6qq+JunF06kaiMJ=zXg@mail.gmail.com>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Leo Yan <leo.yan@linaro.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jinqian Yang <yangjinqian1@huawei.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Ian Rogers <irogers@google.com>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Sebastian Ott <sebott@redhat.com>, 
	Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 13, 2025 at 1:14=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Hi,
>
> tools/perf (and other tools/ living code) uses a file from the kernel, a
> copy, so that we don't break its build when something changes in the
> kernel that tooling uses.
>
> There is this tools/perf/check-headers.sh that does the "copy coherency
> check", while trying to act on such a warning I stumbled on the report
> below.
>
> More details at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/include/uapi/README
>
>
> If you could please take a look at this that would be great, the initial
> copy was made at:

I'm not sure exactly what you're asking folks to do, but my guess is
that you got broken by:

e3121298c7fc ("arm64: Modify _midr_range() functions to read
MIDR/REVIDR internally")
