Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED1285CB3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077237; cv=none; b=PuBV073+ykQHnvGaftcTdPu7QOkE7the3mphm5XBzLyCQ7xwbWIYNfFEiTSU2hxTCk97Tu6VidUuEjG9cXmxdE9Knvo5C+EGHeM6z/aj1cLs0JqkNzH5YunBAAy4RjCPSX/bU7QuqNMJ4+vgOjfPeaIfPosYBdJ7uq3+6bdoR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077237; c=relaxed/simple;
	bh=VTO+MOwE+3UvamJMwJEfezCyDM+9b+R88RPfVS5ikyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exrTqBjU7XQQxoJiPg0NBm99Yio0hUNggcT7UQYCZkeIQ5adO5GbWI+Hk/TltKdTTlMb4WicmPdiIewMn3oU/5ZbADg/0OivRch0Ng8ex2FCTzS2AoYp+NeS542yMKcm1kwwjD6pENS2h0zyLnCcwjluIExaUKdQ/tGFDU7iT8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLx43gsU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLx43gsU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade4679fba7so818956166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750077234; x=1750682034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3qChbk2jpijyewluJhiVYJ4VmUGE1Ux2rS2qyDk29/A=;
        b=kLx43gsUsOilE96WQHCZLXHBCWdFFp3NIiVq6n1Ul7OPjr3Eg4SfqxkLccn8wfM+CR
         f1aIv5nW3NjFH9UpsGW+S81Qh240ftRYYAzj4LqnEjWgp+NhwvICauBdPQbOHIg84lHM
         ifJTT+5idvNoAbocIWmu8KW5Om+4UU7UWoIrRny4Ymo2JhuZnP4tdRMUOoz17maUIT0m
         p6g2GwwpN+byglmjhw6KgqzMJ0PWQLjZnju0hh3k4ZVOuPj6kSIrewA/l+agfnJ96EbG
         6zIeEmZTDetj7zf4Z40yiNYeI9Qro9actJeacViukSCew5X4dh9Px/13e5ub6jcI+U4e
         OdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077234; x=1750682034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qChbk2jpijyewluJhiVYJ4VmUGE1Ux2rS2qyDk29/A=;
        b=tZtXLcArttPdgu8OEKSKMES3XluvTeulh7sMLZO52N7aMhoEsjmnpakYFv5kik72mi
         Vdq8Bl3vUWtAh/nHVZeayCqvJhZNQhh/dSQgq3uq4llNaukQk9biz8ptlufw5wN4SOKC
         I50xp74CIRKYJgOaHWGAch0fXPedpK3MurbCctHPMiRYKV0QhM98HWPGKVNZrhIcI7w2
         CrLqwtl1Qbw+OYcRt64dUWHQJX5dZYFmVidhZKgGZokcXFOfNyZQtpgqF3mXFQVfmz4q
         lwOkX8AhDVG+vJKPDYPBafMe1OgPN3UDv/Gfxrf359njonlKYANdEnblayxassnb0cym
         7eJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhIDmFYVQfgaflYMDiT4Cfp48st9wWs8s0J4kjYOO3o1In4U9vVoGxSHuoK0kusfnrN9WofxPFRuzmBp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSW2qvdGjsHSZ7CVyXRbIbd9KPorkuBfbkwG/7uZ/FvYEofUGC
	C9eWF0MfX3Md8qwGAIf3Dpq+JnWEdmH16vWMtfEJiKTRemCHpfZoSwhD2Dz/FpN3HG2rxbT4prJ
	l+8OpnrmskacsbLiXFK2qRJQkr61RUW6/VfPObO0QJw==
X-Gm-Gg: ASbGncs1BSqlLy7UZlR3tqHkz919Ftms52kLD+VMbE38XDu6E4FyPf48yA0yrl2lPCv
	cEtBrQnQDG0UIFS3/oMP5iNsWxYG0tAqDtml7zgSaH2ylweFHnAErM/5Du4cObvKcke7FO2znho
	iKUh+7F7vnvZ0ZcMKF7PhiUr1L+nU0/bUCgQQ4Fs6JQFEI3dE8Cbizp8IRALyJ0RdHPXqblxw=
X-Google-Smtp-Source: AGHT+IHJ1r7f+bN+38CNZCRYYfq/xLyziXR9aj2C6PGvdYWAcEoSdgh5uI9Z1n9LAO+W0zM+rcNrdp8slHbl5L/fmWs=
X-Received: by 2002:a17:907:a909:b0:ad1:e4e9:6b4f with SMTP id
 a640c23a62f3a-adfad54b174mr871962066b.36.1750077234134; Mon, 16 Jun 2025
 05:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2506152216150.3463@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2506152216150.3463@hadrien>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Jun 2025 14:33:43 +0200
X-Gm-Features: AX0GCFtRYY39M0KnMZ-ReCXTgYnFQgP6N7hPpyrMH2lmPrIv8WxQAdpjk6ktZ-s
Message-ID: <CAKfTPtD2hhP4Sx6mxJT=Pzwc3mc3KEK3SCWOxB8CMdLn3QyxCQ@mail.gmail.com>
Subject: Re: has_idle_core
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Jun 2025 at 22:26, Julia Lawall <julia.lawall@inria.fr> wrote:
>
> Hello,
>
> I wonder about the following code in select_idle_cpu:
>
>         for_each_cpu_wrap(cpu, cpus, target + 1) {
>                 if (has_idle_core) {
>                         i = select_idle_core(p, cpu, cpus, &idle_cpu);
>                         if ((unsigned int)i < nr_cpumask_bits)
>                                 return i;
>
>                 } else {
>                         if (--nr <= 0)
>                                 return -1;
>                         idle_cpu = __select_idle_cpu(cpu, p);
>                         if ((unsigned int)idle_cpu < nr_cpumask_bits)
>                                 break;
>                 }
>         }
>
>         if (has_idle_core)
>                 set_idle_cores(target, false);
>
> set/test_idle_cores works at the LLC level.  But the mask cpus in
> for_each_cpu_wrap depends on the set of cores on which the task to be
> placed can run.  So can't the placement of one task that is pinned to a
> small set of busy cores prevent the search for an idle core for subsequent
> less restricted waking tasks, until the idle cores flag is reset?

Yes, you're right. Now this is probably mitigated by the fact that it
still tries to find an idle cpu and load balance tries to spread tasks
on core

>
> For the moment, this is a purely theoretical question.  I don't have a
> concrete example that illustrates the problem.
>
> thanks,
> julia
