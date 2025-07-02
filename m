Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE220311
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 03:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751426907; cv=none; b=tJijnxawiYTTb989Bq2n/bwqL3pxXXsGDXq6zafScarY2sZi9BosvTAh1PpJZuWqvKsQIAoGQ4AwdUzzEeJy7CDNTh5jrRHDEXpV4mgvuUiCiSe3OfqoNOX0T/YnTinoXugKYgZuAlO68R5TcBmZmcnbcElA44xaoLyjG3wEtHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751426907; c=relaxed/simple;
	bh=c/b8jasrr72mWZmS+hC3gTztxEVVxiXILo9hwEFlH6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnnC61R59gwdAUKnxkOYIpgJcDR2d1XGRQD6gTK0JzQv+SVdvkx9D1ZhNAf4FfYjkQ9zH7mf3izlzWRKcZrAnT7fhGy4TyKU72rl2I0sqkKDJzZ3Ndz6nep33j+zNJd04A2M48wieFNwaKBBcPMkhuiAO27gpsHFGAzSpYmlEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5bnpk10; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5bnpk10"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b82f3767so4536824e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 20:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751426904; x=1752031704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=U5bnpk10d5UirK0kT7BLbRPChIJcWfEUifyOXnpKcJvBuWhxP8ejPgXrWlk7N8ida5
         T5XoItToH3z9NkQnRwD83qJykLLOFoT8MUnyCvBL5QD4B3hHep+LbFh4jPh3xiUssJtV
         D5qHp6S8kcj0nxJVB6lREw2z/0G5cbvB+cepo8UJlz4C4lF/aMZAEJGeMQD7TKNUdhTB
         Gu+kK1xBz60bC7yd6CjLZNSTMoHmwnXzO8mkAinSneDeLU9c5nNytH49Zz2736KCf355
         wSlTwvaW2Pt38o52pwbcHgrSbWt3fZyaZvrSUSqkxzNKORs1O7Dwalv7CmyfZZH1s0NY
         aqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751426904; x=1752031704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pCONnCH5T7GCdkrr2svC567N0fS4DbXVH4ChpdByoM=;
        b=fBaq5xIodDk8CJ3EzyT7xT6ByZJ8HUFMNDWbf7GdBkt8rjtnuA88f+53XDrzFVe16V
         JKV2KGLIyMvKv4ZyBdufChY47Bqlw8kjsrMgqRc/R5VGd5eDjNj3VboqoS2KmTuy5uz/
         LuDSG2VhCK437PvSB40ST+oMm+F0Zwr5VI49E9lJW6sPKTf/cTVhwBoMMNVfVonI7vLk
         44U8BvHj2+m1nnSNXjJBY/ItVbESgdFqykVusVNKJntRKmbP/P/M1LDFz1xGXR7qjA7s
         Tjh7hW9yKiooZZ01bxu4FApMTNMF/SSVFMLyomaXPWqOxVAA1C5qmecXuFkze85V4c4S
         zW0A==
X-Forwarded-Encrypted: i=1; AJvYcCXr5Q3kqVU4Q6l7mOjZzHMB59sLhFq/bmjvni0GbvUI4N6iYxAwRpJFaGH87MOBm/Rkd3N08YjzygfnYgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlpGYwyCx/8DVpGasqr4dWLyO4S0tV8s8n3g/MkpAB6TBvbwFZ
	W3Y3AF4IPZR65Bz20FJsGnb0FoBAI2m4i2s9jaowGq2vL+oE0d8zspUS2yKRv+yYQi355g53c0f
	I1IMQdguOyDdR9TwvmIblv+/pt6onspSXWgYSuLs=
X-Gm-Gg: ASbGncsA4VX2IupuzKt6yLHq0baiB+CEx58zkScQBE5GKn/UyHjPlSEsGAxw1PuvigT
	JHGPnZVXl8Td95VytwkI7hxPaPtAC7AT82xouzDFQgSz5HCEOp3T1rLPBtqRTS1JV0bi71WU5E+
	6+OlLLoYWKkjkUeqCfzTw1bMnFSoN14sUbawzOI8M8XfTEpkuHIn3+u4fCqOICMF41TSP1t9Bm
X-Google-Smtp-Source: AGHT+IG7apXbcjCcHGp0kZ92UX+gym5ki6TPagVcyHMy+qG0QMpO2pvfDEUg2Wlq7uVoA/TS/9vt31DS/gX08hJFeHA=
X-Received: by 2002:ac2:4bd3:0:b0:553:5283:980f with SMTP id
 2adb3069b0e04-55628388443mr413354e87.51.1751426903821; Tue, 01 Jul 2025
 20:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250702021440.2594736-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 1 Jul 2025 20:28:12 -0700
X-Gm-Features: Ac12FXwwpzKziB_llADT_ppGncI36EFdCzpapMYlOJvYbZhU5k4G0Rc4-PwHlfs
Message-ID: <CANDhNCqYCpdhYS9afdKeY34Bmw8MXyqKWCSTxOZNLTjYrUaVXg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 7:14=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com>=
 wrote:
>
> In our testing with 6.12 based kernel on a big.LITTLE system, we were
> seeing instances of RT tasks being blocked from running on the LITTLE
> cpus for multiple seconds of time, apparently by the dl_server. This
> far exceeds the default configured 50ms per second runtime.
>
> This is due to the fair dl_server runtime calculation being scaled
> for frequency & capacity of the cpu.
>
> Consider the following case under a Big.LITTLE architecture:
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
> So it will scaled to 238,418 ns.
>
> This smaller "accounted runtime" value is what ends up being
> subtracted against the fair-server's runtime for the current period.
> Thus after 50ms of real time, we've only accounted ~238us against the
> fair servers runtime. This 209:1 ratio in this example means that on
> the smaller cpu the fair server is allowed to continue running,
> blocking RT tasks, for over 10 seconds before it exhausts its supposed
> 50ms of runtime.  And on other hardware configurations it can be even
> worse.
>
> For the fair deadline_server, to prevent realtime tasks from being
> unexpectedly delayed, we really do want to use fixed time, and not
> scaled time for smaller capacity/frequency cpus. So remove the scaling
> from the fair server's accounting to fix this.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Suggested-by: John Stultz <jstultz@google.com>
> Tested-by: John Stultz <jstultz@google.com>

Thanks so much again for the multiple iterations here.

I've re-tested this and it still looks good.

For what its worth:
Acked-by: John Stultz <jstultz@google.com>

Juril/Peter: if/when you take this, could you add a:
Fixes: a110a81c52a9 ("sched/deadline: Deferrable dl server")

It would be great to get this merged and into -stable soon.

thanks
-john
