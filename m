Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67C2F32
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749868574; cv=none; b=iprycrtxqtXo/yajv+9WDhuOaQvtIQZ+JWKr05giQMnBE/ArJtenU6Dos8tUL/QNs2ZJ+MMqAol/UJVxOTuZ4nwecathEAp+hyK6QlPMMQI4Trsoa+qIa7CxFGXK5P1v4VCAazlmA5+lUaEv9Y+6iB6ErmpO3wC0lp30P0IhxdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749868574; c=relaxed/simple;
	bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhqTy6V5sWnVPt9k9YYDMh32udMvx4HhLwYVFOopNsPvJh2oDVdBuf9vx5AxC7zhf5mRG+tc/pYpD7H7cSPUgjPxfbN0gtSLwxOBymVQsGu0PcRzl29qalTdV4u4j82ThN2YkRsy0GpSoO6DGlwyINTP6kjlvy18huWqLzL1o9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sX89axQg; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sX89axQg"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553543ddfc7so2793572e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749868570; x=1750473370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=sX89axQgrXndfTmWgIA4/zYPmIc/6CBvEEWvXLstvxp9m/Nja4LrywYzyjXHB2wjEq
         2YbaxO83g9XX5eHABWPfBL1CAiOCOnJRFpDaqlZEhH6h2mO9CHMig9npSJPo/vTla+5o
         ChT3dMe69Va7cRz53ZOICYSbvhdGCoAmpNqcwkMHEB9VIc99KPyJ40J61NSvVJdczr44
         kRmtBmX3sJa5SwaStebFGVlBylOnTqsYPcE46kh4JgEWsVery+uk7GfvOLiBHEafm4uH
         v1O6ojkEzCpMW5csZkVbSsz6uJFIO4pV8QCCY+Ga3bg2ZUGZkByo9j9/aO25KtABGpzz
         AO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749868570; x=1750473370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/4zSIPw19HlLUie6b0kgjQJHS7vidQhIk3Cd96brfSo=;
        b=OiXY06ZZYagGdW1MMcAHPE5B1/nj3zBQmjsNCnoam4BTWWkBpWUGnuVda/+RhagmGZ
         yk3SgZQhLCUMnYVb2Xlut7QooIUpsS58Eo5E38BkfnQawDA4jnVJPaPUbV8XWWXdNRQ9
         Db11PMIyroTzT4vXgcXMAIVVlpezz4vNqFaXK5vt3dcmJmfUQf3kX7xYsntXDgvj0Cyu
         uJy9eRF6e2e1aN2u/WFuUBzBdwJ+xn2K1tFiBy+xVn9Ru8zIVG0SQe8TMCeDU++a/PKz
         LYdtvpJNALsrXFpP2fwMCxxhYPMnsjfvpt8lLH6T1MBLHCK5S91D76MZ9/d9xxC9sm0T
         L04g==
X-Forwarded-Encrypted: i=1; AJvYcCVuLT8zZLseCE94Bgc2c+XgyE5mpp7OQdIKD+8Z6WJCa/EBlyt3yZz9PkpTVCgAqz4AMWwk4jDQ25qFzf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YziwSg+CvT0MVoZnBIfjbtkHNKobJMu9bk0McIQZD8xUpuSbu7b
	FmXHF28+Zd7Qss9oSPs4Wgy/3eBTkIOUr/VYtnNAElxTumhLaix3WxVKS/CH3eCYA0xwEiF+y9W
	8eGR50LOkA4bPQT/jsAono3IkT3bSsPV3Q3t8Bf8=
X-Gm-Gg: ASbGnct3HhWf1JwWRFYAXMcT1Sj+OX72CfQz21IQj/lO4DRFSRmhlJtXPGr4h+LRsq3
	Y/OrcxC1BQSjbJp2DIPzqxuNBP88tKeRn7nr+ziwMHhUB47HD20DrvoBe00eZQq38u7psMWrLl8
	jR/8QnbJFibL+cIDR3bDqJxRLbI7iM8sM8mNItI0M+8w1IyA8er8hXJUFEcHPJ5C0aMfqAJU8=
X-Google-Smtp-Source: AGHT+IFxdd/eeA/jqO+ioIaQwggzyaJAKSp2npacWe2qm5ZmqZbGMbcXq9pAMDlbKaGfZHdE5uH6xTWQR5MyLSGGuXg=
X-Received: by 2002:a05:6512:3f12:b0:553:ae47:6856 with SMTP id
 2adb3069b0e04-553b6e7d3b4mr334265e87.10.1749868570161; Fri, 13 Jun 2025
 19:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614020524.631521-1-kuyo.chang@mediatek.com>
In-Reply-To: <20250614020524.631521-1-kuyo.chang@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 13 Jun 2025 19:35:58 -0700
X-Gm-Features: AX0GCFtDliQH_6brlg-dmQaZIRQh31WrUqfBwRgyCd0Z_gzAKUDVN86BzaEZjjk
Message-ID: <CANDhNCpoKUbQU590m-vBKhk96ZCKDsYWOHwP_LL2W84SPOnXww@mail.gmail.com>
Subject: Re: [PATCH 1/1] sched/deadline: Fix fair_server runtime calculation formula
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

On Fri, Jun 13, 2025 at 7:05=E2=80=AFPM Kuyo Chang <kuyo.chang@mediatek.com=
> wrote:
> From: kuyo chang <kuyo.chang@mediatek.com>
>
> [Symptom]
> The calculation formula for fair_server runtime is based on
> Frequency/CPU scale-invariance.
> This will cause excessive RT latency (expect absolute time).
>
> [Analysis]
> Consider the following case under a Big.LITTLE architecture:
>
> Assume the runtime is : 50,000,000 ns, and FIE/CIE as below
> FIE: 100
> CIE:50
> First by FIE, the runtime is scaled to 50,000,000 * 100 >> 10 =3D 4,882,8=
12
> Then by CIE, it is further scaled to 4,882,812 * 50 >> 10 =3D 238,418.
>
> So it will scaled to 238,418 ns.
>
> [Solution]
> The runtime for fair_server should be absolute time
> asis RT bandwidth control.
> Fix the runtime calculation formula for the fair_server.
>
> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>

While I've not quite gotten my head around the details in the
dl_server code, I've been able to reproduce the problem described here
with a 6.12 based kernel.

Running cyclictest (with arguments "-t -a -p99 -m") , and a randomized
input test on an Android device, its pretty easy to trip 100ms to
*multi-second* delays of the RT prio 99 threads.

Perfetto image:
https://github.com/johnstultz-work/misc/blob/main/images/2025-06-13_cyclict=
est-dl-server-latency.png

Link to the actual trace:
https://ui.perfetto.dev/#!/?s=3D9bbb9e539ac2bbbfe3cfa954409134662a9f624a

Using this patch, so far in my testing with the same workload, the max
cyclictest latencies stick around the single digit ms range.

The part that is a little confusing to me, is that prior to the long
stall, it doesn't appear that RT tasks are actually starving
SCHED_NORMAL tasks, so I'm conceptually surprised to see the dl_server
boosting the normal tasks, especially for so long, but I admittedly
haven't looked in detail at the code and have been going off my
understanding of how it was supposed to replace rt-throttling, so I
may be missing a subtlety.

thanks
-john
