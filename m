Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AE21018F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690735; cv=none; b=ReWKOkoI4K5xVe4mtwMAvmbekvnC6pE7AOwTHWr/tN0j2v2jBCKUt39ix3PF3czrNeyRJ8nOWmgbxaDxcjW/hDJnwmaeCBN9LTQSbeZ8P1lDHdX/+GzJd3shG0jBEuqz7ARHU+KlAd/Rm48kd6VaAmfIrdiAYny4vzWywVIpJqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690735; c=relaxed/simple;
	bh=WCRZByRUZpxmsXzHGVCvKrD10+f8Bu3lRPM31G4RUNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew/rLTlanccAMUEhJov0RGjzs+dI0IwehDRhcL6ZogdplBrmTpKh9Ha+0Sz9knv1wOQXriT1wwH7JjphyX0LDnvSxora9XL9IezREjmZW9Lslie16xGC/4+YrZGAWpE6Q5FVVfiFX8P1p56k0LV1oCQOBGp1uLFvvz/tWZr/j0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e02cnDo+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e02cnDo+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746690732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ym5IsgJPELXlmxVUiqqeE5x95LD2/wvG6YGV47RIG4=;
	b=e02cnDo+8Ut2CE4yePcuv5/M81XElr+h2fAEf6DGcAYl/obIIcp7e6ik3QHcSO3aolfO2w
	W8FXBFC+4CHDvvCA9Ehu4jzlI5f8HoQH8WSVEU9+3Y+xzXtKkeTJS86XGnsu6Jef7AzHIm
	hrVl+sk1ziYkAcAkNmR2L0hNIgHkHsE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-uoOCdMg9OBicCzW3qE3Qrw-1; Thu,
 08 May 2025 03:52:09 -0400
X-MC-Unique: uoOCdMg9OBicCzW3qE3Qrw-1
X-Mimecast-MFC-AGG-ID: uoOCdMg9OBicCzW3qE3Qrw_1746690728
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 396331956089;
	Thu,  8 May 2025 07:52:08 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A9551955F24;
	Thu,  8 May 2025 07:52:06 +0000 (UTC)
Date: Thu, 8 May 2025 15:52:01 +0800
From: Baoquan He <bhe@redhat.com>
To: fuqiang wang <fuqiang.wang@easystack.cn>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <aBxiod8BG9gR49Hl@MiWiFi-R3L-srv>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <aBxfflkkQXTetmbq@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxfflkkQXTetmbq@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 05/08/25 at 03:38pm, Baoquan He wrote:
> In memmap_exclude_ranges(), elfheader will be excluded from crashk_res.
> In the current x86 architecture code, the elfheader is always allocated
> at crashk_res.start. It seems that there won't be a new split range.
> But it depends on the allocation position of elfheader in crashk_res. To
> avoid potential out of bounds in future, add a extra slot. And using
> random kexec_buf for passing dm crypt keys may cause a range split too,
> add another extra slot here.

Sorry, this should be from fuqiang wang, when I edited the patch to
reply to his patch, I forgot that. Please help makes change to set
Fuqiang as the patch author, I just adapted the content based on Coiby's
patches.

> 
> The similar issue also exists in fill_up_crash_elf_data(). The range to
> be excluded is [0, 1M], start (0) is special and will not appear in the
> middle of existing cmem->ranges[]. But in cast the low 1M could be
> changed in the future, add a extra slot too.
> 
> Previously discussed link:
> [1] https://lore.kernel.org/kexec/ZXk2oBf%2FT1Ul6o0c@MiWiFi-R3L-srv/
> [2] https://lore.kernel.org/kexec/273284e8-7680-4f5f-8065-c5d780987e59@easystack.cn/
> [3] https://lore.kernel.org/kexec/ZYQ6O%2F57sHAPxTHm@MiWiFi-R3L-srv/
> 
> Signed-off-by: fuqiang wang <fuqiang.wang@easystack.cn>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
> v4->v5:
> - This is on top of Coiby's LUKS patchset in branch mm-nonmm-unstable of
>   akpm/mm.git. I did some adaption based on Coiby's patches.
> - [PATCH v9 0/8] Support kdump with LUKS encryption by reusing LUKS volume keys
> 
>  arch/x86/kernel/crash.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index bcb534688dfe..749a60ce8b7f 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -165,8 +165,18 @@ static struct crash_mem *fill_up_crash_elf_data(void)
>  	/*
>  	 * Exclusion of crash region and/or crashk_low_res may cause
>  	 * another range split. So add extra two slots here.
> +	 *
> +	 * Exclusion of low 1M may not cause another range split, because the
> +	 * range of exclude is [0, 1M] and the condition for splitting a new
> +	 * region is that the start, end parameters are both in a certain
> +	 * existing region in cmem and cannot be equal to existing region's
> +	 * start or end. Obviously, the start of [0, 1M] cannot meet this
> +	 * condition.
> +	 *
> +	 * But in order to lest the low 1M could be changed in the future,
> +	 * (e.g. [stare, 1M]), add a extra slot.
>  	 */
> -	nr_ranges += 2;
> +	nr_ranges += 3;
>  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
>  	if (!cmem)
>  		return NULL;
> @@ -313,10 +323,15 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
>  	struct crash_mem *cmem;
>  
>  	/*
> -	 * Using random kexec_buf for passing dm crypt keys may cause a range
> -	 * split. So use two slots here.
> +	 * In the current x86 architecture code, the elfheader is always
> +	 * allocated at crashk_res.start. But it depends on the allocation
> +	 * position of elfheader in crashk_res. To avoid potential out of
> +	 * bounds in future, add an extra slot.
> +	 *
> +	 * And using random kexec_buf for passing dm crypt keys may cause a
> +	 * range split too, add another extra slot here.
>  	 */
> -	nr_ranges = 2;
> +	nr_ranges = 3;
>  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
>  	if (!cmem)
>  		return -ENOMEM;
> -- 
> 2.41.0
> 

