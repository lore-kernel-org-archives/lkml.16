Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95081EF36B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076796; cv=none; b=n0txR9MmPdrBMRQ6BhbHq2wlL4n0dkbgNkCvgiZxnSgkdiEitKrE74NpsLxaUkLT7h/z4/tDHWaJLRC7bHvO3mq7/4B8PmPPEubNSx2sOiGznQ7kFWRvblyop6EEOZg/Ehzc4k6v0EfnlQDfN6d8bALsPUAlPXGtVKimiZp29Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076796; c=relaxed/simple;
	bh=LHjIh7SrrJj1vGEg4Leu2HdoHohXcjN1SjtuAPRoHH4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C5t/MHpYLSGUNkEtDlEb4OmjY7POGWnm0nfS99xhmSyx1BYq+U+fU8v4oVXv4vMfGsqW7hCXhgsg7KHNHlIbbRRd2j9XZLtOTfOhRWfkLeJdhtr7TTxyCJbL6CousW2X52QEq6UyoOvjQRuUU9DXPRyL/YzEqd6zQtZwXoj/0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGu2SV3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGu2SV3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E36C4CEEA;
	Mon, 16 Jun 2025 12:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750076796;
	bh=LHjIh7SrrJj1vGEg4Leu2HdoHohXcjN1SjtuAPRoHH4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=SGu2SV3mZqHA1ACNeN/A6uREmZaBGZT2KQtf7GU2Rk7lT9M7cM63XclRjIW8f50oN
	 ne+P2IVhVoPLFFX9hFdolAuXmCWzrLAbQTTjZBoCQIeobMtJTuyA2kwE/a5fqKXlIy
	 iMqhBXPr0sW/k42Bkg83vHkgK5DTxC/K0if45Ua4t4e/IL55Dbhljx5oTJIvkYweNB
	 ZFLLdvqqo6XQgB0vopDZNeSYSI6BJ1gLRcAV6+FeA1Uu85pp8jnly9vhzn/eLKBNKA
	 i9tGuyBLGis/z2ozbnqsXSNWXiNZhkbGXaseubjewDFEX93x/U7NJJNsd57zKxcSXA
	 SJPvyC+6RvD5g==
Message-ID: <22d8f579-ed67-4c4f-9e62-5e32b8bd0a7d@kernel.org>
Date: Mon, 16 Jun 2025 20:26:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, niuzhiguo84@gmail.com, bintian.wang@honor.com,
 feng.han@honor.com
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid non-section-aligned size pinned
 file generation
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250613103829.1895191-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250613103829.1895191-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 18:38, wangzijie wrote:
> To prevent non-section-aligned size pinned file generated from truncation,
> add check condition in setattr. Meanwhile, clean up F2FS_I_SB.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..31ecf615b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1026,9 +1026,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  {
>  	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	block_t sec_blks = CAP_BLKS_PER_SEC(sbi);
>  	int err;
>  
> -	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
> +	if (unlikely(f2fs_cp_error(sbi)))
>  		return -EIO;
>  
>  	if (unlikely(IS_IMMUTABLE(inode)))
> @@ -1047,6 +1049,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(sec_blks)))

F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))?

as this is the only case we use sec_blks in f2fs_setattr().

And can you please do cleanup on sbi in separated patch?

Thanks,

> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);
> @@ -1068,12 +1075,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	}
>  	if (i_uid_needs_update(idmap, attr, inode) ||
>  	    i_gid_needs_update(idmap, attr, inode)) {
> -		f2fs_lock_op(F2FS_I_SB(inode));
> +		f2fs_lock_op(sbi);
>  		err = dquot_transfer(idmap, inode, attr);
>  		if (err) {
> -			set_sbi_flag(F2FS_I_SB(inode),
> -					SBI_QUOTA_NEED_REPAIR);
> -			f2fs_unlock_op(F2FS_I_SB(inode));
> +			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +			f2fs_unlock_op(sbi);
>  			return err;
>  		}
>  		/*
> @@ -1083,7 +1089,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  		i_uid_update(idmap, attr, inode);
>  		i_gid_update(idmap, attr, inode);
>  		f2fs_mark_inode_dirty_sync(inode, true);
> -		f2fs_unlock_op(F2FS_I_SB(inode));
> +		f2fs_unlock_op(sbi);
>  	}
>  
>  	if (attr->ia_valid & ATTR_SIZE) {
> @@ -1144,7 +1150,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	/* inode change will produce dirty node pages flushed by checkpoint */
> -	f2fs_balance_fs(F2FS_I_SB(inode), true);
> +	f2fs_balance_fs(sbi, true);
>  
>  	return err;
>  }

