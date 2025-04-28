Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40533440C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853489; cv=none; b=q/xUrcd5UZko4VD0qTnKS+L1QkZv3BmxLYzW95YmU0zI79VtxcTKyPYlQTYhmTdQ5m84oMoBKQeWIINYCycXGOaY5F5WVMTkEky27bdY6xmQVMriccJUVR+E0B90xrdTDfQ1lNvhw2IKeJIpdiVXw3Tr1UMzFt3bAuCyjmXPUCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853489; c=relaxed/simple;
	bh=0QaZy3x9iZ+hVcd/x8o7A0W/pgFKdMUgTsqmMwkaCSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWRU66Q1ovzR33cVw88ZsubG7Kk0o0rP2DEqVX5nAGltlU+z5iARQM+neeBuTLRpXfZJsubCq2/zXYHPhySPAmw2sdmCPobdAunutVSJ31/gPNTz28UShvjCKGmgtYmZ4yhQmA4BK7KfA1Nv3su3qBTfWe+PaIycAs53Ij7yYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM2D782X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM2D782X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EADEC4CEE4;
	Mon, 28 Apr 2025 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745853489;
	bh=0QaZy3x9iZ+hVcd/x8o7A0W/pgFKdMUgTsqmMwkaCSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OM2D782XSDdLRIq2ieqOHPLD1hOcs5bva6n2UnFdZX8gOZ3pKKgGvTBeNInln1x/C
	 UjVr4X/Lt7irzYQ+a34LIeNhXw2XwCKSF4GPHLlmDFkttVlXFYIhOMvXIKzVtfBQmA
	 ECg6D6Lv1omDioGpP1E76hW4OHtMeNMe0JsYAeVMGAE7D7A2VVprmrNWoNS+LVN34F
	 D4VYfHA9IsMZyJsCTrzXmv4ZaRVTgI+ZPzFUFNcrQqbCWKlb/LdiVOWtCZn08VopT+
	 EKVOLOpW7qDLShNBfYegcH6GAtt+kmQbmRgc42zx16jVe/oJWNb99XrIy/gWX9KQkE
	 fQq97LuMAgDrw==
Date: Mon, 28 Apr 2025 23:17:59 +0800
From: Gao Xiang <xiang@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] erofs: remove unused enum type
Message-ID: <aA+cJ+aMfWdfMBWH@debian>
Mail-Followup-To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org,
	chao@kernel.org, zbestahu@gmail.com, jefflexu@linux.alibaba.com,
	dhavale@google.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250428142631.488431-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428142631.488431-1-lihongbo22@huawei.com>

On Mon, Apr 28, 2025 at 02:26:31PM +0000, Hongbo Li wrote:
> Opt_err is not used in EROFS, we can remove it.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> ---
>  fs/erofs/super.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index c1c350c6fbf4..fd365a611f13 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -356,8 +356,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
>  
>  enum {
>  	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
> -	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
> -	Opt_err
> +	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio

We'd better to leave the trailing ',' so that we don't need to change
this line again if a new line is introduced.

Otherwise LGTM.

Thanks,
Gao Xiang

>  };
>  
>  static const struct constant_table erofs_param_cache_strategy[] = {
> -- 
> 2.22.0
> 
