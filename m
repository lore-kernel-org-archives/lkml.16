Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E4928F1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252767; cv=none; b=PjkyC0OYNSfBL9lIZ57GgEjDwFmEm3x2dFLQw0ee0bYVvxVKbSio2XQ2S3+P+OYQfYd6eI1HzAPO2l+u/cz8jKtTLLrMgUQ9k+EAYoNxEeEHUsO3XPd7bNpJvRgWr4RZtE5iPehhXj+bjR6Oz8p66EG5wbv4KIwOItdCNfZwxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252767; c=relaxed/simple;
	bh=Wt0vPJZZQdFBm6sRPr2s5cgrwmzjSgk8OV3nE9ZfszM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z6VWmp1GPdx49eoTKMEA7hwH4RCJvKEtjlKtuZ+VoxW8oGWrmm7+JyyBkBJq4U4KKioFvwQT4H4vnvz3lq3QOLX8qWCp5eSlchm20garuTwfNQI8UJqcVi0p2zRMfsUNEx+P/3d3ma40D2e7NQc3Vr7n2QQYQ7wTYmIcJP37nac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bVrDz4gPyzYm65y;
	Mon, 30 Jun 2025 10:48:03 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 10:50:24 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 10:50:23 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
CC: <chao@kernel.org>, <feng.han@honor.com>, <jaegeuk@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangzijie1@honor.com>
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
Date: Mon, 30 Jun 2025 10:50:23 +0800
Message-ID: <20250630025023.3876706-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
References: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)

>On 6/24/25 11:59, wangzijie wrote:
>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>> to smaller or equal size on pinned file. But for truncation to larger size, after
>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>> we only support overwrite IO to pinned file, so we don't need to consider
>> attr->ia_size > i_size case.
>
>Zijie, can you take a look generic/494? suspect that it is caused by this change.
>
>generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
>    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
>    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
>    @@ -2,7 +2,7 @@
>     Format and mount
>     Initialize file
>     Try to truncate
>    -ftruncate: Text file busy
>    +ftruncate: Invalid argument
>     Try to punch hole
>     fallocate: Text file busy
>    ...
>    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
>Ran: generic/494
>Failures: generic/494
>Failed 1 of 1 tests
>
>Thanks,

Hi, Chao
generic/494 swapon file and try to ftruncate.

Before this change
swap_acticate:
set_inode_flag(inode, FI_PIN_FILE)

ftruncate:
setattr_prepare
-inode_newsize_ok
--return -ETXTBSY for SWAPFILE

After this change:
swap_acticate:
set_inode_flag(inode, FI_PIN_FILE)

ftruncate: 
prevent unaligned truncation before setattr_prepare()
return -EINVAL

Sorry for this. Maybe I should apply this check after setattr_prepare()? Or do
you have some suggestions?


>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>> v4:
>> - convert sbi first and apply change
>> ---
>>  fs/f2fs/file.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>> 
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 209f43653..4809f0fd6 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>  			!IS_ALIGNED(attr->ia_size,
>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>  			return -EINVAL;
>> +		/*
>> +		 * To prevent scattered pin block generation, we don't allow
>> +		 * smaller/equal size unaligned truncation for pinned file.
>> +		 * We only support overwrite IO to pinned file, so don't
>> +		 * care about larger size truncation.
>> +		 */
>> +		if (f2fs_is_pinned_file(inode) &&
>> +			attr->ia_size <= i_size_read(inode) &&
>> +			!IS_ALIGNED(attr->ia_size,
>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> +			return -EINVAL;
>>  	}
>>  
>>  	err = setattr_prepare(idmap, dentry, attr);

