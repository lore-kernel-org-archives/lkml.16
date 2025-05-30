Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185914A4DB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748571233; cv=none; b=rU1o2idnb/h/Tty1JwXljm6xv7IeYbKDNfUC8NN8XMBPWA28pw4FGFfYGj/HSd9V8j1TNS73njuO13yQTQQ87PTKf4EDiktoqfHglEVUTyInB3RLay5pwUXMLYi4at48LWdJGGpqTaX88APu7tBvPF/o9+WZdkCAqpX4AYDHRCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748571233; c=relaxed/simple;
	bh=tCuRVmR9JpL+gbKtfoUUUnfROsEklRATL2AGVwvFQLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahYBOlyjLbpv+uqXoiyxUK4uZrnXDqUVNWyC+hZ5j8q723hstoT6Jkrstgy3MbVoHAu7Envd9zDX2D/CA8IUq92EuQg+luwHyXC0vTT9/pTSoExJ88VZ0iKAqKEfmkEhAaAY3dBaaHCmpgINh57pc3xTAl+ts/s+wXkQwqqO2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXS3VQFo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXS3VQFo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U05f2D013816
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/VnhVqLCGaDjWqwzFqGubtQlygb2coSzVlVBFgZ+6k=; b=RXS3VQFoH1ESdzu6
	7owwL+Psek+cduEvmZNyKNH/gBP0m4c8jzOzD/VT3+PMaILEi/sWBKHX0FRqVjOg
	quy9nAkLRFgaYrbnM5U7QwY0rZUzQ/2oeKif2gx7M4wUU0UZYD6Fuj7gGjNNE7I8
	3DW0fs6t7t1cNf060/Ev7wYgGEzELa5ICX5nxuYE/KqY1p7Js75ss9m7y/TDoP7S
	FQgAg8uX3H/2YBIF8j6b1Wd3BIdEqyxu+ojGRqMpVwQLU1oXVI6JvtqKii5VjBpo
	CErGHOrJkOp43/1Uh6UEnGAzYoQhFTtC7LGUSFyF8uiOzsqQmTWDHMFsj2r8KBFN
	uG3bMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm1byt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:13:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747a9ef52a4so2134335b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748571228; x=1749176028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/VnhVqLCGaDjWqwzFqGubtQlygb2coSzVlVBFgZ+6k=;
        b=qhTTeZyUleykOP8x3BPIQFKTTVe1X2b2/I3TwALOPNohW2Zh0yCU9k4FabrCVOA7u1
         MH0ElLbrCFOqeurQ/SBo+tbh1ykDycBr9ZRQ2PYJolx1GRdZQeUuBPmwfOZGiRGo9e3s
         x3rv4tFVlITcEPrGvN3lzsmWYQHLJFpP49vP9jMStvVIzkzSPWdSrR/hHKgYojo26qBL
         kyDDBrN/68tkt1462nskXRiDPNHyea8892sTDmwB/Nbt8W9sT38pbO1L0qPpt8dF0DjY
         wErrBYbZZgyL/4uZbrTly9tgLCiYBNkUkA10tJMFTyed8jedr84p6gBr5H+OR1zAJUrJ
         ZWCw==
X-Forwarded-Encrypted: i=1; AJvYcCUroFgdq379kQfHtRDRvf934FzMFIbcpUixcORecfEUZkzOYVuKCJSBtCvRTK2oCKUdbbnu2ecOh+ITDfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGNZkeG08pqma0PPs02pVYRxLE06sk8T4fv1O7wOqcOvE098q
	jwPBUEpzASb+hkyW5DgTSx6lGdjuONrn4X1qBGY8RbIw+Of8P/pE7xPtVgEmQGMsRDKi+D/i2hL
	iyfgmDUCnQNzqDl/N4D7TP+5HrVtAgEL4BYJRkY6jgUOQzCvROUEvzpXfxLdaC9tInQ==
X-Gm-Gg: ASbGncu4AWkXpPCKXKGgG/Fh7VqvOEp8MrUPVkX85poThvfSYTW1jXbcu1s++8Fv8tU
	mLD33l9FrdiCDBD7MKfpdYYfLsWS+KwVP+h85zONGIQeKMzUDxR7J3LTRMLWudbQp6Rdj03fMWG
	U2f/p5FzEYhRN7JeHR48Cc5JwZK2nglVrYdwRA1LQ7WKJ4qjCU0su8EEO6K0WazJm4J2t4juLxb
	rtqgbCuzdPMhf811yu5UKeboOnmeiwXY0Tp5pBCNX5acULIgVgOcdEPvVXihz7ZbYwAUQRubJwW
	dAAP0O6m/EY4zDpNTSvnx9wA8wjLbbWImIPZZNJcbvlVULA1WP1At+lyT0w0pBItYDHMZw6RHV2
	xtEetXf/hOrDUmqB5mxQ0
