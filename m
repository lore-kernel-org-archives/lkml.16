Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E23C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749093368; cv=none; b=Jv0JDnQ9ZUSYTOojfkzbwC0rcWm2g4RvK1L/ElG/hP/ARkmvqru1JGdoZ8CPJyhIpYOfpHxNzSsb2YTIyqGgXaz50M6Y4WMYz7KN51EncUy4YH4wG8xcRnImWX45vMK38E5kXOQZ3QegdXV/Xd3J4DUrcWVHUjo5tOGrBb0n7pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749093368; c=relaxed/simple;
	bh=+CjIvXaGtuRDG6cMi1GJLC+GDWg0p4LsrvNVFq5f54E=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oX2RAevXuQ01JeuDRN2sRvryiMIvQNiEyKmjt4tMCjaNpxULI98UdV6xX6SP7gUxz7CsRlgFenQ3XgM+N7gWvUb+2fREnb/XnPCb873v43JGoJERtlpVHXxZpwbfSg2quj+ghhPYRcMREN0uB1oxOBC+//pze6ODCuQgbHtOpSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oz9dmKQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oz9dmKQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26854C4CEE4;
	Thu,  5 Jun 2025 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749093367;
	bh=+CjIvXaGtuRDG6cMi1GJLC+GDWg0p4LsrvNVFq5f54E=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=oz9dmKQdCZ2JokklxksMokEVVIIN+3StPWKGMbFe6is+ndKRT0hyol8Zm58cSHQyR
	 MExoEtTFHeftA/Ba+UTo5FdYeM2InM6TKAYYfWjzUMpYFiVFgej9sXnWprzSssW9Oy
	 ovSAAPCpwVZFRcZWO00vJ6IxfhZh0ynvzKCmyHji35L1EDX/VteuIC/rUrGVLLRs9V
	 EwLpLunn7y7OpgcfNyE/eGNMBurXbR5utPrKnS5SUZdahEeHxKmlZ2TScxYXBVrbAc
	 +s8/jEmwdP+YIdQirVcD7mRTerAdsgTMSU4DqcjPQ+LaALYaVhTqXvdRYAuwMGytNL
	 TCNjZkxYvVhJA==
Message-ID: <31d7937f-1d8c-4a28-a0b5-3fb34b695401@kernel.org>
Date: Thu, 5 Jun 2025 11:16:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to zero post-eof page
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20250604085700.2454694-1-chao@kernel.org>
 <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/5/25 09:15, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2025年6月4日周三 17:01写道：
