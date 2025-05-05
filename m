Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20825C80D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459792; cv=none; b=kpdXCzCoULpL2iHjvkCjcaWWBxXIhIKBi9MMU3Hprbjmj9sjtgodTVUZ4Ef1yP60zHjoJ+U6tTxfX91L7T55NX38azPMRjOEp9Qt15Vn/rLpp03K/HbA3pcoskEH8YV4belBblpzvbvtSa8yVvKeANLITSPRV7Ar/rv/3ilAg5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459792; c=relaxed/simple;
	bh=1hZxccIbWniJZ+0x/jSm8xcr1oxitOmB1wV1lj698qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMKRdEX38xo53Vn64GaQcSoeGkZ3oMG5mxWOqWD+Mmx2mbGHHNF2OlRXZf7HxzssiZ760yTeg11gYbkc4vp0PHxd3+sCqcauqB+8wmyMOznT2+0lHK3qrmBvvK5pUZsnm9Fzld9JhL5+Eclh264lO7MLog3FLACT7JwPT/Wj5q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oHsAZVYn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oHsAZVYn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22423adf751so53523125ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746459787; x=1747064587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXTYmNfnp3L8OKmlj5S0ckFXV6E7LYKVxcLkR0qYEOA=;
        b=oHsAZVYn/zLnji7tX2YmwFySDJ8h6/ITcsF6DhF2Ftn1pMO0rsYnh4lgL3LPJouZax
         9XRmG9ufBvYkS1IO/4I03e1qIXiSzO7uN0WH/uDjfREPWv5UMF+4KaWckecj+5ttICFw
         Lu0/GOudp94ptjbOt2AZvnThqo6jWnxEtO6Ro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746459787; x=1747064587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXTYmNfnp3L8OKmlj5S0ckFXV6E7LYKVxcLkR0qYEOA=;
        b=GczFLEFYx/Mg9TnIfWvYrNXb8CWqitaJOQ0b1LfFaWJ+OJ1c5TfGwSAmwiMuqn3/46
         qFYQEv4N9DW7DV6oqTfKZQk7GUwfLWJBPBeLzF9rTfqZkYmRjYIQQQUf3499e4eU9xpV
         WaFtK3WRyRYNuSYKtnxxe+sEZ3QQSfwhSlpZuT9eb4imaAsNMaR54+VFVWbtA72Fj77Q
         MVtgr+Jx0uHKwEOvG9D0SjMy8/kHFEQPmzWw9kM8KmtRevrZX+dDn01h78gYTdoHO9w4
         doJq/bWAspoC9FVF54tm61Bfljq2M3Th9zBojEAgVqAeY4eUN18YcnXy1ntRGbyK/AHV
         mehA==
X-Gm-Message-State: AOJu0YwlpLELfozsu/WrmgF2g5IaHzQOpTQAdFjv/UhV4fvOB/2Avc0f
	EjDqNhZhq87OV0xpibJuaTvj4lEX17g2AEeaJCYaibNGh9GFVLoIfneXXFluaXmHTI3+Y5gD2G0
	=
X-Gm-Gg: ASbGncuIlcUSfHQf1ZtEju0x/tcbNUlwwCQyRelrwrNLis+4ST77ryuIFcPhlHrWhUU
	HJ6kEjnw2IHqrpzmh7cDnHJhafX4wvXedLv03masWVRAzPd3g33jssSfFfDEF5+xwXVxs8XRa3d
	dmsRBPbeOqc8FKOWKbuXL/5jbenaQJgkxI5gCTINBRRh1IJ+h2bZ6bn8/ifqRDqLAy6/pjyItCC
	1i7vP+8x8DcZFHWULCweNpG9ebIipyTmgAcQzaRFfXayBA8ADqRiLdS75eJ8iRbVLwlH44Wli6k
	Qu21GvEUl/VavaA0nkfbe4nPd/u5rWcr7eTODlPI2bZtO2wsT1yxl8ul312StLzCoofQh4E4Pun
	R/uQrBjeY
