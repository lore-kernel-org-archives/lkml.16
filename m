Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C4F1EEE9
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738418648; cv=none; b=GNBYxDz0S/OBY/5XrGjrznyoNOQ01foGvaEhZm4g5UFQcSkEfXKtXUiiCq7WMEuE+H9t+0P94FVUO4/OZui70YLhS0opRarhJ+XsI4N6vREZgkIIVTochUtzeGsozLgzaawLkm5kQ6D8Dy36BfhBOP8kVZiOzQPKdS2F3J7cOQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738418648; c=relaxed/simple;
	bh=pBDfvTpyomtlAfkS2rgwAvGbV7tsunvLj/F3vGNcy1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aeh9fV240RLZ/UmULEOeGOWX7Lgou51Yp+pT9uWvI1sfIViwSspRpq16mauLTxQjp9WZeFOJjtyiuQPTtNlaWc39og8sDuR8QtEgfh1Ty2P0ZiDn4YrbMCnZeEb5y3VvfSkcB5KWsMbiw/MlVq2qkUETWLDEB8F3w8tRLx9CpoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZy3tnhY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZy3tnhY"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so4420951a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 06:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738418645; x=1739023445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN1jCbN4WfYnrmUEepmyonmaWx7vzJO9DusAVN5lnzo=;
        b=JZy3tnhYG93Yx3zOoF0nk2hnBN7IQvQjxxb4yMT17s7u46sEreUMn+EkFZ8x7SgxAt
         nSR18nij8lUBZuFrIQRNIOm9Np2q5rRuoSRPzD6tS4DU86lvqfT8niIZb470qJ7Fjl9M
         ihhM6aCXx1O04KpbC1DPAhCxbORHAvoeWjrh8jXYcsmFatKfurSRKPs1Tf1sNOqxinbu
         DaIeoqdCSraiNZFc2NRNW4LCxp5QpJcTBLWfH5GJ8qEI039t6UklRWe4PVvvRJ0uOGIz
         wEBvLrNNp2V1eKpVRNSERFXpfChhej9E4153w6jp0jpxaHt4Y5PlEA8WU66rXSVyBIxf
         yGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738418645; x=1739023445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN1jCbN4WfYnrmUEepmyonmaWx7vzJO9DusAVN5lnzo=;
        b=VmEjVUvbomzYU2Q3N/CK5OEoIuZ2JWF0ojmU1k+pGB2xahR2lg2XkO6hjJ/WWjVvlh
         xQC4o9HLwAumI86YsVar7/EatwRVZ0VyEfphqm+bob5Fifw4BtvhKFxEqLXTnSIinRw9
         FxJBAUL/rFItE0G3f3qLtW7mS7KvZxmGWXATe9BOt7K2P0Gq1cLRLzJJmuNqbKbEpmo7
         omUQsA02KqhsHY2IPOY4KZVSBmylabCVcSVGe6UuNM8IIgdbxGgc6oOEev1toXoehy7N
         QDQbUi6G+2b8DbMV0bh6/lmrQPgU8ECkloWWaO+N+XNUGPBTVWfE1yjwJjLU+R7mdams
         FAwg==
X-Forwarded-Encrypted: i=1; AJvYcCWvYtFcvX9Lc4GSRwR2jb+CrjCDT2mIQWBQjinu3eyPckPmbQ750c6lmZJXWLRXz7A8tTu/L1lN0uIjM+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywat3vTJPjZitw6xa1hbrADXDHmj6YvGGErR6c995VCDdoi1Ykr
	VHBrPLxgqYyuzlfkFg9lM/EihXVaiRFYdPQrQ5Fv7SlsCjFG+rxp/YHJrTqmE3N1mmls4Tb2ePn
	SZSttx8VRzoAkMC0Az0u0hmmzYAc=
X-Gm-Gg: ASbGncttvHrFSrB/MIolM7UWUfs3iWXl5ti7g4PpfEvevJ/Vhlvaw2AVrtqeuWsUe/1
	zN4xSnr+6wks1teWrWWnoQys5uruIuXRjfbBX+TSkoryRsw5Ca97gcTgS5DchTHWBPtKwOrXA
