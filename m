Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BF1F03E0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501403; cv=none; b=KsNaILGy9gbISO3RJUQCI3ZPkXakDuzv7/kaxOkYEfbi/sLTe1enWERHp5cmea48GEMAd68+6Raf+7IAOiTqww55EX8+9GFPSHJx/1LI8/Na4Lspl4jO1W9bDFTV3Zc8K+MREINRtzkbt/o0Xpj74MKt6Aj87rUAGtFIvrvXQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501403; c=relaxed/simple;
	bh=NjCaM6NPE+96VH652cAxZooTkjH4DOBiqaZ8Cqsk0U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfJhNm9oLQVWZUC7+U7VYyHltSiZZ/GlNjO2a/ZKCkyLkX/DRrXfwCKAiLU+C+Gri39qMU79WRYFIT2gZlNcpBcUVT8fmzOCODAYpx+petGjnSdnLVRH6YgIYl4TssbvNknrSbHLoSfrMKBhpv887BdeDAQpbhzxhRTIyyUb48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t9iFLF69; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t9iFLF69"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2240b4de12bso81264895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501401; x=1744106201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=t9iFLF69cofGDXvp7z0LaZkykKW7esNExBN/KG1h+brUINyuB4lNGJHJBdWWQU8Kdo
         wQk1FfPrDvrJHVe9P2fA0jU5KLXCvP1WZflDU4Tphs6+dLTgt1qkrx1M/E2ftj6UkqJf
         cGblhz7hEOxbYBaU4F9Vdb4TUdIPY6XHOkIsOINy2hVsVTa3JceDGbc3lYPhyNjXw7X4
         s7sdJSkO/ig3TTAE13nArSq7hUxldDhkGbxTvg4354hw6e3z/c4LIYcZJ42+jqZC4LNa
         Jr/0oWzPMP9DZnGG42atPooaKHubp2iEyIYCeVdLaEdwNBkDeCp1SqvGRbLgBW0ZkTgJ
         FVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501401; x=1744106201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aocl7KwbvNUkzCO2WrWHJhkuKprouF8zjARuTRimIwc=;
        b=qysFD/NRIR/5PFLx12hBk5Zb4whUqkuhNMUHBqW7MlToEc7oiSrmcnJjeUk3BfRmjj
         Kvf6VP83i5Ud7TEd1KXtN4nt/wfNDERxuHspXoZnDXG6FhmQDIGIwqABnnXBN36RHFRd
         jzTbwby3EMaJH8Qov68lRjZWqgaMqDWFyJt8bcD6ZFFx9mmb53ZUmUqDJymQTbZstN0x
         P2MHfMWPPbRmQNS01ezaSiK65SD/L+Ze7EF0qMgCkG+u/BbAKmoAA0PfWACKCAFJG0cS
         FBl83t+fFxQyXOptJqFextyf85Y9goj9UZnK0k+zuHFPQTeLnYkSSCdsSA7g07saaIxU
         U1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVwVNwKXoaCLEv8QqoklhxVM5HJfI6ETgjsinRHd2vvV72avSdBNP1RrZmy+tky+ehCq669daWId1qaM4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUg3yRHEitpG0JZDsFtntx6B9ahQVpZqS/OKcuucX6iajrtc5E
	2ETGnKeZ/ElSqED1bPuu59NrvLpeT25NRgMA3/2D/wHvtQfGy88YA1hkLtO6uzn4x5uKxlQs6Cg
	h+fsTrOZV9K+hbY+zt9nCX4fuzkdkTBdzlmmoFQ==
X-Gm-Gg: ASbGncuyteN5MTt3UpeABuM8yHtjUHLGfeB3PsHSVlZ36D69fXmeTVsn4AYLwBN7jhZ
	UMRkCW9rump7Ynwc89afQZLtFraHbZh67t8TwGz3B1R36UrDij4cbyL9rCzK4j0l0GsAC91txER
	N3vwdbfECsdFNx5NRFYGaagKeoJJ1fz+Egv3Kykg==
X-Google-Smtp-Source: AGHT+IHEMnnnmcPGt6SPwgUcHIAgu4byClDUyMF2Ro6APnhVIeAiXBrYYkjDBhhJ0hxiN2KwSVdg1cBseMLltQ3nC1A=
X-Received: by 2002:a05:6a00:b49:b0:737:e73:f64b with SMTP id
 d2e1a72fcca58-73980339eb8mr15251487b3a.1.1743501401272; Tue, 01 Apr 2025
 02:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com> <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
In-Reply-To: <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 1 Apr 2025 10:56:30 +0100
X-Gm-Features: AQ5f1Jou6RuMhYg-mjMPT8QE1MQ92d3liRY4RQMc92_C5x1ac1ut41GmRyDV0w0
Message-ID: <CAJ9a7VinQSx9FYvw4ww0KQgMqapLhWTaU9D2qcc-120YywUu2Q@mail.gmail.com>
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in coresight_path
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Jie Gan <quic_jiegan@quicinc.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 1 Apr 2025 at 07:11, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/1/25 07:12, Jie Gan wrote:
> > The trace_id in coresight_path may contain an error number which means a
> > negative integer, but the current type of the trace_id is u8. Change the
> > type to int to fix it.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>
> LGTM
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>
> > ---
> >  include/linux/coresight.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index d79a242b271d..c2bf10c43e7c 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {                                \
> >   */
> >  struct coresight_path {
> >       struct list_head        path_list;
> > -     u8                      trace_id;
> > +     int                     trace_id;
> >  };
> >
> >  enum cs_mode {

There are many places in the Coresight drivers that assign a u8
traceid from the path trace ID.

e.g.
In coresight-etm4x-core.c : etm4_enable_perf()

drvdata->trcid = path->trace_id;

drvdata->trcid is defined as a u8  - the reason being trace IDs are
128 bits wide with some reserved values.

Will this not just trigger the same issue if path->trace_id is changed
to an int? Even if not it is inconsistent handling of the trace ID
values.

Trace ID errors should be handled by returning an invalid trace ID
value - were the trace ID value will fail the macro
IS_VALID_CS_TRACE_ID(), or separate the return of a trace ID from an
error return in a function.

Regards

Mike



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
