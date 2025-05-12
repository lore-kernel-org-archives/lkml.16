Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB6241131
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065268; cv=none; b=uWO9zfjtRhzs+kxOW8lnBY9GJq3f8aIjmpeVL8eB98JvNAQx6gKQ2Xf2A6S+J0QcR4HpVBdRcpgdzAxigd22hejlS8Ug+J9kZ1qtsaSW8BTWRWgZw0uSPUW8bkAh4hAQC7wV+aHe5daDdFbofw6zEb2Tf/LrFUZt+0sjEfME8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065268; c=relaxed/simple;
	bh=qfyrJEHn6yZqztQ8qShq6S681pkXysOAYNxOeJNOrdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBKyb+hNUAmFph3TKl8IjC1nOpG0R3XI7jwB2xA2HRAqW/ypoJ3pGpJtjSYRlF4Rvkxk9bWNcpgfP3qmeat4LYsA7hc3oeuVyAzu3jzDeuXiAtGuAEorGhXoux26I9BB8E2/W2YL/H9y2/pVsHSayoeQ8TtUtDbS8lrQYKZgtIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2UK1T6Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2UK1T6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747065265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PiiNv5uyVSUS0u0nlImNDdFDgHHu9GbJcbLZJOQT9M=;
	b=a2UK1T6YEPeQokl8XgUI4xeDksPiw9Xl7Pxy98N9Y/zs7Lw6Q6eGjFoyahHRO3wz9Na+qK
	rVOuPfDhfsLEY96Y/MdD+gEnmP4IhbW5/k3Uoc/y6RJ2SvvjVKz4dYIOYULvCC/J3G3HbA
	9dNFHZd0afxBKSK3LPeCYb8Hrpg3pOI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-rQoBXLUBPFyg5JvyiBDeJg-1; Mon, 12 May 2025 11:54:21 -0400
X-MC-Unique: rQoBXLUBPFyg5JvyiBDeJg-1
X-Mimecast-MFC-AGG-ID: rQoBXLUBPFyg5JvyiBDeJg_1747065261
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so96855346d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065261; x=1747670061;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PiiNv5uyVSUS0u0nlImNDdFDgHHu9GbJcbLZJOQT9M=;
        b=fX0b7hQNpC2cRr6sppks2esA6qZNwHBOIdloBm97K9jTnDOxQYFrwIEHhbOeT+CGek
         K+H1ut4x7Hj/K70zCHysoKBrDQZskix2xpxomRU8sflLnxADkQXiuKWHJDq47eRq/vyF
         LrhoZ45oLUWjw8Pb3RC+S6FjE9TxKziWsYitn7jsRd/kVYJU+heCFvmETMo2Y8SkcU2X
         3VP8iitx8sNBS3/V5ImAbToW0Lh6BYt6csIJ3ernlLl5Ic5afMfv2hEDOHH2Ti1Cp0pr
         wIQDbInh2GIcFDuyCKoltGCuAyUK1UPOGorpqxKPPyOzHUzm1SMPElN22SIMFE9hTr06
         7TSg==
X-Forwarded-Encrypted: i=1; AJvYcCVoT4Ri/blfsjZBHRMglfbAUc7K0/ZLLQWJpt17YPGIzeHtnqoi7O/X8T1dEox9X9V8Kp8YOrI51KUEdlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSj7VLDyblNJam7ANMfDZl2aoUpCjWC+sG3aMUx5tiOWfdKLCO
	ubnsn8F07kjeXYmfi3TeoTksNh//VxW8nGo/YDWDrlnzl/S+MSFL0iIwmKa4tvQr/U9Ih4zwpfD
	WK9UskfCpE3V0PvEjmHP2R7j31w6NftEBIdpYSNsi8IsioFeYIZCLTY0EtLKKzw==
