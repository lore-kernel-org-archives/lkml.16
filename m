Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B4139E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738294495; cv=none; b=aZjFB4Ze/xYjEpKAyElI521f4WEY44GHFe+nfETh+VJzot1Qrd6MCGSXPQcAi49i8ZPfbfBz9upM0V48vwiJvFr3mwVGhC4N6Thr+AmmPBgQMDcau5X3fTJf9hGRZ21Pyl0agcryKD3vaR9Cp/KWsEnXTnPR7lB6fSBWe11zSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738294495; c=relaxed/simple;
	bh=N0sx+iPMuAqNEclN+D3TjbfcoEASQMbbhnntoORpJ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsjTez0XaLfXOwLILLIlJJIQ0zKW9/c6dHupn3ssHW/SsIHEhbDXxZ+Yq2Rll5UZihzjyGHs/GBqZLLzllFhKD0wYgdVa12F2wiiqAKc21trYiAT8LqxWABA9EQPkwHJpc6bysH8odth0EDwyz20yYApK2Fv3eEs3rXIVdsZHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AlYL5tHV; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AlYL5tHV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166f1e589cso37238145ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738294493; x=1738899293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32D3HUGqP+ZFdFEF3wCZMSpfCGFHL5f2rNBX8ncFDZw=;
        b=AlYL5tHVgK+Xj3CixKhz1frlle2lgQmvTq7o2JkpVic3bPQKvsLVx4zmw14vmDLok9
         EqESX2ibtogbfGLqVmB7SFXiTCFoyXh9kRvBXb+BY8UgEJnxXrcolN5lHZJxrxjHlKzk
         BERuJ2rTWJGkePrfWgdSW0CPESJHiOymfQ0JQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738294493; x=1738899293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32D3HUGqP+ZFdFEF3wCZMSpfCGFHL5f2rNBX8ncFDZw=;
        b=gKYMhozc1S0qSoKtNGg3veAs2mIELz2WV5/Npv5mAMQPp9qLIRmGD621TQP0tKbDMn
         N9MLYOzaoDJORCvM2r5eWpGqM4/V9IZRsZXKx7dF70ORJSr2TiSU7vEswLT3jsleWljE
         ebrnwbkm7qPeQev7RcCq3DbHF6hz/5iKV9zOBS7MXIG6Aj9Xprxg4QwTlFDxD6yrXmN9
         ra6NQVaQPDQnSTfGRaxWhNEfMvc5jit3s9V5Ujj04O4FA0zdpNdaUnoMuU8qKQQM4EjA
         RQxkbzbl6QaUz7Z3NJ4JyBGTdvUDoO+njiztkMLupJzHJz28DKGOY3oEnyh0YcvtkDhj
         hN3g==
X-Forwarded-Encrypted: i=1; AJvYcCV2QiEp70eY43VXr3O9s7yUJpS3KAM2flekgoDCiIyBFKuqY8zJdqESuS592EQxgfieXUxwrirgsVxlE3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GVPkTDTgi26F/blliXuy6xnQz7XY7r7f0z1dbYQc/j78b0pr
	dVliQCHabv7UtQt/CUgtsCEfqshvRyJ4V6ZkBbnS0eL4A6X1Boa1/x5mdUF0oQ==
X-Gm-Gg: ASbGncu1cD/ztwCJSYl+OmizqGmzjCzk5gucnXVe60ymgYWtXRJr9+87OuLaxd+x2kl
	pR+ePvWIYEo5sIxSl6bGU5Iv9WVPhzIpg07i2/+1kC7Qs/JFx6xOEtR9TFjbKxbZ/Ekmyfsqn+R
	E88E7tbVq/RZ9qVseK8Pt8eJ/mcuttFXkut4Cojq16OFurBTDnfodBTfacG7PZmhimTWz0ert82
	9pS9tJX3k3zaoUmsfuppqO79xQkVLrVzccoS6so+eysZDpmp8c6kZeE+UpkZEOtMENC6ANKmrYX
	ZWMGH3UV+HLyO3rN7Q==
