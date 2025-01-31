Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76101F03DB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738344018; cv=none; b=dPXrI8hnjnT2LC1aEaZnEymTsEdGfnPbTYsrRF9YDjk1ZaEub+OhIIoP3C7tlZJebct7V0yMV1aMauk1Tf2vuEVQMfAABxcZJJsswiPlL10DSYItG1H6soFXkyEkwXTuapTelhH6Sh0H08v3wY797sQNk2BTDzIFBFZk1wfu19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738344018; c=relaxed/simple;
	bh=8sjfkqn3wc5i2JMW/Mdq0y6A+BEzr6rAOYGigl6nFLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYLJhcr/LigRWYk+8vgQGVAhzgmELv04wkEDzlPCvIrGuzlz1Ff9UNEMOPTTrrNNvPOwcVzL6Wp58XjWHuEDXkzZFVzFltBiw528huzPmdNDeqUVCHgu1MrZBCchHGd8Y3uRM+4tycxXzWEZtgxFUZqk8YR3YTT4RfQflBK7F1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=X/gpcWvZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="X/gpcWvZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1980800f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738344014; x=1738948814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xczt2wiwP9aoq6grPvh88tM/HM9YU6nKxYw7mbHJ51k=;
        b=X/gpcWvZPKCya4RF1tQO2RNtCs9MnUayWkzDSJR4i1Ka6LYn0Bc5VRVJKfvjNYDY5t
         QIiqvzpcWJVcu97uutdmCvikf8P1kbH/wUFo5E9mFFh3ijyLaNrliBZoCBF8ydDhl1Oi
         hlOJxmUYI5yT1pLxXi8W85dVs852vkhwvjyCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738344014; x=1738948814;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xczt2wiwP9aoq6grPvh88tM/HM9YU6nKxYw7mbHJ51k=;
        b=w7zPxUkA8eTgdOciybU3Hi9iDxgFsp6cmdkoldvrLmasw4wKQSl0tfocNtSkecNcxl
         jkBCN8Jfwq/BHzHn2zvggdwAkEUChyOD4FzsyxoA3EEZzR/nOPSw4heOvXsPpFL6Kn/Q
         xSM8Q47uy2ycP+LNx2xD4Jf9JaQhoN4THmYssPPp8qbIxZ0eVM8ko64LB8nRP7oxeloq
         IAYvtbFJcaF/0SIrDh4XDmjPP5Rkl7G3g3BWY7OX5dI4kMzdk8d9ubfIS+FOu+v56tOd
         ql27XhhkkWouDKXfbXU920rRAJQHrz4XYQycuTTKVBcBPoIoBCUZw6LanxhksK7KEX/e
         vEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQOutTddZ4qKyYd/0Rz+22x2YdoST72HmrRaY90b0qOZtuWqQ7Sve9e9B1fzUcwPM0VAK/vjWlvTLgi+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CkgQcsWQrN88D7jn+T3L8VeQ7AXwIdwEpy3ktLMU87/86M0s
	m408Bbu6LLYEHoZSXSYdi4zVaTGU36pRVojlkx/EVEwohg1i8HsKfwR6TxOvRDo=
X-Gm-Gg: ASbGncsALMj6G3kxTmG7lPjp7pljefLusx8oKZ2KXq9ig240PcTCkQhF5omPXCbsvTj
	Mqgt23zvizJzSyq7a8+f2qmMgYSelJKfv5MpnOI/3MP3JesjCJhxlK64OoF8lzcfox5V4UHvk2R
	CQGTMnhW0HLQmeVqoD+cCaomYTMtwu6pxXUAjFPvWhjIUQ5pOsOdFhrpbSA4mkjO522iI4IeVTg
	Uc6ItTWDf5yAlUZ/FtUOlhfadAbA6iRElFfwKQEOwWdBf4KUo5jCwmmgiuFG4NfK5YTnAzipNHM
	Egpu/COteFDszRFXOFKwA2pN3No=
