Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081528DEE0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748457316; cv=none; b=EEcgebQksNI2w1vQ2NZo3ifjUy072lydHQOJWG5rdL53S7Whw5SGr6R9XXBW01srKjdl2QACxvBWNm7tyJxXdwalLtaGuHpO5zT/e3S+SxCVgne1y7h9z8I+5qmnVhhPcsddWjYg3i2WDa71jOBixf088x9gf965oM9F4wr4zpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748457316; c=relaxed/simple;
	bh=Jz7Nai9JFiOirN09TRvaGuuwtMD049NqJp7EUjquMVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BldxXJQZ/FzREJpuoE69NoI1ZP2bgJMA1B9Zdal3UKkVmwlS5Qz/3dhLyZUCSvNiKmMspiaHpOa9Q3b6hoCbtW9n5lKuAC+Y+Pw5xaiccc0Z3mwd4Z9hjGBDpOoworaCoehWRxgSJlmk4tujqhRfp8wKQl16ZZm23wPARp2j33Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWRioj7l; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWRioj7l"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so18155ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748457313; x=1749062113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cVLMwY4AxanVU8F/mVt2OHuXPMKbrtS0JnadrXFkYs=;
        b=YWRioj7lDUZBh61XThc8rxbgIqVywLZ6oNeTGKZXZOEV6A9X4reI8bzBkwwcL6ZeQC
         dtU+60ycwHyWiWOsjvR+An02+17mZo5xYYRLarL7B8IGYd+cr1L6weLcph+WMwyauR7M
         ELkR1NU1xg4Rtt7fddCDVcjRFjpdurarcfNXvdCxQchYCbEbgirskQwIUldoRmKEzgwT
         nP1WL0w67LH+ftBGRYcIMCBS9kMW5SX+Ml7YFZra99DeKCgOCopcrO7EkiNhThFFW6s8
         oKvcrLv7HlepCVzOUtmMuitaIynv948HhfBYMdFFF9MQqZE4jN9fU1fdyyZ43U8JtX/q
         QSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457313; x=1749062113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cVLMwY4AxanVU8F/mVt2OHuXPMKbrtS0JnadrXFkYs=;
        b=Rxq7ZITAjrNuMz5Q72En+qfpfaYwyuDXMkiyRqY6ETCPRNizJYPF118U+lllPOSoGr
         DqX9QEhIsNr8KJvdOxEqXBeI67+0Cvtpl9gNi/rtpUOFYbFvp+shteZqZLQyfjYXFFKp
         LimWooy1F4qW15RKpapG+MrfB4gBJgQfC6sNuk9kiV0LgVXcGAsLGChslUEKcqhpys1Y
         yHdNdeMXj8kZcgzzypP43XWzimYxgyhmvvKpSDhtCLvWo9qZcfRv4szYEuFikFmJUENE
         LO7UYeAivZyvpatiyWCbDq+VvhEJych1uH1WTeo0KaNV7hMYRcltrinsVpDgwyO9QELA
         4H0A==
X-Forwarded-Encrypted: i=1; AJvYcCUZhggL4PPOedpa4GwQMZOu9sl29LVb2iHDjZZBHxb4/DFE+2H9RpGz/1ovZH3cltV7/s5K9C4jQg61ur8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzal0AhHZFwgx3ZeQ1lceWeWEfQhQZWxKxYM0TkTqsOw/ZWkHT1
	8C3ZcqUOaHZbx3dvlpHx20Sq/dp/QCx2SzqXm+bEOhCkCSuGslyQaFQ5su/BArWHtSazOfhOIjW
	omhfkaEGpYhikWInsFuiT3mtI8+Zy97RBf77W60oM
X-Gm-Gg: ASbGncsHe+9x8kZa53SA1BExPFSHCszdgEFYSoJHz2bXISswK7IuEjNbSJgPFLhyuPT
	QiZtpzMVN3bGdRwD+8BXya6zVepnVYnU9AqAWYBC4l4bP2zXfyhiRpIH8vQXCR3OdYdj0bSPQJq
	MB+IH7IQktoo0wlyTxQ3aqbzgwPEsBdDvLRM+olQeJZ+2ihl9olTanrfn9Ci3QNIruu+r2hNvy
