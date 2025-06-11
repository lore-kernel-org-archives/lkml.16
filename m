Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB9025B676
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632367; cv=none; b=kum7zmJkjLSn8gvqPSPAKdMoh4gQaH5S5gOmsdr3mQ7sgCt43ulP08x1MehAKCmENmY6d0tzz1H6nvUPqlNfCK4HYFIs52MSpQ7fF/Xp5QwkDVYD/cOYaTEqtXdp+oeFf9TzLDDWguMK3ZUiBblgTVPFYVtME/zAUZfb6ks+VcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632367; c=relaxed/simple;
	bh=ue+31B2bG/IgKEzAtR1bURwIK+Rmq5NQ4YjRrVZ466s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mBgSU/GpP+Lm4irfoRTFoUQn+q8Zm0wM+375qpz4Vk7Px2dE72QmOuH4jr7PWDccpXqaSSmoTp4HQ1KYL8Pi6dWcCMDKD0zVsKM62F+jdFIpQ7yEwimSDmrOcWbQDn0wGSn2B/JNXwEKi4DdszImtXVZjCDCuc24TiS5HiAGpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFrw0z5Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFrw0z5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C84C4CEEE;
	Wed, 11 Jun 2025 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632367;
	bh=ue+31B2bG/IgKEzAtR1bURwIK+Rmq5NQ4YjRrVZ466s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AFrw0z5Q8pmOz+yeoK37AD5kqStvJnpFyGDBnPcuntaXQ36GHdQcv/5i0nt+BwztX
	 n+bWDRjGssYXXZzkcNRjhX5JH01C1X254U/HeYSM/OB9kDQNjua+sCU9W/mGVM1WEu
	 gQ8ag+2H7bVr2o15HRBGNpLmhtEHnVVf2rsAZlBrqO6NrmSRA/BNBbLph6NrFulvR4
	 DWv9RJ527bxuFb2DlygTIum3TWa8MnCdGEnQ986Dh9o4hh/SnNw37gcLiOzPJxOBSr
	 wLeFTaDuHbQyHvZaaW8sc50ba2zxWbreSVDMqyNh/qzuWROQ/W2WUXm449GM3oG/DH
	 zdpVg80f9n//A==
Message-ID: <cf109a88-170a-496d-9df3-d56663d2e32a@kernel.org>
Date: Wed, 11 Jun 2025 16:59:23 +0800
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
 <c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org>
 <CAHJ8P3+=LEbbj8bzh0N3HbPu=jVkRfkowbxqoT0PfCZtWbuRbg@mail.gmail.com>
 <CAHJ8P3Lah5o60wJTb-H6Dng6sSrs8gY9cuFyw_1zAOAGfZMd_Q@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3Lah5o60wJTb-H6Dng6sSrs8gY9cuFyw_1zAOAGfZMd_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/11/25 15:51, Zhiguo Niu wrote:
