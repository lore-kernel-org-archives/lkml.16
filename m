Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C048298CDC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070703; cv=none; b=sDjAX8N07A7ebFIuI3mRwq4Qq84NxELBzThocaU45iKSaS91bLRYnzCa+Esevg9FbtlpbbgMhEk+BWi4CFbu+tA/8Sjtq328bZCSLuVNN/oegNbHr9oqz7C6hHCs8RjYLFQuAhT8o1ixu9GOSswA62bG8fJ0PxH40PGMBQOIWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070703; c=relaxed/simple;
	bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIKZSV5nOBDbwQSqHn9RxvRRC8n33UbzDpoeDZlnhGtkXspficjKlC1gXM1CDW+VuJFKpYh++HqshqkLctGR6DOhGS93rsIfRP3cO3MNhthMwgwaZT0VqmNAxYzV18odernoXNpMkXMKmjBfMma9k5plOGneuGYT299E8FEMoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QL2l8BCu; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QL2l8BCu"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so284575ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070701; x=1750675501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=;
        b=QL2l8BCuuqGwweka0fNcZGQ5qz/9RCBbGooX/S6U1RIabI326JTQ5xK+3h6djPMSJq
         UT3zG4OgsvH+ZQzdoh5BNpK3oFAORbdbRPu/SIWo1aiBXT4TUPC/bVH+kTFVCD3Kk1Jl
         LU4SI78z25ymBzjV2cDW4J/lrLbh+fiTLsOCyfbXcXVleC0qQlxxYZCD9W5C45cg/kQZ
         CBxNSgIdg+moJRABEQPxJPKwqWoWy7iNC7k0KmzOozhqlHpxGiJoHIH85SdgTZ5tj//n
         iYFmVqSf3FvSFLONeW3dOXATl41GJbNZk+Mbl9CKTPvfr6wfxaI5q3SDLTYJR+DIe3UB
         h8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070701; x=1750675501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6R6SWEsvDm+66dPzlD87SecGN7m0uU0XfqGXWlTaok=;
        b=QmEtxrWKj5PVN0rZlYY+hDSzBfDK2VSq4ugJHzq66Qkx+HFvzXFCPf4DYMonkuE+DR
         rfosWyMAh7VSqeLxzV7OpLi+LvTzOY1Sg3yuMuSKr7b1d7iou9yjgTEk77RcTLtH3Gze
         0P7qQuhfyoO9fIeIKs5pnt6HPevrCtIri2i3TyeO1+8AR7hQsmVj24HTCp9UCSjXdoKi
         /Mnfo9E/iyGQCns5slTJSeZngvOGPmRt+0yf31lvRyNLJFNuqI+fmFDY4AC0MHhLsgxg
         BBmDCAt8PV9WM7XFH8b0fbmeUaQWZC4cv3sdms1UIjKO9KR4s8VIqpb342UAkIPbIn0l
         uy2w==
X-Forwarded-Encrypted: i=1; AJvYcCUPqfdCkfCdG/qyxxJjtMZGc3mR0itOQWQZ08DEXXjTkyBOiMasyPSwWramhssAb1eFQeDRYHtIz5Eg4Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFA/qOe3RBagQOaRt8GK7nxAXzRa/RcIqAD7uqYOhAa7mFMkjj
	Wx+FmCMPFHm4mlhdMJn+XkisdDSH/XiT/emJ+0Br/XPZkdl72yz8EySOzm/wBhQPD6thp6yDlQv
	x8XR42RTDLJK3Sp6hx77KB5X5Q+31ur/iineYqwbt
X-Gm-Gg: ASbGncvwsLD4Poc7sa71a8/aFn+uHQ9He/wV4Wcvl83YvpU7rcgiO04FceJ2iWFtGIj
	43i3fsRoXnUaR4U3Z2ZrdgRLjdcI9lv9QiPCKXFqRWAZX4/85CsKYk28RCJmHPCUy2kBUVVPodw
	7zI1LsavRvVIOFRn3q2BrO/ZLA2x27xyZbJBRbnGXiDOiz
X-Google-Smtp-Source: AGHT+IGZ5j8v3Ocn8ObEJWFaqu0zHRUBhHJbRBl19pWYIGlLXaQ5CvYChKdFLMs6JM1wUgSUPI1j2DL9dy/hVkqNSNo=
X-Received: by 2002:a05:6e02:1d9b:b0:3dd:a4b7:c737 with SMTP id
 e9e14a558f8ab-3de09fc2b9emr4525975ab.19.1750070701158; Mon, 16 Jun 2025
 03:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com> <20250616102945.GA17431@willie-the-truck>
In-Reply-To: <20250616102945.GA17431@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jun 2025 03:44:49 -0700
X-Gm-Features: AX0GCFsxy4AselWH-HXbNdNUVS0F-38THElPX6b9gGbKXhJTBrfP3qqVF_lXcMI
Message-ID: <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmail.co=
m> wrote:
> > >
> > > This series adds support for the CPU PMU in the older Apple A7-A11, T=
2
> > > SoCs. These PMUs may have a different event layout, less counters, or
> > > deliver their interrupts via IRQ instead of a FIQ. Since some of thos=
e
> > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> > > be enabled by the driver where applicable.
> > >
> > > Patch 1 adds the DT bindings.
> > > Patch 2-7 prepares the driver to allow adding support for those
> > > older SoCs.
> > > Patch 8-12 adds support for the older SoCs.
> > > Patch 13-21 are the DT changes.
> > >
> > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> >
> > Hi Nick,
> >
> > This is substantial work and it looks good to me. Do you know why
> > there's been little progress on landing these patches? Buggy Apple ARM
> > PMU support in the kernel has led to reworking the perf tool. It seems
> > best that we can have the best drivers possible.
>
> You reworked the perf tool to support these things? Why? These changes
> are targetting chips in old iPhones afaict (as opposed to "Apple Silicon"=
).
> I think that (a) most people don't particularly care about them and (b)
> they're not fully supported _anyway_ because of crazy stuff like [1].

I was meaning that we reworked the perf tool to work around the Apple
ARM PMU driver expecting to work as if it were an uncore rather than a
core PMU driver. More context here:
"[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5"
https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st=
/
But in general it would be nice Apple ARM PMU support were well loved.
I think we went 2 or 3 minor releases with the perf tool not working,
threats of substantial reverts to avoid the PMU driver bug being
exposed, etc.
As for which Apple ARM devices should have perf support, it seems the
more the merrier.

Thanks,
Ian

> Will
>
> [1] https://lore.kernel.org/r/20240909091425.16258-1-towinchenmi@gmail.co=
m
