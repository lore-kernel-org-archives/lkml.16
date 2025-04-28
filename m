Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC244256D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853370; cv=none; b=OUFwYqjd+jTHsNq8VRtIsV0AYGTouzk0667QTsSipuIPFzU16WKkDvXoQKf9o/on0+4D17Ro9gb4JkC4ywXbyI53LjUYFU4eDNFlwuCaitbvNupUfYSyQQFRqRH7NCvonjpfgCj1yvsioN3jkiivmiP8sAkHubzgCFotF26UvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853370; c=relaxed/simple;
	bh=ixHI9t3N23ED6dDVYDV0WmtU+0Xqf66gQA70/o/CM7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojrjZr48zIP58LDchMzyN/7KYmg5G0xzVKODQoFPOJkrjXN4vFczXHF1454vLZzCfOYvfyYPTEtIyotr5ZRPGZfbbOQFYUV1rW5U434IGktoujDStmDmgrdBNJioTOHNJd/4whRWrOP5lE114O7zTrK7mh52JJvuYDTC2AGHBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5VwCP2e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5VwCP2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71A1C4CEE4;
	Mon, 28 Apr 2025 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745853370;
	bh=ixHI9t3N23ED6dDVYDV0WmtU+0Xqf66gQA70/o/CM7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h5VwCP2eCrsMhRGLALQAhjED1V4kxIWySGNE/2hR2rK7E+iVDift/Qqex+2NtL+y9
	 wXydoh+a9z/bv7/ANuvmGqCeYVoTZUxPWy1S9S8PG6BcCaI/3zaoUEt8lLPaJkiQFh
	 XrIH5qNzoEVvPc/Y5gQ8oVdS8ODxaeKB1XgxcTUhIz718uROh69XESoTAlp72kdVVh
	 7g89J/0BnEH07Nj8NR8IaSosWylRB5gI/HZ36jx0RVRIeGzyUVLbv+TrecvbJmufjG
	 xCXdU9OLkVP4F3bYZjeMhyYo2UVnrV95OX1ACeKy6ecvgEo7gVFGbJZsxNesNNVYWl
	 TarGHbdtH1nuw==
Date: Mon, 28 Apr 2025 23:16:03 +0800
From: Gao Xiang <xiang@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: reject unknown option if it is not supported
Message-ID: <aA+bsw09PHTQWUXK@debian>
Mail-Followup-To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org,
	chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
	dhavale@google.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250428142545.484818-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428142545.484818-1-lihongbo22@huawei.com>

On Mon, Apr 28, 2025 at 02:25:45PM +0000, Hongbo Li wrote:
> Some options are supported depending on different compiling config,
> and these option will not fail during mount if they are not
> supported. This is very weird, so we can reject them if they are
> not supported.
> 

If it's an invalid option, we should reject it immediately.

But for unsupported options, I don't think we always error
out. e.g. for some options like (acl, noacl) ext4 will just
ignore if ACL is unsupported.

I think EROFS should follows that, otherwise users might use
"noacl" to disable ACL explicitly, but it will fail unexpectedly
if unsupported.

But I agree that for "fsid", "domain_id" and "directio", we
could error out instead.

> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  fs/erofs/super.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index cadec6b1b554..c1c350c6fbf4 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -374,16 +374,26 @@ static const struct constant_table erofs_dax_param_enums[] = {
>  };
>  
>  static const struct fs_parameter_spec erofs_fs_parameters[] = {
> +#ifdef CONFIG_EROFS_FS_XATTR
>  	fsparam_flag_no("user_xattr",	Opt_user_xattr),
> +#endif

Another thing is that I'm not sure if "user_xattr" option is really
needed, we might just kill this option since all recent fses don't
have such configuration and user_xattrs should be supported by default.

Thanks,
Gao Xiang
