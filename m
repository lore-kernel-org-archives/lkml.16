Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA428033D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483318; cv=none; b=uN1dd3CowzRF5jU0Ao7z9egn313cbpKVt1a0Bipkmfs4RKGKFE1pAb27In3GGLzqQeNNR358CsaOp15+3KE1QzcEyu/0EEg/7sdCjpWyMjH6DA6lox2mPD5ldemx47sh9KUeaDOmBlagDmqgxHc6XL1iOH50p5dWvwfb9hCVFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483318; c=relaxed/simple;
	bh=CR+pLE1ztr65gg7kzvoU5YS0CTmgYB7fdUWiHfpbjWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNGp78COCZT5+AXC1iCW7iooKR3ybO3f1LSmcqbRavcYQ/EpP4r1TC04LXok7dgZ+gWdwlkI99SgMQAq9wDfxbDQxCjvI7ALEuK6xWYHEFUnC/F1LehTyqOQYnCrc+IMj2xsN0VPEE79e+GWtTBMpi8k/hXos3Pw2N+WnDzEDio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=e0Aubqhr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="e0Aubqhr"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso51412631fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1746483314; x=1747088114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ5eBrFfOmcah0yJB/jEfTuCEypZVE8gaZUWNHeUUC8=;
        b=e0Aubqhrbv9a11Pmxr/qel9m+sl+Sn1ztnLgts2XmmnRhb8LFB3mrgAI96Gn2xatXm
         soHR4zZG3eM8LJO0zucKfGSlT9L1ZfvEttigY7eGzSw5+BXaPVqCfVhz0P3S6u+7BgNi
         7tqhub+CX6W0oC5CwUCxpy/gNDtDyj8sQMAcuxmB2VarFPIDCN+GTERjEuWMe4gqJm1O
         FoDFRUOSuL7FlcdiQudmT+QepbO7OJrdkYh+v40fHtOcmIarYHge2ngtE/4/yXABhvE2
         CS3ZSsCTUBpLZxK/H53QbsZ4dlkidK16k8MHLa0EKjCq1bSRPKdTuEfUAh+yroKxvoei
         FU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746483314; x=1747088114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ5eBrFfOmcah0yJB/jEfTuCEypZVE8gaZUWNHeUUC8=;
        b=JF89wD8m8SdruwWUVQ8jubn6paYUazCVsGmVfqJ+JtfG8a48yytQbOPK2VOMse39Zn
         oNk/YA+1WmkUhtmXrErIfqZtRDqrvPAtn1oZIRbGJiTZjoh8B+3JImqssNXZX3FB4hru
         cQqmiWK5mRYE6T7SyIBGEX9JX/046WMas0Z30RCoeIVgXdDeuqXPDAIuVEkPqM51oJgx
         brUQ0YI3NIkP2HujuzYxvm/ONPOl+0DerCsMp9lpaVhantZhYJY1JliUXd29UCvoTzTU
         WyhiufTuRpyw93cwL/yL+6p86//xp8VwC9G2qFj7up8UefRdtBa/0eE0QHVucmzrwqWk
         jTVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Yfp5evjgWvDrfFM9sWrmR0mG6L24fnweTiR9gdpWGWs05V280b/WVSxnpI/bFZ6XoT3+07IAZN9raq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgeFI5/V7cdFZZ0IuiFQVm6xDah52f1a2UVvnhNLYRfA2PGtOZ
	+NDYiMbNR/6SWJYSElgUEYRXLUel8BpRPIvRQcAed2tkNo1ohsVD/YtSXyvDRrVQAhtwCgDYoYA
	AuPKpMqp7aDlYHRR+wa6esrueagh9Gpo4H81YCv2TEndLYkU=
X-Gm-Gg: ASbGncvS42TxsppWjSiYf9q0casVXanKIbBtfjWYlOyj7RzcQr51UqxVwiWDlDpDDv9
	Qu4V44Xjp/B5FpiQOgLVJHuI2nbm4RgwyJbFsfhGKdaZ2iqguKAzizk6vl2c61gg+04PEMpVJxO
	RnxqQjCHWZRyx1yJDwXfNp6g==
X-Google-Smtp-Source: AGHT+IFgzVRcS9mdsTk87FEhrDFQ5jFKeoi6nutbirWAHEtPPAbw81TGSNj3TVoWMr7WdMW7l5qoV87uzdF62e4sk08=
X-Received: by 2002:a2e:be08:0:b0:31a:6644:25c with SMTP id
 38308e7fff4ca-3264f00f29amr3080161fa.12.1746483313188; Mon, 05 May 2025
 15:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local>