> Zhiguo Niu <niuzhiguo84@gmail.com> 于2025年6月11日周三 14:52写道：
>>
>> Chao Yu <chao@kernel.org> 于2025年6月11日周三 14:47写道：
>>>
>>> On 6/11/25 14:41, Zhiguo Niu wrote:
>>>> Chao Yu <chao@kernel.org> 于2025年6月11日周三 14:07写道：
>>>>>
>>>>> On 6/11/25 00:08, Jaegeuk Kim wrote:
>>>>>> Hi Zhiguo,
>>>>>>
>>>>>> This patch causes CPU hang when running fsstress on compressed/non-compressed
>>>>>> files. Please check.
>>>>>
>>>>> Oh, seems it may cause below deadlock:
>>>>>
>>>>> CPU0
>>>>> process A
>>>>> - spin_lock(i_lock)
>>>>> software IRQ
>>>>> - end_io
>>>>>  - igrab
>>>>>   - spin_lock(i_lock)
>>>>>
>>>>> Thanks,
>>>> Hi Chao,
>>>> Thanks for pointing this out.
>>>> I have tested this patch locally about some basic cases before submission.
>>>> So it seems that should use the following method  to solve this problem?
>>>> " store i_compress_algorithm/sbi in dic to avoid inode access?"
>>>
>>> Zhiguo,
>>>
>>> Yeah, I guess so.
>> Hi Chao,
>> OK, I will prepare it .
>> Thanks a lot.
>>>
>>> Thanks,
>>>
>>>> thanks！
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> On 06/05, Zhiguo Niu wrote:
>>>>>>> The decompress_io_ctx may be released asynchronously after
>>>>>>> I/O completion. If this file is deleted immediately after read,
>>>>>>> and the kworker of processing post_read_wq has not been executed yet
>>>>>>> due to high workloads, It is possible that the inode(f2fs_inode_info)
>>>>>>> is evicted and freed before it is used f2fs_free_dic.
>>>>>>>
>>>>>>>     The UAF case as below:
>>>>>>>     Thread A                                      Thread B
>>>>>>>     - f2fs_decompress_end_io
>>>>>>>      - f2fs_put_dic
>>>>>>>       - queue_work
>>>>>>>         add free_dic work to post_read_wq
>>>>>>>                                                    - do_unlink
>>>>>>>                                                     - iput
>>>>>>>                                                      - evict
>>>>>>>                                                       - call_rcu
>>>>>>>     This file is deleted after read.
>>>>>>>
>>>>>>>     Thread C                                 kworker to process post_read_wq
>>>>>>>     - rcu_do_batch
>>>>>>>      - f2fs_free_inode
>>>>>>>       - kmem_cache_free
>>>>>>>      inode is freed by rcu
>>>>>>>                                              - process_scheduled_works
>>>>>>>                                               - f2fs_late_free_dic
>>>>>>>                                                - f2fs_free_dic
>>>>>>>                                                 - f2fs_release_decomp_mem
>>>>>>>                                       read (dic->inode)->i_compress_algorithm
>>>>>>>
>>>>>>> This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
>>>>>>> action is done by kworker.
>>>>>>>
>>>>>>> Cc: Daeho Jeong <daehojeong@google.com>
>>>>>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
>>>>>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>>>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
>>>>>>> ---
>>>>>>> v3: use igrab to replace __iget
>>>>>>> v2: use __iget/iput function
>>>>>>> ---
>>>>>>>  fs/f2fs/compress.c | 14 +++++++++-----
>>>>>>>  1 file changed, 9 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>>>>> index b3c1df9..729ad16 100644
>>>>>>> --- a/fs/f2fs/compress.c
>>>>>>> +++ b/fs/f2fs/compress.c
>>>>>>> @@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>>>>>>>  }
>>>>>>>
>>>>>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>>>>> -            bool bypass_destroy_callback);
>>>>>>> +            bool bypass_destroy_callback, bool late_free);
>>>>>>>
>>>>>>>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>>>>>  {
>>>>>>> @@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
>>>>>>>      return dic;
>>>>>>>
>>>>>>>  out_free:
>>>>>>> -    f2fs_free_dic(dic, true);
>>>>>>> +    f2fs_free_dic(dic, true, false);
>>>>>>>      return ERR_PTR(ret);
>>>>>>>  }
>>>>>>>
>>>>>>>  static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>>>>> -            bool bypass_destroy_callback)
>>>>>>> +            bool bypass_destroy_callback, bool late_free)
>>>>>>>  {
>>>>>>>      int i;
>>>>>>>
>>>>>>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>>>>>      }
>>>>>>>
>>>>>>>      page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
>>>>>>> +    if (late_free)
>>>>>>> +            iput(dic->inode);
>>>>>>>      kmem_cache_free(dic_entry_slab, dic);
>>>>>>>  }
>>>>>>>
>>>>>>> @@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
>>>>>>>      struct decompress_io_ctx *dic =
>>>>>>>              container_of(work, struct decompress_io_ctx, free_work);
>>>>>>>
>>>>>>> -    f2fs_free_dic(dic, false);
>>>>>>> +    f2fs_free_dic(dic, false, true);
>>>>>>>  }
>>>>>>>
>>>>>>>  static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>>>>>>>  {
>>>>>>>      if (refcount_dec_and_test(&dic->refcnt)) {
>>>>>>>              if (in_task) {
>>>>>>> -                    f2fs_free_dic(dic, false);
>>>>>>> +                    f2fs_free_dic(dic, false, false);
>>>>>>>              } else {
>>>>>>>                      INIT_WORK(&dic->free_work, f2fs_late_free_dic);
>>>>>>> +                    /* use igrab to avoid inode is evicted simultaneously */
>>>>>>> +                    f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
>>>>>>>                      queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>>>>>>>                                      &dic->free_work);
>>>>>>>              }
>>>>>>> --
>>>>>>> 1.9.1
>>>>>
>>>
> 
> Hi Chao,
> 
> The patch is about as follows, because dic->sbi is used directly in
> f2fs_free_dic: page_array_free(dic->sbi, dic->tpages, dic->cluster_size);
> so there are two points I want to confirm:
> 1. As a corresponding, the first parameter (inode) of page_array_alloc
> is need to modify to sbi or not ?
> 2. As a corresponding, do we need to add the sbi field in compress_ctx
> so that page_array_alloc/free called
> in compress flow can use sbi directly?

Zhiguo, both 1) and 2) changes look fine to me.

