Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D894335BA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748088; cv=none; b=XMeaUrUdsjPXRpZinIbsLHczqfW5i5UZtQYSz61P1Pg0U6P+cB3Qqsr5FhMI33Y6Xeh/nLAhnDaNjB8b3kMBJCLaV4cYYN4QanKPXfL7VzVDTsle7bwDLjZr/wlFx90m7bzcfV7BNBjEl3pTANJ/JrSpysUo+vJAqsk1o0ndCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748088; c=relaxed/simple;
	bh=MdT7uYOnECbFDiW2hyMdxKKNZUfqdYjCqJ0243HYg9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mUiORN/7AHAMGlXWcmS+FY5U45ddsGfIuxKQwUB9cvEbtCf/Zq1Txnga59D1C9IiV4tHwA7x1o0l6z9x7peS3RUpBafSm0K7mlQXT6rVrHpvHKrv6dhAziPaXsMo2BU7HXyj/KtQVRhHbXPGE0NddeTQtd7F3eeMUDl+vuKI/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+VH9ff2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+VH9ff2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHfEk3027585
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIrtVHNQp2y7Zse3vzNGVDYfeRg/j/EJRvoTEwsCgjo=; b=d+VH9ff26SfHRQMG
	uq6FbSoqgS5UZ6zmmRu8ogqtvVnV4Xm6mNtnJrgMc88NiP3H7NtxIb0g6R/SZleH
	/fJZiaGPg65ww+K5/m4YJ1WHw/J6KTefJT4r+h2nPti18qTbqiTSfANw1CjYqoi4
	rPnRmc4M3w5yiIzcWJgd0ET0FH59T4ZOLnmwWAc3asAQoHlrpGE3Yxr8RE7/2zI0
	sqfqLcnPTAUmrSoYi2JF+N9BYfEf1UfDDAZoq4HkpvhQrDlHTdxw1PylDeW5aagd
	uCO6NwJjvVHtNaPfJyxLoWnW03QyHKX6xd/xxX3U25rx+MGcgVnQzoh7e9dzfEJl
	Oy0ghA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqhjpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:54:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234906c5e29so66463205ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748085; x=1751352885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIrtVHNQp2y7Zse3vzNGVDYfeRg/j/EJRvoTEwsCgjo=;
        b=rfQAIj9IYgq3bmDVq/VzWZZGj8BSpY3mJbcjMkWJPzjg0aN8osbDRIiLBW9gdkaURe
         NQMZDeGaDUuRzq9RtTgv0MGCw4Fpe4xDPPYqagKLlOXAO3v6jUWObkc0lxvaEAJSFCbl
         30H45721rA96oyqx9nhUAxWMYhwze3lIctryms/GbsSPu2WLYUEjNG3evMfzoGh4Myp7
         b8LFOB/c14EjurMFxm9SDDS0juzXnH4Mtq3BoV57BJfZf6i3ABsmEN8v4RA7TeqZKPmk
         BjZOg3eVDlEWGFKemwe6EVC4eWXz8hpGIe9oFXnfKdJscNUyxKMhg9jHdPviD/5Ki269
         RA8w==
X-Forwarded-Encrypted: i=1; AJvYcCXcHSzpb3VABRmlJZl+Q+pMNLdlKx5IZ9+esX2VkMlN0jTyyROa+K11Jrd0qxLPJn1yER4rmUN12qPbAnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMRLzsgyVREfmsGnNWJtp+u7dItZrY6U9fvvW14V9Gv7EmSubq
	/xE4C3S83Gp1/nc6Oek7VO9hS1XPoyWSAmkP3We2kUXVxDnFLPWm8lu0uA5BW+PV24X695tQbwf
	UOl1M5OGH+QC8c+uPNXRLUzyKF+/ebWKUw8tMnB7MeMnPgppZyRKTIEeFaOmv3dg/5A==
