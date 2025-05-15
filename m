Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B7801
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271402; cv=none; b=m+2spRI33rb8y7Oq31pJFt4TvcCQTNYGiO1HeAfDRYJCIDPb8TDAGm3YzaBszwcLmN+Ig1mVSgnI4+WQKkUQ97AGT9a8epAqQ+IW9gGYNt+tqc7UXiO7aohgh93LrgVfDpKn63okHX4HhQCeY+Gqz7pex6UUu2CLBKgBA4vhXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271402; c=relaxed/simple;
	bh=aDjA6Rzbza+c88Sx3+XCpBplINzeHkIDfLCQJ3ubBZU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hDc9/MJgVAu0maA03/PRfdrhWty2aAPAJIncsE3PNjVafflF923yYu09oAGtGU4JWC23mFLFv+x2p3uNxTY90p/FvuJURtl+/5QMMj5QEDlUw94j1SPfrH3XzU0XRF0SgLwuDykMxvGaie50DRCfEpCcViu6B1b+jWRedrYs7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4ZyXF20ytSzKHLy2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:09:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id BE6851A018D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:09:56 +0800 (CST)
Received: from [10.174.178.129] (unknown [10.174.178.129])
	by APP4 (Coremail) with SMTP id gCh0CgDHKF3kPiVoN_TCMQ--.32358S2;
	Thu, 15 May 2025 09:09:56 +0800 (CST)
Subject: Re: [PATCH 4/5] mm: shmem: keep inode in swaplist when failed to
 allocate swap entry in shmem_writepage()
To: Baolin Wang <baolin.wang@linux.alibaba.com>, hughd@google.com,
 akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250514165047.946884-1-shikemeng@huaweicloud.com>
 <20250514165047.946884-5-shikemeng@huaweicloud.com>
 <fe00c756-8c1c-4219-af16-8bb9f6300bbc@linux.alibaba.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <17224d95-edd8-d426-1110-1332e329f746@huaweicloud.com>
Date: Thu, 15 May 2025 09:09:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <fe00c756-8c1c-4219-af16-8bb9f6300bbc@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDHKF3kPiVoN_TCMQ--.32358S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr15uw1UJryDtFW8Kw4fAFb_yoW8GrWkpr
	WkJ3s8GFWrZry8Crs7Xw4v9ryFgw48tw4UGF4SkF18ZFnIqwnY9FyjqFy0gr93ZrZ7Xr1j
	qF1qgFnrZF4UtaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UtR6
	wUUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 5/14/2025 5:31 PM, Baolin Wang wrote:
> 
> 
> On 2025/5/15 00:50, Kemeng Shi wrote:
>> Even if we fail to allocate a swap entry, the inode might have previously
>> allocated entry and we might take inode containing swap entry off swaplist.
>> As a result, try_to_unuse() may enter a potential dead loop to repeatedly
>> look for inode and clean it's swap entry.
>> Address this by keeping inode in swaplist even if we fail to allocate
>> swap entry as it does not pose significant problem to keep inode without
>> swap entry in swaplist.
>>
>> Fixes: b487a2da3575b ("mm, swap: simplify folio swap allocation")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>   mm/shmem.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/mm/shmem.c b/mm/shmem.c
>> index 0fed94c2bc09..dfd2f730833c 100644
>> --- a/mm/shmem.c
>> +++ b/mm/shmem.c
>> @@ -1651,8 +1651,6 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
>>           BUG_ON(folio_mapped(folio));
>>           return swap_writepage(&folio->page, wbc);
>>       }
>> -
>> -    list_del_init(&info->swaplist);
> 
> If 'info->swapped' is 0, we can still remove it?
> 
Sure, both approaches are acceptable to me: either keep it in list unconditionlly as it was done in old
behavior, or remove it if it's info->swapped is 0.

