Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8DF195811
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510940; cv=none; b=nHIzBm2zVWhMOH5F7d8G3xYo4plwi1t5vqrPlb2lblSnc847T04/2ZC0Vo6/FwARgZNNqWEETRAWXKQGgbejsnBbZakdwOqF+LoEoU5MwTtBHtHO2mDOAGh++DYEcsIWT9aNn5QR9YWUvlotd1PDjVmEpxwhBDc6pkv3gLYzsWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510940; c=relaxed/simple;
	bh=bbg8aE81iUeNiDZF1MGzc6bTtql/UMVFOFLOhAydfjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH3PsEzwdRl87afP8oviop6R7AsEd4Flv5dRd2V7kIeTiFf5BeTGP4pQ8L5EonVA3HtZIC8QcfyOTTxD6dTWvXdyxp9VzAFT7PvBHKfhes/hfv9UwCGRPxCBWmBGumXjxkEVxWDmdS5FdhiVAGyoaYOrpG7MRSzhaRjp17CxWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNcXxzYh; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNcXxzYh"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c416cdcc0so51606541fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746510936; x=1747115736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YN6ZkVN+p85UYTJ1uEVJUwHOFyEfoNRoe5b4WgP6N7w=;
        b=SNcXxzYhs5/AcE+tfJOnkbGu3njiJnF5+O6Jjk7di6dV4i/2g7JNAILrVMYnyx23FP
         Bn6KtMvrlHNC1SeFB83OknGdT8gADHZSpnOczHw2ylwwca30xAjpcjM3o9dnhcTgMFiF
         HC0dL6zO68WmGGLM70RiGYqNR7DOQTk0oGKTm/dVa4Je6wu8yRS0LDgqruBRM5+f38Nk
         cJoR9R5+xrQnx3yPSI8FEnhsaXOXnZM5t7iCugOYPQRZ2Ck97UZZJNuBRHnJv7v70e/b
         e9Bo2j5R/kj9YY4GeMeMI7TlhuoozUWXq2S6Xp38IEj67tiSrAj2l0AQJI/gYdZTm+4o
         y9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510936; x=1747115736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YN6ZkVN+p85UYTJ1uEVJUwHOFyEfoNRoe5b4WgP6N7w=;
        b=cnRGcF+2ePbXE14SWis33rV6G/doxVSoY6RDW2NXes81Enwd7nXAm/8a10UzZiq51C
         Gz4yOuToeSGQ16b7mAi1CrIH2uHJFuwuXIy7Kcd6kXPJ1oOOsnz47BJ98eKSBaiBzqqA
         zJy5zY7ziOSfphrkzVQ1VXxMANG1ECU/2A7zHYrbpXHPUK1fFazVfN0SI5SlXNJUNM9o
         vHZV98ptQchdZeX1SQlrycWA+iXa/VAu36M/QHnWCH1fGachetfg24dlA7no1LrID6SN
         E5jBxKY0O4pPFACJRqhmqdpgBUnYsopwbVi02Uh5rY6pI6lp+4Rkqlir1QmND7dRJq0p
         koeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1HE5F7dKC+A/rbP00RJvvp2aq6mNBjmtwBnqhxJgalUgIv1AIacuOkqgCMSyf86viV64/Mk8AFbVt9Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXd3lmVbgVwXh8CAlUWpQB7ydmJvHzPuuznoOYUPVkNIYHXCj
	VlHiUBvLkOggJ2+cfPHnrTTyVkAXdxXOR3vpoh3fvy3aDxWexUKxMYrd205PXjJQo16wlieXZTE
	//jFBxabRZKiP20ruKzQCB0zKfruJs8iUQBEc
X-Gm-Gg: ASbGncuvLzUP/QaqFG3P6Sfe5Kl2yCD48dsVkcAddEk8QuKrPLv9vsmM0v7bpmANfBr
	dDa7E9egTqOEA3oVDghde3CUaDBFabC2K4IBKWz5hsqIbSB0ZyRymLD2obm2R+qQSZH6VnFG4XW
	7LdbUyWMcaajVEIZEvgkYcA9/7l83nQI3BwAwaWTTXxYhHODnG+iIvBns=
