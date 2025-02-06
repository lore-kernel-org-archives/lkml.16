Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3501A5B96
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867890; cv=none; b=XM4AvI4qfmDuOwj9P+aFiyvZxaY0r9IsJREbakLWJsy4xkjssYzb/oKkcNMtteVo7uEbhokP7IrAAIUxhVzGhwOyIPl2rZ++N7VuUuupeO0yNLtxY+V99OiPImMuJmZ2vQSoFvTRR7PFPThm9etlaGtGOboAjkSWpyD3YsTbZGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867890; c=relaxed/simple;
	bh=W+EmoY9BtXnORycbSDogTMfJwHH9/hNjgpy3kW9vOv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h64/w9HmQyfJc+/58hHRV+0hzcoDWI7yRQavOMUtV5pGl82oTOQvzn5IjbzkVXMoEkSWls6fCGPEXTk5fsGcSExFXE2dGMCkRIlQiUXq94Hhw6N437fxJYT4qwIZ0pv8dWzpCMH/S1ICBJssyRst+IiM2/TNMBZh42UaReevopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wOTHEUFH; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wOTHEUFH"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so10205ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867888; x=1739472688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+EmoY9BtXnORycbSDogTMfJwHH9/hNjgpy3kW9vOv8=;
        b=wOTHEUFHNTUtlEFVNl377DEV645sMOC8y5QdNGcAKRYRz0xpf0gyW7HwNgxltz9n7H
         rlRaVh2+TzAOwNYip7e7SbHUzYa0tvo9ncEphrYLdFGKZDyITlhs2K+piD8QbqOr+ASb
         +diHQKqQ06azbcHwZv6c2EBZlE37iblFGVX8e2Mtmc4pT/djNxm0hjGmFjDiGJHui1vJ
         dyczxQ5LDA2V2uIWVhulloxw8LF1JfVXEYsnDZvCJZiQktrxiXA5LY0H1i8JrPSqRPmZ
         b8wWC4cV3VTKfKWLnpU3bfOCObKpu3S+Y1YRdE+JGcfVRcYBQsYyeZB7YRNbhvj9OogO
         YASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867888; x=1739472688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+EmoY9BtXnORycbSDogTMfJwHH9/hNjgpy3kW9vOv8=;
        b=KGvDD0fE33PsjB6u7FE4o6MD/3qW0R7GOUoGOwcaKCHsaks45NbnynsGnxmm1rGZbN
         RRHtvVg4TcnccB9AM0crY59k9SJRlGvamveLlaNNbWiZMz20s03FfdUleJMGb+SmiU/1
         vKXMqK6jZwgWvanY4uQG6HV7Bbm+hX5vLBPK1URx07W6AV9IDHM+1i0mZdiZg2bt4+dY
         X4VHR3GtLbCvjgPAlhqXhzJKl4DYIKPNjxd32QaOnFjYr3Ce93ei+vBvhLPCJ872p7G/
         WHSRTMF1COhUEeLZLgiO5JiLw0b//zCPXfwhkMOrmRrvCJq3XDOIiDCsUK8Jm88vUnfZ
         HO3g==
X-Forwarded-Encrypted: i=1; AJvYcCWYhmPOm0NjMgZ8B3pk8q7P6TcfI8YEmmEvw47rixajjPUh69rw0VnByoUFWumDxF2VkjIr0Q+Y72tu0IY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKRbanVCBvlzEP8uVa4KVRB9viHpzt7Rhec4HBelDKPI+ZWQP
	Nqio6rrJg+tm568SWEjsPJCQGqEeXqBsO0WoJ45gNj/fpUiDNexEXM+VUsALasUsGgJl7NK6Brc
	SY9nAKL1WLyBqofvekFvz+X8Sq/RasZO+p0Gl
X-Gm-Gg: ASbGncs9YAQRt8sSPOprPAbdixW2AoMwr94OirIvrjsOYI8kBej3iLk6qjLfrrQnvzm
	QbUaAvYFIrQTLipGYUckhNOYwDQuYxow3JCbvse/DkRpyIPQfZq8lljfC4nx0nYheX3pUhB5vli
	F/IXESQzEFJRO892PlGlB9WMTs
X-Google-Smtp-Source: AGHT+IF9+Ul15W+RjPSocu8uUZAho7OvRYprbn6nq3pQFsVOTDKly+b2R09++b/gTdnOVYVoRxVI5nYqlAPkSwXc3os=
X-Received: by 2002:a05:6e02:20ce:b0:3a7:c9eb:accc with SMTP id
 e9e14a558f8ab-3d13df24892mr112355ab.14.1738867887651; Thu, 06 Feb 2025
 10:51:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738772628.git.dvyukov@google.com> <87ldujkjsi.fsf@linux.intel.com>
 <CACT4Y+aVWH6d7kuxzvcJSarXMQB-PPDTcE5OvN2tjkOLnzmMLg@mail.gmail.com>
In-Reply-To: <CACT4Y+aVWH6d7kuxzvcJSarXMQB-PPDTcE5OvN2tjkOLnzmMLg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 6 Feb 2025 10:51:16 -0800
X-Gm-Features: AWEUYZmZkbYvDg8fUC5Pm5bSxbJep8KVTkj4PMB3cOfAmup00_un0a1HQJcD9YM
Message-ID: <CAP-5=fUxY1KYXN-HcJPd2D66j5cC6DFTGPzYFVvJKvBLqyz6-Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] perf report: Add latency and parallelism profiling
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Andi Kleen <ak@linux.intel.com>, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:41=E2=80=AFAM Dmitry Vyukov <dvyukov@google.com> =
wrote:
> On Thu, 6 Feb 2025 at 19:30, Andi Kleen <ak@linux.intel.com> wrote:
[snip]
> > We traditionally didn't do it, but in general test coverage
> > of perf report is too low, so I would recommend to add some simple
> > test case in the perf test scripts.
>
> What of this is testable within the current testing framework?
> Also how do I run tests? I failed to figure it out.

Often just having a test that ensure a command doesn't segfault is
progress :-) The shell tests Andi mentions are here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/tests/shell?h=3Dperf-tools-next
There's no explicit `perf report` test there but maybe the annotate,
diff or record tests could give you some ideas.

Thanks,
Ian
