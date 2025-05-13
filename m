Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12633FBA7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747104296; cv=none; b=NfJ/Nuh/XCk0l7gjDGA3FnqmW2O1edqFy+KqRGQ9DJKQaB8oIG6i6unVSO7gTj1wRKozQpZhjapkARDL5eZybG2MB88bw4QaWxn6vqFldqh3jtYa+BJ/Xwga+Y3lrIq+okP5eOS8M/Lf7nnmUc5rrFjy9PHxEcZoQbcMFetwH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747104296; c=relaxed/simple;
	bh=ZFGIyXGw5+qmgsPzz6aL54r77OiRi4cTKJhtA4ObtoA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BH4YOq+AbYduQ4mYGyz0uj2kIyZ4RgheyW81UnvMmPqFC1C6OsVU7vvgnEARh8K8xDZkH6lSEz1VQguAFth4qV3q0+v/Bnl8trEP+0Fg4Zdz5KjXqC2kkMULNKgU/9G7YwyB1o+3aM8h18+epTpWP2D5GSRDhEZnkSu6iWvoEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyuD4GNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyuD4GNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593CCC4CEE7;
	Tue, 13 May 2025 02:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747104296;
	bh=ZFGIyXGw5+qmgsPzz6aL54r77OiRi4cTKJhtA4ObtoA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=JyuD4GNN0s1sVLGX/wrJ9d85HO97sl7TDj+Bt3bjdv3qyUzSFPEOe362EyGYzh2Pw
	 ixj1B+WjimwEmtFpfuiAFyb9XlRafRof9bq6jD1u44kQ8nlCuvipFxi6fR+hYh7pRH
	 e2jfoPQwv7zs7uIpfE4NufVj6j5v7BhDYBkok7WgYH2WsS8hHkBKDONSGGpGSFdccQ
	 xqTlgIgpDR42eW9RJQTqiFlETVQ6Opn/6sGGfQZvRfC418WI2aRpqKhyFoPZf1isKS
	 djWuQSsTcDy83taRLCzXL8RlEMtuEK3glapxcsB/AxOhSjQgxHVfY6vV2ajLDGjm/k
	 hMv97v8/hFqxg==
Message-ID: <2a6bb772-901a-4054-80fa-7ff7cb118944@kernel.org>
Date: Tue, 13 May 2025 10:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] f2fs: add f2fs_bug_on() to detect potential bug
To: Jaegeuk Kim <jaegeuk@kernel.org>, g@google.com
References: <20250512115442.2640895-1-chao@kernel.org>
 <aCITHczkYs49uBSc@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <aCITHczkYs49uBSc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 23:26, Jaegeuk Kim wrote:
> On 05/12, Chao Yu wrote:
>> Add f2fs_bug_on() to check whether memory preallocation will fail or
>> not after radix_tree_preload(GFP_NOFS | __GFP_NOFAIL).
> 
> Are we getting a bug?

No, I'm worried about potential issue from add_free_nid() can cause
node footer corruption issue, so I want to use f2fs_bug_on() to check
whether there is caused by any bug from MM from now on.

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/checkpoint.c | 4 +++-
>>  fs/f2fs/node.c       | 7 +++++--
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index e7907858eb70..3f223bade520 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -504,6 +504,7 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>>  {
>>  	struct inode_management *im = &sbi->im[type];
>>  	struct ino_entry *e = NULL, *new = NULL;
>> +	int ret;
>>  
>>  	if (type == FLUSH_INO) {
>>  		rcu_read_lock();
>> @@ -516,7 +517,8 @@ static void __add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino,
>>  		new = f2fs_kmem_cache_alloc(ino_entry_slab,
>>  						GFP_NOFS, true, NULL);
>>  
>> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	ret = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	f2fs_bug_on(sbi, ret);
>>  
>>  	spin_lock(&im->ino_lock);
>>  	e = radix_tree_lookup(&im->ino_root, ino);
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 3f6b8037d25f..88d3032236cb 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2309,7 +2309,7 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>  	struct free_nid *i, *e;
>>  	struct nat_entry *ne;
>> -	int err = -EINVAL;
>> +	int err;
>>  	bool ret = false;
>>  
>>  	/* 0 nid should not be used */
>> @@ -2323,7 +2323,10 @@ static bool add_free_nid(struct f2fs_sb_info *sbi,
>>  	i->nid = nid;
>>  	i->state = FREE_NID;
>>  
>> -	radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	err = radix_tree_preload(GFP_NOFS | __GFP_NOFAIL);
>> +	f2fs_bug_on(sbi, err);
>> +
>> +	err = -EINVAL;
>>  
>>  	spin_lock(&nm_i->nid_list_lock);
>>  
>> -- 
>> 2.49.0

