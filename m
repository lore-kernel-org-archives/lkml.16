Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028EE2AF03
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738243915; cv=none; b=gbZjClYDid5IRbVUcjSKXK/Vp8zjQUnUMl2VHZJv/7bzJCt7X0kqMAiH3myaEDUZbFmt+ebh2OOwv+P24kTskLfhn/hzpoGg4hG6IPeILOrYbb9Xjn6hgvzndDh8abl33QlTqf2+rMLXnp4mSbZwd+L5VGzNNvRc9iiErWnKSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738243915; c=relaxed/simple;
	bh=LD9Lbp6T0cZSqTiHjOVO+0MqqWN1TIO1OH0hJeFVo50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKGPSyfGPpY+1WFqdp0S6Yf6mprWqd0uTXMvq8Pk7jKxDhNHwNUA2R3ba0m+JRYerwqK4/BJq15HNiThG8CiDybMSFm9RPn3uokA5ti5xEUn1fuKnbeOItibRyyJTkWkQzR4jE+nlqHXJuCRyF0j0Oodcz8s7LLjdCHFV5sP9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=WO4KKYzE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WO4KKYzE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e27c75f4so675603f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738243912; x=1738848712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
        b=WO4KKYzEFakrr3ZSnPpBBF/gRr3akWbkk2hjywW39MfhprMI5/jqdzwDWyMx5rn1qX
         MiZJqwxtzN9vGRNXXq1TKPq/8myNIHUXRWNSw2JVG+ZYNMO4Z8IxfYShd4/YzBAv8/uT
         P6Ukd5yPaHipmFNsceSFLUFt6ahFOnalfCd1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738243912; x=1738848712;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HfypuIQboTZvpun4E8zdORtqN9UpDgcxhaup4sp9X8=;
        b=v2Z09upaixtUednGdzQW7By+HTaMNm0RvsJaij33azewfFqb4jZVdlHRitoBagxxax
         SxHqxT1z/d7WsaNNjHr8iu2bcZLX8UP7JpPxdTsPjoxO8uCBHDAxYNIZthyzLOZTUoDY
         f33BtjbC+JQ8G++HWgKzkgZeGHvTIz4fOU3eW6X80V4CLiUz0RiLujWJEZTs/ZfbqWhX
         Dc/WUlQAZWv0GpQ9K97kkiPj4VtglpPphGrLWscvhsO+QnC8+RuitUJrFn3BVSCJI71a
         qooRaglulbDCY1Y7Ed/31GujxOR6aEv8BGKFlTxMBTXGv7n/4FGTyOTP7cnk3Y212iwc
         55iA==
X-Forwarded-Encrypted: i=1; AJvYcCU1l6t9QcX6RRFONR++fATD6PNaFB650dFqg3gwGjOEkNwhIK6N8I3gXFwUIxP7G+DWoYxYBAh2xubF+0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQX6mBb6e1nM0V+/A9jwF7Fh6eUvQ8m3qsg9aFyndYFdL0UKZZ
	Ncs9xnu3L/xz9BoMSp9g9yqJ/Pioyv9fFv5a5/A2f0CzpiPPgQ7VXhmaf6dV8Dc=
X-Gm-Gg: ASbGnctfdXm9tj5zCGbpxMgpiUxy4Ot93cG1bNh9KU80uLUj1dLuQW1bCBNa+KueqF0
	SQs8qW9XMOdzSSvgfZ49MkjU7k2xybopMc3qFwikf1whkZvMWN9e0PneGA0JvZtBn5wlo/MUp4/
	T52h9+Gs6Ogd5t6ExIQ35PGNDH7yFMMeVOCUeCKf9TEJP7r2zOWgcwEePj0E9PVJRC3hafyU4o4
	8ddGdruT2zZ9ySh5dPrdgB1Pmc1/SVJE6cgS5GJrq8xCPjCoFfYth/qXql8p2u9cn/xpJbduJbm
	cOKOMUvZgrLRC0ur1eghvoT0Fbc=
X-Google-Smtp-Source: AGHT+IFMswZ2dc1PUK9As+fnPUJ+YPXY0lrKZKSyFsUE3i9ImUyvh7RLGwzxoWBETKt22tExTSNKvA==
X-Received: by 2002:a5d:6c65:0:b0:38a:4b8a:e477 with SMTP id ffacd0b85a97d-38c51969b28mr5731448f8f.22.1738243912301;
        Thu, 30 Jan 2025 05:31:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf831sm2033238f8f.90.2025.01.30.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:31:51 -0800 (PST)
Date: Thu, 30 Jan 2025 14:31:49 +0100
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
Subject: Re: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Message-ID: <Z5t_RebEx6Mj-KlT@phenom.ffwll.local>
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
 <20250129115803.2084769-5-david@redhat.com>
 <7vejbjs7btkof4iguvn3nqvozxqpnzbymxbumd7pant4zi4ac4@3ozuzfzsm5tp>
 <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfc4f8ac-80c4-472f-85fc-36ffcd212441@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:37:06AM +0100, David Hildenbrand wrote:
> On 30.01.25 01:27, Alistair Popple wrote:
> > On Wed, Jan 29, 2025 at 12:58:02PM +0100, David Hildenbrand wrote:
> > > Let's document how this function is to be used, and why the requirement
> > > for the folio lock might maybe be dropped in the future.
> > 
> > Sorry, only just catching up on your other thread. The folio lock was to ensure
> > the GPU got a chance to make forward progress by mapping the page. Without it
> > the CPU could immediately invalidate the entry before the GPU had a chance to
> > retry the fault.
> > > Obviously performance wise having such thrashing is terrible, so should
> > really be avoided by userspace, but the lock at least allowed such programs
> > to complete.
> 
> Thanks for the clarification. So it's relevant that the MMU notifier in
> remove_device_exclusive_entry() is sent after taking the folio lock.
> 
> However, as soon as we drop the folio lock, remove_device_exclusive_entry()
> will become active, lock the folio and trigger the MMU notifier.
> 
> So the time it is actually mapped into the device is rather

Looks like you cut off a bit here (or mail transport did that somewhere),
but see my other reply I don't think this is a legit use-case. So we don't
have to worry. Well beyond documenting that if userspace concurrently thrashes
the same page with both device atomics and cpu access it will stall real
bad.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
