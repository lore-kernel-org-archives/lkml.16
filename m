Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CC1514EE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829870; cv=none; b=dgMueemKa5FZ05cy6AslQgbYJsDjxaBvgnKalbO16wQGdTeTmch+4sNEuTfmsDL3iyIzJIDxRnWrgRVq5fxkS2ygmauQQUI1vdHq72HMSTOs6TX377lUHvtNs27AdM37K3rDuPkSLXuTAGN9kh39DlC7jdWXlj88nbF5FNjZvcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829870; c=relaxed/simple;
	bh=czouCpqQfjVttyULuEmK+T2XOCbpSZFdhFe3OY88D5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRkqOYgzodZ6A81MzXh3GF6Un10PWMdqqYYmRD36GTTtY+zx+sTzVX/CN8rr8k2tWeeYwAL/psThd1rwNGIBhJF9NkbfBajwRtqZWpF5JssAJ9ZeCY23hMIJutXv2O7nELFkPNigSVOCzaJLZcMervkHo4w1reL/C49picmvajk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MwtQRCzd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MwtQRCzd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa0892f9bdso493651a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738829868; x=1739434668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9oe91G9hNaSNgYF503OR+S362GbG5+I1hQS7YeBtShE=;
        b=MwtQRCzdXFT0KcantDg+qgQrG3ScbIntZpCrdfr0Hu9hbtTuZJCOC96sxDofCFSgVw
         C9df3spV1nrFJlR7dM1S9j0GyhzxejXN65iHgUgj5Sy9hTIqLGVE4e/WeQxG02jnGbSy
         pV7mo7AqswVpdYqnFg5dfRgeO30T2jZg6p/tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738829868; x=1739434668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oe91G9hNaSNgYF503OR+S362GbG5+I1hQS7YeBtShE=;
        b=o9kOVwhfrDQw7/G33XHCMrkxrJ/uZ4+6K/M4FeBUA3kkMXUZIU1bYUDd8XrRUmfmdr
         aN5US5RdG7A7UBjKjfh38U7FZMsvO9XUcavBBwYrUyYZTOSZt+u8Udlsq+g4OE+XC0N/
         c+r9HqbqRKhl4B7v20ss/LKkjjVhklJx8DzgZS7FqWMICijInBhv0AXGkDyRLk8dMqXJ
         bIsFOjF+uW3+bHLBQ6KPqAtGw7jgrhN8mpCnFieV0jr+3I1ZtSc+aN4BSlPwDajAR7Xc
         ecoSjFS+uah1H0P7piiGWywTmxXOg8srHIfdRJR3qoapKVUDIGedC1TqNCHM2EzaUCbv
         17Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXGh2eek7t50B3Z58fs1L/Ww+ou6c+72CA0+NcbWnKkJu8zGWCkrpa15VYgUgud7cU3EBw9fX56xTkQUho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVfn4mvezlcEbS9Kx54CGcf97886F+AtQqScuSUIseXVguEs6O
	IWwj4CuDUuJOe/OWFDnbUyScnNZKHFgbiGtpJrClR9w1dB7OwWdGY/dTYyiyWg==
X-Gm-Gg: ASbGnct6iCrWxRJ/JgEkzGTUfDiN3CiA9L8DkAE5Aj/iFJe+xubXw+DkZf/hPDS4Wb9
	Hi55O7hS/NFQJHl/gYl2UebfantkC8lfmJ86bpk7PpKTY8K0BOPPbNTx0ablVr9Z/XOksNarRPg
	zwCr/Nae5Xyaj55BiQ1TpkpxwtLGyuXaJryDDLdhEIYuOItmk40vPsUQnPUBoQHhpvyMHD22ml6
	D+qQbR7jgXLUHiKFDt6o9Xak1Ym2KI2SY7ci7rZS6SFUfySeIG/4btQ4iKNwYBDLjTEdJhUD8qb
	XEoO6AwVqMdrLec6XxA=
X-Google-Smtp-Source: AGHT+IEk4LAp45w4mBnPz0SZo6Gix5e57Ek87byk1GF2LNYFwZOzzfnGW41X9gquKkKnPHTSNDoewQ==
X-Received: by 2002:a17:90b:3a88:b0:2ee:964e:67ce with SMTP id 98e67ed59e1d1-2f9e074c8c0mr8662855a91.3.1738829868521;
        Thu, 06 Feb 2025 00:17:48 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687bb28sm6783035ad.162.2025.02.06.00.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:17:47 -0800 (PST)
Date: Thu, 6 Feb 2025 17:17:41 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hillf Danton <hdanton@sina.com>, 
	Mike Galbraith <umgwanakikbuti@gmail.com>
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <zgaitute72xlzukunnhioqk4e2copgtkonxtn7iuvjq6gufwhr@yg4kry4wq3p2>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <itapje7ikrv532bwn67udwtjmmmyqp6j4yqc777smbi4rjgmm6@6se3rdy6ufbk>
 <20250206073803.c2tiyIq6@linutronix.de>
 <46ttdyaiweca7qou2t3mx5jy7hefg3htrv4covt5htcex7zaq4@p6is3ukmtbhy>
 <20250206081326.xMa5Z5oJ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206081326.xMa5Z5oJ@linutronix.de>

On (25/02/06 09:13), Sebastian Andrzej Siewior wrote:
> On 2025-02-06 16:47:02 [+0900], Sergey Senozhatsky wrote:
> > zram is atomic right now, e.g.
> > 
> > zram_read()
> > 	lock entry by index   # disables preemption
> > 	map zsmalloc entry    # possibly memcpy
> > 	decompress
> > 	unmap zsmalloc
> > 	unlock entry          # enables preemption
> > 
> > That's a pretty long time to keep preemption disabled (e.g. using slow
> > algorithm like zstd or deflate configured with high compression levels).
> > Apart from that that, difficult to use async algorithms, which can
> > e.g. wait for a H/W to become available, or algorithms that might want
> > to allocate memory internally during compression/decompression, e.g.
> > zstd).
> > 
> > Entry lock is not the only lock in zram currently that makes it
> > atomic, just one of.
> 
> Okay. So there are requirements for the sleeping lock. A mutex isn't
> fitting the requirement because it is too large I guess.

Correct.

> > > > static void zram_slot_lock(struct zram *zram, u32 index)
> > > > {
> > > >         unsigned long *lock = &zram->table[index].flags;
> > > > 
> > > >         WARN_ON_ONCE(!preemptible());
> > > 
> > > you want might_sleep() here instead. preemptible() works only on
> > > preemptible kernels. And might_sleep() is already provided by
> > > wait_on_bit_lock(). So this can go.
> > 
> > wait_on_bit_lock() has might_sleep().
> 
> My point exactly. This makes the WARN_ON_ONCE() obsolete.

Right, might_sleep() can be disabled, as far as I understand,
via CONFIG_DEBUG_ATOMIC_SLEEP, unlike WARN_ON_ONCE().  But I
can drop it and then just rely on might_sleep(), should be
enough.