X-Google-Smtp-Source: AGHT+IGTgLaUfNVZ5sR+fAzB1ygg3IP1uVFBpiIoBCTVteCkdJ3szhkTxEmPR/yS0XzsgpGW2245XPOSO+RddAAz8Dg=
X-Received: by 2002:a05:6402:5106:b0:5d3:ce7f:ac05 with SMTP id
 4fb4d7f45d1cf-5dc5effb167mr14682348a12.31.1738418644402; Sat, 01 Feb 2025
 06:04:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128160743.3142544-1-mjguzik@gmail.com> <87ikpubt4c.fsf@email.froward.int.ebiederm.org>
 <CAGudoHHd3cE6+nyZY3wi5Xw5++uKiypR3qK_3=2XcGNocE4Vyw@mail.gmail.com> <8734gybmxv.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <8734gybmxv.fsf@email.froward.int.ebiederm.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Sat, 1 Feb 2025 15:03:52 +0100
X-Gm-Features: AWEUYZkSowoyLr3pO3SOxKCPculj5K6ekPTJ2Iwr5sHVxZIoBCJwSrDKB3Xph28
Message-ID: <CAGudoHGG6HRP5Cs4p0bHKApt1nTQFjX105Y5J=xmMUzybiCU+Q@mail.gmail.com>
Subject: Re: [PATCH v2] exit: perform randomness and pid work without tasklist_lock
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: brauner@kernel.org, oleg@redhat.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 12:09=E2=80=AFAM Eric W. Biederman <ebiederm@xmissio=
n.com> wrote:
>
> Mateusz Guzik <mjguzik@gmail.com> writes:
>
> > On Fri, Jan 31, 2025 at 9:56=E2=80=AFPM Eric W. Biederman <ebiederm@xmi=
ssion.com> wrote:
> >> Moving proc_flush_pid inside of tasklist_lock is a bad idea.
> >
> > The patch does not make such a change though.
> >
> > The call is still performed without the lock, but it also dodges the
> > additional refcount dance (and notably eliminates an atomic from an
> > area protected by tasklist_lock).
>
> My mistake I saw you had moved it up, but I had missed just how
> far.
>
> It is still a bad idea to move it early, as that has caused problems
> with lingering proc entries for reaped task clogging up the dcache.
>

I would argue the time window to find the about-to-be-whacked task is
not big, but this part is not important enough for me to push for it.
So I'm going to drop this bit for now.

> >> It is wrong that attach_pid/detach_pid can be performed without the
> >> tasklist_lock.  There are reasonable guarantees provided by the posix
> >> standard that the set of processes sent a signal is the set of
> >> processes at a point in time.  The tasklist_lock is how we provide
> >> those guarantees currently.
> >>
> >
> > I don't see anything calling these without the lock and neither my
> > patch nor a follow up about pids suggest anything of the sort.
>
> No.  You simply said fork called attach_pid without the lock and
> your description implied it was safe to call attach_pid/detach_pid
> without the lock.
>

Huh, indeed that's how it reads like. That's very poorly stated at best, my=
 bad.

The key was *allocating* a pid happens without the tasklist_lock (but
with pidmap_lock) and the part which gets rid of it (detach_pid ->
free_pid) operates under both.

As you can see the patch keeps detach_pid inside the
tasklist_lock-protected area.

> >> It is safe to move free_pid out of tasklist_lock.  I am not certain
> >> how sane it is.
> >>
> >
> > Where is the sanity problem here? AFAICS this just delays some wakeups
> > in the worst case.
>
> At the end of the day it might be a sensible way to go.  I just haven't
> found the arguments to convince my gut of that yet.  It is important for
> me at least to convince my gut because it usually notices problems
> before the rest of me does.
>

There is definitely no rush.

I'm going to cook v3 if only just for fun.
--=20
Mateusz Guzik <mjguzik gmail.com>
