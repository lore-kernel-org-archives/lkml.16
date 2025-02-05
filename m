Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540B200B9C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774116; cv=none; b=fpQ6IHk6+z31XeBUv3Xq31QmvmJVLPnDYt4zLqVH51+9P9sqXcxBwFSuuncG6pMp+IJRVWfSJ21RMxX4l3F0m6Mw2CZZprEiJuxCNARsJSmcVt8NJbwNJCMcvxxnwBqnBm8z6tWX/xFqrkg/V4s3ZLDASXMPKIVVr3I364tf1Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774116; c=relaxed/simple;
	bh=Y/Umkqwe0FIFVuLibuGdbJdwz39Eetp01h2On5mupYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqmKZs9wHxuEV73osCfR6Gru/lenb+Q7msGOx4EOPKXhwpri9TS1ZxwOLK6usOtJVba7tFGOXUSDGCBjRG6+ep93LNIzGW23f6Xb8oxE9RFqR6KJutL9EAFK3IqijUD2jY3K+0/SEtyhpcu8FhcSnoJ+/I1oJLNzEn2JbSLD6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HELNsKeW; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HELNsKeW"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so181655ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738774114; x=1739378914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joDS1tDCk7LOHCWDnLrasLgdXk4VSPOTTauZQpvavb4=;
        b=HELNsKeWb5rrqeHd4/txw58bWe7uvYeLA5jCJnBthQ862i0UzB1O8eA3gn77CgHAkP
         YZ5prLCRsmfQnQN8KO46wAKLvO6w4fst6lB3CDUQDPo7UgX68coHws7JCIIjRdHqjQDq
         cGWeC+DBXQfXaX1YMVB6Oqs3wcV2F6gkqg/slkcG7jsZSyYBsXvW8m9MI4sxsOaUkL7c
         tSKa52fXgIUKpMaRWQC7Qw6rJZBzYSkiw5Oi1RR9QNMGuSLNCsBk5yvFAlw1sFyiY/LT
         nRuMEzd60jgrRvJ1tqPA6pcDgBz12kE9G1gONC/GlBcVqJVZFnCfDW5rhTzhgdRnhx/4
         fNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738774114; x=1739378914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joDS1tDCk7LOHCWDnLrasLgdXk4VSPOTTauZQpvavb4=;
        b=s3KTlB/jPKitLzfD2C6hW5+3ao7+ylI89tx+GXU8xYTbuAdXNQ39BkhqUy2FAdTukg
         3Kob/OoaPIeSbmk6fkuKETGQO/W75Uw0lmsxXTe4g3oVJfY8VlsMmXO1vjhB11+yFYO/
         0YolAI1tRbqAMV6tadnFEmszR58rUEk4o1qVppD6I2ELOSw3G4qNgZ1i2dXgTvc33rGV
         EjsCG/ICKEY839edWDns0FcKGPVFh9uIvSCiHTO8LRDqW4zAnrvsiy6ONX90AIxH7sin
         4CQBWU65RuoWbo/oKjtHb27evI7N0VA3+82iOnUgyTtrt37uxAu1Jb+rRYGxIH7S4Ij8
         vneQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTM6/dWRhG3SwcatsSN6mkPM1wcKc39elkv8HqhjSVpNb7fzMbzTBiORTD0cAESPfBZqMXYnCDu7bux98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaAdPBpLzsuzzvYkVj0TxkWtcpFUgEeTukA5bf6B6I0pydopEr
	oHb5wt99JFWjyjUL7+256zkXQSEnp4TmzndLNCyruhBvCLO5YPdCILjG+PAVsFsA5+xwJS4kUq0
	2cRSh1W4lE7i3SqBsNHZp5/oXMwehP83CDdB8
X-Gm-Gg: ASbGnctZm+0w+0x3ONgDL/UQkaKsHJGcAs1jTgB8r3bkjrw9wp0dndenJwBnRWTw8HU
	Jhlwt1vnU+7jVT+jcc5gEXLfG4mYpfhFSsFC3h405juzzAFvUR+qniWTBdEC2bk8GGwwuCs3ZoS
	5glsv5BXaMtgSTrSvtO60xMMhd
