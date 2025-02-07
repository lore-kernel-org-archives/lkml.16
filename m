Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8CB19047F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738913607; cv=none; b=CIJH8viwoQ25OhERlhtuVmsuowdKg+Vo7kJY2msFCGmPOSxnlUbgScl53pyMknFET3sQCrm/24Og7qynIBRJiFncZucvH76oq4nNeDSsify76dPdEdb/Mm+AZA4N6381Ckw34WeShvzYdSlYxS6qaDO1B73uUU0w9zEBiNCNpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738913607; c=relaxed/simple;
	bh=l5OBrdB/SIjuT8WlflCp5UPf9dHwWGjNzyCAvbtEFqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pSCS7LlctUBSzcv4ruhACAPQ9Cf54dpLh9CEBOQk34jj5eRKq/oNuxVgwRSup1FF9MhHFVmTpxkfIgZt0MC3eIZMLgOk+yXVa9ptOPJ1Z7dRb6RFzjmEtyqJVqAzyM48Ga/xMY5bQpgJaReAYUcAKhUEOD/i9BifbsjtBMmNPME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yq5Jf0Bk2z1JJcy;
	Fri,  7 Feb 2025 15:32:02 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 93855140257;
	Fri,  7 Feb 2025 15:33:19 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Feb 2025 15:33:19 +0800
Message-ID: <7a9a2ead-88e5-4b53-9322-c649c92e73c2@huawei.com>
Date: Fri, 7 Feb 2025 15:33:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Hongzhen Luo <hongzhen@linux.alibaba.com>, <linux-erofs@lists.ozlabs.org>
CC: <linux-kernel@vger.kernel.org>
References: <20250207064135.2249529-1-hongzhen@linux.alibaba.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <20250207064135.2249529-1-hongzhen@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/2/7 14:41, Hongzhen Luo wrote:
> There's no need to enumerate each type.  No logic changes.
> 
> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
> ---
>   fs/erofs/zmap.c | 59 ++++++++++++++++++-------------------------------
>   1 file changed, 22 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
> index 689437e99a5a..0ee78413bfd5 100644
> --- a/fs/erofs/zmap.c
> +++ b/fs/erofs/zmap.c
> @@ -265,24 +265,20 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
>   		if (err)
>   			return err;
>   
> -		switch (m->type) {
> -		case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
> +		if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
>   			lookback_distance = m->delta[0];
>   			if (!lookback_distance)
>   				goto err_bogus;
>   			continue;
> -		case Z_EROFS_LCLUSTER_TYPE_PLAIN:
> -		case Z_EROFS_LCLUSTER_TYPE_HEAD1:
> -		case Z_EROFS_LCLUSTER_TYPE_HEAD2:
> +		} else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {
>   			m->headtype = m->type;
>   			m->map->m_la = (lcn << lclusterbits) | m->clusterofs;
>   			return 0;
> -		default:
> -			erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
> -				  m->type, lcn, vi->nid);
> -			DBG_BUGON(1);
> -			return -EOPNOTSUPP;
>   		}
> +		erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
> +			  m->type, lcn, vi->nid);
> +		DBG_BUGON(1);
> +		return -EOPNOTSUPP;

May be it would be easier to understand if you put the exception branch 
at the beginning. Such as:

if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
   // return -EOPNOTSUPP;
}

if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
   // do something
}

// do something for other cases..

This is also useful for other places. :)

Thanks,
Hongbo

>   	}
>   err_bogus:
>   	erofs_err(sb, "bogus lookback distance %u @ lcn %lu of nid %llu",
> @@ -329,35 +325,28 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
>   	DBG_BUGON(lcn == initial_lcn &&
>   		  m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD);
>   
> -	switch (m->type) {
> -	case Z_EROFS_LCLUSTER_TYPE_PLAIN:
> -	case Z_EROFS_LCLUSTER_TYPE_HEAD1:
> -	case Z_EROFS_LCLUSTER_TYPE_HEAD2:
> +	if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
> +		if (m->delta[0] != 1) {
> +			erofs_err(sb, "bogus CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
> +			DBG_BUGON(1);
> +			return -EFSCORRUPTED;
> +		}
> +		if (m->compressedblks)
> +			goto out;
> +	} else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {
>   		/*
>   		 * if the 1st NONHEAD lcluster is actually PLAIN or HEAD type
>   		 * rather than CBLKCNT, it's a 1 block-sized pcluster.
>   		 */
>   		m->compressedblks = 1;
> -		break;
> -	case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
> -		if (m->delta[0] != 1)
> -			goto err_bonus_cblkcnt;
> -		if (m->compressedblks)
> -			break;
> -		fallthrough;
> -	default:
> -		erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn,
> -			  vi->nid);
> -		DBG_BUGON(1);
> -		return -EFSCORRUPTED;
> +		goto out;
>   	}
> +	erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
> +	DBG_BUGON(1);
> +	return -EFSCORRUPTED;
>   out:
>   	m->map->m_plen = erofs_pos(sb, m->compressedblks);
>   	return 0;
> -err_bonus_cblkcnt:
> -	erofs_err(sb, "bogus CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
> -	DBG_BUGON(1);
> -	return -EFSCORRUPTED;
>   }
>   
>   static int z_erofs_get_extent_decompressedlen(struct z_erofs_maprecorder *m)
> @@ -386,9 +375,7 @@ static int z_erofs_get_extent_decompressedlen(struct z_erofs_maprecorder *m)
>   				m->delta[1] = 1;
>   				DBG_BUGON(1);
>   			}
> -		} else if (m->type == Z_EROFS_LCLUSTER_TYPE_PLAIN ||
> -			   m->type == Z_EROFS_LCLUSTER_TYPE_HEAD1 ||
> -			   m->type == Z_EROFS_LCLUSTER_TYPE_HEAD2) {
> +		} else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {
>   			if (lcn != headlcn)
>   				break;	/* ends at the next HEAD lcluster */
>   			m->delta[1] = 1;
> @@ -452,8 +439,7 @@ static int z_erofs_do_map_blocks(struct inode *inode,
>   		}
>   		/* m.lcn should be >= 1 if endoff < m.clusterofs */
>   		if (!m.lcn) {
> -			erofs_err(inode->i_sb,
> -				  "invalid logical cluster 0 at nid %llu",
> +			erofs_err(inode->i_sb, "invalid logical cluster 0 at nid %llu",
>   				  vi->nid);
>   			err = -EFSCORRUPTED;
>   			goto unmap_out;
> @@ -469,8 +455,7 @@ static int z_erofs_do_map_blocks(struct inode *inode,
>   			goto unmap_out;
>   		break;
>   	default:
> -		erofs_err(inode->i_sb,
> -			  "unknown type %u @ offset %llu of nid %llu",
> +		erofs_err(inode->i_sb, "unknown type %u @ offset %llu of nid %llu",
>   			  m.type, ofs, vi->nid);
>   		err = -EOPNOTSUPP;
>   		goto unmap_out;
