Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA209214A61
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738788472; cv=none; b=szwYesDCpI4CrGekSBrTl0Z09wb8tBtnnICc8gtoZawwkiOO2XfsSIb7hPXnA+9MgQA7AJoTkBxuTlYFQeDcUWcmmowRZoXzXblOua+McESX5+i6zUPCp6g0Seh4JEvOW8CgdLeoR9GwKKQbAcY7or3EizPzrogZzVP/3qGJhjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738788472; c=relaxed/simple;
	bh=rU0ctC7rOtBbtvVcAjSEvVnzlmDJ2Rez5/8BZgHt+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qn2TETkYW2ELFX8MWWjd23vLvui85vyEw2A8VBS7rYizRcaX7OelzHS7YGrcs3fpVISvhMbbpyO7W5cQ2vibZNePDyyg30+6GwpAJIn59LSDgmjFwg/lVCFqRgWTWz74Reqt4OX3Ew11tT5RoN9cNUF+k7XYaRWSL9qK0Nv4ChU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKi6i9Ad; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKi6i9Ad"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d04b70fe79so25135ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738788470; x=1739393270; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO3VLGfpIyW7n/mpkrRU9S3W3XvjrnoMDTo4eY/G6UA=;
        b=BKi6i9Ad/3CLLMV1AOC6F03JbxYWiiQnpt9jInEYQprYUY37RTrkdGk+LYcSIjcCbk
         U8Rdgtp3ykGT0tnFi5gWFPF301CpVQdlt48UQ/w26PjzD8MMBYy5Eb+2SCCKEHOVAcJC
         tCJYLMmYcyUGgY4/H6WOEz0lqgR8xiEqrP/YqVYo3EM4A+Xnh3rGaCmMhcXYTwBvTzE3
         MiIAk6MlqVsxEmTaPd9iMcAaHAsx0gFww8tO3faJlTKY8AC/Wk8rO2vYn6E7J4JPu+xp
         zYzSWhIUmitv70ny6kmXh6Sotlxijgf0tk92+xPZe6i3yJ8O4Dln2Qq53lR1UZQeL3Bv
         ws9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738788470; x=1739393270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO3VLGfpIyW7n/mpkrRU9S3W3XvjrnoMDTo4eY/G6UA=;
        b=J7Ey8MlFAXE4lQENv+x25cVYwUAUGKyWbTr9H3mJ4s0emZo0nQ7zKSsoTiU9gKcID+
         1Zfyc6KDQ8RfkUckXgfg9ktw9bdhwOqglPcDVXIsb2LOylkdKhCSVwZ17ITaDybrd3he
         iPPJvmaHhI6xOLX82hkRHNXtdnGvK6OzrZzuBODx1kAXFv7Ji7ZEYtAqmlSdTn1ga57R
         alk0qFlKW9BScWZxxwPKSh7StOxwyuGPUSPXKrO7xZk1dgiImJ3FEpLy4cn/Abb8WcGd
         w8XxhyDb8pLzrlMZMDc1klBG1Cu5YcQLN3ppRHJDiufa8QLqIB6GxT0H7P2RTG41mXvK
         M9WA==
X-Forwarded-Encrypted: i=1; AJvYcCW1nHx6PsTLp+oACvhLiM0ahZMiaEw8uxBTMCqPI2wQzunKbYFZN3mXWDK7bdIeEmoXeulT/nOD6gihOXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyns6g0j7euTLIAyZqgjP82UCH7Gn5V23SlHMHlvCH81IPaLame
	pgiZyFlXY4fF3rgJiaznKI+JHLo6TcF9l/ICouAZ6FeojrJNLJ58yaofDIcwoCG7n5C3hNFS0GI
	F+Zag7/sc+5dXXXQnZSrRqfvFKnBHR3vjIVpl
X-Gm-Gg: ASbGncsvSpNfEwuTgUiqig+JAnEjbpp8+XOSlBdzr9zUhNam9sX3cVGi/SzrDSkwEsL
	fqkZnY79/viz73PLhyalxkEj0/RnnEta1y4UlyOTy37KKTtKlu0ZhkrvfBt0rScO02nRlLMKVsy
	n/dN8+K0WvEIGsCjQOXPXEXh0k
X-Google-Smtp-Source: AGHT+IHJnefBKwcS3pswiENouUkaAd3Hiy1kZfPbDXW7Wl7NrpVnF9fY6D5TADaLx1tGX8uwqg0KXDS/aO+qCYmly/k=
X-Received: by 2002:a92:d1cf:0:b0:3d0:507f:38dd with SMTP id
 e9e14a558f8ab-3d05b4befcfmr423545ab.5.1738788469762; Wed, 05 Feb 2025
 12:47:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205173140.238294-1-irogers@google.com> <4f42946ffdf474fbf8aeaa142c25a25ebe739b78.camel@intel.com>
