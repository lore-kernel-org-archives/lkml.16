Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2741D54D8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607561; cv=none; b=pkE11YVEj2IhbUxusz3cgJHESLBAIJMXueLIq7ASdx+GtopoAbRCARqrFYqgaiDlrO/ixMMQ0TJf07XcfWTWGxlY5nO8/9U//QFE+Ef2NbEa/QHlJ6zQ0NWnx9bmBicQAGvWvaAASTxfmwi8yWFu+UG/a5EujAq2OX9UW66a6CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607561; c=relaxed/simple;
	bh=1x9Y2xzjdl5evVpQRvkE8ycT0USK9P4w2fY5lk4AfTM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri7Y/qR+nq+OzJ4PnZ5nTNxWA14YRtFcIO9SVmSFtJTY5l9JUOhlf3XkiCU0NjooGcJKHSAoLoG04FwdQuy74xG7Oevu0dVw2R8J/rx20h8ZMHfR5EnbTu/XP5suJ+aIpdckc80XsczxEu/vCuUWKKkEeJ702BbRTL9Ye8cw3A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmjK/UxD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmjK/UxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5A1C4CED2;
	Mon,  3 Feb 2025 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607559;
	bh=1x9Y2xzjdl5evVpQRvkE8ycT0USK9P4w2fY5lk4AfTM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rmjK/UxDqgxhCkLC2sZ2ltCRWD1d1nJlqZrTVsftQhGh6xVzR2HuY032P0SpEaZMK
	 wGAX9v4w7Q4qRTgfJfPZ25YCIm7OD28kF5km8CJ+h0BoeAYFHvhLMMSvb3jjt7QwnM
	 iAkzTDVPCbCG/dA3kp9Cenamhp7N1XbFq4B4aSbtm3iZmVAeiLBcsPVN2IjBakE5xT
	 7K8JAjYeuIZvOVbsu9EeKWh3GLaBNio65FYG+pp1Vu3KCGzQbReiHlPksP3PYwybEl
	 T2keFdajw2YdX418++zz0/l+Iy7Ohtcb9KklW/W7hfJS0NRMQ2DDelRwBCWapkBkbL
	 4nME1PzeSpztw==
Date: Mon, 3 Feb 2025 18:32:37 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH 1/2] f2fs: don't kobject_put in the error case
Message-ID: <Z6ELxSbeYXaKIhNo@google.com>
References: <20250131222457.1634039-1-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131222457.1634039-1-jaegeuk@kernel.org>

I checked this patch is wrong. Sorry for the noise.

On 01/31, Jaegeuk Kim wrote:
> Fix a wrong kobject_put in the error path.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/sysfs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index d15c68b28952..001e97cd0a96 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1605,7 +1605,7 @@ int __init f2fs_init_sysfs(void)
>  	ret = kobject_init_and_add(&f2fs_feat, &f2fs_feat_ktype,
>  				   NULL, "features");
>  	if (ret)
> -		goto put_kobject;
> +		goto unregister_out;
>  
>  	f2fs_proc_root = proc_mkdir("fs/f2fs", NULL);
>  	if (!f2fs_proc_root) {
> @@ -1616,6 +1616,7 @@ int __init f2fs_init_sysfs(void)
>  	return 0;
>  put_kobject:
>  	kobject_put(&f2fs_feat);
> +unregister_out:
>  	kset_unregister(&f2fs_kset);
>  	return ret;
>  }
> -- 
> 2.48.1.362.g079036d154-goog
