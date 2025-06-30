Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AB71E7C10
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269625; cv=none; b=D779K9/4aTE/F3h4JGiFLun8VcYKLFpMeahwYWwBQ5RD2NOBKPJlNytWLu1ens7QtOlJ2hDa5N+NTauMYYXFL4ncAVaWSpXxmDIMGVrov58i6X2a2U+W+RS8+lNxV2if+dQFJxmUsMAnby5Uqjx8X2pE7IV/WzuJgSNc1taMmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269625; c=relaxed/simple;
	bh=5pztCelm+QdUKt7+dVmg1LMiRllSrYP8z/NcI57I88Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izWA6TwS9fI8nnxp6gXfUiAddWNx190U1f4MkknDLVEah+iVtJ3e431E/R0EF+or7RwrJEEot5xD73ANmy8+oQO/4IcSGVOBgCntn4MoAJtayJFljHzYc4JQQvt1es+YoFFHXBxi2g75NdyngYmmFH2Lroa6LQjas33OSffIkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=eB6bRmbH; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="eB6bRmbH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751269619; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=rbt1gK5kRXCfoZvLCAkq87hyiuzyzzrWQC5AuFDUDjI=;
	b=eB6bRmbHUe+Q5h13ocA75UmLjDgX5UNhmlfzmEeE1LHeWitfKf5FmVAC7vLbf21JqKpqYsaPozEN9iuraL7H3RdZJV7owOnsjvZow4gVLZx82X8L48ABiT6c8L3tuhG+vh+66XXtpY0Vb6Sy85RtpRiPU/aqvRSp6FwTDt3gBj4=
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wg7iJty_1751269618 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 15:46:58 +0800
Message-ID: <5e5b726c-b14b-45fa-b444-0e2aa5c84de1@linux.alibaba.com>
Date: Mon, 30 Jun 2025 15:46:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250630044837.4675-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/6/30 12:48, Dev Jain wrote:
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
> ---

Looks reasonable to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