X-Google-Smtp-Source: AGHT+IFwxFQlfzCtimlZJcfkL96olikSz5kKeAd5LyyZCc2KDzX+2v79JjXg6w+8eIOda2qaHTUUkg==
X-Received: by 2002:a17:902:f64a:b0:224:b60:3cd3 with SMTP id d9443c01a7336-22e102ecf83mr220509765ad.19.1746459787623;
        Mon, 05 May 2025 08:43:07 -0700 (PDT)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com. [209.85.215.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e98desm56639145ad.55.2025.05.05.08.43.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:43:04 -0700 (PDT)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so3446742a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 08:43:04 -0700 (PDT)
X-Received: by 2002:a17:90b:520f:b0:2fe:9e6c:add9 with SMTP id
 98e67ed59e1d1-30a4e5c5d2dmr22184245a91.18.1746459784032; Mon, 05 May 2025
 08:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502205147.283272733@goodmis.org> <20250502205348.643055437@goodmis.org>
In-Reply-To: <20250502205348.643055437@goodmis.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 May 2025 08:42:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEnL7ztSfqAHS1Y=VwwYSyT=rfE7ZiUPLnDnMQNTcPjw@mail.gmail.com>
X-Gm-Features: ATxdqUEbLIdnfk4KhX4VeDp15dHAX0mPiplezQT4DJTJ5-tAGVeLSoklxA5bYvU
Message-ID: <CAD=FV=UEnL7ztSfqAHS1Y=VwwYSyT=rfE7ZiUPLnDnMQNTcPjw@mail.gmail.com>
Subject: Re: [PATCH 05/12] tracing: kdb: Use tracer_tracing_on/off() instead
 of setting per CPU disabled
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 1:53=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> From: Steven Rostedt <rostedt@goodmis.org>
>
> The per CPU "disabled" value was the original way to disable tracing when
> the tracing subsystem was first created. Today, the ring buffer
> infrastructure has its own way to disable tracing. In fact, things have
> changed so much since 2008 that many things ignore the disable flag.
>
> The kdb_ftdump() function iterates over all the current tracing CPUs and
> increments the "disabled" counter before doing the dump, and decrements i=
t
> afterward.
>
> As the disabled flag can be ignored, doing this today is not reliable.
> Instead, simply call tracer_tracing_off() and then tracer_tracing_on() to
> disable and then enabled the entire ring buffer in one go!
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  kernel/trace/trace_kdb.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
> index 1e72d20b3c2f..b5cf3fdde8cb 100644
> --- a/kernel/trace/trace_kdb.c
> +++ b/kernel/trace/trace_kdb.c
> @@ -120,9 +120,7 @@ static int kdb_ftdump(int argc, const char **argv)
>         trace_init_global_iter(&iter);
>         iter.buffer_iter =3D buffer_iter;
>
> -       for_each_tracing_cpu(cpu) {
> -               atomic_inc(&per_cpu_ptr(iter.array_buffer->data, cpu)->di=
sabled);
> -       }
> +       tracer_tracing_off(iter.tr);
>
>         /* A negative skip_entries means skip all but the last entries */
>         if (skip_entries < 0) {
> @@ -135,9 +133,7 @@ static int kdb_ftdump(int argc, const char **argv)
>
>         ftrace_dump_buf(skip_entries, cpu_file);
>
> -       for_each_tracing_cpu(cpu) {
> -               atomic_dec(&per_cpu_ptr(iter.array_buffer->data, cpu)->di=
sabled);
> -       }
> +       tracer_tracing_on(iter.tr);

This new change seems less safe than the old one. Previously you'd
always increment by one at the start of the function and decrement by
one at the end. Now at the start of the function you'll set
"buffer_disabled" to 1 and at the end you'll set it to 0. If
"buffer_disabled" was already 1 at the start of the function your new
sequence will end up having the side effect of changing it to 0.

-Doug
