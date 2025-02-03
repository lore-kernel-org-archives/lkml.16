Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6774501A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552438; cv=none; b=NbezVc+W2A63myf83vyvrCQnnVfL8n891dm4dPQy/YfZ7TtMqi8OVM2kAuYhdEWqzh6d3UoYXKls4qmZAUFamUTSsmkezYmrjfa/MVvGnSwJwvL1+UvCAVT7Dpebg25K+FbYUi5MuPSwZ+Mytynx54fJU08YBJkPl+UCI82ZLn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552438; c=relaxed/simple;
	bh=9bN6RzdhaS/AmH9Bmmw/dUFNN4DGtir/svp4R+IMcCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/o+rIhLVHHLsvVBDlDdl2AuW3rrMePyc0NMc5AaH1aeVyG7t8DGEAxRBvQU1OB3yCO0/7YujrGC7t8eVr8NAapYaVwvYLZtrLCtb+9gogW7OyZWbl+tz9MDLlmSH6OJXldBqDVNd14YGXGzk3MUmOqSrsh10PgYfLVphQGUTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dhVySeyy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dhVySeyy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so6788810a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738552436; x=1739157236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYP5JZw9enwSAcD80b42q4URYMXFfjhtW+2lwITmu/8=;
        b=dhVySeyyQuJ4w5O8uYXK8m4hXw6oxXhMTOo4iGLWAI53KOvkw9LNrlQJaqe9z6pnqR
         FfmXZSL+Dod0tuK1ubrobVccuPlTusyuc+be3Y4kzblawGNJX4HU/sAA4VzTB22PLul1
         qo/17TuaOzsuG4ekiWqMLZleKgLNAteyi4MIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552436; x=1739157236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYP5JZw9enwSAcD80b42q4URYMXFfjhtW+2lwITmu/8=;
        b=Vpllv54Mj3QnPl3eyj2J+lcZ/JuKH3Ubg62n9qbV7v4PiVyKxIMisoGF/9hfc0jt4d
         wnpbusYkJEU1ELJ0/fklnSmTIIZc9+G44UZtUD9DQZj3flAUYik94oxM+Uk94Bn11oVc
         twnt1cuMStdUOIETWmrZcwG2dlbWBmU76hxSd5jhQ0+50Mgri7sESf2HgwP2DPvU0Za0
         GuSRVFpLXCpRxOWmCZiBeDnCxmp23SPW9Ddal8LMOqYq5wuQdqFo7nYipGNC6Q39duiA
         9ahAbe8J/10m2O6SFw38/skySkBkcSdUjVjJ4g90Ujq+wKsv8UoLY0UWP58VgM34LT41
         cx6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5mxiCFaU13sGtgnLX0t9xsPcT9ovMzPVMpk2zmFSsn6b6aqp5HeA3rCksWkb8+hFzEzQGCkrehOmo3sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz33UP08mJgotzK53xXt+JKeH1PPLLRtX5eyBgrkyyFjnuQMf+c
	Xon72uOHYVPyDl4BXPs0/zWz+bWxS0rTXbiFxmhg8wzlsMUVEQd9yVLzk9krbXnR+RWaq3Ii/Qg
	=
X-Gm-Gg: ASbGncs7usPTywUlnurRGe1YWODbvNEspSyeVh4FH4d1jH7FDumc48oeUqxk6IJBW/l
	YFl//qrkEU4wQQiPUeDsJXEIDfSkWsMe9TJXiVZXvGXwmpT2InQZn4NdeEzsrfk/t3b2eFhtG8B
	BtyocXfVBTvBaWKdgLSGHYMbCjbvHrBhxmf63Xn/PWbXQvqoEuwGo13R62FaqScMFfNUGqrkZRt
	mjcF65j6h58ifExd2uYDwKFyZY8BM7Kc7UP+SfjamHL5kR8+hFG6SdB5DVsjge+LPvfZItHNofg
	CqZHhGCJyZZ5oyyO
