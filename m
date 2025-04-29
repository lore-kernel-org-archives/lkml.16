Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046562522AA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951800; cv=none; b=IVdAoSBpcmcLAuwl3tmxwk6xYSoiPErAzD6Si8rNIzF4xwZWBuBFAvsOx86RCle4wq8YxV1vFRdGc7rma19kNrZkVtgWHRVrM9QaYrexg8MhoZ2/h/nfuBgqmVs4G3X0MNwHq0e1tGA+wpfuOSEj/Tv8kEgTJvY7FE4zs93kDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951800; c=relaxed/simple;
	bh=abzA/XVjpmjUY8onBOyr+GgbPaaV2g02TOvqi0n9jsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flwwCpmr6Klhhur80MJD13dNEaV8tsb38LNvRonhTCleJHD8f4qSE9pRNGhby59g4iQTgvdI1huAioVlqs2Y/awosYEMEen9O+E67hgbhGtk84Kcj7xj8JArlHN4gtd7sqHaNniKKn5Ewgd9Cg2CqiID8sUTSNvaOgbkDX/v5w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3PufDb7z; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3PufDb7z"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so60921226d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745951798; x=1746556598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5np/oOs1XRUBoFOxmCZiqOi6wfyrbfsGfKYIkl7k7kY=;
        b=3PufDb7zY4D0yJDY+tRoKp2taxr306OuSIOaoI/vypt3HnVpzXEiYh6b4z7olhLUG+
         bnePkbQTRKL4yPjcCwedf8YAlh8LjTR8w30y5im2jbv2/dwEl9ivkTIWVU+hyjWYwW7+
         2VqoQO9AASSh5hgRLTDilA22zvUQOR+/2itok8HQ1ETLmtuLRIwSOFzR7nWhhmt+CJN4
         TFZXbfe8833pqeKInU1NeP6UETMb0APVLsIrlYH95soTHfhjIOaegaew8Q9hThZO829n
         TEyg95PWole2EgeUkiuBPy1yIWY/mGrreSDcN3idElQ+hUNMmd1yDUhVYhj8v1RgkvfX
         Os4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951798; x=1746556598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5np/oOs1XRUBoFOxmCZiqOi6wfyrbfsGfKYIkl7k7kY=;
        b=UXf2m/VBnVFjSxoSRbvTIzbXr9VF1fAHnfj62g5JLxk34fl06wG9cs94nYl7MqU1vH
         hv82B8F5jwFge10A2dt9HIf7hE8vcW0Bz0nOZAMpZ5vUEZH5LqjXQH3GSCPHtMpjY2zX
         5xAXdgufd2XGv0XJZ0MribX7sjMcvKF7LMgfV/3tQ7Rrw4wh2w0sFB80A2fp5yHPHS5L
         Rx8D42BM5sZkDIH911k+fh2u6Tz2c6NjCE+fkoqPPkp2FTu62IGNekOdKEcV+aVrEThf
         mRlr7SvRylQscYiUpomgeQh+KnivLdfelaFLA2lRlKYv1rAkyh0IUbJn+Ik/pb27uMVB
         Nsyw==
X-Forwarded-Encrypted: i=1; AJvYcCUKYuMmQBqQ+psPajH4aI84XNvuhfBFax3hlI+BSIMEU4Hylbcgj72MCvObXILtnVxd2J+Z4SsMiUohJF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iGHqvSDtnKsRfzEX90hZQxuE9o2Kp5CrcK6EuOnMni/2CXj6
	a2O+sqmprBwowALscn7mX7sH4ncHqe6CZzCTt0oavwOjCT04u/Mc2py1afMrPaP7JY/5NPEPFHZ
	5AUPLnebKJeUUOK4L6MVLi/Bl+iB5EaYPFYw=
X-Gm-Gg: ASbGnct5Fhkx2aLHpGmjewmwNYu8x+9sfgRHllBwSgIz/OuXsVZdviAmLP6wdPsekTn
	q+bRXH0EJaSlzo4SmcPeG0UNAQf9SzDds0WWPjBwmI0cjN7jmGHpk+orYg53WVnf7rraeGadKVn
	wkKl+++7CHWQ/Tp53Iv7jm7CJ8Gjx9IqKNsyH4LC0Rt4J+259rGCk=
X-Google-Smtp-Source: AGHT+IFF8swP72nG4lQKBlVM5Y1RrJO2sYDULWr9zVQIckdm/edCPUl1Vq4zoRVK9wLWUikcBCkZ3nC58jTFPJYlu/o=
X-Received: by 2002:ad4:5f4a:0:b0:6f2:b094:430e with SMTP id
 6a1803df08f44-6f4fce9ecc5mr8329996d6.25.1745951797459; Tue, 29 Apr 2025
 11:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
 <20250428122408.GD551819@e132581.arm.com> <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
 <20250428130519.GF551819@e132581.arm.com>
In-Reply-To: <20250428130519.GF551819@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 29 Apr 2025 11:36:25 -0700
X-Gm-Features: ATxdqUHUwAMc9N8ZrnHzAyj9aeZXCcCnhFu4COUKOCLn1Fy0uWz79ytMhmxAXzA
Message-ID: <CALJ9ZPPKozzci07i7cqHckBA47gUodH0gymDwFPpW_MJdKWSbA@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 6:05=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Apr 28, 2025 at 01:55:29PM +0100, Mike Leach wrote:
>
> [...]
>
> > > > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > > > restore if currently in use.
> > >
> > > If TRBE PM is registered as a seperate PM notifier, a prominent issue=
 is
> > > it cannot promise the depedency between ETE and TRBE when execute CPU
> > > power management.  E.g., when entering CPU idle states, ETE should be
> > > disabled prior to switch off TRBE, otherwise, it might cause lockup
> > > issue in hardware.  If ETE and TRBE register PM notifier separately,
> > > we cannot ensure the sequence between ETE and TRBE, this is why we ne=
ed
> > > to do the operations based on CoreSight paths.
> > >
> >
> > I believe that the architecture requires that if the disabled TRBE
> > cannot receive trace then the ETE should regard the trace as having
> > been output (A1.4 ETE spec). Incorrect sequencing should only result
> > in missing trace, not a core lockup - unless the implementation is not
> > compliant.
>
I tried registering a separate CPU PM notifier for TRBE, but CPU hangs
persisted on Pixel 9, albeit less frequently. After switching to the curren=
t
patch, CPU hangs are no longer observed.

I see the line in ETE spec: While all trace outputs are disabled, the trace
unit considers any generated trace data as having been output.
Maybe the enable/disable order issue only happens on some CPU models
or SOCs?  From Android, I hope the coresight driver can solve this issue.
But I'm not sure if ARM has other suggestions.

> Thanks for clarification, Mike.
>
> I would prefer to stick with the CoreSight path approach, as this will
> help us to resolve the issue in a general way - not just for ETE / TRBE
> case, this would be applicable for other types of links and sinks.
>
In my experience, coresight funnels, ETFs, and ETRs don't lose context
with CPU low power state. So probably don't need to disable the whole
coresight path when entering CPU low power state. In Android, I have
a tight project schedule. So I hope this patch is not blocked by refactors.
And I want to backport the patch to previous Android kernel versions. A
fix before refactor is easier to backport.


> Thanks,
> Leo
