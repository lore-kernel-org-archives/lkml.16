Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F221A42D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328578; cv=none; b=eERlIrE564dpkU5efRFKbIKqoWIeP85mTauWghzVtU2pMxawFqB4296hlL0TrDABo0lIhUPQ2/HkZHT+ZmVqro6R0U/6OXiQAE6DDYxvlO2UW4b6qJ3nXOHhI4fYeE0cj0EDas/pdRNXHJl3DxGseg69g0gHQqXvzFSiJ3rwHg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328578; c=relaxed/simple;
	bh=OGYwNu0jk1S3G/lLoWUkF5yx6pm23cVo7q8IIitvTz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDm/AjUWXM6y/gkyFSPbh9sBiUnzWG+XXDdOOuW5t2W7OCDcsVEhS2kf0DMv0kJFOFq+NU+NyPUl7CyYWxIyU3Ftg2SWAKB5E4jMxiHwCKzFCKVLjrKrRtrCP5IOK7rQM1464ZDe3Hsg4K/C5KdwC3zIsKIZKWE3VjvK5XiLABc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GnSuNQXx; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GnSuNQXx"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so11115ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747328576; x=1747933376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGYwNu0jk1S3G/lLoWUkF5yx6pm23cVo7q8IIitvTz0=;
        b=GnSuNQXxenm/7ClQAXtLqQedGykC32k3AnsWJF7jHVmX9+p2MRlb5fjSST+7eCUus9
         oDKDxXZzuPvbDN7EbvZTxnD9neGm9kUpf+UDAobRQuNeSnql7YRzj5QzkisYZrPy3GcZ
         Ol0z5s/473q+NICw8DRXlBqoP5FzGXvqViedLJm29vOsvU53aFdEiPuOEGKKGDAz7eob
         ShDRIX5ienyurE5EJxcQ5n6yBuPZFilLLSMbeUIbJbYvRWIRglHpBZSRMvlooG4dEUqP
         0ttZrZyV9YRJYdQZxIDZNZdGNTW46Sri1thr6gjPm+/Q1cxThmoCy9VY/e8o7I6bpBm5
         E0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328576; x=1747933376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGYwNu0jk1S3G/lLoWUkF5yx6pm23cVo7q8IIitvTz0=;
        b=GBNF6T5Z0BxpgenFAZU0Q4BLNzXuMohWsJoHbI1C+8FhvRqqSs8Z24qFRse3ua9MYC
         FGip9y3oh3Eu0utT+oX45Q2BP3l+DDCYuIIRpLF5Ee9iLthgGbXes0bScMgj0IB8pV2H
         eqgatgSrxSSupMy1hQf5DF4N++We7lIPAoNyVANE5YjAuot3plg1NvCyuxrlvOSR6E9M
         Ecy3loMf3J4G17aujTn2dwwmFxrdqhyzQfeaOepFkCObjhuwtHlXcO0msFOXWyV4RiNe
         JfHeRwl508StMOKYLJ/MFBp/yItJPHk6vzPNmnXRnus5TwWibFwKwCQ309CHn4sCkFJ1
         D/dg==
X-Forwarded-Encrypted: i=1; AJvYcCVfww6FEvykzkpaHLvqOGFm4I3RHrGYrPxfG4/LcJHVpB4mwsoXkoTOqx+t2gKgXJwNaY/f4LBC8bIH5i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeaLZ6hkozF7DOpfXy4T1OjlO5yWpSoWp1QHvOF3HIRzSyl4G
	nu/WzUW3q8Ugpx2fwLZjtVTR4wMzy1kQJAnm2e/YQaGKqnhLDiF0F2Z7LziKmUjxQrBKq5LhhFh
	Mhrdwfu7Ci52TpL1Trkh61JX/1FaElgpwbCxfR0Wf
X-Gm-Gg: ASbGncug4WFQ4LKTGcz4LPyrLuS0GeUqyKQKRHLBTOqPjQqEuPwtFPWFRKELYeyVP3x
	QX/uzmMuLMt8lt+UDsFV/Ndst/weJMLAl0D9j7bB0e1ostmmGVl1bTdg1KsN6XuLQQb38Zq5D2n
	l38HDqiEsW6DKqod+wXIt2FcYnDFyIBpmRnpnap16Wwu+pEN0sFPLVQ36R5Jzn/w==
X-Google-Smtp-Source: AGHT+IHxdfz0mUPuqpeQZwKMnEADRuicx+FbV97LYx8B8R1KseloBXxlGIrVN11rnuFNQv8xvQuSRFZkI6fQAr02/JE=
X-Received: by 2002:a05:6e02:3f05:b0:3a7:cd21:493f with SMTP id
 e9e14a558f8ab-3db780720edmr5332565ab.26.1747328575703; Thu, 15 May 2025
 10:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515043818.236807-1-irogers@google.com> <aCYTG12gSmv0OtXN@x1> <aCYTaveeziFiF3kw@x1>
In-Reply-To: <aCYTaveeziFiF3kw@x1>
From: Ian Rogers <irogers@google.com>
Date: Thu, 15 May 2025 10:02:44 -0700
X-Gm-Features: AX0GCFvL-RsYL31pl_fpwdtPF-hl9LiQ91_3-p-5OwxlTjO6Ww7GFCr4hdbUbWM
Message-ID: <CAP-5=fWBdCVSM_QLcLJ66g+LC0ykrJbZA6mQUsH_++xLormFzQ@mail.gmail.com>
Subject: Re: [PATCH v1] perf pmu intel: Adjust cpumaks for sub-NUMA clusters
 on graniterapids
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Weilin Wang <weilin.wang@intel.com>
Cc: Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 9:16=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Thu, May 15, 2025 at 01:15:26PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Wed, May 14, 2025 at 09:38:18PM -0700, Ian Rogers wrote:
> > > On graniterapids the cache home agent (CHA) and memory controller
> > > (IMC) PMUs all have their cpumask set to per-socket information. In
> > > order for per NUMA node aggregation to work correctly the PMUs cpumas=
k
> > > needs to be set to CPUs for the relevant sub-NUMA grouping.
> >
> > I'm blindly applying it as I can't test these changes, and I think this
> > is bad.
>
> In the end the only review/action I could do was to turn:
>
> Subject: Re: [PATCH v1] perf pmu intel: Adjust cpumaks for sub-NUMA clust=
ers
>
> Into:
>
> Subject: Re: [PATCH v1] perf pmu intel: Adjust cpumasks for sub-NUMA clus=
ters
>
> :-(
>
> Besides the build tests, etc.

It isn't the easiest to test. Let me add Weilin Wang on v3 as I think
she has a graniterapids and could hopefully provide a tested-by tag
:-)

Thanks,
Ian

> - Arnaldo