X-Google-Smtp-Source: AGHT+IGYXX0WDoz2XCkffg330kupFU0jreTbKLaIcJ3R/pK8nBp48fujSFr5wR2xC39RxHnZaH4b1vXmghZ5HEoyCok=
X-Received: by 2002:a05:6e02:1a08:b0:3dc:830e:1ce6 with SMTP id
 e9e14a558f8ab-3dd920f5e16mr384695ab.22.1748457312709; Wed, 28 May 2025
 11:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410202647.1899125-1-irogers@google.com> <Z_mK9BVv16MT7shL@z2>
 <CAP-5=fWykL-01S=35zz-6JASbM_cQkx6PHdKS7pJAX0=JBTuNQ@mail.gmail.com>
 <CAP-5=fWFYS7-FcbyJ5Z5U2rqA7eYwwJ4dMf90TUzwJ0Shh2yxA@mail.gmail.com> <aDdU1npHL2Vczhsa@google.com>
In-Reply-To: <aDdU1npHL2Vczhsa@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 11:35:00 -0700
X-Gm-Features: AX0GCFuOWPXoPpHqCzIaOBkJlXVpLQKsGRF_N94G7uJ_0dqi9rbnNFLaxAn8bjI
Message-ID: <CAP-5=fUycjUUWW=hoSSvxfUVPXcqAk5KHnknFuUDOr7+Zf=M2A@mail.gmail.com>
Subject: Re: [RFC PATCH v1] perf build: Fix build for clang's -Wunreachable-code
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:24=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Tue, May 27, 2025 at 01:53:37PM -0700, Ian Rogers wrote:
> > On Fri, Apr 11, 2025 at 3:14=E2=80=AFPM Ian Rogers <irogers@google.com>=
 wrote:
> > >
> > > On Fri, Apr 11, 2025 at 2:34=E2=80=AFPM Namhyung Kim <namhyung@kernel=
.org> wrote:
> > > >
> > > > Hi Ian,
> > > >
> > > > On Thu, Apr 10, 2025 at 01:26:47PM -0700, Ian Rogers wrote:
> > > > > Clang's unreachable code warning is able to catch bugs like the f=
amous
> > > > > "goto fail" which gcc's unreachable code warning fails to warn ab=
out
> > > > > (it will complain about misleading indent). The changes here are
> > > > > sufficient to get perf building with clang with -Wunreachable cod=
e,
> > > > > but they don't really fix any bugs. Posting as an RFC to see if a=
nyone
> > > > > things this is worth pursuing.
> > > >
> > > > I'm not sure if it's useful and don't see what kind of bugs it can
> > > > address.  The proposed changes don't look like an improvement.
> > >
> > > The goto fail case was in OpenSSL the code from a bad merge:
> > > ```
> > > if (...)
> > >   goto fail;
> > >   goto fail;
> > > ```
> > > Meaning the fail path was always taken and checking on the non-fail
> > > code never executed. Newer GCCs will warn of this because of the
> > > "misleading indent" but  clang won't. It is easy to imagine similar
> > > mistakes creeping in, so using compiler warnings to avoid the bug
> > > could be useful.
>
> It doesn't look very convincing to me but it might be valuable in some
> rare cases.  But the proposed changes - basically replace exit() to
> __builtin_unreachable() - seem weird.  Why is calling it a problem?  I
> guess it already has some kind of annotation like "noreturn"?

Yep. The exit is incorrect (depending on your notion of correct, I'd
go with clang's notion as they've had to consider this for a while) as
it can never be executed. I've added the __builtin_unreachable() to
document that you can never get to that statement, as otherwise it can
make the code readability harder with the code looking like it will
fall through after calling something like usage_with_options (which is
noreturn). In unoptimized builds __builtin_unreachable() will fail if
executed, so it is a bit more active than just a comment.

Thanks,
Ian

> Thanks,
> Namhyung
>
