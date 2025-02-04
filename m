Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EE35947
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738642956; cv=none; b=gUgjGBwiHYo6qzID7abKkcuTddPy1gjxcWfFrKnVYpEpr8TzJzSSu2oZ+ueOu2WXeqWpmSWIN/4+G70yp4acE86pxOzWe9kMMbQcS30kIu0TEubXIoAeXWmBq/miSR7iMcNNnmApaAV6XTf8CwGRbJQbFLJpd+H5cAe9yTT6h0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738642956; c=relaxed/simple;
	bh=RFftQlqwu43c2RGFb4sQqbba40HbHMVWx7eOjdFZABE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia+4wt5wlBPc1Kti56UmH2nFM0i6zdZyaOZpCemTrhNI7shWoCOHt+FgINyVffATrOGy+2Gj69oTKEUYc70TTQnyWkYFgiG+zCc1Dp33u7jrcCftg0btEFiK11ETesurLj1MKyxhRe+t/7mBsxr5YGQnYOZVCT6icaVk5UMp/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jLVbLWK3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jLVbLWK3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2165448243fso2303905ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738642954; x=1739247754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rc4bDG3SGydOD+ZuvmEf+a/gqsZFMtyGrtKHk7cNWO8=;
        b=jLVbLWK3/71MQL3KYgkK46gHc9A2L1cUO70wVfoymNCUvafbTsdDXV2kyGAw3FVdZu
         zF6MhdhJ7OuoY5rMYvoZN2a39aQW2qmdSaGkGEVOR5YrejjuBK1mdLIgXmqcmIvOe0Hu
         hrxYNDxxh3RRgadbEbEjC7BH6qpEu6qKb9bRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738642954; x=1739247754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rc4bDG3SGydOD+ZuvmEf+a/gqsZFMtyGrtKHk7cNWO8=;
        b=NA3S73xqoNJCsRKkw69h1beG0mGfPWLSaxiKHj7cBgp5CZEQqEm052Uj9LGVNoxajp
         nV/gEe308xwnYSd9q9iPYUpMZjF5jV53eAnE3bO9cn73IqhChqvUiVshQmWleleyOJ/X
         vmsvFYIkAGqSO/CI6zf2GJLo140jcv0g27Jp0T8WOvP9kLirWqhLnW1jkcM1qrUIxGOU
         arAvTalvC126WyyIewQsWr04M16L347bmQQWATU5k91PtnBbnXGD+IeeLXp1mFEgB01W
         F2M9HqtCczgZkMqZLQn0FQE8fcY8ydZkxcfm8Y9bxDTJ4SWMoFUGrppZSM364c2u9Ock
         qSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR/tHrVxC0nulnLzOm+F4jPicstv1obYq97C0VZYdXGrhMM3hBw6mmw1mOZlHPkXZFhhTOpw60232TWHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4J28PRgU7zPx/BBk+CpV6XyX3ro05mzFoTc8tz2RHhN+dARjk
	v8uu4Q7V57lUcj4kIrpUkoigwYT++vFx3i6haXPiB6ARLlGSf6t2PZ72dvF/IQ==
X-Gm-Gg: ASbGncs0/JSzJH+WHz/KoGjruqy89ALv8DWHiwoBugI5waGrSCBd7npuRPP3aCGU51U
	xdohF48NuZk9qN6uIKW4/7bbtrL1eqzTvrij6Ieu3rG0FHYkrj0/zSL9HIDlUTxjdFLf3aN4eNv
	VB+OfbY/YYWM4rIVH8K3LtcqEYDcbOC0vxc0b/vTob4CC6gprYc86A/NTWdjsWCQ5Ru9lgRFJK5
	83dXF2//hP0ZwLGLnfWAHGPvhRwUtjmZw1GRoq4Q8jbJxzAW0YvMtxdKfusOzXgpmGptrwmj+SK
	biS1swn44Zl0588oRL0=
X-Google-Smtp-Source: AGHT+IGeUuqlU4nW5QSaICnqjG0mh9pK18HDDmBT+ouXrQsSDd5A04dfnIFBd/Ax32OlGt9k1ZHy6Q==
X-Received: by 2002:a17:903:40c7:b0:215:e98c:c5bc with SMTP id d9443c01a7336-21dd7e38be7mr412325445ad.48.1738642954481;
        Mon, 03 Feb 2025 20:22:34 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b77f:f2de:f99c:2d0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee01bsm84512885ad.47.2025.02.03.20.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:22:33 -0800 (PST)
Date: Tue, 4 Feb 2025 13:22:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <meorepggpsz4t3akwbmpyprhffno5xtex63ykuxy3t75n5vm77@shnc6m7pqtbc>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
 <20250203161958.b529e20fb7aa07645ed029eb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161958.b529e20fb7aa07645ed029eb@linux-foundation.org>

On (25/02/03 16:19), Andrew Morton wrote:
> > On (25/01/31 14:55), Andrew Morton wrote:
> > > > +static void zram_slot_write_lock(struct zram *zram, u32 index)
> > > > +{
> > > > +	atomic_t *lock = &zram->table[index].lock;
> > > > +	int old = atomic_read(lock);
> > > > +
> > > > +	do {
> > > > +		if (old != ZRAM_ENTRY_UNLOCKED) {
> > > > +			cond_resched();
> > > > +			old = atomic_read(lock);
> > > > +			continue;
> > > > +		}
> > > > +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> > > > +}
> > > 
> > > I expect that if the calling userspace process has realtime policy (eg
> > > SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
> > > and this becomes a busy loop.  And if the machine is single-CPU, the
> > > loop is infinite.
> > 
> > So for that scenario to happen zram needs to see two writes() to the same
> > index (page) simultaneously?  Or read() and write() on the same index (page)
> > concurrently?
> 
> Well, my point is that in the contended case, this "lock" operation can
> get stuck forever.  If there are no contended cases, we don't need a
> lock!

Let me see if I can come up with something, I don't have an awfully
a lot of ideas right now.

> And I don't see how disabling the feature if PREEMPT=y will avoid this

Oh, that was a silly joke: the series that enables preemption in zram
and zsmalloc ends up disabling PREEMPT.
