Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FD322B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738209683; cv=none; b=j+/zJeWMXqxjzUSISv2zx3fdlvkav4xEbHNmMYljlL9xt+Wi2e263sIUBOzpE+jr4FzxOZuTFNAR9A1RiNQE2GI2lLj8+sZPqaE4eob7Ffm7LQkOuGXvZrEYz6ampcb32nkRmYGnz7xqw9XZbxmxPWvrYViOq9VXjxI/Par54qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738209683; c=relaxed/simple;
	bh=PV8nfgwTwA7j63svevJB609ywAeUXgfMZaeFvagixUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMGdzSC4GnYpmSBHkgY7Uglah1yQJRLTUbUR3itLKzyUiW733cyPxqYUI9PKgGbTZvxycui6G+6Y1hLGPy1M4Q0+ROETLQTXX3AbXf8dus6RQ9/JTudCvsaiwzjoWn1N1/rJ7QBgIE4+Kn8ZhWltyojP/NQdxQEpTkgHsA/6wx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I9nmItCb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I9nmItCb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso7404075ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738209681; x=1738814481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hVhgDYWdgmBmFX69W+KC+RzCnVk6gFSJciJit7shNE=;
        b=I9nmItCbpCp9NqEgP34aNWW5INxz8RrIbdQE5c6zulvelDopl+/LuQrQnEiiPlWNSh
         D4hjfptAGjCkJ6LqOk+xIeShhsDuv3BU9sFinGA3ki2EX3RrKmy24ir/kgr7gd6qn43B
         u+TbKpdbhcYS+oLp804kWDCec/heBTs2yJeGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738209681; x=1738814481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hVhgDYWdgmBmFX69W+KC+RzCnVk6gFSJciJit7shNE=;
        b=poa4g2tndpkGxFOkQUTVIvZWXTh4TgW5SHxc3Wc5i3Yg/stywoXfi4u6GTo5idzeW3
         Vr290LzddnUqtWw4/BmNdXpIV+SQZ8js/4ih9HEtqA9tcc95ZYV8LGq+vN8TVCcms6e9
         4IjSKolijXYc+5Pu0EfpPfZdt0k7NM//W2teWGCoxnuhV01zpoUnsOUTrmYbXxQTa5Wm
         4/Hnj2zcgEQ0UzGVDawCgqkFQ0sa/ebLhOR2GNh+UygI4sr9R1A+e3mWr68pqQIVaEkI
         w3SKioTHoRNqUFWuJ4JCp2+kGU+0IC5akAkX6b+19Y0hmm287DZMgCFJb6xv3+dkQEtg
         +cYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqUZ3EzZ1uLFXB5jscI1gRB3HY0og0CTE2KwbqbnKFBRqI3EkOFAdmg120HRVWpYYi3PGh/keHyGwQkMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweQ/wFmv51OfHWtg/erjvli8wSr5dw/bcNwDl6okWbTxtnMl2S
	r73Bh6Q7xn68AzHUD4zNf2FTw7fBNS8i6DACmcqCChQntgwl07goJItPTu0+R2f1v8eLRrj0mig
	=
X-Gm-Gg: ASbGncsf4LWjf0BuR64d4vCW6U8lECE3IeNbqqYG3KXQR2Voh690V0FbkGqjG2Cs4dB
	J6n6Yg8PnPiSaKtb4DbJIvVCsEg8OLvJlYejUvHawq/UGUCAVSevCQDb8qzMPixSFgtjctkQ+Zs
	ytBN4sY/fkiGzz6IsV/A+gWE7bELL5CV/Ou+dSqZQpMJDTpdDr3UcUYfg0BrrwQLtOIA/Zn0w7X
	mO3qTPNyEwt/yR0jeKy1Ux4PIS7A7iHhONjG1F5zx3QcdqrPu0ixbNlSRJyYz37Bk8mtvS+aqbZ
	wukbBscstPbJlDcY0n8=
X-Google-Smtp-Source: AGHT+IHv4h2aDNStCJ9Jiihz/9zu58ILtvcW39t0Uh/3SEdXBTJpO2f+RHWrNht/wapJ7ehu3KMDyg==
X-Received: by 2002:a05:6a21:348b:b0:1e1:bdae:e045 with SMTP id adf61e73a8af0-1ed7a535e98mr9805762637.23.1738209681278;
        Wed, 29 Jan 2025 20:01:21 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424f8csm341096b3a.44.2025.01.29.20.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 20:01:20 -0800 (PST)
