Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA7176ADE
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739171842; cv=none; b=cworuiC50w4Mv2oNlp71ChkQ4BB9fROqiw4HGN2l4K7jzkhCKvElkJy+GBOvVQMMWOOsYyReTT0G9EM88re+SY3Zlz2UhxUrNT9pkg6jmDeGiBPRNhudiNKbl6YZAajLjjfZp/8NcEXYmK9p0C1dXUgd8eGwrTcHpjabUS6KCs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739171842; c=relaxed/simple;
	bh=PqU5A4FMZFlxYJ6n4cp0rMsHR8kXG5WST25sekbrfMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3ijkIi5UAwR7sHsQ2GFoYili/Sr9lTwL9/SzgRkLMgfwK5z4bOSQiWggpDovbBygq/1PMUIcoMb4O4Z6rGkQvzPEeMSYhyuq8/A2qpRuzDCFKvKpPL9Yy8b4yA8DpJLlc8TU1Pr56yQUYaF2b9cnbL9fM+oDeECqXlQsz77atE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wF2BRsyI; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wF2BRsyI"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-308ec50eb3dso7392811fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739171838; x=1739776638; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxiCixcf/BZLPpNs6FKNBHElHTuusaAfh8RJs/w71Nc=;
        b=wF2BRsyI9QF+hB+ZcHVeKVkVi3DwOo2IJszPIi3YnNI3jVXv3FI4XcwgINMQ9Z7ijX
         3Fj2bR5r3Wj5Y3wSiHpji+9cq0nMxqXF/zs5Jv/z9tUCHxMlTHxLS/qkdWSkh6UecIWQ
         GPhtb7ttc7ak+6Uz/GuDLBK9jueD3uU2EMyo8hyogzCc7MxwyXVbOzUbXHcIon9P1x5M
         fkG+tjmwqCeZ4v8M0ruSE022F+lH+4fyqoAIfTqEshyUC9ZwaChYM2JwkUOf/PwvYhnc
         uB5XLYMcFPltBePPIpMDxXsl+Y6Wk2qyCqU+rDPs5Hp43NCT+D5zQEmQunrvlZdO/ayB
         +ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739171838; x=1739776638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxiCixcf/BZLPpNs6FKNBHElHTuusaAfh8RJs/w71Nc=;
        b=YvUIl0H3krT7u+xrGAg39dSZBlfDp7FvLw/z4FYzj6yg94C2Fz+SpU8bQh4K4vkOUd
         j/MZWqgvD6zhYSlxl/vtIl/efpC2qcdFKbuq9ZW4OC7SL/5mZk74ZYf3TtljIyHH77AB
         3Hp1IQGQubthJETEFHlfoV300BP4YHRwVpZR7coTx5/+aO+uivefidI0oPmx5aki3exW
         YlIkV0cjSpJLgLuMgL2FnM93l9a1+eT2BWEjIRUPRPn0kYSOnWPP+0Y0ffxIlLdFzZwN
         WymCfTJUmxeUHTL1lbSZU+IFBneuFQgWiIXsxvzPjD7OIyh4oDw3cgP1Axn9fq6/27GO
         JZQg==
X-Forwarded-Encrypted: i=1; AJvYcCXDjgaZ1B7PZKzsm7q9s54thvs0L7d6wOQdoYodAL2PNiffm+K+88+L1SJyxLD/6r6Rzh7DKo5JYeF1IeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwEHOyQAK6h/GbSU6KXf4GW2OhHdrcWA0iR2kouwwvebAf2ll
	qlrobytUTagMZBRPgCfm10uk/c+GTdrVu+YT8xeiHGl8phZZfes/QS6fqeSXcRqdjX0ej5r42JP
	xCaqSQPXiD2OOgouYnWWhRJCac2k6ONwgqLdM
X-Gm-Gg: ASbGncuJ/Uf8jJqqehY4S+l52JU9MFGXtUlcqqRCbwqMrguFyxlYldLUvWngha3YpSS
	PKMJ/r77Jda977CIkJx5fQb49t+Mkm8KYX61WMyNLYtNKKAqvoir2xcjZDsIg3zOBIK5e6PazHD
	QAEJHUulAFaCvs802LLNnawXXrFxTx+g==
