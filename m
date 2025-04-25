Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4F42AA5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547564; cv=none; b=LCjfPuJofPixfehIzt+OhypfvwZNcFGr01i9mzCXE1/9b4YioYo112C7n/lskkwgkDW+eWjEFrUt0ShYQFa2Ct6cd2Pp5TFyNi5aimoLqjGFgZ36njc8Tz+g+QnUODgWpNjxaOdpES4RvSS7JJ5bPDEZwXtDbFck5ql7plXbtiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547564; c=relaxed/simple;
	bh=D3m7qL1UU5oxx2HKR2qPUQh0EXxSExFwEK7uyQNho90=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QqMm94DQkfClixAHiHFum2p2GMML8ocJ0beTPT8mjaaZtRCNgpfrTbj+IqU9u2+YIUfbc8L59OVaHu6OiMFnF5tM31iwhbaRWNCoOm0SrTAyUqmxCG40BRWpvP5i6vbI8KG6kPGFKFUyjERbod/F+k0yktTN/vLfkYv+/icRXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id82FmGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id82FmGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AD0C4CEE3;
	Fri, 25 Apr 2025 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547564;
	bh=D3m7qL1UU5oxx2HKR2qPUQh0EXxSExFwEK7uyQNho90=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Id82FmGSTee/K0fqbKXLy0lTRJBK78+6/TS/74IOF/FJ88foBG79MFK7M2dSH7MGW
	 ZQ6YQRXK/9KDgmp2xo+33T8gL8YfisDLdFSFSXr+SI0Y2RcYzXc6zECGg4Ye4MRHfl
	 ZiCHyPSqarP3TTgz+sH53Hr+vjo8zTbz+OPE6NAVRaiOIACPXg/CY0cKwdPbhloSEO
	 +3rKdr+iU+2388BClBmv6nbjsrLY8tG9g+uJz+lPDKAGva9YD0pvePQluEI2tygsqL
	 nlFOBhlaHRer4oQ6epw0Kca+xDE41pbmer+dSI+ZisiQLRsRuPFgnuv05DzXKzCxmv
	 0mLNcJB+JkhLQ==
Message-ID: <b6e395c8-207b-4b52-bd52-42e54bb9b902@kernel.org>
Date: Fri, 25 Apr 2025 10:19:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, dhavale@google.com, linux-erofs@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: erofs: add myself as reviewer
To: Hongbo Li <lihongbo22@huawei.com>, xiang@kernel.org, huyue2@coolpad.com,
 jefflexu@linux.alibaba.com
References: <20250424030653.3308358-1-lihongbo22@huawei.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250424030653.3308358-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 11:06, Hongbo Li wrote:
> I have a solid background in file systems and since much of my
> recent work has focused on EROFS, I am familiar with it. Now I
> have the time and am willing to help review EROFS patches.
> 
> I hope my participation can be helpful to the EROFS patch review
> process.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Cool, glad to hear the good news!

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

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

