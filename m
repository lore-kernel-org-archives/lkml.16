Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2841B1C8604
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467089; cv=none; b=NHVgi4swk/l17BlNc9bBBN4qCTF7sLgstxjWZeKV1tHG9edQYk9Cv/suPF1t7eDIfMFpMa0tlF/f0r3FHp4a14dxID2KcSS6KGMfqEWBBS45La97YIDn0vRCUDT+1SEr6vy4J5uP9+U7ba+S7ZXrzo5Gu96OEUF+lZt6UAMtX6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467089; c=relaxed/simple;
	bh=GK40IVBkKJcTLMF76d4PkrKE8Ecyqq5sZP4JnBHVrl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guB75Qrx9ZLtFjXZKpacn9Q18hekCS6g6iLyv3RNVOFQrt7svLwUeoGPl/9+YkdAlppOfE4IPf4x/MiTcKYrs+DrmXH8SFq6V/87b+toaMzV2NtFvgEvxmY0UrFuTZd58k/aTancPMYr34124K1Yfz+zYE5eKhUm6/vR5j3YMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D545113E;
	Mon,  9 Jun 2025 04:04:28 -0700 (PDT)
Received: from [10.1.39.162] (XHFQ2J9959.cambridge.arm.com [10.1.39.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 264AE3F59E;
	Mon,  9 Jun 2025 04:04:45 -0700 (PDT)
Message-ID: <f63931b5-00ac-4bb0-9e95-4b3aa2131ffa@arm.com>
Date: Mon, 9 Jun 2025 12:04:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Content-Language: en-GB
To: Barry Song <21cnbao@gmail.com>, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, anshuman.khandual@arm.com, david@redhat.com,
 dev.jain@arm.com, jannh@google.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lokeshgidra@google.com, osalvador@suse.de,
 surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz,
 zhengtangquan@oppo.com
References: <e61b8931-521f-44b4-a78d-4988ad7c70b5@lucifer.local>
 <20250609105513.10901-1-21cnbao@gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250609105513.10901-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/06/2025 11:55, Barry Song wrote:
>> Yeah dear god I missed this oops!
>>
>> Yeah Barry - could you revert this change for the guard region bits please? So
>> this is intentional as we do not want anything non-mm to have access to
>> install_pte.
> 
> All my fault! I wrote a multi-process/thread test to issue lots of madvise  
> calls, but it looks like I missed INSTALL_GUARD.
> 
> Thanks, Ryan & Lorenzo! Does Andrew prefer to pick up the fix below, or  
> would it be better to send a new version? He’s handled fixes like this in  
> the past—happy to resend if needed.
> 
> From: Barry Song <v-songbaohua@oppo.com>
> Date: Mon, 9 Jun 2025 22:42:13 +1200
> Subject: [PATCH] mm: madvise: revert the walk_page_range_vma change for
>  MADV_GUARD_INSTALL
> 
> Fix the broken MADV_GUARD_INSTALL reported by Ryan.
>  # guard-regions.c:719:split_merge:Expected madvise(ptr, 10 * page_size,
>  MADV_GUARD_INSTALL) (-1) == 0 (0)
> 
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-mm/671f8164-a90b-48d7-9446-359eb9493500@arm.com/
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

FWIW, the rest of the original patch looks good to me, ands this fix looks
correct, so:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/madvise.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8382614b71d1..381eedde8f6d 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1141,7 +1141,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
>  		unsigned long nr_pages = 0;
>  
>  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> -		err = walk_page_range_vma(vma, start, end,
> +		err = walk_page_range_mm(vma->vm_mm, start, end,
>  					 &guard_install_walk_ops, &nr_pages);
>  		if (err < 0)
>  			return err;

