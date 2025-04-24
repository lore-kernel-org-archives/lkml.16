Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAC143C69
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498164; cv=none; b=P21PyHqMEX/DczIDukZqOovm/MgQ/mrma4Yu36N6P0hTIQgsuPj11ASV8/OfoJV8hMytU01/PA0fSAwXNy45vaiCH5M6RXDedYMBSvDOR6cOSPju4hexzdfhpFi686ah73L+HtLaLljt563PAM3Af0SbWdWpJ/cjolNEEJBuIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498164; c=relaxed/simple;
	bh=gyLKJpkdxFDFqRDP2lvYlS2eIaXf05tk+g+rAtKA0d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMPvpHxL4H9gao+LT84CHc0jgG8dZfaNHDrgSKVaFI+tbZwYNZe+UeiDMBk02Lb4e1VZ3vibsTcK9kzHiRKBq5mbrGJCoO3YveUgYcsw2z+lvqgT0Ll9C+r6Pa3UWzILd/6rUBQASBW2KT+Lo+++H7D4meE2f1kPzjO+09611FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnIUHPM7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnIUHPM7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6F4C4CEE3;
	Thu, 24 Apr 2025 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745498163;
	bh=gyLKJpkdxFDFqRDP2lvYlS2eIaXf05tk+g+rAtKA0d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnIUHPM7VI8re50OA8Z/ApWLAC0O2DQikmJ19NUdNGQEjq95/VQPyTfIhVeZRCb5w
	 bpoKIgP5YBgk1QXyAr+Clmk4dFXvxdhVMpjYr3wsr1+JKZ2u/bhrzM3Rizh/GabeOW
	 hedqdmj87qCznU4Tr17xoYbGQPqUKdphyV4bu9gcyQdDh+Jb2OVstyYk2gB33h8V83
	 fcWL1KNLTHAx3yyAeJ+pRPb7NWx7BvIR5kK44qs4LRGP/TpYttiTyBL10yww3xiMjj
	 REnHhnriFl3mmOILl4yoj0QzPPb/jaV/dRluQGN1h1ydFYpxlGN0biwAVAH56+CtBp
	 NLf7rFbc48Fwg==
Date: Thu, 24 Apr 2025 20:35:57 +0800
From: Gao Xiang <xiang@kernel.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: xiang@kernel.org, chao@kernel.org, huyue2@coolpad.com,
	jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: erofs: add myself as reviewer
Message-ID: <aAowLQIqX8qq68SV@debian>
Mail-Followup-To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org,
	chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com,
	dhavale@google.com, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
References: <20250424030653.3308358-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424030653.3308358-1-lihongbo22@huawei.com>

On Thu, Apr 24, 2025 at 11:06:53AM +0800, Hongbo Li wrote:
> I have a solid background in file systems and since much of my
> recent work has focused on EROFS, I am familiar with it. Now I
> have the time and am willing to help review EROFS patches.
> 
> I hope my participation can be helpful to the EROFS patch review
> process.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Sounds good to me.  Thanks for your interest for
reviewing EROFS patches:

Acked-by: Gao Xiang <xiang@kernel.org>

Thanks,
Gao Xiang

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..f286c96ea7db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8719,6 +8719,7 @@ M:	Chao Yu <chao@kernel.org>
>  R:	Yue Hu <zbestahu@gmail.com>
>  R:	Jeffle Xu <jefflexu@linux.alibaba.com>
>  R:	Sandeep Dhavale <dhavale@google.com>
> +R:	Hongbo Li <lihongbo22@huawei.com>
>  L:	linux-erofs@lists.ozlabs.org
>  S:	Maintained
>  W:	https://erofs.docs.kernel.org
> -- 
> 2.34.1
> 
> 
