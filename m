Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23B3634EC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070192; cv=none; b=VGqcPcqiA9JJTV1O6LnPuOKEkv5ro70zUmz7HvReAf7HzvTZDSIcFkyC9nId6yUC85r5a7QW3dAw7Q/xhPKxkpaaHEWAK9EUzUw/YxmDjRHLZrx+qTzibNLuacKpDjBaAPvqtbU3sxFgSHUDUzQ7vrfJzqZ5RHvtmMlwGcT0dOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070192; c=relaxed/simple;
	bh=IldT77fwND7Ks+Y1xtNvd9SpM5eG3FVb6ZLEyILfmjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNALA61R2GGASfzwVs5/e0BU4cKMX/LSFes1Tp/IREVI8naG8leHxAYYUlUcmdsanUi8gL7sa8QKNJjW+4HUVOxDQy+xNGbDLSQQL7aSNl4OGX1pLF10zw01/TMiGAp5L7hZeudUXY9UNaZhaSHmCqBabUSJn3H6U31eEgBq+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=FmY/jjIC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="FmY/jjIC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5771323e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1747070189; x=1747674989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGww0DZuhWCqnq9CydvYXETjwB0X/QKTp4W4lyBf4lE=;
        b=FmY/jjIC6fgyZfi8sdax1rr9XK7OmYTb/oKJJrsiEw2MpxTCT57kEBJwBBU3O98iGQ
         e95p5ekHa2XuCpq1uLCA9UJ0nfg5GhZJIrb1dudfE2lZeZxii7wnrpGxFAibDZTOPfW+
         pJs93RCmXA5eR4Gj9ME0larW4ElzBGLx9DV3Yzlmk090sTsRgrBD/crL7IU9LOdsldA6
         qs/yhIUy04gIZKS/RpfZ6Q4aqbR9sKqJXqmC9SqJTR/zQq24gp70eBqvPq9SUYvenGOi
         4s9yOu37cBzOa8vJ5GzUA98soQTiEhJiygWqN5/DC2QwoQtVKI4RHcvTPGvOLjpOvaWD
         tvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070189; x=1747674989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGww0DZuhWCqnq9CydvYXETjwB0X/QKTp4W4lyBf4lE=;
        b=isIcSAXXCoenKOmw9E/JzgSBQ26NvaUnjm0Qu6KVPXZErGgVYI8/vInVhco16FUsJL
         Jh/xeyfzv2HKhHQWfzfApNxq85sdi1DGW7EIFwxK3fVY7d1WyJ08F19K4SbsPnlAOV3c
         5UOWE+LXDHNwRBQaxdpENIglqbPr3FulwoS5N8Uw6MevIlx5Pl6Cn8mYIODKoYIza+3D
         xkS9c1ZwULbO4scNuvT51Zm9e711RwSYrVasOEN6zLJR/W1mV9/79/oIr0yIscfuf91q
         VGAqPpCJM34XtuYmkgDliveygMbYtkdHnTryCF+YfR4iopznVNYFVN3LUrMO2PInbW0i
         oqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDCb2UhfpxSZU0WEDOIN1rRetvT0RCAWO1Zxp8BPTfbFcJkslN5x3rYjnlJQHMWQNE8ngLFddhdHW6RM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTwI6EqNOREMoVY2xjDracupiTgJ4j44xJXpnSWpoO47IramXA
	bpmdBiT3Ys+Gxw00cQhEjy3yAUMCYQKAA0h5IafHZFj3SQINEjVRI8wv8SoQGbPG2kxTnzsUMzS
	HoYdDOfGhI8jy4Ruf/+Pgbbgf395VZAoqTvni
X-Gm-Gg: ASbGnctyQAh1NrUUpIC770+aKf8HV/Me3MZFP+GZh6/Hpc5iZfoZOdOexJWSiwXto9k
	oJkNwoG753tQ46CQFUpBFWpOrzju8UUvSZv6zo3S1r3dYu+faOOX23M/gLqJTBhmusf1diUGjFA
	vmhkC3xvTnTJUm4zgYENZ6nUrgdCqFqjOv
