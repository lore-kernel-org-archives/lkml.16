Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D861AAC9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749624442; cv=none; b=PawQH1pWZKJ6xFavniazScy3V56Zla/daR9bCso460FL+weHGKkgdj0PtAFKsdQ+Lep+hUOaRHoDaHl/xIVR8352hI6KtVMiNzwwszcBYNduiFNKTvUSCzB42JtPORrzGjKLNioGVapjbzmD+cifvr8b6MroRPy65JZ8EB+2JQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749624442; c=relaxed/simple;
	bh=Y7drl0N8DpxbEGHn/GNhO4IXTOkaEABM7Sc5vcplQJc=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EYuyOaHKHk6K1x+8IP0oiiC9fxgCp6eHqp8XEodsT/+PY6hLDgj6dZB7d9wuxcgqWpZ1fLiDkYOoLlgP5tzxCgytRie3rgmP8iaabQ82WU8YhClatO4CKYwHGBMAZjdAwHsPJ1PgOrvP3rbsTAn+Ob3hDiuuSMbtwsH0+0WHpek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmpf0N/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmpf0N/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1645C4CEEE;
	Wed, 11 Jun 2025 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749624440;
	bh=Y7drl0N8DpxbEGHn/GNhO4IXTOkaEABM7Sc5vcplQJc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Mmpf0N/jNItTtSVV77cphUJ/VJl9iiHKOY9t1mlUoEpfBGhZ6qc2f1NcxprXCXQWH
	 Uxitl070VC7uObSKvmZD/AEOEHLnpJVjplpq1CqzRlf0/chl9ubs0lWxp47D1Cyzss
	 ly/OcVZJOM8yLN8Y15Aqxx0qNCNxFRgp+4jXSghZybMS1JaT8F7cFTbEaOtrPAXuUT
	 eBZsA7/MdZop6TmaK9MlMik7tWMVU1l3u2hYdc4Eyp6yGowi2dCv6dunvNKm3CvNF+
	 xVqfhi4CZqqc3zPM96F7u4uxc2ExkGc6KNkiixQH5hnyAeQ5RztRYEn35r+WVRT4S1
	 Fja9ZOqLe1IBw==
Message-ID: <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
Date: Wed, 11 Jun 2025 14:47:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com,
 baocong.liu@unisoc.com
Subject: Re: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
 <aEhYfYrknbNzT8Or@google.com>
 <5c1da066-0c76-42f4-8c46-a99f60a900bf@kernel.org>
 <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3LNrSRT8hfbr=x5HvkQRGBSTpftPbd7NrfUdO-2LgSLfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/11/25 14:41, Zhiguo Niu wrote:
> Chao Yu <chao@kernel.org> 于2025年6月11日周三 14:07写道：
>>
>> On 6/11/25 00:08, Jaegeuk Kim wrote:
>>> Hi Zhiguo,
>>>
>>> This patch causes CPU hang when running fsstress on compressed/non-compressed
>>> files. Please check.
>>
>> Oh, seems it may cause below deadlock:
>>
>> CPU0
>> process A
>> - spin_lock(i_lock)
>> software IRQ
>> - end_io
>>  - igrab
>>   - spin_lock(i_lock)
>>
>> Thanks,
> Hi Chao,
> Thanks for pointing this out.
> I have tested this patch locally about some basic cases before submission.
> So it seems that should use the following method  to solve this problem?
> " store i_compress_algorithm/sbi in dic to avoid inode access?"

Zhiguo,

Yeah, I guess so.

Thanks,

> thanks！
> 
> 
>>
>>>
>>> On 06/05, Zhiguo Niu wrote:
>>>> The decompress_io_ctx may be released asynchronously after
>>>> I/O completion. If this file is deleted immediately after read,
>>>> and the kworker of processing post_read_wq has not been executed yet
>>>> due to high workloads, It is possible that the inode(f2fs_inode_info)
>>>> is evicted and freed before it is used f2fs_free_dic.
>>>>
>>>>     The UAF case as below:
>>>>     Thread A                                      Thread B
>>>>     - f2fs_decompress_end_io
>>>>      - f2fs_put_dic
>>>>       - queue_work
>>>>         add free_dic work to post_read_wq
>>>>                                                    - do_unlink
>>>>                                                     - iput
>>>>                                                      - evict
>>>>                                                       - call_rcu
>>>>     This file is deleted after read.
>>>>
>>>>     Thread C                                 kworker to process post_read_wq
>>>>     - rcu_do_batch
>>>>      - f2fs_free_inode
>>>>       - kmem_cache_free
>>>>      inode is freed by rcu
>>>>                                              - process_scheduled_works
>>>>                                               - f2fs_late_free_dic
>>>>                                                - f2fs_free_dic
>>>>                                                 - f2fs_release_decomp_mem
>>>>                                       read (dic->inode)->i_compress_algorithm
>>>>
>>>> This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
>>>> action is done by kworker.
>>>>
>>>> Cc: Daeho Jeong <daehojeong@google.com>
>>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
>>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
>>>> ---
>>>> v3: use igrab to replace __iget
>>>> v2: use __iget/iput function
>>>> ---
>>>>  fs/f2fs/compress.c | 14 +++++++++-----
>>>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>> index b3c1df9..729ad16 100644
>>>> --- a/fs/f2fs/compress.c
>>>> +++ b/fs/f2fs/compress.c
>>>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>>>>  }
>>>>
>>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>> -            bool bypass_destroy_callback);
>>>> +            bool bypass_destroy_callback, bool late_free);
>>>>
>>>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>>  {
>>>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>>      return dic;
>>>>
>>>>  out_free:
>>>> -    f2fs_free_dic(dic, true);
>>>> +    f2fs_free_dic(dic, true, false);
>>>>      return ERR_PTR(ret);
>>>>  }
>>>>
>>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>> -            bool bypass_destroy_callback)
>>>> +            bool bypass_destroy_callback, bool late_free)
>>>>  {
>>>>      int i;
>>>>
>>>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>>      }
>>>>
>>>>      page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
>>>> +    if (late_free)
>>>> +            iput(dic->inode);
>>>>      kmem_cache_free(dic_entry_slab, dic);
>>>>  }
>>>>
>>>> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
>>>>      struct decompress_io_ctx *dic =
>>>>              container_of(work, struct decompress_io_ctx, free_work);
>>>>
>>>> -    f2fs_free_dic(dic, false);
>>>> +    f2fs_free_dic(dic, false, true);
>>>>  }
>>>>
>>>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>>>>  {
>>>>      if (refcount_dec_and_test(&dic->refcnt)) {
>>>>              if (in_task) {
>>>> -                    f2fs_free_dic(dic, false);
>>>> +                    f2fs_free_dic(dic, false, false);
>>>>              } else {
>>>>                      INIT_WORK(&dic->free_work, f2fs_late_free_dic);
>>>> +                    /* use igrab to avoid inode is evicted simultaneously */
>>>> +                    f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
>>>>                      queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>>>>                                      &dic->free_work);
>>>>              }
>>>> --
>>>> 1.9.1
>>

