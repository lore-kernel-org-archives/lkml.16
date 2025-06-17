Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A3277008
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186150; cv=none; b=arU+sjZ7QI8bK3VCQsVGnKLqJAdV5ZseKWHrCPRriQebteBBQwN1Rptymm+X+Ela861x/se1gsQUYc8ovTbwlN9XpZr4DyiqHDU75vb542dVWIyzpVPC7D44pnIW1OR82lsPGWRbZ2V/wV5TvIc2R368d3Gdq1VFNl19KByi6to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186150; c=relaxed/simple;
	bh=KwqSD/mvRel9xI3T5LRWWp1qv/dt+bofRF5gsGxGzwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM2rjnLU1nuC5VxN8WO2HglvXZfkTJO6cQg2vEq9kkgyvg/yJSHR9Nwnw/7KwIGSfiMey8l2GxYPRnpilQHODozk+WvumSBAdoQePmqaHj9hSl3Bw1/Q1ucZCNOh0iKm5IDAV1SaVwScmLaW/On0c2pTnDPOStr9k0ugwK7ei7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y4vyDUn/; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y4vyDUn/"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3de210e6076so19005ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750186147; x=1750790947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8EJ5NTBcmp1K+DlZlLHbsBISbfgOHA/1xl7u6O9rkw=;
        b=Y4vyDUn/WDsPTuUnxBSM9qdYXy5w18OKHDjxgvpcFP0B2veSRcvPZ1aJ5k+6jpWQ34
         ayMssVNN9tLeQNiXEGIx6MRuWQkT2l8HZRjTn1Glgegm3cjNtPtxe58+OG+JXioZWS+F
         qPI1ALFKc/KJxzkC5/JWJpf6l/C82L3/OsGNG5h9/CMqQ92QRKFT/5yCfhjwivSRjEel
         zEFRSxDtJxP8yyJwSvBHgv9Y1k3H1YN7d/pqWiyiGB2aXFfWZctss4oYy6lN48lTs3RS
         8qEaZFxoClgG74O6Ku6kByHu6T+AjRRsTUA22qCu7qFix4jAmtQLgIL4B/b+4NTz96z6
         jYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750186147; x=1750790947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8EJ5NTBcmp1K+DlZlLHbsBISbfgOHA/1xl7u6O9rkw=;
        b=gK6V3lgfydKsyeZ1ci3FshTBLCtFoiL1rh6dAVDlinA1gTPqRHET5MAGydbWO6KArE
         CACkVdN8COqVYYCvY+cAFwAEqhrYqacMTbTfXpMg42M2mgdiavTbyTr6RGhCP4dag5Ga
         Ba0jzi0Os5P+4YuDLUV9iDtPxmEniRIoE5JPYIrZFWYh5XcPEOua7EiZ1ose8WIfJ7km
         aoxyLttyVnfq9wnlP8D8q4QJ8I4ej3wv9iqN+2brt2CKj7vJei2wQiKfV3xzkGdErAhv
         y/9NUTUoShyB7k8h3U7IESawyXfmPGhOfE/nVMKTXWW+C8vzN9CD1e1cEanDroYTuEgM
         vX3g==
X-Gm-Message-State: AOJu0YxgNy5Yv89OmHm8vs85IsW9eCD8h8vuCSSpGnSpYdGwRpw8nBz/
	pvlbnQRXrSww/AeoRYsMVVwyhcElf17gfG2llK+A1swaT7EvQWspFohgFAGVptycWMkhJbrujtB
	pxBrASdL2z6Bq4tG2Xkglb67QsAy78wvZOY2JkrnH
X-Gm-Gg: ASbGncv6Bt8y3HdzGiguFDi2+iDPGi+BRsXIgnssUVieibd183bQ7lz1Lu3ovOIvoqA
	5b6PLZhup47tDOGPY1To1xAp6gg7KByOsm8g9RvSTPge+qvaSmB1zPk7Q/k1Q6Cwk20TmVvXiJI
	MJ7t/ZD3rnDFTfLr8huB2inCJPecNcJMpUcu6qv6DU/nM8vG6IeBFR5/WiYn8/Oo3BycgW8L7Q
