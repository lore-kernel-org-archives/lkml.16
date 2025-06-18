Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917832F5318
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750211221; cv=none; b=rC+DS7LYXtUr8fRE5aCGFUoPuaW7gP5ZKxh5jtZgg++KFSmcRYTFzYMYaqpFvcCOWraWPINL+SKyGYaLgFGDNiLB3LfFdae6pw2IWXKVKTooAgG5AiqvAJjRXZDmH9zWCjxm0dbgO0Xnbv9+iajBGO/BQx9fMQpJsH5E5DK2W8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750211221; c=relaxed/simple;
	bh=IkbfYb/RF0ZIP6sNS/KjbcqAQD2zZbXRas7o6VH2RRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fdl2ScOSyKkUayhbyHYKZTUdcQBOinbqbAbhZ7QMOJ1a77YiUXCpJG7EIcVqYlH0a8if17I2dSbcQ15nSYRHDxlUBxlPHCJShMRoLlm+S4jnXTQQaR3wi8F23gN77osKtFTEr6F+xH3S6G5AO5838zbyylhUTbbF15GJusiYV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bMRPC1mJKz1W3TX;
	Wed, 18 Jun 2025 09:44:31 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id CC1B018005F;
	Wed, 18 Jun 2025 09:46:55 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 18 Jun 2025 09:46:55 +0800
Message-ID: <68eb3c3b-b67c-46e7-a6a5-044d4415e2b7@huawei.com>
Date: Wed, 18 Jun 2025 09:46:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: impersonate the opener's credentials when
 accessing backing file
To: Tatsuyuki Ishi <ishitatsuyuki@google.com>, Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, Jeffle Xu
	<jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<shengyong1@xiaomi.com>, <wangshuai12@xiaomi.com>
References: <20250612-b4-erofs-impersonate-v1-1-8ea7d6f65171@google.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20250612-b4-erofs-impersonate-v1-1-8ea7d6f65171@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/6/12 18:18, Tatsuyuki Ishi wrote:
> Previously, file operations on a file-backed mount used the current
> process' credentials to access the backing FD. Attempting to do so on
> Android lead to SELinux denials, as ACL rules on the backing file (e.g.
> /system/apex/foo.apex) is restricted to a small set of process.
> Arguably, this error is redundant and leaking implementation details, as
> access to files on a mount is already ACL'ed by path.
> 
> Instead, override to use the opener's cred when accessing the backing
> file. This makes the behavior similar to a loop-backed mount, which
> uses kworker cred when accessing the backing file and does not cause
> SELinux denials.
> 
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@google.com>
> ---
>   fs/erofs/fileio.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
> index 7d81f504bff08f3d5c5d44d131460df5c3e7847d..df5cc63f2c01eb5e7ec4afab9e054ea12cea7175 100644
> --- a/fs/erofs/fileio.c
> +++ b/fs/erofs/fileio.c
> @@ -47,6 +47,7 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
>   
>   static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
>   {
> +	const struct cred *old_cred;
>   	struct iov_iter iter;
>   	int ret;
>   
> @@ -60,7 +61,9 @@ static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
>   		rq->iocb.ki_flags = IOCB_DIRECT;
>   	iov_iter_bvec(&iter, ITER_DEST, rq->bvecs, rq->bio.bi_vcnt,
>   		      rq->bio.bi_iter.bi_size);
> +	old_cred = override_creds(rq->iocb.ki_filp->f_cred);Yeah, rq->iocb.ki_filp keep the opener's cred, so:

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

Thanks,
Hongbo

>   	ret = vfs_iocb_iter_read(rq->iocb.ki_filp, &rq->iocb, &iter);
> +	revert_creds(old_cred);
>   	if (ret != -EIOCBQUEUED)
>   		erofs_fileio_ki_complete(&rq->iocb, ret);
>   }
> 
> ---
> base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
> change-id: 20250612-b4-erofs-impersonate-d6c2926c56ca
> 
> Best regards,
