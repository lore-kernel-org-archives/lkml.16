Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348B26B084
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663385; cv=none; b=tpZVKmJhfSUCuxuovs4g6GcaHmUlIQR061FflJFjKqeYgpkLK6EYOdl9/WWmH9TcEhR08/NRojveuEX8+nb9yYdNSOQHGvDQj6LzpMikSIxjuLJ7cF7ElXQjtIREUnG2vBLXUmwYbs+YjSBv38u4+hF2s9655IR6BED2ngwXcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663385; c=relaxed/simple;
	bh=dw5r6EoWycX44USnmGuyhAxfmRCq5hYiS8psNX4a8Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=sWvwf1aCElUppIivrsFhToRZZ25KK9CtZ+1CJBKi3RwcSmorf2w3IR4dY6MpC4GkuStHG/YEbAGoNJ0LeQyAHnNycX/hNDO6I0Qbd5pM7Zxh0DQlWRA+12eGpLis0dPohvn0+rgdubzx+M+Eg9ydONd2+cY4JpHPuu5zX+rqp9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4b1K6n1KxXz1Z1xR;
	Mon, 19 May 2025 21:59:13 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 76773180477;
	Mon, 19 May 2025 22:02:54 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 19 May 2025 22:02:53 +0800
Message-ID: <eaab881c-086d-47b0-993e-0312f0bbf1e2@huawei.com>
Date: Mon, 19 May 2025 22:02:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] erofs: add 'fsoffset' mount option to specify
 filesystem offset
Content-Language: en-US
To: linux-erofs mailing list <linux-erofs@lists.ozlabs.org>
References: <20250517090544.2687651-1-shengyong1@xiaomi.com>
 <aCqrceu67F3rh3JM@debian>
CC: Sheng Yong <shengyong2021@gmail.com>, <hsiangkao@linux.alibaba.com>,
	<chao@kernel.org>, <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>,
	<dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Wang Shuai <wangshuai12@xiaomi.com>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <aCqrceu67F3rh3JM@debian>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/5/19 11:54, Gao Xiang wrote:
> Hi Yong,
> 
> On Sat, May 17, 2025 at 05:05:43PM +0800, Sheng Yong wrote:
>> From: Sheng Yong <shengyong1@xiaomi.com>
>>
>> When attempting to use an archive file, such as APEX on android,
>> as a file-backed mount source, it fails because EROFS image within
>> the archive file does not start at offset 0. As a result, a loop
>> or a dm device is still needed to attach the image file at an
>> appropriate offset first. Similarly, if an EROFS image within a
>> block device does not start at offset 0, it cannot be mounted
>> directly either.
>>
>> To address this issue, this patch adds a new mount option `fsoffset=x'
>> to accept a start offset for the primary device. The offset should be
>> aligned to the block size. EROFS will add this offset before performing
>> read requests.
>>
>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>> Signed-off-by: Wang Shuai <wangshuai12@xiaomi.com>
> 
> I applied the following diff to fulfill the Hongbo's previous suggestion
> and refine an error message:
> 
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index 11b0f8635f04..d93b30287110 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -128,7 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
>   domain_id=%s           Specify a domain ID in fscache mode so that different images
>                          with the same blobs under a given domain ID can share storage.
> -fsoffset=%lu           Specify image offset for the primary device.
> +fsoffset=%lu           Specify block-aligned filesystem offset for the primary device.

Thanks,

Reviewed-by: Hongbo Li <lihongbo22@huawei.com>

>   ===================    =========================================================
>   
>   Sysfs Entries
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 3185bb90f549..e1e9f06e8342 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -654,9 +654,9 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>   	}
>   
>   	if (sbi->dif0.fsoff) {
> -		if (sbi->dif0.fsoff & ((1 << sbi->blkszbits) - 1))
> -			return invalfc(fc, "fsoffset %llu not aligned to block size",
> -				       sbi->dif0.fsoff);
> +		if (sbi->dif0.fsoff & (sb->s_blocksize - 1))
> +			return invalfc(fc, "fsoffset %llu is not aligned to block size %lu",
> +				       sbi->dif0.fsoff, sb->s_blocksize);
>   		if (erofs_is_fscache_mode(sb))
>   			return invalfc(fc, "cannot use fsoffset in fscache mode");
>   	}
