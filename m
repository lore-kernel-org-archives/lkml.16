Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A839279DDE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749808747; cv=none; b=uISNBvBnQyMsEfBj3/qsKuCxUyBY9AEnY9NjS8aRNa0ej2edqiusD3Iw9qjcUjx9r9gFrysf+9dm24udn6wh70mAR4/fWSCEs5VZNseGwh+QBoHYDkRW5UawqgoD04lxoMjnGsNHrLmE8mWy+73OcTyCP2N5KukMx6Xt8RGKbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749808747; c=relaxed/simple;
	bh=6g3UyFkoVrawWdV33JWBsjBQ/iUh38fGjkruGgCScy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RSw33YEe5BJWva1U4z0ilnFTxiaCMxOWrTgFATFBsx8RhVDEnbL1vomCzdA0BuXqsRfRBAsKqIm+qf75Z+hUNEuZbr65re3Xipeh4z0HPtSfaYrEUJSRpvBlaTtAvjpLZ1gAopB92XdKUKLRfgky4RQ/udV7vGzZTk+criDWJ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lm1hYnvJ; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lm1hYnvJ"
Message-ID: <cd358b16-b03d-4560-9d55-e1e1e502e674@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749808739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpXnDBPpqquBgfe2bBHutO28w9qj/2gJIO0pSbxaZ50=;
	b=Lm1hYnvJ9HU6vP7pHVeLj5Zxhag7MSKDDdqABGGniKu6GSSmH6WXBln+CCWDvl93ImbCxF
	l8p4eK2b/z0LxgleJWUtL7iQqXH2JeX5mS94okz0X64t3M5AL7PqOGk4mfokRVXo778lKP
	gIHwGLMcx7NhSqiYYVeavupuN+GjGUg=
Date: Fri, 13 Jun 2025 17:58:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] hugetlbfs:inode: initialize 'error' variable at
 definition to reduce code redundancy
To: Oscar Salvador <osalvador@suse.de>, Hu Song <husong@kylinos.cn>
Cc: muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609065615.108240-1-husong@kylinos.cn>
 <aEh-wRb_j5seV2Iz@localhost.localdomain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <aEh-wRb_j5seV2Iz@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/6/11 02:51, Oscar Salvador wrote:
> On Mon, Jun 09, 2025 at 02:56:15PM +0800, Hu Song wrote:
>> Initialize the error variable to -ENOMEM at definition in
>> init_hugetlbfs_fs().This removes the need for a separate
>> initialization later and makes the code slightly more concise,
>> while still preserving the original logic.
>> No functional change intended.
>>
>> Signed-off-by: Hu Song <husong@kylinos.cn>
>> ---
>>  fs/hugetlbfs/inode.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
>> index e4de5425838d..390cddd5872c 100644
>> --- a/fs/hugetlbfs/inode.c
>> +++ b/fs/hugetlbfs/inode.c
>> @@ -1600,7 +1600,7 @@ static int __init init_hugetlbfs_fs(void)
>>  {
>>  	struct vfsmount *mnt;
>>  	struct hstate *h;
>> -	int error;
>> +	int error = -ENOMEM;
>>  	int i;
>>  
>>  	if (!hugepages_supported()) {
>> @@ -1608,7 +1608,6 @@ static int __init init_hugetlbfs_fs(void)
>>  		return -ENOTSUPP;
>>  	}
>>  
>> -	error = -ENOMEM;
>>  	hugetlbfs_inode_cachep = kmem_cache_create("hugetlbfs_inode_cache",
>>  					sizeof(struct hugetlbfs_inode_info),
>>  					0, SLAB_ACCOUNT, init_once);
> 
> Uhmf, I do not know. 
> 
> Often, we tend to use those declarations in order to mark what error
> code we will return if we fail the next operationg. E.g:
> 
>   error = -ENOMEM
>   if (try_to_allocate)
>     goto out;
>  
>   error = -EINVAL
>   if (check_params)
>     goto out;
>  
>  out:
>   return error
> 

I prefer the following format, as it avoids unnecessary assignments:

        if (try_to_allocate) {
                error = -ENOMEM
                goto out;
        }
        
        if (check_params) {
                error = -EINVAL
                goto out;
        }
out:
	return error                   

> No really strong opinion here, but I'd vote for leave it as is?

Currently init_hugetlbfs_fs() pre-initializes the error variable
with -ENOMEM before the allocation that might fail. This creates
an unnecessary assignment in the success path.                  

Therefore, this change might be preferable:

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index e4de5425838d..3fa7892ac865 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1608,12 +1608,13 @@ static int __init init_hugetlbfs_fs(void)
                return -ENOTSUPP;
        }
 
-       error = -ENOMEM;
        hugetlbfs_inode_cachep = kmem_cache_create("hugetlbfs_inode_cache",
                                        sizeof(struct hugetlbfs_inode_info),
                                        0, SLAB_ACCOUNT, init_once);
-       if (hugetlbfs_inode_cachep == NULL)
+       if (hugetlbfs_inode_cachep == NULL) {
+               error = -ENOMEM;
                goto out;
+       }
 
        error = register_filesystem(&hugetlbfs_fs_type);
        if (error)

Thanks,
Ye
 
