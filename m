Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B82A17FAC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508054; cv=none; b=MzsfC26bwx0v9yczBmddSMzZZ+KxCCggDTWRu6G9IfCQS6o5GkyUPJpcU8RlIhbwVjBMdMfMb4mrelsCFbAPi9nSQ5pSG35paDDHLDHoP0H/gcmOG6Q6UkX4o+zBd4UAnbGfJoljzAQMiGJjrHQ7syBvYqFIZlS584cqegZn6sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508054; c=relaxed/simple;
	bh=o6IK09c4Ywjv0/K5FM6lhQcUclr6B0LXuhh55N0ppXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=I6q8yzhOXO0jBXP2zvRtjTrL4BNTA14SMHKsTynrG4LddO1CiQf3gOVT/eXP1kPXKD2sxXR11bIVAK98MZGORDuhDT03EJdzGbCvCtWYiQgKKuVyUk3LV539euetkRPMPETcXgYGzHomNq9Af/BqpPzzM+WPANEfvkvJcdLnloQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VlnM7Wlz; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VlnM7Wlz"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47e9fea29easo376061cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745508052; x=1746112852; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNHK302YZFUT1cxr0jtljW49RgNj4+xwWJVeU3dUkCI=;
        b=VlnM7WlzuWW4qvjbaNrRuVK75rEA8b0UXnZ6PRw8bgggKgBDSean2Gejtq64kzOoU8
         sCPAzM/rUObxxnjb+X7TTH2Tp+woidWKZ3hgHBN9iUAszbwyZ/NDvbtPU1XqBhcIZ/bE
         4Uqg1r5AHzEd0kgHqj4cPR9+vVnlfJdaf2wZCFBTNVFTfK0PZy+36y1lg8ewZhgnGdhN
         NZt2ovlWMC544VgEX4FwUcwqtTq45E2bySv4k/HZJwf19Up2hIOemNDUsmdX+hlkiexa
         62FqVS0WpFEoRnfJw6iQSbrp88Qv09W8jCGc+xT8m6TDNy+v5kRHR9Fdgi3xeMD9vSy0
         DvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508052; x=1746112852;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNHK302YZFUT1cxr0jtljW49RgNj4+xwWJVeU3dUkCI=;
        b=hJFx+3pqYlGwYE7DT0aJ8zpRYOALpON7j0Yvyl4GuzLf8B4giw3PQ2pey2c8b76e4t
         AJ8yNFE7NkzMJRsZdpvkwlYrDbcFEjUWWkeOMdoiSBpaoYCqwt8szLKCapDfameyvjEm
         KPkoY/zLQBLlj/mCIM/bFxdBN+SdZcPFF2YBWGoSG6kDsQniYW47KjJaZIWK/0woNUY7
         SMWkuBHHxRlITuovRKobkbwG18WKu8a0RwuhqBo7FeGHraWBW4eom2RyAnIvWJsi5Fv4
         d01QNa4LzY5ugBkZdaHs4PjFFrrR/JWx1SNyuVEneLfKFP4Pyh4SKM1WAzL3KIppIBDg
         /UOg==
X-Forwarded-Encrypted: i=1; AJvYcCVqlKgD8yhOKuNz0diGzbR1G9uxpc9RcS4VPcqv9u1efzolKgBY2Fut/LxWLtgW1fwvNvNUB/5A9Cbi4LQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5sBGCLC1xOjbrv78rPGOpNV8pTth5yyeG/tsErFQDDUKpvSxQ
	6UTTLlOArfk+0EzcYfY5hYYk54fzXBf+WrsJuL2BexafncTgp17iSPrl0bFr2/iioQBJCUwlhmk
	AbDS4AhhUmYZ3acm/3fqFq8MzUPyIsh6tqrP1
X-Gm-Gg: ASbGncu4WH3GL1royqZfyiXKzXkCupU/yn+fnOhfQ5fWyLCVpiMih02Oqh9hVkKE/Op
	JYBUvL4upHN+FYKSb9sF2HniNjSt6g9ggHpL0q+deB9cogwETF0mDJAKlkc6ruy5mkNkeuPhfyf
	YTsVkDaXeH36Rrb9/mxu3freo+hNdENx1xJF8TxKVzAKJ5qSe6lBwa
X-Google-Smtp-Source: AGHT+IEJ5MqCyYAZ5GwHFLcMlAiX+rZznU8L6WqiKzfk2t5zO6ifbX/QQVtO0BzE3KXJcP5VhQWuQTTPs/LiXap8uVE=
X-Received: by 2002:a05:622a:5792:b0:476:f1a6:d8e8 with SMTP id
 d75a77b69052e-47ea474f9d3mr4291421cf.11.1745508051546; Thu, 24 Apr 2025
 08:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418174959.1431962-1-surenb@google.com> <20250418174959.1431962-8-surenb@google.com>
 <CAEf4BzYuA3ZRCwPsAxhQZDOOpjSTrphKEsgPAqgRP8Ly7+fTWw@mail.gmail.com>
 <CAJuCfpE_jJ0Xq5T0HcLpquRzO+NdvN3T3_JXEwSjt2NG9Ryy5g@mail.gmail.com>
 <CAEf4BzYctDuS4DRTzdRQyyhCYvFTggOz=wcbizXEYvC_z_SSng@mail.gmail.com> <6ay37xorr35nw4ljtptnfqchuaozu73ffvjpmwopat42n4t6vr@qnr6xvralx2o>
