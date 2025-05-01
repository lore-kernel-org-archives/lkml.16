Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F6134BD
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064659; cv=none; b=tXGm8BiRVf0KvYz+fWpuB8WOeVUobmp3FiBya+A6jpFImwV6xnnosdzy/8fXVYxc7Ei/5xG9tLTHRJu8vuMK3pU6/L5jUMv6QIAxUd5w0FeAwxbT98FTtB/Xp1T3x35jqAxcsxhC0dp0qJ+zuNIZCgRWDcKy1yGGJSVT1eUM81M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064659; c=relaxed/simple;
	bh=m032C/s1R7TTF1YDoXEvyggUZ6QK4sV+EeQRRFda9NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2wPD9024Lj0mUuio5WZ+IdlP1/9XxsOY8R65uGWX0HxRK+gusRv+jVy7o2hW6WcfVFbTcB7WGxDBsjmv2IymTsHDqczxFen9yiJg+TFR9kGB/rZwvS2phePOGHL1XTnvOQ5JpZ04S65Fkd8I5d5+/yEWjRxKdwgwqs/fhZIBLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GBuZSb79; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GBuZSb79"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso637502e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746064655; x=1746669455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMQWUfws7U51Kser/axqmYXxmZN/KM4177S8600ZBCc=;
        b=GBuZSb79bUb9ckOUSzgBomWNEYFnO/Df084/f/zdZQALT21iQxiaq3mTlRUordCf8m
         JALHSSG2xnm7gdhW+VtMFB10K9o2uXprrzx3tdEbrt8ArXxNtdW+pFiK/dsYA7Y/IkV5
         pG7ixAEh3aKt3pyIG8IO5gSAnYH5PKlTsJJZRiIChuSoHxB8ee41sD1qRvfAPFwlQdNQ
         bTrNuSo/YJu+zwVD7wwoSx/KR+uwB+uzS68u8Sw/WvSeLojxYw+HXA3GZUKzwtauqwLO
         bdDOxF3TFi4AWQW1v3igZIp3I7NXidRiiNdtrN/kGlug+e+U/SJCI0IJyvBZoO7Q8Xh6
         VwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064655; x=1746669455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMQWUfws7U51Kser/axqmYXxmZN/KM4177S8600ZBCc=;
        b=Tc4MlwOD1Kvx7hcQrh0aasxf0yoc4r6/GNJMeHI+ZMvm//zPwwkcHl06Fv6lo28oDu
         evwMNftAxfIL4dFo0p/Qte83FFvD2aqaEuVnsrArIJBEKaqErohczx27LcLA7qdr5wxJ
         abO84v+llJI7z23I6gOe9PkiiFx2k+OwoVb1cSfeCsWKI2RcxE9PUj//Q4NreasuHzCB
         IAPzibs+WAjtF3IHahlvSjg0CWCc7HBEjMo4EXrvPxpoTzc9M/F2Me+Gm9i7sEhsOL47
         d9tUBKwZ0aE6LIZGETD1lfW4c/bBY9GWyY4p3MzFgXpeF3vlkqxoSUX9ZqqIyZMF5GD0
         FSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV01opv7b0nboVHkOuZNfVPq5RuPjoDTz8jxwj+LPb/9NQJdBzqUIYvtx3scuvWZA2o56cpkk9ffXh+5Sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDniAWgxPllG988560hujnBS8H1gJ0hnK8rHv4oeA1NH5hTPUR
	lts6XJQhDD6dze5w8/y8YZloPDVvDY7ZbKOZVv57IvkqdsGev4jmCZSXi1QSZbLPNx8LcV4yt0B
	mfOQca+774kbY3uQcdStc3IcIcoj4Aj+6a0k3WDTDAl+sgdHwMp0=
X-Gm-Gg: ASbGncuum27Vf5H/3CynKljl2R9gqxJu1DgbMJs9xx+PV+LFZCAFundFGLub/J3z17A
	3XXOOYrHpcPX90E5QooDMsQxRTlXC1nk09rKFs5kM7AyOzx1K1zy2uS9h9QOzElHISjrevOuvVH
	EPBuXVtuwOCey/kSlrIEothybz4FCp
X-Google-Smtp-Source: AGHT+IGPP4eNoi9Afdt1XDv/bp9flft6cnNARKrH+necbGfQKPOGgZMGXu/eKULKJ4adP9iNvGApu6iBB/0imeQ0KrQ=
X-Received: by 2002:a05:6512:b8c:b0:549:8a44:493e with SMTP id
 2adb3069b0e04-54ea334bfe5mr1628713e87.5.1746064654771; Wed, 30 Apr 2025
 18:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
 <aBHYT27M1tRxNLRj@stanley.mountain>
In-Reply-To: <aBHYT27M1tRxNLRj@stanley.mountain>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 1 May 2025 09:56:57 +0800
X-Gm-Features: ATxdqUEY-nrj1pzw0FT5ie11I10XYEXPGLRMQH8TQKVaowwehCPUEtnBAr822pE
Message-ID: <CACSyD1M8EZ-qEhSGsLTAs+i+YMGPMw-+39Es1SLg-OxEbgg9yA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V3 2/3] mm: add max swappiness arg to
 lru_gen for anonymous memory only
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com, 
	yosry.ahmed@linux.dev, muchun.song@linux.dev, yuzhao@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan

On Wed, Apr 30, 2025 at 3:59=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Apr 09, 2025 at 03:06:19PM +0800, Zhongkun He wrote:
> > +             /* set by userspace for anonymous memory only */
> > +             if (!strncmp("max", swap_string, sizeof("max"))) {
>
> This pattern of strncmp("foo", str, sizeof("foo")) is exactly the same
> as strcmp().  It doesn't provide any additional security.  The strncmp()
> function is meant for matching string prefixes and it's a relatively
> common bug to do this:
>
> intended: if (strcmp(string, "prefix", sizeof("prefix") - 1) =3D=3D 0) {
>   actual: if (strcmp(string, "prefix", sizeof("prefix")) =3D=3D 0) {
>

Yes, I understand the difference.

> I have a static checker warning for these:
> https://lore.kernel.org/all/30210ed77b40b4b6629de659cb56b9ec7832c447.1744=
452787.git.dan.carpenter@linaro.org/
>
> If people deliberately misuse the function then it makes it trickier
> to tell accidental mistakes from deliberate mistakes.
>

if (!strncmp("max", swap_string, sizeof("max"))) {

The length of swap_string is 5 because it's read using sscanf, which
will add the null terminator \0
at the end of the string. If we input max into the interface,
swap_string will contain max\0, which is
equivalent to the string "max". Since we only need to compare the
first few characters(There are other
possible inputs as well.) =E2=80=94 effectively treating it as a prefix mat=
ch
=E2=80=94 I used strncmp.

Thank you for the reminder=EF=BC=8C Dan.

> regards,
> dan carpenter
>
