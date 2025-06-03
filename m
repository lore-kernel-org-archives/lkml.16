Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF033211
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913484; cv=none; b=jftAp38EMOYaOWXCLKseiQkWXEhfCuSX5KIwXMEVgWvQ6DZrxnSCBYl8Cnxr4Y9wkfjg0iFtHCkdp3vV01RsObNlqV9SexPJ8yzNaBrtmBLMpqWJa4flAY6lovCL39UVrmDpKZROph9cuxZ+8nR1xEapYe5TzyqSTG7Y76+agCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913484; c=relaxed/simple;
	bh=rrX0DJqkZjUhX3eOhvumqsMmg25jIm3f+Hwnd4A64PU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=IjWwo4dwMEqE2Ph9v2in1OQ3vOIlaDwWi7VdPmTWsoTLrp3mkabONusB51WCPvx6T2rZJ6/LkpwKt3LVgFh3qmgi7G+Sdnnj+eijyZSdCLzAS6Qaaa9pZircy9QXW1phTNEved9+q2jaSJub5GhFvjB1rSRj2epEeQpDkgh9J6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bBCWP49JYzYQvDK
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:17:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id A2E331A0F7E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:17:52 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP2 (Coremail) with SMTP id Syh0CgDX4WQ+TT5omVrgOA--.1798S2;
	Tue, 03 Jun 2025 09:17:52 +0800 (CST)
Subject: Re: [RFC PATCH] MAINTAINERS: add mm swap section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Yu Zhao <yuzhao@google.com>, Kairui Song <kasong@tencent.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <0599e483-fe41-f8b4-ace4-d570ba10c9d5@huaweicloud.com>
Date: Tue, 3 Jun 2025 09:17:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250602152015.54366-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:Syh0CgDX4WQ+TT5omVrgOA--.1798S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1fKrW8Aw1xXF45Jw4DCFg_yoW8Zr47pF
	4kGrn5Crs7JryIyr1Sga4Iyw1rursYkr1UXFZrCw18AF9FqrnIv3WkKF15CFWDCr1SkrW5
	X3y2g348Ww4jvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYx
	BIdaVFxhVjvjDU0xZFpf9x07UAwIDUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 6/2/2025 11:20 PM, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for
> mm files - establish a swap memory management section and add relevant
> maintainers/reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE:
> 
> I have taken a look at recent work on the swap and chosen a list of people
> who seem to be regular and recent contributors/reviewers.
> 
> Please let me know if I missed anybody, or if anybody doesn't wish to be
> added here.
> 
> I also realise we have a bunch of non-swap stuff living in some of these
> files - we will have to address this separately :)
> 
> Thanks!
> 
>  MAINTAINERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e66460861bdf..3386272f6bf4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15674,6 +15674,25 @@ S:	Maintained
>  F:	include/linux/secretmem.h
>  F:	mm/secretmem.c
> 
> +MEMORY MANAGEMENT - SWAP
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Yu Zhao <yuzhao@google.com>
> +R:	Kemeng Shi <shikemeng@huaweicloud.com>
> +R:	Kairui Song <kasong@tencent.com>
> +R:	Nhat Pham <nphamcs@gmail.com>
> +R:	Baoquan He <bhe@redhat.com>
> +R:	Barry Song <baohua@kernel.org>
> +R:	Chris Li <chrisl@kernel.org>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/swap.h
> +F:	include/linux/swapfile.h
> +F:	include/linux/swapops.h
> +F:	mm/swap.c
> +F:	mm/swap.h
> +F:	mm/swap_state.c
> +F:	mm/swapfile.c
> +
>  MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@redhat.com>
> --
> 2.49.0
> 
I'm happy to help review the swap code. Thanks!

Acked-by: Kemeng Shi <shikemeng@huaweicloud.com>

