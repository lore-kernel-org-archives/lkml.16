Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649471C3039
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223527; cv=none; b=Ro3OuCKejTZOMtIVYbvKp6rAbF3gHPhzpad/BGIKEXytXU48Zm4CuvRk2GBEqyvlmjgTUGxozLal7ax5o0pCMGlWXHRbMDfAOpj/9qbM0dfuw+SaReAk9EQsyVZOcv+GVvtf2ptRU5Qg0U6LPnNcnfxx2+yHLG1G21OGvNibxTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223527; c=relaxed/simple;
	bh=XkElfIUZFUjxateTgfc/1qyZznRNoyDqHKzHLA1oKXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/wdVAmLtgDyWU0r4mkiw2ncYgEIat3srg3DUe8cS59B0wLkzgqUFUMBb71Cez7lWwj0qUkJaapvGzYIOQkU3zFGpJZq4ojzFonv29fFcrInb2UfcK6q0VpBfRc+AvA3wIDUQWp3mSH40uGL2mr4EqoyIl6IiggICV+tyyotQ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sFSAob4S; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sFSAob4S"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747223521; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/QDkqHbGcD+TMq3shCe5JVRzKlFBnQK6t8dDql3URHk=;
	b=sFSAob4SJopFABxgU4HVvWEbLq//YdNL7eP2TsUjyzJsxnjyDbSdnHVymhtOBgJp1QXUH8WvL8aoFSwI8ru9MdU6iwmfjXHaZ35LSl+WKkmwYzJwLJ2XXrxT8IoPdXMF0dZRrul1nytPWwv5cA3lMYrAxaKTwv56HVuCLJYH/ng=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WalxjuG_1747223520 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 19:52:01 +0800
Message-ID: <a18463df-a63b-4bdd-af85-bd8435cb23e7@linux.alibaba.com>
Date: Wed, 14 May 2025 19:51:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] erofs: avoid using multiple devices with different
 type
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, lihongbo22@huawei.com,
 dhavale@google.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250513113418.249798-1-shengyong1@xiaomi.com>
 <20250513113418.249798-2-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250513113418.249798-2-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yong,

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

Yeah, nice catch.

As Hongbo said, it'd be better to add "Fixes:" tag
in the next version.

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

It's preferred to use:
			if (file == ERR_PTR(-ENOTBLK))
				return -EINVAL;

Otherwise it looks good to me.

Could you submit it as a seperate patch so I
could apply directly?

Thanks,
Gao Xiang

