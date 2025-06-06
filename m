Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D143234;
	Fri,  6 Jun 2025 04:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183908; cv=none; b=E8EfxA9PAdJrXseLLQGT1/Wml8UXeMSXFxu3C1c8xDRvtKRasjAlO4la/ljFOcthC35+hgIEYnS0cx/pU8RiazznVtqIP1uVx80S1M5n+PvXJTI4RzvHIWsMLY06jEG/70cScJRw3fwphTJqD+pi9FozjIPr3VanIVeLQlOML94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183908; c=relaxed/simple;
	bh=jWs0GMla51yiYCkT98ds2y58nfOLoUvbpGt+kdMkuXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+bMOZeGTjGVe+N+hTCWrN29V/vyacuiR9FQI8onyZi334e4qhgaGP8q8e06M4gsQ/DXaSG2RDEhuW3VcP6enmOzpkwV0I/U5COBTAcBHwITJ7tBM7jHJKM9+wY2Trn6OqY+cllkaeP9eBOkGZDE4kBLvHXUBvu/kf2QCM5uTww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=wfmCj/QT; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="wfmCj/QT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+6zkQOBycn4uT+YeUBvYpDwM+Bb5loLxwP/2YHCEYEk=; b=wfmCj/QTQNiEiytDpCOpRd7VAF
	m/+HqmyUkdZK+yI3TWqqoiTR5XycUTfRqgtZPzhJ8xH8mFz/DGqQgLBt/qsooU2og5x8tD3FXAiyZ
	MzO/BonImYGyy2O8vbJ5ilICwRHib3Tmoi9JtvotXF8EnabqAn/Y+Vwz8Kv8H3ltht6Zv8svJShuS
	oD9IYhjIAL2cmFMj5rsuSZIx9EIxG9CQCvyQfEriOuRTfEzEhlpTAIlWJvC8//vJqCf6gWrFRTAI0
	CbLOYtjs2LSxCDIbz0ABo22r71KK0ekv/3LVi7c1uCBiJwEY7EBPsCaab9m82bRPeShKaXw2SB/6h
	Dl+PA+HA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNOdZ-0000000BhLE-41rW;
	Fri, 06 Jun 2025 04:25:02 +0000
Date: Fri, 6 Jun 2025 05:25:01 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Lizhi Xu <lizhi.xu@windriver.com>
Cc: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com,
	almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fs/ntfs3: Add sanity check for file name
Message-ID: <20250606042501.GR299672@ZenIV>
References: <68407923.a00a0220.d8eae.008f.GAE@google.com>
 <20250606035125.1693536-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606035125.1693536-1-lizhi.xu@windriver.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Jun 06, 2025 at 11:51:24AM +0800, Lizhi Xu wrote:
> The length of the file name should be smaller than the directory entry size.
> 
> Reported-by: syzbot+598057afa0f49e62bd23@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=598057afa0f49e62bd23
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  fs/ntfs3/dir.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
> index b6da80c69ca6..b31bc9cbfa35 100644
> --- a/fs/ntfs3/dir.c
> +++ b/fs/ntfs3/dir.c
> @@ -304,6 +304,9 @@ static inline bool ntfs_dir_emit(struct ntfs_sb_info *sbi,
>  	if (sbi->options->nohidden && (fname->dup.fa & FILE_ATTRIBUTE_HIDDEN))
>  		return true;
>  
> +	if (fname->name_len > le16_to_cpu(e->size) - sizeof(struct NTFS_DE))
> +		return true;

And if e->size happens to be e.g. 0?  Note that (unsigned short)0 - sizeof(whatever)
ends up being a large unsigned.

unsigned short gets promoted to int.  sizeof is size_t - whatever it is,
it's an unsigned integer type, with rank no lower than that of int.

Since we have the entire range of unsigned short representable by int on all
architectures we care about, we get unsigned short promoted to int (preserving
the value) and then to size_t (value taken modulo range of size_t, i.e.
the original unsigned short value preserved).  Incidentally, even on a target
where sizeof(unsigned short) == sizeof(int) we'd still get an unsigned result -
unsigned short would be promoted to unsigned int, and mix of two unsigned
integer types gets converted to whichever has the higher rank.

IOW, comparison in
	if (fname->name_len > le16_to_cpu(e->size) - sizeof(struct NTFS_DE))
is going to be an unsigned one.  AFAICS, fname->name_len is u8, so just
turn that check into
	if (sizeof(struct NTFS_DE) + fname->name_len > le16_to_cpu(e->size))
and be done with that - comparison is, again, unsigned, but there's no
possibility of wraparounds in that variant.
