Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B5190498
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946489; cv=none; b=OHeXyUjeso+thSK7Lzxa4AeyA3gBy+ckXl4eqjcWhmZwT6lpDSVva9iU2qEvXTzcdSDxt5mGdGV50gBbSrWIq8OJ/TF6DOoqzWxOa1iMmHPg/XH+vsbsiyu44d8bobp4BfdC2wVEPydsi1JBftbp8Mt7uw7vgdrN2aRSYhFHjuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946489; c=relaxed/simple;
	bh=NqZddVCVJU/pv09IR4A6CrG5yZeWaojhzJvlGvi8C/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYwsYbtvtQWuYpgJUNSCvVdvrpVEaYGFxOwplos9EjTd00R4wcyg3/2igJz1uruYuB7OTL8rN58SjTevw8ADo4U6iUwZjdBjSh228+jfig7PX5dVRDy2BoO4iPbfL+1JFpRpZNzLauJWIpSpbsC2NbUAQVPzWaJpGvALCIpJowI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b9KS/Be9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b9KS/Be9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso1051802966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748946485; x=1749551285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkpDFfZ5i7HOcQGzQzekKRtKGEewYp9impWw2CyWJbU=;
        b=b9KS/Be92yKj06AYZtXcR1bx/I449hONd5kETY5kh8J02PSJ05RW9b4fsoiY8ro0Sb
         nhw2BpZS62JJKB8kYu+7NZNqZGiLaxHHWS+aOtlptfqn8h067XsLXYQ2KwGDYnRNITWa
         5N/7i7RJ4cw/vmK13XMwiT6UIrjCrwtpXNg852c5BVTFweLU/xeGUaXN5vgbwfiJRHlq
         8MOyBtBHgEu7qTBOMCtlpKjWnaM+pr0JZ8PcrY0NJCSfy0D0mJPBzhzGx3p5v9FYAL/w
         3MDoKlKZYJjzF54Nh6x9fBztw8C2WgjBrh1ENjTCkXnXaCRJxpNgNe3+WLf7+FDj9OwN
         ZjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946485; x=1749551285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkpDFfZ5i7HOcQGzQzekKRtKGEewYp9impWw2CyWJbU=;
        b=rGoWUkmfOOhVxtvzmBtL0XMomMYpExsuP7OANZRHtO8IQrPdooVdxa4EXT6/9EKUAI
         cnT4aBre4TPJ5MixRqzHnjYBlTgg4+/2bWNwJ9femDNLWqwklgpjHlkbrjAh9jvkUPnM
         ORdy53Boct4RdnYgJ/OYkO26A+mVCCeff2fhjQ9hhxMVORnyxsv2Sk8d/u2ohYFNelef
         Tip0l5BS75qvH+bEJvI/eXORJshhMVYx+U+4FQe+go5By8P/Wsr3IR8w4HOhL5fCHqou
         r5HLHmyFMbEz8WmxYwt+8b9BaiEBLZrRxVX1jtEvx/HL90XdnWJIlzC/EQuPIWVzCV3P
         cu0g==
X-Forwarded-Encrypted: i=1; AJvYcCXv4uYZB6jWKjM+e2Xgim6dpi4YQRynGHEY523/Dz0r7+qpiONmLNSRUtPS5eQl6gF52Xpm344n30Sqskg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlo00npHo8SIrYo6E+PusLIqJ+5gcfpvgw1ZjOFpOR0DHCYBd0
	qRabV5fzpVM9/qABaMYDykFLl+p4pplZW7fqB+k0ATEMKZGpH4LfqcTSQ4gLXrQ8VU6vyIAnsCF
	PbGb9
X-Gm-Gg: ASbGncsCBQ/x/SOEsrmGcgLgZQFoY5u/YGxyb8pgaP6U8ip7RLe3e3bDGxSHnfxUJaX
	hkuSm1TytevT7rIwD3RB4pUJrgilV83r6zsjKPSjgAVrw/oK2xgvyehmwSMcp3un9I1tv/YLzKh
	61UX3hj+NPu93wHsn0D7NGBfGvPGXOrY4tC1td6dDD5c9EwB7/3OCcmxMHafa9BUyuH0tQU0Bm6
	DCfeNWDMtbccUMNtCmdUr6/4iAH37tR2dFs9AviZHQLzQmjJNvbn5VHHZHXg2MULiqP3XtW81Ji
	o0/O6Chl4SYCmYhoQ+pP59293bjS6CQG/rZTmABUMTWmukYx50YJVInFYYlWpX7J
X-Google-Smtp-Source: AGHT+IG04Ee/QV805aMBgvuJh4sGVhSL2Bzx/FAjKhiAOV0XyyL256xfcGp+5HFVq2BopoUl+KthNg==
X-Received: by 2002:a17:907:96a2:b0:adb:335b:decb with SMTP id a640c23a62f3a-adb493e14d1mr1116718066b.24.1748946484834;
        Tue, 03 Jun 2025 03:28:04 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada6ad6ac28sm924861566b.164.2025.06.03.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:28:04 -0700 (PDT)