In-Reply-To: <6ay37xorr35nw4ljtptnfqchuaozu73ffvjpmwopat42n4t6vr@qnr6xvralx2o>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Apr 2025 08:20:40 -0700
X-Gm-Features: ATxdqUFhUQugR6vvry0z8YMCa5qp4tuc1EH-U_8QzRi08SiVqS2WqPXZHYhgyGc
Message-ID: <CAJuCfpGc-23xpEYZQQevkzx+iN3AAqXXzbyqJAQjd4TQP9j9Dg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] mm/maps: read proc/pid/maps under RCU
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	david@redhat.com, vbabka@suse.cz, peterx@redhat.com, jannh@google.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, 
	adobriyan@gmail.com, brauner@kernel.org, josef@toxicpanda.com, 
	yebin10@huawei.com, linux@weissschuh.net, willy@infradead.org, 
	osalvador@suse.de, andrii@kernel.org, ryan.roberts@arm.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 5:24=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Andrii Nakryiko <andrii.nakryiko@gmail.com> [250423 18:06]:
> > On Wed, Apr 23, 2025 at 2:49=E2=80=AFPM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Tue, Apr 22, 2025 at 3:49=E2=80=AFPM Andrii Nakryiko
> > > <andrii.nakryiko@gmail.com> wrote:
> > > >
> > > > On Fri, Apr 18, 2025 at 10:50=E2=80=AFAM Suren Baghdasaryan <surenb=
@google.com> wrote:
> > > > >
> > > > > With maple_tree supporting vma tree traversal under RCU and vma a=
nd
> > > > > its important members being RCU-safe, /proc/pid/maps can be read =
under
> > > > > RCU and without the need to read-lock mmap_lock. However vma cont=
ent
> > > > > can change from under us, therefore we make a copy of the vma and=
 we
> > > > > pin pointer fields used when generating the output (currently onl=
y
> > > > > vm_file and anon_name). Afterwards we check for concurrent addres=
s
> > > > > space modifications, wait for them to end and retry. While we tak=
e
> > > > > the mmap_lock for reading during such contention, we do that mome=
ntarily
> > > > > only to record new mm_wr_seq counter. This change is designed to =
reduce
> > > >
> > > > This is probably a stupid question, but why do we need to take a lo=
ck
> > > > just to record this counter? uprobes get away without taking mmap_l=
ock
> > > > even for reads, and still record this seq counter. And then detect
> > > > whether there were any modifications in between. Why does this chan=
ge
> > > > need more heavy-weight mmap_read_lock to do speculative reads?
> > >
> > > Not a stupid question. mmap_read_lock() is used to wait for the write=
r
> > > to finish what it's doing and then we continue by recording a new
> > > sequence counter value and call mmap_read_unlock. This is what
> > > get_vma_snapshot() does. But your question made me realize that we ca=
n
> > > optimize m_start() further by not taking mmap_read_lock at all.
> > > Instead of taking mmap_read_lock then doing drop_mmap_lock() we can
> > > try mmap_lock_speculate_try_begin() and only if it fails do the same
> > > dance we do in the get_vma_snapshot(). I think that should work.
> >
> > Ok, yeah, it would be great to avoid taking a lock in a common case!
>
> We can check this counter once per 4k block and maintain the same
> 'tearing' that exists today instead of per-vma.  Not that anyone said
> they had an issue with changing it, but since we're on this road anyways
> I'd thought I'd point out where we could end up.

We would need to run that check on the last call to show_map() right
before seq_file detects the overflow and flushes the page. On
contention we will also be throwing away more prepared data (up to a
page worth of records) vs only the last record. All in all I'm not
convinced this is worth doing unless increased chances of data tearing
is identified as a problem.

>
> I am concerned about live locking in either scenario, but I haven't
> looked too deep into this pattern.
>
> I also don't love (as usual) the lack of ensured forward progress.

Hmm. Maybe we should add a retry limit on
mmap_lock_speculate_try_begin() and once the limit is hit we just take
the mmap_read_lock and proceed with it? That would prevent a
hyperactive writer from blocking the reader's forward progress
indefinitely.

>
> It seems like we have four cases for the vm area state now:
> 1. we want to read a stable vma or set of vmas (per-vma locking)
> 2. we want to read a stable mm state for reading (the very short named
> mmap_lock_speculate_try_begin)

and we don't mind retrying on contention. This one should be done
under RCU protection.

> 3. we ensure a stable vma/mm state for reading (mmap read lock)
> 4. we are writing - get out of my way (mmap write lock).

I wouldn't call #2 a vma state. More of a usecase when we want to read
vma under RCU (valid but can change from under us) and then retry if
it might have been modified from under us.

>
> Cheers,
> Liam
>
