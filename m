Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE62218ABA
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 22:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738707818; cv=none; b=mhZMVNkpcCiIbKoowDgSvgCW6PlpUJnH05ymvNPxy1EOiQ9hWRfi33eNBJekNxUZ4fWVRVMZ5u81J+RGbwy7TyIobIicP9P1A8Wqx/B8zUwXvPJkHvpxDJmScyhSuRpT39pgcGQVWzOEwFx3Sqj1bdWe4MhALInRJQ0Jab5aJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738707818; c=relaxed/simple;
	bh=NL+88Ui5xhbUBhQW26o2YlcV12I+N2LlNIyfy3OECHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nKtcihOXkGDvTs8mtd52OKalORTJ29j2UgjLFVPx8GjGX4vazG+XF21jGDpAZ7wsSqZVrW3LfSCwo0/HusHbsY/ZGZfhuyixtZxsusJkBY+3waBuahA/Sy+f0rZvpJq2Qrcof+6NVpK7NJ0EvXl9aEmasXf2vTd231nZcwdHDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V0AoCC88; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V0AoCC88"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a814c54742so209965ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 14:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738707816; x=1739312616; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL+88Ui5xhbUBhQW26o2YlcV12I+N2LlNIyfy3OECHM=;
        b=V0AoCC880+nd1NCKRsOmMaA1DX0lXUAvEL/WaeBt13pJE9JpeqYqEbnO7dTQeNCe3z
         T5jBn6i1jLvOO0ncKyYJMR+H2pGyBnvslST+3NjDZ+q4EXsSj0BA2IUPI+fOkccuLq9a
         w5SA9mnDADPEY8lDbBGcCjsG3cO9naw4gk9HDlokOd+Z18XTalMZ44f0o+sP4P4n46JE
         65roqge1BC3tH2WI/ncsz61/6dR0kGqyCa/bEtJuMhB3yyw1q64awVRUfxm8XQe3nBTv
         VqMo1vmAH/5gc6ZzRXcDBMFJBp0zu/r3olOW82TKSJzZIRp9D7Jo/m4adlmt3QAMYdk7
         1APw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738707816; x=1739312616;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL+88Ui5xhbUBhQW26o2YlcV12I+N2LlNIyfy3OECHM=;
        b=B7gG/5PwV0mHJV+BP09fuVHZWOwm+0zt1EkVdWQyicvYc3RcmTwgq4meeAsEJBJ40H
         GFuSO89E36rXu6a1XXnjk8ojPJhOAAc1XodytidcS4YauYBSQMja0Z3AfiHeK0mld8Z5
         0XxKSsSIRHAW4EZQMMR1JLlyMEwN4WwULdOjyurlxgy6JJlzRv2jegm3+Vv+k4sRGOzA
         iswEpQSuX2e2XDUxX4Li9D1+/pNkDpmvH14auoEUNv7d1vh1293FWOA04ZeSS3FlIhfQ
         o5ax7bRjWMVfqp+T13n1l003upJuEH+d7vz4cL5WNgwWaSGjPV5dW0OgcsOgrhWYybL0
         eg8A==
X-Forwarded-Encrypted: i=1; AJvYcCXkXTza3Wk9tfaZRTurf4eqZZ3BqBGJjO0kIXF3PMNwN7vePvvnaRDkf748BCrOG+7l4JKzxii4/juqf5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUxmx65YgjI8ZdgtNdZtplr2cgTzf9OITsMCT2eJyhg1N8UWpD
	LKrJrbwkXy2wxwEwZOcDpUkxDtg/rnFTpVr2/XekFicB9L8KtcfnmqmfBtSfujPPEkJ739L91oA
	F+2aGt9xB8e9l2rstUtAMbmlbEd8aJozU3XPG
X-Gm-Gg: ASbGncs16KuPx3x+v1SPwaRbgZHa+sEurCqIPL1Y409N5LXF1CR586X1pomz1sRbpdS
	9YpjyaJHVz8AY3QRB8OxxZRJfxG29OBuO4rXv5IsueAwLJVInn1O9azkiqbW9ykszrde+4xGU+N
	mLLJtLd0Ppnncy88z26YRrQNqy
X-Google-Smtp-Source: AGHT+IGKBd2X6Idca1/mgKT1zkDMQR9uqrUOqhVDlQt25SdyHg7XmFYSkgsNjaL8rr/gYT1SPEFN3J2argG4vQccbG0=
X-Received: by 2002:a05:6e02:308c:b0:3ce:464a:fd2d with SMTP id
 e9e14a558f8ab-3d03fc66229mr6700015ab.28.1738707816383; Tue, 04 Feb 2025
 14:23:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109075108.7651-1-irogers@google.com>
In-Reply-To: <20250109075108.7651-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 14:23:25 -0800
X-Gm-Features: AWEUYZkFyU4srdNLncxGi-Vj2Ed-9pI1VtzBEz0G0sX0lENqzqw5jjQUz597s0c
Message-ID: <CAP-5=fXL=nS1-m1+gJsYfWfvyn0ouikX3=RvyKdiM7+ewS9-mg@mail.gmail.com>
Subject: Re: [PATCH v1 00/11] Python improvements for a real use of parse_events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, Ze Gao <zegao2021@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Xu Yang <xu.yang_2@nxp.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 11:51=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> While parse_events access in python was added, it wasn't used by any
> python script. In enabling this for the tracepoint.py script a number
> of latent bugs and necessary improvements were discovered.

Ping.

Thanks,
Ian
