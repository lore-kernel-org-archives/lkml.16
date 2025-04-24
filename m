Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7022701BA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745456591; cv=none; b=IEAbEoXWeITz4j7TkrnwvGcg0ewaLu0RRKSnV2qvYW27PCDdxPKDzERKB3YnBRVNIqOdck4nDpZ8pFgVBSyRxetc9cvrIPWWda3xKqTVWcpqAQLbresaeFMrja1giGFVqqmKUP5qhUBz6hVt5A4O2FxjtRajd7nPHCAjv3sriHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745456591; c=relaxed/simple;
	bh=33AhOF/csKUTrt9UWmsPBZbHyjGABE/TO5GXXNEI8yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E++pbBP5LDL84PI7P1nVx/E4Tbt5eZH3vcYeSLxtb6h6llKgkTDHO2rIwLZocygiBBN7WUGXq+nRM39VQaxdTlQ5ZTHEcVIWI1JQUxqvLv9KCx86yDmIx47125Qkvsn2ZkwKf+imfIfpJhDQ5N6UV4uExHsvBQANnQNrQ3lRmWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=o6YS8Guj; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="o6YS8Guj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745456579; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nrmJiuaDqK+xRzPodoqlJ9NbO2ovRRHze9J0i+AXMSg=;
	b=o6YS8GujuzHYlC6r6Kr6fFiNR2Nh6izyXxnG5VaRvnZKaWf+NYET3c89q3OmrdeuLO63PF8XQseJnaNdKpqLVvXZUrzlUZOPxlRsqFF4XW49m39vsLJJFRfWDjFf+TMO4Lgcfx//40N0IIgdF6XvhM6Fbavl4e7Ii3fTZvwV04s=
Received: from 30.221.144.173(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0WXwDE2x_1745456262 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Apr 2025 08:57:42 +0800
Message-ID: <65f0265e-bcc4-48a5-9e8b-cc3aab13dde0@linux.alibaba.com>
Date: Thu, 24 Apr 2025 08:57:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: remove unnecessary NULL check before
 unregister_sysctl_table()
To: Chen Ni <nichen@iscas.ac.cn>, mark@fasheh.com, jlbec@evilplan.org,
 akpm <akpm@linux-foundation.org>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250422073051.1334310-1-nichen@iscas.ac.cn>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20250422073051.1334310-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2025/4/22 15:30, Chen Ni wrote:
> unregister_sysctl_table() checks for NULL pointers internally.
> Remove unneeded NULL check here.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/stackglue.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/stackglue.c b/fs/ocfs2/stackglue.c
> index ddd761cf44c8..a28c127b9934 100644
> --- a/fs/ocfs2/stackglue.c
> +++ b/fs/ocfs2/stackglue.c
> @@ -691,8 +691,7 @@ static void __exit ocfs2_stack_glue_exit(void)
>  	memset(&locking_max_version, 0,
>  	       sizeof(struct ocfs2_protocol_version));
>  	ocfs2_sysfs_exit();
> -	if (ocfs2_table_header)
> -		unregister_sysctl_table(ocfs2_table_header);
> +	unregister_sysctl_table(ocfs2_table_header);
>  }
>  
>  MODULE_AUTHOR("Oracle");

