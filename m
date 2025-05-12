Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81CF296D1A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070634; cv=none; b=hUgXwjJEdBe4yg+WT1gaGN6lniisK01Wqtb1UCHeMgTWMLEK/k5/wdjmPdg7bbgWeScLzhqS6E9IMJ3KTt7MjCgZAttXgrHCh2EPOswFAz1kZQhVfOMu9XN1uzUQN1Pel+LtX2Cmt+CIJ0Eow3xLcfyXDW3OohaO2lv8ilUJU9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070634; c=relaxed/simple;
	bh=fmY87/1sKSBJYEJaxkHq2LMm11Jc+VfeJwKi7MDyja8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCeAG+lf0UAGW+ZNRg5BCQmniQ77Dq5akGOg85fVqBz+5/5erNbGv/JAxHxj2UMgivjQbe6A5jmRNp0V95g3bqNKwpeUFZ9Y7CNeDZB8S3wT/IB1L4kdZdFk1OocTTLnQtXQ9AXbWO/GObLEe4F1iKI74uOvmRJeG8U+CVq2IM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=337BNEfQ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="337BNEfQ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so22235ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747070632; x=1747675432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZorMDSdxCLNoei7VK6kPI/fQjzAXqqiD5NEjjIAeuZ0=;
        b=337BNEfQa6NytiM+RY9GKgwT/X85yJu80OCVv2z41Cua25OQz4O0/CPUGBdoLFVUKn
         Mv2ODAAMFSFoJMYEsrLenj64cYHXlyx7I+a4Hv1VZegRLzZ3Iut3/1OIrQEgIxtvtzK9
         8KNaEJsPw+LnUqAvD31ZCpRyktDaaib7jbEzUj0KRwaykZ/dF9LFrjQ7teVGG+tIdyNj
         cvMA0I7Fk6clPTlv0knWqMYSqTlojHrzEUsqts0we+lEVTokPZSWY2iAde1R0R9vclZB
         1Hky9bLluXgbH8pzmk5EXGUnkvfAKUO8nSM2LnUhyroaru48RsxQaQw3sn5Eo1FW0p7K
         dNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070632; x=1747675432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZorMDSdxCLNoei7VK6kPI/fQjzAXqqiD5NEjjIAeuZ0=;
        b=Oc14/c1ZXj5dy4JJPMRoMBRsDjOtuWA4dmiaKi6/UdDZcM/P2VoG2/EGMIA+bM8dQu
         /cjUM+1n+kjYdyxg08teEFoOW534R/oOpJT8KD7S0gNvSs9bPlYQz9hUQ1Ic1xYRqVas
         2LFS4+wtsCz1sbXDyP7dU7bN4Oz6JKf+KezrdTu4J8iVkfz7Fb1d4f0UJL+4tHVIU7n8
         ZyyCplGZ7c9NILnl7ZjIzz1jZNo1BO6gfZJATZopt6zp1ySrYhHJADHRz8jKAtb2+t+t
         PTXuoDpRNdKyEfJ3q6NEfcBv5LSm074y1AoMknP1Pb/zhq8bvwjDX78lcQI1Z/vnPffZ
         scVg==
X-Forwarded-Encrypted: i=1; AJvYcCWd/ZJ1jLiBh/szL+OFow0QkQpIuXFoxs/U3qOwbaKw1WRscGK/AuB0eHsEfjWY2lFaMFFTONUSIhTVi7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwrTIL8dtrQF3bsdgHYrvHJK2sxxPANX2TYh3Eor1oa9oCt2T
	BtThA+sPd23G1iU/SP24z1QtqHDwgTNMamOoOsv2X2GOJVCUCoknKHlYpW5ojL90QoowAiNypDV
	5qhHg/HhZqlwGu1BIEZxyltbPfMoUY+fQxywM
X-Gm-Gg: ASbGncupJXEa35Q3a4Nk82BEDtkB8z1tWhI98oMY03lUpiItS55bmgaDyyFgH9Wpysl
	7DAF5g+Lpsweas/LNs7urs8sypnXxESHTlkaDjavQuthQ2WR7BGuYMBB7Evm3Xkl1Et5XglSL4D
	9filZ6wbjeYsaZq3+vUxlXs38VoPEJYfNsAh70xEtrqONNoG/ONghEmJcnExwCvw==
