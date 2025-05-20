Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADAD242D95
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763097; cv=none; b=qItd46HJpK/P5p6uLLowXL8SISoPqqMyOhZtGWtKWdRz7Kqe32kkAJ+ID9piuwhXaw7IHH3YVOpt8LRIeveuKtfEuMNqoLMsT7kEL9w1fgcLlPtMH4XIN4kItmVU76Y6KlV67EfgZyAPg3dlkZygf4jqJFieZyuDYar1Ncivw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763097; c=relaxed/simple;
	bh=k3pc+Vmiq2E6DnrWV7Ph5skWaJ82V+DmQegI9S6ceq0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWtFbYuxZAFjE3TTt5vDranxkWsO3z6ezjQIlWgWZzfoOdfz7u8d9Q1POGTwvjTuKzgnv5dNDeiQ8i82tPMHfIrvnMVXhVvwFSue+KG9P6myzz4tu+pQOdmpFt8yqhPBS+DmfPKJGbOk4dVh5ammBoY3sPrtUVnoR8Dcftmt5Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv6FIJB0; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv6FIJB0"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-550e2b9084dso6591349e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747763092; x=1748367892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a+243UgmCf5IbLKB0ZKHityJf0HqvyRfIfY7BV2Z36s=;
        b=Kv6FIJB0Kn8K8GEGIEhXthn7lMyKS8DK9MFDV5Kcf1T5+5HgoiNuwyGSwVeLfHs8NI
         68DDzQPgHxTQ28Akf8eE+4id2hYIeMKajq2mmbivCr/HSL52Q4mG6xGrbM2jl2sk639J
         TcADEhHj1lIYmWX5IIKTMKo07pZW0yWUwR//0KIohNDWmhszlawcaPoH+3AUH39tEga5
         JRtvOyEagQxjJOf7551XBGwgKk40ugP72AuBbRQcwcQmULuqHbiAbjJ1Ft6KWg69Ltp4
         xkoPuLeQGrTetVOa0DTYxEeS6VIS4qISdrBbPdXF+FctzmDRzwayix0JPIFcbKnTLbd7
         YQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763092; x=1748367892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+243UgmCf5IbLKB0ZKHityJf0HqvyRfIfY7BV2Z36s=;
        b=Ib39KUA+uBQu/u924VgGEbWPi7/pMYskp4RJ/5PrdDv+zy3Iv8FCEs+FkhIp1wQzqL
         thmYEvSYLVpCvT0IglALdFwOur1CG2RTR023ygsIhUgSboLuWIrHDsi8GWzNq+F7LBKS
         VURR/GCZgJWxdJxbJ5cg1t13jw7VuMCEItqf/6RsLk9oBZNrsxfhHY6rT5oy8SiNZgTa
         R9onwr4DBkxNlAoARjA1pZpVYc8kPTV/v2640sJ9uzfXPf1uoxgKxbc5CICVi05zpnr6
         YMFJzo5Xh/ZeVzw+s0khswTC972dcE4+pu5+ueNaxWM0450OIizhsFpE/nrm2aKk/C4R
         JgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9oyujNozZc/1qnUnn2/XnPEsOt1/PO4PPY0cqO8hOoKYTiE4pNAXJRJlEafu6LaY3qOi1XbuRTmoHgd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+8HmfW+s+aP/3n/E3d2lB0yAsfOKSh1lzZJQfF7RYkgabDU+
	noWboE2bSl67eZGe2gbvpZJpfOHTrXYisIL9EVZ8E9Ui3Lv8AqXL3d58
X-Gm-Gg: ASbGncuzL+6km+3D+w0exo8RXs2vDEySwlof0bnvoBxrJ2cpc6FJqEvcb59/NwS0ln5
	T+PwIAuEL8Id4DWwVroNh+zMi0t5YnzHn9yjl4TTfXECMIk6zYrJ3/l8g8MCG0XnEejF59Xf80v
	xTwPQhE/YhLzh3yQaQ44LszncpIPYKw4kgj2aixHNyEDIlruZaTCfgMSIzpC8JoYX7Jg5Nsu0fL
	MLJnNqbFOJCdCZdWLPQP1yXGYfq6IPVqn8aK7TIe6UcmiozJRnaw3t8IBNa/bpjdpcXQ8yAxNv+
	oYxM0+w7e+ZY3JKZSvoiOX2dXD8HBn/sCKvxbXRY6xHcXFB/7ysQlunkjqhuN6qWUGhDK3vFtLb
	AWWM=