X-Google-Smtp-Source: AGHT+IGLhFLNb1n+WrmHp8E6o8lZALCn+qvMi+KnDesdv7ZGzAxB5bSmJ2j9mR41XtqD20dXheJ8AwH3v6zs+SFKvfY=
X-Received: by 2002:a05:651c:221c:b0:308:eb58:6591 with SMTP id
 38308e7fff4ca-308eb586865mr15288651fa.25.1739171838058; Sun, 09 Feb 2025
 23:17:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738772628.git.dvyukov@google.com> <87ldujkjsi.fsf@linux.intel.com>
 <CACT4Y+awFXT2j+HMeAy2RKnoBzb--+heFzJUoBZWp9iJevy1Dw@mail.gmail.com> <Z6ZRVeoFxT0NV9yb@tassilo>
In-Reply-To: <Z6ZRVeoFxT0NV9yb@tassilo>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 10 Feb 2025 08:17:06 +0100
X-Gm-Features: AWEUYZnHFduaB6kEOZO1RVzeSKo8nMj3KreybZn7JDEc96KYZaaLwsoJ8m1r8ko
Message-ID: <CACT4Y+bOVd4hw2fkE4ahJnbyAuc_=wMu_HMkAUbAhL--dTxBiA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] perf report: Add latency and parallelism profiling
To: Andi Kleen <ak@linux.intel.com>
Cc: namhyung@kernel.org, irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 19:30, Andi Kleen <ak@linux.intel.com> wrote:
>
> > > I assume it just works, but might be worth checking.
> >
> > Yes, it seems to just work as one would assume. Things just combine as intended.
>
> Great.
>
> >
> > > It was intended to address some of these issues too.
> >
> > What issue? Latency profiling? I wonder what approach you had in mind?
>
> The problem with gaps in parallelism is usually how things change
> over time. If you have e.g. idle periods they tend to look different
> in the profile. with the full aggregation you don't see it, but with
> a time series it tends to stand out.
>
> But yes that approach usually only works for large gaps. I guess
> yours is better for more fine grained issues.
>
> And I guess it might not be the most intutive for less experienced
> users.
>
> This is BTW actually a case for using a perf data GUI like hotspot or
> vtune which can visualize this better and you can zoom arbitrarily.
> Standard perf has only timechart for it, but it's a bit clunky to use
> and only shows the reschedules.
>
> > Also (1) user still needs to understand the default profile is wrong,
> > (2) be proficient with perf features, (3) manually aggregate lots of
> > data (time slicing increases amount of data in the profile X times),
> > (4) deal with inaccuracy caused by edge effects (e.g. slice is 1s, but
> > program phase changed mid-second).
>
> If you're lucky and the problem is not long tail you can use a high
> percentage cut off (--percent-limit) to eliminate most of the data.
>
> Then you just have "topN functions over time" which tends to be quite
> readable. One drawback of that approach is that it doesn't show
> the "other", but perhaps we'll fix that one day.
>
> But yes that perf has too many options and is not intuitive and most
> people miss most of the features is an inherent problem. I don't have
> a good solution for that unfortunately, other than perhaps better
> documentation.

I don't think this is a solution :(

I provided lots of rationale for making this latency profiling enabled
by default in this patch series for this reason. If we just capture
context switches, then we can show both overhead and latency, even if
we sort by overhead by default, people would still see the latency
column and may start thinking/asking questions.
But this is not happening, so mostly people on this thread will know about it :)


> > But it does open some interesting capabilities in combination with a
> > latency profile, e.g. the following shows how parallelism was changing
> > over time.
> >
> > for perf make profile:
>
> Very nice! Looks useful.
>
> Perhaps add that variant to tips.txt too.

That's a good idea.
I am waiting for other feedback to not resend the series just because of this.


> > perf report -F time,latency,parallelism --time-quantum=1s
> >
> > # Time           Latency  Parallelism
> > # ............  ........  ...........
> > #
> >   1795957.0000     1.42%            1
> >   1795957.0000     0.07%            2
> >   1795957.0000     0.01%            3
> >   1795957.0000     0.00%            4
> >
> >   1795958.0000     4.82%            1
> >   1795958.0000     0.11%            2
> >   1795958.0000     0.00%            3
> > ...
> >   1795964.0000     1.76%            2
> >   1795964.0000     0.58%            4
> >   1795964.0000     0.45%            1
> >   1795964.0000     0.23%           10
> >   1795964.0000     0.21%            6
> >
> > /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
> >
> > Here it finally started running on more than 1 CPU.
>
>
> -Andi
