Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4C41D5ABF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912429; cv=none; b=XsMSOJuULTW+Eoth9KpUiyMnNmKMSwiOYvOmNoyOS/fas5dI5evVKad2VanGMPbQA7fEm08+sWmlJkkoKJdd+iNoOifOU/ZlxpH0GZsCFJ5qJdPVDikrvqxdNzCZyXOPRWU5IPVWcB5uajbZPdjluu8X944mc5o++b2jS/VX1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912429; c=relaxed/simple;
	bh=9CZ9C64iy9gpNghezOO0bJwU4JnKzP9cRlgi4QtoiWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VCMxzSdCtkgvjc61Qxq18pFiW6N3MeG4cLybzObZBpQm18cgbutpglyI9KZvCK+cfEv+Xhpw+nzXj5CS93FL0q037WIVaZtEsolHsh7p9NDliUpnqJGayij6vOE6r4sOcT8BWuP0axRWpUP83rokbXo8zpZZ6JlUSivRtAaME5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZmsZP3nPnz69cn;
	Tue, 29 Apr 2025 15:36:29 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A85D1402ED;
	Tue, 29 Apr 2025 15:40:23 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 kwepemo500009.china.huawei.com (7.202.194.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Apr 2025 15:40:22 +0800
Message-ID: <5a0e7980-e0a0-4e43-9ec9-c771e63f502c@huawei.com>
Date: Tue, 29 Apr 2025 15:40:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] erofs: encode file handle with the internal helpers
Content-Language: en-US
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>, <dhavale@google.com>,
	<linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20250429011139.686847-1-lihongbo22@huawei.com>
 <aBBH+Wrwa1xXFGmo@debian>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <aBBH+Wrwa1xXFGmo@debian>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)



On 2025/4/29 11:31, Gao Xiang wrote:
> Hi Hongbo,
> 
> I think the subject can be updated as:
> `erofs-utils: fix file handle encoding for 64-bit NIDs`
> 
> On Tue, Apr 29, 2025 at 01:11:39AM +0000, Hongbo Li wrote:
>> In erofs, the inode number has the location information of
>> files. The default encode_fh uses the ino32, this will lack
>> of some information when the file is too big. So we need
>> the internal helpers to encode filehandle.
>>
>> Since i_generation in EROFS is not used, here we only encode
>> the nid into file handle when it is exported. So it is easy
>> to parse the dentry from file handle.
> 
> If `FILEID_INO64_GEN_PARENT` is used, I don't think
> the generation number should be emitted, as documented as:
> 
Ok, thanks for reviewing. I will change this in later version.
> `
> /*
>   * 64 bit inode number, 32 bit generation number.
>   */
> FILEID_INO64_GEN = 0x81,
> 
> /*
>   * 64 bit inode number, 32 bit generation number,
>   * 64 bit parent inode number, 32 bit parent generation.
>   */
> FILEID_INO64_GEN_PARENT = 0x82,
> `
> 
> Even the generation number is 0 but we might use
> i_generation for some remote update use cases
> in the future.
> 
>>
>> It is easy to reproduce test:
>>    1. prepare an erofs image with nid bigger than UINT_MAX
>>    2. mount -t erofs foo.img /mnt/erofs
>>    3. set exportfs with configuration: /mnt/erofs *(rw,sync,
>>       no_root_squash)
>>    4. mount -t nfs $IP:/mnt/erofs /mnt/nfs
>>    5. md5sum /mnt/nfs/foo # foo is the file which nid bigger
>>       than UINT_MAX.
>> For overlayfs case, the under filesystem's file handle is
>> encoded in ovl_fb.fid, it is same as NFS's case.
> 
> Can we have a way to add a testcase for the overlayfs case:
> since it's somewhat complex to write a testcase with nfs
> above.
> 
Yeah, I have a testcase can test this:

mount -t erofs foo.img /mnt/erofs
mount -t overlay overlay -o 
lowerdir=/mnt/erofs,upperdir=/mnt/upper,workdir=/mnt/work merged
chmod 666 merged/foo        # trigger copy-up
echo 2 > /proc/sys/vm/drop_caches  # avoid the dcache
md5sum merged/foo

>>
>> Fixes: 3e917cc305c6 ("erofs: make filesystem exportable")
>> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
>> ---
>>   fs/erofs/super.c | 51 ++++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 43 insertions(+), 8 deletions(-)
>>
>> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
>> index cadec6b1b554..8f787c47e04d 100644
>> --- a/fs/erofs/super.c
>> +++ b/fs/erofs/super.c
>> @@ -511,24 +511,59 @@ static int erofs_fc_parse_param(struct fs_context *fc,
>>   	return 0;
>>   }
>>   
>> -static struct inode *erofs_nfs_get_inode(struct super_block *sb,
>> -					 u64 ino, u32 generation)
>> +static int erofs_encode_fh(struct inode *inode, u32 *fh, int *max_len,
>> +			   struct inode *parent)
>>   {
>> -	return erofs_iget(sb, ino);
>> +	int len = parent ? 4 : 2;
>> +	erofs_nid_t nid;
>> +
>> +	if (*max_len < len) {
>> +		*max_len = len;
>> +		return FILEID_INVALID;
>> +	}
>> +
>> +	nid = EROFS_I(inode)->nid;
>> +	fh[0] = (u32)(nid >> 32);
>> +	fh[1] = (u32)(nid & 0xffffffff);
>> +
>> +	if (parent) {
>> +		nid = EROFS_I(parent)->nid;
>> +
>> +		fh[2] = (u32)(nid >> 32);
>> +		fh[3] = (u32)(nid & 0xffffffff);
>> +	}
>> +
>> +	*max_len = len;
>> +	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
>>   }
>>   
>>   static struct dentry *erofs_fh_to_dentry(struct super_block *sb,
>>   		struct fid *fid, int fh_len, int fh_type)
>>   {
>> -	return generic_fh_to_dentry(sb, fid, fh_len, fh_type,
>> -				    erofs_nfs_get_inode);
>> +	erofs_nid_t nid;
>> +
>> +	if ((fh_type != FILEID_INO64_GEN &&
>> +	     fh_type != FILEID_INO64_GEN_PARENT) || fh_len < 2)
>> +		return NULL;
>> +
>> +	nid = (u64) fid->raw[0] << 32;
>> +	nid |= (u64) fid->raw[1];
>> +
> 
> Redundant new line.
> 
I will remove this in later version.

Thanks,
Hongbo

>> +	return d_obtain_alias(erofs_iget(sb, nid));
>>   }
>>   
>>   static struct dentry *erofs_fh_to_parent(struct super_block *sb,
>>   		struct fid *fid, int fh_len, int fh_type)
>>   {
>> -	return generic_fh_to_parent(sb, fid, fh_len, fh_type,
>> -				    erofs_nfs_get_inode);
>> +	erofs_nid_t nid;
>> +
>> +	if (fh_type != FILEID_INO64_GEN_PARENT || fh_len < 4)
>> +		return NULL;
>> +
>> +	nid = (u64) fid->raw[2] << 32;
>> +	nid |= (u64) fid->raw[3];
>> +
> 
> Same here.
> 
> Thanks,
> Gao Xiang
