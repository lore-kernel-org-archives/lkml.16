Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CB19C546
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475541; cv=none; b=HwZMEIekxm2MdUmlsIJ0MynDmAmDY+80YNzU9qnQYkkVAHFQ1C2QpUyInY9FgOL2kcYfQRD/CvTpCRSQVPx6pSBCSkBOey0DOACngJk88za0du4XtIyTUIChUBIxr6LzdYKo0heo4Ol3tCD7zH8r0lu9smLqPY0EhzrrseguMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475541; c=relaxed/simple;
	bh=nacOnyrBarn+yAqaqC6CGmDtmnRJvYgxOqwOXj1IIc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liNrF0yoMn65ZFjWGaLoEH0SnV6NQ0vW7C48Gt1qxVuPwuK2QJtWUVNITr4ftauJ4iuL5fHyTOZiD8bB6gpfJjX3zW/ev4Qu14TdlJ8dB3NGqukPplQvjC0Zb4HUojeYWIOp+lOnlRi40VrkI1IT87RzBhdw72J4gLeOTGwjyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+/ZnJo0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+/ZnJo0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746475538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFUdBwtJFHu0IdSQXDQrNEDkNHrYdeA6mBR+yrTNtIk=;
	b=N+/ZnJo05gKPipR146OvfLspdvcJV+eaImN0AbnYFcgv++6l+RLMsnFiS3+O5UG6HGPrhe
	DeJOaQfwFY2nzvNpgIUchOa1JBKgknFDkAQ6PahltpO2/ZaffNZy7YpWP5iAN3S/Pnpn++
	cMRviNFGUUJTR2vylRNutC1084Nwqj0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-knODAdTXP_O4LeEQ12BS4Q-1; Mon, 05 May 2025 16:05:37 -0400
X-MC-Unique: knODAdTXP_O4LeEQ12BS4Q-1
X-Mimecast-MFC-AGG-ID: knODAdTXP_O4LeEQ12BS4Q_1746475536
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ead629f6c6so90129046d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746475536; x=1747080336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFUdBwtJFHu0IdSQXDQrNEDkNHrYdeA6mBR+yrTNtIk=;
        b=AuOpumCcK9Q4Geneg+HWTaKSpAkR2ut3GIwVsGVDBq4avvrUOVJaCaw0rDsPc0UELk
         sj9XOqedJFAVv+P1SPdRvgHYrV/mijwoRr+j7EDMWnkp+SfwdySh9XC9M/s1FaeQpIDI
         kkGmtNmotnGXotekL33Goqe1+hFLaA/itn9fceQ0wvBAPhpu3HUaOyqqec6MFEqMiwvG
         b8kiOJ+eI9+X6PpNXiPLQQ59anmZa+etB1rlEFUid6EkqRu6agnQ34xMCB147atG0Y7z
         dpbsbulW/y/Rc/dIPfuXd30JaowgiRIM3qYFY2pRA8ZruCcu56eB3t55qTL6noU38cuM
         lBkg==
X-Forwarded-Encrypted: i=1; AJvYcCUKbq0jZhGiPbwDX0j+nhSCSC2GPUqHuhEN2ubnz0uS47mTUkxRWfhSjs0c38C2BlZt8KfVJj0VfA3Rmno=@vger.kernel.org
X-Gm-Message-State: AOJu0YyypFV0bepoGJNfzXQMjuZLrxdYPJ0psDodLqzqVPIdPkQXxp7G
	Q8D1Z5pJKNixFV29/zE1ttkNYMz0WSaJWC22k00VrW0mqmhvFqh4Zhr0l17ZloRH+CBhAwp0DcP
	hYjYb4vLc1D098KH65ow4Gz1qvv2gVSAE0mv6pavQkU03Jdt2I6v2vaenFiD2Sg==
X-Gm-Gg: ASbGnctOAZ1phDSyWwNTPexBUYPdHjdKRJ+LnUnMHrVm+OXISbMUfjQEG3pkLWa9wi/
	KtHkF0pwjDOr0oLJPrIV/0F6oxAcZ0lqCskPaFrR28me9od+EteARSLv4vovK4RieYJcd5XyNT0
	gqAwQzK6uw/BWl1k3T75p5Zy8IzPZXquxcfJeZe0V175cVicZNWXho1GZzj3CuqjSSKiv3I0Yzn
	Od726jb450buWH/CBJslNGUtGYaaCvsRJZoHYpcu3mJQObafenih6zolLzJqm2IfMTipCGK5k9E
	Sk8=
X-Received: by 2002:a05:6214:411a:b0:6f4:c602:806e with SMTP id 6a1803df08f44-6f528c51f14mr123959866d6.13.1746475536599;
        Mon, 05 May 2025 13:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAX8vD/Mhme2rAizgX3udqaLznlk0blCrJd5nt93pvyI5CBbUh+Ubh3gass9cVF6sOpMENQw==
