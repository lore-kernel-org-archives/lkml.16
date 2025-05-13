Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA3204588
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115249; cv=none; b=ATEQZIggpK2t2jkYzUDqZWamyfEe1IrQfWskiOxrmu2OuDqkbtEy9b1hykyDeV+ap1fa72xftc7O5/h/cFMkW44IIvEf1wTK1gfdqDv59XV7i4da6GCZvncEWEx/L8TmP8u72M4ur3W9HjH7g5pUn3cj+VAFmu2eNYwye0ksAcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115249; c=relaxed/simple;
	bh=xopyDKskOJcR7IkAguhEe0TGMHeLmC1dm6VKFLcIvMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jF/68Xkug/F7/vT9SKs3IPULl8me+jGKump/LDphUjteU+Olvh9wQfbUWJWL9NeKqDy9EQaDeHUnU9HZ419MofRAU6iQNhEZvTYAZNH3qrURggDR3BVvsUzMLzSfyVZkrJaKtmQX+CpXFwD6dKI3m22UpBEpRejFuxP7HjP4ntM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WWElidYT; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WWElidYT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747115238; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=aS4dH0hOydCMzOt3b8MdnPAbV0/OYJB5Wc6WlcVrhQU=;
	b=WWElidYTkNu0jMs56aMBP6nyChxOFq8HUfsvfGZqOWzB2aqZBhkHZ+AYoBehjpqO/Ypp3RB69sBzRAsqabb8z0fj+2oU5eKDbAp8QOP3y+EA9V/hwH1xaDym1TNRxEvz7ql2rdArrxFEUAfX39dz4Ozc61loBIwh8GAgUggQAHY=
Received: from 30.221.133.89(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WaUWcCa_1747115236 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 13 May 2025 13:47:17 +0800
Message-ID: <3617ba19-e721-4e70-bb94-8a207d2aa8a6@linux.alibaba.com>
Date: Tue, 13 May 2025 13:47:16 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] erofs: support deflate decompress by using Intel QAT
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250410042048.3044-1-liubo03@inspur.com>
 <20250410042048.3044-3-liubo03@inspur.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250410042048.3044-3-liubo03@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bo,

On 2025/4/10 12:20, Bo Liu wrote:
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
> | deflate   |    65536     |    452  MiB/s   | 177 MiB/s |     11.44 MiB/s    |
> | deflate   |    262144    |    466  MiB/s   | 194 MiB/s |     10.60 MiB/s    |
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Sorry for late reply due to internal stuffs.

> ---
>   fs/erofs/decompressor_deflate.c | 145 +++++++++++++++++++++++++++++++-
>   fs/erofs/internal.h             |   1 +
>   fs/erofs/sysfs.c                |  30 +++++++
>   3 files changed, 175 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/decompressor_deflate.c b/fs/erofs/decompressor_deflate.c
> index c6908a487054..a293c44e86d2 100644
> --- a/fs/erofs/decompressor_deflate.c
> +++ b/fs/erofs/decompressor_deflate.c
> @@ -1,5 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   #include <linux/zlib.h>
> +#include <linux/scatterlist.h>
> +#include <crypto/acompress.h>

I guess we could move this feature into a new file called
"decompressor_crypto.c"?