In-Reply-To: <4f42946ffdf474fbf8aeaa142c25a25ebe739b78.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 5 Feb 2025 12:47:38 -0800
X-Gm-Features: AWEUYZkjLLl2RiWIh_PBTKbSre4apLrTUqpKx5SDeXneyEXwT4EWNR30bpCGuKs
Message-ID: <CAP-5=fUjx3PTHfjgkam9Q0xE+TrYx+FSzF8wUscbD9X36gJ1Tg@mail.gmail.com>
Subject: Re: [PATCH v5 00/24] Intel vendor events and TMA 5.01 metrics
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "Baker, Edward" <edward.baker@intel.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"Biggers, Caleb" <caleb.biggers@intel.com>, "mpetlan@redhat.com" <mpetlan@redhat.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "Alt, Samantha" <samantha.alt@intel.com>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "Wang, Weilin" <weilin.wang@intel.com>, 
	"acme@kernel.org" <acme@kernel.org>, "afaerber@suse.de" <afaerber@suse.de>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 11:44=E2=80=AFAM Falcon, Thomas <thomas.falcon@intel=
.com> wrote:
>
> On Wed, 2025-02-05 at 09:31 -0800, Ian Rogers wrote:
> > Update the Intel vendor events to the latest.
> > Update the metrics to TMA 5.01.
> > Add Arrowlake and Clearwaterforest support.
> > Add metrics for LNL and GNR.
> > Address IIO uncore issue spotted on EMR, GRR, GNR, SPR and SRF.
> >
> > The perf json was generated using the script:
> > https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
> > with the generated json being in:
> > https://github.com/intel/perfmon/tree/main/scripts/perf
> >
> > Thanks to Perry Taylor <perry.taylor@intel.com>, Caleb Biggers
> > <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>,
> > Weilin Wang <weilin.wang@intel.com>, Kan Liang
> > <kan.liang@linux.intel.com> and Thomas Falcon
> > <thomas.falcon@intel.com> for helping get this patch series together.
> >
> > v5: Remove Valkyrie metrics mistakenly added on atom. Ensure "perf
> > all
> >     metrics test" doesn't skip for missing events.
> > v4: Fix TSC events on hybrid mistakenly specifying the core PMU
> >     inhibiting the use of the msr PMU.
> > v3: Fixes for hybrid metrics that were missing PMU. Update to the
> >     latest events.
> > v2: Fix hybrid and Co-authored-by tag issues reported by
> >     Arnaldo. Updates to Lunarlake and Meteorlake events. Addition of
> >     Clearwaterforest.
> >
>
> Thanks, I'm seeing some errors during the perf all metrics test:
>
> Metric 'tma_info_system_cpus_utilized' not printed in:
> event syntax error: '{cpu_core/TSC,metric-
> id=3Dcpu_core!3TSC!3/,cpu_core/CPU_CL..'
>                       \___ Bad event or PMU
>
> Unable to find PMU or event on a PMU of 'cpu_core'
>
> event syntax error: '{cpu_core/TSC,metric-
> id=3Dcpu_core!3TSC!3/,cpu_core/CPU_CL..'
>                                \___ unknown term 'TSC' for pmu
> 'cpu_core'
>
> valid terms:
> event,pc,edge,offcore_rsp,ldlat,inv,umask,frontend,cmask,config,config1
> ,config2,config3,name,period,percore,metric-id
>
> event syntax error: '{cpu_core/TSC,metric-
> id=3Dcpu_core!3TSC!3/,cpu_core/CPU_CL..'
>                                \___ unknown term 'TSC' for pmu
> 'cpu_core'
>
> valid terms:
> event,pc,edge,offcore_rsp,ldlat,inv,umask,frontend,cmask,config,config1
> ,config2,config3,name,period,percore,metric-id
>
> There are all some errors like this,
>
> Testing tma_cisc
> Metric contains missing events
> Cannot resolve IDs for tma_cisc: cpu_atom@TOPDOWN_FE_BOUND.CISC@ / (5 *
> cpu_atom@CPU_CLK_UNHALTED.CORE@)
>

Thanks, I forgot to reapply the TSC fix. You can do it with
$ find tools/perf/pmu-events/arch/x86 -type f -exec sed -i
's/cpu_core@TSC@/TSC/g' {} \;
I can't eyeball this later missing events problem. What model type
does it happen on?

Thanks,
Ian
