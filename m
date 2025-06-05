Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D3442C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094298; cv=none; b=imbpQ6CVEgtcMsCL7bFg91zTqPFZfPRPHYrUhdChSfUoKcGADMJwTy+6g6g4vNTyn1xDM2stJC6peQQxrgGidA/FZlPCINjfDH4R3pshjy4h/A5FgVPfGJvLEuzUi3lbIZ6l3c7R3qTeLAhK33ZAYjtqjjqmb8YyN1V/P6C1xYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094298; c=relaxed/simple;
	bh=zD9KLdlxoxnlel0R+Dkuhh1beMBQe4Pg1pYX12Fw11w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fig8b4HHtIkjsjOxJmAusxOnxpn6kNqerI1sXj9sZ7c7fscZjmf0UZ6UfGUjb0kJGX6aMqGpqxVq5vo7EfsXjI6O+2RHP2nUB0ddjLMxI2dEEweLtRBo2GdtYFwl+vfEpwshYjqT5dre3y8dSzwbWBWochx0f4O7BrSkznmT3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0mNAood; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0mNAood"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058F1C4CEEB;
	Thu,  5 Jun 2025 03:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749094298;
	bh=zD9KLdlxoxnlel0R+Dkuhh1beMBQe4Pg1pYX12Fw11w=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=N0mNAoodH8TxwIffoYAp4amYWbVnUShMldcW4shFI9Q/GpK8mGqNUXUYAktsr4ENm
	 r1JuvnXsClo3jrA+Ytf96oIb9pwpDI3IBMQHKeWUZDKwMfnBmWMvEr2roh/G8XlE+z
	 p2D1ae2GUomPL+GMpSywOWft13FqwUqVs2wKOUIMH0yPghuaEa6hszSQaA0wNSLYnI
	 rYyhSUdgkrlgCOm4WcDIMy8QdsslayX00qr+oKJfLkojas6Uceey8+8aKRwhMsUuGZ
	 53D1yxHwsKlqY5hy+NBVMnR6XV7SrBDmHAjNL+cCGYRlD5NEQwldkdOLu9CMRznpRU
	 UHEflhRf82O5g==
Message-ID: <2a387dd6-9c10-478d-aae2-8284ad395944@kernel.org>
Date: Thu, 5 Jun 2025 11:31:33 +0800
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
Subject: Re: [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in
 f2fs_free_dic
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
 <76adf905-191d-4415-a584-a79bc502bb87@kernel.org>
 <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+ygYG=9ZnPY15=L9AwGr9b5_2PkMwT8AXOyE68v6Hg3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/5/25 10:44, Zhiguo Niu wrote:
> Chao Yu <chao@kernel.org> 于2025年6月5日周四 10:23写道：
>>
>> On 6/4/25 19:37, Zhiguo Niu wrote:
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
>>> This patch use __iget before f2fs_free_dic and iput after free the dic.
>>>
>>> Cc: Daeho Jeong <daehojeong@google.com>
>>> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
>>> ---
>>> v2: use __iget/iput function
>>> ---
>>>  fs/f2fs/compress.c | 16 +++++++++++-----
>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index b3c1df9..3f0c18d 100644
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
>>> @@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
>>>       }
>>>
>>>       page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
>>> +     if (late_free)
>>> +             iput(dic->inode);
>>>       kmem_cache_free(dic_entry_slab, dic);
>>>  }
>>>
>>> @@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
>>> +                     __iget(dic->inode);
>>> +                     spin_unlock(&dic->inode->i_lock);
>>
>> Oh, how about using igrab() instead?
> Hi Chao,
> after I check igrab, I think it is ok,
> but here We don't need care about igarb's return value, right?

I guess "return NULL" should be impossible case, but still we can add
f2fs_bug_on() to detect any potential bug, right?

Thanks,

> Thanks!
> 
>>
>>>                       queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
>>>                                       &dic->free_work);
>>>               }
>>

