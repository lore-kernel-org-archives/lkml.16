Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19941F7910
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977794; cv=none; b=urFNBKZmffaZUbsh9gURtTM+PiRGPMgBMh2d7PcbbksCSsQOGoM/wpLglC/5d8qxPAYRCsJv5kM5nHawt+0i59vsNieLRoqe1E4EInR6tIVBD3NcB9lS9WNlu87Mh/hbJp8/NotkGh8/nOEqQHUS3sxA9gFT1cpA5vSoHWXZsRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977794; c=relaxed/simple;
	bh=4QNqoswYNS6AhpNKdKJXEKRbNRybMqTV40SOe4X1O1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXZbrbxhz7CUX6B3H3NnBn08y89Poy2g2rLUe089G2CkgTfcit41t4PHuixW7EB9wVX7BsTeChdvh0Vxkjyd6WKUpOh+5CBX5+OIwIn8gL75SAi57MXq4TltlwRDN5ZPkS1URIQyLqCPqCzIxADZwEUASVL01ZZcLdtttiH0BF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mVbgeGEh; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVbgeGEh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2169a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748977791; x=1749582591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDFpNE99L8Pksyp1ve3dfkrnf/nLOEF78F5qU2cr+gY=;
        b=mVbgeGEhkhq8FclT/eeOxcNPJs0+BQtsULSBKDaSJp0KTXCoXCNJMF1+m5ihl8y2pb
         qHfxv66KsWP54TRCB4XDdW696nhuzxYFTJvdNX22gs6s2JiTqq2Z+YNATlKg2iPvcx7N
         uuyNhys0PrR1gHtCKaoaxnsXoU8149WkDPej/eKTimSDgvcaky5KZAoZht44PXabOfxn
         A8EigFs8epFxOiO2BBTBmusbRUKq3UW//CigSU/vmAw7SaBMbSCKnsqNfyOGHS2pC6Cm
         zDFtikyMtIOPlTuUT+NjODxxSY1cw1M2On+M7amIj/eN8V+zbavr5VsnWOKOllHF+1zp
         M3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977791; x=1749582591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDFpNE99L8Pksyp1ve3dfkrnf/nLOEF78F5qU2cr+gY=;
        b=Ff02Q+iJmuntgUYB3RH6yq3td7G0Yu9NZICzq52LiLUvRdGNEXHYZuublKS9Rgwhii
         IH+byTsfiQ55U2pzfMQc6Zs1yQZCI8Y/AAXlc+1YBp0lEeyqy2Mh196DGLwJj92yV84B
         o6k8CjwqLQul64hERlFtnpEZjYTM1d1gPmJmDkmAsjyzqraMu/EtrRvTu9IHffS1odIk
         FXKzSlmttwvNn7w5juEu7BC7ozEcey40sb0JqmeFbyqaD9ZyBVIEYIW+s61+Fjyx6W0W
         RTKQNp1C696alVw8oigabWeMyKM3SrnlnKkzxFCPkKL0vIhku6SWia9wDBxhRsDMQC4+
         X9oA==
X-Forwarded-Encrypted: i=1; AJvYcCVCt6LWoWNW0CVnUihU4xJnmcvQNz1oI7g2r1vvyhZ05hTdLX0BqLK0QRbONByfO09B3McUbCXJ1TnWT1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3COSzXP85maW8YtQ+rgjPUyQ0qSpqE7DeeRiPxUHLh1EWrb9
	BfLhk7YK+4I9Y74BEIkCKDz9+ipCBIhtzLYSMdx04ACEW6s8Wui3G7IbU87wFxE/JuHbvAFJMf4
	Nm5rVk9HhACkglTcTPI8SDoDMqQDA0APU7yfqAxoL
