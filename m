Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BC5CB8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243336; cv=none; b=X9zHgrnUI3fyk0n4rcsjgMfDEnlaeoq3Asj9IM0evTBKF4cu4IHLKxuD05ZeMWtvsMFaK5LkV3qZLJyv2Fr/IbWXB/e24udsFkHfD8vw5XH7z4Y4LAZSjkQlK9PY5ZZyi7feDCHL1iEiAjvc/XQW6gdR2gNCvj7vVKUyHtXjStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243336; c=relaxed/simple;
	bh=rKF1hbfcgw75F2EN5uNgusCOV3BqZbHH4JOjXRGX65w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgbUN4cqtW44i0OxtpWnAau/ste+Lcf21+BZGvH+X7AVR6HhpZGnBMbyk52FkKo5pRBehqgfW9A4lZz61cum+Dybvobq/zuTAC37TnVu1r/621HbPKT9/vZ2sl1IqwKacpIKU2sD4ovE1WIVwx76BGr9PiILJ9AhvI1iSygCtmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CErOvc4u; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CErOvc4u"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744243324; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Aoq6JYCaV1p9yraciQnzm7D38594vGRZlTcVPXdUJs8=;
	b=CErOvc4ukleVfOY+MFBpeEjrFbzWoD0cZXlHnn1TBPkJrRceYDh9pfwcj/LS7KpXkTzdGHSsPgu2I6AWlpoQMWu5+0ryWGeCboWJ6T9LiphyAEtGnEUKBdDjTxJ2FO9IKSSmyhvzsGGlZVDgHPLjq7j0WLMyaaIif/tBgwHd4E0=
Received: from 30.134.5.237(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWLx0T9_1744243006 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Apr 2025 07:56:46 +0800
Message-ID: <7af3e868-04cb-47b1-a81b-651be3756ec5@linux.alibaba.com>
Date: Thu, 10 Apr 2025 07:56:45 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] erofs: add __packed annotation to union(__le16..)
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
References: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
 <20250409195222.4cadc368@pumpkin>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250409195222.4cadc368@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 2025/4/10 02:52, David Laight wrote:
> On Tue,  8 Apr 2025 19:44:47 +0800
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> 
>> I'm unsure why they aren't 2 bytes in size only in arm-linux-gnueabi.
> 
> IIRC one of the arm ABI aligns structures on 32 bit boundaries.

Thanks for your reply, but I'm not sure if it's the issue.

> 
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202504051202.DS7QIknJ-lkp@intel.com
>> Fixes: 61ba89b57905 ("erofs: add 48-bit block addressing on-disk support")
>> Fixes: efb2aef569b3 ("erofs: add encoded extent on-disk definition")
>> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
>> ---
>>   fs/erofs/erofs_fs.h | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
>> index 61a5ee11f187..94bf636776b0 100644
>> --- a/fs/erofs/erofs_fs.h
>> +++ b/fs/erofs/erofs_fs.h
>> @@ -56,7 +56,7 @@ struct erofs_super_block {
>>   	union {
>>   		__le16 rootnid_2b;	/* nid of root directory */
>>   		__le16 blocks_hi;	/* (48BIT on) blocks count MSB */
>> -	} rb;
>> +	} __packed rb;
>>   	__le64 inos;            /* total valid ino # (== f_files - f_favail) */
>>   	__le64 epoch;		/* base seconds used for compact inodes */
>>   	__le32 fixed_nsec;	/* fixed nanoseconds for compact inodes */
>> @@ -148,7 +148,7 @@ union erofs_inode_i_nb {
>>   	__le16 nlink;		/* if EROFS_I_NLINK_1_BIT is unset */
>>   	__le16 blocks_hi;	/* total blocks count MSB */
>>   	__le16 startblk_hi;	/* starting block number MSB */
>> -};
>> +} __packed;
> 
> That shouldn't be necessary and will kill performance on some systems.
> The 'packed' on the member should be enough to reduce the size.

It cannot be resolved by the following diff:

diff --git a/fs/erofs/erofs_fs.h b/fs/erofs/erofs_fs.h
index 94bf636776b0..1f6233dfdcb0 100644
--- a/fs/erofs/erofs_fs.h
+++ b/fs/erofs/erofs_fs.h
@@ -148,14 +148,14 @@ union erofs_inode_i_nb {
         __le16 nlink;           /* if EROFS_I_NLINK_1_BIT is unset */
         __le16 blocks_hi;       /* total blocks count MSB */
         __le16 startblk_hi;     /* starting block number MSB */
-} __packed;
+};

  /* 32-byte reduced form of an ondisk inode */
  struct erofs_inode_compact {
         __le16 i_format;        /* inode format hints */
         __le16 i_xattr_icount;
         __le16 i_mode;
-       union erofs_inode_i_nb i_nb;
+       union erofs_inode_i_nb i_nb __packed;
         __le32 i_size;
         __le32 i_mtime;
         union erofs_inode_i_u i_u;
@@ -171,7 +171,7 @@ struct erofs_inode_extended {
         __le16 i_format;        /* inode format hints */
         __le16 i_xattr_icount;
         __le16 i_mode;
-       union erofs_inode_i_nb i_nb;
+       union erofs_inode_i_nb i_nb __packed;
         __le64 i_size;
         union erofs_inode_i_u i_u;

I doesn't work and will report

In file included from <command-line>:
In function 'erofs_check_ondisk_layout_definitions',
     inlined from 'erofs_module_init' at ../fs/erofs/super.c:817:2:
./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct erofs_inode_compact) != 32
   542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
       |

> 
> I'd add a compile assert (of some form) on the size of the structure.

you mean

@@ -435,6 +435,7 @@ static inline void erofs_check_ondisk_layout_definitions(void)
         };

         BUILD_BUG_ON(sizeof(struct erofs_super_block) != 128);
+       BUILD_BUG_ON(sizeof(union erofs_inode_i_nb) != 2);
         BUILD_BUG_ON(sizeof(struct erofs_inode_compact) != 32);

?


./../include/linux/compiler_types.h:542:38: error: call to '__compiletime_assert_332' declared with attribute error: BUILD_BUG_ON failed: sizeof(union erofs_inode_i_nb) != 2
   542 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
       |                                      ^

That doesn't work too.

Thanks,
Gao Xiang