X-Gm-Gg: ASbGncuf87a2cQ/aMkRy7E/r2zBLYoZEvmeaFnMFrvcAL91TxaXhHQP8vfSXJVAeQrp
	zkJVCkhGSEDxbVIjnV7yBBkjHuWUXB8DJjsrSIy2cd+XF5nsEbSwqssws0dcEsnZ8nqewdyiD1M
	nBLSHzzS/hq0yjU1tNzL5UFWiJQXYsK9J0Bs5HHf4jcC7n11WTTmEDWDJEeHyMCHdTf0C92mjw4
	reWZI7Ok5x0Na9YauNsZlrH43Kx6G6d4RWzWKTAGHf0u1cCTPufQKBAmMBFIMuRSb06cNSgJBI3
	VQ0=
X-Received: by 2002:a05:6214:cc6:b0:6f2:a457:19a with SMTP id 6a1803df08f44-6f6e47f35ddmr223570636d6.25.1747065261017;
        Mon, 12 May 2025 08:54:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt5QJ730e9vS/CHAeWSroZKVwd/nUpoKNZ+4h9isdxMULceGefTs46ICee1XcqyXPlx9/AxA==
X-Received: by 2002:a05:6214:cc6:b0:6f2:a457:19a with SMTP id 6a1803df08f44-6f6e47f35ddmr223570356d6.25.1747065260602;
        Mon, 12 May 2025 08:54:20 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a472b3sm54258846d6.77.2025.05.12.08.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:54:20 -0700 (PDT)
Date: Mon, 12 May 2025 11:54:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Kyle Huey <me@kylehuey.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	criu@lists.linux.dev, Robert O'Callahan <robert@ocallahan.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: Suppress pte soft-dirty bit with UFFDIO_COPY?
Message-ID: <aCIZqV6mEQZftFvA@x1.local>
References: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
 <aBkaDN7N_6qDGdIz@x1.local>
 <CAP045ArAVtR6_Y-WWcqpB54Z+fwNYSWSyrTZKjctocwA0sK5eg@mail.gmail.com>
 <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP045AoWZQZvLR8B0h09XL=cS2aD3yDwtthdeZ64JWEOPkZ_=w@mail.gmail.com>