Date: Thu, 30 Jan 2025 13:01:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 1/6] zsmalloc: factor out pool locking helpers
Message-ID: <blqetdedmmvheg4qri2o4gxbtiq7lz5ufcpacrrw7yvej7rcnp@i46mdzf7gqhk>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-2-senozhatsky@chromium.org>
 <Z5pec33BWqdH_rCN@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5pec33BWqdH_rCN@google.com>

On (25/01/29 16:59), Yosry Ahmed wrote:
> On Wed, Jan 29, 2025 at 03:43:47PM +0900, Sergey Senozhatsky wrote:
> > We currently have a mix of migrate_{read,write}_lock() helpers
> > that lock zspages, but it's zs_pool that actually has a ->migrate_lock
> > access to which is opene-coded.  Factor out pool migrate locking
> > into helpers, zspage migration locking API will be renamed to
> > reduce confusion.
> 
> But why did we remove "migrate" from the helpers' names if this is the
> real migrate lock? It seems like the real problem is how the zspage lock
> helpers are named, which is addressed later.

So this is deliberately.  I guess, just like with page-faults in
zs_map_object(), this naming comes from the time when we had fewer
locks and less functionality.  These days we have 3 zsmalloc locks that
can "prevent migration" at different points.  Even size class spin-lock.
But it's not only about migration anymore.  We also now have compaction
(defragmentation) that these locks synchronize.  So I want to have a
reader-write naming scheme.

> >  struct zs_pool {
> > -	const char *name;
> > +	/* protect page/zspage migration */
> > +	rwlock_t migrate_lock;
> >  
> >  	struct size_class *size_class[ZS_SIZE_CLASSES];
> >  	struct kmem_cache *handle_cachep;
> > @@ -213,6 +214,7 @@ struct zs_pool {
> >  	atomic_long_t pages_allocated;
> >  
> >  	struct zs_pool_stats stats;
> > +	atomic_t compaction_in_progress;
> >  
> >  	/* Compact classes */
> >  	struct shrinker *shrinker;
> > @@ -223,11 +225,35 @@ struct zs_pool {
> >  #ifdef CONFIG_COMPACTION
> >  	struct work_struct free_work;
> >  #endif
> > -	/* protect page/zspage migration */
> > -	rwlock_t migrate_lock;
> > -	atomic_t compaction_in_progress;
> > +
> > +	const char *name;
> 
> Are the struct moves relevant to the patch or just to improve
> readability?

Relevance is relative :)  That moved from the patch which also
converted the lock to rwsem.  I'll move this to a separate
patch.

> I am generally scared to move hot members around unnecessarily
> due to cache-line sharing problems -- although I don't know if
> these are really hot.

Size classes are basically static - once we init the array it
becomes RO.  Having migrate_lock at the bottom forces us to
jump over a big RO zs_pool region, besides we never use ->name
(unlike migrate_lock) so having it at offset 0 is unnecessary.
zs_pool_stats and compaction_in_progress are modified only
during compaction, which we do not run in parallel (only one
CPU can do compaction at a time), so we can do something like

---

 struct zs_pool {
-       const char *name;
+       /* protect page/zspage migration */
+       rwlock_t migrate_lock;
 
        struct size_class *size_class[ZS_SIZE_CLASSES];
-       struct kmem_cache *handle_cachep;
-       struct kmem_cache *zspage_cachep;
 
        atomic_long_t pages_allocated;
 
-       struct zs_pool_stats stats;
+       struct kmem_cache *handle_cachep;
+       struct kmem_cache *zspage_cachep;
 
        /* Compact classes */
        struct shrinker *shrinker;
@@ -223,9 +223,9 @@ struct zs_pool {
 #ifdef CONFIG_COMPACTION
        struct work_struct free_work;
 #endif
-       /* protect page/zspage migration */
-       rwlock_t migrate_lock;
+       const char *name;
        atomic_t compaction_in_progress;
+       struct zs_pool_stats stats;
 };