Thanks,

> Thanks!
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index b3c1df9..897d8ae 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -34,9 +34,8 @@ static void *page_array_alloc(struct inode *inode, int nr)
>         return f2fs_kzalloc(sbi, size, GFP_NOFS);
>  }
> 
> -static void page_array_free(struct inode *inode, void *pages, int nr)
> +static void page_array_free(struct f2fs_sb_info *sbi, void *pages, int nr)
>  {
> -       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>         unsigned int size = sizeof(struct page *) * nr;
> 
>         if (!pages)
> @@ -155,7 +154,7 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
> 
>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
>  {
> -       page_array_free(cc->inode, cc->rpages, cc->cluster_size);
> +       page_array_free(F2FS_I_SB(cc->inode), cc->rpages, cc->cluster_size);
>         cc->rpages = NULL;
>         cc->nr_rpages = 0;
>         cc->nr_cpages = 0;
> @@ -716,7 +715,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
>                 if (cc->cpages[i])
>                         f2fs_compress_free_page(cc->cpages[i]);
>         }
> -       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
>         cc->cpages = NULL;
>  destroy_compress_ctx:
>         if (cops->destroy_compress_ctx)
> @@ -734,7 +733,7 @@ static void f2fs_release_decomp_mem(struct
> decompress_io_ctx *dic,
> 
>  void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
>  {
> -       struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
> +       struct f2fs_sb_info *sbi = dic->sbi;
>         struct f2fs_inode_info *fi = F2FS_I(dic->inode);
>         const struct f2fs_compress_ops *cops =
>                         f2fs_cops[fi->i_compress_algorithm];
> @@ -1442,13 +1441,13 @@ static int f2fs_write_compressed_pages(struct
> compress_ctx *cc,
>         spin_unlock(&fi->i_size_lock);
> 
>         f2fs_put_rpages(cc);
> -       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
>         cc->cpages = NULL;
>         f2fs_destroy_compress_ctx(cc, false);
>         return 0;
> 
>  out_destroy_crypt:
> -       page_array_free(cc->inode, cic->rpages, cc->cluster_size);
> +       page_array_free(F2FS_I_SB(cc->inode), cic->rpages, cc->cluster_size);
> 
>         for (--i; i >= 0; i--) {
>                 if (!cc->cpages[i])
> @@ -1469,7 +1468,7 @@ static int f2fs_write_compressed_pages(struct
> compress_ctx *cc,
>                 f2fs_compress_free_page(cc->cpages[i]);
>                 cc->cpages[i] = NULL;
>         }
> -       page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
> +       page_array_free(F2FS_I_SB(cc->inode), cc->cpages, cc->nr_cpages);
>         cc->cpages = NULL;
>         return -EAGAIN;
>  }
> @@ -1499,7 +1498,7 @@ void f2fs_compress_write_end_io(struct bio *bio,
> struct page *page)
>                 end_page_writeback(cic->rpages[i]);
>         }
> 
> -       page_array_free(cic->inode, cic->rpages, cic->nr_rpages);
> +       page_array_free(F2FS_I_SB(cic->inode), cic->rpages, cic->nr_rpages);
>         kmem_cache_free(cic_entry_slab, cic);
>  }
> 
> @@ -1637,7 +1636,7 @@ static int f2fs_prepare_decomp_mem(struct
> decompress_io_ctx *dic,
>                 f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
>         int i;
> 
> -       if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
> +       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
>                 return 0;
> 
>         dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
> @@ -1670,10 +1669,9 @@ static int f2fs_prepare_decomp_mem(struct
> decompress_io_ctx *dic,
>  static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
>                 bool bypass_destroy_callback, bool pre_alloc)
>  {
> -       const struct f2fs_compress_ops *cops =
> -               f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
> +       const struct f2fs_compress_ops *cops =
> f2fs_cops[dic->compress_algorithm];
> 
> -       if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
> +       if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
>                 return;
> 
>         if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
> @@ -1708,6 +1706,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct
> compress_ctx *cc)
> 
>         dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
>         dic->inode = cc->inode;
> +       dic->sbi = sbi;
> +       dic->compress_algorithm = F2FS_I(cc->inode)->i_compress_algorithm;
>         atomic_set(&dic->remaining_pages, cc->nr_cpages);
>         dic->cluster_idx = cc->cluster_idx;
>         dic->cluster_size = cc->cluster_size;
> @@ -1762,7 +1762,7 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>                                 continue;
>                         f2fs_compress_free_page(dic->tpages[i]);
>                 }
> -               page_array_free(dic->inode, dic->tpages, dic->cluster_size);
> +               page_array_free(dic->sbi, dic->tpages, dic->cluster_size);
>         }
> 
>         if (dic->cpages) {
> @@ -1771,10 +1771,10 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>                                 continue;
>                         f2fs_compress_free_page(dic->cpages[i]);
>                 }
> -               page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
> +               page_array_free(dic->sbi, dic->cpages, dic->nr_cpages);
>         }
> 
> -       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
> +       page_array_free(dic->sbi, dic->rpages, dic->nr_rpages);
>         kmem_cache_free(dic_entry_slab, dic);
>  }
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9333a22b..da2137e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1536,6 +1536,7 @@ struct compress_io_ctx {
>  struct decompress_io_ctx {
>         u32 magic;                      /* magic number to indicate
> page is compressed */
>         struct inode *inode;            /* inode the context belong to */
> +       struct f2fs_sb_info *sbi;       /* f2fs_sb_info pointer */
>         pgoff_t cluster_idx;            /* cluster index number */
>         unsigned int cluster_size;      /* page count in cluster */
>         unsigned int log_cluster_size;  /* log of cluster size */
> @@ -1576,6 +1577,7 @@ struct decompress_io_ctx {
> 
>         bool failed;                    /* IO error occurred before
> decompression? */
>         bool need_verity;               /* need fs-verity verification
> after decompression? */
> +       unsigned char compress_algorithm;       /* backup algorithm type */
>         void *private;                  /* payload buffer for
> specified decompression algorithm */
>         void *private2;                 /* extra payload buffer */
>         struct work_struct verity_work; /* work to verify the
> decompressed pages */

