Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA8010E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896544; cv=none; b=kNAKMTOeuB5wGfp2kcPvxEr4hg1PjLabKynfHDBy5Ztgvzp57zesCP0fTuTmOdtyqgzUSMSm5LcGs/SqG7eufgcnZ6i77l9sOTNHI0qHrklUajY+uhCejuXETZN+f4E64L/jbZ+MCswkGYgA8iCnURCF/0mjwSClTkVKJqT0bTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896544; c=relaxed/simple;
	bh=QEhUVfPU71NR2gfUnxJGJc3iV+hQ99DlptFuwMSl5Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwaJgWboOQOHog/YJrzHywazYtgaowcDLqR74MZKWJG6J/WsKKOXqBaG6bsPry/REp/qOBB0iNb12xh0li9ShpGzqzOREr5I8WCk6qQ5esDCWUJEIl+lqOsfdtlNgWAVZwZzgs1bBm+AXohAG/bMFQdDtI5cTUE9TeR8+goSlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mKbQrBp+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mKbQrBp+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so1333346a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738896542; x=1739501342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O7ZHdaJk5DR7YHLi1M3nG14eg8BwZlAqP3ArtZ3bjsE=;
        b=mKbQrBp+zQ9NC3f71zzS5cyBmnoednSeFKXdD6gdYzlnORx7n6uAmr2YZBWSahmbkr
         +0MdgTrMB1U7aTboHJ9eM5F/nniBZTX7CRfzwUHq1h1oUMDMM8DllhMQ5/zeNgkAKNM2
         i3DBlbrYuZ+3UoZI6cr3mLrcolvtBKxffS7Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896542; x=1739501342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7ZHdaJk5DR7YHLi1M3nG14eg8BwZlAqP3ArtZ3bjsE=;
        b=cIeHCkKb6NTD0nFsX+8ZcU42fYikyI3FNBqlF81+912Sd79WeR59dq4AuM3USd022h
         hZEjSGLcxF72Hw6wxYzMehAkVuTAJcxxasyKy24G8SPQOjkxA+of0nBdF7xk29Puf54f
         4EM/FBEvsNcmpa8F6z5dnNQH86DDw2gGE9a6wGCRi90Cr2W1CBiFWpixz/wVPLsz6OOu
         YNVv0M/wuAQ4hSfKuDFTlqlU6oHWyYjHLgfJIIldeDSBDB7zD14c50bPQdag8UTqJO9w
         JTFNCzUU0dHDd1mv0tdEOdo4CwTIQx8oqdAzGqPyqcy639FNBidPHLRgGTI7ZAcfAN0H
         4Hsw==
X-Forwarded-Encrypted: i=1; AJvYcCVnzWBUP2Tittg05p12vfveGlhwJwIwN6JYqiVi+0frMancFYDsPdGk4j0rNx47JRSa5mj6KiFxkNLd0Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWxb4CMdRUZti4KQ1mip7rtQ0mvf2AQdZGq/qv6scW3fXDVYip
	KFWH6G/jcNNCTdAZANiBlhv3e6AQZScqDWqSzwkN351vnUgS/kBiKzLKmw0ANw==
X-Gm-Gg: ASbGnctSKnQOOB93pEZvn+XGCA2BVp92U/wTDu7BITh6RUkKUH4wijoG9aKZDQf5orh
	oJfMVb9+NhSjfP9k+xdTYPE+AD4kw0XKuKJCdziRcktHU4CfiaMTCLp7d6SrN7qopefgwqbtzse
	Sd40yxlbbEzAm2ojYrOWy1g7S2LO3tGuHqRujEfN+tDFfh/2z5XQt3jDICJrBO+EL34VUlKM0Lo
	GnzsfwyugljdKexv7ZrhoGyuMlzMv5RQyDjndWallbo1y+T7jAc3fdSVy2TGu+eEanRqZyFcgjd
	L3Xw28kABEBhxH1lb70=
X-Google-Smtp-Source: AGHT+IG8PO2N4vMXFVcdu1RO/X2wMCwPsupACJLDO7sya7f/yy8LAI7XAeuXB6egIhMDMkTteBDvIw==
X-Received: by 2002:a05:6a00:3d16:b0:72a:8f07:2bf2 with SMTP id d2e1a72fcca58-7305d44e557mr2886062b3a.9.1738896542182;
        Thu, 06 Feb 2025 18:49:02 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048e205b5sm2041684b3a.176.2025.02.06.18.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:49:01 -0800 (PST)
Date: Fri, 7 Feb 2025 11:48:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <wnffho5jguo24wfy3qv5tvovoargezbu4kcvpk43ludrhyfo6i@6ogtvk5ivfjc>
References: <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
 <Z6O2oPP7lyRGXer_@google.com>
 <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
 <Z6ThGFt6wyNpx9xi@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6ThGFt6wyNpx9xi@google.com>

On (25/02/06 16:19), Yosry Ahmed wrote:
> > static void zspage_read_lock(struct zspage *zspage)
> > {
> >         atomic_t *lock = &zspage->lock;
> >         int old = atomic_read_acquire(lock);
> > 
> >         do {
> >                 if (old == ZS_PAGE_WRLOCKED) {
> >                         cpu_relax();
> >                         old = atomic_read_acquire(lock);
> >                         continue;
> >                 }
> >         } while (!atomic_try_cmpxchg_acquire(lock, &old, old + 1));
> > 
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >         rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
> > #endif
> > }
> > 
> > static void zspage_read_unlock(struct zspage *zspage)
> > {
> >         atomic_dec_return_release(&zspage->lock);
> > 
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> > #endif
> > }
> > 
> > static bool zspage_try_write_lock(struct zspage *zspage)
> > {
> >         atomic_t *lock = &zspage->lock;
> >         int old = ZS_PAGE_UNLOCKED;
> > 
> >         preempt_disable();
> >         if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >                 rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
> > #endif
> >                 return true;
> >         }
> > 
> >         preempt_enable();
> >         return false;
> > }
> > 
> > static void zspage_write_unlock(struct zspage *zspage)
> > {
> >         atomic_set_release(&zspage->lock, ZS_PAGE_UNLOCKED);
> > #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >         rwsem_release(&zspage->lockdep_map, _RET_IP_);
> > #endif
> >         preempt_enable();
> > }
> > ---
> > 
> > Maybe I'll just copy-paste the locking rules list, a list is always cleaner.
> 
> Thanks. I think it would be nice if we could also get someone with
> locking expertise to take a look at this.

Sure.

I moved the lockdep acquire/release before atomic ops (except for try),
as was suggested by Sebastian in zram sub-thread.

[..]
> Seems like we have to compromise either way, custom locking or we enter
> into a new complexity realm with RCU freeing.

Let's take the blue pill? :)
