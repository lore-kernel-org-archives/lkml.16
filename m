Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD1D7260D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273809; cv=none; b=L0MfPs1p07rBeOUP6jWnyqyg+76VJR8MAFBR7URgjnAXoPh4ot8OBicH1RQNlwdjixZfH8/EPsXQSgSKSVNRzqLXbMr5cCWUqIzmjWLk/VxsPWQl688S5MeACtlNAN59hla/8mUSur1CbXPLu+hU4J3Fh9nX3FVJeTYkuqUaCqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273809; c=relaxed/simple;
	bh=ZvCKIltmZd4gUls4lvzClR30UptJe9UKx5SWj9NEfZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sp5bnDXDyIfYW8SpswDM7XBSs/jJUDrJxHGjhyNEdZqYIN2MTq5vFRF2FFHc7aKk/gb31twMQhMc1pbhwM2lOVVxtP7qicnrOhGAYiOz4o4oHGQvQM4czZVzIpyH+Cn/oWi1RZ9XFSPwrVzwLkHNXY6eEHYt+AetfCTIsKO+vqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JVood6CY; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JVood6CY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747273803; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DcsB84nX40o0xieU4YWyEEfypRZWXyBBrf1GVCswHG4=;
	b=JVood6CYta1/oLv73xFultxHqkNT2ZtU4zSX2tbiQSzeTzomUAoh17rXJm9G0fPSmDvy6TLyVBTnWOgt3B0/QsJamR/WiFr/qp8EEroCXkLtqkK1zOw3x7e57KcJ2BGbn2vBEwcCVAx9myqs2DGbT7ONtMftaz11AxksmgQoph4=
Received: from 30.221.131.36(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WaoYTwg_1747273802 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 May 2025 09:50:03 +0800
Message-ID: <d6dbcc0a-71d8-472a-aa62-89d7ba586cbc@linux.alibaba.com>
Date: Thu, 15 May 2025 09:50:02 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: avoid using multiple devices with different
 type
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>
References: <20250515014837.3315886-1-shengyong1@xiaomi.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250515014837.3315886-1-shengyong1@xiaomi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/15 09:48, Sheng Yong wrote:
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

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