X-Google-Smtp-Source: AGHT+IEwkaoOmT0XT7gKUnkQ+2ormt40tJAccvez9SS9gKpe63m0op5hTvSJFmWSWh3spwSfwGyikLVKS3Pd/hKUiUI=
X-Received: by 2002:a05:6e02:1562:b0:3d9:2b3e:835b with SMTP id
 e9e14a558f8ab-3da8430d4e4mr5478165ab.25.1747070631555; Mon, 12 May 2025
 10:23:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512055748.479786-1-gautam@linux.ibm.com> <20250512055748.479786-5-gautam@linux.ibm.com>
In-Reply-To: <20250512055748.479786-5-gautam@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 May 2025 10:23:39 -0700
X-Gm-Features: AX0GCFtegycvYjK-gRwyRE3BGvqRYdmDJ-ze8hRyFhYRHprKCpMHIf371Xl0jNw
Message-ID: <CAP-5=fWb-=hCYmpg7U5N9C94EucQGTOS7YwR2-fo4ptOexzxyg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] perf python: Add counting.py as example for
 counting perf events
To: Gautam Menghani <gautam@linux.ibm.com>, namhyung@kernel.org, acme@kernel.org
Cc: peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 10:58=E2=80=AFPM Gautam Menghani <gautam@linux.ibm.=
com> wrote:
>
> Add counting.py - a python version of counting.c to demonstrate
> measuring and reading of counts for given perf events.
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Use existing iteration support instead of next
> 2. Read the counters on all cpus
> 3. Use existing helper functions
>
>  tools/perf/python/counting.py | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100755 tools/perf/python/counting.py
>
> diff --git a/tools/perf/python/counting.py b/tools/perf/python/counting.p=
y
> new file mode 100755
> index 000000000000..e535e3ae8bdf
> --- /dev/null
> +++ b/tools/perf/python/counting.py
> @@ -0,0 +1,34 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0
> +# -*- python -*-
> +# -*- coding: utf-8 -*-
> +
> +import perf
> +
> +def main():
> +        cpus =3D perf.cpu_map()
> +        thread_map =3D perf.thread_map(-1)
> +        evlist =3D perf.parse_events("cpu-clock,task-clock", cpus, threa=
d_map)

Thanks Gautam! I think this is really good. Perhaps the events could
be a command line option, but I can see why you want to keep this
similar to counting.c.

> +
> +        for ev in evlist:
> +            ev.read_format =3D perf.FORMAT_TOTAL_TIME_ENABLED | perf.FOR=
MAT_TOTAL_TIME_RUNNING
> +
> +        evlist.open()
> +        evlist.enable()
> +
> +        count =3D 100000
> +        while count > 0:
> +            count -=3D 1
> +
> +        evlist.disable()
> +
> +        for evsel in evlist:
> +            for cpu in cpus:
> +                for thread in range(len(thread_map)):

I kind of wish, for the reason of being intention revealing, this could jus=
t be:

for thread in thread_map:

I can see the problem though, the counts lack the thread_map and the
thread_map is needed to turn a thread back into an index. Perhaps when
the python counts is created we hold onto the evsel so that this is
possible. I also suspect that in the code:

for cpu in cpus:

The CPU number is being used rather than its index, which is a similar
story/problem.

Arnaldo, could you give some input on what to do wrt indices, threads
and CPUs at the API level? Perhaps we need a refactor and objects for
perf CPU and perf thread, similar to the use of struct perf_cpu in the
C code. The original API all pre-dates that change. The issue is that
changing the API could break existing scripts and we can only fix
those that ship with perf.

Thanks,
Ian

> +                    counts =3D evsel.read(cpu, thread)
> +                    print(f"For {evsel} val: {counts.val} enable: {count=
s.ena} run: {counts.run}")
> +
> +        evlist.close()
> +
> +if __name__ =3D=3D '__main__':
> +    main()
> --
> 2.49.0
>
