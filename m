Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED2D1F16B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 03:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019181; cv=none; b=VecuAqOMv9vh+Dfqf7MBQQZ6Ek86HNYmKfFAg5f5tMexQo6zNuT5UwLUyqu7rLJSDiBJruBRSKJRRyKZCCIKaYYWUj/efvuR5zuVSYhjz7cVt2cj0FmjIcnwPGTldSPxrTDGnG5cuTgeAirlmdxiJrqPvR7jFEn5FSElTptRuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019181; c=relaxed/simple;
	bh=BCzVmwYCKo9wN5Rc3Ie7sT4wCrFW/D2sirYR6hIveaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aA9S4DHUEcjyIWY6sY/jd3DHtFM22KeyHA4V0IWFBLiH6RALs9S+VkwmMxpdyRXmLQ8jXMj3cxDRUZ4JoLG0+E/PXyuoewwh3dpVnVQpktalvMtQaQBe93z0fb3ffShFS7UprJMeQsQYxgTPHGkjazaH9AZtBYZBJZG1qJ28BgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=iO5Be4AS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="iO5Be4AS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54fc35a390eso4673557e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 20:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1747019177; x=1747623977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqeSdNx0CHeLh30AuyndpNWXZmP3dukBvUlG2nm95dQ=;
        b=iO5Be4ASQCMXmK1h4uqmGS1m19ag4noXTVYp106ZjyApWDNt6K04+tV8XSf/WVs0T5
         KkppGzBWeO6N7LErGlppvSuv01miclfv20cYrbxxlYfkmfrJTaYYPaTKaGwoU0wYSJQ0
         M16WcKr720IBVdVQe8CHcgNkZpQ0eJr24q6N27WKd/K7tRnBTb3vr6cLwpNgkVIAIJQS
         qBN2ko4eH9tgFkH/EqauN97N50JzLi2roVbLjEYnN8iG4Mnj2f9Q05Vy3PaowHGAor64
         Z3+wRpKxllZe/8ndu4xFCpE1XurMytO0Ga+xgjgVWYS+QKwOsprzfTadZuqEHgXxXDLI
         89DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747019177; x=1747623977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqeSdNx0CHeLh30AuyndpNWXZmP3dukBvUlG2nm95dQ=;
        b=rzaxRRpVnvdYl2JhYvjv20x15l62J89dh07uSVO6T8vB+KxRZYtRvwk9mmDTLvIFPS
         PyIpR+VAcV5QJ+pjDvOXUsYEOqiP15YC+5pMvjfgrGUKnyi6fM9TPa5WeftGqpFTyOuc
         TwYnRq5GE3LtGySb5pla6qpBRll9EYBRQmfF1XQLNoQXDEodDPZtT1NzayfANtk+VQ+e
         KEG14hrGbN3dN+RJPtFsYcRkY0fSHw8d8bmhHgNo5a3otNo/1LJF1Y7C5cv1bAoKYNqo
         kqA4WomT1u9lTeM5CQbBgcQqxi2HNNALcWcHlYj65IlsT4KbVZGqfaQGiTZ1/htejrTn
         rhiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGzX3wFZxBq8P53kG2lHub4RosXVqe6oo41ZItv6XDUCjy0ZoNh5sQA5zBX/wi588tU9LrhSv12Y1ern4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs4SVh423Ujv8q81jUMfdJFiFXpimlgLFtSYQ3n3jwxDmH7nPo
	Vd5KfP/ihaeb9mwLz/zVeeSte+qtiwkwPyyCejMAP2j/fqQBW+80+S5hwCKjjROEeOn4Hy3/Uc3
	DnhKUjZ7whzfH3ctK6WaKO/IAxiqHBXROwRX4rha4wkOGbVEsVA==
X-Gm-Gg: ASbGnctDJtRoUN6RY9zUvBvlPPgcz87ur/R0yd+Cz88ACc8tmIHCEK4edVoAc5HXmMt
	IJUu/2Gtjv5ue8le5ijet/TiEflALMa2NdAHxYTWl5E+DT+3+Lpf2HWFSWezoeJY//lT1S9dZvv
	v10MsFF6rPrktXXXVDTrMx+MlZRJqW/buf
X-Google-Smtp-Source: AGHT+IHRuAOe3WacXM0IL8CAYTt6PfU2RLwPShCiL1Y+DeIOHLql5HJQxQ/kGP1m2stDHfZvxmHLdqNG7rYizSDiS/Y=
X-Received: by 2002:a05:6512:640b:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-54fc6764426mr3461026e87.0.1747019176738; Sun, 11 May 2025
 20:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local> <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
In-Reply-To: <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
From: Kyle Huey <me@kylehuey.com>
Date: Sun, 11 May 2025 20:06:03 -0700
X-Gm-Features: AX0GCFsgzrcWFFa5U_-FaMNzElVCr-BE21Eo2Gh4nlBIxOfo_bLAZyxmi6GNLVU
Message-ID: <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mm@kvack.org, criu@lists.linux.dev, 
	"Robert O'Callahan" <robert@ocallahan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 3:15=E2=80=AFPM Kyle Huey <me@kylehuey.com> wrote:
