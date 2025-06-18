Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5821C167
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283119; cv=none; b=LSCav8WWWxX7sQAZ2Aa+Q2haHnNAw2p4Plm9Q/FNPkOOdRx/xUBVViaYvXwA5xq3bqoIH90nD8zGFCJ+1OxtxWmbuIfPHqytLCD/+GFb2NfZJbwKNrNDruBwxBTwktb6vaneS6tV3e9KRll4k6tl2XmYUL1RFljpkX9baR4H5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283119; c=relaxed/simple;
	bh=RMRZG33HTo8u+AhGE9DgPixZLnJ2CcDb8ALrtofDhoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gPgzV0OKR9PEvrGgsqp6DtHOwYRlkbTsc5+BDP2YAqlc9vtehTMqVENeXif/VJtztkPRyLOvbCEAteixnmT5+ZLOMq+t+EyWiOOIs9P99puNXOfMHzm8dLVjHk3XwDMxZnxMS+d+lpWjVxvr+mk0js5zqhNnTUdRi2BPVfOz+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksSF4hUI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksSF4hUI"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54e98f73850so65139e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750283115; x=1750887915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmNihe7PTzgHY5aMiXa0EoOwpOW0xdgqzA0ywQIsBWs=;
        b=ksSF4hUIhP76Fzg++Buvl7wekc875z80XT/rHMrP0PUjqab70hNLHbFDI5L1hNNSBZ
         piPeSVJmMeKFfu2DSBDnwoN5Is0SFsZbmUaoiYwfn9jPycVcXAFWUZLuvo6o0C0xU+5K
         M4LOhjQDxOQIGD2JFcUiHEX/VRKUWDwCN1ifZ1XxjYrdThof+VCGf19kf+FjkaP2i9nT
         Jipy4F+q9SwrraGjZlIC9H8k3poZ852e2JDp85M5uX0iDuy4hEDOcTTNcghIFXcB/pGB
         efHEhYAdGWeRzoTZKClq/2+TizBkrp9OtTQqcxwoPaJtWTmV4ZfUpYhypVcG01tMLoNk
         Mu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750283115; x=1750887915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmNihe7PTzgHY5aMiXa0EoOwpOW0xdgqzA0ywQIsBWs=;
        b=PeEoagxg8QwgWOct0AHueXbc++my/8QFQg25tIVGpKt7PDaiSUuMXS+iXsQoFMM9CZ
         yx9olVAhlBcfJy+7DtRH4lQuqDXYmu/NCVHhw0AJMk/rhNKqYzMPHsZXKoZMGT3eYM0G
         DHkGTv/ucW8SlXgK7GK7KxJxYbwaQuGtiWB0NuTUmiD7MuLNmxqxvs9KHDuB09F+QD4J
         94aYqYuMH2lTE4CcD6ellyg/5x9zfXCJyc+489aGXfbGJcmkwGus5pMKvIBaykwPc5kg
         LXNlFEa7QK8mhu4X9vVR4FxZOkaYnd6lQ8s+NCM4rjW1XbgCNXr7PRTslJtdaIU/6D3F
         D9KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/qFWCgbiWp8waaL3t2kRtzs1mzgWsYFEFkG0WMY1so1kIHxtwkf8bTqzizUksIPF+RklVMFfAZVbgtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5j8EU1qqPdQaAVVGMMmDaptHh7DMIwc4E9aTzR/nPl9r55VFk
	neaUEEOFv1uwCUtlDrkGHJEg3hxhf0vgRdsDJRhE9YvgkauT3iASBbmvLIwzk9P7XSxfeXAmKj0
	z8pCzgi38orMLmkof9wbXxDvfK18kEdQQNzz9AL0=
X-Gm-Gg: ASbGncvOE8N9rv1rsTTXLOIiinyy+G2qMDcYz06FAPeCn+CIDKvG/TQ5n1WpXCRt3Qn
	w0qFUDZdYBxXu7tDIknrWDUGxersvIJaGvFfsVPfaOb65fjgSnKCtWk2WS2GdCqIYSLNnk3zKNq
	qAxMqGVe6ouEtnUwKWZ1QenkBnKt1oIteEFsB1k1QWj3/DZhRqnVBCZuatHO3rklEM70Vg7Jd7/
	O5+lJXl7KM=
X-Google-Smtp-Source: AGHT+IGRdPWvQ3bVP/uq5rZZPKY3AdMDW1I/LzLahEs6dluATjog/cp3WTI9a5x6a4bbS7Knu1afIVea+V+1AgDHScw=
X-Received: by 2002:a05:6512:b97:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-553b6f25d30mr5275016e87.42.1750283114922; Wed, 18 Jun 2025
 14:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250617155355.1479777-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 18 Jun 2025 14:45:03 -0700
X-Gm-Features: AX0GCFsOSiqOdRp1Co0Xlnr48njlbsSSxatT1GBZqp64HQBE2esynPFEN6b-XQ0
Message-ID: <CANDhNCoMUrZppodAa0bAdds=M3S7u3VqAmiR_Qd-ow=kxDD9=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] sched/deadline: Fix dl_server runtime calculation formula
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"Team, Android" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 8:54=E2=80=AFAM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
>
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for dl_server runtime is based on
> Frequency/capacity scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is: 50,000,000 ns, and Frequency/capacity
> scale-invariance defined as below:
>
> Frequency scale-invariance: 100
> Capacity scale-invariance: 50
> First by Frequency scale-invariance,
> the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,812
> Then by capacity scale-invariance,
> it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for dl_server should be fixed time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the dl_server.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
>
> v1: https://lore.kernel.org/all/20250614020524.631521-1-kuyo.chang@mediat=
ek.com/
>

Coding nits aside, I put together a quick test that affines to a
single cpu a SCHED_NORMAL and SCHED_FIFO spinner task to illustrate
the issue.

You can quickly see the requested 50ms/sec dl_sever runtime on the big
cpu, ends up being scaled out to 323ms/sec, blocking RT tasks on that
little cpu for quite awhile.
  https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_illus=
tration-of-problem-dl-server-scaling.png

The wild thing with the example illustration of the issue above is
that since my test uses cpu spinners, the cpufreq quickly maxes out.
So it's only really considering the capacity scaling between the big
(cpu 7) and little (cpu 0) cpus at their top frequency.

When I capped the cpu 0 max frequency to the lowest available, without
the patch the behavior is crazy:
  https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_dl-se=
rver-scaling-with-cpufreq-lowered.png

Though the image alone maybe isn't as clear, in that case we see the
RT task once it runs ~650ms, the dl_server kicks in and blocks it and
any other RT task from running for over *10 minutes*!

And with the fix to avoid scaling the fair_server, the results looks
much more sane:
https://github.com/johnstultz-work/misc/blob/main/images/2025-06-18_with-pa=
tch-to-not-scale-dl-server-fixed.png

So I'm very happy to add:
  Tested-by: John Stultz <jstultz@google.com>

And hope this gets upstream (and -stable) in some form quickly.

Thanks so much to Kuyo and others on his team for reporting and
root-causing this issue!

thanks
-john
