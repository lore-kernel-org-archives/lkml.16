Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62B2417FE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928679; cv=none; b=t/ViBD17J+cjjP+ZcA3Hq85P78J0W3yRDE6vJMmgHhqRgE3L/I52kgBrT1bHKbwIk0UhFtgYpM+FkJK2/5CiLEG3gVmpovMCW5A4GqPWy0AO4E+xVj7+7ocVbwzPOlfWx7hpE3t//DgamWb+OY6gUiMYYu52pt9ZW+BKz9j+lzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928679; c=relaxed/simple;
	bh=JGu5JKj8jpkSVK3yYAVXPTbMrFO/6XIzUyJoj353e50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mh5jl36xgX6o2RP3QAbvqbka+YYMmcDC8SGh58FE0Mgo8NXufNuMNOiYRYHzj5wrYSX1huo4oFJOcKrZPyuPZdZACeO6iQ2WvGOW3uKqE5F9uuTvieQYJdxgmH8euEoRdLxSCQKt7fLK4xzzubzeb+Z/omsIDXJ0S4O8Z/zSNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1oXZJbCm; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1oXZJbCm"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-307de77b4easo17289361fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 03:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738928676; x=1739533476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXlta8LjLzGu/J5ZyrXnJulBIRAv/5fz0j1rTgufk1Y=;
        b=1oXZJbCmfxmJNPNi6O1mHtivr84eVIXwahsR+6TvyZHHRlYkB+eRaKCqRYZqzjhp73
         uFOt8h9ZQnJBop5c6FzTt1rk8v0so+OaEopEpY5u8wRjCzBo/AMsGBWEFmi05m4CPWRi
         9g/SuERpGvOEipNgFKEpSgs46i1jHfwrKlBKl0GOn336YIM8B0wGfi6xvTdB2ZjcBUSp
         xPmV4+xmUCMm2tgZgFfM5HSv5Mt7RmzJt/iHYYv0Qk2+SDqoyISeMym8DINNV9zycUV0
         O/Kk4NaAA7Uz99kC4xJbJdnliPu1tyTtx8Xmb+qJfpmmSjUoo/ZFo+kdL1j0XmY2/Tkm
         7AAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738928676; x=1739533476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXlta8LjLzGu/J5ZyrXnJulBIRAv/5fz0j1rTgufk1Y=;
        b=S1fmNlkuDbRLlCapbU2qum2EdnzJyc+HRErcYGRGJK1haXlyERKjCmO21kJ7jRO/cC
         ct89gNVv9ywRFzJ9O7iZG36BvE5lhaAFSWzeXUHt2CCGEPWYn1CWlhnje+aTQ0N6uDAe
         ZHr18s5+o70xllftRgxnFIQRqV8ZkyKsFj8PJtGUY8NKCS8dI3rEBD8ZnegchnzrtqtB
         UV5Pb2MFcSy6KpgteeosUYON2L62uLPO11d5oYBrAyVexg2cI+TBROfM/YAyv6G9dZKj
         zotsfXftnh0R6nl8xx4PLUnRw8EqU4jB5bCwcXAkJmMl4IemLppbs6CnU7XKCvhXlC7O
         Pzow==
X-Forwarded-Encrypted: i=1; AJvYcCU7HqjQ9ffxexKaT0jNlUjqm5vwD2+ca7XbPt0lUL6AVR9fise/bFwx4HBTSSaBnQrPsXcjyIx8yThZidU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2TTpZHMcWA3Tk6s3hUhmhUdr2Jnzwnp2KQjfEch/yu80hSGe
	cY2+zITVex3W99QreKSwp5l9Fy66CtzDR2ygDoRnHHc8rhPlWh4oCFiWeSKNvRA+9cozdgLw2Rt
	BWIu2zd0fUTJDeCJE+I/yyVlNNXEpRITQy8Nm
X-Gm-Gg: ASbGnctHE+wo9LHP33A3iBmB/DrmYMhliJ6Umdaw5sICm42U96vdNe52vOok9D5DqEP
	ybNu8TcdmPBcW1/MvtT6kK4HK6Ddp613fDlvkNCmFGz5BjwCKAEYBQEO2voRxRMfmYxJtse2w4Y
	wgGmA6sOlyWGw4tgrewSw/XIQC0zE=
