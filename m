Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DA078F29
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897475; cv=none; b=YPXK6okrp/MeNBPXv4ED14/KZE31kQRg+5whj5uDff6828NeAHQs1fXcPJHv/BwExVvGXsyz3/2U0NjheGZ3rxHyifDYqC17kC+HpFFxomp4u/dT371zCzomVcGXOiiqoarKz9zkfZ2m9CbKSzC4gboLGpFtdvpZmgbBPAycGF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897475; c=relaxed/simple;
	bh=CuL+YpcnQKY0haqmcdUS5IRj6Y2DmxCYuPRov7XSKeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+PAwJ4EMaAz3t7nPLhYddxo1Zftx5VukKaRm2yEugkC3hF0mjYrCExjjtAZffk8gkh1t/Bb/bKoUHw9GSpeIkDbOkpeWltBoVa7aEvQZXik5OVtCgVQDqW1gVHg2lV6pNOecz33rgbdAKd4Z+FUEskw3b9ZivTlDtCgadireeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIEuhtQ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIEuhtQ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBD5C4CEE3;
	Tue, 29 Apr 2025 03:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745897475;
	bh=CuL+YpcnQKY0haqmcdUS5IRj6Y2DmxCYuPRov7XSKeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dIEuhtQ+D06yhlDPd6yZl46Dnjate2a62MZZ63YCcohRNIRPPn2OsBVVldNIcKfQJ
	 0cO7oYXa3CQWMgvBZejTvQ7nYn+QUjJ/r6YhuvzhbeydVKqneLGXS2h0eW9itxwre3
	 mQ5c3E64QGvphmTwEuGYP3DbeXJ9Si4/q94t9iyv9Le3DypRJWBcOF/Ti19ErpGnej
	 BXTqtk6hLresQcxJn3cJsqzLA802Q8vRX998aAlw5eGaf66mzsQIOSH383RJVkjvze
	 F0KgCeeL2FmsT3IIFLgmktCMsAXXqQ8YzmJe/lW0SEAwD5IpBtMsQ7Jh+dRe4AFhJl
	 ZfcuekcpExWbw==
Date: Tue, 29 Apr 2025 11:31:05 +0800
From: Gao Xiang <xiang@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: encode file handle with the internal helpers
Message-ID: <aBBH+Wrwa1xXFGmo@debian>
Mail-Followup-To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org,
	chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
	dhavale@google.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250429011139.686847-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429011139.686847-1-lihongbo22@huawei.com>

Hi Hongbo,

I think the subject can be updated as:
`erofs-utils: fix file handle encoding for 64-bit NIDs`

On Tue, Apr 29, 2025 at 01:11:39AM +0000, Hongbo Li wrote:
> In erofs, the inode number has the location information of
> files. The default encode_fh uses the ino32, this will lack
> of some information when the file is too big. So we need
> the internal helpers to encode filehandle.
> 
> Since i_generation in EROFS is not used, here we only encode
> the nid into file handle when it is exported. So it is easy
> to parse the dentry from file handle.

If `FILEID_INO64_GEN_PARENT` is used, I don't think
the generation number should be emitted, as documented as:

`
/*
 * 64 bit inode number, 32 bit generation number.
 */
FILEID_INO64_GEN = 0x81,

/*
 * 64 bit inode number, 32 bit generation number,
 * 64 bit parent inode number, 32 bit parent generation.
 */
FILEID_INO64_GEN_PARENT = 0x82,
` 

Even the generation number is 0 but we might use
i_generation for some remote update use cases
in the future.

> 
> It is easy to reproduce test:
>   1. prepare an erofs image with nid bigger than UINT_MAX
>   2. mount -t erofs foo.img /mnt/erofs
>   3. set exportfs with configuration: /mnt/erofs *(rw,sync,
>      no_root_squash)
>   4. mount -t nfs $IP:/mnt/erofs /mnt/nfs
>   5. md5sum /mnt/nfs/foo # foo is the file which nid bigger
>      than UINT_MAX.
> For overlayfs case, the under filesystem's file handle is
> encoded in ovl_fb.fid, it is same as NFS's case.

Can we have a way to add a testcase for the overlayfs case:
since it's somewhat complex to write a testcase with nfs
above.

> 
> Fixes: 3e917cc305c6 ("erofs: make filesystem exportable")
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  fs/erofs/super.c | 51 ++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index cadec6b1b554..8f787c47e04d 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -511,24 +511,59 @@ static int erofs_fc_parse_param(struct fs_context *fc,
>  	return 0;
>  }
>  
> -static struct inode *erofs_nfs_get_inode(struct super_block *sb,
> -					 u64 ino, u32 generation)
> +static int erofs_encode_fh(struct inode *inode, u32 *fh, int *max_len,
> +			   struct inode *parent)
>  {
> -	return erofs_iget(sb, ino);
> +	int len = parent ? 4 : 2;
> +	erofs_nid_t nid;
> +
> +	if (*max_len < len) {
> +		*max_len = len;
> +		return FILEID_INVALID;
> +	}
> +
> +	nid = EROFS_I(inode)->nid;
> +	fh[0] = (u32)(nid >> 32);
> +	fh[1] = (u32)(nid & 0xffffffff);
> +
> +	if (parent) {
> +		nid = EROFS_I(parent)->nid;
> +
> +		fh[2] = (u32)(nid >> 32);
> +		fh[3] = (u32)(nid & 0xffffffff);
> +	}
> +
> +	*max_len = len;
> +	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
>  }
>  
>  static struct dentry *erofs_fh_to_dentry(struct super_block *sb,
>  		struct fid *fid, int fh_len, int fh_type)
>  {
> -	return generic_fh_to_dentry(sb, fid, fh_len, fh_type,
> -				    erofs_nfs_get_inode);
> +	erofs_nid_t nid;
> +
> +	if ((fh_type != FILEID_INO64_GEN &&
> +	     fh_type != FILEID_INO64_GEN_PARENT) || fh_len < 2)
> +		return NULL;
> +
> +	nid = (u64) fid->raw[0] << 32;
> +	nid |= (u64) fid->raw[1];
> +

Redundant new line.

> +	return d_obtain_alias(erofs_iget(sb, nid));
>  }
>  
>  static struct dentry *erofs_fh_to_parent(struct super_block *sb,
>  		struct fid *fid, int fh_len, int fh_type)
>  {
> -	return generic_fh_to_parent(sb, fid, fh_len, fh_type,
> -				    erofs_nfs_get_inode);
> +	erofs_nid_t nid;
> +
> +	if (fh_type != FILEID_INO64_GEN_PARENT || fh_len < 4)
> +		return NULL;
> +
> +	nid = (u64) fid->raw[2] << 32;
> +	nid |= (u64) fid->raw[3];
> +

Same here.

Thanks,
Gao Xiang