X-Received: by 2002:a05:6214:411a:b0:6f4:c602:806e with SMTP id 6a1803df08f44-6f528c51f14mr123959606d6.13.1746475536265;
        Mon, 05 May 2025 13:05:36 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f4826ddsm59766116d6.101.2025.05.05.13.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 13:05:35 -0700 (PDT)
Date: Mon, 5 May 2025 16:05:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Kyle Huey <me@kylehuey.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	criu@lists.linux.dev, Robert O'Callahan <robert@ocallahan.org>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
Message-ID: <aBkaDN7N_6qDGdIz@x1.local>
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>

Hi, Kyle,

On Mon, May 05, 2025 at 09:37:01AM -0700, Kyle Huey wrote:
> tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does not add
> the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
> thoughts/objections?
> 
> The kernel has a "soft-dirty" bit on ptes which tracks if they've been
> written to since the last time /proc/pid/clear_refs was used to clear
> the soft-dirty bit. CRIU uses this to track which pages have been
> modified since a previous checkpoint and reduce the size of the
> checkpoints taken. I would like to use this in my debugger[0] to track
> which pages a program function dirties when that function is invoked
> from the debugger.
> 
> However, the runtime environment for this function is rather unusual.
> In my debugger, the process being debugged doesn't actually exist
> while it's being debugged. Instead, we have a database of all program
> state (including registers and memory values) from when the process
> was executed. It's in some sense a giant core dump that spans multiple
> points in time. To execute a program function from the debugger we
> rematerialize the program state at the desired point in time from our
> database.
> 
> For performance reasons, we fill in the memory lazily[1] via
> userfaultfd. This makes it difficult to use the soft-dirty bit to
> track the writes the function triggers, because UFFDIO_COPY (and
> friends) mark every page they touch as soft-dirty. Because we have the
> canonical source of truth for the pages we materialize via UFFDIO_COPY
> we're only interested in what happens after the userfaultfd operation.
> 
> Clearing the soft-dirty bit is complicated by two things:
> 1. There's no way to clear the soft-dirty bit on a single pte, so
> instead we have to clear the soft-dirty bits for the entire process.
> That requires us to process all the soft-dirty bits on every other pte
> immediately to avoid data loss.
> 2. We need to clear the soft-dirty bits after the userfaultfd
> operation, but in order to avoid racing with the task that triggered
> the page fault we have to do a non-waking copy, then clear the bits,
> and then separately wake up the task.
> 
> To work around all of this, we currently have a 4 step process:
> 1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
> 2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
> 3. Write to /proc/pid/clear_refs to clear soft-dirty bits across the process.
> 4. Do a UFFDIO_WAKE.
> 
> The overhead of all of this (particularly step 1) is a millisecond or
> two *per page* that we lazily materialize, and while that's not
> crippling for our purposes, it is rather undesirable. What I would
> like to have instead is a UFFDIO_COPY mode that leaves the soft-dirty
> bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we clear
> all the soft-dirty bits once after setting up all the mmaps in the
> process the relevant ptes would then "just do the right thing" from
> our perspective.
> 
> But I do want to get some feedback on this before I spend time writing
> any code. Is there a reason not to do this? Or an alternate way to
> achieve the same goal?

Have you looked at the wr-protect mode, and UFFDIO_COPY_MODE_WP for _COPY?

If sync fault is a perf concern for frequent writes, just to mention at
least latest Linux also supports async tracking (UFFD_FEATURE_WP_ASYNC),
which is almost exactly soft dirty bits to me, though it solves a few
issues it has on e.g. false positives over vma merging and swapping, or
like you said missing of finer granule reset mechanisms.

Maybe you also want to have a look at the pagemap ioctl introduced some
time ago ("Pagemap Scan IOCTL", which, IIRC was trying to use uffd-wp in
soft-dirty-like way):

https://www.kernel.org/doc/Documentation/admin-guide/mm/pagemap.rst

> 
> If this is generally sensible, then a couple questions:
> 1. Do I need a UFFD_FEATURE flag for this, or is it enough for a
> program to be able to detect the existence of a
> UFFDIO_COPY_MODE_DONTSOFTDIRTY by whether the ioctl accepts the flag
> or returns EINVAL? I would tend to think the latter.

The latter requires all the setups needed, and an useless ioctl to probe.
Not a huge issue, but since userfaultfd is extensible, a feature flag might
be better as long as a new feature is well defined.

> 2. Should I add this mode for the other UFFDIO variants (ZEROPAGE,
> MOVE, etc) at the same time even if I don't have any use for them?

Probably not.  I don't see a need to implement something just to make the
API look good..  If any chunk of code in the Linux kernel has no plan to be
used, we should probably not adding them since the start..

Thanks,

-- 
Peter Xu