> +
>   #include "compress.h"
>   
>   struct z_erofs_deflate {
> @@ -97,7 +100,7 @@ static int z_erofs_load_deflate_config(struct super_block *sb,
>   	return -ENOMEM;
>   }
>   
> -static int z_erofs_deflate_decompress(struct z_erofs_decompress_req *rq,
> +static int __z_erofs_deflate_decompress(struct z_erofs_decompress_req *rq,
>   				      struct page **pgpl)
>   {
>   	struct super_block *sb = rq->sb;
> @@ -178,6 +181,146 @@ static int z_erofs_deflate_decompress(struct z_erofs_decompress_req *rq,
>   	return err;
>   }
>   
> +static int z_erofs_crypto_decompress_mem(struct z_erofs_decompress_req *rq)
> +{
> +	struct erofs_sb_info *sbi = EROFS_SB(rq->sb);
> +	unsigned int nrpages_out =
> +				PAGE_ALIGN(rq->pageofs_out + rq->outputsize) >> PAGE_SHIFT;
> +	unsigned int nrpages_in = PAGE_ALIGN(rq->inputsize) >> PAGE_SHIFT;

I've optimized out those fields in
commit 0243cc257ffa ("erofs: move {in,out}pages into struct z_erofs_decompress_req")

so we don't need to recalculate here again.

> +	struct sg_table st_src, st_dst;
> +	struct scatterlist *sg_src, *sg_dst;
> +	struct acomp_req *req;
> +	struct crypto_wait wait;
> +	u8 *headpage;
> +	int ret, i;
> +
> +	WARN_ON(!*rq->in);
> +	headpage = kmap_local_page(*rq->in);
> +
> +	ret = z_erofs_fixup_insize(rq, headpage + rq->pageofs_in,
> +				min_t(unsigned int, rq->inputsize,
> +							rq->sb->s_blocksize - rq->pageofs_in));
> +
> +	kunmap_local(headpage);
> +	if (ret) {
> +		return ret;
> +	}

Unnecessary brace.

> +
> +	req = acomp_request_alloc(sbi->erofs_tfm);
> +	if (!req) {
> +		erofs_err(rq->sb, "failed to alloc decompress request");
> +		return -ENOMEM;
> +	}
> +
> +	if (sg_alloc_table(&st_src, nrpages_in, GFP_KERNEL)) {
> +		acomp_request_free(req);
> +		return -ENOMEM;
> +	}
> +
> +	if (sg_alloc_table(&st_dst, nrpages_out, GFP_KERNEL)) {
> +		acomp_request_free(req);
> +		sg_free_table(&st_src);
> +		return -ENOMEM;
> +	}
> +
> +	for_each_sg(st_src.sgl, sg_src, nrpages_in, i) {
> +		if (i == 0)
> +			sg_set_page(sg_src, rq->in[0],
> +					PAGE_SIZE - rq->pageofs_in, rq->pageofs_in);
> +		else
> +			sg_set_page(sg_src, rq->in[i], PAGE_SIZE, 0);

^ should we consider rq->inputsize here?

> +	}
> +
> +	i = 0;
> +	for_each_sg(st_dst.sgl, sg_dst, nrpages_out, i) {
> +		if (i == 0)
> +			sg_set_page(sg_dst, rq->out[0],
> +					PAGE_SIZE - rq->pageofs_out, rq->pageofs_out);
> +		 else
> +			sg_set_page(sg_dst, rq->out[i], PAGE_SIZE, 0);

^ should we consider rq->outputsize here?

> +	}
> +
> +	acomp_request_set_params(req, st_src.sgl,
> +				st_dst.sgl, rq->inputsize, rq->outputsize);
> +
> +	crypto_init_wait(&wait);
> +	acomp_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
> +						crypto_req_done, &wait);
> +
> +	ret = crypto_wait_req(crypto_acomp_decompress(req), &wait);
> +	if (ret < 0) {
> +		if (ret == -EBADMSG && rq->partial_decoding) {

Does QAT support partial decompression?

> +			ret = 0;
> +		} else {
> +			erofs_err(rq->sb, "failed to decompress %d in[%u, %u] out[%u]",
> +					ret, rq->inputsize, rq->pageofs_in, rq->outputsize);
> +			ret = -EIO;
> +		}
> +	} else {
> +		ret = 0;
> +	}
> +
> +	acomp_request_free(req);
> +	sg_free_table(&st_src);
> +	sg_free_table(&st_dst);
> +	return ret;
> +}
> +
> +static int z_erofs_crypto_prepare_dstpages(struct z_erofs_decompress_req *rq,
> +							struct page **pagepool)
> +{
> +	const unsigned int nr =
> +				PAGE_ALIGN(rq->pageofs_out + rq->outputsize) >> PAGE_SHIFT;

same here.

Also I suggest fold this `z_erofs_crypto_prepare_dstpages()` into
__z_erofs_deflate_crypto_decompress().

> +	unsigned int i;
> +
> +	for (i = 0; i < nr; ++i) {
> +		struct page *const page = rq->out[i];
> +		struct page *victim;
> +
> +		if (!page) {
> +			victim = __erofs_allocpage(pagepool, rq->gfp, true);
> +			if (!victim)
> +				return -ENOMEM;
> +			set_page_private(victim, Z_EROFS_SHORTLIVED_PAGE);
> +			rq->out[i] = victim;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int __z_erofs_deflate_crypto_decompress(struct z_erofs_decompress_req *rq,
> +									 struct page **pgpl)

It seems this function can be used for other hardware
accelerators, so I guess z_erofs_crypto_decompress is
enough.

> +{
> +	const unsigned int nrpages_out =
> +			PAGE_ALIGN(rq->pageofs_out + rq->outputsize) >> PAGE_SHIFT;
> +	int ret;
> +
> +	/* one optimized fast path only for non bigpcluster cases yet */
> +	if (rq->inputsize <= PAGE_SIZE && nrpages_out == 1 && !rq->inplace_io) {
> +		WARN_ON(!*rq->out);
> +		goto dstmap_out;
> +	}
> +
> +	ret = z_erofs_crypto_prepare_dstpages(rq, pgpl);
> +	if (ret < 0)
> +		return ret;
> +
> +dstmap_out:
> +	return z_erofs_crypto_decompress_mem(rq);
> +}
> +
> +static int z_erofs_deflate_decompress(struct z_erofs_decompress_req *rq,
> +				struct page **pgpl)

I wonder if it's possible to add a hardware acceleralor list
such as

struct z_erofs_crypto_engine {
	char *name;
	struct z_erofs_decompressor *decomp;
	bool enabled;
};

struct z_erofs_crypto_engine eng = {
	{ "qat_deflate", &z_erofs_deflate_decomp },
	...

};

so that we could add more hardware accelerators easily.

> +{
> +	struct super_block *sb = rq->sb;
> +	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +
> +	if (sbi->erofs_tfm)
> +		return __z_erofs_deflate_crypto_decompress(rq, pgpl);
> +	else
> +		return __z_erofs_deflate_decompress(rq, pgpl);
> +}
> +
>   const struct z_erofs_decompressor z_erofs_deflate_decomp = {
>   	.config = z_erofs_load_deflate_config,
>   	.decompress = z_erofs_deflate_decompress,
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h> index 4ac188d5d894..96fcee07d353 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -122,6 +122,7 @@ struct erofs_sb_info {
>   	/* pseudo inode to manage cached pages */
>   	struct inode *managed_cache;
>   
> +	struct crypto_acomp *erofs_tfm;
>   	struct erofs_sb_lz4_info lz4;
>   #endif	/* CONFIG_EROFS_FS_ZIP */
>   	struct inode *packed_inode;
> diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
> index dad4e6c6c155..d4630697dafd 100644
> --- a/fs/erofs/sysfs.c
> +++ b/fs/erofs/sysfs.c
> @@ -5,6 +5,7 @@
>    */
>   #include <linux/sysfs.h>
>   #include <linux/kobject.h>
> +#include <crypto/acompress.h>
>   
>   #include "internal.h"
>   
> @@ -13,6 +14,7 @@ enum {
>   	attr_drop_caches,
>   	attr_pointer_ui,
>   	attr_pointer_bool,
> +	attr_comp_crypto,
>   };
>   
>   enum {
> @@ -59,12 +61,14 @@ static struct erofs_attr erofs_attr_##_name = {			\
>   #ifdef CONFIG_EROFS_FS_ZIP
>   EROFS_ATTR_RW_UI(sync_decompress, erofs_mount_opts);
>   EROFS_ATTR_FUNC(drop_caches, 0200);
> +EROFS_ATTR_FUNC(comp_crypto, 0644);
>   #endif
>   
>   static struct attribute *erofs_attrs[] = {
>   #ifdef CONFIG_EROFS_FS_ZIP
>   	ATTR_LIST(sync_decompress),
>   	ATTR_LIST(drop_caches),
> +	ATTR_LIST(comp_crypto),
>   #endif
>   	NULL,
>   };
> @@ -128,6 +132,12 @@ static ssize_t erofs_attr_show(struct kobject *kobj,
>   		if (!ptr)
>   			return 0;
>   		return sysfs_emit(buf, "%d\n", *(bool *)ptr);
> +	case attr_comp_crypto:
> +		if (sbi->erofs_tfm)
> +			return sysfs_emit(buf, "%s\n",
> +				crypto_comp_alg_common(sbi->erofs_tfm)->base.cra_driver_name);
> +		else
> +			return sysfs_emit(buf, "NONE\n");
>   	}
>   	return 0;
>   }
> @@ -181,6 +191,26 @@ static ssize_t erofs_attr_store(struct kobject *kobj, struct attribute *attr,
>   		if (t & 1)
>   			invalidate_mapping_pages(MNGD_MAPPING(sbi), 0, -1);
>   		return len;
> +	case attr_comp_crypto:

Then I'd like to make this sysfs to enable accelerators.

Thanks,
Gao XIang
