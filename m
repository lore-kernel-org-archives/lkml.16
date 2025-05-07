Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E64B1E57
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611824; cv=none; b=L8pwiyNViLc3SfkYOgeML3i61us77TbtlH6RTudcpOApm9I5QwPazZ58JmQsaRD3OBvIA3Yqrzb+0LArUevvp36Gbru7XSyjWCo98x8tQ+aj+StlGdLSz7vgAByq8g24af9RdL8TpAFVqr90djKNm8Ph18T4hmtAj/HWXC1+Ec8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611824; c=relaxed/simple;
	bh=CnDX3Jdn654JdDg7bZF1n4gU4s3QtMlbIo0V1vS1aQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iqo1hjGD8UHhhHYIRJGWarqOwWvG2cVOUyGlOkW4ChiYUPDNUNO9PZZHV2Hn9EhQ4VKBP8VUSSbAwRxdikRmH6Y3tDEvKzQBCh2Yw9uMdxD8kiqh0RR0WLumW6UchH6aYpuedeMgJMZNMzkHOMlNWrxFRfba7gFvm7sNVWSaUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vvNQJTXg; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vvNQJTXg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746611818; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=vc9h5zCx8Tq7zNg1xC02laTprCNdx7HKwnVno6gZ9NE=;
	b=vvNQJTXggZbUhS/2X/bkLQEwujaYVW7ZL8SGwCZcC4Rnfsf3sV8dR7X4oLf43X//D+bmIZ7sDuZI9+SPgOKLF+PNT9trVs/GfLn5tH6AMEWmW5Q6ELPoD6xG2wb/OLEC4IxWb5JEMhIX0XT4tkfGbp/6ocY2H3e4f23TOYbNvzs=
Received: from 30.221.131.179(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZpED0u_1746611817 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 17:56:58 +0800
Message-ID: <56196c13-954f-4185-a17b-d52e337cb4f8@linux.alibaba.com>
Date: Wed, 7 May 2025 17:56:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] erofs: fix file handle encoding for 64-bit NIDs
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 huyue2@coolpad.com, jefflexu@linux.alibaba.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250507094015.14007-1-lihongbo22@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250507094015.14007-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/7 17:40, Hongbo Li wrote:
> EROFS uses NID to indicate the on-disk inode offset, which can
> exceed 32 bits. However, the default encode_fh uses the ino32,
> thus it doesn't work if the image is larger than 128GiB.
> 
> Let's introduce our own helpers to encode file handles.
> 
> It's easy to reproduce:
>    1. prepare an erofs image with nid bigger than U32_MAX
>    2. mount -t erofs foo.img /mnt/erofs
>    3. set exportfs with configuration: /mnt/erofs *(rw,sync,
>       no_root_squash)
>    4. mount -t nfs $IP:/mnt/erofs /mnt/nfs
>    5. md5sum /mnt/nfs/foo # foo is the file which nid bigger
>       than U32_MAX.  # you will get ESTALE error.
> 
> In the case of overlayfs, the underlying filesystem's file
> handle is encoded in ovl_fb.fid, which is similar to NFS's
> case. If the NID of file is larger than U32_MAX, the overlay
> will get -ESTALE error when calls exportfs_decode_fh.
> 
> Fixes: 3e917cc305c6 ("erofs: make filesystem exportable")
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang
