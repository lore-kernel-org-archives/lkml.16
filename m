Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422522253B0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717596; cv=none; b=tv3kNry6g32c8SR1no8RvJWvZ9rjQtQwYK4Xvbs8ENsPigjjKke09fuQ4cJrnq0E7jpQaSGKi1NFv42OtzOfiIAOujy0UiJ1vDBozdDl+tJ0bK8oX+j2DAvQ4TeJqLfA/KVDvwZiK1pEAcdh15s/12hBjw3DHxK8MTSqSPWHE90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717596; c=relaxed/simple;
	bh=xNeLTC3/vFEjHgWEO3ptTwVEQ+fv9CQyFaewi0CuOv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=begAsy9fzoEQao/ZfyrAfxntGodlE8eREGBvUA4qO+K4cg5a4bcf//Z+IOphSnGGsXKHWpWB5ERU9qN2mIo/ZQ/Wzv6TjiMFExArJiMnA24+f+J8ihnSIcnB/1lfOpm0hFRyZ6EDzWYsJsIaIgtq0IT5cJynthyfjCZOZQ4TKro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2S5YI6K; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2S5YI6K"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ddc10f09easo45765ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750717594; x=1751322394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2g63pirFbFSmTBdwgMEBjEZptK95ioxrwcei+ssJCFY=;
        b=J2S5YI6Ku49LaWsxkysHefY3Gn0fxQjoQ1HNbK0kRKOsZfE2ptQ3v+Cx8iFRGJeehe
         qlx9jfHPXkKv5xkio7xuMjCfzyqS4cI3Ug1LonB/RLOmgANGs3HehDqTEgNz8jG2pzkH
         FRZ5Mff+MEx0TucRksmgPFhXvi8Y0WbQRKtfQYYJ8EDJzUqUpVD4Jm9rL219SmJWRjxQ
         0dhm0xRmo2ICvUjzcOAXK42ly0vHRHgmYPGhChQtP1TVzh1wzXnsYiYbCHn3UULIgfIk
         xIzp1QMmn0b0C9cVnvGqO7sOT6yGwJvSkEE4+AMiuV8CYyjFi7s8lZemAhbYiggWjy57
         rlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717594; x=1751322394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2g63pirFbFSmTBdwgMEBjEZptK95ioxrwcei+ssJCFY=;
        b=tTJpsQN6fIp3J7u4M/aQ4OLiEJBYYdeVrXMZ6X0qDm3AbH3qK9m5HY8cv95KcudWRW
         gPadLWtB5iLb1uwg91AlS4OooHZTCzyhLpPX+Ymo7PbwvcfeaQD/rl65jjFE/q4fWSwf
         lw3bgAlq0kMG317HzFmwJb+qDXiOBFskecj4jDo9ibC8n5DsjGj9G6mpDeOxFGswg7i3
         H5dGcCxAwqmZ4ddGOnoQFIldMVL6wWxFkk4wKYCvQbYGhlBCrR+hjyYmeQBuIOkUqc0h
         mZQmQthT65jyoCMND8zoTy3pxigg2mFddkI3phf/9VIBejyhUMbsmEw5JOZ/aB+PhNoe
         2D2w==
X-Forwarded-Encrypted: i=1; AJvYcCXPNgcIeYY1V9DWqzdgcfLuSIvJCgsX5p8VKgMuAuMCa1cH8r/+goA98/Q7hIxRP8gc48Quhlj/2VjnEB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0+ckbnq0R3MpPsNnUU7bWlEP8UZ3ZgLId1PqtLQF15B5W/vh
	bBIe0nyEzYzcecXQzyPVRW2XwrUcBZuC6KoMJBahtX/pYpZD1TtSWv57vgsv78lDM7JVKF4UAZN
	UBpB+PEk4q57aD0NKxlduPtYS3LBlbY96kshjo8JX
X-Gm-Gg: ASbGncu5NTGRp6nf+d4qrsfFnUyuwg/WGoFqVzghUvz7X9YPGvw/cuooAKIaKfdQulm
	koN2l4RuV2rvaRoKsme1CYYfn11yDsU2SMVGPNchRqVRvJzh+wwfiWrnaiDhMXV4TfCCRwgee6W
	brsJd5bG53fDJeBINdN/waTVE9dm5kGHyg5CayQjN8O5OYAl5Cp6EfOecmeYUr3ik/MmZ/7H0t