X-Google-Smtp-Source: AGHT+IFBD05bWatFNIOO3CjU1frhz0tzz0FlpHNb00Eyed6A0AXOGuMdcR8AEQ1ya2IawmyznAQ/JPQadiMtzM4HLe4=
X-Received: by 2002:a2e:900e:0:b0:2ff:4e4b:cbe2 with SMTP id
 38308e7fff4ca-307da58e04dmr21221901fa.14.1738928675866; Fri, 07 Feb 2025
 03:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738772628.git.dvyukov@google.com> <87ldujkjsi.fsf@linux.intel.com>
 <CACT4Y+aVWH6d7kuxzvcJSarXMQB-PPDTcE5OvN2tjkOLnzmMLg@mail.gmail.com>
 <CAP-5=fUxY1KYXN-HcJPd2D66j5cC6DFTGPzYFVvJKvBLqyz6-Q@mail.gmail.com> <Z6WEkAPxtpVmx8cO@google.com>
In-Reply-To: <Z6WEkAPxtpVmx8cO@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 7 Feb 2025 12:44:24 +0100
X-Gm-Features: AWEUYZknqnNJQVXcj50I7GgYjjXVJVRJ6QKmq5lQDRQ69NY3CN35CUU5DSIPf7E
Message-ID: <CACT4Y+ZrFOWZodAM_Ay5hZRht=7D5KWcK7q4=DBpf-E2vs+JmA@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] perf report: Add latency and parallelism profiling
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Feb 2025 at 04:57, Namhyung Kim <namhyung@kernel.org> wrote:
>
> On Thu, Feb 06, 2025 at 10:51:16AM -0800, Ian Rogers wrote:
> > On Thu, Feb 6, 2025 at 10:41=E2=80=AFAM Dmitry Vyukov <dvyukov@google.c=
om> wrote:
> > > On Thu, 6 Feb 2025 at 19:30, Andi Kleen <ak@linux.intel.com> wrote:
> > [snip]
> > > > We traditionally didn't do it, but in general test coverage
> > > > of perf report is too low, so I would recommend to add some simple
> > > > test case in the perf test scripts.
> > >
> > > What of this is testable within the current testing framework?
> > > Also how do I run tests? I failed to figure it out.
> >
> > Often just having a test that ensure a command doesn't segfault is
> > progress :-) The shell tests Andi mentions are here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/shell?h=3Dperf-tools-next
> > There's no explicit `perf report` test there but maybe the annotate,
> > diff or record tests could give you some ideas.
>
> Well, we have. :)
>
>   $ ./perf test -vv report
>   116: perftool-testsuite_report:
>   --- start ---
>   test child forked, pid 109653
>   -- [ PASS ] -- perf_report :: setup :: prepare the perf.data file
>   ## [ PASS ] ## perf_report :: setup SUMMARY
>   -- [ SKIP ] -- perf_report :: test_basic :: help message :: testcase sk=
ipped
>   -- [ PASS ] -- perf_report :: test_basic :: basic execution
>   -- [ PASS ] -- perf_report :: test_basic :: number of samples
>   -- [ PASS ] -- perf_report :: test_basic :: header
>   -- [ PASS ] -- perf_report :: test_basic :: header timestamp
>   -- [ PASS ] -- perf_report :: test_basic :: show CPU utilization
>   -- [ PASS ] -- perf_report :: test_basic :: pid
>   -- [ PASS ] -- perf_report :: test_basic :: non-existing symbol
>   -- [ PASS ] -- perf_report :: test_basic :: symbol filter
>   ## [ PASS ] ## perf_report :: test_basic SUMMARY
>   ---- end(0) ----
>   116: perftool-testsuite_report                                       : =
Ok
>
> Thanks,
> Namhyung


Thanks, Namhyung, Andi, Ian, this is useful.

Added tests in v6:
https://lore.kernel.org/linux-perf-users/eb8506dfa5998da3b891ba3d36f7ed4a7d=
b4ca2b.1738928210.git.dvyukov@google.com/T/#u
