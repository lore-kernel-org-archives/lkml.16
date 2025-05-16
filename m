Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0539ACC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404307; cv=none; b=YSvBrqk2Fy/BCtVKbdKR/RCnxFFiYP5jA/cB+2LsE6qOOKxGx9cBcTAoxFQRw2SWIlY0z4OLs6FLNR88JuWCOui6RHH+xko3HmIURW+7353CNqn/bDlFtPg4UkHy84LK9SFieaG6UPmVo5CNguaTWyNg5F44+qNJD1sUtwFJXKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404307; c=relaxed/simple;
	bh=5h9/qmO8bM2BQeDbP5t5ytDIkSu0KazK8d11/BUzbfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS1dWpCya4oPRx79i0UwR/riUb25hMj6Wei2RNq5pxB6eUbOUA3LoJt9V1zdOekzHXqgbHOQK6NAorMzaX4QPK3dyB+jSXFBLmEMt6Uhqs5sHtyKsNbK17OTMzSIY5wsmKkJnHK2omnLj6aLe7kgTXo8Wnn+jcV5LYIjXPs/W1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=R4rgwS6r; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="R4rgwS6r"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747404292; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/ZSrtVJHRWxqli6VwCLHlssALJbjN7Fk1roT6+hMXiM=;
	b=R4rgwS6rRLKsCOGKaUPKOp9PEirqxsfTbmQVgbDTbs7GGeUJPqSm+jMfMUpadLcaQZWTVfOmmqHE8rDRxqNPeVfY6R258R6yCXqug0N69kuhBreYcSKaX0TrUwh+sLD5BfToAeBdP6HJ0vOYmw+iIeNRWUVJiXBSr5ZFn6UaDw8=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WawIU3z_1747404291 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 22:04:52 +0800
Message-ID: <6b456e0d-04cf-4ecd-a23a-e91c7d58b592@linux.alibaba.com>
Date: Fri, 16 May 2025 22:04:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] erofs: add 'fsoffset' mount option for file-backed &
 bdev-based mounts
To: Sheng Yong <shengyong2021@gmail.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com, dhavale@google.com,
 lihongbo22@huawei.com
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Sheng Yong <shengyong1@xiaomi.com>, Wang Shuai <wangshuai12@xiaomi.com>
References: <20250516090055.3343777-1-shengyong1@xiaomi.com>
 <b91b9f2c-3a07-4726-95d9-75d36bb59871@linux.alibaba.com>
 <4f26b365-bca1-4ca7-99b7-f4b80cff26be@gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <4f26b365-bca1-4ca7-99b7-f4b80cff26be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/16 21:50, Sheng Yong wrote:
> Hi Xiang,
> 
> On 5/16/25 17:15, Gao Xiang wrote:
>> Hi Yong,
>>
>> On 2025/5/16 17:00, Sheng Yong wrote:
>>
>> ...
>>
>>> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/ filesystems/erofs.rst
>>> index c293f8e37468..b24cb0d5d4d6 100644
>>> --- a/Documentation/filesystems/erofs.rst
>>> +++ b/Documentation/filesystems/erofs.rst
>>> @@ -128,6 +128,7 @@ device=%s              Specify a path to an extra device to be used together.
>>>   fsid=%s                Specify a filesystem image ID for Fscache back-end.
>>>   domain_id=%s           Specify a domain ID in fscache mode so that different images
>>>                          with the same blobs under a given domain ID can share storage.
>>> +fsoffset=%lu           Specify image offset for file-backed or bdev- based mounts.
>>
>> Maybe document it as:
>> fsoffset=%lu              Specify filesystem offset for the primary device.
> 
> OK, this makes sense. But if we need to handle offset for extra devices,
> we might need to use an array or a string to temporarily store the values.
> This is because devices are not initialized during parsing parameters.
> And set `off' for each extra device during scan devices.
> For now, I prefer to add fsoffset for the primary device only. I think
> the primary device which has an offset is the more generic case.

Yes, I prefer to handle the primary device only too, but leave
some further extension with the new expression above.

Also I suggest using a new subject as:
"erofs: add 'fsoffset' mount option to specify filesystem offset"

> 
>>
>> Since I'm not sure if we need later
>> fsoffset=%lu,[%lu,...]    Specify filesystem offset for all devices.
>>
>>>   =================== =========================================================
>>>   Sysfs Entries
>>> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
>>> index 2409d2ab0c28..599a44d5d782 100644
>>> --- a/fs/erofs/data.c
>>> +++ b/fs/erofs/data.c
>>> @@ -27,9 +27,12 @@ void erofs_put_metabuf(struct erofs_buf *buf)
>>>   void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
>>>   {
>>> -    pgoff_t index = offset >> PAGE_SHIFT;
>>> +    pgoff_t index;
>>
>> How about just
>>      pgoff_t index = (offset + buf->off) >> PAGE_SHIFT;
>>
>> since it's not complex to break it into two statements..
>>
>>>       struct folio *folio = NULL;
>>> +    offset += buf->off;
>>> +    index = offset >> PAGE_SHIFT;
>>> +
>>>       if (buf->page) {
>>>           folio = page_folio(buf->page);
>>>           if (folio_file_page(folio, index) != buf->page)
>>> @@ -54,6 +57,7 @@ void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
>>>       struct erofs_sb_info *sbi = EROFS_SB(sb);
>>>       buf->file = NULL;
>>> +    buf->off = sbi->dif0.off;
>>>       if (erofs_is_fileio_mode(sbi)) {
>>>           buf->file = sbi->dif0.file;    /* some fs like FUSE needs it */
>>>           buf->mapping = buf->file->f_mapping;
>>> @@ -299,7 +303,7 @@ static int erofs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>>           iomap->private = buf.base;
>>>       } else {
>>>           iomap->type = IOMAP_MAPPED;
>>> -        iomap->addr = mdev.m_pa;
>>> +        iomap->addr = mdev.m_dif->off + mdev.m_pa;
>>
>> I mean, could we update erofs_init_device() and then
>> `mdev.pa` is already an number added by `mdev.m_dif->off`...
>>
>> Is it possible? since mdev.pa is already a device-based
>> offset.
> 
> I think in most cases we can add `off' to mdev.m_pa directly in
> erofs_map_dev(). But for readdir, erofs_read_metabuf(mdev.m_pa)
> is called after erofs_map_dev() in dir's erofs_iomap_begin().
> However, read metabuf needs `off'.

Ok, I see.  Yes, it's somewhat tricky for EROFS_MAP_META,
so okay, let's leave it as-is.

> 
>>
>>>           if (flags & IOMAP_DAX)
>>>               iomap->addr += mdev.m_dif->dax_part_off;
>>>       }
>>> diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
>>> index 60c7cc4c105c..a2c7001ff789 100644
>>> --- a/fs/erofs/fileio.c
>>> +++ b/fs/erofs/fileio.c
>>> @@ -147,7 +147,8 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
>>>                   if (err)
>>>                       break;
>>>                   io->rq = erofs_fileio_rq_alloc(&io->dev);
>>> -                io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
>>> +                io->rq->bio.bi_iter.bi_sector =
>>> +                    (io->dev.m_dif->off + io->dev.m_pa) >> 9;
>>
>> So we don't need here.
>>
>>>                   attached = 0;
>>>               }unambiguous
>>>               if (!bio_add_folio(&io->rq->bio, folio, len, cur))
>>> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
>>> index 4ac188d5d894..cd8c738f5eb8 100644
>>> --- a/fs/erofs/internal.h
>>> +++ b/fs/erofs/internal.h
>>> @@ -43,6 +43,7 @@ struct erofs_device_info {
>>>       char *path;
>>>       struct erofs_fscache *fscache;
>>>       struct file *file;
>>> +    u64 off;
>>>       struct dax_device *dax_dev;
>>>       u64 dax_part_off;
>>
>> Maybe `u64 off, dax_part_off;` here?
>>
>> Also I'm still not quite sure `off` is unambiguous...
>> Maybe `dataoff`? not quite sure.
> 
> What about fsoff accroding to fsoffset?

`fsoff` is fine by me.

Thanks,
Gao Xiang