X-Gm-Gg: ASbGncvxwN3qlaF1zmjkELpTtkIGc7K7Gqo1oIact3rjf+tOowsTVWOdjvLo4R9huPs
	Otyxw2b3KUEgOHgaHWdcArlZBccKvzW63usTTkHRXM2yA+KagCHt7mJNYqHw3s74D9VUzeVcfWY
	GAKWFBdogIJ1PM0m8SLw3J0JXbDEZ+p7xRov1d4/1db7Up5fcq0DOKzCdJ4q70qfcFYbyeVaCrw
	OetTVdtjfI7+uLpIeTrmN+j+G3PNp2t3AazgDBZMe6sOGocekXzO6Qd9c1Zu0ImZqFzMqQav/cp
	zSlIwFSp0MqjkDfnb9Vok+Rd/RrVoZIYWciy9lUi1iuJmoqHysKuFNG4fh6D1DW+bSQG2ukzVnA
	/yzilEUQBN0TZxsmpq7ok
X-Received: by 2002:a17:903:22cb:b0:234:df51:d16c with SMTP id d9443c01a7336-237d9badd36mr242209435ad.45.1750748084403;
        Mon, 23 Jun 2025 23:54:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUm37dtay0q0velYcFv3DxtYUDTccTngr+8MncRLErFXqkPNRqyeek5noM/HvJdeGJNIpTg==
X-Received: by 2002:a17:903:22cb:b0:234:df51:d16c with SMTP id d9443c01a7336-237d9badd36mr242208865ad.45.1750748083825;
        Mon, 23 Jun 2025 23:54:43 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103e5sm98486035ad.120.2025.06.23.23.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 23:54:43 -0700 (PDT)
Message-ID: <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:54:34 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
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
        Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20250610131600.2972232-8-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qRtgJDdWx4-ecCjLwd9bzE5n3yVjy2Bx
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a4bb5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=99H9UyJNq6-z9PcZsEwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qRtgJDdWx4-ecCjLwd9bzE5n3yVjy2Bx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfXwW63sTtRtdqa
 dpP7lYzZQg4BGp7nLknBP4vgt3lhp64PZ+I5xRqMH5cFVpANAptQvDCeaWa4cj6V86W89l25mXq
 zfAg49QdHQFr5xb5jpFl6hXjesqk6yraLmN4FX2NjHZzNadi7qtHK0Mbwvncy7667joyJXy2rtG
 7vBFNol4KfR3xR05XrGr9faFcaZg/8rO+G8HGPjJxp+kNT4iY0I0fux0MILFPHPhS+UrHe6RtOs
 0mtAqZVcs5C41kFSpDwqM+yS8yS4MGuNeSDJPKt63PgcREWPrLq9wXw+ENQZVwKAjgPx0wNAPUz
 Ay/VaE/M/amynQfBUx0DNDTODz8xX68l8UMhuMc3MBrhX66FSjYBdZl4WOA9LJ8H/nhhm46T8Qf
 5L33GswA0ElR7PO49zXqO+6PUM8cqfnbRlf8+2EADC33ssoso4axkJgV77ZzZZsvMfQsc7SN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240057

Hi Jens,

