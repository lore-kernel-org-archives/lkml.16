Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C991818A6DF
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744501760; cv=none; b=UO702QtvDJnPHofrbPKPGEx9zbiNCwgQGZm7TuAhi3pNyONpJCdx/HZejrVH5Ox3kK839YjEGpISMzFDLlBe+zrOf3X0zGwQLeCIzCVIE25c+YDLnMsCdo3mYp0qe2BAQmpCEAzQcF01ywAEw+eDRz3awGd62u8+K9iIQCNViiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744501760; c=relaxed/simple;
	bh=uX2BY3FrOB9e87FFO8t8hGGHygSRrfFaU1rwCItA4Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USY3xJatm6es+wczE125bLq538NWNIsKbmC4hCZA3nwVtjTBuDLSkBV9sdGX0kROfrrmEImQaKRCdZQ6uSSiYPerBZoMSGZklFmtTb+EziLv46yrVzKp7wW7PrqbXKRv6PssGdV46IuLRJyYpEfPSGm9HzwN8YPKoMgXloPiE6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Kkl4aEzx; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Kkl4aEzx"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744501749; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=KgSkZ2xZt9soRwSwJHmQBs+HS1ERTglPiadRqBx/qIo=;
	b=Kkl4aEzx/H+h0dmQJU6EkCAF+MMrE4dDInb0SH3/mKvkJSFX43F0c9Sh1vmw4/RD9UIeC5JayZzVvMmfoJoeCsQtNYmSqc0wodr/SZPZGbqGf26p1O1zpDGbujaWqma298Xa2uGnUmhV9blq7/HBcpwO3P2NSFkdNrWvdCSZjJY=
Received: from 30.212.138.182(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WWZSJr3_1744501747 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 13 Apr 2025 07:49:08 +0800
Message-ID: <b37df1b1-38ed-4f2b-bf62-eee9dab64835@linux.alibaba.com>
Date: Sun, 13 Apr 2025 07:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: Simplify return statement in
 ocfs2_filecheck_attr_store()
To: Thorsten Blum <thorsten.blum@linux.dev>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, akpm <akpm@linux-foundation.org>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250408103408.804253-1-thorsten.blum@linux.dev>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20250408103408.804253-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/4/8 18:34, Thorsten Blum wrote:
> Don't negate 'ret' and simplify the return statement.
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/filecheck.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/filecheck.c b/fs/ocfs2/filecheck.c
> index 1ad7106741f8..3ad7baf67658 100644
> --- a/fs/ocfs2/filecheck.c
> +++ b/fs/ocfs2/filecheck.c
> @@ -505,5 +505,5 @@ static ssize_t ocfs2_filecheck_attr_store(struct kobject *kobj,
>  		ocfs2_filecheck_handle_entry(ent, entry);
>  
>  exit:
> -	return (!ret ? count : ret);
> +	return ret ?: count;
>  }

