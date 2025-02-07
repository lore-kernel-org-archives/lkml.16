Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313422094
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916993; cv=none; b=KLO2TcCFcbaKAvZDUI0k81U3aIKYS9AX9wshRzx1QrrrN5VmIKlVXRHHMySqCQMGk7eFIljRFLFwbYBDQO7WZhMczUqjFoCsPLj+xDaAkOBTYgpY9AL9us3/mMDLLfihM1SQgh/ss8DtQZfhZOdE5IxGKBRVignE46cSBGyX1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916993; c=relaxed/simple;
	bh=HSy2JwpD+BRqJIXapsG2+ToTnoxywnKVVRbALfYh9Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knKwoQ1daeAFmqXdnEGpMYs0/lLyu0kXifbXIzDIU01BX8GMyFAj8gOYXZGh45nivgDumTPJ8AQXCTAscOJ+VbIKqgtkWisa+Qg3c2nQeugxeCJa3U/O7JqrAhIdBHXlK5Upv8QilW7gVcX7AlEhzGoSpNVG5dBu+LEs5fwHBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=xEzmipLV; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="xEzmipLV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738916986; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+jh2igr9cD/8DYXSIO6GjGLquskOAstJHjX1kJ7AduE=;
	b=xEzmipLVCNb+3Kxtfd9bepjKfIo6gtqdrodcR/yJYpiJZUxwleVU8fQk7mdhgMJdzbtYeXYWd9biQDRnaXiFtl97Mk92dcAH/M34rj9Vv0Kj6ns468n4hDJ4HuqvSdmiEHEM1KSst4NwjoxScOWyf9pS/NWLaVDwvH4Y6z7vwic=
Received: from 30.74.129.145(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WOymIew_1738916985 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 16:29:45 +0800
Message-ID: <f4319592-df8f-4468-b8fb-7fcbc51804c6@linux.alibaba.com>
Date: Fri, 7 Feb 2025 16:29:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Hongzhen Luo <hongzhen@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250207080829.2405528-1-hongzhen@linux.alibaba.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250207080829.2405528-1-hongzhen@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/7 16:08, Hongzhen Luo wrote:
> There's no need to enumerate each type.  No logic changes.
> 
> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
> ---
> Changes since v1: Put the exception branch at the beginning.
> 
> v1: https://lore.kernel.org/all/20250207064135.2249529-1-hongzhen@linux.alibaba.com/
> ---
>   fs/erofs/zmap.c | 65 +++++++++++++++++++++----------------------------
>   1 file changed, 28 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
> index 689437e99a5a..f65c76991e02 100644
> --- a/fs/erofs/zmap.c
> +++ b/fs/erofs/zmap.c
> @@ -265,23 +265,22 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
>   		if (err)
>   			return err;
>   
> -		switch (m->type) {
> -		case Z_EROFS_LCLUSTER_TYPE_NONHEAD:
> +		if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
> +			erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
> +				  m->type, lcn, vi->nid);
> +			DBG_BUGON(1);
> +			return -EOPNOTSUPP;
> +		}
> +
> +		if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
>   			lookback_distance = m->delta[0];
>   			if (!lookback_distance)
>   				goto err_bogus;
>   			continue;
> -		case Z_EROFS_LCLUSTER_TYPE_PLAIN:
> -		case Z_EROFS_LCLUSTER_TYPE_HEAD1:
> -		case Z_EROFS_LCLUSTER_TYPE_HEAD2:
> +		} else if (m->type < Z_EROFS_LCLUSTER_TYPE_MAX) {


Just `} else {` here?

>   			m->headtype = m->type;
>   			m->map->m_la = (lcn << lclusterbits) | m->clusterofs;
>   			return 0;
> -		default:
> -			erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
> -				  m->type, lcn, vi->nid);
> -			DBG_BUGON(1);
> -			return -EOPNOTSUPP;
>   		}
>   	}
>   err_bogus:
> @@ -329,35 +328,31 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
>   	DBG_BUGON(lcn == initial_lcn &&
>   		  m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD);
>   
> -	switch (m->type) {
> -	case Z_EROFS_LCLUSTER_TYPE_PLAIN:
> -	case Z_EROFS_LCLUSTER_TYPE_HEAD1:
> -	case Z_EROFS_LCLUSTER_TYPE_HEAD2:
> +	if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
> +		erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
> +		DBG_BUGON(1);
> +		return -EFSCORRUPTED;
> +	}

No, I don't think it's equivalent, please use
the previous version for this part instead.

Thanks,
Gao Xiang