X-Gm-Gg: ASbGncuTWA5g92p54vWlBa5rs8BoyPzcbal6RWfZVo5gVWBTbOhud8EZp/qzuQXcHtE
	aErbPKVa11fEtwOv4qVwUvl4gZe29Trpmi66d6miyTWp+Ls6Af6dS2PCjgA0+91ecHkMWXyX4NT
	CS/VW1dpYF0ody7btp9uU6Pj3FiZvz/n0QAm+JRl/uPiDL78k5edOztuUtyMgWO/Clnv1vfg==
X-Google-Smtp-Source: AGHT+IHYswGWanAgWKQSMSfiihgsgNs0+6ptfegE1kE6Wp0sHUCbGa3ku/B3CMF12kd7vrUzCMpjPaYUWT3nbfhBJfM=
X-Received: by 2002:a05:6402:324:b0:606:e3ff:b7f9 with SMTP id
 4fb4d7f45d1cf-606e887b723mr5721a12.3.1748977790474; Tue, 03 Jun 2025 12:09:50
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com> <aD8--plab38qiQF8@casper.infradead.org>
 <db2268f0-7885-471d-94a3-8ae4641ba2e5@redhat.com>
In-Reply-To: <db2268f0-7885-471d-94a3-8ae4641ba2e5@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 21:09:14 +0200
X-Gm-Features: AX0GCFtCpIPsWFmnSr9w2T4NN3PLSn_1dA8DhnOyioQLG_9FoZlqKdP7GI5LlqA
Message-ID: <CAG48ez2NX-L0Wq-DQDB2vb3CvOJ1uTmJOqmbMW=FOTtxVoouxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/memory: ensure fork child sees coherent memory snapshot
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:37=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> On 03.06.25 20:29, Matthew Wilcox wrote:
> > On Tue, Jun 03, 2025 at 08:21:02PM +0200, Jann Horn wrote:
> >> When fork() encounters possibly-pinned pages, those pages are immediat=
ely
> >> copied instead of just marking PTEs to make CoW happen later. If the p=
arent
> >> is multithreaded, this can cause the child to see memory contents that=
 are
> >> inconsistent in multiple ways:
> >>
> >> 1. We are copying the contents of a page with a memcpy() while userspa=
ce
> >>     may be writing to it. This can cause the resulting data in the chi=
ld to
> >>     be inconsistent.
> >> 2. After we've copied this page, future writes to other pages may
> >>     continue to be visible to the child while future writes to this pa=
ge are
> >>     no longer visible to the child.
> >>
> >> This means the child could theoretically see incoherent states where
> >> allocator freelists point to objects that are actually in use or stuff=
 like
> >> that. A mitigating factor is that, unless userspace already has a dead=
lock
> >> bug, userspace can pretty much only observe such issues when fancy loc=
kless
> >> data structures are used (because if another thread was in the middle =
of
> >> mutating data during fork() and the post-fork child tried to take the =
mutex
> >> protecting that data, it might wait forever).
> >
> > Um, OK, but isn't that expected behaviour?  POSIX says:
> >
> > : A process shall be created with a single thread. If a multi-threaded
> > : process calls fork(), the new process shall contain a replica of the
> > : calling thread and its entire address space, possibly including the
> > : states of mutexes and other resources. Consequently, the application
> > : shall ensure that the child process only executes async-signal-safe
> > : operations until such time as one of the exec functions is successful=
.
> >
> > It's always been my understanding that you really, really shouldn't cal=
l
> > fork() from a multithreaded process.
>
> I have the same recollection, but rather because of concurrent O_DIRECT
> and locking (pthread_atfork ...).
>
> Using the allocator above example: what makes sure that no other thread
> is halfway through modifying allocator state? You really have to sync
> somehow before calling fork() -- e.g., grabbing allocator locks in
> pthread_atfork().

Yeah, like what glibc does for its malloc implementation to prevent
allocator calls from racing with fork(), so that malloc() keeps
working after fork(), even though POSIX says that the libc doesn't
have to guarantee that.

> For Linux we document in the man page
>
> "After  a  fork() in a multithreaded program, the child can safely call
> only async-signal-safe functions (see signal-safety(7)) until such time
> as it calls execve(2)."