X-Received: by 2002:a05:6a00:982:b0:740:9331:78f0 with SMTP id d2e1a72fcca58-747c1c657f7mr607907b3a.22.1748571228390;
        Thu, 29 May 2025 19:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIrd4HhjgxhN0I/q82F4Lve+PEyUPmQh6OQLqM1sIEZq9WMkXpwgO7KlokUisSEP4PDdxpxg==
X-Received: by 2002:a05:6a00:982:b0:740:9331:78f0 with SMTP id d2e1a72fcca58-747c1c657f7mr607874b3a.22.1748571227880;
        Thu, 29 May 2025 19:13:47 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa42sm2049885b3a.92.2025.05.29.19.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 19:13:47 -0700 (PDT)
Message-ID: <a6a6c6bb-2d01-4f46-854c-583e9afa7cf1@oss.qualcomm.com>
Date: Fri, 30 May 2025 12:13:37 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/9] tee: implement protected DMA-heap
To: Jens Wiklander <jens.wiklander@linaro.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org,
        linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
        Daniel Stone <daniel@fooishbar.org>,
        Rouven Czerwinski <rouven.czerwinski@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-4-jens.wiklander@linaro.org>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20250520152436.474778-4-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dSTEBM6bcGCHc2Mv_Fa-vp1TmOlLTMHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAxOCBTYWx0ZWRfXxz/MvmPc86js
 riWEpuf2BqfD4gieWkEvWsVllSr6CrKbb2+g1hUfmmydxX1gaiJdUQNp0t2ySt6SfgcZLp2qCMx
 53UgRhBdU0WqQxO/Jva3JyoWGVvfrVUNBBIra+qGuBvXpBxlU9ouZ3hAW2CNvbotfN7eQ2WIGQS
 TOAhLvXnA77todyJGkUwvPbtxZoNIFV3k7DXyYL07iUmOkoY7qiSOe6676V+F9WR0xu2mga9NUW
 +Zaknva5+D/MEPMKTR5FK5WdDwxEbebG8SeeTEfDo1Wl7plXWkaLhd2JlyrVqZIgf5xdAm/89l8
 2dBKACGDVNEC/P93eTpe4eWPpFVG2x72zJyRYwQRxLYkbOH48e5tkBtyHSEPjxzzdXU9qgEy2nv
 fQZMaMq6RawxT2zQyC2oFVX6ZshLwsIiKIFjteRrmpk+3o7gooG1gMAoOzFSfeR1LTyR3CMg
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839145d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=mBb8ssJjVbCy2Oii7GoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dSTEBM6bcGCHc2Mv_Fa-vp1TmOlLTMHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300018

Hi Jens,

