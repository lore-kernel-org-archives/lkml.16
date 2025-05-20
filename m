Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439041D90C8
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747711184; cv=none; b=LBtgj+GCp6s0CQOCYF3rrNRWJb0w1rjEWdV7RWXBr+wuBirwk6oRh9ervYoBWvlNkLa1BLnxm8fjSJ2WbUW+1QSYQqJb/bCyd3+GqLjgPGCxpce8HHetGcCV2xo6QguGdwCoD9JlbnHYdEVTa/j1VHfQ6bpRuleNEwOc3Xix7A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747711184; c=relaxed/simple;
	bh=NDPpV1xvpyuZxHMe0p10Oi9N+7ASFh/SDwtJ1hhLYeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7S77HOX7v8iDbMCPVWf2eyjMdLuTm/36Iyfed9zq3lKOjrUWG/oZvUPN9k9rpMesiUpvltC5UVjupcDxbOztr8EnhgWyHqhLth3PlKIsDGPyqRW4lo13xsIVGZU8JGnSkKKMv2x/U1yobGE0iHCo4zYashyX0Ww8Fx7QLMDl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g0NoqhUn; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g0NoqhUn"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-48b7747f881so851061cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747711182; x=1748315982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VGauyFOCMgAWhV/W7j3JC1R4Th1f9X6u3MqqBt70+s=;
        b=g0NoqhUngdTRiiAkwnilhGRVAx7Phi/Qv9OFhhOMhuHuOlcHGX2jrJGwOYrt7P421U
         kyVm1AZGYkqwqyZk6iGVgdkPPS69GVVp8FviB+P56P5LgtLxsfpicVi65Xskai2Z6ort
         agYFotIuWamY5E56wGEBAtZw61osv1JpOHMxkxHRSh/2NvsZT53TR5i9zJuPki1B66hq
         LpxDSRqamNdpl/bhKD5uluEEeS8XoESF4wGm+Pca7kEZDqXjhtTTgn27cP/P7GKHidbp
         a+zEg2dRyI5I0RRawx96HrrxgQgY37YVq9zvN5Ex2p2A73jhql/bHlnEN+Khhz0lJNbn
         AfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747711182; x=1748315982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VGauyFOCMgAWhV/W7j3JC1R4Th1f9X6u3MqqBt70+s=;
        b=XD4d+nkd8qjz1whht1z5bCJmQafsPgiUe/nTWmCLnA7FTrz5jOlSyR5t8j0XiPRvX+
         KyG+z/1UwTwcHiAHPcgvQUteF1OsCaSasmO5M9DBO9uE/glaEmzZv8VSreZ6SmPt67ww
         TNXcCThep+B3tAMOjZBbJqHJuKeziMh6lg0uJgZN/WadIeQEke7put5HVuFxSNT1x/LT
         1WlhhSLf2IKP+g9uSivcc2eme811VLVjPY3z/P1QlnWG715PHd2R5KDtZ/ImK8nsTG1j
         iUbd3JpZCszjf5Rl3yqGNywEVdX9dY2t2udXNpeapk4rMeRu+/2UE5N/f76hipewfbDc
         HuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAzE9bCCnniquQnvmom6rmCYQ0UZz80OcTfQvrUbglcETsAo7xSGRXdxJAdG/2MNUWyGOUye4GL+ZFRb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuVBKlEcUQDKROxGR3t3Eg7u0p3pgdgUWApGgIrLCH7IpWrpre
	hNo8ch5hdnHcIprRhfg6i8N35v6I7ZWYNORqxGHPj+lFl34LNesevm0K+7JuhaTwgbHjsYCBN2W
	B30Rj3fxCPKCxiO/yvBboj6u29sFnQIsx1b4SoKHc
X-Gm-Gg: ASbGnctd9VrJDroo3Pu0f1KXB1WnPCsFBE2qPNHFYkgPf22Zjzlvn+06Y6Ua6MMJQ10
	MRTnhSDxt8f+hYOFfmOHPekXVXditYHDzOI6zKv15k8go7CKbJQQxUzuPVH5mLiT43hFU0qguD7
	PdAWq3umeEWUMgUDxqyj3XkhHM/U7bJDcV/sBBZ4FwNQ==
X-Google-Smtp-Source: AGHT+IELLH4JpHLhpKxY3tQYC8FVfzVS2kqKQfXnDSC7er1tvpq61D5fA6upHVA64U8+LafOJgYYdmIlh11hFLGBGC8=
X-Received: by 2002:ac8:5a08:0:b0:47d:4e8a:97f0 with SMTP id
 d75a77b69052e-4960136a0a5mr8641821cf.29.1747711181704; Mon, 19 May 2025
 20:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250519155145.8378a397a755c1cc5a3e2d4e@linux-foundation.org>
 <CAJuCfpGgwkAVZJJ-ffLdkBfmggm3=d+Z450matW=TzeQZJ=LDQ@mail.gmail.com> <20250519172132.c46b910bc10857c706866357@linux-foundation.org>
In-Reply-To: <20250519172132.c46b910bc10857c706866357@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 19 May 2025 20:19:30 -0700
X-Gm-Features: AX0GCFuqHoqawVHSUaBVZiij8BVnGoTTfac-et9p6bCnpwkiQGBflm_UZad3Dk0
Message-ID: <CAJuCfpGAVwRxCA-fdmH_MxD47CPdBD5iFGgEhHpqLAcfLMUX1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] alloc_tag: allocate percpu counters for module tags dynamically
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, 00107082@163.com, dennis@kernel.org, 
	tj@kernel.org, cl@gentwo.org, pasha.tatashin@soleen.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:21=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 19 May 2025 16:13:28 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > > > Fixes: 0db6f8d7820a ("alloc_tag: load module tags into separate con=
tiguous memory")
> > > > Reported-by: David Wang <00107082@163.com>
> > > > Closes: https://lore.kernel.org/all/20250516131246.6244-1-00107082@=
163.com/
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  include/linux/alloc_tag.h | 12 ++++++
> > > >  include/linux/codetag.h   |  8 ++--
> > > >  include/linux/percpu.h    |  4 --
> > > >  lib/alloc_tag.c           | 87 +++++++++++++++++++++++++++++++----=
----
> > > >  lib/codetag.c             |  5 ++-
> > > >  5 files changed, 88 insertions(+), 28 deletions(-)
> > >
> > > Should we backport this fix into -stable kernels?  I'm thinking yes.
> >
> > Yes, I should have CC'ed stable. The patch this one is fixing was
> > first introduced in 6.13. I just tried and it applies cleanly to
> > stable linux-6.13.y and linux-6.14.y.
> > Should I forward this email to stable or send a separate patch to them?
>
> I added cc:stable to the mm.git copy so all is OK.  That's the usual
> workflow.

Perfect. Thanks!
