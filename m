Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F7F28C02A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301352; cv=none; b=QOJUE6vpBviOdTm0YMxnvLvGaoPY9OkUp2kYtMBjC1EG0WOEY8dyuhyKJ9v17r0c+9ggeJXCXn2vncvVnLliyHtDdOcvv/8reYiiN68qi6RTt5/NDYg4smwsofL543/MBZls3W7hgsZDZzk/DqVw2HTu/a44qoV/XF3edXycX3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301352; c=relaxed/simple;
	bh=Ml+ykxexs/4VAYBnw+V4Z2aKCJJuZGuUfSSJ+SJWmEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMVfoFWAyeT0c5gNAhUtygXhXJLLRmOjjIGYj2VlwR6lI/eBQ7GVFlZBLAlBXH3UJ0uH8O2hUbGlCTPLEwN4cuO09HhavU0THL/iJZrGkhRHtOaZDpSKU0w8Mr2zX05pxCFv1R1EmLOlqEVlcBjcIxYbMEJboKHHMI3j3WtCQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAg/zjah; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAg/zjah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD49C4CEF1;
	Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751301352;
	bh=Ml+ykxexs/4VAYBnw+V4Z2aKCJJuZGuUfSSJ+SJWmEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAg/zjah/TaXBn/ewKWLXuAWNIq3V6JQ2P/51AHn/AHYNADyenNKO727uxLbNDd0C
	 AIpaPXBQlKuAgEgkD9QmLi1ze/FWsXvEI4MOd3rATvEfggjApkxzIA8irTnvmPXI2w
	 cs0OJlOi9duJEOcfyYkzzMlgQb82tBM9W3vcdFha8lPWJyisYyyRjtgtGrUW22TWeH
	 /yTQjLpiq4BEz1YAWxEAMXoBzIQi/wDK1JYnqedlzJTa5FYHLs+zikXYIVR330zASA
	 4uHqZcpKXbb8E3dNySo5/8qqc9OClvNlo3pzN+UiM15Ben2iamxpHcinOWcUQEPRz1
	 1NCFhInJMbCrw==
Date: Mon, 30 Jun 2025 16:35:49 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: wangzijie <wangzijie1@honor.com>
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, bintian.wang@honor.com,
	feng.han@honor.com, niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
Message-ID: <aGK85SAE9kDcVAMe@google.com>
References: <20250630095454.3912441-1-wangzijie1@honor.com>
 <20250630095454.3912441-2-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630095454.3912441-2-wangzijie1@honor.com>

I think we can clean up more like this?

https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u

On 06/30, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
> setattr_prepare().
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v5:
> - fix xfstests #494 fail
> ---
>  fs/f2fs/file.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 78368b793..d4feea44b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (err)
>  		return err;
>  
> +	/*
> +	 * To prevent scattered pin block generation, we don't allow
> +	 * smaller/equal size unaligned truncation for pinned file.
> +	 * We only support overwrite IO to pinned file, so don't
> +	 * care about larger size truncation.
> +	 * We need to check this after setattr_prepare() because xfstests
> +	 * #494 assumes truncation on active swapfile(pinned) will
> +	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
> +	 */
> +	if (attr->ia_valid & ATTR_SIZE) {
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size <= i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
> +	}
> +
>  	err = fscrypt_prepare_setattr(dentry, attr);
>  	if (err)
>  		return err;
> -- 
> 2.25.1
