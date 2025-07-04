Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419161E102D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599655; cv=none; b=rj7e7FTcw5MPK85LtkxEyG8kQ0lXSdDpc66aommWAD9zJ5NrcFcjqGQ4CIpM0hpEH/Wud2hFOy5qj1jXXIMA/R2hY/C6S4qYpz1KG1bUprTPk7BEGZO5XB6kF0yJ7DLBfbxNjtnsM/ZXR8mtGZryV3yKKHp1Y/msh5wwjFAmOhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599655; c=relaxed/simple;
	bh=O90QTgqGO/1o77JkZWSVRAWJ/Ck5VDTdhwTScn6YyWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/zbSgG4YpxLyo+E0uu5Il4W8NiW3rzzeYhXctk3rSC48DTba0NjJsrFI0WWf1ev0+UY/Qmus+BaRUkG0pUdetu7DqbgFU2HByJtoj61Slgcywow3d4WrUXAuLEwKbQSzJpelJVZOqgwrs1KtUcM1WyZK0LFIUkdacucGfXeCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U9cZWTE5; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U9cZWTE5"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751599644; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NT2RpiwXsHdnxjx/qwB8ox2h5GqzVamcQq+GDtXVotw=;
	b=U9cZWTE55XRNmn2zCJ2pU1Cdrkv/ZqQAcKhrTMsZW8RS7qYUTcc2uvp6cIu3y9rBhWA71n6q1ZvSbd2YGX9XBbSxOiJ+GAyiKaii8jLVok6DK4QZo1lGisnxNEWDykHPeglaXP/a3xv2vPE2aGIWC2d/Xz6iKchA/qGP/5meFJQ=
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wh8fxM7_1751599642 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Jul 2025 11:27:23 +0800
Message-ID: <e156aa78-4ce8-4c25-90cd-8c2a4eeda809@linux.alibaba.com>
Date: Fri, 4 Jul 2025 11:27:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250703054823.49149-1-dev.jain@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250703054823.49149-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/7/3 13:48, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.
> 
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> 
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

With David's comments addressed, LGTM.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

