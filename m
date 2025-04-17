Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F55322B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849485; cv=none; b=HUd6QyE0rWOTyj5eeugxjIQu/JBvLqQAeG79/5CLLdQk815ngb+ZNgZ50HNhRd7CZnoSFQt/Bjw7RMljbeDbEevKRdXnjxl5PvBUJYQuZ8U8prQmPw48gs4SohEimF/vjdafYGxPh1js8jMU0Pjc586/mepTRDh3D9uwP7pyXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849485; c=relaxed/simple;
	bh=gDlhwoMZsR3n345HCPdKj6pCV8/BMp4W3zn0IkrIVI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/WnrsQIQA061rPbKvUTPUSkd6oLS+1wHkgL0f5VNWWa7eTT+LgtA6YaarjlO2DQcQbqf5UKSv0a0eGfI7CQbirn4BX74iJeK21hREjqcVVG7ZBM6YapRc9NsMeasVRAZbFnOxnNcLiS0vmFKMy6tBDa+0iqDp0IPaGEAh0AEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kQjhVSor; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kQjhVSor"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30de488cf81so1837451fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744849481; x=1745454281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlhwoMZsR3n345HCPdKj6pCV8/BMp4W3zn0IkrIVI0=;
        b=kQjhVSoreN8LDeW27HF3t6AyRAf4rw4FovafU/SY2/Z2iMVZj33Fa2lvPOAYQMTAnG
         Kyjj3Qxj1u4TcDIJpkOfoNboAosgcW9oGtwlXewz2KImtqBYrSXlR5ci6wlfWBiDUDbu
         hLPkxX5TYQPtP8Qu72CQyPpycQCZzYXBxItJBpG2sKDxlBRRwv8MIo2oxc4rAPqnFyhg
         R1Pnu+zluLFgF7t3u5nc/qaEaMo6rJaSg8zI3Pr5HMZxrKgYY8NRzxzQA1TtNbTxyBVI
         vS0uLkXb/Uk+xWrDs3ormm1aBJUcNEUvDW/XXzfxNwhuO6T+xDnmERThoDf7tCBZ6qor
         7wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849481; x=1745454281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlhwoMZsR3n345HCPdKj6pCV8/BMp4W3zn0IkrIVI0=;
        b=m5NgpmCK50IXj9ji6F2sc6uMXAaqBc7Tb2cCi15lpENgBBjhc+UrL2cX+5DMB3Rf71
         h3UPiIdoMvWjJ67KrP7RbdXIbEYXGpQYV6qUTBqm9b4yRQLfAO3uv5dJH3TLh08Bclg1
         uzFgbVJcoxNfANI/7s3Z3oUMJnKcnWYPaiHdKk4Ul/j3fgpXZALZ+khR0WALJu2360fq
         tVkUw9wBzZIg8BGj9EVeFE9lgm8UtI7OFVsIo5BJy53Gj0ewW2D3Mj68cueH/iE2DrA8
         d0MIv36XEws66kqNeQB9poK7MJFzbN3LoDhI51VJSNSZtrbYQsJjg9ZMLRKRLzDoQiqa
         vo/g==
X-Gm-Message-State: AOJu0YzOHjvrGPz6Px1fCjRXReT12sazlfWKFfczq/Jz+xXSM3Adt2+L
	kFSWakqHsguhUlG4TM8Hz/897O4HrT7ElRO2nYJWenvKxZf/gncvri8ZqKX0QYKJGtZIYRAWA7g
	tgrcLUcbTofgsORcqqOabKtsD7uuKhhqmiIo=
X-Gm-Gg: ASbGncs7zyVKvyepGM/BqtfZlwg/RsSMi/qIhnVckqIgS/pI7NwJ8qk29MkYEVSyzcC
	zLEz2zjIuSx+lh6iboaX4D27K0ApsdmGdd6JGkpoKL4pdHJ0s2ebnDLb9oS2W4c6KXaNwcWhyQm
	Uivnn8zITz/rtTobTmLfRm6kX6usQF+lstFh7U+QXNgtHkR8W8P8eunRzoQhlc/g==
X-Google-Smtp-Source: AGHT+IGUa5WzYadKr0dNAx/bT6l/R6iXVDY1Prf0SemkzvoSeQd2rUu1sMbnQLShOhS+0NxDOP2U7b6Mv+ZNNcQnwVM=
X-Received: by 2002:a2e:a98a:0:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-3107f718b86mr15125171fa.25.1744849481194; Wed, 16 Apr 2025
 17:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com> <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
In-Reply-To: <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 16 Apr 2025 17:24:29 -0700
X-Gm-Features: ATxdqUH8AF17o7TeKCGEb7f9EgPKnfxTrvKl2aaI6JmJiain2Zth9bFMnsGbf0k
Message-ID: <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:23=E2=80=AFPM John Stultz <jstultz@google.com> wr=
ote:
>
> On Thu, Apr 10, 2025 at 2:51=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
> >
> > Hi John:
> > Thank you for your feedback.
> >
> > On Thu, Apr 10, 2025 at 10:41=E2=80=AFAM John Stultz <jstultz@google.co=
m> wrote:
> > >
> > > Unfortunately this patch crashes pretty quickly in my testing. The
> > > first issue was proxy_needs_return() calls deactivate_task() w/
> > > DEQUEUE_NOCLOCK, which causes warnings when the update_rq_clock()
> > > hasn't been called. Preserving the update_rq_clock() line before
> > > checking proxy_needs_return() avoided that issue, but then I saw hang=
s
> > > during bootup, which I suspect is due to us shortcutting over the
> > > sched_delayed case.
> ...
> > This patch worked correctly on my QEMU-based test platform, it seems
> > our testing methods might differ. Could you please share the details
> > of your testing environment and methodology? I=E2=80=99ll try to replic=
ate the
> > issue using the same approach.
>
> Usually I boot qemu with 64 cores, and have found stress testing
> running the following separate programs frequently uncovers issues:

Oh, also I enable locktorture and boot with:
"torture.random_shuffle=3D1 locktorture.writer_fifo=3D1
locktorture.torture_type=3Dmutex_lock locktorture.nested_locks=3D8
locktorture.rt_boost=3D1 locktorture.rt_boost_factor=3D50
locktorture.stutter=3D0 "

thanks
-john
