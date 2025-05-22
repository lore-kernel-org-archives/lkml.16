Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221FB24EF7B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900463; cv=none; b=OPX6jbBd/in67EiTxoO/lVrPjjyqfop1xfrW5rGTb6X/DN+awwWezoboiNFz87HkIV6VXydUjTgAk2dOjQol+LNIW8nxN0UuxFvI3502jsRLZSxqQtfOT5bLyABX0vvqyeCEGbA4/qkUTuPiSTsPsQ65DdMRZa6PkXTqNe49FDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900463; c=relaxed/simple;
	bh=VVUw3oKaAQ6tntNNkc8JKfCiK0UaAuJWGgZpck0qfbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7iNzyyhuLk7pisNobszqOOjxmsz/08VL2WXyo3gtBr8Po3Zv5pyBRhQSaJmBWC5zWLk1X4mSszaIZ6lmYHXfgWjBmq7porXr3qgC+UmVgphEjcUBvOclXfjokSvJpdw/j88YmIJ5WmZyX27QRtcVKZI6dvAiNVnzJ46cPY/jtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TouSB+YR; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TouSB+YR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747900456; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xmllp+0pYS+iGPE0L4g0um6TnAHmX6fzEycWTLONE68=;
	b=TouSB+YR4V4n0ksdgH/KjQlJsDf7yulHOCf6bh7p+5QkxSTEwmdjerFMHJesLbR0WRvb+vdGO0P5OOzCg6N/Lgz4rux2G3VhdlmUoxwICq32bBG/I5T0245/GHUZ97YLlT+JgUgDAv5PQX9l30Il1yKVkxAnjv7oTB4ZYWe21os=
Received: from 30.170.233.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WbV0ft-_1747900454 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 May 2025 15:54:15 +0800
Message-ID: <49ca7ddc-4ea7-4081-84ee-609a23b815e4@linux.alibaba.com>
Date: Thu, 22 May 2025 15:54:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] erofs: support deflate decompress by using Intel QAT
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250522061611.7038-1-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250522061611.7038-1-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bo,

On 2025/5/22 14:16, Bo Liu wrote:
> This patch introdueces the use of the Intel QAT to decompress compressed
> data in the EROFS filesystem, aiming to improve the decompression speed
> of compressed datea.
> 
> We created a 285MiB compressed file and then used the following command to
> create EROFS images with different cluster size.
>       # mkfs.erofs -zdeflate,level=9 -C16384
> 
> fio command was used to test random read and small random read(~5%) and
> sequential read performance.
>       # fio -filename=testfile  -bs=4k -rw=read -name=job1
>       # fio -filename=testfile  -bs=4k -rw=randread -name=job1
>       # fio -filename=testfile  -bs=4k -rw=randread --io_size=14m -name=job1
> 
> Here are some performance numbers for reference:
> 
> Processors: Intel(R) Xeon(R) 6766E(144 core)
> Memory:     521 GiB
> 
> |-----------------------------------------------------------------------------|
> |           | Cluster size | sequential read | randread  | small randread(5%) |
> |-----------|--------------|-----------------|-----------|--------------------|
> | Intel QAT |    4096      |    538  MiB/s   | 112 MiB/s |     20.76 MiB/s    |
> | Intel QAT |    16384     |    699  MiB/s   | 158 MiB/s |     21.02 MiB/s    |
> | Intel QAT |    65536     |    917  MiB/s   | 278 MiB/s |     20.90 MiB/s    |
> | Intel QAT |    131072    |    1056 MiB/s   | 351 MiB/s |     23.36 MiB/s    |
> | Intel QAT |    262144    |    1145 MiB/s   | 431 MiB/s |     26.66 MiB/s    |
> | deflate   |    4096      |    499  MiB/s   | 108 MiB/s |     21.50 MiB/s    |
> | deflate   |    16384     |    422  MiB/s   | 125 MiB/s |     18.94 MiB/s    |
> | deflate   |    65536     |    452  MiB/s   | 159 MiB/s |     13.02 MiB/s    |
> | deflate   |    131072    |    452  MiB/s   | 177 MiB/s |     11.44 MiB/s    |
> | deflate   |    262144    |    466  MiB/s   | 194 MiB/s |     10.60 MiB/s    |
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>
> ---
> v1: https://lore.kernel.org/linux-erofs/20250410042048.3044-1-liubo03@inspur.com/
> v2: https://lore.kernel.org/linux-erofs/20250410042048.3044-1-liubo03@inspur.com/T/#t
> v3: https://lore.kernel.org/linux-erofs/20250516082634.3801-1-liubo03@inspur.com/
> v4: https://lore.kernel.org/linux-erofs/20250521100326.2867828-1-hsiangkao@linux.alibaba.com/
> change since v4:
>   - add sysfs documentation.
> 
>   Documentation/ABI/testing/sysfs-fs-erofs |  12 ++
>   fs/erofs/Kconfig                         |  14 ++
>   fs/erofs/Makefile                        |   1 +
>   fs/erofs/compress.h                      |  10 ++
>   fs/erofs/decompressor_crypto.c           | 186 +++++++++++++++++++++++
>   fs/erofs/decompressor_deflate.c          |  17 ++-
>   fs/erofs/sysfs.c                         |  34 ++++-
>   fs/erofs/zdata.c                         |   1 +
>   8 files changed, 272 insertions(+), 3 deletions(-)
>   create mode 100644 fs/erofs/decompressor_crypto.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-erofs b/Documentation/ABI/testing/sysfs-fs-erofs
> index b134146d735b..95201a62f704 100644
> --- a/Documentation/ABI/testing/sysfs-fs-erofs
> +++ b/Documentation/ABI/testing/sysfs-fs-erofs
> @@ -27,3 +27,15 @@ Description:	Writing to this will drop compression-related caches,
>   		- 1 : invalidate cached compressed folios
>   		- 2 : drop in-memory pclusters
>   		- 3 : drop in-memory pclusters and cached compressed folios
> +
> +What:		/sys/fs/erofs/accel
> +Date:		May 2025
> +Contact:	"Bo Liu" <liubo03@inspur.com>
> +Description:	The accel file is read-write and allows to set or show
> +		hardware decompression accelerators, and it supports writing
> +		multiple accelerators separated by ‘\n’.

		Used to set or show hardware accelerators in effect and multiple
		accelerators are separated by '\n'.

		Supported accelerator(s): qat_deflate

		Disable all accelerators with an empty string (echo > accel).

> +		Currently supported accelerators:

...

> +
> +static int __z_erofs_crypto_decompress(struct z_erofs_decompress_req *rq,
> +				struct crypto_acomp *tfm)
> +{
> +	struct sg_table st_src, st_dst;
> +	struct acomp_req *req;
> +	struct crypto_wait wait;
> +	u8 *headpage;
> +	int ret;
> +
> +	headpage = kmap_local_page(*rq->in);
> +	ret = z_erofs_fixup_insize(rq, headpage + rq->pageofs_in,
> +				min_t(unsigned int, rq->inputsize,
> +							rq->sb->s_blocksize - rq->pageofs_in));

	ret = z_erofs_fixup_insize(rq, headpage + rq->pageofs_in,
				min_t(unsigned int, rq->inputsize,
				      rq->sb->s_blocksize - rq->pageofs_in));

Otherwise it looks good to me.

Thanks,
Gao Xiang
