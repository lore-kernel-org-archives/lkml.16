Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5961D219EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209483; cv=none; b=fpPsOtlyFLrzSPDeY0L6/RMFkvBsVeOfoqkQtTCQErQhUulo/ss4qgdn4pqb0+M0BL8KNpOojcI2huFR98kSkyMEw2KTbFhVww8OS0bXK2cTHkrYQQ8vGLK7kVUI5CB+m4AXffOyyztBjATZjwZjkHHygjbrRNFsvOl8tm3DpL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209483; c=relaxed/simple;
	bh=30ovmPkyUIO+VWTX8LV95YQyDUnszGZNsf0GYOJ6OJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IDD5r6Mf6RPqiTmQ7xhz9Pq/wpfcaRpe+aR8MNFanaOzoLLACCnwWAxJzkzCWMtx7ldp3+IKahWzRzM6oyPjb04+ex7xrchw49auAEgY3Ju64EbTOrJSBUYZwxiTMfdGFzFa4Z8+FdAu8gCSuf0EqZjuZRjEgaWO0BEyoYDJX3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=j7atDkaG; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="j7atDkaG"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=oivfvuFpSof7V2JHY5dYM3FHV+vS0yRXVZLn+vhja3w=;
	b=j7atDkaGg3njDntrYxgZlLvtcnXyfIH1PS4qqLkBNj2Vx1dD0A0IainY9ujrFg/suAZOgQ/2n
	kJByG3Wxm5OUg+x2D0zEKVUCqwgzLRpcTXyZcarG6u/RYApbsT8xdr/5RQfoPvc05mrMHmH4Dvb
	lIzD+V/PkIXR5ZsnkIBqfpQ=
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bMQmC55bDzYl8Ws;
	Wed, 18 Jun 2025 09:15:55 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 09:17:57 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 18 Jun
 2025 09:17:56 +0800
From: wangzijie <wangzijie1@honor.com>
To: <wangzijie1@honor.com>
CC: <chao@kernel.org>, <feng.han@honor.com>, <jaegeuk@kernel.org>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: don't allow unaligned truncation to smaller size on pinned file
Date: Wed, 18 Jun 2025 09:17:56 +0800
Message-ID: <20250618011756.2451449-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617123116.2385828-1-wangzijie1@honor.com>
References: <20250617123116.2385828-1-wangzijie1@honor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a011.hihonor.com
 (10.68.31.243)

> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v2:
> - add comments and change a proper subject
> ---
>  fs/f2fs/file.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6bd3de64f..09be6e849 100644
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
> +		 * To prevent scattered pin block generation, we don't
> +		 * allow smaller size unaligned truncation for pinned file.
> +		 * We only support overwrite IO to pinned file, so don't
> +		 * care about larger size truncation.
> +		 */
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size < i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
>  	}
>  
>  	err = setattr_prepare(idmap, dentry, attr);
> -- 
> 2.25.1

I missed attr->ia_size == i_size case...I will cover that in next version.


