Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1A6C2D1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137779; cv=none; b=d+KnGtu3vtpa97Dq/xqxxtcNwflX87dQqDn2PDqetj1JZKOY72TTUsM8jnw0V8Mb6IkYJFNRkVjJfcq86X9lcJKVrs0f+qUtJPrmuGMU/GqQjj73I81gmN3GW3mgQr+To0I/5tCyRZcFe7rwUW0ynynrrKNPaWDI4f9AAYEHn68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137779; c=relaxed/simple;
	bh=tFRSsMCPVFwL8Dbfsu98Pw3xF+UngvzyuxWLkGDBlVQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VIyAdbzOVauxgaUd1yXmEHSdog+un9nV9ihLTvyy0v+9DU14Ds/ysp5tRbG0cKwLgwr/XZ6vR+Wb/0jSXQDq9RQL+o1OTZ7Y/wrSeWlP9XWmwJbZekP2UMVnb04W8v9z4GksK3y5UEesaPcKWkAo9yT5IthMTeNXIi6yh3EaqB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VcCl3JUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VcCl3JUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AFBC4CEE3;
	Tue, 17 Jun 2025 05:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750137778;
	bh=tFRSsMCPVFwL8Dbfsu98Pw3xF+UngvzyuxWLkGDBlVQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=VcCl3JUFDqh3Wv2Jv9k36Ydx18j59hpGR2r9C36Kr/XszRMP8iFC64mv2SkbK7TEz
	 oocpefpn9KkpQcoWbl9F0MuiQd8bxi0nUnyB1Oc82guB7FqlM5bfcm+sb1zrlnKKTY
	 Fa0FiLBrlMF9E+d1iPdyvfhU7d5xkeSp7HujsjMPsenkSBQngzgEEzoSQppt8uzqV/
	 PMYfTr511qeTSu9edTStthARWVHe3eT6JBTnzv5nA+EYx64LkVMO2/OKL/WDoOXyeu
	 7l0DSPSc8Ij/7k9OEVTidFjiAz9PdUxrG24VcxWVllJhirndbKN02uhJuwjQS/6ioI
	 RdMfU39jN8auQ==
Message-ID: <6ccfdae1-13f7-421d-b7d3-76883c2e7b8b@kernel.org>
Date: Tue, 17 Jun 2025 13:22:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, bintian.wang@honor.com, feng.han@honor.com,
 niuzhiguo84@gmail.com
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size
 pinned file generation
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250617035711.2342823-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250617035711.2342823-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/25 11:57, wangzijie wrote:
> To prevent non-section-aligned size pinned file generated from truncation,
> add check condition in setattr.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/file.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..72f7d1b4a 100644
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
> @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  			!IS_ALIGNED(attr->ia_size,
>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>  			return -EINVAL;
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&

Do we need to consider attr->ia_size > i_size case?

Thanks,

> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);

