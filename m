Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBDA4B1E7A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746675084; cv=none; b=pfK5hm+B9ei04HzTqAUREOoM0QhDyYGwLGbYlGf9pBiVOjnkk+kv0pMDd1zXCS3E5EEhQvlnttUefLrupA3uivtH5kepJ/DEA2T3+IwzwNSD0gZ45sJuFZASL9JeA/jLt87S3dvw9dNU0km7BdjmUOEgBGKepL9bHryZZHu9XEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746675084; c=relaxed/simple;
	bh=O7DfzshC2sv9vBYSoC2zO/FkhuBME0PDj97NXHhMFfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/sflTtqhYwy4VMJOs+96lclzZXRgys6ZskMzGdzcC6cvOrLygK8R88X1dZokCnICHE1J7jSVbMHdrTzFL0oXchXoXbX287lIjNElTxoRgVIvuwg20/gcQFhf3wVwSX2MzI5y5/nFRyJ+dctomT7BWiRJNw+9ZO6tggbQjcyEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YPpaToeC; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YPpaToeC"
Date: Wed, 7 May 2025 23:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746675077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJbCISs50wSO7xBgn9dncdw0gkvmbBOia9V/enIYR4E=;
	b=YPpaToeCNUKGrMl1w+cpPpWo+NksmcdIFA1Yfw9PPGkRnY3D6ohmI2t/fO4Iy26LgteoRK
	Liqrf4IhjvhmAmp0cUI73SoEC3UeoXPRXynm72//ypw+iKSZhX3XAUexyRDO9bwymA2Vba
	gXrTETUIppjeQOl94Ze2ypI+Z9dBKqE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading
 allocinfo
Message-ID: <y6egptcxlbzgboykjorh3syxwy4wu37eolmjtwuwu36gtbfhgf@o3o34qii4gmq>
References: <20250507175500.204569-1-00107082@163.com>
 <a0ebf2e.b422.196abf97373.Coremail.00107082@163.com>
 <CAJuCfpFAUdqqvFPfe_OLR76c0bX_ngwG=JKC42pVB+WAeX4w0w@mail.gmail.com>
 <nubqzts4e6n3a5e7xljdsql7mxgzkobo7besgkfvnhn4thhxk3@reob3iac3psp>
 <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289b58f1.352d.196addbf31d.Coremail.00107082@163.com>
X-Migadu-Flow: FLOW_OUT

On Thu, May 08, 2025 at 11:06:35AM +0800, David Wang wrote:
> Thanks for the feedback~
> I agree that memory allocation normally dose not take major part of a profiling report,
> even profiling a fio test, kmem_cache_alloc only takes ~1% perf samples.
> 
> I don't know why I have this "the less memory allocation, the better' mindset,  maybe
> I was worrying about memory fragmentation, or something else I  learned on some "textbook",
> To be honest, I  have never had real experience with those worries....

It's a common bias. "Memory allocations" take up a lot of conceptual
space in our heads, and generally for good reason - i.e. handling memory
allocation errors is often a major concern, and you do always want to be
aware of memory layout.

But this can turn into an aversion that's entirely disproportionate -
e.g. using linked linked lists and fixed size arrays in ways that are
entirely inappropriate, instead of vectors and other better data
structures; good data structures always require allocations.

Profile, profile, profile, and remember your basic CS (big O notation) -
90% of the time, simple code with good big O running time is all you
need.