X-Google-Smtp-Source: AGHT+IGMcaEmAHBaUWIflmFryit/RZswlMNpVQKzvPg8TKCyZkCgrIutE6ln2v3QEQqxlYfYLr2nOks4w3TCO9MrVZk=
X-Received: by 2002:a05:6e02:1544:b0:3dd:a562:ce54 with SMTP id
 e9e14a558f8ab-3df2a569ff8mr209175ab.15.1750717594065; Mon, 23 Jun 2025
 15:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614004108.1650988-1-irogers@google.com> <20250614004108.1650988-3-irogers@google.com>
 <CAH0uvojjfOcoZmxPL+bG5NEid8xcAVth7UxOUc=aYjgF5nqs2A@mail.gmail.com>
 <aFBF1ejZQBBvX7F4@x1> <aFHeY_-hVNKtXPAD@x1> <CAP-5=fWXQBdg8Uq1hFgRPC4z4vQAvUuT6TnUkPHSBfdGPNaYwg@mail.gmail.com>
 <aFHi2FUDZy_cEA5A@x1>
In-Reply-To: <aFHi2FUDZy_cEA5A@x1>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jun 2025 15:26:22 -0700
X-Gm-Features: AX0GCFsJl1V6SmtpGR-Xq9huuZQRBov8XhEK5Pczr6a2e8qDUAx9ANIj0zleZD8
Message-ID: <CAP-5=fXXOEH1Hf=je9EgmKgSKEiSSs+9abUo0vUoS3_7dp0Uow@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] perf trace: Add missed freeing of ordered events
 and thread
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Howard Chu <howardchu95@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Michael Petlan <mpetlan@redhat.com>, Andi Kleen <ak@linux.intel.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:49=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Tue, Jun 17, 2025 at 02:32:37PM -0700, Ian Rogers wrote:
> > On Tue, Jun 17, 2025 at 2:30=E2=80=AFPM Arnaldo Carvalho de Melo <acme@=
kernel.org> wrote:
> > > On Mon, Jun 16, 2025 at 01:27:04PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > > On Fri, Jun 13, 2025 at 5:41=E2=80=AFPM Ian Rogers <irogers@googl=
e.com> wrote:
> > > > > > Caught by leak sanitizer running "perf trace BTF general tests"=
.
>
> > > > > > Signed-off-by: Ian Rogers <irogers@google.com>
>
> > > > > Acked-by: Howard Chu <howardchu95@gmail.com>
>
> > > > Small enough, applied to perf-tools.
>
> > > root@number:~# perf trace -e *sleep ls
> > > anaconda-ks.cfg  bin  bla  commands  dtel  firefly  logind.conf  perf=
-install.txt  python
> > > perf: Segmentation fault
> > > Obtained 11 stack frames.
> > > perf() [0x5c595e]
> > > perf() [0x5c59f9]
> > > /lib64/libc.so.6(+0x19c30) [0x7fd43ce27c30]
> > > perf() [0x5dc497]
> > > perf() [0x492d54]
> > > perf() [0x49860e]
> > > perf() [0x49890e]
> > > perf() [0x413413]
> > > /lib64/libc.so.6(+0x35f5) [0x7fd43ce115f5]
> > > /lib64/libc.so.6(__libc_start_main+0x88) [0x7fd43ce116a8]
> > > perf() [0x413a45]
> > > Segmentation fault (core dumped)
> > > root@number:~#
>
> > Thanks, I'll take a look to see if I can spot what's broken. Seeing
> > this stack trace makes me remember we haven't landed:
> > https://lore.kernel.org/lkml/20250611221521.722045-1-irogers@google.com=
/
>
> Yeah, I just pushed perf-tools to soak in linux-next/pending-fixes for a
> few days and will switch to processing patches for perf-tools-next, will
> try and pick that one, I also noticed that the backtrace wasn't
> symbolized, thus your patch wasn't there :-\

I sent out a fix for this issue in v2:
https://lore.kernel.org/lkml/20250617223356.2752099-3-irogers@google.com/
Patches 1 and 2 I see are in the v6.16 fixes PR:
https://lore.kernel.org/lkml/20250620155415.88215-1-acme@kernel.org/

Thanks,
Ian

> - Arnaldo
