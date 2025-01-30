Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242041E500C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243767; cv=none; b=gNKpadPepmAViFNifwRRVMdGM/bE90vTmBidv85bSRoRckBvTEofqPnl4kE9bwHKWLeURFntVHqDozFgj0nf+JtcYqK034h1yn4AHEPHRIvylSP8BdLvqoZevREFFwxLqq2DlXVmhtEngEHPX/wY+MQpg7UsQPBTW4An7QUdoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243767; c=relaxed/simple;
	bh=IA2AYWgASgTVsPLMAQ+5QlptVsAG3A5jBmXDiVJ34Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfZfRSIBmMFpIqULCEEU+nzNUKR0Sot6r2gMd/i2tC0x36mF+FB0bmiRUZDcyPt/1tQBZFdqHdHqRUjIZLANCvriRqsAIpw2VxeoJFnFNnLJEQjIeXX/ufEVokBzVosuUBNM9C78sRDgN6oNLuQvFuSSXN7wRRSTTbyw8v9o6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Q/Rfrnmn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Q/Rfrnmn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f664af5so9201285e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738243764; x=1738848564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
        b=Q/RfrnmnUhOH/loe9DMsfKO12wKxPMz/0uXgDG00ZJ0fFHt7FLzKDZYdca9CTfuZVM
         PgOr5ogXurVKgoSpl29vE2Nhc4x1oB5BPOUuQR8sDhfTYXwFT/T2jITUoTFCPXlHEi0l
         gjcD4F7QOjK2oCszWn/2c8HXpU/qmyksKMUYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243764; x=1738848564;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CwN17MyPFKvtC6C01wmuj8jHUuL8qlluAzeR7k1VHs=;
        b=YyyGjfBBfWw8kqDKEBvwmA3F2WyhrWISP1zYtf3PqOAQrLbdnTWs1NsXIsa5qqdnl3
         z4Uz4pA8Gsc7eifIjKDHEnYtsnEmyy/1lx4a9aRCK2TdaeVDtebPNmGiv8eZ7avkSFHj
         +fpM42xKBzHX1OBJFlcqrB8bYgicCNnpQhSQrvTaqK7Gyd0NqiKaN144PX5YsixxBUiy
         N5xMhzEiGiFgememR95IoCy3sbWSmKQelyD7SudFrJ/37NFmtX1aWELeUjmo4doEvQjm
         /lLaIGA8F0U6QKzJeysnMIs+sRmjPGxZddQIuX+6p8QFggqkyuLj5X2/mXH8eVM9e5OY
         7zhA==
X-Forwarded-Encrypted: i=1; AJvYcCWC9L1c6jKUPRJO9FvG51cLWI5pWOiYjgNmh2kP5U60dKILLFO8mbQncz6evXSg6SDCjefHa42dos0T87g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCrhRoyGX40JVfIRigoT1QOriy24LT8fy1+dMU6m8+H0JqTFkB
	sUXyFlvVUcttpHWCW7/b1eWVMI9WqsPrkfB5GpwQbekP9MoysHEnt4/oLpW9J2c=
X-Gm-Gg: ASbGncvzpjJQH/lw24IrZfuuXAFHh9YOb/i/jfeKgnAeiygjLrRoHdeWsFcYFFT2r7C
	2fVDKvztHT2+6FbFvxWIXvyruY5dT9D38IVcVUQendmiAHxwvckEdbSQnxYw82/gPT7IEkYlkgL
	HQ8lE7DVLwhmKwoqguCHcSs/a7pnaFoKb11CiZruhwYqA+VDnEC7nBbridbWQ9B2U6AFDjSXkut
	3VR5z6GxtkR+AZ57bb3yadJSaY+24sbmt4tVDv67Bey1tGf7Yi9/iffKokDYo3+cOduAjLFkLc1
	8efDdy9o5pEoHi5inhEl9kMGwfc=
X-Google-Smtp-Source: AGHT+IHdrFYxzPnGyvPL9diVxB5aO5ood/KWzCJUp9hx1GIy5lqLPzKFdL5gi+Wc6C+yM8JgD/EQ9Q==
X-Received: by 2002:a05:6000:2ce:b0:38c:3eab:2e13 with SMTP id ffacd0b85a97d-38c52093f22mr6600046f8f.46.1738243764347;
        Thu, 30 Jan 2025 05:29:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c13a0efsm2028563f8f.60.2025.01.30.05.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:29:23 -0800 (PST)
Date: Thu, 30 Jan 2025 14:29:20 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
Message-ID: <Z5t-sFymrz5kFafV@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
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
 <20250129115803.2084769-3-david@redhat.com>
 <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
 <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:28:00AM +0100, David Hildenbrand wrote:
> On 30.01.25 06:34, Alistair Popple wrote:
> > Looking at hmm_test I see that doesn't use the sequence counter to ensure
> > the PTE remains valid whilst it is mapped. I think that is probably wrong, so
> > apologies if that lead you astray.
> 
> Yes, the hmm_test does not completely follow the same model the nouveau
> implementation does; so it might not be completely correct.

But unrelated but just crossed my mind:

I guess another crucial difference is that the hw (probably, not sure)
will restart the fault if we don't repair it to its liking. So the
hmm-test does need some kind of retry loop too somewhere to match that.
But might be good to also still land some of the other improvements
discussed in these threads to make make_device_exclusive a bit more
reliable instead of relying on busy-looping throug the hw fault handler
for everything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
