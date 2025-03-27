Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B7A32
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045704; cv=none; b=obiMybdob/eG/rJaqy7xXjRqaBU5OnBHJEfHs5fnrCpAumRKubZ+paA95o77z/i/T1ogsHXJedn6QDIAvIFgYzChqo7THyQOD8S4e/puqWKcqg1NJp/6rhn/0FQIqfC5E2dYu4PCwBp1CyadVwWZjvLlEXfa+2TGeIv7z7ziVVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045704; c=relaxed/simple;
	bh=J6KDeAk/jxGnYprxAwB9+4tpbqfOnwyrj/fv/yPIZZ4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UXhZVzPHPetm7FKJTuKrrUQf4zNFVWZe6Wu/Vts6Jj0oeLdUhJ9Pkz5Tl8BA4IRYcfgsp8kornhy03EEpGrQ64Req0SBLhEj1j6TqU3zl6fASLbVJThwR6YI0gveTxcRgD3GMFRdCyWHwpjvKkypeXZzSZKC7NbByHtkJYerwCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4d6oy9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4d6oy9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E7DC4CEDD;
	Thu, 27 Mar 2025 03:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045704;
	bh=J6KDeAk/jxGnYprxAwB9+4tpbqfOnwyrj/fv/yPIZZ4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=E4d6oy9sBdRQeAdizkzREAzRz0DR63YYaLTQhkE2/wlbCu+96wULof4aq2l/r0OsI
	 v3Fk5tK67iLf5aVJJ2xFtfp1QZZUqc9dPiTjwcQgkHFUHNkNLM80scKIPr6+YviY+G
	 iHG5OllhN7l0v7AFpQVGNs0fpaKYdpZdmYm4TAJKWhUi4Yc7GQweK8d7Xh/FDt7U4r
	 J33OSN5iseymwhUfTENEgR1W4XSIJpHQup7yZYICnBlIiaNKF77QIeTDPpGWKqFqeW
	 71ksm56Q3kk4dHYlaGTAD76ajNHnCJQ2hk5Sn5F1jAtXbkHTPyn8GxJsgXmDFwlUKj
	 W9Ilq1GtA7ISQ==
Message-ID: <e951488b-4000-4e8c-90ef-b3e1cd58007d@kernel.org>
Date: Thu, 27 Mar 2025 11:21:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Zhiguo Niu <niuzhiguo84@gmail.com>,
 daehojeong@google.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: remove some redundant flow about
 FI_ATOMIC_DIRTIED
To: Daeho Jeong <daeho43@gmail.com>
References: <1742978761-16264-1-git-send-email-zhiguo.niu@unisoc.com>
 <e4fb11ea-a97b-4ba0-aa28-f6f93e5a6134@kernel.org>
 <CAHJ8P3JWABsntymD3u5=0YR7=0it5x0PP49S4ftwBEjC1UreOA@mail.gmail.com>
 <8a72691e-28ef-4b6b-a855-62fd6c2743dc@kernel.org>
 <CACOAw_wX3QPvpaCWW2gfKH_9Zf_=Tku14+RL6CatU9f2d2AiGQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_wX3QPvpaCWW2gfKH_9Zf_=Tku14+RL6CatU9f2d2AiGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/27/25 02:51, Daeho Jeong wrote:
