Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2821B908
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392915; cv=none; b=IVfM/3NTgI3y0akniPJE6Q6VILRu83S+DZQzsuyQCwNWv2HC4Q1ZQV8hyOhZ4xUbo8yIZjh8kcG9Cb1guQF9UH3yOoS0D8vM0PJdZuw9SygPurJubtW80f01IrZrJgW7Ta+gHzDfV0j5EZ7JsxqmZe4L33K1IkFswK9/PuIBRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392915; c=relaxed/simple;
	bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U+JI5NMOq0CJ9hn5V7tuf85dr3Fzrrll2Y+/wiZ0E8ebEavrWC8vd7DMd+UZDi+UAEHqGrnBALfkcLbYZh15aMZqc/5epbivACgu3YtPlPPz2HMHqYyZs57vN74f0G26XmIvXCNNSDsDCnmkp7xQSF9eyP8TQvG4Y2hlItR7/jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MjLSlTVZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MjLSlTVZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240aad70f2so17505ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744392909; x=1744997709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=;
        b=MjLSlTVZjYfLqKTf33/JtYchF8CUgF0UwEGkkv0JgwG/ap3v/DCXMCABtsxenEZRcX
         yNs20K5X1/pMnI/dMIhE9ZHz0gw3+8r2044zJmWF/rA+c3XSDNGiegIR8Z3MsV/CjET8
         F8io6HWMeqq52Z4T3HrXJP2NwZxKTIQjs6eVipzOgkHCZWcTbqZyEOLP8SAsGTtJBcV2
         OIV+aA6abwPo4+FUk8BWP5DA6nBZ/dnspeuKAVQf7P7mAMoSHE0+ae/OFJ7dgwdEnIwR
         GsIpzp1uMHozhtiWq3mKAJQ8DLasDh4Qe6rhw5SCABehigHy465d4r2tUwg8LJkDWHyZ
         vRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392909; x=1744997709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=;
        b=S//VBOKOIray9X9YqYcQfw+1tDA5jUNhI4X66p8/uzl75VGE6pmlL4KTQdW8GlsFX8
         /HWlsW3WiauzZeA12e5wYNJb7me3DZJLSHR+/6MpzpcZO5JFOd50UgAw1aMzk1TAWlK8
         7tkDdHnpdo+38bAdfjKBG+xR10MkbOrpCUT4GrkzC1Wnn2LJyOi4cZxOSTcqTJp/w7Gs
         g6jsk/gMQIhXEPpL0B4yXs9BsYR0zUD5jbC2aC5zxmGQqVJjRuX6oT2VSwHP7IeU28db
         MrRvmTO663LV2eMIoGxmUZ665IuiMiX0rKdtU37O4IlRaHziAgOOxVgA+5FxNIirWd1+
         VlFg==
X-Forwarded-Encrypted: i=1; AJvYcCX7g4Y+EA3rQI/kZu72IK3NywHpaSpiixLpN4h2LSJ0wqjRCGCAkriPdhzNZPwog4avkILMRLgjdkOur00=@vger.kernel.org
X-Gm-Message-State: AOJu0YykD7K79fxlLG7Mc9OeLQwtI8nMdVRWDbAmQgOAoN5iw75CDfCW
	Yz6nAvsljuTF+FvZk243F63/jdgQJ9D29TMajMCxH77T0XpR3yYhhrEgErqRfRjXe6vs64D0tju
	1yiXXUwrhtLoCseql2qm6wTvJgYOgrx9XxWeB
X-Gm-Gg: ASbGnct51Q4S2IaQdq8GYrpMGxjXAulT866wo9E9BhlysN5A+RiO86Og9LLSubuKysC
	NEPARcdVRnjQtwz42WjAGaOLE2vLXA8py+KATkmrzWt47GhVSx+Xl7H/hZTtL0LiSR3rdMb4Iec
	P9dFgKCzknVDz/c5ayQ+2vMRQ=
X-Google-Smtp-Source: AGHT+IFsqGb2NI4C998L4eRk5pxG9ZDV+EPyXU0sBnQYjqjaZsqLTIZPs5b8kewYg6GP32+Vd/vVcfo+p6pguFqbuOY=
X-Received: by 2002:a17:902:c40e:b0:216:21cb:2e06 with SMTP id
 d9443c01a7336-22bea920b31mr3043845ad.19.1744392908956; Fri, 11 Apr 2025
 10:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408171530.140858-1-mark.barnett@arm.com> <Z_ZcRiHTGljxEEdN@gmail.com>
 <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
In-Reply-To: <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 11 Apr 2025 10:34:56 -0700
X-Gm-Features: ATxdqUEZa_1pWKSod4wY40ZarBa-DN6S4qpDe5Ur1LE7Pb1ofS8DC8N_Fn09SwQ
Message-ID: <CAP-5=fUukVQMRHUQ9Mpx38H-7VNLt4mDj-jaYgn8Tf4zjecD-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] A mechanism for efficient support for per-function metrics
To: Mark Barnett <mark.barnett@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, ben.gainey@arm.com, 
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org, 
	james.clark@arm.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:08=E2=80=AFAM Mark Barnett <mark.barnett@arm.com>=
 wrote:
> Tool Integration
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> We've been using a python script to process the data into a report. We
> can look at implementing this directly in perf report, if that is
> required. However, I'm nervous about making the new feature the default
> behaviour for the tool.
>
> This feature has been integrated into our tools [1] for the last 12
> months, and has received a lot of testing on Arm Neoverse hardware.
> Other platforms have received less rigorous testing. In my opinion, more
> work would be needed to validate the PMU hardware & software
> characteristics of other architectures before this can be made the defaul=
t.

Hi Mark,

Wrt testing, in v6.14 we've fixed up the python scripting with perf a
bit more and there is an example that parses an event and then dumps
samples here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/tracepoint.py?h=3Dperf-tools-next
There is also the perf script integration for things like flame graphs:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/scripts/python/flamegraph.py?h=3Dperf-tools-next#n96

I don't think work should be gated on cleaning up perf report, top,
etc. which still needs clean up for things like hybrid events. As the
histograms should use the sample's period then I believe things should
just work in much the same way as leader sampling can work. It'd be
worth checking.

Thanks,
Ian