X-Google-Smtp-Source: AGHT+IEBqHvHKIqdGp0t4Qh+w+AOU1lOYA0A7nG1BCLDh39RGEo9xrVIZ8SI5EuvHfApoC/uo/mR7w==
X-Received: by 2002:a05:6000:bd0:b0:385:f64e:f163 with SMTP id ffacd0b85a97d-38c51967e87mr7449467f8f.32.1738344013909;
        Fri, 31 Jan 2025 09:20:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122707sm5254768f8f.50.2025.01.31.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:20:13 -0800 (PST)
Date: Fri, 31 Jan 2025 18:20:11 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z50GS-RM03E7Usmi@phenom.ffwll.local>
Mail-Followup-To: Alistair Popple <apopple@nvidia.com>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
 <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
 <d27c35d5-918f-4550-9975-eb7ba59ac9be@redhat.com>
 <upvlv4b2zly56trmoaocs5gl34ykd7tjz2grzqtwkfy45gbm7l@uxsmqdjgyo5n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <upvlv4b2zly56trmoaocs5gl34ykd7tjz2grzqtwkfy45gbm7l@uxsmqdjgyo5n>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Jan 31, 2025 at 11:14:06AM +1100, Alistair Popple wrote:
> On Thu, Jan 30, 2025 at 04:29:33PM +0100, David Hildenbrand wrote:
> > On 30.01.25 14:31, Simona Vetter wrote:
> > > On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
> > > > On 30.01.25 01:27, Alistair Popple wrote:
> > > > > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > > > > Let's document how this function is to be used, and why the requirement
> > > > > > for the folio lock might maybe be dropped in the future.
> > > > > 
> > > > > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > > > > the GPU got a chance to make forward progress by mapping the page. Without it
> > > > > the CPU could immediately invalidate the entry before the GPU had a chance to
> > > > > retry the fault.
> > > > > > Obviously performance wise having such thrashing is terrible, so should
> > > > > really be avoided by userspace, but the lock at least allowed such programs
> > > > > to complete.
> > > > 
> > > > Thanks for the clarification. So it's relevant that the MMU notifier in
> > > > remove_device_exclusive_entry() is sent after taking the folio lock.
> > > > 
> > > > However, as soon as we drop the folio lock, remove_device_exclusive_entry()
> > > > will become active, lock the folio and trigger the MMU notifier.
> > > > 
> > > > So the time it is actually mapped into the device is rather
> > 
> > I meant to say "rather short." :)
> > 
> > > 
> > > Looks like you cut off a bit here (or mail transport did that somewhere),
> > > but see my other reply I don't think this is a legit use-case. So we don't
> > > have to worry.
> > 
> > In that case, we would need the folio lock in the future.
> > 
> > > Well beyond documenting that if userspace concurrently thrashes
> > > the same page with both device atomics and cpu access it will stall real
> > > bad.
> > 
> > I'm curious, is locking between device-cpu or device-device something that
> > can happen frequently? In that case, you would get that trashing naturally?
> 
> It results in terrible performance so in practice it isn't something that I've
> seen except when stress testing the driver. Those stress tests were useful for
> exposing a range of kernel/driver bugs/issues though, and despite the short time
> it is mapped the lock was sufficient to allow atomic thrashing tests to complete
> vs. having the device fault endlessly.

Yeah the practical use-case of device atomics is that they alternate, as
the processing shifts between the cpu and the gpu. Classic one is when you
generate variable amounts of data per input block that you fill into a big
preallocated array, and the atomic counter is your dumb-as-rock malloc for
that. The atomic moves as the generating/consuming of that data moves
around the system (and needs a fault each time it moves), but you really
never want to have concurrent access going on. Any thrashing concurrent
access is just broken userspace (or a driver stress test).

> So unless it's making things more difficult I'd rather keep the lock.

But why do these stress-tests need to complete? We have a lot of these in
our gpu test suite, and we just nuke them after a short timeout if nothing
blows up. Concurrently hammering the same page from both gpu and cpu
really isn't something that should have any forward progress gurantees
imo. And I feel like too much locking just risks us hiding some much more
nasty (design) bugs underneath - I've had that experience reviewing both
amdkfd and the in-work xe code. So my preference for gpu interacting with
core mm is that we have the least amount of locking to make sure we really
don't have a breaking design impendence mismatch going on.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
