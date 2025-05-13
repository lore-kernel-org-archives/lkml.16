Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9EB482F2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149055; cv=none; b=NEz7ihOHKeu2DYncZpeuYyoDRMAs2NS3mV2q5x5rLuZUSLN6C/ijq2hvbn4zivhgD/nocFKLguZI/FoMHmFDHSy162mL1Iq/nUZJZaMsoE2v23rhQpuPX86uuUzR/W1gMuatGGw8AcHti0daTAUj52fMU2uMitmGBprg/SWctwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149055; c=relaxed/simple;
	bh=YBcGVz3+FTAklFqlhCiPgfh6cB3y0r94zyf4ZMWm8fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SkCO8OP0cTktJJLh9TOhWRY2bqjE8KslAluH3Abh8dFIfs21W3FmjneMuFPeb83BHUuT2DjW+jImj5hkynv7Lfo2M80NH3QL7stLZm8HxCgqIvcYXQJfJB4TMkv3ubIiXF2T5lRvnQIpSUZVQqgavNqwEEm5Yk8RixfJAbctNas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Zxftp02g1zyTpT;
	Tue, 13 May 2025 23:06:10 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 327A71402DA;
	Tue, 13 May 2025 23:10:28 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 13 May 2025 23:10:27 +0800
Message-ID: <c02f6e33-6788-412a-8622-49364d67d369@huawei.com>
Date: Tue, 13 May 2025 23:10:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] erofs: avoid using multiple devices with different
 type
Content-Language: en-US
To: Sheng Yong <shengyong2021@gmail.com>, <xiang@kernel.org>,
	<chao@kernel.org>, <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>,
	<dhavale@google.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Sheng Yong
	<shengyong1@xiaomi.com>
References: <20250513113418.249798-1-shengyong1@xiaomi.com>
 <20250513113418.249798-2-shengyong1@xiaomi.com>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20250513113418.249798-2-shengyong1@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/5/13 19:34, Sheng Yong wrote:
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
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fs/erofs/super.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 512877d7d855..16b5b1f66584 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -165,8 +165,11 @@ static int erofs_init_device(struct erofs_buf *buf, struct super_block *sb,
>   				filp_open(dif->path, O_RDONLY | O_LARGEFILE, 0) :
>   				bdev_file_open_by_path(dif->path,
>   						BLK_OPEN_READ, sb->s_type, NULL);
> -		if (IS_ERR(file))
> +		if (IS_ERR(file)) {
> +			if (PTR_ERR(file) == -ENOTBLK)
> +				file = ERR_PTR(-EINVAL);
>   			return PTR_ERR(file);

Hi, Yong

Thank you, I think it is indeed a UAF problem. This fixes the problem 
introduced by fb176750266a ("erofs: add file-backed mount support"). How 
about considering adding the fixes tag?

In addition, I wonder may be we can only check the fc->s_fs_info (we can 
set it to NULL in .kill_sb) in erofs_fc_get_tree rather than change the 
error code. So this way we can reback the correct error message to user.

Thanks,
Hongbo

> +		}
>   
>   		if (!erofs_is_fileio_mode(sbi)) {
>   			dif->dax_dev = fs_dax_get_by_bdev(file_bdev(file),
