Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E5E176ADE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904810; cv=none; b=TuPJNICCnf3X3e66s9ExTAtg8GKRSibFDc4y1Kp+Oaoeo5KQ3/tb4LQ18Jkt7zID1+lwGzuLGAQOpappYxDo0ROVpLPVQAsvRVcyorviBr8QMwM3wSWFVJj2WRdJPd0zigluc+Id3WhRKvsyoWmUf9pn++YZBPyJKPCJbIsmatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904810; c=relaxed/simple;
	bh=iCfGAQGmVCFjZK4/77au4d2hBYby4UZ8uyA+VV46maI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6xO1E0rk3IShJ8aSCYwOKI1N9SGqKjZZfGazXKpd1hTO+E34wif9fgIJtPp5cxuxN6qVpTU1+3omdeKd92bnr6cBfJNE0mCUUMhArs88fi8JHrD+iqhdG0ograhrgnIQLH7q1VTUy7cKRdwBZQ8a14WAJJSPLaAJerKGnWPk0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=i+AkkbJq; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="i+AkkbJq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747904802; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=N8CSzgH6h+Lund+UV8UvMsQfx9po2OnLfKYLiT27LHY=;
	b=i+AkkbJqPEl52KgeWN5NSfQLLWV7zkEw8aioIAN11zkp/jEpnUzwDE9O/s9KTGE4YApn4i8HLxG8QLu89rc0cdTgrUVeN8wkZHnyv4XlTUeruNBYj8+ViG71IUmp6zkMgLZIfbrE9/4+ma9feuEwmmUOfZ89OEWsjAt+C82Golw=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WbVLUK3_1747904796 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 17:06:41 +0800
Message-ID: <7fa71441-a5b0-40aa-aee8-8f251ea96f75@linux.alibaba.com>
Date: Thu, 22 May 2025 17:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] erofs: support deflate decompress by using Intel QAT
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250522084700.21354-1-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250522084700.21354-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/22 16:47, Bo Liu wrote:

...

> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-erofs b/Documentation/ABI/testing/sysfs-fs-erofs
> index b134146d735b..4d024f043ea1 100644
> --- a/Documentation/ABI/testing/sysfs-fs-erofs
> +++ b/Documentation/ABI/testing/sysfs-fs-erofs
> @@ -27,3 +27,12 @@ Description:	Writing to this will drop compression-related caches,
>   		- 1 : invalidate cached compressed folios
>   		- 2 : drop in-memory pclusters
>   		- 3 : drop in-memory pclusters and cached compressed folios
> +
> +What:		/sys/fs/erofs/accel
> +Date:		May 2025
> +Contact:	"Bo Liu" <liubo03@inspur.com>
> +Description:	Used to set or show hardware accelerators in effect
> +		and multiple accelerators are separated by '\n'.
> +		Supported accelerator(s): qat_deflate.
> +		Disable all accelerators with an empty string (echo > accel).
> +

redundent new line.

...

> diff --git a/fs/erofs/decompressor_crypto.c b/fs/erofs/decompressor_crypto.c
> new file mode 100644
> index 000000000000..f4891d335792
> --- /dev/null
> +++ b/fs/erofs/decompressor_crypto.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/scatterlist.h>
> +#include <crypto/acompress.h>
> +
> +#include "compress.h"
> +
> +static int __z_erofs_crypto_decompress(struct z_erofs_decompress_req *rq,
> +				struct crypto_acomp *tfm)

Please check your tab setting (should be 8 spaces) and
rework it on my v4.

> +{

...

> +
> +int z_erofs_crypto_show_engines(char *buf, int size, char sep)
> +{
> +	struct z_erofs_crypto_engine *e;
> +	int alg, len = 0;
> +
> +	for (alg = 0; alg < Z_EROFS_COMPRESSION_MAX; ++alg) {
> +		for (e = z_erofs_crypto[alg]; e->crypto_name; ++e) {
> +			if (!e->tfm)
> +				continue;
> +			len += scnprintf(buf + len, size - len, "%s%c",
> +					 e->crypto_name, sep);
> +		}
> +	}
> +	return len;
> +}
> +

redundent new line.

Thanks,
Gao Xiang

> diff --git a/fs/erofs/decompressor_deflate.c b/fs/erofs/decompressor_deflate.c
> index c6908a487054..e4c9df9d7978 100644
> --- a/fs/erofs/decompressor_deflate.c
> +++ b/fs/erofs/decompressor_deflate.c
