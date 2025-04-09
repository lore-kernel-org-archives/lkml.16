Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED355156F3C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189570; cv=none; b=UxDAg557rV1YI1eeS5AyX+LDwry1FSq2RsJfAdr6Os5twX4iybLYPCBSqwvH1aunhIygDBsBk5m9mi5DQJ7LDbE/ZCgUpaC5YM/ux4qYfb7qQ5xHub6YdKd7bioo7SHAVZ5lfBTAyOUurS49KdUVdaI4zRJpe3F3Ac73JHTzLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189570; c=relaxed/simple;
	bh=lQLImTfUMN/khf9XQs/mRK6VHE9Rz04ug0WJQs9tUWI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qWDGq7XGZQP+SiWxeIaBDaBc6UlsPG+psdP7RIPL/gArb1xRhNqzh3P/3Zgwrbm3SP2P9b4hRSGlx27hdrigL5v2zS2WyLEUXOqnQHKsGQ0gVSKfM1rG+Ls0T0Xf4Cr4BHfEkL1Vuprr9piGC+nwllD/KQAoYeZnCIpUSOQXg/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rAAIx+YU; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rAAIx+YU"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744189561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJDYxq2v2mAqSQibd88QAOwli0xfwaTIj8Ou90k/4kY=;
	b=rAAIx+YU1iqcpWR3urSymkwjngGHZQ5AxCGyUR83T64iVej9zvzkCf2t+Nc0rNSG3608Rr
	LWcXQKzo4SjxPh8FBFNji3foDTHvyjChcOxbEU5oWYxQ70p1tTvXtnnY50ArTsqKvIdzRJ
	+jzxr2YxdhnsV3TUhu0Vc+6sxkilaPg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] MAINTAINERS: Update HUGETLB reviewers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250409082452.269180-1-osalvador@suse.de>
Date: Wed, 9 Apr 2025 17:05:21 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Peter Xu <peterx@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Michal Hocko <mhocko@suse.com>
Content-Transfer-Encoding: 7bit
Message-Id: <5EE8B4A3-7A4D-434A-BE1A-BAC5D953FC46@linux.dev>
References: <20250409082452.269180-1-osalvador@suse.de>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On Apr 9, 2025, at 16:24, Oscar Salvador <osalvador@suse.de> wrote:
> 
> I have done quite some review on hugetlb code over the years, and some
> work on it as well, the latest being the hugetlb pagewalk unification which
> is a work in progress, and touches hugetlb code to great lengths.
> 
> HugeTLB does not have many reviewers, so I would like to help out by
> offering myself as an official Reviewer.

I'm truly delighted to see that you're so kind as to assist us in
reviewing the patches in the HugeTLB area. Thank you!

> 
> Signed-of-by: Oscar Salvador <osalvador@suse.de>

Acked-by: Muchun Song <muchun.song@linux.dev>

