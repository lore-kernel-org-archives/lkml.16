Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6AE24EA85
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761961; cv=none; b=RDTb7V1iBHaBX7Hkw4+/DZ+d6IcfSzCdWbHPg1ARHoX8etoDhkh+R/i1d08v74FP9gNIwGYa8YF8uW/LSufhNyJ+Ub+BipfB8QBFbHE7EZE6suS61tiPCbRk8bdtfhGbwAt5rB6ayXGxqW1aiPucRLxEPWTxTVWJrgXTN6BVPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761961; c=relaxed/simple;
	bh=yaQEyTq9qu2VZtURmi8lqNHxZL4f6GMQAiHJcnTGDtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d62Ejgto+9oH074pCsJQ/f3HzQyXPWPZ9zKw09yCCNyHAcsey9Nf77skradRNdoLl7pXnEeSUgj944ZCgGvR8WpGXeGvGtVsaiQgWbfujJyowZZuHr5X+zLzz8q7hoX/VHaoe9vc9d7EnNXhRn9eh9aZqItxHqy9wqiSrFuv970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CKXs4fQZ; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CKXs4fQZ"
Date: Tue, 20 May 2025 13:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747761956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yaQEyTq9qu2VZtURmi8lqNHxZL4f6GMQAiHJcnTGDtU=;
	b=CKXs4fQZkMwRpIdaLdlJvTkZR8MLDYAck0rJ2OU+RBzeY7oqjcbrs7BNds+nptgiEX05U7
	6Pzt2R49GURFGzscpqWF42qJsyuPXcccC2bl0Vg8C7fh92tL+S42Itu2gBHmZntNkbhpv0
	FUguGHJ/oMYkdUSaeGgSquu44RwZaMM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Usama Arif <usamaarif642@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
Message-ID: <l7sk6ga4ckxo27wfbkqrmbu6yfu3ia4sttkhki6hh2omjbxkxv@fxwjog4jmjwu>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <3divtzm4iapcxwbzxlmfmg3gus75n3rqh43vkjnog456jm2k34@f3rpzvcfk3p6>
 <6d015d91-e74c-48b3-8bc3-480980a74f9b@gmail.com>
 <b696e3c2-3d96-4729-9e07-87bb644f145b@gmail.com>
 <CAJuCfpEL__bRSbVWATs0qbNF3E2ZS_n7banhRxU01FFT2aTPAQ@mail.gmail.com>
 <sfh57nqbhxaycdlyitiughqc7ul3xuix5kis65l4grrnxwfqz3@gch2dlf3fnxo>
 <CAJuCfpHqGQKgU=rnJbZnbyTs3vKL-gEjLp1Yw1idWUzdkjZsLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHqGQKgU=rnJbZnbyTs3vKL-gEjLp1Yw1idWUzdkjZsLA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 20, 2025 at 10:20:23AM -0700, Suren Baghdasaryan wrote:
> On Tue, May 20, 2025 at 9:41 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> I see your point. One case we would want to use vmalloc is if the
> allocation is sizable (multiple pages), so failing it does not mean
> critical memory pressure level yet. I don't think today's extension
> vectors would be large enough to span multiple pages. That would
> require a rather large obj_per_slab and in most cases I think this
> change would not affect current behavior, the allocations will be
> smaller than PAGE_SIZE and kvmalloc will fail anyway.
> I guess the question is whether we want to fail if allocation size is
> higher than PAGE_SIZE but less than PAGE_ALLOC_COSTLY_ORDER. Failing
> that I think is reasonable and I don't think any extension vector will
> be large enough to reach PAGE_ALLOC_COSTLY_ORDER. So, I'm ok with
> dropping this part of the patchset.

Johannes raisess more pertinent points, so I think vmalloc allocation is
out.

If it turns out that extension vector allocation failures do cause real
problems (not for memory allocation profiling, but maybe someone is
depending on memcg being precise), I think it would acceptable to dip
into reserves for them, since they're a small fraction of the slabs
themselves.

With the caveat that we'd need to look at how the reserves are sized, to
make sure we're not running them empty and causing new problems
elsewhere.

But just failing the allocation should probably be the default approach
here.
