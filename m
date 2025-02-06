Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734E1487F8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812530; cv=none; b=vC1dV1MR5Kat8Wqhl6sJFlWzbCUfklEnAyJdOVMjR1l/32t6eITXYhvqTRytVtaDgJRZIuCNZi8cwbsMyaD/F8r/Sxndj0u0JzN/PHyqJEw+X3Z7uoWNMTNGZK30c6Elg9RJmM/kj7kWBkA+H9dBOWCPNy6t5J9Clr5TLMQL64o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812530; c=relaxed/simple;
	bh=+6tY1r98jz6nfpFhyHWiCQ/pUE5fZBx09FlOur0DrgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWm3U5BlNcim2HWNpd5bfV7AsdQa0mkfhGIy0IoeVkV/5AWWRwLYmHk9esMQ3Bivy677Zj6R23+gy/ReZbKR2tBaW5Wx5qGwUH6rWcAeYv2DYkyS9xz3P7Jv5sXWE99p6aEmdFCeIlxrolAt6w09yUlQ7F8dR+2+uJoRT+L+aXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DAn/INVb; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DAn/INVb"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166f1e589cso11310075ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738812528; x=1739417328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+g0ejIcnXuY8hjbs7xRY0Z3QUoGwxUypy8GQhbjoWtU=;
        b=DAn/INVbjDSk+gq/sRW+wPTPAMF9GT3MO/ZbmCCODGz9krC3GDdtP5dqgBGAAga1g+
         KWpNMTN4ToNtQxg2Zt+g5nq3R5obRFHOcyY1hW1vC84HbaEw/zY4F0Xi34LPetILSM5j
         3lUXrP0ozVbmcTrZMrhoCByksfCmGDaU3yUm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812528; x=1739417328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+g0ejIcnXuY8hjbs7xRY0Z3QUoGwxUypy8GQhbjoWtU=;
        b=VU0jNjETddY4JcUpW95lNY7G3QAYqmj+BWqhmol3Q4/APdT65/wCYNdRFp1/I1Kt4Y
         FNJ5mmTMvlMeV5zTWNhUgOOrVk6Wz2Foo4N9X9OUF8E+QY64g94pcTGJ9uUJYiduBO9S
         7CUg9OREETTQ7Fr6vx7gPMzRZfqtZERNvpL1F1IesyJyIDsgD0suJQyqkxoQlCe8K0Wx
         zSSovtAF2i9+BPYWmLe7jbxgzCH75v2Fp8bvnpLTMEiBIrk5k1ZmhVmIPQOpyi3l8Xo+
         UegiAALR7b0YL87EYmotxPFLbi5aaeNL8yYlfgzak3Zw2dGjFdGuPevRwrEq2HEUpzu8
         hX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXDrsIuSdPIrospaWsC4FoPfKvOsLjtOl5Taa54JoBpCot1dcIS1sMMgj75XlFWGb8M+KqkYzIoWt10ez0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFquwhzUPiQogznIxAlaJ6kb9iAPkT3WAgGD2KdzmLNxPHf8e4
	t+8/joTdFu0sM4/YJlT8sBIVMIdwaqga1quzsoCK+afD0Lm+P8pCvxHtEoVlvg==
X-Gm-Gg: ASbGncvP1GTbvzfgB2mOkpD/IVrBw3/vQ6y5QVfH28HIx1O5WDubto85yUkvKqYtU/G
	CtYsP+tiT0ljkRZ/cz6Wnh/UUBuEmpzPUxVJ1ftsAsSUizcDf20MPJyv7OF544aYsGxd1ILNhyX
	4k2lDZ9ohqlw/l4bRLckZZLHjrn8i1rG6MJgDFWt8R+8/xpIs+oE1qS5s/nTb1vG5nktfyAGKLb
	XkOTK0YA6ML3nP7DOoO/Y4Gnif928neFw7MB0+LBE3+QzVbudhah8kJykrQZz8VecnBY4EYVg4x
	t0rWk2Rf3fSVBvBu4CE=