On 6/10/2025 11:13 PM, Jens Wiklander wrote:
> Add support in the OP-TEE backend driver for protected memory
> allocation. The support is limited to only the SMC ABI and for secure
> video buffers.
> 
> OP-TEE is probed for the range of protected physical memory and a
> memory pool allocator is initialized if OP-TEE have support for such
> memory.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/optee/Kconfig         |  5 +++
>  drivers/tee/optee/core.c          | 10 +++++
>  drivers/tee/optee/optee_private.h |  2 +
>  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
>  4 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> index 7bb7990d0b07..50d2051f7f20 100644
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
>  
>  	  Additional documentation on kernel security risks are at
>  	  Documentation/tee/op-tee.rst.
> +
> +config OPTEE_STATIC_PROTMEM_POOL
> +	bool
> +	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> +	default y
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index c75fddc83576..4b14a7ac56f9 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
>  	return 0;
>  }
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> +{
> +	u64 mask = DMA_BIT_MASK(min(64, pa_width));
> +

nit: Why not dma_coerce_mask_and_coherent() instead of bellow?

- Amir

> +	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
> +
> +	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> +}
> +
>  static void optee_bus_scan(struct work_struct *work)
>  {
>  	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
>  	tee_device_unregister(optee->supp_teedev);
>  	tee_device_unregister(optee->teedev);
>  
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  	tee_shm_pool_free(optee->pool);
>  	optee_supp_uninit(&optee->supp);
>  	mutex_destroy(&optee->call_queue.mutex);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index dc0f355ef72a..5e3c34802121 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -272,6 +272,8 @@ struct optee_call_ctx {
>  
>  extern struct blocking_notifier_head optee_rpmb_intf_added;
>  
> +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> +
>  int optee_notif_init(struct optee *optee, u_int max_key);
>  void optee_notif_uninit(struct optee *optee);
>  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index f0c3ac1103bb..cf106d15e64e 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
>  }
>  #endif
>  
> +static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
> +{
> +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> +	union {
> +		struct arm_smccc_res smccc;
> +		struct optee_smc_get_protmem_config_result result;
> +	} res;
> +	struct tee_protmem_pool *pool;
> +	void *p;
> +	int rc;
> +
> +	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> +			     0, 0, 0, &res.smccc);
> +	if (res.result.status != OPTEE_SMC_RETURN_OK)
> +		return ERR_PTR(-EINVAL);
> +
> +	rc = optee_set_dma_mask(optee, res.result.pa_width);
> +	if (rc)
> +		return ERR_PTR(rc);
> +
> +	/*
> +	 * Map the memory as uncached to make sure the kernel can work with
> +	 * __pfn_to_page() and friends since that's needed when passing the
> +	 * protected DMA-buf to a device. The memory should otherwise not
> +	 * be touched by the kernel since it's likely to cause an external
> +	 * abort due to the protection status.
> +	 */
> +	p = devm_memremap(&optee->teedev->dev, res.result.start,
> +			  res.result.size, MEMREMAP_WC);
> +	if (IS_ERR(p))
> +		return p;
> +
> +	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
> +	if (IS_ERR(pool))
> +		devm_memunmap(&optee->teedev->dev, p);
> +
> +	return pool;
> +#else
> +	return ERR_PTR(-EINVAL);
> +#endif
> +}
> +
> +static int optee_protmem_pool_init(struct optee *optee)
> +{
> +	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> +	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
> +	int rc;
> +
> +	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> +		return 0;
> +
> +	pool = static_protmem_pool_init(optee);
> +	if (IS_ERR(pool))
> +		return PTR_ERR(pool);
> +
> +	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
> +	if (rc)
> +		pool->ops->destroy_pool(pool);
> +
> +	return rc;
> +}
> +
>  static int optee_probe(struct platform_device *pdev)
>  {
>  	optee_invoke_fn *invoke_fn;
> @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
>  	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
>  	if (!optee) {
>  		rc = -ENOMEM;
> -		goto err_free_pool;
> +		goto err_free_shm_pool;
>  	}
>  
>  	optee->ops = &optee_ops;
> @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
>  		pr_info("Asynchronous notifications enabled\n");
>  	}
>  
> +	if (optee_protmem_pool_init(optee))
> +		pr_info("Protected memory service not available\n");
> +
>  	/*
>  	 * Ensure that there are no pre-existing shm objects before enabling
>  	 * the shm cache so that there's no chance of receiving an invalid
> @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
>  		optee_disable_shm_cache(optee);
>  	optee_smc_notif_uninit_irq(optee);
>  	optee_unregister_devices();
> +	tee_device_unregister_all_dma_heaps(optee->teedev);
>  err_notif_uninit:
>  	optee_notif_uninit(optee);
>  err_close_ctx:
> @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
>  	tee_device_unregister(optee->teedev);
>  err_free_optee:
>  	kfree(optee);
> -err_free_pool:
> +err_free_shm_pool:
>  	tee_shm_pool_free(pool);
>  	if (memremaped_shm)
>  		memunmap(memremaped_shm);