X-Google-Smtp-Source: AGHT+IFBUDCW0QOzk0qZc7xsHuzYmV8hEI79AVi8A9RlcnQDhTtG7Bg/QLXgqjJzzrVyQLJUjOYea8ZwUceIWLC9ImI=
X-Received: by 2002:a92:d751:0:b0:3d0:4e5d:4782 with SMTP id
 e9e14a558f8ab-3d04e5d48b9mr4103095ab.10.1738774113670; Wed, 05 Feb 2025
 08:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025020304-chip-trench-4e56@gregkh> <CAP-5=fXwprvLc3ubPmAuyUaTL2aD1frqL+RHJzkp8oe5z85oRw@mail.gmail.com>
 <2025020444-chivalry-wanting-7f0c@gregkh> <CAP-5=fUk3DB4orma=vM=+cKrztsRqHVhvvPk+py+G+9w9sOdqg@mail.gmail.com>
 <2025020507-anteater-icy-44ab@gregkh>
In-Reply-To: <2025020507-anteater-icy-44ab@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Wed, 5 Feb 2025 08:48:21 -0800
X-Gm-Features: AWEUYZlSO_3FBGh77aFbt88gk14mgpW2VfIIA-t_-2vKEukz3TJzdP1tCQWYhQA
Message-ID: <CAP-5=fUCDA1YLDrMgMpr=o4ESFey1b51+DfBwCF+cG7+-yidwg@mail.gmail.com>
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

On Tue, Feb 4, 2025 at 9:41=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 04, 2025 at 10:17:17AM -0800, Ian Rogers wrote:
> > On Mon, Feb 3, 2025 at 11:05=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Feb 03, 2025 at 11:44:13AM -0800, Ian Rogers wrote:
> > > > On Mon, Feb 3, 2025 at 11:25=E2=80=AFAM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > [snip]
> > > > > Note, if you all don't like "pmu_bus" for the name, that's fine, =
please
> > > > > let me know and I can rename it to something else, but it should =
be
> > > > > something to get these objects out of the root sysfs directory.
> > > >
> > > > Excuse my ignorance, does the event_source bus already provide a
> > > > similar solution?
> > > > ```
> > > > $ ls /sys/bus/event_source/devices
> > > > breakpoint   i915       msr         uncore_arb     uncore_cbox_3
> > > > uncore_cbox_7              uprobe
> > > > cpu          intel_bts  power       uncore_cbox_0  uncore_cbox_4  u=
ncore_clock
> > > > cstate_core  intel_pt   software    uncore_cbox_1  uncore_cbox_5
> > > > uncore_imc_free_running_0
> > > > cstate_pkg   kprobe     tracepoint  uncore_cbox_2  uncore_cbox_6
> > > > uncore_imc_free_running_1
> > > > $ ls /sys/devices
> > > > breakpoint   intel_pt     platform    uncore_arb     uncore_cbox_5
> > > >          uprobe
> > > > cpu          isa          pnp0        uncore_cbox_0  uncore_cbox_6
> > > >          virtual
> > > > cstate_core  kprobe       power       uncore_cbox_1  uncore_cbox_7
> > > > cstate_pkg   LNXSYSTM:00  software    uncore_cbox_2  uncore_clock
> > > > i915         msr          system      uncore_cbox_3  uncore_imc_fre=
e_running_0
> > > > intel_bts    pci0000:00   tracepoint  uncore_cbox_4  uncore_imc_fre=
e_running_1
> > > > ```
> > >
> > > Those are the exact same device structures :)
> > >
> > > Look at /sys/bus/event_source/devices/ those are symlinks back to
> > > /sys/devices.  In other words, that's the exact same structures, and
> > > the mess in /sys/devices/ with these event devices is what I am tryin=
g
> > > to clean up.
> >
> > Thanks! Again my ignorance, why do we need pmu_bus?
>
> You need some sort of "bus" to group all of your devices on.  It could
> also be a class, your call.  This is how the driver model in the kernel
> works.

Sure, I wasn't clear how this mapped out in sysfs.

> > Could the symlinks in event_source be the actual devices?
>
> That's not how the driver model works.

Ok, so I guess that's what's confusing me. Where will the new devices
be in sysfs? If it is /sys/bus/pmu_bus then why is
/sys/bus/event_source a different case? I guess I should read docs and
the source :-)

> > Perhaps for temporary compatibility some symlinks could be placed in
> > /sys/devices?
>
> No, /sys/devices/ is never guaranteed to have stable placement.
>
> And define "temporary" :)

I need to finish my time machine to resolve issues like this :-) An
unfortunate thing with the PMU acronym is that it is overloaded and
can mean Power Management Unit. Events and perf are other names used
in the code and they don't seem overloaded, but it isn't clear to me
we care about the name being overloaded. I'm afflicted by thinking of
Digital Rights Management every time I hear DRM.

Thanks,
Ian

> thanks,
>
> greg k-h