In-Reply-To: <aBkaDN7N_6qDGdIz@x1.local>
From: Kyle Huey <me@kylehuey.com>
Date: Mon, 5 May 2025 15:15:00 -0700
X-Gm-Features: ATxdqUEzTn2NHO1OHMFM-6gWIqCZ6B2vpcStPrXwsgZOLdP2CnJ9U-2q1q9HPeQ
Message-ID: <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm@kvack.org, criu@lists.linux.dev, 
	"Robert O'Callahan" <robert@ocallahan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 1:05=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> Hi, Kyle,
>
> On Mon, May 05, 2025 at 09:37:01AM -0700, Kyle Huey wrote:
> > tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does not add
> > the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
> > thoughts/objections?
> >
> > The kernel has a "soft-dirty" bit on ptes which tracks if they've been
> > written to since the last time /proc/pid/clear_refs was used to clear
> > the soft-dirty bit. CRIU uses this to track which pages have been
> > modified since a previous checkpoint and reduce the size of the
> > checkpoints taken. I would like to use this in my debugger[0] to track
> > which pages a program function dirties when that function is invoked
> > from the debugger.
> >
> > However, the runtime environment for this function is rather unusual.
> > In my debugger, the process being debugged doesn't actually exist
> > while it's being debugged. Instead, we have a database of all program
> > state (including registers and memory values) from when the process
> > was executed. It's in some sense a giant core dump that spans multiple
> > points in time. To execute a program function from the debugger we
> > rematerialize the program state at the desired point in time from our
> > database.
> >
> > For performance reasons, we fill in the memory lazily[1] via
> > userfaultfd. This makes it difficult to use the soft-dirty bit to
> > track the writes the function triggers, because UFFDIO_COPY (and
> > friends) mark every page they touch as soft-dirty. Because we have the
> > canonical source of truth for the pages we materialize via UFFDIO_COPY
> > we're only interested in what happens after the userfaultfd operation.
> >
> > Clearing the soft-dirty bit is complicated by two things:
> > 1. There's no way to clear the soft-dirty bit on a single pte, so
> > instead we have to clear the soft-dirty bits for the entire process.
> > That requires us to process all the soft-dirty bits on every other pte
> > immediately to avoid data loss.
> > 2. We need to clear the soft-dirty bits after the userfaultfd
> > operation, but in order to avoid racing with the task that triggered
> > the page fault we have to do a non-waking copy, then clear the bits,
> > and then separately wake up the task.
> >
> > To work around all of this, we currently have a 4 step process:
> > 1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
> > 2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
> > 3. Write to /proc/pid/clear_refs to clear soft-dirty bits across the pr=
ocess.
> > 4. Do a UFFDIO_WAKE.
> >
> > The overhead of all of this (particularly step 1) is a millisecond or
> > two *per page* that we lazily materialize, and while that's not
> > crippling for our purposes, it is rather undesirable. What I would
> > like to have instead is a UFFDIO_COPY mode that leaves the soft-dirty
> > bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we clear
> > all the soft-dirty bits once after setting up all the mmaps in the
> > process the relevant ptes would then "just do the right thing" from
> > our perspective.
> >
> > But I do want to get some feedback on this before I spend time writing
> > any code. Is there a reason not to do this? Or an alternate way to
> > achieve the same goal?
>
> Have you looked at the wr-protect mode, and UFFDIO_COPY_MODE_WP for _COPY=
?
>
> If sync fault is a perf concern for frequent writes, just to mention at
> least latest Linux also supports async tracking (UFFD_FEATURE_WP_ASYNC),
> which is almost exactly soft dirty bits to me, though it solves a few
> issues it has on e.g. false positives over vma merging and swapping, or
> like you said missing of finer granule reset mechanisms.
>
> Maybe you also want to have a look at the pagemap ioctl introduced some
> time ago ("Pagemap Scan IOCTL", which, IIRC was trying to use uffd-wp in
> soft-dirty-like way):
>
> https://www.kernel.org/doc/Documentation/admin-guide/mm/pagemap.rst


Thanks. This is all very helpful and I think I can construct what I
need out of these building blocks.

- Kyle

> > If this is generally sensible, then a couple questions:
> > 1. Do I need a UFFD_FEATURE flag for this, or is it enough for a
> > program to be able to detect the existence of a
> > UFFDIO_COPY_MODE_DONTSOFTDIRTY by whether the ioctl accepts the flag
> > or returns EINVAL? I would tend to think the latter.
>
> The latter requires all the setups needed, and an useless ioctl to probe.
> Not a huge issue, but since userfaultfd is extensible, a feature flag mig=
ht
> be better as long as a new feature is well defined.
>
> > 2. Should I add this mode for the other UFFDIO variants (ZEROPAGE,
> > MOVE, etc) at the same time even if I don't have any use for them?
>
> Probably not.  I don't see a need to implement something just to make the
> API look good..  If any chunk of code in the Linux kernel has no plan to =
be
> used, we should probably not adding them since the start..
>
> Thanks,
>
> --
> Peter Xu
>
