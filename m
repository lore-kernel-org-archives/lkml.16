Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8B19D06A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154733; cv=none; b=fZb3bIdYMy4abFtlS5g9z6cnzvWMI8RtMHx5cUsA9a8em8ksBb2dCk18fTbMuVSvRyq2QUB0rzigfiZqTL6p0zCbNQK2DiwOA4Tx4rgufB/36qYsbE8fKNzm5EFJbtEflRUNFBvdBJ+dBphit7Z41PuZxhZTTlZDysJ1Xzy1vWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154733; c=relaxed/simple;
	bh=MhR8D/z4OZjx0jdA9rn4/rmzmTH1P14n9QAzqAOV3n4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQ6f4TpLKLouP0IMfgD5iUfEE/VZiuRcRciwK+ph87vJhb7MWX6sUWKLvZ7KwBEO+r7glR9a/qwR2ux1dUpW9w34JRPs5SgYJJY7YXGdccm2EtQZpk1g85xAVAsjB74fr3yfpmD5a8LP9SDE/Lo0BaiektPUBHxznQgLphQGb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=V9mQXDRg; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="V9mQXDRg"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=UGSEGvuiA9UAPwj2rWxp+/CXQNg0Mdxcwm/O10+dlIc=;
	b=V9mQXDRgFt8vRoCmggPITtVQdh2gnb+73QRPVKiqm/ytG8bfcagjpbJxqdqt4ynpgSgU3E82y
	gQmhlVzW0Rs3sIt40LuzAjsh/IWNb0CV5kAUmmjbfzBlDRrevr/IY01uJTOZcDb38iCuuwq8crQ
	4SQEt5IjlkuaKMZLYoGf1h0=
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bM2WL2pYMzYkxhb;
	Tue, 17 Jun 2025 18:03:26 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 18:05:27 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 17 Jun
 2025 18:05:27 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
CC: <chao@kernel.org>, <feng.han@honor.com>, <jaegeuk@kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangzijie1@honor.com>
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: avoid non-section-aligned size pinned file generation
Date: Tue, 17 Jun 2025 18:05:27 +0800
Message-ID: <20250617100527.2373435-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e6a2233f-5f32-4e1a-87b3-4ecb935e3997@kernel.org>
References: <e6a2233f-5f32-4e1a-87b3-4ecb935e3997@kernel.org>
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

>On 6/17/25 15:36, wangzijie wrote:
>>> On 6/17/25 11:57, wangzijie wrote:
>>>> To prevent non-section-aligned size pinned file generated from truncation,
>>>> add check condition in setattr.
>>>>
>>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>>> ---
>>>>  fs/f2fs/file.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 6bd3de64f..72f7d1b4a 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -1026,6 +1026,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>>  {
>>>>  	struct inode *inode = d_inode(dentry);
>>>>  	struct f2fs_inode_info *fi = F2FS_I(inode);
>>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>>  	int err;
>>>>  
>>>>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>>> @@ -1047,6 +1048,11 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>>  			!IS_ALIGNED(attr->ia_size,
>>>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>>>  			return -EINVAL;
>>>> +		if (f2fs_is_pinned_file(inode) &&
>>>> +			attr->ia_size < i_size_read(inode) &&
>>>
>>> Do we need to consider attr->ia_size > i_size case?
>>>
>>> Thanks,
>> 
>> Hi, Chao
>> After commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned
>> files"), when we want to write data to pinned file, we need to use pin+fallocate, 
>> and we did CAP_BLKS_PER_SEC roundup align when fallocate pinned file:
>> 
>> block_t sec_len = roundup(map.m_len, sec_blks);
>> 
>> Even if we truncate the file to a larger size(maybe larger than sec_len, section
>> align or not), and write data to offset beyond sec_len, the write will fail(commit
>> 3fdd89b452c2 prevent it). The scattered pin block cannot be generated by this way,
>> so I did not consider attr->ia_size > i_size case.
>> Do you have some suggestions?
>
>Ah, correct, so what about adding comments here to describe why we don't
>need consider attr->ia_size > i_size case?

OK, I will add comments in next version.

>> 
>>>> +			!IS_ALIGNED(attr->ia_size,
>>>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>>>> +			return -EINVAL;
>>>>  	}
>>>>  
>>>>  	err = setattr_prepare(idmap, dentry, attr);
>> 
>> 
>> 



