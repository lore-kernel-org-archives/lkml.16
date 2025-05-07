Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942228FA9F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746651033; cv=none; b=ulIe7XISMd8PWocadnxEoD91o4PUntoGtjXvChz0mQq91h8asOZ5zE2ug4nbCdY2MHQ1ypbaF6jmN1Lr55GgBFOq9fflCr2qwiXjHzDNjnwSTJ842JRD404bPp8ge9mFGlTE/C5Ae518hCEZlk0MN9HQP2K9b4vHT8+xXoFSB0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746651033; c=relaxed/simple;
	bh=HgFIOr331gUk0q2EluZqoEuRJVLc7Yeb3oP3uziVWF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvXdohkPqW+DZR5TcYyvOnPwMvADE7H6YZ2JG1OKuIsVVBgCPzcKY7q5Sp9CvRlRUT6hbhwc0Uwlv7OB7JcCStzDsul9sQXqphuxwSQ6x2FhoqZn1d0r0dJvuVDphubAQAkDkFZFDFOi8AiOXb0tudoPsrAI7XNWUSIJCCVCstQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PYq1NO7q; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PYq1NO7q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qYOdPumYEeMYOudyZhzEcRSSXRPpswcmBXCu2daOo0g=; b=PYq1NO7qM/+N8y7XpErUKcuvNm
	/7QheS/dZnPJx9cSFwG1jl37HdRzr4DXTF40HYPeBOkRFF+/tCvDfBjjQiIyz258wJM6QUBj9JqjQ
	zQFLpWFf903vn6s5PV0N80YBSIMqqF7rx7zpfnxpUrZCZX3evDgRPIGBaFtNCDoXjTWu/exKv9r8N
	4RO35cOuo+dFLvGKwmDg1bJf64Wdipj+50/bFwZ0pgiOK9SbupbLXjbh6jQX7XGliNchrFVRZuerA
	w+PRsgNdjx+0ok5Ft6A/RmjG6lVbZjGqEkzqjB1lKxC5ynJivlWEyaZrDbaexaXg3VbS31Ixz6JbA
	IqGqPshw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCliB-0000000EHqP-0mzI;
	Wed, 07 May 2025 20:49:51 +0000
Date: Wed, 7 May 2025 21:49:50 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: WangYuli <wangyuli@uniontech.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yuzhao@google.com,
	stevensd@chromium.org, kaleshsingh@google.com,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] mm: vmscan: Avoid signedness error for GCC 5.4
Message-ID: <aBvHbn-jrwhxFMkm@casper.infradead.org>
References: <85050791B887DC13+20250506160238.799984-1-wangyuli@uniontech.com>
 <20250506162438.91fffc7ef924d9653ed0f503@linux-foundation.org>
 <74D5BC8AD7E5511A+13242b55-13e5-463a-9422-f863d58b6af6@uniontech.com>
 <20250507110701.c2c135d3f4ed594b914da41b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507110701.c2c135d3f4ed594b914da41b@linux-foundation.org>

On Wed, May 07, 2025 at 11:07:01AM -0700, Andrew Morton wrote:
> `int' is a curse.  Yes, we do this very frequently - we unthinkingly
> use a signed type for a naturally unsigned concept.  Ths signed type
> spreads and spreads and the incorrect signage causes (small) problems
> in various places.  By then it's a big mess trying to switch to an
> unsigned type.
> 
> Oh well, we just battle on.  We should at least be more vigilant about
> this when adding new things.
> 
> 
> hp2:/usr/src/25> grep "int nid" mm/*.c | wc -l
> 316

$ git grep def.*NUMA_NO_NODE include
include/linux/nodemask_types.h:#define  NUMA_NO_NODE    (-1)

I bet if you change all of those to unsigned, you'll get a
non-functional kernel.  C is awful, we need to dump it.