X-Google-Smtp-Source: AGHT+IHMO7w1Wk5ujysTU2+lwr2NDUbJbqgHPbRD6QwvxnV19TA5HwYvsQ/c36OpS88s6BWDcglyHA==
X-Received: by 2002:aa7:930b:0:b0:726:8366:40ca with SMTP id d2e1a72fcca58-72fd0bbd6dcmr28760348b3a.1.1738552435960;
        Sun, 02 Feb 2025 19:13:55 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a742sm7251708b3a.165.2025.02.02.19.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:13:55 -0800 (PST)
Date: Mon, 3 Feb 2025 12:13:49 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5zxlRkdseEJntFk@google.com>

On (25/01/31 15:51), Yosry Ahmed wrote:
> > +static void zspage_read_lock(struct zspage *zspage)
> > +{
> > +	atomic_t *lock = &zspage->lock;
> > +	int old = atomic_read(lock);
> > +
> > +	do {
> > +		if (old == ZS_PAGE_WRLOCKED) {
> > +			cpu_relax();
> > +			old = atomic_read(lock);
> > +			continue;
> > +		}
> > +	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
> > +}
> > +
> > +static void zspage_read_unlock(struct zspage *zspage)
> > +{
> > +	atomic_dec(&zspage->lock);
> > +}
> > +
> > +static bool zspage_try_write_lock(struct zspage *zspage)
> > +{
> > +	atomic_t *lock = &zspage->lock;
> > +	int old = ZS_PAGE_UNLOCKED;
> > +
> > +	preempt_disable();
> > +	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))
> 
> FWIW, I am usually afraid to manually implement locking like this. For
> example, queued_spin_trylock() uses atomic_try_cmpxchg_acquire() not
> atomic_try_cmpxchg(), and I am not quite sure what could happen without
> ACQUIRE semantics here on some architectures.

I looked into it a bit, wasn't sure either.  Perhaps we can switch
to acquire/release semantics, I'm not an expert on this, would highly
appreciate help.

> We also lose some debugging capabilities as Hilf pointed out in another
> patch.

So that zspage lock should have not been a lock, I think, it's a ref-counter
and it's being used as one

map()
{
	page->users++;
}

unmap()
{
	page->users--;
}

migrate()
{
	if (!page->users)
		migrate_page();
}

> Just my 2c.

Perhaps we can sprinkle some lockdep on it.  For instance:

---
 mm/zsmalloc.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 956445f4d554..06b1d8ca9e89 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -308,6 +308,10 @@ struct zspage {
 	struct list_head list; /* fullness list */
 	struct zs_pool *pool;
 	atomic_t lock;
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	struct lockdep_map lockdep_map;
+#endif
 };
 
 struct mapping_area {
@@ -319,6 +323,12 @@ struct mapping_area {
 
 static void zspage_lock_init(struct zspage *zspage)
 {
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	static struct lock_class_key key;
+
+	lockdep_init_map(&zspage->lockdep_map, "zsmalloc-page", &key, 0);
+#endif
+
 	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
 }
 
@@ -344,11 +354,19 @@ static void zspage_read_lock(struct zspage *zspage)
 			continue;
 		}
 	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
+#endif
 }
 
 static void zspage_read_unlock(struct zspage *zspage)
 {
 	atomic_dec(&zspage->lock);
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	rwsem_release(&zspage->lockdep_map, _RET_IP_);
+#endif
 }
 
 static bool zspage_try_write_lock(struct zspage *zspage)
@@ -357,8 +375,12 @@ static bool zspage_try_write_lock(struct zspage *zspage)
 	int old = ZS_PAGE_UNLOCKED;
 
 	preempt_disable();
-	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))
+	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED)) {
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+		rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
+#endif
 		return true;
+	}
 
 	preempt_enable();
 	return false;
-- 
2.48.1.362.g079036d154-goog