Date: Tue, 3 Jun 2025 12:28:03 +0200
From: Michal Hocko <mhocko@suse.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
	shakeel.butt@linux.dev, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, donettom@linux.ibm.com, aboorvad@linux.ibm.com,
	sj@kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: fix the inaccurate memory statistics issue for users
Message-ID: <aD7OM5Mrg5jnEnBc@tiehlicka>
References: <4f0fd51eb4f48c1a34226456b7a8b4ebff11bf72.1748051851.git.baolin.wang@linux.alibaba.com>
 <20250529205313.a1285b431bbec2c54d80266d@linux-foundation.org>
 <aDm1GCV8yToFG1cq@tiehlicka>
 <72f0dc8c-def3-447c-b54e-c390705f8c26@linux.alibaba.com>
 <aD6vHzRhwyTxBqcl@tiehlicka>
 <ef2c9e13-cb38-4447-b595-f461f3f25432@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2c9e13-cb38-4447-b595-f461f3f25432@linux.alibaba.com>

On Tue 03-06-25 16:32:35, Baolin Wang wrote:
> 
> 
> On 2025/6/3 16:15, Michal Hocko wrote:
> > On Tue 03-06-25 16:08:21, Baolin Wang wrote:
> > > 
> > > 
> > > On 2025/5/30 21:39, Michal Hocko wrote:
> > > > On Thu 29-05-25 20:53:13, Andrew Morton wrote:
> > > > > On Sat, 24 May 2025 09:59:53 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> > > > > 
> > > > > > On some large machines with a high number of CPUs running a 64K pagesize
> > > > > > kernel, we found that the 'RES' field is always 0 displayed by the top
> > > > > > command for some processes, which will cause a lot of confusion for users.
> > > > > > 
> > > > > >       PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> > > > > >    875525 root      20   0   12480      0      0 R   0.3   0.0   0:00.08 top
> > > > > >         1 root      20   0  172800      0      0 S   0.0   0.0   0:04.52 systemd
> > > > > > 
> > > > > > The main reason is that the batch size of the percpu counter is quite large
> > > > > > on these machines, caching a significant percpu value, since converting mm's
> > > > > > rss stats into percpu_counter by commit f1a7941243c1 ("mm: convert mm's rss
> > > > > > stats into percpu_counter"). Intuitively, the batch number should be optimized,
> > > > > > but on some paths, performance may take precedence over statistical accuracy.
> > > > > > Therefore, introducing a new interface to add the percpu statistical count
> > > > > > and display it to users, which can remove the confusion. In addition, this
> > > > > > change is not expected to be on a performance-critical path, so the modification
> > > > > > should be acceptable.
> > > > > > 
> > > > > > Fixes: f1a7941243c1 ("mm: convert mm's rss stats into percpu_counter")
> > > > > 
> > > > > Three years ago.
> > > > > 
> > > > > > Tested-by Donet Tom <donettom@linux.ibm.com>
> > > > > > Reviewed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > > > > > Tested-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> > > > > > Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> > > > > > Acked-by: SeongJae Park <sj@kernel.org>
> > > > > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > > > 
> > > > > Thanks, I added cc:stable to this.
> > > > 
> > > > I have only noticed this new posting now. I do not think this is a
> > > > stable material. I am also not convinced that the impact of the pcp lock
> > > > exposure to the userspace has been properly analyzed and documented in
> > > > the changelog. I am not nacking the patch (yet) but I would like to see
> > > > a serious analyses that this has been properly thought through.
> > > 
> > > Good point. I did a quick measurement on my 32 cores Arm machine. I ran two
> > > workloads, one is the 'top' command: top -d 1 (updating every second).
> > > Another workload is kernel building (time make -j32).
> > > 
> > >  From the following data, I did not see any significant impact of the patch
> > > changes on the execution of the kernel building workload.
> > 
> > I do not think this is really representative of an adverse workload. I
> > believe you need to have a look which potentially sensitive kernel code
> > paths run with the lock held how would a busy loop over affected proc
> > files influence those in the worst case. Maybe there are none of such
> > kernel code paths to really worry about. This should be a part of the
> > changelog though.
> 
> IMO, kernel code paths usually have batch caching to avoid lock contention,
> so I think the impact on kernel code paths is not that obvious.

This is a very generic statement. Does this refer to the existing pcp
locking usage in the kernel? Have you evaluated existing users?

> Therefore, I
> also think it's hard to find an adverse workload.
> 
> How about adding the following comments in the commit log?
> "
> I did a quick measurement on my 32 cores Arm machine. I ran two workloads,
> one is the 'top' command: top -d 1 (updating every second). Another workload
> is kernel building (time make -j32).

This test doesn't really do much to trigger an actual lock contention as
already mentioned.

-- 
Michal Hocko
SUSE Labs
