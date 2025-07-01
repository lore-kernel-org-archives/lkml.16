Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213EE1862A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751341162; cv=none; b=I2eGrWvSSV9N1bge5KFrC/LKcNJxK+g4LUDxUJMmIa4iFp1jwrTyWUH1luGqubwmSF/N4FUrGvGOSYz6ExLtSex4o1nidC1x08S7FEAPnsgoeCqW3L0wwgTLZFWga6CDW/IPrTzjyEejJdx5ZBOpDu0a9tB2JioVaif0oYm0n50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751341162; c=relaxed/simple;
	bh=MOn6WxZiOzMLvzZ6XMR6aWTrK4xGHmMPAiNJt6rzB68=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=E4srKkUyNqcK4TK8HFadVIjeeaAdZwAxpz09EIF0zUbIS7Rg5tN+AP+XYFz3frctutaRLKr8rOqKjWPAR58L8aP2T4gTerm1J7wiNTFa0TACcbH5zdtv6B1z147pBopwDkp4AOac4tb5sITy8Xo2iDesX7xBWwQycUK3ZZcLy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn19zjvc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn19zjvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A947C4CEED;
	Tue,  1 Jul 2025 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751341161;
	bh=MOn6WxZiOzMLvzZ6XMR6aWTrK4xGHmMPAiNJt6rzB68=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Hn19zjvcKzFacDvOGS4nKrs84bUKkc9D2B09VzPlaHYlr+E2EVjylvhuvhy/nsM2l
	 K8l3EO0uh2Jux3uBg0WtzHPxKPfGAaEZ0RWoWAqIZguEM6ZwZ+Il2ZiMiF9kdHksKM
	 dlX63B20NIDnc8av4JYTBqhcIKRSY4pVvWOJvBzpxxQsfXJkHKAya/3TeTLYj+6vBb
	 AkCa1IpaOHO5jy3GG160znsMuhz5Q8yJVmcxtARyfW1nrIu3ZJxanXrOKgAbHPVwtk
	 UcL3fT13OZBEMODMDGSN2LpesV9P6489RNwu3F8cMhzFNPCEMmCoRnXpwfHPNWqCuz
	 FvGaN+7bdbQ+g==
Message-ID: <8b0c3ab6-6285-4a92-887e-770473062474@kernel.org>
Date: Tue, 1 Jul 2025 11:39:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] f2fs: use ioprio hint for hot and pinned files
To: Daniel Lee <chullee@google.com>
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-3-chullee@google.com>
 <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
 <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/1/25 06:56, Daniel Lee wrote:
> On Mon, Jun 16, 2025 at 5:50 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 6/15/25 22:42, Daniel Lee wrote:
>>> Apply the `ioprio_hint` to set `F2FS_IOPRIO_WRITE` priority
>>> on files identified as "hot" at creation and on files that are
>>> pinned via ioctl.
>>>
>>> Signed-off-by: Daniel Lee <chullee@google.com>
>>> ---
>>>  fs/f2fs/f2fs.h  | 19 +++++++++++++++++++
>>>  fs/f2fs/file.c  |  3 +++
>>>  fs/f2fs/namei.c | 11 +++++++----
>>>  3 files changed, 29 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 3e02687c1b58..0c4f52892ff7 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -3440,6 +3440,25 @@ static inline void set_file(struct inode *inode, int type)
>>>       f2fs_mark_inode_dirty_sync(inode, true);
>>>  }
>>>
>>> +static inline int get_ioprio(struct inode *inode)
>>> +{
>>> +     return F2FS_I(inode)->ioprio_hint;
>>> +}
>>> +
>>> +static inline void set_ioprio(struct inode *inode, int level)
>>> +{
>>> +     if (get_ioprio(inode) == level)
>>> +             return;
>>> +     F2FS_I(inode)->ioprio_hint = level;
>>> +}
>>> +
>>> +static inline void clear_ioprio(struct inode *inode)
>>> +{
>>> +     if (get_ioprio(inode) == 0)
>>> +             return;
>>> +     F2FS_I(inode)->ioprio_hint = 0;
>>> +}
>>> +
>>>  static inline void clear_file(struct inode *inode, int type)
>>>  {
>>>       if (!is_file(inode, type))
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 3eb40d7bf602..a18fb7f3d019 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -3496,6 +3496,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>>>
>>>       if (!pin) {
>>>               clear_inode_flag(inode, FI_PIN_FILE);
>>> +             clear_ioprio(inode);
>>
>> I guess there are more places clearing FI_PIN_FILE? we need to cover
>> them all?
> 
> Yes, you're right. FI_PIN_FILE is toggled in several places. However,
> this change is intended to set the HOT and IOPRIO on the files that
> users explicitly pin through IOCTL. The other kernel internal
> mechanisms (e.g., swap or gc_failures) remain the same. Are there any
> potential issues that I should consider?

Daniel,

Not sure, just notice that it seems FI_PIN_FILE and IOPRIO are not
set/unset together always.

> 
>  >
>>>               f2fs_i_gc_failures_write(inode, 0);
>>>               goto done;
>>>       } else if (f2fs_is_pinned_file(inode)) {
>>> @@ -3529,6 +3530,8 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
>>>       }
>>>
>>>       set_inode_flag(inode, FI_PIN_FILE);
>>> +     file_set_hot(inode);
>>
>> Unnecessary file_set_hot() invoking? Or am I missing anything?
>>
>> Thanks,
> 
> Setting HOT and IOPRIO by default is also intentional. We set both
> flags by default because the main use case for pinned files involves
> frequently updated or short-lived data that needs fast write speeds.

Well, if it is intentional, let's describe it in commit message explicitly.

Two more questions:
- when we unpin a file, we need to clear hot flag as well?
- when we set pin on cold file, do we need to clear the cold flag and then
set hot flag?

BTW, there is no document about this pin ioctl, its sematics becomes more
complicated now, not sure whether user can use this ioctl as their needs or
not, how about adding some comments above this ioctl function, later, we
can relocate the comments to f2fs.rst as document.

Thanks,

> 
>>
>>> +     set_ioprio(inode, F2FS_IOPRIO_WRITE);
>>>       ret = F2FS_I(inode)->i_gc_failures;
>>>  done:
>>>       f2fs_update_time(sbi, REQ_TIME);
>>> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
>>> index 07e333ee21b7..0f96a0b86c40 100644
>>> --- a/fs/f2fs/namei.c
>>> +++ b/fs/f2fs/namei.c
>>> @@ -191,9 +191,10 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
>>>  }
>>>
>>>  /*
>>> - * Set file's temperature for hot/cold data separation
>>> + * Set file's temperature (for hot/cold data separation) and
>>> + * I/O priority, based on filename extension
>>>   */
>>> -static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>>> +static void set_file_temp_prio(struct f2fs_sb_info *sbi, struct inode *inode,
>>>               const unsigned char *name)
>>>  {
>>>       __u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
>>> @@ -212,8 +213,10 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
>>>
>>>       if (i < cold_count)
>>>               file_set_cold(inode);
>>> -     else
>>> +     else {
>>>               file_set_hot(inode);
>>> +             set_ioprio(inode, F2FS_IOPRIO_WRITE);
>>> +     }
>>>  }
>>>
>>>  static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>>> @@ -317,7 +320,7 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
>>>               set_inode_flag(inode, FI_INLINE_DATA);
>>>
>>>       if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
>>> -             set_file_temperature(sbi, inode, name);
>>> +             set_file_temp_prio(sbi, inode, name);
>>>
>>>       stat_inc_inline_xattr(inode);
>>>       stat_inc_inline_inode(inode);
>>

