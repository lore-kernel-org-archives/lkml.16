Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C8B2D29CF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433223; cv=none; b=FuhETfWnTM79llU0IvxbSlKSdMF19/umtfsBG65GEL+pv68d2dF3IkgR+/0U9Kgo1nMAZUHjxz09BH16n/oxdKWeyrV3bkMHW+ClJO1G7Vn9PJ+0qHsn/L4+gU60D6WRWELUZdalVvrUFT5ufEJQZC9UOQ0a4AAYXPH7YOAliMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433223; c=relaxed/simple;
	bh=85BhBxF5rTVkYvNE723pN6c1mFnGxoS+daibxtQ+kaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mwbET/L2ePpucpnhsaEdpyDx76Ulr1kG8qcAqbcd9YDYhWcMlerHsRGnyacpJaluwQk/n0OF3zDqW80ZtZSGWjKekMkquIfQC3MvLM3u/rVcOCwr5dYEVkUonBf7uQObVjrvaGIOcc+Mk88m3KOK3GCHKmJSaa/T8aXXt7iFXmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBRSDNvz; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBRSDNvz"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23692793178so20609265ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750433222; x=1751038022; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WKTNkDzGRnUgF43AVca4gDZLKagQb8kOiVOK+aOjfk=;
        b=hBRSDNvzrpRhrWNv3fEegSHSDo4ERLqeg24pUvmYTh+HLjKTDmWUcag5EhiKXeWUhp
         FD/ed+pP7sDKsKNy2o8Dtf/hmDQqjdwpQga1kx6WgC4LEq5EnMO44zSZOqPMkqIHNaNR
         Oeg8h4mfvQbamllMi3dko4ar04aetRnaWaSha5VyBTEmKvsN0vTzaTfQ/2KEPi6I2HEe
         3Ak6NAv3QscSmIKXs2bdocYBwuYMLRBJEOreTi73yFFMn9NEBKudJ/UrBSn/cL+ONO9m
         XgDP0Ik996uya8BTd75Jq3rD5acAAP/66l9XUCyVJ5aVO225duT3MjNuWtnGJgMPrudQ
         5MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750433222; x=1751038022;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WKTNkDzGRnUgF43AVca4gDZLKagQb8kOiVOK+aOjfk=;
        b=Fv+cGXnZu+jLIB6zzBCNaKR0/HEWuh1sq7c5JSVwQe3SgsufVy9f2dQIQwNhix2Lfw
         IsYMvOMz+JDj/bbLtfTzG5qlNx+Jgsih33zy75AEQu529VuyaccWFN6PazjYIGsP/ZCa
         TIZrh+6R6qRP51jcvdS6NJ+rFVe4NM7XAU/k6PxHQhRuc0RMQMwR+VA3JmFjzuhUNAke
         hSR1rCLUN4hBLyUDvrovyutSy3cZiIGXIDeSI2b9oa8c8tKcLLbdZr9ZYRvCB0YMen2x
         tIJH8y/kIfK1CGYZANwU3jf7f1AiZVRq36GhH66NUWLGNtHNi/q937nDVhWOIwGYJU1B
         sBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZhWUbsUTiA9BKL5nhBV13+pCVkg/bLXimkaSs2smaNH+/ZowoDmdQ4sdmv7hqjv2/cokavtq+XszQwBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8VSOUMrfb/TOIdw29tTOuog2plx7SZAA73JmiQQiOkVvlgLb
	5YYHnm1VYrQqHECEhnwKTaIcDH1aRuvrJjpjmQ5pxXDFcRqEs7qCDonamdbEGAqI4k/IvYslyCF
	M3iLURg==
X-Google-Smtp-Source: AGHT+IEbRBcLh6spVsh8Y2fRIcuS62ZEJFWblVYKsTaCW70j+5HpxHA1bpHFzEIxZU9kJav7SWO+votiq9g=
X-Received: from pgbci13.prod.google.com ([2002:a05:6a02:200d:b0:b2e:bad0:b462])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d501:b0:235:f3df:bc26
 with SMTP id d9443c01a7336-237d976311fmr46900805ad.3.1750433221712; Fri, 20
 Jun 2025 08:27:01 -0700 (PDT)
Date: Fri, 20 Jun 2025 08:27:00 -0700
In-Reply-To: <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619200442.1694583-1-riel@surriel.com> <20250619200442.1694583-6-riel@surriel.com>
 <6f9d7c86-9faf-48a0-b7b9-d58bb21ce948@gmail.com> <49eee1cb79b75b02b8ed19a7f6d39e1ee8fae171.camel@surriel.com>
Message-ID: <aFV9xAYLgNljSVem@google.com>
Subject: Re: [RFC PATCH v4 5/8] x86/mm: Introduce Remote Action Request
From: Sean Christopherson <seanjc@google.com>
To: Rik van Riel <riel@surriel.com>
Cc: Nadav Amit <nadav.amit@gmail.com>, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org, 
	peterz@infradead.org, bp@alien8.de, x86@kernel.org, tglx@linutronix.de, 
	mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 19, 2025, Rik van Riel wrote:
> On Fri, 2025-06-20 at 02:01 +0300, Nadav Amit wrote:
> > 
> > > +/*
> > > + * Reduce contention for the RAR payloads by having a small number
> > > of
> > > + * CPUs share a RAR payload entry, instead of a free for all with
> > > all CPUs.
> > > + */
> > > +struct rar_lock {
> > > +	union {
> > > +		raw_spinlock_t lock;
> > > +		char __padding[SMP_CACHE_BYTES];
> > > +	};
> > > +};
> > 
> > I think you can lose the __padding and instead have 
> > ____cacheline_aligned (and then you won't need union).
> > 
> I tried that initially, but the compiler was unhappy
> to have __cacheline_aligned in the definition of a
> struct.

____cacheline_aligned_in_smp, a.k.a. ____cacheline_aligned, should work in a
struct or "on" a struct.  There are multiple instances of both throughout the
kernel.
