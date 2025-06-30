Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1709679D2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254903; cv=none; b=qYg603z9MY/e4BWTsQ8OkvU0lC2xd6396naRq2nftQWBwgovrPV3jafM5Sdfb1dFpDryYOjR6dV4Oq4QtK+ycs9+5XLsofZq1eKsHFJ1LjRHzdnqSBy3dpDSdHWtAGbM43IjJZedfkqH4o1FHgfh8yqjriBiR+06U6NW+lc8cPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254903; c=relaxed/simple;
	bh=csJVVF3ysLWf9LBqtyneSoacKYIJeT/DH5w1ddjGNfw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hUa3deneaWp9uN6dhLLN+hl9gbFZP9Gm/WSJ0cGXb6DulOESxFTxwbKvHNOtRBtGpxAROXMzf/RvVoRhH4Jesg+WZXVm9gg1HFxRFVAe8yyWFOoZNfs7NX4/Pm8rIMfML/eqD9dpJEkXXRC37WfwB2SGCgieUprrpH3gEZsnbP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA03pMVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA03pMVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67393C4CEEB;
	Mon, 30 Jun 2025 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751254902;
	bh=csJVVF3ysLWf9LBqtyneSoacKYIJeT/DH5w1ddjGNfw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=PA03pMVew+3YX65tpjwgdFfIs6mL2WK9aPsq9RPuVkwvgHu83XjRiqZqINItjcdAa
	 VVlJ3m1UGMwmHv3Iqi+yuBzU6awpY2k78GEbVYo31DxWrqII4yGhNzvUajXerucFTP
	 GRlLR+eUdilde3McF+gCFR3KGHqBmsGcQX4q2hgUpGtlXsX1Bp9jbLnF4GdkjSt4RH
	 lWfCPcdcNHwdVRuwcey+b5QSmfmQ/2eceMS8Psim6QGelsi/nLcdZUwYd01pISFKbi
	 HyqC85lQ2cSZdEeVmMtIIFkFZI9Hy+0Yj5B6+0wBMJxscVoVn+JP9GpynXtHCeQtWa
	 yVyANUYeHXE9A==
Message-ID: <3c0d3d19-58b2-4702-b42b-1df7985def74@kernel.org>
Date: Mon, 30 Jun 2025 11:41:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, feng.han@honor.com, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation
 to smaller/equal size on pinned file
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
 <20250630025023.3876706-1-wangzijie1@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250630025023.3876706-1-wangzijie1@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 10:50, wangzijie wrote:
>> On 6/24/25 11:59, wangzijie wrote:
>>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>>> to smaller or equal size on pinned file. But for truncation to larger size, after
>>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>>> we only support overwrite IO to pinned file, so we don't need to consider
>>> attr->ia_size > i_size case.
>>
>> Zijie, can you take a look generic/494? suspect that it is caused by this change.
>>
>> generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
>>    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
>>    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
>>    @@ -2,7 +2,7 @@
>>     Format and mount
>>     Initialize file
>>     Try to truncate
>>    -ftruncate: Text file busy
>>    +ftruncate: Invalid argument
>>     Try to punch hole
>>     fallocate: Text file busy
>>    ...
>>    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
>> Ran: generic/494
>> Failures: generic/494
>> Failed 1 of 1 tests
>>
>> Thanks,
> 
> Hi, Chao
> generic/494 swapon file and try to ftruncate.
> 
> Before this change
> swap_acticate:
> set_inode_flag(inode, FI_PIN_FILE)
> 
> ftruncate:
> setattr_prepare
> -inode_newsize_ok
> --return -ETXTBSY for SWAPFILE
> 
> After this change:
> swap_acticate:
> set_inode_flag(inode, FI_PIN_FILE)
> 
> ftruncate: 
> prevent unaligned truncation before setattr_prepare()
> return -EINVAL
> 
> Sorry for this. Maybe I should apply this check after setattr_prepare()? Or do

Check after setattr_prepare() looks fine to me, in addition, can you please add
more comments for the reason why we relocate code there?

Thanks,

> you have some suggestions?
> 
> 
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>> v4:
>>> - convert sbi first and apply change
>>> ---
>>>  fs/f2fs/file.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 209f43653..4809f0fd6 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>  			!IS_ALIGNED(attr->ia_size,
>>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>>  			return -EINVAL;
>>> +		/*
>>> +		 * To prevent scattered pin block generation, we don't allow
>>> +		 * smaller/equal size unaligned truncation for pinned file.
>>> +		 * We only support overwrite IO to pinned file, so don't
>>> +		 * care about larger size truncation.
>>> +		 */
>>> +		if (f2fs_is_pinned_file(inode) &&
>>> +			attr->ia_size <= i_size_read(inode) &&
>>> +			!IS_ALIGNED(attr->ia_size,
>>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>>> +			return -EINVAL;
>>>  	}
>>>  
>>>  	err = setattr_prepare(idmap, dentry, attr);
> 

