Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1658E2165E8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693051; cv=none; b=i8JVuGnMvRrA5XXzMzkWEZLE3QSACnCatenQauB5/XaOC44Xx9X/XdtQjuNiWqCLtktPdLiHZPmPTpmp7KbNhvK5/keIHxAfFp7teg/OLaWxUXR+9G+KpigPqJ+Zyuaz95P3rqP9jYtLkmfvj4tGpmaNZ/acHQAGT46zSSab9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693051; c=relaxed/simple;
	bh=pWaBP0CVleItpcklVYbBi++6w91KDe9zBdArHRpRrWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QpvwmENUWQ/y88FibwaPMy5xDlbHqyjTbVngf15CI5QPw4AUzNSp7PWdQHaz4aZ8hBByXCyJ24G5OIPCuSfIreuyXvjbVK05tXcTKDsI/byWYYyQ52bkdot7/EI/iDF6r/X5vGdlr9N7KzWRUUwBX+kdsXnLX5mrM9SC59gVoJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MGdX0wjR; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MGdX0wjR"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so16055ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738693049; x=1739297849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3UvNoN7gqpsLO22STOhC2pxClv5CftaFh/u/6+uCJk=;
        b=MGdX0wjRCBWUCfm7WlqnxIHuW3MU9MiFDJ24A5nAQ9qo2q73qhHowpsJ/NQSlZ1Rc8
         4Pu3/biL/EkyL2urfCSQtUj6hOlMYowQtGZhxSWCW+TrQ//bFdN9j/W1hUj0n6hMMZq/
         8dUBVjEe1oSkAHMRKL6XVIKKVAFBF8XjN02PfaEu+gkMxMmD+AV/c7KwWGMuVrgJ+y05
         jiDFmKJrmewJEXsIKAIrBBNjacTdAi4XA+SbT3Hr9nOOtmYns8pKTBbaVdNXJWajUAfn
         6BkOuiX42ZfjSvIqX5fMsxDVsE/eqFWHISlNOI8eNjxV8TA1yhSiqm/fjU/9ziJCh1Cs
         OFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693049; x=1739297849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3UvNoN7gqpsLO22STOhC2pxClv5CftaFh/u/6+uCJk=;
        b=AEVy5hFs+Z2sqztopVKXmih8+CHNj+yQmmkU8CAKIuyQt0eIr2dq5tmb59GH9Cg5A4
         4xZlMb7lGREw8Bmb+dvjehwG+sRIX27VTQPMgX1iMSRs+DcVOU5hiK7pm8nyRI6DSAS3
         qBJREzA69a+IiOL4gHgI4T9vwRWm8VUUoMvsOcoa6HiYzXrECQOv/1OMaghMZuxKqrRZ
         ED0iVqJkNrzWCmOePF/q6oqwo96xadEexdS2A8VUnhv+g/vDn9Zwns1h7J9B8FxfMb0q
         ZEPvNbO4y1aETRp6WBkG6mxvhR7tAneA/5mj82TTg+u0vGCZh1j1Ook032BePRGxsDKL
         Mc5g==
X-Forwarded-Encrypted: i=1; AJvYcCV02zujc5cZWvqJ2E2b5a8Ehxgtk3G5FWTriW6MxB0XCySMu5CO1gex3ZJEOBaJwqI3/oQDeq5F/c0WPGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGEPcuyy5eDgwQn+IqpqgcIhVhCO+si4rB2srPTyjZjS9jCvP
	IlTOU0sEV2YdQslNWKp45aZZG8A6asmb21XjpvqUAZPS/jVXbJlXo2P7iRmwCX6HeCMfcw+OHjO
	iEfwed8f8yWBVsUws/kYsIq8VuGu5vuib1b95
X-Gm-Gg: ASbGnctFryxnCBDbIRNpamXhUSunhMzgs4zCy0kG4duHUNFoWsUF/ADBMKZiZuPh+sw
	HSo5szr+ZbpcrZ6+OKcNw/9dmgrPlMcfg+CwcrXW9vbt1HiFhJwGv9RWsf2JOCgzZLJa0M8QDMA
	Z6tMlGCSc+i7fbpSW4Cl4HtF8=
X-Google-Smtp-Source: AGHT+IFSb6p+y33pvkXVKpplGE3ncyZOropQ02NFuyiOGkQJgIOV4Fnl+vR4vOLwj59ExMNx49afv7Vgb7F1KNqUL2g=
X-Received: by 2002:a92:c544:0:b0:3ce:3873:48d4 with SMTP id
 e9e14a558f8ab-3d03fbc113dmr4328295ab.4.1738693048936; Tue, 04 Feb 2025
 10:17:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025020304-chip-trench-4e56@gregkh> <CAP-5=fXwprvLc3ubPmAuyUaTL2aD1frqL+RHJzkp8oe5z85oRw@mail.gmail.com>
 <2025020444-chivalry-wanting-7f0c@gregkh>
In-Reply-To: <2025020444-chivalry-wanting-7f0c@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 10:17:17 -0800
X-Gm-Features: AWEUYZkf_zL-nqp7mLrmVj3RIJAOBqhUHw3vAZ2mCHhPzzWvQTYIBpDsD-wJCns
Message-ID: <CAP-5=fUk3DB4orma=vM=+cKrztsRqHVhvvPk+py+G+9w9sOdqg@mail.gmail.com>
Subject: Re: [PATCH] perf/core: move all of the pmu devices into their own location
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 11:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Feb 03, 2025 at 11:44:13AM -0800, Ian Rogers wrote:
> > On Mon, Feb 3, 2025 at 11:25=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
[snip]
> > > Note, if you all don't like "pmu_bus" for the name, that's fine, plea=
se
> > > let me know and I can rename it to something else, but it should be
> > > something to get these objects out of the root sysfs directory.
> >
> > Excuse my ignorance, does the event_source bus already provide a
> > similar solution?
> > ```
> > $ ls /sys/bus/event_source/devices
> > breakpoint   i915       msr         uncore_arb     uncore_cbox_3
> > uncore_cbox_7              uprobe
> > cpu          intel_bts  power       uncore_cbox_0  uncore_cbox_4  uncor=
e_clock
> > cstate_core  intel_pt   software    uncore_cbox_1  uncore_cbox_5
> > uncore_imc_free_running_0
> > cstate_pkg   kprobe     tracepoint  uncore_cbox_2  uncore_cbox_6
> > uncore_imc_free_running_1
> > $ ls /sys/devices
> > breakpoint   intel_pt     platform    uncore_arb     uncore_cbox_5
> >          uprobe
> > cpu          isa          pnp0        uncore_cbox_0  uncore_cbox_6
> >          virtual
> > cstate_core  kprobe       power       uncore_cbox_1  uncore_cbox_7
> > cstate_pkg   LNXSYSTM:00  software    uncore_cbox_2  uncore_clock
> > i915         msr          system      uncore_cbox_3  uncore_imc_free_ru=
nning_0
> > intel_bts    pci0000:00   tracepoint  uncore_cbox_4  uncore_imc_free_ru=
nning_1
> > ```
>
> Those are the exact same device structures :)
>
> Look at /sys/bus/event_source/devices/ those are symlinks back to
> /sys/devices.  In other words, that's the exact same structures, and
> the mess in /sys/devices/ with these event devices is what I am trying
> to clean up.

Thanks! Again my ignorance, why do we need pmu_bus? Could the symlinks
in event_source be the actual devices? Perhaps for temporary
compatibility some symlinks could be placed in /sys/devices?

Thanks,
Ian
