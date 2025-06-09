Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC44431
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749439868; cv=none; b=QwUj7gmc3VDByzDjHdiconcRi6bR+wUgwziAV2PP+O4voxVEwYLfC0gvTV9JbCosDu2TR1j+5IMgm9N4WtelHLo9fzJC6cTn9+dzs9HD69ZEptWzJhT0EURruEtnEVgFF+gql5lKoFnqyS3cvlUc9ZeUtqXzB7w8gUnkRRYnRrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749439868; c=relaxed/simple;
	bh=DreDo2n2jK/0am3oWk/Bgn/gRIblHRe8vna5RxJhzJc=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LSGmFKmbWYh9sr5Rw14qtXUvL1oyCtuQhw6vjfAn1FW39+Dt5VYtvw8U/BzVxQQMiicwGJZdtjZJQI6+3xSyRMx8GEFGgT0MBsKo/rh0tp/d4W4Pnhvvh9i6h8BEr3Bh/qbwVKCEe5Pj4OAFEPbwY5/769MxWHX0RYIiOgwJth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bFy5P3sBMzRk3G;
	Mon,  9 Jun 2025 11:26:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id AE5E2140132;
	Mon,  9 Jun 2025 11:31:01 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 11:31:00 +0800
Subject: Re: [PATCH] ubifs: Remove uncallable debug code
To: <linux@treblig.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250608230846.166822-1-linux@treblig.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a3db4a26-fc36-f3fe-6d75-3fe1e6263a6d@huawei.com>
Date: Mon, 9 Jun 2025 11:31:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250608230846.166822-1-linux@treblig.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)

ÔÚ 2025/6/9 7:08, linux@treblig.org Ð´µÀ:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> ubifs_dump_budget_req() and ubifs_dump_index() have been unused
> since they were originally added back in 2008's
> commit 1e51764a3c2a ("UBIFS: add new flash file system")
> 
> They were renamed from dbg_dump_budget_req() and dbg_dump_index() in
> 2012.
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   fs/ubifs/debug.c | 36 ------------------------------------
>   fs/ubifs/debug.h |  2 --
>   2 files changed, 38 deletions(-)

I guess these functions are used to debug in early development. I use 
them somtimes for debugging/developing. IMO, no need to drop them.
> 
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index b01f382ce8db..05124392d1d9 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -580,23 +580,6 @@ void ubifs_dump_node(const struct ubifs_info *c, const void *node, int node_len)
>   	spin_unlock(&dbg_lock);
>   }
>   
> -void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
> -{
> -	spin_lock(&dbg_lock);
> -	pr_err("Budgeting request: new_ino %d, dirtied_ino %d\n",
> -	       req->new_ino, req->dirtied_ino);
> -	pr_err("\tnew_ino_d   %d, dirtied_ino_d %d\n",
> -	       req->new_ino_d, req->dirtied_ino_d);
> -	pr_err("\tnew_page    %d, dirtied_page %d\n",
> -	       req->new_page, req->dirtied_page);
> -	pr_err("\tnew_dent    %d, mod_dent     %d\n",
> -	       req->new_dent, req->mod_dent);
> -	pr_err("\tidx_growth  %d\n", req->idx_growth);
> -	pr_err("\tdata_growth %d dd_growth     %d\n",
> -	       req->data_growth, req->dd_growth);
> -	spin_unlock(&dbg_lock);
> -}
> -
>   void ubifs_dump_lstats(const struct ubifs_lp_stats *lst)
>   {
>   	spin_lock(&dbg_lock);
> @@ -963,25 +946,6 @@ void ubifs_dump_tnc(struct ubifs_info *c)
>   	pr_err("(pid %d) finish dumping TNC tree\n", current->pid);
>   }
>   
> -static int dump_znode(struct ubifs_info *c, struct ubifs_znode *znode,
> -		      void *priv)
> -{
> -	ubifs_dump_znode(c, znode);
> -	return 0;
> -}
> -
> -/**
> - * ubifs_dump_index - dump the on-flash index.
> - * @c: UBIFS file-system description object
> - *
> - * This function dumps whole UBIFS indexing B-tree, unlike 'ubifs_dump_tnc()'
> - * which dumps only in-memory znodes and does not read znodes which from flash.
> - */
> -void ubifs_dump_index(struct ubifs_info *c)
> -{
> -	dbg_walk_index(c, NULL, dump_znode, NULL);
> -}
> -
>   /**
>    * dbg_save_space_info - save information about flash space.
>    * @c: UBIFS file-system description object
> diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
> index d425861e6b82..1d5c8ee8b64a 100644
> --- a/fs/ubifs/debug.h
> +++ b/fs/ubifs/debug.h
> @@ -245,7 +245,6 @@ const char *dbg_snprintf_key(const struct ubifs_info *c,
>   void ubifs_dump_inode(struct ubifs_info *c, const struct inode *inode);
>   void ubifs_dump_node(const struct ubifs_info *c, const void *node,
>   		     int node_len);
> -void ubifs_dump_budget_req(const struct ubifs_budget_req *req);
>   void ubifs_dump_lstats(const struct ubifs_lp_stats *lst);
>   void ubifs_dump_budg(struct ubifs_info *c, const struct ubifs_budg_info *bi);
>   void ubifs_dump_lprop(const struct ubifs_info *c,
> @@ -260,7 +259,6 @@ void ubifs_dump_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap,
>   void ubifs_dump_pnode(struct ubifs_info *c, struct ubifs_pnode *pnode,
>   		      struct ubifs_nnode *parent, int iip);
>   void ubifs_dump_tnc(struct ubifs_info *c);
> -void ubifs_dump_index(struct ubifs_info *c);
>   void ubifs_dump_lpt_lebs(const struct ubifs_info *c);
>   
>   int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
> 

