Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2230502BE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919669; cv=none; b=JNwQuczCFvt28kdnKWBe2IJMWV0kSdV475cp4Jyqfv1QqeKlDk5uKxXV/wC1nfZVdh+gdA/4KYsET3U2C48KB1vhbJzSIdsLQyGdoUU/ShdiOIjX2tCMcS+p1EMLpKYmTKoYPLB+SJCOofsi3LjYVbFAyCPoXNqDgspgffU1tQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919669; c=relaxed/simple;
	bh=C0G+AGBgXEtcES3nSHcN9cHb9nHpmUqNrXXAOw+vyWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEEl4n/iPSiAbnRtyMqaQeJfZGAdJK+S9VWu0vp8XkLIdd7Jb+aup3VKYPhETwUElAk+FzPGtLMPUb9TFf9VM7vQPPeNa2J836kPK3rNooTD3iCUtcKxo4eZvuW7lhbGhsWGKNtO/bklT1aIIoTLp4EFByHP834+tP8bqGapPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=frMIE2sw; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="frMIE2sw"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738919664; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=DCJRQQSMDhi4PPr4vjXgNPiPlE/jCmmPdCQjjVLbenU=;
	b=frMIE2swIJBq4grrAbGi02K9eWqZ6wU0YYvPNYTGZeOGUn2q3J5XbTm+ZsEwTheiBKD+6HiI22LgxQ1Wr6voDWiqmweC/xgjdH6e1K+tbNsTAXMAgmrM+x7jaCyPM95ElS9k3O/MLtYasv/HCcHc7w+Dyt3FIDpx3TpT9t247VY=
Received: from 30.74.129.145(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WOyysU1_1738919663 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:14:23 +0800
Message-ID: <29c5e464-4a11-42f4-b303-279c4b642471@linux.alibaba.com>
Date: Fri, 7 Feb 2025 17:14:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: use Z_EROFS_LCLUSTER_TYPE_MAX to simplify
 switches
To: Hongzhen Luo <hongzhen@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
References: <20250207085056.2502010-1-hongzhen@linux.alibaba.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250207085056.2502010-1-hongzhen@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/7 16:50, Hongzhen Luo wrote:
> There's no need to enumerate each type.  No logic changes.
> 
> Signed-off-by: Hongzhen Luo <hongzhen@linux.alibaba.com>
> ---> v3: Code cleanup, remove logically inequivalent changes.
> v2: https://lore.kernel.org/all/20250207080829.2405528-1-hongzhen@linux.alibaba.com/
> v1: https://lore.kernel.org/all/20250207064135.2249529-1-hongzhen@linux.alibaba.com/
> ---
>   fs/erofs/zmap.c | 60 +++++++++++++++++++------------------------------
>   1 file changed, 23 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
> index 689437e99a5a..7dba1573498b 100644
> --- a/fs/erofs/zmap.c
> +++ b/fs/erofs/zmap.c
> @@ -265,23 +265,20 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
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
> +		} else if (m->type == Z_EROFS_LCLUSTER_TYPE_NONHEAD) {
>   			lookback_distance = m->delta[0];
>   			if (!lookback_distance)
>   				goto err_bogus;'

Maybe just kill `goto err_bogus;` too, like:
                         if (!lookback_distance) {
                                 erofs_err(sb, "bogus lookback distance %u @ lcn %lu of nid %llu",
                                           lookback_distance, m->lcn, vi->nid);
                                 DBG_BUGON(1);
                                 return -EFSCORRUPTED;
                         }

Otherwise it looks good to me.

Thanks,
Gao Xiang
