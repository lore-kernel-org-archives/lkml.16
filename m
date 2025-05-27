Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C86BA50
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327167; cv=none; b=svVIt0R5ux2z8YP3zfIUkYeB/LawwJaF0jF9H8YdKLOTi1/bNrny7kmDDfOTYCHau9F8VcUIQk1wgvqbMxlARdTa3W8MuF0NZbFPwQFP8cmuxfVRn3ax7b9fUPMt6aIwWRtTvIYTR9af9Z5xOddjArorKTDDG6o5XdjDVtnv5Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327167; c=relaxed/simple;
	bh=l+XzCaWVFY9wasdVeHh4TG9XHGew2D8TmeqgwwslILI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGoWX5kZUlKGpcFrojnSxs0+x/fpS3zSe9gJ9qAseazQkOoLXfiWaVFCux7pp1X7P6MzBag7zv9xwW+tVcNkCRbBJQHIwcdVfMNxjIUWqy1i17ipF3DaCyrwPfc73l80csoKZoDiXZ+2rsyNQu78nFSlcex9TxBHvIdXm/A3nUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Hy5aS6lT; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Hy5aS6lT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748327155; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=raIsKgouYAlJeGGfQAn3piR4Qdb0lMEctYAE50GKEko=;
	b=Hy5aS6lTSJKc86p5HDOmjWuyZu1YQOn0r328YPcqutixQnLTgKlH+GX5eDiLpZD4y85UPjuoARoQ1fG+5CejmZwTQ0YQ4j4N+hbukw1J+yFiM38r5sSH+HeMBtG3pCy4zx+qjbqJAZNHRZ4pdwmmc4klJTAH+l1kPPjGwbofjJI=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wbxai9v_1748327152 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 May 2025 14:25:53 +0800
Message-ID: <fa704ef8-2f82-467c-97c2-dbe51c47bd31@linux.alibaba.com>
Date: Tue, 27 May 2025 14:25:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250526182818.37978-1-shivankg@amd.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250526182818.37978-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/27 02:28, Shivank Garg wrote:
> hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
> calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
> proceeding to folio_large_mapcount(), but there is a race window where the
> folio may get split/freed between these checks, triggering:
> 
>    VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
> 
> Take a temporary reference to the folio in hpage_collapse_scan_file().
> This stabilizes the folio during refcount check and prevents incorrect
> large folio detection due to concurrent split/free. Use helper
> folio_expected_ref_count() + 1 to compare with folio_ref_count()
> instead of using is_refcount_suitable().
> 
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
