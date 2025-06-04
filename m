Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D757B28F511
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039432; cv=none; b=PIvEPt28acnIZyQJFOVLUZEEgKDNQKo1sEWrEvsW9w2OzlE42Y93PuSEte3jIlYxhz9zlFPh4VMlUZ+k8J+wEgdy/5rMZ2txsARjsG/WHiq0vrbrIWOkIge1tk5IRPznRyMe17qAXaDlI77SB3BOpRWzSIXgptPi/ri+cEjnlrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039432; c=relaxed/simple;
	bh=dYrtAsRbWJD7CMmunRxvqC1sQtm1EdHAuEkfEDRb+xE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G1dKZcW38pHb5xkbSrP0nctsalQXknAJ/4mUcAdc5lnt34lqEBOCcTCqB0DG0GoOxK2VeuA/VllqGU8vrVL2yP55Y7/SBnh2/IUxF9Cmul41y4upvpvGEiXbJKjgdvPt6z4Mj6AEDUIi7aVU1T9WPDdP3sfkf0fElKeJNnmDa8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bC60Q6NdBz10Wct;
	Wed,  4 Jun 2025 20:12:38 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id D39C91400C8;
	Wed,  4 Jun 2025 20:17:06 +0800 (CST)
Received: from [10.67.112.40] (10.67.112.40) by dggpemf200006.china.huawei.com
 (7.185.36.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Jun
 2025 20:17:06 +0800
Message-ID: <f69c29a4-ee31-49b3-9430-62c1f752e72b@huawei.com>
Date: Wed, 4 Jun 2025 20:16:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] mm,slub: Do not special case N_NORMAL nodes for
 slab_nodes
To: Oscar Salvador <osalvador@suse.de>, Andrew Morton
	<akpm@linux-foundation.org>
CC: David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Harry Yoo
	<harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>, Hyeonggon Yoo
	<42.hyeyoo@gmail.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
References: <20250603110850.192912-1-osalvador@suse.de>
 <20250603110850.192912-2-osalvador@suse.de>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <20250603110850.192912-2-osalvador@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf200006.china.huawei.com (7.185.36.61)

On 2025/6/3 19:08, Oscar Salvador wrote:
> Currently, slab_mem_going_going_callback() checks whether the node has

slab_mem_going_going_callback() might be a typo here.
I suppose slab_mem_going_online_callback() might be the correct one here.

> N_NORMAL memory in order to be set in slab_nodes.
> While it is true that gettind rid of that enforcing would mean
> ending up with movables nodes in slab_nodes, the memory waste that comes
> with that is negligible.
> 
> So stop checking for status_change_nid_normal and just use status_change_nid
> instead which works for both types of memory.
> 
> Also, once we allocate the kmem_cache_node cache  for the node in
                                                  ^^
seems like a minor nit, an extral space for the above.