X-Google-Smtp-Source: AGHT+IHHRvZzdql7ekTEH3LaIAy+GxrgL1+bw83RRKPr3GlWv1t7UN97GndnrNTraxLkRHK49olT/A==
X-Received: by 2002:a05:6512:628e:b0:550:e453:f054 with SMTP id 2adb3069b0e04-550e97ce246mr5893036e87.28.1747763092039;
        Tue, 20 May 2025 10:44:52 -0700 (PDT)
Received: from pc636 (host-95-193-69-199.mobileonline.telia.com. [95.193.69.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703ca85sm2458225e87.217.2025.05.20.10.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:44:51 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 20 May 2025 19:44:49 +0200
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, surenb@google.com,
	hannes@cmpxchg.org, vlad.wing@gmail.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <aCy_kfhKfojXYwlE@pc636>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <22oihuvcrh5sg3urocw6wbop2v5yni7zinuhywbz7glsee4yoa@gzi5v5fcggdl>
 <ewn4u5ssskqzad4sjerg6zkxjhvuik6cs4st4jarpizztq4fca@p4wwfavollhm>
 <qn7zsk4clyzstu7mvsy4lucj4m2os7h3rmjoitdl4fjpqa3kfx@hi75pqd6gtom>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qn7zsk4clyzstu7mvsy4lucj4m2os7h3rmjoitdl4fjpqa3kfx@hi75pqd6gtom>

On Tue, May 20, 2025 at 10:28:06AM -0400, Kent Overstreet wrote:
> On Tue, May 20, 2025 at 07:24:40AM -0700, Shakeel Butt wrote:
> > On Tue, May 20, 2025 at 10:01:27AM -0400, Kent Overstreet wrote:
> > > On Tue, May 20, 2025 at 02:46:14PM +0100, Usama Arif wrote:
> > > > 
> > > > 
> > > > On 20/05/2025 14:44, Kent Overstreet wrote:
> > > > > On Tue, May 20, 2025 at 01:25:46PM +0100, Usama Arif wrote:
> > > > >> When memory allocation profiling is running on memory bound services,
> > > > >> allocations greater than order 0 for slab object extensions can fail,
> > > > >> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> > > > >> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> > > > >> of the allocation being successful.
> > > > >>
> > > > >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> > > > >> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> > > > >> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> > > > >> ---
> > > > >>  mm/slub.c | 2 +-
> > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/mm/slub.c b/mm/slub.c
> > > > >> index dc9e729e1d26..bf43c403ead2 100644
> > > > >> --- a/mm/slub.c
> > > > >> +++ b/mm/slub.c
> > > > >> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
> > > > >>  	gfp &= ~OBJCGS_CLEAR_MASK;
> > > > >>  	/* Prevent recursive extension vector allocation */
> > > > >>  	gfp |= __GFP_NO_OBJ_EXT;
> > > > >> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > >> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> > > > >>  			   slab_nid(slab));
> > > > > 
> > > > > And what's the latency going to be on a vmalloc() allocation when we're
> > > > > low on memory?
> > > > 
> > > > Would it not be better to get the allocation slighly slower than to not get
> > > > it at all?
> > > 
> > > Our behaviour when thrashing sucks, we don't want to do anything to make
> > > that worse.
> > > 
> > > There's also the fact that vmalloc doesn't correctly respect gfp flags,
> > > so until that gets fixed this doesn't work at all.
> > 
> > Which gfp flags vmalloc is not respecting today?
> 
> GFP_NOWAIT.
> 
> As to why, you'd better ask Michal Hocko...
> 
It is mainly due to pte_alloc_one_kernel(), it uses the GFP_KERNEL

#define GFP_PGTABLE_KERNEL	(GFP_KERNEL | __GFP_ZERO)

to get a new pte entry.

I think we can fix it. For example if we populate some region and allocate
there for NOWAIT. But there are of course can be other hidden problems.

--
Uladzislau Rezki
