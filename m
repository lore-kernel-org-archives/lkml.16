Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31423221F35
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212810; cv=none; b=rkMYpAL8P9gl95xVA3rXPkBkBxse8o3EC6x6NOxreZXkMUKsPRT8Gk9PQ5NTiE3iJjzdmmdn3cSkVxiI7oxYrcgyHUa9BIqe6Bmg/G0sy8Xf5TVFpIsc91c7Wh7v0n+lJeWmIcRV/cP+b9x72fjsdHZlxtRv1/tF+fujN0Oaw/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212810; c=relaxed/simple;
	bh=yeTjpZBeqlHP8Y6FFPXxgsVoRw8CFVc5jstjbGaoZeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqSLAY7SM3dNFY1hPCgWvAy6TO2O7ADlIcdFcF/aEUe149hFZrppFmr1w5Ux22lQh+D2ev1PuvzUTWSKAeYoBOIo4wJ7B8NeuybbVnGWfdFkMeA+iqRvygzTrnmiezu5YtKgLm6egH4vFZ08xHTZA/KKOB+XY+9wNpn7x/V648o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ipMlIF4P; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ipMlIF4P"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747212799; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JJ/rSHDh81oBKwQroykvuLx9r2TIlV4SlOmwfKdL/s4=;
	b=ipMlIF4P6G2znkUMOci3tXxmbVp626JWthZ9j8NtOpcewk9a2A1Dtv79w6roPUAyRyOE3ziIYpD+mwlcxKuX+R8UUweFdXSj+282+Bfl7suBQZpu4iojURsIqzxRQCKm7ysvt1bX6aPKkDuS3Rux8a96ChBT20vkxYS0dXPOIMs=
Received: from 30.74.144.106(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WalDO3f_1747212798 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 16:53:18 +0800
Message-ID: <5b615ac3-6080-473f-a0ff-19c38de4ab59@linux.alibaba.com>
Date: Wed, 14 May 2025 16:53:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm: shmem: add missing shmem_unacct_size() in
 __shmem_file_setup()
To: Kemeng Shi <shikemeng@huaweicloud.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-3-shikemeng@huaweicloud.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250514165047.946884-3-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 00:50, Kemeng Shi wrote:
> We will miss shmem_unacct_size() when is_idmapped_mnt() returns a failure.
> Move is_idmapped_mnt() before shmem_acct_size() to fix the issue.
> 
> Fixes: 7a80e5b8c6fa7 ("shmem: support idmapped mounts for tmpfs")
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   mm/shmem.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 980fa15f393e..495e661eb8bb 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -5812,12 +5812,12 @@ static struct file *__shmem_file_setup(struct vfsmount *mnt, const char *name,
>   	if (size < 0 || size > MAX_LFS_FILESIZE)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (shmem_acct_size(flags, size))
> -		return ERR_PTR(-ENOMEM);
> -
>   	if (is_idmapped_mnt(mnt))
>   		return ERR_PTR(-EINVAL);
>   
> +	if (shmem_acct_size(flags, size))
> +		return ERR_PTR(-ENOMEM);
> +
>   	inode = shmem_get_inode(&nop_mnt_idmap, mnt->mnt_sb, NULL,
>   				S_IFREG | S_IRWXUGO, 0, flags);
>   	if (IS_ERR(inode)) {