X-Google-Smtp-Source: AGHT+IEsFmLz+qIkj1EMr+GV0ijOaTbWPrqW3Z9zAfyz97XMlXwIn3rQRlPiOINIpfAoYRkCaZtcHQ==
X-Received: by 2002:a05:6a21:78c:b0:1e1:9f77:da92 with SMTP id adf61e73a8af0-1ed7a5ee31emr14721480637.33.1738294493029;
        Thu, 30 Jan 2025 19:34:53 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a75bsm2224113b3a.167.2025.01.30.19.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 19:34:52 -0800 (PST)
Date: Fri, 31 Jan 2025 12:34:47 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 1/6] zsmalloc: factor out pool locking helpers
Message-ID: <qazrxmu2bdvsned3dp2fnoyagdsv4ueh57pghhjz5q7fmv5pz4@vzlp5kmcw354>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-2-senozhatsky@chromium.org>
 <Z5pec33BWqdH_rCN@google.com>
 <blqetdedmmvheg4qri2o4gxbtiq7lz5ufcpacrrw7yvej7rcnp@i46mdzf7gqhk>
 <Z5un85j5P2Z7B9sg@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5un85j5P2Z7B9sg@google.com>

On (25/01/30 16:25), Yosry Ahmed wrote:
> On Thu, Jan 30, 2025 at 01:01:15PM +0900, Sergey Senozhatsky wrote:
> > On (25/01/29 16:59), Yosry Ahmed wrote:
> > > On Wed, Jan 29, 2025 at 03:43:47PM +0900, Sergey Senozhatsky wrote:
> > > > We currently have a mix of migrate_{read,write}_lock() helpers
> > > > that lock zspages, but it's zs_pool that actually has a ->migrate_lock
> > > > access to which is opene-coded.  Factor out pool migrate locking
> > > > into helpers, zspage migration locking API will be renamed to
> > > > reduce confusion.
> > > 
> > > But why did we remove "migrate" from the helpers' names if this is the
> > > real migrate lock? It seems like the real problem is how the zspage lock
> > > helpers are named, which is addressed later.
> > 
> > So this is deliberately.  I guess, just like with page-faults in
> > zs_map_object(), this naming comes from the time when we had fewer
> > locks and less functionality.  These days we have 3 zsmalloc locks that
> > can "prevent migration" at different points.  Even size class spin-lock.
> > But it's not only about migration anymore.  We also now have compaction
> > (defragmentation) that these locks synchronize.  So I want to have a
> > reader-write naming scheme.
> 
> In this case shouldn't we also rename the lock itself?

Yeah, I guess, I thought about that for a second but figured that on
the grand scheme of things it wasn't all that important.  I'm going to
resend the series (after merge with zram series) so I'll rename it, to
pool->lock maybe.

[..]
> > > I am generally scared to move hot members around unnecessarily
> > > due to cache-line sharing problems -- although I don't know if
> > > these are really hot.
> > 
> > Size classes are basically static - once we init the array it
> > becomes RO.  Having migrate_lock at the bottom forces us to
> > jump over a big RO zs_pool region, besides we never use ->name
> > (unlike migrate_lock) so having it at offset 0 is unnecessary.
> 
> What's special about offset 0 though?
> 
> My understanding is that we want to put RW-mostly and RO-mostly members
> apart to land in different cachelines to avoid unnecessary bouncing.
> Also we want the elements that are usually accessed together next to one
> another.
> 
> Placing the RW lock right next to the RO size classes seems like it will
> result in unnecessary cacheline bouncing. For example, if a CPU holds
> the lock and dirties the cacheline then all other CPUs have to drop it
> and fetch it again when accessing the size classes.

So the idea was that offset 0 is located very close to low size classes,
which are a) not accessed that often and b) some of them are not accessed
at all.  I don't think I've ever seen size-class-32 (the first size-class)
being used.  I think for some algorithms compressing PAGE_SIZE below 32 bytes
is practically impossible, because of all the internal data that the
algorithms puts into compression output (checksums, flags, version numbers,
etc. etc.).

> > zs_pool_stats and compaction_in_progress are modified only
> > during compaction, which we do not run in parallel (only one
> > CPU can do compaction at a time), so we can do something like
> 
> But other CPUs can read compaction_in_progress, even if they don't
> modify it.

Yes, well, that's the nature of that flag.

I'll drop patch, I guess.  It's not worth our time.
