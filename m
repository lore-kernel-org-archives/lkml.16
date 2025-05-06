Received: from out199-5.us.a.mail.aliyun.com (out199-5.us.a.mail.aliyun.com [47.90.199.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A06233739
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544271; cv=none; b=YR4d0RcwmQodlv9nBVM27hCEaEABNauIm5QqJQ5AS4fB2m5xiee12Rx8ubEVIXRv3A5KFbVhPmf+Kgz4sO6GmIQXgov27fwRfughEo2lW4CIkSXHntr+NLY+TIMc8PHoWrEtpGUtstFEvdU3ZeagKpbe90OzlMMpl5Slms8fm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544271; c=relaxed/simple;
	bh=kqnJHCTnpiPV6uFsP81VUdMxyHCGniWXLDM3rG5nMfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXf2ccecYUXnQ9W6FFe/c6HPtgSNma2DwRYu6oZuycOHxrExbQKiJmUPXoCKVxmBkwusy8F7PtBx69n9r1bmj5yA2zYLa9w3Bx/TajhS0455u+YULCqey21h4kXacCENPlFdMdWYgvp3JDUj5HOAq2pLOkqkY06jBfhJmNAH6ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rgak4S/y; arc=none smtp.client-ip=47.90.199.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rgak4S/y"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746544250; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=GeNymH+klft7mdhfQZi/jBImRDyPtAkJHpdNSIxr5aI=;
	b=rgak4S/yh9CVLgPGtSyJXKNGQSAVctpBGAhPAqhXNuL8cr6VJvcAFECbrqR6sEad+KmC/qXOvx6L5lOabrFhxGxlz7Yo+JMKB7/sQSYVNMnNdZKX870HuZZOWYymOx3612IERYfNaCJmHc6cB2bjSeZiCpqwlieseyD/6wVydAs=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZYPgkD_1746544248 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 06 May 2025 23:10:49 +0800
Message-ID: <18d272ce-6a80-4fdc-b67b-ddc2ffa522d4@linux.alibaba.com>
Date: Tue, 6 May 2025 23:10:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: fix file handle encoding for 64-bit NIDs
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, chao@kernel.org,
 zbestahu@gmail.com, jefflexu@linux.alibaba.com
Cc: dhavale@google.com, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250429134257.690176-1-lihongbo22@huawei.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250429134257.690176-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hongbo,

On 2025/4/29 21:42, Hongbo Li wrote:
> In erofs, the inode number has the location information of
> files. The default encode_fh uses the ino32, this will lack
> of some information when the file is too big. So we need
> the internal helpers to encode filehandle.

EROFS uses NID to indicate the on-disk inode offset, which can
exceed 32 bits. However, the default encode_fh uses the ino32,
thus it doesn't work if the image is large than 128GiB.

Let's introduce our own helpers to encode file handles.

> 
> It is easy to reproduce test:

It's easy to reproduce:

>    1. prepare an erofs image with nid bigger than UINT_MAX

      1. Prepare an EROFS image with NIDs larger than U32_MAX

>    2. mount -t erofs foo.img /mnt/erofs
>    3. set exportfs with configuration: /mnt/erofs *(rw,sync,
>       no_root_squash)
>    4. mount -t nfs $IP:/mnt/erofs /mnt/nfs
>    5. md5sum /mnt/nfs/foo # foo is the file which nid bigger
>       than UINT_MAX.
> For overlayfs case, the under filesystem's file handle is
> encoded in ovl_fb.fid, it is same as NFS's case.
> 
> Fixes: 3e917cc305c6 ("erofs: make filesystem exportable")
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
> v2: https://lore.kernel.org/all/20250429074109.689075-1-lihongbo22@huawei.com/
>    - Assign parent nid with correct value.
> 
> v1: https://lore.kernel.org/all/20250429011139.686847-1-lihongbo22@huawei.com/
>     - Encode generation into file handle and minor clean code.
>     - Update the commiti's title.
> ---
>   fs/erofs/super.c | 54 +++++++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index cadec6b1b554..28b3701165cc 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -511,24 +511,62 @@ static int erofs_fc_parse_param(struct fs_context *fc,
>   	return 0;
>   }
>   
> -static struct inode *erofs_nfs_get_inode(struct super_block *sb,
> -					 u64 ino, u32 generation)
> +static int erofs_encode_fh(struct inode *inode, u32 *fh, int *max_len,
> +			   struct inode *parent)
>   {
> -	return erofs_iget(sb, ino);
> +	int len = parent ? 6 : 3;
> +	erofs_nid_t nid;

Just `erofs_nid_t nid = EROFS_I(inode)->nid;`?

I think the compiler will optimize out `if (*max_len < len)`.

> +	u32 generation;

It seems it's unnecessary to introduce `generation` variable here?

> +
> +	if (*max_len < len) {
> +		*max_len = len;
> +		return FILEID_INVALID;
> +	}
> +
> +	nid = EROFS_I(inode)->nid;
> +	generation = inode->i_generation;

So drop these two lines.

> +	fh[0] = (u32)(nid >> 32);
> +	fh[1] = (u32)(nid & 0xffffffff);
> +	fh[2] = generation;
> +
> +	if (parent) {
> +		nid = EROFS_I(parent)->nid;
> +		generation = parent->i_generation;
> +
> +		fh[3] = (u32)(nid >> 32);
> +		fh[4] = (u32)(nid & 0xffffffff);
> +		fh[5] = generation;

		fh[5] = parent->i_generation;

> +	}
> +
> +	*max_len = len;
> +	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
>   }
>   
>   static struct dentry *erofs_fh_to_dentry(struct super_block *sb,
>   		struct fid *fid, int fh_len, int fh_type)
>   {
> -	return generic_fh_to_dentry(sb, fid, fh_len, fh_type,
> -				    erofs_nfs_get_inode);
> +	erofs_nid_t nid;
> +
> +	if ((fh_type != FILEID_INO64_GEN &&
> +	     fh_type != FILEID_INO64_GEN_PARENT) || fh_len < 3)
> +		return NULL;
> +
> +	nid = (u64) fid->raw[0] << 32;
> +	nid |= (u64) fid->raw[1];

Unnecessary nid variable.

> +	return d_obtain_alias(erofs_iget(sb, nid));

	return d_obtain_alias(erofs_iget(sb,
			((u64)fid->raw[0] << 32) | fid->raw[1]));

>   }
>   
>   static struct dentry *erofs_fh_to_parent(struct super_block *sb,
>   		struct fid *fid, int fh_len, int fh_type)
>   {
> -	return generic_fh_to_parent(sb, fid, fh_len, fh_type,
> -				    erofs_nfs_get_inode);
> +	erofs_nid_t nid;
> +
> +	if (fh_type != FILEID_INO64_GEN_PARENT || fh_len < 6)
> +		return NULL;
> +
> +	nid = (u64) fid->raw[3] << 32;
> +	nid |= (u64) fid->raw[4];

Same here.

Thanks,
Gao Xiang
