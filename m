Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62A1BF58
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748327528; cv=none; b=EXpWnF2h+8kHiBxIsA14jYgmw5jZcBj5yhTBIJLMaYKMdwtgpKRRLZFswb+R2q1zFpqDu8GYrcrX2W6iP30gByhyhFZ2JzgTCK4iXDlXRrEIKHFGPQF/hryXEI71fQzZWHwKN4SEraxKQK6cqs74Rg0CuS1EIr4eSxposnE9pCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748327528; c=relaxed/simple;
	bh=fhzfeP8N4BIhlG6BQU8T6oxMRiBxSnH4Mr5MDNtvjXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BF+NORkOTlMU7+CQUzqVERBJqdfC+aSZNiwKGLufMFysSXzLYBNxFiHs04CSzT0kIasXQObaI9ZR/VcRx+vVDRf/ZxbuF/8QX8e6RXwWtqf6XGvEVqAUMcX8zK7Q8bwx+e62D2YoTBPY8Rs4pWPA/LryriGCa5R1s2J0xN3otH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rn2HFpBI; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rn2HFpBI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748327523; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=uTdKZdfSYxh5Xi+IhepiWE/QahNw1PejLfKCqR96OAk=;
	b=rn2HFpBIJknjgKz0bMH/Oja7z1AsT8bRj3t2j57JHpT7p28Q3rYcosgKZx/o1lqUstnHwrCY+R4143P1w7k0HqAvyZY/De5lWnvA4TshZt0CemXzJQT4FzMCx0eLBuphHS7Yq8Rh28x1ouSLxEH5ij1W7p95xU9xAk2RdxZ/wWE=
Received: from 30.74.144.125(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wbxaiaf_1748327203 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 May 2025 14:26:44 +0800
Message-ID: <b4d3b436-380a-4f01-8f00-4baaf7ed5a8c@linux.alibaba.com>
Date: Tue, 27 May 2025 14:26:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] mm/khugepaged: clean up refcount check using
 folio_expected_ref_count()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 fengwei.yin@intel.com, bharata@amd.com
References: <20250526182818.37978-1-shivankg@amd.com>
 <20250526182818.37978-2-shivankg@amd.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250526182818.37978-2-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/27 02:28, Shivank Garg wrote:
> Use folio_expected_ref_count() instead of open-coded logic in
> is_refcount_suitable(). This avoids code duplication and improves
> clarity.
> 
> Drop is_refcount_suitable() as it is no longer needed.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>

Nice cleanup.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
