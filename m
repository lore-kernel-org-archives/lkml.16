Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF4163
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747388423; cv=none; b=CDyyFUArNd7Kbi7ZNq20ZhRCn3ZI6s2CjxDKNfJJVk+pXvXohFbY9klkeMu8MRZ1GaB0LJTkq1h6NG9C3Juxy0h/ndBOB/AXmkUrLFx741kYKeE2kAVq8Ogn3bIqdW897RF8EcfJ2l5/EJVBd6UfsbPiuWTTUHgg5PSFxMKEeEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747388423; c=relaxed/simple;
	bh=txK/33NrTZCl4GYsMTYr6JWHHtDzr12jMC72RWogYBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gH/suHVMIu/tiKv8+nSRz5kSrynTq/TIVfC49adjKqK0gLKiBzv0ect2jps4wQhOMz8ZC74DIyrvo89Nw+uLmVkOvwgG/TfE9wGDmz1Hc25f4rL45WOvBrQO00MsGJ+NpytzDQ6/xmmlWqxzYMQpnG71RKTzJwHmjtFPwSf4mo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=S1xtfRw/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="S1xtfRw/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HwPh2eBNs0hNXHHLT8tt8Qp541jzhDZo++QuI5wHTns=; b=S1xtfRw/E021Pp6I0qsKt4PurZ
	9YVzcuiyjEoihL0GxI8K13n1cs535UI3B/GFNTgIWviER+j22RK2X/uifKH9Hrvl/fGTvovjKNSTk
	lSiZlLSMLQ5EVN8RMYRGoRahHMawjKckJzDh0YCSU2dBAHVbDgIiBFmUEtO5hslCLBkOl5k0Ly4YC
	X7u8nZCiYAe+QrYVEnDh6dAnoxybPzu0Sh+DhthfY2wmFbhzvHgPp7WEako0H1lmXbU0yOfDoByfu
	SDIrHdXYnCapVb9ztulpwvHk/TEfld9sG9pTJ5eu4ZPUQHwwPAP6Dn5Ur2uvSpaYzusFYfVjDtzLw
	OPdoIaiQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uFrSD-0091XF-LP; Fri, 16 May 2025 11:40:08 +0200
Message-ID: <236644fd-dbf4-48b0-a341-a26c0c8b9515@igalia.com>
Date: Fri, 16 May 2025 10:40:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/sched: Warn if pending list is not empty
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250424095535.26119-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/04/2025 10:55, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
> 
> Warn if that happens.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c2ad6c70bfb6..0c56b85c574f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1457,6 +1457,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	sched->ready = false;
>   	kfree(sched->sched_rq);
>   	sched->sched_rq = NULL;
> +
> +	if (!list_empty(&sched->pending_list))
> +		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");

Is this expected to trigger for many drivers? In that case I am not sure 
if it helps anyone, apart from generating bug tracker entries across the 
world, for the issue we know about and could work
"quietly" on addressing it? Only if you think we don't really know who 
leaks and who doesn't and this will help figure out.

Hm wait, at this point in the series it would fire incorrectly for the 
mock scheduler. It should go last in the series at minimum.

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(drm_sched_fini);
>   

