Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE8B4431
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749451695; cv=none; b=cHyfdzwVKsS17PAD1MOVaafi4ijVl5k3JHJifJGll91hwX9YTK5We1+N8xDmLxzVlL2+TlS6R64KCfOnOhZe71zNM4pLM3DentctSOAFSel0DnyFgNI3pxrKBhEUW+TqvYNS7wVNIa7QkX/KzMakwZYQZd4DccLY8gxGWMgpaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749451695; c=relaxed/simple;
	bh=Gp7fG8N6TQ3sTra8P+zZLx2WWKf/dLaSz27Gjo1bZ0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnmae1LORdWI+txUPtaXscRIS5fNqYQ4f7hAcAc/H9BaoEnhik/alPUljQT8YVc4UTKqq7fTunqVqWve5wx3FjnlH+iHa9mQntlzr3FkoWKEryotKnZQBGjlclN6DObDsHK9bNKE/hd7CVG7RjDOr02yOdaHiHmC1C422VBt8fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-1f-684683a6ee63
From: Rakie Kim <rakie.kim@sk.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel_team@skhynix.com
Subject: Re: [PATCH v5 09/10] mm,mempolicy: Use node-notifier instead of memory-notifier
Date: Mon,  9 Jun 2025 15:47:55 +0900
Message-ID: <20250609064800.1830-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250605142305.244465-10-osalvador@suse.de>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsXC9ZZnoe6yZrcMg40zNS0m9hhYzFm/hs3i
	6/pfzBb3lz1jsVi18BqbxeVdc9gs7q35z2pxZlqRxezGPkYHTo+ds+6ye7QcecvqsenTJHaP
	EzN+s3h8fHqLxeP9vqtsHmcWHGH32Hy62uPzJrkAzigum5TUnMyy1CJ9uwSujB9ts5gLjvFV
	zHq6lqmBcQ93FyMnh4SAicSN/kXMMHbn121ANgcHm4CSxLG9MSBhEQE1iWmvGtm7GLk4mAWe
	M0kcbDjCDpIQFoiQeHxvCxOIzSKgKjH/zS6wOC/QnIsLH7JDzNSUaLh0D6yGU8BS4nXXCTBb
	SIBH4tWG/YwQ9YISJ2c+YQGxmQXkJZq3zmYGWSYhcJlN4tyLXVDHSUocXHGDZQIj/ywkPbOQ
	9CxgZFrFKJSZV5abmJljopdRmZdZoZecn7uJERjky2r/RO9g/HQh+BCjAAejEg9vwnTXDCHW
	xLLiytxDjBIczEoivAL3nTOEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xp9K08REkhPLEnNTk0t
	SC2CyTJxcEo1MCp9Kqs03Tr93caokH7u+I0elbyqdmf+hMix5ysa3zjnprT5mOwDi3ttivvj
	+hcYnFnxju/dz5OX/FcZWaklK92Z0lsg2JbxvWXjdumDq9cpfZfoS+nuab8+b4VL6gTPKEaO
	be/KHlZvf7izYrb0Nu6StOX+9zMW5vJrPrq04UzG/7Vy2wLEtiixFGckGmoxFxUnAgAfrxd1
	bgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsXCNUNNS3dZs1uGwb0p0hYTewws5qxfw2bx
	df0vZov7y56xWKxaeI3N4vDck6wWl3fNYbO4t+Y/q8WZaUUWh649Z7WY3djH6MDtsXPWXXaP
	liNvWT02fZrE7nFixm8Wj49Pb7F4vN93lc3j220Pj8UvPjB5nFlwhN1j8+lqj8+b5AK4o7hs
	UlJzMstSi/TtErgyfrTNYi44xlcx6+lapgbGPdxdjJwcEgImEp1ftzF3MXJwsAkoSRzbGwMS
	FhFQk5j2qpG9i5GLg1ngOZPEwYYj7CAJYYEIicf3tjCB2CwCqhLz3+wCi/MCzbm48CE7xExN
	iYZL98BqOAUsJV53nQCzhQR4JF5t2M8IUS8ocXLmExYQm1lAXqJ562zmCYw8s5CkZiFJLWBk
	WsUokplXlpuYmWOqV5ydUZmXWaGXnJ+7iREYxMtq/0zcwfjlsvshRgEORiUe3oTprhlCrIll
	xZW5hxglOJiVRHgF7jtnCPGmJFZWpRblxxeV5qQWH2KU5mBREuf1Ck9NEBJITyxJzU5NLUgt
	gskycXBKNTAWCsz3z5HTb3j4dsKTLRIeJzifd4e2a9kJJ5YmGR/dLbrmttyLBasv2y3n+xDu
	t9BBiSND6N4hrQm7piR+qfFwm6vlz6H9X1rq7fOf0ob7WZodlnv9DK96qf/5+DbO5c+P/clv
	4Tb5pLbx9C35LUeVVAqqvKwmKOqwSf11nr7LOW/3ac7a42eVWIozEg21mIuKEwG+CYdFXgIA
	AA==
X-CFilter-Loop: Reflected

On Thu,  5 Jun 2025 16:23:00 +0200 Oscar Salvador <osalvador@suse.de> wrote:
> mempolicy is only concerned when a numa node changes its memory state,
> because it needs to take this node into account for the auto-weighted
> memory policy system.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/mempolicy.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 72fd72e156b1..1b87628f3cfc 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -3793,20 +3793,20 @@ static int wi_node_notifier(struct notifier_block *nb,
>  			       unsigned long action, void *data)
>  {
>  	int err;
> -	struct memory_notify *arg = data;
> -	int nid = arg->status_change_nid;
> +	struct node_notify *arg = data;
> +	int nid = arg->nid;
>  
>  	if (nid < 0)
>  		return NOTIFY_OK;
>  
>  	switch (action) {
> -	case MEM_ONLINE:
> +	case NODE_ADDED_FIRST_MEMORY:
>  		err = sysfs_wi_node_add(nid);
>  		if (err)
>  			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
>  			       nid, err);
>  		break;
> -	case MEM_OFFLINE:
> +	case NODE_REMOVED_LAST_MEMORY:
>  		sysfs_wi_node_delete(nid);
>  		break;
>  	}
> @@ -3845,7 +3845,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
>  		}
>  	}
>  
> -	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
> +	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
>  	return 0;
>  
>  err_cleanup_kobj:
> -- 
> 2.49.0
> 

Reviewed-by: Rakie Kim <rakie.kim@sk.com>

Rakie