X-Google-Smtp-Source: AGHT+IHU28dRZEUxuuwRF/LDqZGMYBA1c9FDhEstdn9sQppVTpBL+mHe8Vz6f79joKWhyNwK6UyMlw==
X-Received: by 2002:a05:6a21:1805:b0:1db:dfc0:d342 with SMTP id adf61e73a8af0-1ede881f0f6mr10219727637.7.1738812528071;
        Wed, 05 Feb 2025 19:28:48 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b2ad:5851:6fc0:11a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d4c0sm233095b3a.22.2025.02.05.19.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:28:47 -0800 (PST)
Date: Thu, 6 Feb 2025 12:28:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <mgvallgt7a65q6comfgz7kreksbes2dxipmkez3a6b6tgqznz4@3txnoxq2tbkr>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
 <Z6Ew9AWNHacRIfhA@google.com>
 <lxottj72e7jcqw634qwudpsyqckfrvpmlhra43en4zlrlz4cip@erufv6w4n5j6>
 <Z6JMIKlO9U5P-5gE@google.com>
 <6vtpamir4bvn3snlj36tfmnmpcbd6ks6m3sdn7ewmoles7jhau@nbezqbnoukzv>
 <Z6O2oPP7lyRGXer_@google.com>
 <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6uhsj4bckhursiblkxe54azfgyqal6tq2de3lpkxw6omkised6@uylodcjruuei>

On (25/02/06 12:05), Sergey Senozhatsky wrote:
> 
> Sure.  That's what it currently looks like (can always improve)
> 

- added must-check
- added preemptible() check  // just in case
- added locking rules list

Oh, and also switched to acquire/release semantics, like you suggested
a couple of days ago.

---

/*
 * zspage locking rules:
 *
 * 1) writer-lock is exclusive
 *
 * 2) writer-lock owner cannot sleep
 *
 * 3) writer-lock owner cannot spin waiting for the lock
 *   - caller (e.g. compaction and migration) must check return value and
 *     handle locking failures
 *   - there is only TRY variant of writer-lock function
 *
 * 4) reader-lock owners (multiple) can sleep
 *
 * 5) reader-lock owners can spin waiting for the lock, in any context
 *   - existing readers (even preempted ones) don't block new readers
 *   - writer-lock owners never sleep, always unlock at some point
 */
static void zspage_read_lock(struct zspage *zspage)
{
        atomic_t *lock = &zspage->lock;
        int old = atomic_read_acquire(lock);

        do {
                if (old == ZS_PAGE_WRLOCKED) {
                        cpu_relax();
                        old = atomic_read_acquire(lock);
                        continue;
                }
        } while (!atomic_try_cmpxchg_acquire(lock, &old, old + 1));

#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
#endif
}

static void zspage_read_unlock(struct zspage *zspage)
{
        atomic_dec_return_release(&zspage->lock);

#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_release(&zspage->lockdep_map, _RET_IP_);
#endif
}

static __must_check bool zspage_try_write_lock(struct zspage *zspage)
{
        atomic_t *lock = &zspage->lock;
        int old = ZS_PAGE_UNLOCKED;

        WARN_ON_ONCE(preemptible());

        preempt_disable();
        if (atomic_try_cmpxchg_acquire(lock, &old, ZS_PAGE_WRLOCKED)) {
#ifdef CONFIG_DEBUG_LOCK_ALLOC
                rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
#endif
                return true;
        }

        preempt_enable();
        return false;
}

static void zspage_write_unlock(struct zspage *zspage)
{
        atomic_set_release(&zspage->lock, ZS_PAGE_UNLOCKED);
#ifdef CONFIG_DEBUG_LOCK_ALLOC
        rwsem_release(&zspage->lockdep_map, _RET_IP_);
#endif
        preempt_enable();
}
