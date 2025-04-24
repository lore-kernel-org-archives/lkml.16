Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2B1FCCF7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482330; cv=none; b=svAWgCHCkuaCk+wzLWjq+tD4IWI4fqH9D2uNnwprQNa3HrzilY65rxxO0kpBIT8DqRbYGQHib0g4nWcC+tPJl4QnXyPdAwgBJhS17D/lGO2Jitw9Lyw4o+nj7K8RiXGqM4oKqhX2xuBXtPG2QTstFAider1QM4S4eYdRVZNoshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482330; c=relaxed/simple;
	bh=QUG3x4yqHmU7O89820znldObLWekVpybnqKE3FVjpsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BbNx2/ji0ZOu4/+WM09taaS6iUsSWimmMkl+P1bF29FyFxZp183p3UYsfb8Jvjf+zsscQ6OUmwR2+76MVvMrbvw4gekzcb5S7Z5+WJkq593bUSssFcwafX5a3toluZn9CIGRBG2MFvDFRvqjDtBtlwEKF11x16qN3HJiCVXP0rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZjpZT62l4z1d0mt;
	Thu, 24 Apr 2025 16:10:57 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id E1927180B51;
	Thu, 24 Apr 2025 16:11:57 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 16:11:57 +0800
Message-ID: <b6d8f4eb-e1ab-4a83-b552-0b58ec120299@huawei.com>
Date: Thu, 24 Apr 2025 16:11:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Maybe update the minextblks in wrong way?
To: Sandeep Dhavale <dhavale@google.com>
CC: Gao Xiang <hsiangkao@linux.alibaba.com>, LKML
	<linux-kernel@vger.kernel.org>, linux-erofs mailing list
	<linux-erofs@lists.ozlabs.org>
References: <50dc6bdc-ee62-41f1-b8e5-be64defb07c6@huawei.com>
 <CAB=BE-R4uPFeBSt6Z4Khv6_OjAu9=WoJR-VGG8eG0spAaovE1w@mail.gmail.com>
Content-Language: en-US
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <CAB=BE-R4uPFeBSt6Z4Khv6_OjAu9=WoJR-VGG8eG0spAaovE1w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/4/24 14:51, Sandeep Dhavale wrote:
> On Wed, Apr 23, 2025 at 6:50 PM Hongbo Li <lihongbo22@huawei.com> wrote:
>>
>> Hi Sandeep,
>>     The consecutive chunks will be merged if possible, but after commit
>> 545988a65131 ("erofs-utils: lib: Fix calculation of minextblks when
>> working with sparse files"), the @minextblks will be updated into a
>> smaller value even the chunks are consecutive by blobchunks.c:379. I
>> think maybe the last operation that updates @minextblks is unnecessary,
>> since this value would have already been adjusted earlier when handling
>> discontinuous chunks. Likes:
>>
>> ```
>> --- a/lib/blobchunk.c
>> +++ b/lib/blobchunk.c
>> @@ -376,7 +376,6 @@ int erofs_blob_write_chunked_file(struct erofs_inode
>> *inode, int fd,
>>                   *(void **)idx++ = chunk;
>>                   lastch = chunk;
>>           }
>> -       erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
>>           inode->datalayout = EROFS_INODE_CHUNK_BASED;
>>           free(chunkdata);
>>           return erofs_blob_mergechunks(inode, chunkbits,
>>
>> ```
>> This way can reduces the chunk index array's size. And what about your
>> opinion?
>>
>> Thanks,
>> Hongbo
> 
> Hi Hongbo,
> I think the last call is necessary to handle the tail end which is not
> handled in the for loop. But I understand that if the file is
> contiguous then the last call can reduce minextblks.

Ok, also should update is_contiguous in another place when we found the 
dedup chunk for non-sparse file?

By the way, why we should use the value of lowbit instead of the (end - 
start) >> sbi->blkszbits to update minextblks? The lowbit will get the 
smaller value.

Thanks,
Hongbo
> 
> Does the below patch address your concern to conditionally call the
> last erofs_update_minextblks()?
> 
> Thanks,
> Sandeep.
> 
> diff --git a/lib/blobchunk.c b/lib/blobchunk.c
> index de9150f..47fe923 100644
> --- a/lib/blobchunk.c
> +++ b/lib/blobchunk.c
> @@ -303,6 +303,7 @@ int erofs_blob_write_chunked_file(struct
> erofs_inode *inode, int fd,
>          lastch = NULL;
>          minextblks = BLK_ROUND_UP(sbi, inode->i_size);
>          interval_start = 0;
> +       bool is_contiguous = true;
> 
>          for (pos = 0; pos < inode->i_size; pos += len) {
>   #ifdef SEEK_DATA
> @@ -332,6 +333,7 @@ int erofs_blob_write_chunked_file(struct
> erofs_inode *inode, int fd,
>                                  erofs_update_minextblks(sbi, interval_start,
>                                                          pos, &minextblks);
>                                  interval_start = pos;
> +                               is_contiguous = false;
>                          }
>                          do {
>                                  *(void **)idx++ = &erofs_holechunk;
> @@ -365,7 +367,8 @@ int erofs_blob_write_chunked_file(struct
> erofs_inode *inode, int fd,
>                  *(void **)idx++ = chunk;
>                  lastch = chunk;
>          }
> -       erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
> +       if (!is_contiguous)
> +               erofs_update_minextblks(sbi, interval_start, pos, &minextblks);
>          inode->datalayout = EROFS_INODE_CHUNK_BASED;
>          free(chunkdata);
>          return erofs_blob_mergechunks(inode, chunkbits,
> 
