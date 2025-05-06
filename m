Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E9B28031C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553412; cv=none; b=TpQSilCDimA20HD0r8RNew6YeXTJOwHDvtKPFcERo4sDs13kFX3mKqyg/fEBdfi3b4Db5riP0Y9MqZtv6PuWsfNujc40lMKdG43GVroOh4BM4CB0mzBiMAFSLf6D/ysY+o1opPh23DoxNmLyx+jmUwgYy3UxNbAv8KeOnC8LKCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553412; c=relaxed/simple;
	bh=mgzNx2JitA8EJLTJpOcjyilT7XTQTJY4X0lnZ5Pikjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7J2C06boF4VpRYj8YLCkrJM5nt8f8f5mSsXXqNZFzVfznIbtyu9jwqs1fgBI9Qoo2PdtuaxsbaOJVSquitIyt9gR9QjDKKJHJUzyBXuJ8K0n0lemkFN0tXqd3p0QZcHVT/DPpfFo3dsj54bPhNnVR4eHxYIvN88Aj2sc+7P6sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UET0dNXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UET0dNXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0863BC4CEE4;
	Tue,  6 May 2025 17:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746553411;
	bh=mgzNx2JitA8EJLTJpOcjyilT7XTQTJY4X0lnZ5Pikjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UET0dNXpBeH8HtAuUVINk3NWN0LU3Z8wLW3KIBn9mdjMubhFzA/t5ngkbr/wS2xIy
	 vUEiIkkIjuCZsc3veDxwvzq5T5cwEzmql8Vw86a3vHrbECd/+Gu1nl045ZJ2c7Hyus
	 uIb0w2mZSzv8ZYfsvlOeqZXOdNBa2I7rzAxGlgLQ=
Date: Tue, 6 May 2025 19:43:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/kernfs: implement STATX_BTIME
Message-ID: <2025050600-economist-display-2d25@gregkh>
References: <20250506164017.249149-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506164017.249149-1-max.kellermann@ionos.com>

On Tue, May 06, 2025 at 06:40:17PM +0200, Max Kellermann wrote:
> This allows finding out when an inode was initially created, for
> example:
> 
> - when was a device plugged in (and its node in sysfs was created)?
> - when was a cgroup created?
> 
> kernfs currently only implements `atime`, `mtime` and `ctime`.  All of
> these are volatile (`mtime` and `ctime` get updated automatically, and
> `atime` can be mainpulated using utime()).  Therefore, I suggest
> implementing STATX_BTIME to have a reliable birth time in userspace.
> 
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  fs/kernfs/dir.c        | 2 ++
>  fs/kernfs/inode.c      | 6 ++++++
>  include/linux/kernfs.h | 7 +++++++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index fc70d72c3fe8..9a6857f2f3d7 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -678,6 +678,8 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
>  			goto err_out3;
>  	}
>  
> +	ktime_get_real_ts64(&kn->btime);
> +
>  	return kn;
>  
>   err_out3:
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index b83054da68b3..1ff2ee62bfe6 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -189,6 +189,12 @@ int kernfs_iop_getattr(struct mnt_idmap *idmap,
>  	struct kernfs_root *root = kernfs_root(kn);
>  
>  	down_read(&root->kernfs_iattr_rwsem);
> +
> +	if (request_mask & STATX_BTIME) {
> +		stat->result_mask |= STATX_BTIME;
> +		stat->btime = kn->btime;
> +	}
> +
>  	kernfs_refresh_inode(kn, inode);
>  	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>  	up_read(&root->kernfs_iattr_rwsem);
> diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> index b5a5f32fdfd1..9332aadf4b48 100644
> --- a/include/linux/kernfs.h
> +++ b/include/linux/kernfs.h
> @@ -229,6 +229,13 @@ struct kernfs_node {
>  	void			*priv;
>  	struct kernfs_iattrs	*iattr;
>  
> +	/*
> +	 * The birth time (for STATX_BTIME).  It lives here and not in
> +	 * struct kernfs_iattrs because the latter is only created on
> +	 * demand, not at actual node birth time.
> +	 */
> +	struct timespec64	btime;

You did just make this structure bigger, which has a real effect on many
systems (think 32bit s390 systems with 30k disks.)  Are you sure this is
really needed?

What userspace tools want this in such that they can not determine this
any other way?  What do they want this information for?  What is going
to depend and require this to warrent it being added like this?

I'm loath to increase the size of this structure just for "it would be
nice" type of things.  We need to see a real user and a real use case
for this please.

And knowing when a device shows up in the system isn't that, sorry, the
kernel log shows that for you already, right?

thanks,

greg k-h