On 5/21/2025 1:16 AM, Jens Wiklander wrote:
> Implement DMA heap for protected DMA-buf allocation in the TEE
> subsystem.
> 
> Restricted memory refers to memory buffers behind a hardware enforced
> firewall. It is not accessible to the kernel during normal circumstances
> but rather only accessible to certain hardware IPs or CPUs executing in
> higher or differently privileged mode than the kernel itself. This
> interface allows to allocate and manage such protected memory buffers
> via interaction with a TEE implementation.
> 
> The protected memory is allocated for a specific use-case, like Secure
> Video Playback, Trusted UI, or Secure Video Recording where certain
> hardware devices can access the memory.
> 
> The DMA-heaps are enabled explicitly by the TEE backend driver. The TEE
> backend drivers needs to implement protected memory pool to manage the
> protected memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/Makefile      |   1 +
>  drivers/tee/tee_heap.c    | 487 ++++++++++++++++++++++++++++++++++++++
>  drivers/tee/tee_private.h |   6 +
>  include/linux/tee_core.h  |  65 +++++
>  4 files changed, 559 insertions(+)
>  create mode 100644 drivers/tee/tee_heap.c
> 
> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
> index 5488cba30bd2..949a6a79fb06 100644
> --- a/drivers/tee/Makefile
> +++ b/drivers/tee/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_TEE) += tee.o
>  tee-objs += tee_core.o
> +tee-objs += tee_heap.o
>  tee-objs += tee_shm.o
>  tee-objs += tee_shm_pool.o
>  obj-$(CONFIG_OPTEE) += optee/
> diff --git a/drivers/tee/tee_heap.c b/drivers/tee/tee_heap.c
> new file mode 100644
> index 000000000000..a332805f9f26
> --- /dev/null
> +++ b/drivers/tee/tee_heap.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Linaro Limited
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-heap.h>
> +#include <linux/genalloc.h>
> +#include <linux/module.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +#include <linux/tee_core.h>
> +#include <linux/xarray.h>
> +
> +#include "tee_private.h"
> +
> +struct tee_dma_heap {
> +	struct dma_heap *heap;
> +	enum tee_dma_heap_id id;
> +	struct tee_protmem_pool *pool;
> +	struct tee_device *teedev;
> +	/* Protects pool and teedev above */
> +	struct mutex mu;
> +};
> +
> +struct tee_heap_buffer {
> +	struct tee_protmem_pool *pool;
> +	struct tee_device *teedev;
> +	size_t size;
> +	size_t offs;
> +	struct sg_table table;
> +};
> +
> +struct tee_heap_attachment {
> +	struct sg_table table;
> +	struct device *dev;
> +};
> +
> +struct tee_protmem_static_pool {
> +	struct tee_protmem_pool pool;
> +	struct gen_pool *gen_pool;
> +	phys_addr_t pa_base;
> +	void *base;
> +};
> +

Isn't using an xarray excessive for just three entries, given static, limited IDs?

> +#if IS_ENABLED(CONFIG_DMABUF_HEAPS)
> +static DEFINE_XARRAY_ALLOC(tee_dma_heap);
> +

Why are we even considering sgl in the first place, given that tee_shm_register_fd()
does not accept any dma_buf with more than one entry? Wouldn't it make sense to
ensure sgl has a single entry after calling alloc()?

