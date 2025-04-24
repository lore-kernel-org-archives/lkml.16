Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE3319CC3D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745469278; cv=none; b=b6HFYZqK5uObSAYKFJD1mOol4KFsQIGRGfYwSsuCviuZpLUu7aI23BAJUkOvAdPHKWlwaT3UFfVv2nhmfSIDvnD50D1u2Rp6TQAaPJwy0GocNv0fveK+ghPsYVLQUmRfwwtxQUFYSEDCo8NSTMua7zb+TieE69PeeME7JGjpkDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745469278; c=relaxed/simple;
	bh=NNVsyjj8f805hbTEux0iDV9i4GTgZXfRMGV4ROUHYJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVXTLtqKd0bIiC3hwgNAVud/7txSr/jdD+cRJGwmbsi1QWKis3cyCUls4WUh89JtRzprbsl+DDD6kmdEHc7hprYUhIV1Save0ApZO0Uxk20fKu6T35dFXewvcF2sLepFZhL8TV4TTKVilscWiKB5I9TaWuaV4G9xTtQQKXh8qgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KAFsdazh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KAFsdazh"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ace333d5f7bso102273466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745469275; x=1746074075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oVD7KsMZIzep70oJ/psdvZqPVAbNTVU4usWXr8mlH4=;
        b=KAFsdazhkfhChOdhUB2E3R4wUkqgWzfbGRSZoAaptzdd5EaJVyhxQ/9ZWkFJjFS35d
         g0ZSKl6DzXows7f5OBV9wJmKYwqFc5szK787MpUr9AdXwGOcUyjWvvv+T/gLGXrsZf/Z
         heCosjr9dumkWOV1/pxSx7g2yMcno3RTrABoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745469275; x=1746074075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oVD7KsMZIzep70oJ/psdvZqPVAbNTVU4usWXr8mlH4=;
        b=MAYS8AL9khC6wdxzFD399EPrr0WLSfByvshsM+uyCXSbG6W1NmWWa33u+uwW8luA70
         rOekKfYqiTV3MVQbNwUt7W0C5y4ZBGdiGy1Maoex25+Fm1pGLT5qgloBG8dDKiHKNKLL
         XlCPcIUA0kK0hPeWJSuw36LSp6EhroB+z4zNpVyTOnGpQ/ZHaCSl+cu3rg5lAi6WH8MH
         ZtRpJiM2qejHcxkGzXYMK9pwPeNA5ZpiGb6SoJ9Uq6vAApZfUggjhAawvyf7Y+WHVboC
         2ei1WK3Q3e5nTO5FwNf5oJQfeJBAEHK5HafkwOGlCBC22D8svZ5IX7+Hg517XaiiTie5
         zDCg==
X-Forwarded-Encrypted: i=1; AJvYcCUsYo9wZ8hN9G9s6FypChw4BqnqE7Kj0kS/XEhvhsXK5OVBpLhdP7HL+n2z24nHSfXcUY750ufWN8jCs7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRHHLPTjTLKF3Xu4G3RG6sttxBEEzJ3Tu9QoljOmVKrK179G2
	Lbz7NnDNoUUnHPxXfNYQOEXhde7B99cCRwp3OZ6uUszN3QbWE/AaY8Dl2UpB8otT62AgwspMyg9
	YlA==
X-Gm-Gg: ASbGncuHIkd9to4e18UE7SWaZEV9cPZezMF22Qx0bjggtrWFfMFZmO+Rr6XHneAIhya
	xwF9y+x2SfuL+GDzrUoKODTujzLGNeVqvM02Wda0EEw/guAX1q27bACGCSLMF8vgsYSBEufGVFp
	NtjuMpXykjCMH4Ffq7mfoOVc8jbgGjz0NDsg+mUoOKOXtbCvRMskx+LhLfEl4RsRJrHUYtPnrSM
	LBFbn7vmg04lZ6zxS2MipRBiOIti1TedqMDKGL1BQXa3MHN5BaNVtghy7gECNJ28Eep7YOMarQk
	2OeP0NjMGw+bL4WFadhFReq4nwTSPV+g6CcVZVzPQrv0+pXtysnQQn4ONxBOQYn1InGGCptgmUh
	M
X-Google-Smtp-Source: AGHT+IEPqZv6Da1CqH1WyeEm4FjHR21rIsqOzzn2+/QcPFVjzSZ0im4PaaX+plrage+y39odMypK2Q==
X-Received: by 2002:a17:906:d54d:b0:ac6:fe85:9a45 with SMTP id a640c23a62f3a-ace5744f0a6mr120495966b.51.1745469274952;
        Wed, 23 Apr 2025 21:34:34 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830f73sm40573766b.34.2025.04.23.21.34.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 21:34:33 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso3868a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:34:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQ+DcAeJBHNwjcO1ODpVlCsoNj6yN3NjiheGhZqTX7AFb2kQk74MM6W5hbr/zNoRE0ZLCmNmix33g24H4=@vger.kernel.org
X-Received: by 2002:a50:aa9b:0:b0:5f4:ca7a:c4c5 with SMTP id
 4fb4d7f45d1cf-5f6eda9ce33mr42883a12.5.1745469272831; Wed, 23 Apr 2025
 21:34:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <miliiyxmqko6hx66yhdv4nkkopbm73wbz6kxxlzpts53mscqzy@dpfa6y3wnspv> <CAAFQd5AYA=7rQjdQ4AS1vjb0Z3zHec6bdbhrA2cW706DHZyhKg@mail.gmail.com>
In-Reply-To: <CAAFQd5AYA=7rQjdQ4AS1vjb0Z3zHec6bdbhrA2cW706DHZyhKg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Apr 2025 13:34:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DgDHLhQUv=Bw0Thd41Di740A_yv+7wxDErE_YpN4CqBQ@mail.gmail.com>
X-Gm-Features: ATxdqUE4qIQMx_W2R3mHXFPHa-_-ZLSKs-j7NZxfZys4l9GtuscyIT6zbVQg4Mw
Message-ID: <CAAFQd5DgDHLhQUv=Bw0Thd41Di740A_yv+7wxDErE_YpN4CqBQ@mail.gmail.com>
Subject: Re: [RFC] sched: add sched_show_task() variant that accepts log level
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2025 at 11:51=E2=80=AFPM Tomasz Figa <tfiga@chromium.org> w=
rote:
>
> Hi Sergey,
>
> On Mon, Mar 10, 2025 at 5:25=E2=80=AFPM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > Hi,
> >
> > A request for comments, not a formal patch.
> >
> > Is there any reason why hung-task watchdog prints error header
> > with KERN_ERR log level while task's backtrace is printed with
> > KERN_INFO?  Will it make sense to unify log levels and introduce
> > sched_show_task() variant that accept log level param so that
> > everything that hung-task watchdog prints becomes KERN_ERR?
>
> Thanks a lot for looking into this.
>
> Let me just add that I've been looking into ways to automatically
> analyze kernel crash reports and I noticed that when I filter out
> KERN_INFO and higher log levels, I end up losing useful information
> for hung-task watchdog-kind of problems. This change would greatly
> help in filtering out unnecessary noise from the logs.
>
> By the way, if having it as KERN_INFO by default would still be
> desirable, I suppose we could add a KConfig option to set the desired
> log level?

Gentle ping on this patch.

Best regards,
Tomasz
