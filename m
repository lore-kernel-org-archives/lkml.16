Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352772DCC0C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400356; cv=none; b=VhyCRFgEWC5vYFiaFHhg1CXD7yeXOwWN4J1y24Odpx/I6VsRPbzqtA66a7bvpYVESaYY0y8R4zqWymUTFbatZiIFW9o8FEpqpkKsUyOxZhJhWUfbSn3/hOzXOG68qNHuUp0gyweJ0UYZZPxCwgY/6x3mG18pYYM1+hSnTznsgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400356; c=relaxed/simple;
	bh=Rk/z8HiUiaiDyvgDZt/WFv7qYTYQ1caXbI9gCwYI0SU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=e5QJ6qjIWffvor4QBx+2FksVsyfeYR4PflRGBayjnIIMEEPIGYnpPdTKg0pgagz+d5wY6GloK5I36zzQt8+2smIP0qcQ8luSTAHDvkciE5S2UDrCej3lBwHFK4YDyfuualg6vIzrx2ijsgp2Kx6Zt1z1TH86MU5HLQZ1wyGjFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PrEkARw9; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PrEkARw9"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748400350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e5DGhkBS0/3wiNvr4ypo542Bb1jlsV5PO0xCqbJ1mWw=;
	b=PrEkARw9M+Px+dsbc/G/ZBaEH258vq9g8iLw5i5mI8Y40zMyy+za+UbyxBdSJCIDZBsHq+
	bWNdAzkFCHdSq82RVM8wtogaiLm1fxlSWTKZznLAjLrT3/8nSww2IAcEJDeJPNWC6NszlO
	EuA1ct3+RUMRybkF3VIL8p7f5eA0VkI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH V2] mm/hugetlb: remove unnecessary holding of hugetlb_lock
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1748317010-16272-1-git-send-email-yangge1116@126.com>
Date: Wed, 28 May 2025 10:45:07 +0800
Cc: akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 21cnbao@gmail.com,
 david@redhat.com,
 baolin.wang@linux.alibaba.com,
 osalvador@suse.de,
 liuzixing@hygon.cn
Content-Transfer-Encoding: 7bit
Message-Id: <8112FABF-726A-4C6F-ABE3-D2D917334366@linux.dev>
References: <1748317010-16272-1-git-send-email-yangge1116@126.com>
To: yangge1116@126.com
X-Migadu-Flow: FLOW_OUT



> On May 27, 2025, at 11:36, yangge1116@126.com wrote:
> 
> From: Ge Yang <yangge1116@126.com>
> 
> In the isolate_or_dissolve_huge_folio() function, after acquiring the
> hugetlb_lock, it is only for the purpose of obtaining the correct hstate,
> which is then passed to the alloc_and_dissolve_hugetlb_folio() function.
> 
> The alloc_and_dissolve_hugetlb_folio() function itself also acquires the
> hugetlb_lock. We can have the alloc_and_dissolve_hugetlb_folio() function
> obtain the hstate by itself, so that the isolate_or_dissolve_huge_folio()
> function no longer needs to acquire the hugetlb_lock. In addition, we keep
> the folio_test_hugetlb() check within the isolate_or_dissolve_huge_folio()
> function. By doing so, we can avoid disrupting the normal path by vainly
> holding the hugetlb_lock.
> 
> The replace_free_hugepage_folios() function has the same issue, and we
> should address it as well.
> 
> Suggested-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Ge Yang <yangge1116@126.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