X-Google-Smtp-Source: AGHT+IFzrUwC9gszj0tD9vuBEBQF9n3D4Q3WJTaRCUVhXGHHOddGa1pIqtmbyT4XwSHM/7FECm5kvyzNP+0l4d7kUpg=
X-Received: by 2002:a92:ca47:0:b0:3dc:8596:b15 with SMTP id
 e9e14a558f8ab-3de08e309cemr12018435ab.20.1750186146706; Tue, 17 Jun 2025
 11:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617133614.24e2ba7f@gandalf.local.home> <20250617174107.GB1613376@noisy.programming.kicks-ass.net>
 <3201A571-6F08-4E26-AC33-39E0D1925D27@goodmis.org> <20250617180023.GC1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250617180023.GC1613376@noisy.programming.kicks-ass.net>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Jun 2025 11:48:53 -0700
X-Gm-Features: AX0GCFv1wtGvcgVGSD1sgzvmQHC0HhNLOA8sTZ3tUy13Qbfl9q8mNJDIZ58ROyM
Message-ID: <CAP-5=fVH1HfdXT7HLZhav9k6m7t7Ji-=y2Gw13h1qMtgW8cRQA@mail.gmail.com>
Subject: Re: [RFC][PATCH] tracing: Deprecate auto-mounting tracefs in debugfs
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, 
	"linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Namhyung Kim <namhyung@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:00=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Tue, Jun 17, 2025 at 01:54:46PM -0400, Steven Rostedt wrote:
> >
> >
> > On June 17, 2025 1:41:07 PM EDT, Peter Zijlstra <peterz@infradead.org> =
wrote:
> > >On Tue, Jun 17, 2025 at 01:36:14PM -0400, Steven Rostedt wrote:
> > >> From: Steven Rostedt <rostedt@goodmis.org>
> > >>
> > >> In January 2015, tracefs was created to allow access to the tracing
> > >> infrastructure without needing to compile in debugfs. When tracefs i=
s
> > >> configured, the directory /sys/kernel/tracing will exist and tooling=
 is
> > >> expected to use that path to access the tracing infrastructure.
> > >>
> > >> To allow backward compatibility, when debugfs is mounted, it would
> > >> automount tracefs in its "tracing" directory so that tooling that ha=
d hard
> > >> coded /sys/kernel/debug/tracing would still work.
> > >>
> > >> It has been over 10 years since the new interface was introduced, an=
d all
> > >> tooling should now be using it. Start the process of deprecating the=
 old
> > >> path so that it doesn't need to be maintained anymore.
> > >
> > >I've always used /debug/tracing/ (because /debug is the right place to
> > >mount debugfs). You're saying this is going away and will break all my
> > >scripts?!
> >
> > You could mount tracefs in /tracing too:
> >
> >   # mount -t tracefs nodev /tracing
> >
> > And update you scripts with a simple sed script.
>
> If I have to edit the mount table, I'll just keep it at /debug/tracing/.
> Tracing is very much debug stuff anyway. While I knew there was tracefs,
> I never knew there was another mount point.
>
> Just annoying I now have to add two entries to every new machine.. Oh
> well.

It seems cleaning this up is a good thing wrt permission issues. On my
local debian derived machine:
```
$ ls  /sys/kernel/debug/tracing/events
ls: cannot access '/sys/kernel/debug/tracing/events': Permission denied
$ ls  /sys/kernel/tracing/events
alarmtimer        fib             irq            nmi             sunrpc
...
```
I see a number of references to debug/tracing in places like perf testing:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/shell/common/init.sh?h=3Dperf-tools-next#n122
are you planning patches for these?

Thanks,
Ian
