Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC74B1E53
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747278593; cv=none; b=qXfcO5k3kSbc6fy3MCL2r1tqceih9J0+WeaU9RymUtNayVHOS1nwDKnGH9x5EE8zu+VeRkwgNJ0JioDJTVZLSfvCoMXqjFW+KdLq696Uzkds6POVAwSiwO8TAoDLGGIbg5X5LzmlV4PXImBQ+f/L5I7Va2E5adSLyjytklHQBmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747278593; c=relaxed/simple;
	bh=qQD0UxXk4XnyKXEZLwTB0VbKxKgkZ7JFjK9h1jkcZFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DA5urYfyNDxWpnNKob5Uy8vheD5YjYcOst1PyoZdXEYQB1mv3XmbJRAf3d8nGz18FXLhPKBwoPhtX6JwUCF45GVl7Vxn8gh5VSwmW8gd9Vza9gx7gqh8dhHQpfGcqGAWlsFF5DW/jnAuhbN1Wz5Vd/CBpRMUaQuHgOCLWYzRfE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZyZtK1j2yzsTNS;
	Thu, 15 May 2025 11:08:57 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C7381A016C;
	Thu, 15 May 2025 11:09:42 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 11:09:41 +0800
Message-ID: <a91486e6-83ae-43b0-8d62-84dd526bd916@huawei.com>
Date: Thu, 15 May 2025 11:09:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: avoid using multiple devices with different
 type
Content-Language: en-US
To: Sheng Yong <shengyong2021@gmail.com>, <xiang@kernel.org>,
	<hsiangkao@linux.alibaba.com>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>, <dhavale@google.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Sheng Yong
	<shengyong1@xiaomi.com>
References: <20250515014837.3315886-1-shengyong1@xiaomi.com>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20250515014837.3315886-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/5/15 9:48, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> For multiple devices, both primary and extra devices should be the
> same type. `erofs_init_device` has already guaranteed that if the
> primary is a file-backed device, extra devices should also be
> regular files.
> 
> However, if the primary is a block device while the extra device
> is a file-backed device, `erofs_init_device` will get an ENOTBLK,
> which is not treated as an error in `erofs_fc_get_tree`, and that
> leads to an UAF:
> 
>    erofs_fc_get_tree
>      get_tree_bdev_flags(erofs_fc_fill_super)
>        erofs_read_superblock
>          erofs_init_device  // sbi->dif0 is not inited yet,
>                             // return -ENOTBLK
>        deactivate_locked_super
>          free(sbi)
>      if (err is -ENOTBLK)
>        sbi->dif0.file = filp_open()  // sbi UAF
> 
> So if -ENOTBLK is hitted in `erofs_init_device`, it means the
> primary device must be a block device, and the extra device
> is not a block device. The error can be converted to -EINVAL.
> 
> Fixes: fb176750266a ("erofs: add file-backed mount support")
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fs/erofs/super.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 512877d7d855..6b998a49b61e 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -165,8 +165,11 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
>   				filp_open(dif->path, O_RDONLY | O_LARGEFILE, 0) :
>   				bdev_file_open_by_path(dif->path,
>   						BLK_OPEN_READ, sb->s_type, NULL);
> -		if (IS_ERR(file))
> +		if (IS_ERR(file)) {
> +			if (file == ERR_PTR(-ENOTBLK))
> +				return -EINVAL;
>   			return PTR_ERR(file);
> +		}

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

Thanks,
Hongbo
>   
>   		if (!erofs_is_fileio_mode(sbi)) {
>   			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