X-Google-Smtp-Source: AGHT+IHlJVQG5UMOoL4tD4FLu5PuxI6RtZgjMGaPXzas/B4OigGM6d1JSuYVJbI0UsuUYZozS0Vz44SVFFp5Y5gzvHc=
X-Received: by 2002:a05:6512:6506:b0:54d:662b:c8a9 with SMTP id
 2adb3069b0e04-54fc67cab88mr3672457e87.25.1747070188407; Mon, 12 May 2025
 10:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local> <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
 <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com> <aCIZqV6mEQZftFvA@x1.local>
In-Reply-To: <aCIZqV6mEQZftFvA@x1.local>
From: Kyle Huey <me@kylehuey.com>
Date: Mon, 12 May 2025 10:16:12 -0700
X-Gm-Features: AX0GCFsXpkeL1OAfWn1bHHWW3jMRJSh-9wyV2HLz-ft10oY0FXN7UplOE0NGavs
Message-ID: <CAP045Ao-onmzcVSic+4D+aDc_M9HTF7UK3NAdC5BcZvDmN370g@mail.gmail.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm@kvack.org, criu@lists.linux.dev, 
	"Robert O'Callahan" <robert@ocallahan.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 8:54=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote:
>
> On Sun, May 11, 2025 at 08:06:03PM -0700, Kyle Huey wrote:
> > On Mon, May 5, 2025 at 3:15=E2=80=AFPM Kyle Huey <me@kylehuey.com> wrot=
e:
> > >
> > > On Mon, May 5, 2025 at 1:05=E2=80=AFPM Peter Xu <peterx@redhat.com> w=
rote:
> > > >
> > > > Hi, Kyle,
> > > >
> > > > On Mon, May 05, 2025 at 09:37:01AM -0700, Kyle Huey wrote:
> > > > > tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does no=
t add
> > > > > the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
> > > > > thoughts/objections?
> > > > >
> > > > > The kernel has a "soft-dirty" bit on ptes which tracks if they've=
 been
> > > > > written to since the last time /proc/pid/clear_refs was used to c=
lear
> > > > > the soft-dirty bit. CRIU uses this to track which pages have been
> > > > > modified since a previous checkpoint and reduce the size of the
> > > > > checkpoints taken. I would like to use this in my debugger[0] to =
track
> > > > > which pages a program function dirties when that function is invo=
ked
> > > > > from the debugger.
> > > > >
> > > > > However, the runtime environment for this function is rather unus=
ual.
> > > > > In my debugger, the process being debugged doesn't actually exist
> > > > > while it's being debugged. Instead, we have a database of all pro=
gram
> > > > > state (including registers and memory values) from when the proce=
ss
> > > > > was executed. It's in some sense a giant core dump that spans mul=
tiple
> > > > > points in time. To execute a program function from the debugger w=
e
> > > > > rematerialize the program state at the desired point in time from=
 our