> +static int copy_sg_table(struct sg_table *dst, struct sg_table *src)
> +{
> +	struct scatterlist *dst_sg;
> +	struct scatterlist *src_sg;
> +	int ret;
> +	int i;
> +
> +	ret = sg_alloc_table(dst, src->orig_nents, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	dst_sg = dst->sgl;
> +	for_each_sgtable_sg(src, src_sg, i) {
> +		sg_set_page(dst_sg, sg_page(src_sg), src_sg->length,
> +			    src_sg->offset);
> +		dst_sg = sg_next(dst_sg);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tee_heap_attach(struct dma_buf *dmabuf,
> +			   struct dma_buf_attachment *attachment)
> +{
> +	struct tee_heap_buffer *buf = dmabuf->priv;
> +	struct tee_heap_attachment *a;
> +	int ret;
> +
> +	a = kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return -ENOMEM;
> +
> +	ret = copy_sg_table(&a->table, &buf->table);
> +	if (ret) {
> +		kfree(a);
> +		return ret;
> +	}
> +
> +	a->dev = attachment->dev;
> +	attachment->priv = a;
> +
> +	return 0;
> +}
> +
> +static void tee_heap_detach(struct dma_buf *dmabuf,
> +			    struct dma_buf_attachment *attachment)
> +{
> +	struct tee_heap_attachment *a = attachment->priv;
> +
> +	sg_free_table(&a->table);
> +	kfree(a);
> +}
> +
> +static struct sg_table *
> +tee_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> +		     enum dma_data_direction direction)
> +{
> +	struct tee_heap_attachment *a = attachment->priv;
> +	int ret;
> +
> +	ret = dma_map_sgtable(attachment->dev, &a->table, direction,
> +			      DMA_ATTR_SKIP_CPU_SYNC);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &a->table;
> +}
> +
> +static void tee_heap_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +				   struct sg_table *table,
> +				   enum dma_data_direction direction)
> +{
> +	struct tee_heap_attachment *a = attachment->priv;
> +
> +	WARN_ON(&a->table != table);
> +
> +	dma_unmap_sgtable(attachment->dev, table, direction,
> +			  DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
> +static void tee_heap_buf_free(struct dma_buf *dmabuf)
> +{
> +	struct tee_heap_buffer *buf = dmabuf->priv;
> +	struct tee_device *teedev = buf->teedev;
> +
> +	buf->pool->ops->free(buf->pool, &buf->table);
> +	tee_device_put(teedev);
> +}
> +
> +static const struct dma_buf_ops tee_heap_buf_ops = {
> +	.attach = tee_heap_attach,
> +	.detach = tee_heap_detach,
> +	.map_dma_buf = tee_heap_map_dma_buf,
> +	.unmap_dma_buf = tee_heap_unmap_dma_buf,
> +	.release = tee_heap_buf_free,
> +};
> +
> +static struct dma_buf *tee_dma_heap_alloc(struct dma_heap *heap,
> +					  unsigned long len, u32 fd_flags,
> +					  u64 heap_flags)
> +{
> +	struct tee_dma_heap *h = dma_heap_get_drvdata(heap);
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct tee_device *teedev = NULL;
> +	struct tee_heap_buffer *buf;
> +	struct tee_protmem_pool *pool;
> +	struct dma_buf *dmabuf;
> +	int rc;
> +
> +	mutex_lock(&h->mu);
> +	if (tee_device_get(h->teedev)) {
> +		teedev = h->teedev;
> +		pool = h->pool;
> +	}
> +	mutex_unlock(&h->mu);
> +
> +	if (!teedev)
> +		return ERR_PTR(-EINVAL);
> +
> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
> +	if (!buf) {
> +		dmabuf = ERR_PTR(-ENOMEM);
> +		goto err;
> +	}
> +	buf->size = len;
> +	buf->pool = pool;
> +	buf->teedev = teedev;
> +
> +	rc = pool->ops->alloc(pool, &buf->table, len, &buf->offs);
> +	if (rc) {
> +		dmabuf = ERR_PTR(rc);
> +		goto err_kfree;
> +	}
> +
> +	exp_info.ops = &tee_heap_buf_ops;
> +	exp_info.size = len;
> +	exp_info.priv = buf;
> +	exp_info.flags = fd_flags;
> +	dmabuf = dma_buf_export(&exp_info);
> +	if (IS_ERR(dmabuf))
> +		goto err_protmem_free;
> +
> +	return dmabuf;
> +
> +err_protmem_free:
> +	pool->ops->free(pool, &buf->table);
> +err_kfree:
> +	kfree(buf);
> +err:
> +	tee_device_put(h->teedev);
> +	return dmabuf;
> +}
> +
> +static const struct dma_heap_ops tee_dma_heap_ops = {
> +	.allocate = tee_dma_heap_alloc,
> +};
> +
> +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> +{
> +	switch (id) {
> +	case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> +		return "protected,secure-video";
> +	case TEE_DMA_HEAP_TRUSTED_UI:
> +		return "protected,trusted-ui";
> +	case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> +		return "protected,secure-video-record";
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static int alloc_dma_heap(struct tee_device *teedev, enum tee_dma_heap_id id,
> +			  struct tee_protmem_pool *pool)
> +{
> +	struct dma_heap_export_info exp_info = {
> +		.ops = &tee_dma_heap_ops,
> +		.name = heap_id_2_name(id),
> +	};
> +	struct tee_dma_heap *h;
> +	int rc;
> +
> +	if (!exp_info.name)
> +		return -EINVAL;
> +
> +	if (xa_reserve(&tee_dma_heap, id, GFP_KERNEL)) {
> +		if (!xa_load(&tee_dma_heap, id))
> +			return -EEXIST;
> +		return -ENOMEM;
> +	}
> +
> +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> +	if (!h)
> +		return -ENOMEM;
> +	h->id = id;
> +	h->teedev = teedev;
> +	h->pool = pool;
> +	mutex_init(&h->mu);
> +
> +	exp_info.priv = h;
> +	h->heap = dma_heap_add(&exp_info);
> +	if (IS_ERR(h->heap)) {
> +		rc = PTR_ERR(h->heap);
> +		kfree(h);
> +
> +		return rc;
> +	}
> +
> +	/* "can't fail" due to the call to xa_reserve() above */
> +	return WARN(xa_store(&tee_dma_heap, id, h, GFP_KERNEL),
> +		    "xa_store() failed");
> +}
> +
> +int tee_device_register_dma_heap(struct tee_device *teedev,
> +				 enum tee_dma_heap_id id,
> +				 struct tee_protmem_pool *pool)
> +{
> +	struct tee_dma_heap *h;
> +	int rc;
> +
> +	h = xa_load(&tee_dma_heap, id);
> +	if (h) {
> +		mutex_lock(&h->mu);
> +		if (h->teedev) {
> +			rc = -EBUSY;
> +		} else {
> +			h->teedev = teedev;
> +			h->pool = pool;
> +			rc = 0;
> +		}
> +		mutex_unlock(&h->mu);
> +	} else {
> +		rc = alloc_dma_heap(teedev, id, pool);
> +	}
> +
> +	if (rc)
> +		dev_err(&teedev->dev, "can't register DMA heap id %d (%s)\n",
> +			id, heap_id_2_name(id));
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
> +
> +void tee_device_unregister_all_dma_heaps(struct tee_device *teedev)
> +{
> +	struct tee_protmem_pool *pool;
> +	struct tee_dma_heap *h;
> +	u_long i;
> +
> +	xa_for_each(&tee_dma_heap, i, h) {
> +		if (h) {
> +			pool = NULL;
> +			mutex_lock(&h->mu);
> +			if (h->teedev == teedev) {
> +				pool = h->pool;
> +				h->teedev = NULL;
> +				h->pool = NULL;
> +			}
> +			mutex_unlock(&h->mu);
> +			if (pool)
> +				pool->ops->destroy_pool(pool);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
> +

(Please first see comment below for update_shm())

Other than calling update_shm(), nothing significant happens in this function.
If we remove update_shm(), these operations can be moved to the register function.

However, I also argue that since we have a well-designed generic function like
tee_ioctl_shm_register_fd(), why should we restrict ourselves to checking the type of
dma_buf? Any dma_buf should be acceptable to register as tee_shm (thougn it should fail
if it is used in protected operation). Otherwise, TEE_IOC_SHM_REGISTER_FD is
not an accurate name it should be TEE_IOC_SHM_REGISTER_PROTECTED_FD (or something similar).

> +int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> +				 struct dma_buf *dmabuf, size_t *offset,
> +				 struct tee_shm *shm,
> +				 struct tee_shm **parent_shm)
> +{
> +	struct tee_heap_buffer *buf;
> +	int rc;
> +
> +	/* The DMA-buf must be from our heap */
> +	if (dmabuf->ops != &tee_heap_buf_ops)
> +		return -EINVAL;
> +
> +	buf = dmabuf->priv;
> +	/* The buffer must be from the same teedev */
> +	if (buf->teedev != teedev)
> +		return -EINVAL;
> +
> +	shm->size = buf->size;
> +
> +	rc = buf->pool->ops->update_shm(buf->pool, &buf->table, buf->offs, shm,
> +					parent_shm);
> +	if (!rc && *parent_shm)
> +		*offset = buf->offs;
> +
> +	return rc;
> +}
> +#else
> +int tee_device_register_dma_heap(struct tee_device *teedev __always_unused,
> +				 enum tee_dma_heap_id id __always_unused,
> +				 struct tee_protmem_pool *pool __always_unused)
> +{
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(tee_device_register_dma_heap);
> +
> +void
> +tee_device_unregister_all_dma_heaps(struct tee_device *teedev __always_unused)
> +{
> +}
> +EXPORT_SYMBOL_GPL(tee_device_unregister_all_dma_heaps);
> +
> +int tee_heap_update_from_dma_buf(struct tee_device *teedev __always_unused,
> +				 struct dma_buf *dmabuf __always_unused,
> +				 size_t *offset __always_unused,
> +				 struct tee_shm *shm __always_unused,
> +				 struct tee_shm **parent_shm __always_unused)
> +{
> +	return -EINVAL;
> +}
> +#endif
> +
> +static struct tee_protmem_static_pool *
> +to_protmem_static_pool(struct tee_protmem_pool *pool)
> +{
> +	return container_of(pool, struct tee_protmem_static_pool, pool);
> +}
> +
> +static int protmem_pool_op_static_alloc(struct tee_protmem_pool *pool,
> +					struct sg_table *sgt, size_t size,
> +					size_t *offs)
> +{
> +	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
> +	phys_addr_t pa;
> +	int ret;
> +
> +	pa = gen_pool_alloc(stp->gen_pool, size);
> +	if (!pa)
> +		return -ENOMEM;
> +
> +	ret = sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	if (ret) {
> +		gen_pool_free(stp->gen_pool, pa, size);
> +		return ret;
> +	}
> +
> +	sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> +	*offs = pa - stp->pa_base;
> +
> +	return 0;
> +}
> +
> +static void protmem_pool_op_static_free(struct tee_protmem_pool *pool,
> +					struct sg_table *sgt)
> +{
> +	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
> +	struct scatterlist *sg;
> +	int i;
> +

Should be a loop?

> +	for_each_sgtable_sg(sgt, sg, i)
> +		gen_pool_free(stp->gen_pool, sg_phys(sg), sg->length);
> +	sg_free_table(sgt);
> +}
> +
> +static int protmem_pool_op_static_update_shm(struct tee_protmem_pool *pool,
> +					     struct sg_table *sgt, size_t offs,
> +					     struct tee_shm *shm,
> +					     struct tee_shm **parent_shm)
> +{
> +	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
> +
> +	shm->paddr = stp->pa_base + offs;
> +	*parent_shm = NULL;
> +
> +	return 0;
> +}
> +
> +static void protmem_pool_op_static_destroy_pool(struct tee_protmem_pool *pool)
> +{
> +	struct tee_protmem_static_pool *stp = to_protmem_static_pool(pool);
> +
> +	gen_pool_destroy(stp->gen_pool);
> +	memunmap(stp->base);
> +	kfree(stp);
> +}
> +
> +static struct tee_protmem_pool_ops protmem_pool_ops_static = {
> +	.alloc = protmem_pool_op_static_alloc,
> +	.free = protmem_pool_op_static_free,
> +	.update_shm = protmem_pool_op_static_update_shm,
> +	.destroy_pool = protmem_pool_op_static_destroy_pool,
> +};
> +
> +struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t paddr,
> +						       size_t size)
> +{
> +	const size_t page_mask = PAGE_SIZE - 1;
> +	struct tee_protmem_static_pool *stp;
> +	int rc;
> +
> +	/* Check it's page aligned */
> +	if ((paddr | size) & page_mask)
> +		return ERR_PTR(-EINVAL);
> +
> +	stp = kzalloc(sizeof(*stp), GFP_KERNEL);
> +	if (!stp)
> +		return ERR_PTR(-ENOMEM);
> +

I understand your reasoning for this, but considering that paddr comes from
the backend, isn’t it the backend’s responsibility to ensure that pfn_valid()
passes? For example, it might want to call devm_memremap_pages() itself.
So, should we simply ensure that the pages are valid , and fail on return,
rather than attempting to fix them?

> +	/*
> +	 * Map the memory as uncached to make sure the kernel can work with
> +	 * __pfn_to_page() and friends since that's needed when passing the
> +	 * protected DMA-buf to a device. The memory should otherwise not
> +	 * be touched by the kernel since it's likely to cause an external
> +	 * abort due to the protection status.
> +	 */
> +	stp->base = memremap(paddr, size, MEMREMAP_WC);
> +	if (!stp->base) {
> +		rc = -EINVAL;
> +		goto err_free;
> +	}
> +
> +	stp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
> +	if (!stp->gen_pool) {
> +		rc = -ENOMEM;
> +		goto err_unmap;
> +	}
> +
> +	rc = gen_pool_add(stp->gen_pool, paddr, size, -1);
> +	if (rc)
> +		goto err_free_pool;
> +
> +	stp->pool.ops = &protmem_pool_ops_static;
> +	stp->pa_base = paddr;
> +	return &stp->pool;
> +
> +err_free_pool:
> +	gen_pool_destroy(stp->gen_pool);
> +err_unmap:
> +	memunmap(stp->base);
> +err_free:
> +	kfree(stp);
> +
> +	return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_protmem_static_pool_alloc);
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 9bc50605227c..6c6ff5d5eed2 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -8,6 +8,7 @@
>  #include <linux/cdev.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/kref.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> @@ -24,4 +25,9 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
>  					  unsigned long addr, size_t length);
>  
> +int tee_heap_update_from_dma_buf(struct tee_device *teedev,
> +				 struct dma_buf *dmabuf, size_t *offset,
> +				 struct tee_shm *shm,
> +				 struct tee_shm **parent_shm);
> +
>  #endif /*TEE_PRIVATE_H*/
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index a38494d6b5f4..b8b99c97e00c 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -8,9 +8,11 @@
>  
>  #include <linux/cdev.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/idr.h>
>  #include <linux/kref.h>
>  #include <linux/list.h>
> +#include <linux/scatterlist.h>
>  #include <linux/tee.h>
>  #include <linux/tee_drv.h>
>  #include <linux/types.h>
> @@ -30,6 +32,12 @@
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
>  
> +enum tee_dma_heap_id {
> +	TEE_DMA_HEAP_SECURE_VIDEO_PLAY = 1,
> +	TEE_DMA_HEAP_TRUSTED_UI,
> +	TEE_DMA_HEAP_SECURE_VIDEO_RECORD,
> +};
> +
>  /**
>   * struct tee_device - TEE Device representation
>   * @name:	name of device
> @@ -116,6 +124,36 @@ struct tee_desc {
>  	u32 flags;
>  };
>  
> +/**
> + * struct tee_protmem_pool - protected memory pool
> + * @ops:		operations
> + *
> + * This is an abstract interface where this struct is expected to be
> + * embedded in another struct specific to the implementation.
> + */
> +struct tee_protmem_pool {
> +	const struct tee_protmem_pool_ops *ops;
> +};
> +
> +/**
> + * struct tee_protmem_pool_ops - protected memory pool operations
> + * @alloc:		called when allocating protected memory
> + * @free:		called when freeing protected memory
> + * @update_shm:		called when registering a dma-buf to update the @shm
> + *			with physical address of the buffer or to return the
> + *			@parent_shm of the memory pool
> + * @destroy_pool:	called when destroying the pool
> + */
> +struct tee_protmem_pool_ops {
> +	int (*alloc)(struct tee_protmem_pool *pool, struct sg_table *sgt,
> +		     size_t size, size_t *offs);
> +	void (*free)(struct tee_protmem_pool *pool, struct sg_table *sgt);

Why do we need update_shm()? Currently, it seems to do nothing beyond setting
parent_shm, simply indicating that this shm is part of a larger shm.

What if the backend wants to handle the buffer using something other than
tee_shm - for example, if it doesn’t want to use tee_shm_alloc_dma_mem()?
Would removing update_shm() and replacing it with shm_release(), while also
getting rid of tee_heap_update_from_dma_buf(), be a more streamlined approach?"

This way, tee_shm for dma_buf would be treated like any other tee_shm - using
refcounting based on tee_shm rather than its parent - and we would simply call
shm_release() upon release.

With this change, we can even accept any dm_buf making the TEE_IOC_SHM_REGISTER_FD generic.

Best Regards,
Amir

> +	int (*update_shm)(struct tee_protmem_pool *pool, struct sg_table *sgt,
> +			  size_t offs, struct tee_shm *shm,
> +			  struct tee_shm **parent_shm);
> +	void (*destroy_pool)(struct tee_protmem_pool *pool);
> +};
> +
>  /**
>   * tee_device_alloc() - Allocate a new struct tee_device instance
>   * @teedesc:	Descriptor for this driver
> @@ -154,6 +192,11 @@ int tee_device_register(struct tee_device *teedev);
>   */
>  void tee_device_unregister(struct tee_device *teedev);
>  
> +int tee_device_register_dma_heap(struct tee_device *teedev,
> +				 enum tee_dma_heap_id id,
> +				 struct tee_protmem_pool *pool);
> +void tee_device_unregister_all_dma_heaps(struct tee_device *teedev);
> +
>  /**
>   * tee_device_set_dev_groups() - Set device attribute groups
>   * @teedev:	Device to register
> @@ -229,6 +272,28 @@ static inline void tee_shm_pool_free(struct tee_shm_pool *pool)
>  	pool->ops->destroy_pool(pool);
>  }
>  
> +/**
> + * tee_protmem_static_pool_alloc() - Create a protected memory manager
> + * @paddr:	Physical address of start of pool
> + * @size:	Size in bytes of the pool
> + *
> + * @returns pointer to a 'struct tee_shm_pool' or an ERR_PTR on failure.
> + */
> +struct tee_protmem_pool *tee_protmem_static_pool_alloc(phys_addr_t paddr,
> +						       size_t size);
> +
> +/**
> + * tee_protmem_pool_free() - Free a protected memory pool
> + * @pool:	The protected memory pool to free
> + *
> + * There must be no remaining protected memory allocated from this pool
> + * when this function is called.
> + */
> +static inline void tee_protmem_pool_free(struct tee_protmem_pool *pool)
> +{
> +	pool->ops->destroy_pool(pool);
> +}
> +
>  /**
>   * tee_get_drvdata() - Return driver_data pointer
>   * @returns the driver_data pointer supplied to tee_register().

