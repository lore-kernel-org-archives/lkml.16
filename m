Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C17827470
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899430; cv=none; b=P7UvSJZKOj3+ADxJ4yUlVMSgp1Wb+eHOp/M1Wj10sBcOj73+uqIJTmvMNXL4RKSTi+eP9+jVFR8TH4ObF5F77XANaPUukJvoohJ3smJRESqJbSnbzKR+SQHgUanVaj8kwSDUmaBI/BenPj6U9OmiuEOleol9ytLfPb6/vaCQy2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899430; c=relaxed/simple;
	bh=9ecPp+VSnOAgy0+yQ8Wsfawb/Awc9nVYklLt1AV+j/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbagPwcpWglDboM3Nwd+jM3pnS0paEo2On8q8P02KgzNSUvGIYyMHg1TZRf5fp6Jxu2X+JKrLkbYzkufMTlbM0FIOCivQJrrPK+dxXbUBhtGBkvWC/ELshfxj+CgcpJ5JTCAxjuJEpJkSsqXEkO1talzqKf20LcOrpYrDkGhaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853E81515;
	Mon, 28 Apr 2025 21:03:40 -0700 (PDT)
Received: from [10.163.52.122] (unknown [10.163.52.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9D3B3F66E;
	Mon, 28 Apr 2025 21:03:42 -0700 (PDT)
Message-ID: <6ca17b28-f779-478d-bea1-0c4739731e20@arm.com>
Date: Tue, 29 Apr 2025 09:33:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm/numa: remove unnecessary local variable in
 alloc_node_data()
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, david@redhat.com,
 harry.yoo@oracle.com, riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-4-ye.liu@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250427100442.958352-4-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/27/25 15:34, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> The temporary local variable 'nd' is redundant. Directly assign the
> virtual address to node_data[nid] to simplify the code.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/numa.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/mm/numa.c b/mm/numa.c
> index f1787d7713a6..7d5e06fe5bd4 100644
> --- a/mm/numa.c
> +++ b/mm/numa.c
> @@ -13,7 +13,6 @@ void __init alloc_node_data(int nid)
>  {
>  	const size_t nd_size = roundup(sizeof(pg_data_t), SMP_CACHE_BYTES);
>  	u64 nd_pa;
> -	void *nd;
>  	int tnid;
>  
>  	/* Allocate node data.  Try node-local memory and then any node. */
> @@ -21,7 +20,6 @@ void __init alloc_node_data(int nid)
>  	if (!nd_pa)
>  		panic("Cannot allocate %zu bytes for node %d data\n",
>  		      nd_size, nid);
> -	nd = __va(nd_pa);
>  
>  	/* report and initialize */
>  	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
> @@ -30,7 +28,7 @@ void __init alloc_node_data(int nid)
>  	if (tnid != nid)
>  		pr_info("    NODE_DATA(%d) on node %d\n", nid, tnid);
>  
> -	node_data[nid] = nd;
> +	node_data[nid] = __va(nd_pa);
>  	memset(NODE_DATA(nid), 0, sizeof(pg_data_t));
>  }
>  

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