> > > > > database.
> > > > >
> > > > > For performance reasons, we fill in the memory lazily[1] via
> > > > > userfaultfd. This makes it difficult to use the soft-dirty bit to
> > > > > track the writes the function triggers, because UFFDIO_COPY (and
> > > > > friends) mark every page they touch as soft-dirty. Because we hav=
e the
> > > > > canonical source of truth for the pages we materialize via UFFDIO=
_COPY
> > > > > we're only interested in what happens after the userfaultfd opera=
tion.
> > > > >
> > > > > Clearing the soft-dirty bit is complicated by two things:
> > > > > 1. There's no way to clear the soft-dirty bit on a single pte, so
> > > > > instead we have to clear the soft-dirty bits for the entire proce=
ss.
> > > > > That requires us to process all the soft-dirty bits on every othe=
r pte
> > > > > immediately to avoid data loss.
> > > > > 2. We need to clear the soft-dirty bits after the userfaultfd
> > > > > operation, but in order to avoid racing with the task that trigge=
red
> > > > > the page fault we have to do a non-waking copy, then clear the bi=
ts,
> > > > > and then separately wake up the task.
> > > > >
> > > > > To work around all of this, we currently have a 4 step process:
> > > > > 1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
> > > > > 2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
> > > > > 3. Write to /proc/pid/clear_refs to clear soft-dirty bits across =
the process.
> > > > > 4. Do a UFFDIO_WAKE.
> > > > >
> > > > > The overhead of all of this (particularly step 1) is a millisecon=
d or
> > > > > two *per page* that we lazily materialize, and while that's not
> > > > > crippling for our purposes, it is rather undesirable. What I woul=
d
> > > > > like to have instead is a UFFDIO_COPY mode that leaves the soft-d=
irty
> > > > > bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we cl=
ear
> > > > > all the soft-dirty bits once after setting up all the mmaps in th=
e
> > > > > process the relevant ptes would then "just do the right thing" fr=
om
> > > > > our perspective.
> > > > >
> > > > > But I do want to get some feedback on this before I spend time wr=
iting
> > > > > any code. Is there a reason not to do this? Or an alternate way t=
o
> > > > > achieve the same goal?
> > > >
> > > > Have you looked at the wr-protect mode, and UFFDIO_COPY_MODE_WP for=
 _COPY?
> > > >
> > > > If sync fault is a perf concern for frequent writes, just to mentio=
n at
> > > > least latest Linux also supports async tracking (UFFD_FEATURE_WP_AS=
YNC),
> > > > which is almost exactly soft dirty bits to me, though it solves a f=
ew
> > > > issues it has on e.g. false positives over vma merging and swapping=
, or
> > > > like you said missing of finer granule reset mechanisms.
> > > >
> > > > Maybe you also want to have a look at the pagemap ioctl introduced =
some
> > > > time ago ("Pagemap Scan IOCTL", which, IIRC was trying to use uffd-=
wp in
> > > > soft-dirty-like way):
> > > >
> > > > https://www.kernel.org/doc/Documentation/admin-guide/mm/pagemap.rst
> > >
> > >
> > > Thanks. This is all very helpful and I think I can construct what I
> > > need out of these building blocks.
> > >
> > > - Kyle
> >
> > That works like a charm, thanks.
> >
> > The only problem I ran into is that the man page for userfaultfd(2)
> > claims there's a handshake pattern where you can call UFFDIO_API
> > twice, once with 0 to enumerate all supported features, and then again
> > with the feature mask you want to initialize the API. In reality the
> > API only permits a single UFFDIO_API call because of the internal
> > UFFD_FEATURE_INITIALIZED flag, so doing this handshake requires
> > creating a sacrificial fd.
>
> This is true, almost all apps I'm aware that are using userfaultfd needs
> that.  It's indeed confusing.
>
> >
> > If the man page is not just totally wrong then this may have been an
> > unintentional regression from 22e5fe2a2a279.
>
> IMHO 22e5fe2a2a279 was correct, and it fixed a possible race due to
> ctx->state before. The new cmpxchg() plus the INITIALIZED flag should avo=
id
> the race.
>
> In this case it should be the man page that was wrong since this commit o=
f
> man page, afaict:
>
> commit a252b3345f5b0a4ecafa7d4fb1ac73cb4fd4877f (HEAD)
> Author: Axel Rasmussen <axelrasmussen@google.com>
> Date:   Tue Oct 3 12:45:43 2023 -0700
>
>     ioctl_userfaultfd.2: Describe two-step feature handshake
>
> I'll see if Axel / Mike / Andrea has any comment, otherwise I'll propose =
a
> patch to fix the man-pages and state the fact (that we need a sacrificial
> fd).
>
> Maybe I should really add the UFFDIO_FEATURES ioctl to allow fetching the
> feature flags from kernel separately, considering how much trouble we've
> hit with this whole thing..

Personally I don't think it's a real issue to have to create a
sacrificial fd once at process initialization to see what features are
available. I wouldn't have even said anything if the man page hadn't
explicitly told me there was another way.

- Kyle

> Thanks,
>
> --
> Peter Xu
>
