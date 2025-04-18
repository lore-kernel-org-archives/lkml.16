Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA6123E340
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744944739; cv=none; b=fGeIsAUjy632tCAx/cVCkFO6HgMKM82pEfpv8dL4TSUpjR/qK1jTlbSS+/GfzqgQ69qfGr3Q1mCoP9B97LiwBBdRzkZQGfy3ndWwJ2siN6k+EepYyUm1CZKjJCVQKLlEziEWnJgs9BxhYhzdUMfWUDQ/1i4d8Eao0A+vjj/OMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744944739; c=relaxed/simple;
	bh=rnuV6cMYf1BzEdif4YXliRe3SqP6O/J6RKNyVrl2914=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Az7hiuOT2FiVvQExo1EgS6WI+MM1+VZtCiBRynnjTo19SrkndlIPl1AmVIl4g7NORdQHtgeZCxck0F2cUXUb4hAmnihyEmmQnuHolnXFtqjJwqLkwjW4Be1IjO8BeB0/OMgIr3fB3wQKktvBWZGcs10FCcRB0hOiVzjOENE5D0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PHGHuE/w; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PHGHuE/w"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744944735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYuRFpIGZRKFiumOuz1DK5II6Pi52mdASZrA/kHQn9c=;
	b=PHGHuE/wgCx55r5ahZ7et33BsE+aJ+qvfm6VFupAb2TwEJgfUorWGiLbJwYjmAvYiBkvVK
	BUgMolpOTYMgT0ORxWiK4Zc9iuPVCzFwiXrkmx2X4Rj5l21LMXmiES0Xx6MMhp2ZmMPr+M
	tWKA+0OACqxS3Efo17CjfPSRHXa4Inc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 2/3] mm/hugetlb: Refactor unmap_hugepage_range() to take
 folio instead of page
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250417155530.124073-2-nifan.cxl@gmail.com>
Date: Fri, 18 Apr 2025 10:51:42 +0800
Cc: willy@infradead.org,
 mcgrof@kernel.org,
 a.manzanares@samsung.com,
 dave@stgolabs.net,
 akpm@linux-foundation.org,
 david@redhat.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
Content-Transfer-Encoding: 7bit
Message-Id: <2C55C2BA-667E-4253-8A8C-FB21AC8D6775@linux.dev>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-2-nifan.cxl@gmail.com>
To: nifan.cxl@gmail.com
X-Migadu-Flow: FLOW_OUT



> On Apr 17, 2025, at 23:43, nifan.cxl@gmail.com wrote:
> 
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>   unmap_ref_private() already takes folio and there are no other uses
>   of the folio struct in the function, it is natural for
>   unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