> On Wed, Mar 26, 2025 at 5:12 AM Chao Yu via Linux-f2fs-devel
> <linux-f2fs-devel@lists.sourceforge.net> wrote:
>>
>> On 3/26/25 18:51, Zhiguo Niu wrote:
>>> Chao Yu <chao@kernel.org> 于2025年3月26日周三 17:26写道：
>>>>
>>>> On 3/26/25 16:46, Zhiguo Niu wrote:
>>>>> Commit fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
>>>>> adds the processing of FI_ATOMIC_DIRTIED in the following two positions,
>>>>> [1]
>>>>> f2fs_commit_atomic_write
>>>>>  - __f2fs_commit_atomic_write
>>>>>   - sbi->committed_atomic_block += fi->atomic_write_cnt;
>>>>>   - set_inode_flag(inode, FI_ATOMIC_COMMITTED);
>>>>>   - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>>>>>   -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>>>   -    f2fs_mark_inode_dirty_sync(inode, true);
>>>>>   - }
>>>>> [2]
>>>>> f2fs_abort_atomic_write
>>>>>   - if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>>>>>   -    clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>>>   -    f2fs_mark_inode_dirty_sync(inode, true);
>>>>>   - }
>>>>>
>>>>> but [1] seems to be redundant:
>>>>> The atomic file flag FI_ATOMIC_FILE is still set here, so f2fs_mark_inode_dirty_sync
>>>>> still does not set the dirty state to vfs. If FI_ATOMIC_DIRTIED was originally set
>>>>> when atomic file is committing, then FI_ATOMIC_DIRTIED is just cleared here, and
>>>>> then do the repeating action of setting FI_ATOMIC_DIRTIED?
>>>>> So is it enough to do this only in [2]?
>>>>
>>>> Hi Zhiguo,
>>>>
>>>> I checked the code again, finally, I got this, could you please take
>>>> a look?
>>>>
>>>> Ping Daeho as well.
>>>>
>>>> Subject: [PATCH] f2fs: fix to set atomic write status more clear
>>>>
>>>> 1. After we start atomic write in a database file, before committing
>>>> all data, we'd better not set inode w/ vfs dirty status to avoid
>>>> redundant updates, instead, we only set inode w/ atomic dirty status.
>>>>
>>>> 2. After we commit all data, before committing metadata, we need to
>>>> clear atomic dirty status, and set vfs dirty status to allow vfs flush
>>>> dirty inode.
>>>>
>>> Hi Chao,
>>> these looks more clear.
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>  fs/f2fs/inode.c   |  4 +++-
>>>>  fs/f2fs/segment.c | 10 ++++++----
>>>>  fs/f2fs/super.c   |  4 +++-
>>>>  3 files changed, 12 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>> index 5c8634eaef7b..f5991e8751b9 100644
>>>> --- a/fs/f2fs/inode.c
>>>> +++ b/fs/f2fs/inode.c
>>>> @@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>>>>         if (f2fs_inode_dirtied(inode, sync))
>>>>                 return;
>>>>
>>>> -       if (f2fs_is_atomic_file(inode))
>>>> +       /* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty */
>>>> +       if (f2fs_is_atomic_file(inode) &&
>>>> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>>>>                 return;
>>>>
>>>>         mark_inode_dirty_sync(inode);
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index dc360b4b0569..28659a71891a 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -376,10 +376,12 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>>>>         } else {
>>>>                 sbi->committed_atomic_block += fi->atomic_write_cnt;
>>>>                 set_inode_flag(inode, FI_ATOMIC_COMMITTED);
>>>> -               if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>>>> -                       clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>> -                       f2fs_mark_inode_dirty_sync(inode, true);
>>>> -               }
>>>> +
>>>> +               f2fs_bug_on(sbi, !is_inode_flag_set(inode, FI_ATOMIC_DIRTIED));
>>> but FI_ATOMIC_DIRTIED may  not be set when atomic file is committing?
>>> thanks!
>>
>> inc_valid_block_count() will set FI_ATOMIC_DIRTIED for inode at least?
>>
>> - __f2fs_commit_atomic_write
>>  - __replace_atomic_write_block
>>   - inc_valid_block_count
>>    - f2fs_i_blocks_write
>>     - f2fs_mark_inode_dirty_sync
> 
> Maybe, no write scenario? open -> atomic_write_start -> no write -> commit?

Oh, You're right.

Thanks,

> 
>>
>> Thanks,
>>
>>>> +
>>>> +               /* clear atomic dirty status and set vfs dirty status */
>>>> +               clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>> +               f2fs_mark_inode_dirty_sync(inode, true);
>>>>         }
>>>>
>>>>         __complete_revoke_list(inode, &revoke_list, ret ? true : false);
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index 9a42a1323f42..a5cc9f6ee16a 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -1532,7 +1532,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync)
>>>>         }
>>>>         spin_unlock(&sbi->inode_lock[DIRTY_META]);
>>>>
>>>> -       if (!ret && f2fs_is_atomic_file(inode))
>>>> +       /* if atomic write is not committed, set inode w/ atomic dirty */
>>>> +       if (!ret && f2fs_is_atomic_file(inode) &&
>>>> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>>>>                 set_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>>
>>>>         return ret;
>>>> --
>>>> 2.48.1
>>>>
>>>>
>>>>>
>>>>> Cc: Daeho Jeong <daehojeong@google.com>
>>>>> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
>>>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>>> ---
>>>>>  fs/f2fs/segment.c | 4 ----
>>>>>  1 file changed, 4 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>>> index 396ef71..d4ea3af 100644
>>>>> --- a/fs/f2fs/segment.c
>>>>> +++ b/fs/f2fs/segment.c
>>>>> @@ -376,10 +376,6 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>>>>>       } else {
>>>>>               sbi->committed_atomic_block += fi->atomic_write_cnt;
>>>>>               set_inode_flag(inode, FI_ATOMIC_COMMITTED);
>>>>> -             if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>>>>> -                     clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>>>>> -                     f2fs_mark_inode_dirty_sync(inode, true);
>>>>> -             }
>>>>>       }
>>>>>
>>>>>       __complete_revoke_list(inode, &revoke_list, ret ? true : false);
>>>>
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

