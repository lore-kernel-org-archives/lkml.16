Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A734A2D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701255; cv=none; b=qdbcbi6DsHBOuTso9No/Z7bVSVelC00cGtL6X3TNU29ajOaJdjY7OlgL224cbBssE1Pmss7eMcrTKaTQAEgdejy9eP8h78dZT1jtsT4heK8aR8o009xD+b8QByAtoyOqVlXR1xkVcQLE/nygcZoNnTwO9PYbjV8NLUQGlWvPzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701255; c=relaxed/simple;
	bh=B4UqzSsFNEKMVyeR9dnUHb+/9U5jqoYKChK1+a2TXbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9884TxkqHA6yoev65pkm83SGybjq7WdQGgwuYC4p3nWwJTR+h4HPODzou12BgPW3GOgQ+oyw7Y71hsc5dfXuR7SSBlpKpwIjQeWN3nfMygTgQkXY1zxGJYvzqge9xzSjX6JfBvoYntQlctxLjRJyuYjeMl7+9unVslpO1u0xpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smPslhwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smPslhwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15752C4CEEA;
	Mon, 23 Jun 2025 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750701253;
	bh=B4UqzSsFNEKMVyeR9dnUHb+/9U5jqoYKChK1+a2TXbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smPslhwrtnwyR82BRUIRCuzzFDDaMP1Y47PIXdCB/IbQDqdk4szxA7PJ/fYJ902QK
	 MDIgYb8WqD72BcjNmCyzrPQhieTLr3OxncKu6bzmrlYpbx00ddGjEYoAGXC4zAL26U
	 KNPg88cl+eHUYMRrQhCxKozzBVF+5CI5ZGWf9DfvvaRagqEyrzz1qWO30zAP1mLlJq
	 eLOtUNN+3Efq4M6ZEg2yvG3aiJWiPpHxkr9SY6q7nLev9vgmdeT+wzj7ERKJPhU6e9
	 bgBlHbLgqQmvyr60gEgFVW1KYtxu86zKB1fnchBaoLZkhHwGOuy0HaaYqEUIjSqYYh
	 798EHzUeGceng==
Date: Mon, 23 Jun 2025 17:54:11 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: wangzijie <wangzijie1@honor.com>
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, bintian.wang@honor.com,
	feng.han@honor.com, niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
Message-ID: <aFmUw46N1ibXcgIj@google.com>
References: <20250618064303.2477852-1-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618064303.2477852-1-wangzijie1@honor.com>

Hi,

Please do sbi conversion first, and apply this change.

On 06/18, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v3:
> - cover attr->ia_size == i_size case
> v2:
> - add comments and change a proper subject
> ---
>  fs/f2fs/file.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..9e0f1c98f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int err;
>  
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> @@ -1047,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		/*
> +		 * To prevent scattered pin block generation, we don't allow
> +		 * smaller/equal size unaligned truncation for pinned file.
> +		 * We only support overwrite IO to pinned file, so don't
> +		 * care about larger size truncation.
> +		 */
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size <= i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);
> -- 
> 2.25.1