On Sun, May 11, 2025 at 08:06:03PM -0700, Kyle Huey wrote:
> On Mon, May 5, 2025 at 3:15 PM Kyle Huey <me@kylehuey.com> wrote:
> >
> > On Mon, May 5, 2025 at 1:05 PM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > Hi, Kyle,
> > >
> > > On Mon, May 05, 2025 at 09:37:01AM -0700, Kyle Huey wrote:
> > > > tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does not add
> > > > the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
> > > > thoughts/objections?
> > > >
> > > > The kernel has a "soft-dirty" bit on ptes which tracks if they've been
> > > > written to since the last time /proc/pid/clear_refs was used to clear
> > > > the soft-dirty bit. CRIU uses this to track which pages have been
> > > > modified since a previous checkpoint and reduce the size of the
> > > > checkpoints taken. I would like to use this in my debugger[0] to track
> > > > which pages a program function dirties when that function is invoked
> > > > from the debugger.
> > > >
> > > > However, the runtime environment for this function is rather unusual.
> > > > In my debugger, the process being debugged doesn't actually exist
> > > > while it's being debugged. Instead, we have a database of all program
> > > > state (including registers and memory values) from when the process
> > > > was executed. It's in some sense a giant core dump that spans multiple
> > > > points in time. To execute a program function from the debugger we
> > > > rematerialize the program state at the desired point in time from our
> > > > database.
> > > >
> > > > For performance reasons, we fill in the memory lazily[1] via
> > > > userfaultfd. This makes it difficult to use the soft-dirty bit to
> > > > track the writes the function triggers, because UFFDIO_COPY (and
> > > > friends) mark every page they touch as soft-dirty. Because we have the
> > > > canonical source of truth for the pages we materialize via UFFDIO_COPY
> > > > we're only interested in what happens after the userfaultfd operation.
> > > >
> > > > Clearing the soft-dirty bit is complicated by two things:
> > > > 1. There's no way to clear the soft-dirty bit on a single pte, so
> > > > instead we have to clear the soft-dirty bits for the entire process.
> > > > That requires us to process all the soft-dirty bits on every other pte
> > > > immediately to avoid data loss.
> > > > 2. We need to clear the soft-dirty bits after the userfaultfd
> > > > operation, but in order to avoid racing with the task that triggered
> > > > the page fault we have to do a non-waking copy, then clear the bits,
> > > > and then separately wake up the task.
> > > >
> > > > To work around all of this, we currently have a 4 step process:
> > > > 1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
> > > > 2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
> > > > 3. Write to /proc/pid/clear_refs to clear soft-dirty bits across the process.
> > > > 4. Do a UFFDIO_WAKE.
> > > >
> > > > The overhead of all of this (particularly step 1) is a millisecond or
> > > > two *per page* that we lazily materialize, and while that's not
> > > > crippling for our purposes, it is rather undesirable. What I would
> > > > like to have instead is a UFFDIO_COPY mode that leaves the soft-dirty
> > > > bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we clear
> > > > all the soft-dirty bits once after setting up all the mmaps in the
> > > > process the relevant ptes would then "just do the right thing" from
> > > > our perspective.
> > > >
> > > > But I do want to get some feedback on this before I spend time writing
> > > > any code. Is there a reason not to do this? Or an alternate way to
> > > > achieve the same goal?
> > >
> > > Have you looked at the wr-protect mode, and UFFDIO_COPY_MODE_WP for _COPY?
> > >
> > > If sync fault is a perf concern for frequent writes, just to mention at
> > > least latest Linux also supports async tracking (UFFD_FEATURE_WP_ASYNC),
> > > which is almost exactly soft dirty bits to me, though it solves a few
> > > issues it has on e.g. false positives over vma merging and swapping, or
> > > like you said missing of finer granule reset mechanisms.
> > >
> > > Maybe you also want to have a look at the pagemap ioctl introduced some
> > > time ago ("Pagemap Scan IOCTL", which, IIRC was trying to use uffd-wp in
> > > soft-dirty-like way):
> > >
> > > https://www.kernel.org/doc/Documentation/admin-guide/mm/pagemap.rst
> >
> >
> > Thanks. This is all very helpful and I think I can construct what I
> > need out of these building blocks.
> >
> > - Kyle
> 
> That works like a charm, thanks.
> 
> The only problem I ran into is that the man page for userfaultfd(2)
> claims there's a handshake pattern where you can call UFFDIO_API
> twice, once with 0 to enumerate all supported features, and then again
> with the feature mask you want to initialize the API. In reality the
> API only permits a single UFFDIO_API call because of the internal
> UFFD_FEATURE_INITIALIZED flag, so doing this handshake requires
> creating a sacrificial fd.

This is true, almost all apps I'm aware that are using userfaultfd needs
that.  It's indeed confusing.

> 
> If the man page is not just totally wrong then this may have been an
> unintentional regression from 22e5fe2a2a279.

IMHO 22e5fe2a2a279 was correct, and it fixed a possible race due to
ctx->state before. The new cmpxchg() plus the INITIALIZED flag should avoid
the race.

In this case it should be the man page that was wrong since this commit of
man page, afaict:

commit a252b3345f5b0a4ecafa7d4fb1ac73cb4fd4877f (HEAD)
Author: Axel Rasmussen <axelrasmussen@google.com>
Date:   Tue Oct 3 12:45:43 2023 -0700

    ioctl_userfaultfd.2: Describe two-step feature handshake

I'll see if Axel / Mike / Andrea has any comment, otherwise I'll propose a
patch to fix the man-pages and state the fact (that we need a sacrificial
fd).

Maybe I should really add the UFFDIO_FEATURES ioctl to allow fetching the
feature flags from kernel separately, considering how much trouble we've
hit with this whole thing..

Thanks,

-- 
Peter Xu

