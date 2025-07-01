Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502318821
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 01:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751334806; cv=none; b=ix1cSG/B7bi9kKShalN8eZmcaWW5za1lzvg+IhKI7LayGabBCQmb53iAk7Dh8A9tt17p6h6Ea4d9hr2Ddp4GMqiFLt1x+jn1u+jTReX9WYIqJjeYcsOOnRABjgOZbSWvgA9KrqoTTxqwZff2m0xJxLkVZIz5MExLlRrrUXe5jnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751334806; c=relaxed/simple;
	bh=W6vvtnRSZ102gc75JsOn7MO33MJvMtgi3iPmyv3xahk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=riP8rdT0MJIVNACK+NNxIIqkPQfCRAU5Cgk41e8O1DY1Ti66XWm9iaLLkoOMH7UCTQ9+QM4vZYumWqBskmGomMbYOiuit+0z6Snh74OMI56aAmQgrInA07lRp55SJF9CLpd7n/NFJrvTSDwvbL91vdiAQwdmmDkDH90ME5GL38Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=UGHnmP+C; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="UGHnmP+C"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=CzLVF+OdJ4rPOyfgWhzZMsL6Rpd9UR6mT9Ip2y6JX/0=;
	b=UGHnmP+CpE+C+0MvQjaC3u6HEzXVfoq5805ntOM0lcsAx14xyTvSAu1VkU+/At//9zPVMgHze
	oA1fxhRFuZ2nxD8yFhOrnLF4QBSHYYwwBXvWNYfwj5Rv6bDKTCxme3Mn0WZyD2AhxOVkGvTSMXo
	TSYrzO9Ck3cwGvd+h/V5vz0=
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bWQwr5pKqzYm8BD;
	Tue,  1 Jul 2025 09:51:08 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 09:53:15 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 09:53:15 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
CC: <feng.han@honor.com>, <jaegeuk@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangzijie1@honor.com>
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned truncation to smaller/equal size on pinned file
Date: Tue, 1 Jul 2025 09:53:14 +0800
Message-ID: <20250701015314.3992659-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aGK85SAE9kDcVAMe@google.com>
References: <aGK85SAE9kDcVAMe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)

>I think we can clean up more like this?
>
>https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u

Hi Kim,
Yes, I think we can apply the patch you showed and v4 of this patch. Thank you.
 
https://lore.kernel.org/linux-f2fs-devel/20250624035938.3176350-1-wangzijie1@honor.com/
https://lore.kernel.org/linux-f2fs-devel/20250624035938.3176350-2-wangzijie1@honor.com/

>On 06/30, wangzijie wrote:
>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>> to smaller or equal size on pinned file. But for truncation to larger size, after
>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>> we only support overwrite IO to pinned file, so we don't need to consider
>> attr->ia_size > i_size case.
>> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
>> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
>> setattr_prepare().
>> 
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>> v5:
>> - fix xfstests #494 fail
>> ---
>>  fs/f2fs/file.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>> 
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 78368b793..d4feea44b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>  	if (err)
>>  		return err;
>>  
>> +	/*
>> +	 * To prevent scattered pin block generation, we don't allow
>> +	 * smaller/equal size unaligned truncation for pinned file.
>> +	 * We only support overwrite IO to pinned file, so don't
>> +	 * care about larger size truncation.
>> +	 * We need to check this after setattr_prepare() because xfstests
>> +	 * #494 assumes truncation on active swapfile(pinned) will
>> +	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
>> +	 */
>> +	if (attr->ia_valid & ATTR_SIZE) {
>> +		if (f2fs_is_pinned_file(inode) &&
>> +			attr->ia_size <= i_size_read(inode) &&
>> +			!IS_ALIGNED(attr->ia_size,
>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>> +			return -EINVAL;
>> +	}
>> +
>>  	err = fscrypt_prepare_setattr(dentry, attr);
>>  	if (err)
>>  		return err;
>> -- 
>> 2.25.1