>
> On Mon, May 5, 2025 at 1:05=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
> >
> > Hi, Kyle,
> >
> > On Mon, May 05, 2025 at 09:37:01AM -0700, Kyle Huey wrote:
> > > tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does not ad=
d
> > > the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
> > > thoughts/objections?
> > >
> > > The kernel has a "soft-dirty" bit on ptes which tracks if they've bee=
n
> > > written to since the last time /proc/pid/clear_refs was used to clear
> > > the soft-dirty bit. CRIU uses this to track which pages have been
> > > modified since a previous checkpoint and reduce the size of the
> > > checkpoints taken. I would like to use this in my debugger[0] to trac=
k
> > > which pages a program function dirties when that function is invoked
> > > from the debugger.
> > >
> > > However, the runtime environment for this function is rather unusual.
> > > In my debugger, the process being debugged doesn't actually exist
> > > while it's being debugged. Instead, we have a database of all program
> > > state (including registers and memory values) from when the process
> > > was executed. It's in some sense a giant core dump that spans multipl=
e
> > > points in time. To execute a program function from the debugger we
> > > rematerialize the program state at the desired point in time from our
> > > database.
> > >
> > > For performance reasons, we fill in the memory lazily[1] via
> > > userfaultfd. This makes it difficult to use the soft-dirty bit to
> > > track the writes the function triggers, because UFFDIO_COPY (and
> > > friends) mark every page they touch as soft-dirty. Because we have th=
e
> > > canonical source of truth for the pages we materialize via UFFDIO_COP=
Y
> > > we're only interested in what happens after the userfaultfd operation=
.
> > >
> > > Clearing the soft-dirty bit is complicated by two things:
> > > 1. There's no way to clear the soft-dirty bit on a single pte, so
> > > instead we have to clear the soft-dirty bits for the entire process.
> > > That requires us to process all the soft-dirty bits on every other pt=
e
> > > immediately to avoid data loss.
> > > 2. We need to clear the soft-dirty bits after the userfaultfd
> > > operation, but in order to avoid racing with the task that triggered
> > > the page fault we have to do a non-waking copy, then clear the bits,
> > > and then separately wake up the task.
> > >
> > > To work around all of this, we currently have a 4 step process:
> > > 1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
> > > 2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
> > > 3. Write to /proc/pid/clear_refs to clear soft-dirty bits across the =
process.
> > > 4. Do a UFFDIO_WAKE.
> > >
> > > The overhead of all of this (particularly step 1) is a millisecond or
> > > two *per page* that we lazily materialize, and while that's not
> > > crippling for our purposes, it is rather undesirable. What I would
> > > like to have instead is a UFFDIO_COPY mode that leaves the soft-dirty
> > > bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we clear
> > > all the soft-dirty bits once after setting up all the mmaps in the
> > > process the relevant ptes would then "just do the right thing" from
> > > our perspective.
> > >
> > > But I do want to get some feedback on this before I spend time writin=
g
> > > any code. Is there a reason not to do this? Or an alternate way to
> > > achieve the same goal?
> >
> > Have you looked at the wr-protect mode, and UFFDIO_COPY_MODE_WP for _CO=
PY?
> >
> > If sync fault is a perf concern for frequent writes, just to mention at
> > least latest Linux also supports async tracking (UFFD_FEATURE_WP_ASYNC)=
,
> > which is almost exactly soft dirty bits to me, though it solves a few
> > issues it has on e.g. false positives over vma merging and swapping, or
> > like you said missing of finer granule reset mechanisms.
> >
> > Maybe you also want to have a look at the pagemap ioctl introduced some
> > time ago ("Pagemap Scan IOCTL", which, IIRC was trying to use uffd-wp i=
n
> > soft-dirty-like way):
> >
> > https://www.kernel.org/doc/Documentation/admin-guide/mm/pagemap.rst
>
>
> Thanks. This is all very helpful and I think I can construct what I
> need out of these building blocks.
>
> - Kyle

That works like a charm, thanks.

The only problem I ran into is that the man page for userfaultfd(2)
claims there's a handshake pattern where you can call UFFDIO_API
twice, once with 0 to enumerate all supported features, and then again
with the feature mask you want to initialize the API. In reality the
API only permits a single UFFDIO_API call because of the internal
UFFD_FEATURE_INITIALIZED flag, so doing this handshake requires
creating a sacrificial fd.

If the man page is not just totally wrong then this may have been an
unintentional regression from 22e5fe2a2a279.

- Kyle

> > > If this is generally sensible, then a couple questions:
> > > 1. Do I need a UFFD_FEATURE flag for this, or is it enough for a
> > > program to be able to detect the existence of a
> > > UFFDIO_COPY_MODE_DONTSOFTDIRTY by whether the ioctl accepts the flag
> > > or returns EINVAL? I would tend to think the latter.
> >
> > The latter requires all the setups needed, and an useless ioctl to prob=
e.
> > Not a huge issue, but since userfaultfd is extensible, a feature flag m=
ight
> > be better as long as a new feature is well defined.
> >
> > > 2. Should I add this mode for the other UFFDIO variants (ZEROPAGE,
> > > MOVE, etc) at the same time even if I don't have any use for them?
> >
> > Probably not.  I don't see a need to implement something just to make t=
he
> > API look good..  If any chunk of code in the Linux kernel has no plan t=
o be
> > used, we should probably not adding them since the start..
> >
> > Thanks,
> >
> > --
> > Peter Xu
> >
