Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C128DF3A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749035362; cv=none; b=LqBsqRaho7yRz1zac0Fndj+Ik085izS6y9RkKW2CF8R1MxPkPhhadQN8szonVD3aHfIgZARQuyCGt8Xd4uo3BFpueF4I7EeKHHLgUvkhJGc4pe3FDGFZA9SmvczwZ9TgMUBIDIJZ6Jh3EeZuhi41yrInTJDPgSTEDZMm0pCYObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749035362; c=relaxed/simple;
	bh=bxbzNNKPCagVAfsznDam2r9jaVbG7yC74u5DW2QcVFI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ViKqtbM+CU7c2d16hdIGuWDxSWWTd7TUm6wn4UGCCKJ8Ye3TArZcFtkviSI4EXZNC6jBI6PjybgMw9/WrdDUvglmnvRmUkiGLsHt+qJl9agBy1AUy8qcbCL8n2k9pwHtCdPcqUp2Kn9ntdDNpDV9koZ55T8gmzYLWfW1uNczNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d76ficgW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d76ficgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE364C4CEE7;
	Wed,  4 Jun 2025 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749035362;
	bh=bxbzNNKPCagVAfsznDam2r9jaVbG7yC74u5DW2QcVFI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=d76ficgWdxxqPKuMtBDUFhRi8MS/oyNrEUGQ34Bkafomm8+7djXA8UCvTJ2LHbod1
	 HIHzw2gV3/ck5nB472azG8/WGH6w4mn79IyRymk/W5YmOFWamKZLp1fihjvA1KTXYH
	 WcwnjFrboIPtRrVJZ7TM5RRQAwDSQESgOhL82Xgkp3gRQ/ZETm4AIL+Orxhd/TPK2F
	 l92pT2D7pErPMJ/itTOsIFInlaaE8dGa3oB8Tp/9jaOuFhyE+PovEuQfmC4SJ6DXGe
	 s1q86KCXJgqMQ8lmbQA6muM8AkU6fcXJdnlpzJuayDFjY5MX/7wz84TETngsmLCoAW
	 c/Kwmu4MeUTBg==
Message-ID: <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
Date: Wed, 4 Jun 2025 19:09:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, Hao_hao.Wang@unisoc.com, baocong.liu@unisoc.com
Subject: Re: [PATCH] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
 <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
 <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/4/25 18:49, Zhiguo Niu wrote:
> Chao Yu <chao@kernel.org> 于2025年6月4日周三 17:48写道：
>>
>> On 6/4/25 13:54, Zhiguo Niu wrote:
>>> The decompress_io_ctx may be released asynchronously after
>>> I/O completion. If this file is deleted immediately after read,
>>> and the kworker of processing post_read_wq has not been executed yet
>>> due to high workloads, It is possible that the inode(f2fs_inode_info)
>>> is evicted and freed before it is used f2fs_free_dic.
>>>
>>>     The UAF case as below:
>>>     Thread A                                      Thread B
>>>     - f2fs_decompress_end_io
>>>      - f2fs_put_dic
>>>       - queue_work
>>>         add free_dic work to post_read_wq
>>>                                                    - do_unlink
>>>                                                     - iput
>>>                                                      - evict
>>>                                                       - call_rcu
>>>     This file is deleted after read.
>>>
>>>     Thread C                                 kworker to process post_read_wq
>>>     - rcu_do_batch
>>>      - f2fs_free_inode
>>>       - kmem_cache_free
>>>      inode is freed by rcu
>>>                                              - process_scheduled_works
>>>                                               - f2fs_late_free_dic
>>>                                                - f2fs_free_dic
>>>                                                 - f2fs_release_decomp_mem
>>>                                       read (dic->inode)->i_compress_algorithm
>>>
>>> This patch increase inode->i_count before f2fs_free_dic and decrease it
>>> after free the dic.
>>>
>>> Cc: Daeho Jeong <daehojeong@google.com>
>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
>>> ---
>>>  fs/f2fs/compress.c | 19 ++++++++++++++-----
>>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index b3c1df9..6b3b3a7 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>>>  }
>>>
>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>> -             bool bypass_destroy_callback);
>>> +             bool bypass_destroy_callback, bool late_free);
>>>
>>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>  {
>>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>       return dic;
>>>
>>>  out_free:
>>> -     f2fs_free_dic(dic, true);
>>> +     f2fs_free_dic(dic, true, false);
>>>       return ERR_PTR(ret);
>>>  }
>>>
>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>> -             bool bypass_destroy_callback)
>>> +             bool bypass_destroy_callback, bool late_free)
>>>  {
>>>       int i;
>>>
>>> @@ -1775,6 +1775,11 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>       }
>>>
>>>       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
>>> +     if (late_free) {
>>> +             spin_lock(&dic->inode->i_lock);
>>> +             atomic_dec(&dic->inode->i_count);
>>> +             spin_unlock(&dic->inode->i_lock);
>>
>> If it is the last one release i_count, it needs to call iput_final to evict inode
>> like what iput did, so we'd better to call iput() here?
> Hi Chao,
> Yes, we have also tested this method(iput/__iget), and it worked.
> Just think It is simpler and easier to read to directly operate
> i_count, and then free it
> by relying on the memory module when i_count=0.
> But It seems iput/__iget is better.
>>
>>> +     }
>>>       kmem_cache_free(dic_entry_slab, dic);
>>>  }
>>>
>>> @@ -1783,16 +1788,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
>>>       struct decompress_io_ctx *dic =
>>>               container_of(work, struct decompress_io_ctx, free_work);
>>>
>>> -     f2fs_free_dic(dic, false);
>>> +     f2fs_free_dic(dic, false, true);
>>>  }
>>>
>>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>>>  {
>>>       if (refcount_dec_and_test(&dic->refcnt)) {
>>>               if (in_task) {
>>> -                     f2fs_free_dic(dic, false);
>>> +                     f2fs_free_dic(dic, false, false);
>>>               } else {
>>>                       INIT_WORK(&dic->free_work, f2fs_late_free_dic);
>>> +                     /* to avoid inode is evicted simultaneously */
>>> +                     spin_lock(&dic->inode->i_lock);
>>> +                     atomic_inc(&dic->inode->i_count);
>>> +                     spin_unlock(&dic->inode->i_lock);
>>
>> iget()?
>>
>> BTW, can we store i_compress_algorithm in dic to avoid inode access?
> 
> Also thought of this method, but it would require more changes.
> dic->inode used in f2fs_free_dic are all needed to modify except
> i_compress_algorithm.
> such as  page_array_free(dic->inode),

Zhiguo,

page_array_free() parses dic->inode to get sbi only, so we can pass sbi to
page_array_free() directly to avoid using dic->inode.

> allow_memalloc_for_decomp(F2FS_I_SB(dic->inode)).
> 
> Do you have any other suggestions?

Using iget/iput looks fine to me, please go ahead.

Thanks,

> thanks！
> 
>>
>> Thanks,
>>
>>>                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>>>                                       &dic->free_work);
>>>               }
>>

