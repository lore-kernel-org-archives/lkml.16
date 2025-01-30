Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3941DDC22
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242228; cv=none; b=I+TgUPFdrMJEpnKkWfQ9lkeGbUcYd3BcVVQ+58wqfEFgoMql81G24jgQrwFnLZei6ZOhW7DVocijOp80Kux89/+c5pFVHEdUZKaUFvtHGGwzKwLQ6l6vtMcDGkvhXzi+LCR9WJBrujq3I9B8JFbBTchCgHVtIVqwzNa97faYUik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242228; c=relaxed/simple;
	bh=Q0IClGwGeXOCP4wz1cN8vV6y4slDvQ+Xep2Xuk7NITI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEAwFtVuQ/qBUkPqpyih5sAg1VYfZxmUY3rIe+f+2YCUAAhsHXyV5bexFBRYwx6KyYNr7c30H6n4Uv//xtFMfVN4MSjcKjWeVEfHUgpjfgxii1dvOAKe+k1POZsnwlGAHHCFYHeleOSDew4EF84edkJxxzy1NZv/CgN69/ZzDVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FqTWl1C6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FqTWl1C6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e3621518so425827f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738242225; x=1738847025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
        b=FqTWl1C6L89cQWejZQodC7l7wJWIolsg6FJ0tViKCjcmL7c9dUgIvSnlQ31BmRxyZE
         HXWkRU/NOAmwjVKfSJLrFs97V3Jt2SWgaGSnfEaQqg4xqaXxHHBD89luvVhbnQ7cR0MO
         XPoZ82NWkdKHZyBgxFu79mSs9/Z4J5JERydvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738242225; x=1738847025;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgiRf9jbTncFOwmj3rTY5I84Nfx6SDCI8aA3yE1P2kU=;
        b=NUdh/r1wnmkM0+cnaZUmnSTuwSvzq2TN/o/iIBAVNweQiT/aafa3AsJbJEcTrJp8Ub
         owrwsAtmAoVVEyd3XGHeJc94+EbAhZfPGFgYH7pCJqIH1EA8mISRfLky4wwY9FZq3JuR
         f1ubIYcF9W7OdRS3moaO36RWJzBHVl0ZrPkj3L36qrGr+iUIInNfK4Lfvpgq3ntcWfJ+
         aoCP5EZywKUf01B93+e3o9Bp0nUTKQIL6vBO74gChLaPDx8kkYmSvfSiiVWNKWS0Mn4S
         Onct4aJVzyJL5i0quHgv9n2691xEXHMpa0AhSl9LFHKvSM4HyY2CyL9aZtdou++m+Zi8
         pjFA==
X-Gm-Message-State: AOJu0YwrVhzMduQn9WdlIALjFsFNuWYGCCfG/vBH2PYE3Rb5wXvTcsjv
	Ch/een0dWvm4biHVrJbx04wg5R7aXielocimBnA4nc9xpyUTIpTmf7M6tMh7w/s=
X-Gm-Gg: ASbGncuLbmxZJYaCjhbIRBYs6Hld0wRww9Yvsz6RpugLDySdBMXCOwuw7gRhqSZdjLm
	GUzZcnzA27xfk8Gj5RYtA5jUstR6NMzSTYbbkkFwIJyiqiRuwQJHsPQ8qHGZstL5alFTc33Hnke
	1Pb1O2RT+roG1+WeHHgRC0iyeAqptNzUzbrFLe47E6Q8eYv0X2ZApoSyNMETtv7JdvYU8zSylCb
	Vh/vAM0vpzgnngsrVS6tkX0BCpUUJhF2C3aQtD8hmX+ifAL3qdA98YZdlvaJeg9QUdqdooz548q
	WQqpgTBlDlAKmoQoNq8fqHiEWwg=
X-Google-Smtp-Source: AGHT+IHJ4PQVE5HpkzCPzrNWq8zl2Gl6Pk4aDkS8eqlkDUfbDlT8A12K1IbiCiXTus+F/gF8+q2ayQ==
X-Received: by 2002:a5d:64ad:0:b0:38b:ecec:8576 with SMTP id ffacd0b85a97d-38c5167b5bfmr7295312f8f.0.1738242225257;
        Thu, 30 Jan 2025 05:03:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm59239255e9.8.2025.01.30.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:03:44 -0800 (PST)
Date: Thu, 30 Jan 2025 14:03:42 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
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
	Peter Xu <peterx@redhat.com>, Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> On 30.01.25 10:51, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > can_change_pte_writable().
> > > 
> > > Set the PTE only dirty if the folio is dirty: we might not
> > > necessarily have a write access, and setting the PTE writable doesn't
> > > require setting the PTE dirty.
> > 
> > Not sure whether there's much difference in practice, since a device
> > exclusive access means a write, so the folio better be dirty (unless we
> > aborted halfway through). But then I couldn't find the code in nouveau to
> > do that, so now I'm confused.
> 
> That confused me as well. Requiring the PTE to be writable does not imply
> that it is dirty.
> 
> So something must either set the PTE or the folio dirty.

Yeah I'm not finding that something.

> ( In practice, most anonymous folios are dirty most of the time ... )

And yup that's why I think it hasn't blown up yet.

> If we assume that "device-exclusive entries" are always dirty, then it
> doesn't make sense to set the folio dirty when creating device-exclusive
> entries. We'd always have to set the PTE dirty when restoring the exclusive
> pte.

I do agree with your change, I think it's correct to put this
responsibility onto drivers. It's just that nouveau seems to not be
entirely correct.

And thinking about this I have vague memories that I've discussed the case
of the missing folio_set_dirty in noveau hmm code before, maybe with
Alistair. But quick search in archives didn't turn up anything.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