>>
>> fstest reports a f2fs bug:
>>
>> generic/363 42s ... [failed, exit status 1]- output mismatch (see /share/git/fstests/results//generic/363.out.bad)
>>     --- tests/generic/363.out   2025-01-12 21:57:40.271440542 +0800
>>     +++ /share/git/fstests/results//generic/363.out.bad 2025-05-19 19:55:58.000000000 +0800
>>     @@ -1,2 +1,78 @@
>>      QA output created by 363
>>      fsx -q -S 0 -e 1 -N 100000
>>     +READ BAD DATA: offset = 0xd6fb, size = 0xf044, fname = /mnt/f2fs/junk
>>     +OFFSET      GOOD    BAD     RANGE
>>     +0x1540d     0x0000  0x2a25  0x0
>>     +operation# (mod 256) for the bad data may be 37
>>     +0x1540e     0x0000  0x2527  0x1
>>     ...
>>     (Run 'diff -u /share/git/fstests/tests/generic/363.out /share/git/fstests/results//generic/363.out.bad'  to see the entire diff)
>> Ran: generic/363
>> Failures: generic/363
>> Failed 1 of 1 tests
>>
>> The root cause is user can update post-eof page via mmap, however, f2fs missed
>> to zero post-eof page in below operations, so, once it expands i_size, then it
>> will include dummy data locates previous post-eof page, so during below
>> operations, we need to zero post-eof page.
>>
>> Operations which can include dummy data after previous i_size after expanding
>> i_size:
>> - write
>> - mapwrite
>> - truncate
>> - fallocate
>>  * preallocate
>>  * zero_range
>>  * insert_range
>>  * collapse_range
>> - clone_range (doesn’t support in f2fs)
>> - copy_range (doesn’t support in f2fs)
>>
>> Cc: stable@kernel.org
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - cover f2fs_zero_post_eof_page w/ invalidate_lock
>>  fs/f2fs/file.c | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6bd3de64f2a8..ee5e662d2a4c 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -35,6 +35,17 @@
>>  #include <trace/events/f2fs.h>
>>  #include <uapi/linux/f2fs.h>
>>
>> +static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
>> +{
>> +       loff_t old_size = i_size_read(inode);
>> +
>> +       if (old_size > new_size)
> Hi Chao,
> should it be old_size >= new_size?

Zhiguo,

Yes, you're right.

> 
>> +               return;
>> +
>> +       /* zero or drop pages only in range of [old_size, new_size] */
>> +       truncate_pagecache(inode, old_size);
>> +}
>> +
>>  static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
>>  {
>>         struct inode *inode = file_inode(vmf->vma->vm_file);
>> @@ -103,8 +114,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>
>>         f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>>
>> +       filemap_invalidate_lock(inode->i_mapping);
>> +       f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT);
>> +       filemap_invalidate_unlock(inode->i_mapping);
>> +
>>         file_update_time(vmf->vma->vm_file);
>>         filemap_invalidate_lock_shared(inode->i_mapping);
>> +
>>         folio_lock(folio);
>>         if (unlikely(folio->mapping != inode->i_mapping ||
>>                         folio_pos(folio) > i_size_read(inode) ||
>> @@ -1109,6 +1125,8 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>                 f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>>                 filemap_invalidate_lock(inode->i_mapping);
>>
>> +               if (attr->ia_size > old_size)
>> +                       f2fs_zero_post_eof_page(inode, old_size);
> I'm a little suspicious about the logic here， here old_size is from
> i_size_read(inode),
> and it will compare with the "old_size" in f2fs_zero_post_eof_page, it
> is also from i_size_read(inode),
> so is this actually meaningless?

Oh, I need to pass attr->ia_size instead of old_size.

Let me revise in v3, anyway, thanks for the review.

Thanks,

> Thanks!
>>                 truncate_setsize(inode, attr->ia_size);
>>
>>                 if (attr->ia_size <= old_size)
>> @@ -1227,6 +1245,10 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>>         if (ret)
>>                 return ret;
>>
>> +       filemap_invalidate_lock(inode->i_mapping);
>> +       f2fs_zero_post_eof_page(inode, offset + len);
>> +       filemap_invalidate_unlock(inode->i_mapping);
>> +
>>         pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
>>         pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
>>
>> @@ -1510,6 +1532,8 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
>>         f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>         filemap_invalidate_lock(inode->i_mapping);
>>
>> +       f2fs_zero_post_eof_page(inode, offset + len);
>> +
>>         f2fs_lock_op(sbi);
>>         f2fs_drop_extent_tree(inode);
>>         truncate_pagecache(inode, offset);
>> @@ -1631,6 +1655,10 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
>>         if (ret)
>>                 return ret;
>>
>> +       filemap_invalidate_lock(mapping);
>> +       f2fs_zero_post_eof_page(inode, offset + len);
>> +       filemap_invalidate_unlock(mapping);
>> +
>>         pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
>>         pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
>>
>> @@ -1762,6 +1790,8 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
>>         /* avoid gc operation during block exchange */
>>         f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>         filemap_invalidate_lock(mapping);
>> +
>> +       f2fs_zero_post_eof_page(inode, offset + len);
>>         truncate_pagecache(inode, offset);
>>
>>         while (!ret && idx > pg_start) {
>> @@ -1819,6 +1849,10 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>>         if (err)
>>                 return err;
>>
>> +       filemap_invalidate_lock(inode->i_mapping);
>> +       f2fs_zero_post_eof_page(inode, offset + len);
>> +       filemap_invalidate_unlock(inode->i_mapping);
>> +
>>         f2fs_balance_fs(sbi, true);
>>
>>         pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
>> @@ -4860,6 +4894,10 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
>>         err = file_modified(file);
>>         if (err)
>>                 return err;
>> +
>> +       filemap_invalidate_lock(inode->i_mapping);
>> +       f2fs_zero_post_eof_page(inode, iocb->ki_pos + iov_iter_count(from));
>> +       filemap_invalidate_unlock(inode->i_mapping);
>>         return count;
>>  }
>>
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

