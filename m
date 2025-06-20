Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772220766E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401464; cv=none; b=kIqW0tBuyUHywdyReYjshaV5FtSGZKUC4hMyNLVEMQPrOTuTqUPYmmCn5DQLWsonBAcuMDDk0spLfskHMBT43BhA0gaJkHh6Hl22AdD1L/Z2v+6pC9j1QsR+GDjj02RR5mLvVrj8cK5BW2WioJxy2UQDOsojm32ESdBJ+IIda8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401464; c=relaxed/simple;
	bh=3s63AwsVyS7wPpA+ZDGY88Fx96+m6en+mxv4pdNkhhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opywMhFliUMH7mKCa0gfuK6Ewf71C4bS1POkesbLU2ntcUHmzDeWfA4JKyu6PoZEEnsb6s/AE4mVl7+2ubpZ7w+AT8WeljxYSIZx+p05meLZT0sF0yxvVvOLaXsusM1Yji0948ktClE8CgiLTICoxnEwsxWef84gycOgOuPdXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilAM+l3c; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilAM+l3c"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso1895055a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750401460; x=1751006260; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TzSd9noJcXTnChwwbuS54IDVOnK86AoZYc5tXmM0Rd4=;
        b=ilAM+l3cB4QHg+EW76aNakP+4pVtnHyOgIQhr5LyvrtR3pu+bZR1qo5CEoyOQc+o7V
         yKBhat3iurgjhXx6rRFev6s3gC4dL+YHz7JuoHYcbEBMjd9DpEeh+rRSf1woCVez1N5h
         NO1uxg1hOU/MOTbuSxgF++mAfiAph7L319j3tAGHg7Uhm++00kyAtaQX4VBlITyvxWGs
         82r2b71G7fQgp732ezPdcNjchgce/SAjnmDJGBOAAZZHve+UvFc83UoVaXQHtX1AAP5h
         IglNGE9c5s9wHwm4B9uO7VwvpXlZZIUAcav/kFgkURqwkyjyChG+qFEc2r1RkoB5SK75
         h8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750401460; x=1751006260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzSd9noJcXTnChwwbuS54IDVOnK86AoZYc5tXmM0Rd4=;
        b=PMJp6SR7zowzlX+iTW9HQZrKXwY0SoFep7RQJQNgNvhqpDQEH0KeWhR7M9TUL+dx/E
         eo85JviFYlkrwQV31gKKWq1wvSjaI8ujENJycAsdAv6hZuZQ4asivWh1Iov0HsHtpRhL
         C6HuwYFY98rIFY/4hKQ32GwSDAjZ0jk4p0hbeZdrd/9ieGzQPmvy9EGsnNN33Qc+58Fp
         f63J5TKVn82wWQWsStjLz7D50yTCIzXZVrT/LT46DrAkarVEQcCgNNqmoGiCaQWX0X6p
         7gOZB+4b7DsRr24oBm3B/351ILKoL4KxXvzpiWEdJHJw7wjqNMv8qJ6E9PtwdvzSgLNv
         OvlA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yy2xRrKNCuh8x5WJx6R3a6KMsh4oPBpgvwLoxgd8jGfDueePzr8MKSrjps87AqPCwP5wBLyyk5FiSwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU/m1BFjQMKDhwwdrxs1KJ2+voE8g+RGavrQiA4U0lscZyssC+
	HneXUqjYcdWWFq4cEp5Ghir5tfkLMeJVQ/LjWg53XjAjwgM3hmyTaoSphYkEzlfBQzdzIqCtwWt
	fB9owO6ZSp4IxYv7yDkRk8REN+5otrw/ExZNnSotvmw==
X-Gm-Gg: ASbGncsp1ntpveAANCtfMxlenoTnBFkl2FCHT4/mYxdkjhJIep14hauYWHQlMs7x2yI
	fFWN2kQ8ZTbNPUNTLMwS94ebBNPDVjlROosgpTtqVrCRyP8A+c48vTobLwiT/EwxjlpePcM26qA
	jCcIMIULGNV8DAo3RAQ5QLTeEqdh+esCdpSnWSz4w/vP2cvSl1Uuk+LdhDOJ34PFlgpiKf1lvS
X-Google-Smtp-Source: AGHT+IH/b8pr5Xw6Z986KuG0mGsqQTe81JwOAkD7HanMNT4jwSH+4I+1DLXOQWNnKp9CJwN4Rrj6FNYf1/AlADruo/w=
X-Received: by 2002:a17:907:c895:b0:ad2:1a63:3ba4 with SMTP id
 a640c23a62f3a-ae057b89b76mr147380366b.37.1750401460563; Thu, 19 Jun 2025
 23:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619031942.25474-1-shijie@os.amperecomputing.com>
 <CAKfTPtBUJa4A2V3XR8EwYVPxiY=ENZr1=Jg5R3E75r5XnrnRPg@mail.gmail.com> <cf675887-49e0-45a9-9008-33c0c6f1edf1@amperemail.onmicrosoft.com>
In-Reply-To: <cf675887-49e0-45a9-9008-33c0c6f1edf1@amperemail.onmicrosoft.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 20 Jun 2025 08:37:29 +0200
X-Gm-Features: AX0GCFv5cKDtlqU5Kf8fNrmxSdLPM59nPPUtgAURXuK4Pr-K-DXpzJfwFZsYmuM
Message-ID: <CAKfTPtCg7vLxQbTjeRodnbhj3sCo_zThcvS4cWBe-q2tgXi+cg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: set the se->vlag strictly following the paper
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, mingo@redhat.com, peterz@infradead.org, 
	patches@amperecomputing.com, cl@linux.com, yang@os.amperecomputing.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 05:01, Shijie Huang
<shijie@amperemail.onmicrosoft.com> wrote:
>
>
> On 2025/6/19 21:53, Vincent Guittot wrote:
> > On Thu, 19 Jun 2025 at 05:20, Huang Shijie
> > <shijie@os.amperecomputing.com> wrote:
> >>  From the paper, the lag should follow the limit:
> >>       -r_max < lag < max(r_max, q)
> >>
> >> But current code makes the lag follow the limit:
> >>       -max(r_max, q) < lag < max(r_max, q)
> >>
> >> This patch introduces limit_hi/limit_lo/r_max, and
> >> make the lag follow the paper strictly.
> > We don't strictly follow the paper. Typically, paper assumes that a
> > task will not run more than its slice r before deciding which task is
> > the next to run. But this is not our case as we must wait for a sched
> > event like the tick before picking next  task which can be longer than
> > the slice r
> >
> > Side note, we don't have a fix definition of the quantum q which is
> > something between 0 and a tick (and even more currently with run to
> > parity) as we wait for the next the tick to pick another task
> >
> > This means that a task can run a full tick period even if its slice is
> > shorter than the tick period
>
> Thanks for the explanations.
>
> But if we enable the HRTICK, the task will run to match its slice.

Yes, but I'm curious to see the impact of irq time accounting on this
as the time will not be fully accounted as the slice

>
>
> Thanks
>
> Huang Shijie
>
