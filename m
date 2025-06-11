Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB62239E7A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630441; cv=none; b=EkRjb2JlQ/rBMYsu9OuBnYD7+h6OXIyaMAAwasEz/LgFR3X3PJ/0WHXMgvoRCPSAr4FBZ8xvs8JFSlrFJQbYE9YnC4Rw+xhcmFSqtCeyY/cp3fXPLMnZfemUkb9aAjPqBVZaJSSL4iz7Ne0McoquxAwomEhUFAFpkqukn4QIrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630441; c=relaxed/simple;
	bh=cXBcc4DFeB3u6bWeQjyVwLvEQbIklU3qqZHgiK6etyU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=HANrywyACv0jojV/jLMsA1i8P/w71imUejUMxGATfSNZb25XdAZT8xniK7qrOKgFB864DLaxYmYcP9sSEqyKYL4lfo1VpeyYNVcxJA4+HTdQO7M0M38ytRbNNQN/JRkY1Wx04eAQX9Zb8Z2TxwWnI7Q2R6ycs2lDXAEQQ2tTp1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4bHJg90zq2zKHMXJ
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:27:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 7B53B1A13AF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:27:15 +0800 (CST)
Received: from [10.174.99.169] (unknown [10.174.99.169])
	by APP2 (Coremail) with SMTP id Syh0CgBXYGPhPUloYQ41PA--.27979S2;
	Wed, 11 Jun 2025 16:27:15 +0800 (CST)
Subject: Re: [PATCH 3/4] mm: swap: fix potensial buffer overflow in
 setup_clusters()
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, bhe@redhat.com, hannes@cmpxchg.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250522122554.12209-1-shikemeng@huaweicloud.com>
 <20250522122554.12209-4-shikemeng@huaweicloud.com>
 <CAMgjq7BHzid81f2cBDwQqN6enfJOh8XLjzOS6e+kiu6TMuu0ZA@mail.gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <b2d54e47-a0a2-eba8-561a-01f3ca35c71e@huaweicloud.com>
Date: Wed, 11 Jun 2025 16:27:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMgjq7BHzid81f2cBDwQqN6enfJOh8XLjzOS6e+kiu6TMuu0ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgBXYGPhPUloYQ41PA--.27979S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1rtF4xtw43Ar47Aw47urg_yoW8Cw4DpF
	1rKas8CF4DJryqkw17Za1DCry3GrnYka9rKa4fJ34akF98WrWIgFy8Kr1Ykr1DKwn5Aryv
	9F4DW34Uu3ZYv37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AF
	wI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU7I
	JmUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 5/26/2025 2:44 AM, Kairui Song wrote:
> On Thu, May 22, 2025 at 11:32 AM Kemeng Shi <shikemeng@huaweicloud.com> wrote:
>>
>> In setup_swap_map(), we only ensure badpages are in range (0, last_page].
>> As maxpages might be < last_page, setup_clusters() will encounter a
>> buffer overflow when a badpage is >= maxpages.
>> Only call inc_cluster_info_page() for badpage which is < maxpages to
>> fix the issue.
>>
>> Fixes: b843786b0bd01 ("mm: swapfile: fix SSD detection with swapfile on btrfs")
>> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
>> ---
>>  mm/swapfile.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index a82f4ebefca3..63ab9f14b2c6 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -3208,9 +3208,13 @@ static struct swap_cluster_info *setup_clusters(struct swap_info_struct *si,
>>          * and the EOF part of the last cluster.
>>          */
>>         inc_cluster_info_page(si, cluster_info, 0);
>> -       for (i = 0; i < swap_header->info.nr_badpages; i++)
>> -               inc_cluster_info_page(si, cluster_info,
>> -                                     swap_header->info.badpages[i]);
>> +       for (i = 0; i < swap_header->info.nr_badpages; i++) {
>> +               unsigned int page_nr = swap_header->info.badpages[i];
>> +
>> +               if (page_nr >= maxpages)
>> +                       continue;
>> +               inc_cluster_info_page(si, cluster_info, page_nr);
> 
> I think we might need a pr_err or pr_warn here, this means mkswap
> marked the wrong region as a bad block? Or some fs side things went
> wrong.
As Baoquan metioned that there is already warning in read_swap_header().
Besides, I think last_page in swap_header already indicates the range
which is acceptable to fs and we only need to explicitly handle page_nr
which is > last_page.
> 
> 
>> +       }
>>         for (i = maxpages; i < round_up(maxpages, SWAPFILE_CLUSTER); i++)
>>                 inc_cluster_info_page(si, cluster_info, i);
>>
>> --
>> 2.30.0
>>
>>
> 

