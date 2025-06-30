Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3180239085
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282619; cv=none; b=KLtwgvmvPx+BAB++3zWvXhqLUGmSFaGNzGJ0uEO8Q90Tg8+qq2tB7fdF4dW44Xre1X1GXN4WJ5b6AK+TPrSPX1t5DNtG9/fBHw05DSWNroxRiZfiskP7gMJ9gvzv31cFt0ClEFFfVMR2TRJy6DTIqrFXIYiBF28o9FiGuLlsA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282619; c=relaxed/simple;
	bh=eIyGibA3WhDzpbD4k83AszZ34Ef22vkBau2lXTTzUz4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ISnwwq8ZBL4WUcgTOyzUq3zrNrCFtPsJbhH8gbJmfCbhGJkc1tgHweLokVJ5L01vXsxs6+TTqesFUXnkxHYRbD9jQWveXwldMC+XG7QIAS8UtwTkQRPPYISGgW+kAZObxLFXseRBTYP5Ky3Aejj9hnWe4V1TBFzuX2qXXCnHHRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0+lgex9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0+lgex9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB75C4CEE3;
	Mon, 30 Jun 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751282619;
	bh=eIyGibA3WhDzpbD4k83AszZ34Ef22vkBau2lXTTzUz4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=b0+lgex9/t5/yGbNNdMnNrBknIzVQCNqB6w08MPYMvkSHgDPhxRPPVqLPTaj3g0fd
	 gm8vmF6O31N2YDapT09NpWD6H1EDVfYb2B8+g7bVgggdYXpOVBHJTHJw1VVA11muY3
	 OqcT0K3ut+otQbaBNgnP3F0xd/fBYijn5m7mUkIGo7Irj7gI+7ykgAqj87yChrn1VQ
	 AD39npnXdrk6nl1RYg5RjLozyy5NE7kdh/BCaXddFs4KXnK0PDyVhQO86525645uYJ
	 66Z2WbCiBgeCWdZ9WynUK6G9Cktf9/vK9Nq0lepVs0OJJXrLUSeg7bzM5QT2Luf1MA
	 U4itA2ClkARzA==
Message-ID: <18cd79ac-b7c6-4d7c-a322-d98c194656ee@kernel.org>
Date: Mon, 30 Jun 2025 19:23:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, =?UTF-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?55ub5YuH?= <shengyong1@xiaomi.com>
Subject: Re: [External Mail]Re: [PATCH v3] f2fs: avoid splitting bio when
 reading multiple pages
To: Huang Jianan <huangjianan@xiaomi.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250625064927.516586-1-huangjianan@xiaomi.com>
 <d2ac0da9-3d47-4269-a7b0-a18719c64346@kernel.org>
 <e58344ef-0544-41f3-be07-1f1478912469@xiaomi.com>
 <b76e5aaa-edb2-4a4d-a6a8-72f6e975f398@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <b76e5aaa-edb2-4a4d-a6a8-72f6e975f398@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/25/25 17:50, Huang Jianan wrote:
> On 2025/6/25 17:48, Jianan Huang wrote:
>> On 2025/6/25 16:45, Chao Yu wrote:
>>>
>>> On 6/25/25 14:49, Jianan Huang wrote:
>>>> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
>>>> to the nr_vecs limit, the compressed pages will be split into multiple
>>>> bios and then merged at the block level. In this case, nr_cpages should
>>>> be used to pre-allocate bvecs.
>>>> To handle this case, align max_nr_pages to cluster_size, which should be
>>>> enough for all compressed pages.
>>>>
>>>> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
>>>> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
>>>> ---
>>>> Changes since v2:
>>>> - Initialize index only for compressed files.
>>>> Changes since v1:
>>>> - Use aligned nr_pages instead of nr_cpages to pre-allocate bvecs.
>>>>
>>>>   fs/f2fs/data.c | 12 ++++++++++--
>>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 31e892842625..d071d9f6a811 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -2303,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx 
>>>> *cc, struct bio **bio_ret,
>>>>                }
>>>>
>>>>                if (!bio) {
>>>> -                     bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
>>>> +                     bio = f2fs_grab_read_bio(inode, blkaddr, 
>>>> nr_pages - i,
>>>
>>> Jianan,
>>>
>>> Another case:
>>>
>>> read page #0,1,2,3 from block #1000,1001,1002, cluster_size=4.
>>>
>>> nr_pages=4
>>> max_nr_pages=round_up(0+4,4)-round_down(0,4)=4
>>>
>>> f2fs_mpage_readpages() calls f2fs_read_multi_pages() when nr_pages=1, at
>>> that time, max_nr_pages equals to 1 as well.
>>>
>>> f2fs_grab_read_bio(..., 1 - 0,...) allocate bio w/ 1 vec capacity, 
>>> however,
>>> we need at least 3 vecs to merge all cpages, right?
>>>
>>
>> Hi, chao,
>>
>> If we don't align nr_pages, then when entering f2fs_read_multi_pages,
>> we have nr_pages pages left, which belong to other clusters.
>> If this is the last page, we can simply pass nr_pages = 0.
>>
>> When allocating bio, we need:
>> 1. The cpages remaining in the current cluster, which should be 
>> (nr_capges - i).
>> 2. The maximum cpages remaining in other clusters, which should be 
>> max(nr_pages, cc->nr_cpages).
>>
> 
> align(nr_pages, cc->nr_cpages), sorry for this.
> 
>> So (nr_capges - i) + max(nr_pages, nr_cpages), should be enough for all 
>> vecs?

Jianan,

What about getting rid of below change? and just passing max_nr_pages to
f2fs_read_multi_pages? Maybe there is a little bit waste for bio vector space,
but it will be more safe to reserve enough margin.

+	for (; nr_pages; nr_pages--, max_nr_pages--) {

Thanks,

>>
>> Thanks,
>>
>>
>>> Thanks,
>>>
>>>>                                        f2fs_ra_op_flags(rac),
>>>>                                        folio->index, for_write);
>>>>                        if (IS_ERR(bio)) {
>>>> @@ -2376,6 +2376,14 @@ static int f2fs_mpage_readpages(struct inode 
>>>> *inode,
>>>>        unsigned max_nr_pages = nr_pages;
>>>>        int ret = 0;
>>>>
>>>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>>>> +     if (f2fs_compressed_file(inode)) {
>>>> +             index = rac ? readahead_index(rac) : folio->index;
>>>> +             max_nr_pages = round_up(index + nr_pages, 
>>>> cc.cluster_size) -
>>>> +                             round_down(index, cc.cluster_size);
>>>> +     }
>>>> +#endif
>>>> +
>>>>        map.m_pblk = 0;
>>>>        map.m_lblk = 0;
>>>>        map.m_len = 0;
>>>> @@ -2385,7 +2393,7 @@ static int f2fs_mpage_readpages(struct inode 
>>>> *inode,
>>>>        map.m_seg_type = NO_CHECK_TYPE;
>>>>        map.m_may_create = false;
>>>>
>>>> -     for (; nr_pages; nr_pages--) {
>>>> +     for (; nr_pages; nr_pages--, max_nr_pages--) {
>>>>                if (rac) {
>>>>                        folio = readahead_folio(rac);
>>>>                        prefetchw(&folio->flags);
>>>
>>
> 