X-Google-Smtp-Source: AGHT+IHsIk28zJMcncG8p7BszPQDRO9igxHegljSXjUZlgP5bjEPHbU/3keGB/2EMPEFSEM15W6T184/cId4/RjRHXE=
X-Received: by 2002:a2e:a547:0:b0:30b:b956:53e5 with SMTP id
 38308e7fff4ca-32348b4dd85mr31334831fa.12.1746510936195; Mon, 05 May 2025
 22:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503003620.45072-1-namhyung@kernel.org> <CACT4Y+Yr7vffLYG+YmyB=9Vn_oxdQqR_6U4d-_WeQoOtPXZ6iw@mail.gmail.com>
 <aBmei7cMf-MzzX5W@google.com>
In-Reply-To: <aBmei7cMf-MzzX5W@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 6 May 2025 07:55:25 +0200
X-Gm-Features: ATxdqUEh1iZsyBF0tsJGQfvphUe0MbKDfV7H5u0vY5Ty3Aqja6LdhhLx5G8OWZ0
Message-ID: <CACT4Y+ameQFd3n=u+bjd+vKR6svShp3NNQzjsUo_UUBCZPzrBw@mail.gmail.com>
Subject: Re: [RFC/PATCH] perf report: Support latency profiling in system-wide mode
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 07:30, Namhyung Kim <namhyung@kernel.org> wrote:
>
> Hello,
>
> On Mon, May 05, 2025 at 10:08:17AM +0200, Dmitry Vyukov wrote:
> > On Sat, 3 May 2025 at 02:36, Namhyung Kim <namhyung@kernel.org> wrote:
> > >
> > > When it profile a target process (and its children), it's
> > > straight-forward to track parallelism using sched-switch info.  The
> > > parallelism is kept in machine-level in this case.
> > >
> > > But when it profile multiple processes like in the system-wide mode,
> > > it might not be clear how to apply the (machine-level) parallelism to
> > > different tasks.  That's why it disabled the latency profiling for
> > > system-wide mode.
> > >
> > > But it should be able to track parallelism in each process and it'd
> > > useful to profile latency issues in multi-threaded programs.  So this
> > > patch tries to enable it.
> > >
> > > However using sched-switch info can be a problem since it may emit a lot
> > > more data and more chances for losing data when perf cannot keep up with
> > > it.
> > >
> > > Instead, it can maintain the current process for each CPU when it sees
> > > samples.
> >
> > Interesting.
> >
> > Few questions:
> > 1. Do we always see a CPU sample when a CPU becomes idle? Otherwise we
> > will think that the last thread runs on that CPU for arbitrary long,
> > when it's actually not.
>
> No, it's not guaranteed to have a sample for idle tasks.  So right, it
> can mis-calculate the parallelism for the last task.  If we can emit
> sched-switches only when it goes to the idle task, it'd be accurate.

Then I think the profile can be significantly off if the system wasn't
~100% loaded, right?

> > 2. If yes, can we also lose that "terminating" even when a CPU becomes
> > idle? If yes, then it looks equivalent to missing a context switch
> > event.
>
> I'm not sure what you are asking.  When it lose some records because the
> buffer is full, it'll see the task of the last sample on each CPU.
> Maybe we want to reset the current task after PERF_RECORD_LOST.

This probably does not matter much if the answer to question 1 is No.

But what I was is the following:

let's say we have samples:
Sample 1 for Pid 42 on Cpu 10
Sample 2 for idle task on Cpu 10
... no samples for some time on Cpu 10 ...

When we process sample 2, we decrement the counter for running tasks
for Pid 42, right.
Now if sample 2 is lost, then we don't do decrement and the accounting
becomes off.
In a sense this is equivalent to the problem of losing context switch event.


> > 3. Does this mode kick in even for non system-wide profiles (collected
> > w/o context switch events)? If yes, do we properly understand when a
> > thread stops running for such profiles? How do we do that? There won't
> > be samples for idle/other tasks.
>
> For non system-wide profiles, the problem is that it cannot know when
> the current task is scheduled out so that it can decrease the count of
> parallelism.  So this approach cannot work and sched-switch info is
> required.

Where does the patch check that this mode is used only for system-wide profiles?
Is it that PERF_SAMPLE_CPU present only for system-wide profiles?
