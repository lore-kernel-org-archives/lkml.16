Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04945202F8B
	for <linux-kernel@vger.kernel.org>; Fri, 14 Mar 2025 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741969531; cv=none; b=tc7Oj54paw+APugic2vQGqPypaWiaGZ0P/tbYjXyIf3NxXbI8r9HjsooOH/G+ueODK5MPHjkbTquGfxZB5/Kvl1JCznlop/KAifPjOCr7DrUPE3eSNTuniJ2wHHGg4oeq7IGp6mji0iLw9X9b0+MUbS+MW0/9npyV0r7g3G+J2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741969531; c=relaxed/simple;
	bh=B8E0rBQwlOmJRPN8iP2E/qnSzvLZZxPdbvemm1eBJ7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7rEvQW3SSjN+Q3GfSRMi6nqcW/gYxJUEtzFQEH+x1Tl6H/aDQ/5HO9lEcCkQzr/Psp7YwjrvQG77ZwMYRNb5DCkCgPOvlje46g6hnOABwRkIgXOPZ9Ll5W+xEHMqlQ8/oYv1ekJ31hJVKTMlOoocx2eSFlxLKsCDs49TyXLls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43D7113D5;
	Fri, 14 Mar 2025 09:25:39 -0700 (PDT)
Received: from [10.1.26.16] (e122027.cambridge.arm.com [10.1.26.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E5F13F5A1;
	Fri, 14 Mar 2025 09:25:25 -0700 (PDT)
Message-ID: <f575f3f0-b6cb-4ef6-a522-0ddced78476f@arm.com>
Date: Fri, 14 Mar 2025 16:25:24 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature
 flag on Bifrost models
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-7-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250310195921.157511-7-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2025 19:59, Ariel D'Alessandro wrote:
> Set this feature flag on all Mali Bifrost platforms as the MMU supports
> AARCH64 4K page table format.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 7ed0cd3ea2d4c..52f9d69f6db9d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -54,6 +54,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g72 (\
> @@ -64,6 +65,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g51 hw_features_g72
> @@ -77,6 +79,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
>  	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g76 (\

