Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA791B423C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419765; cv=none; b=fMXXsnHBrWuLaxy8Vr5dLvXSP9oBA/Ol5Z8XTt/czP/5bkVOJ15l77n+NUcmcJ9NJ/iI+Jhfo9Em+9K9jGYcCaIkAGm0VAp50uL8+DBw/82SKOfY5I5Y5WBiTYz12iVBrWLmAv3TpbXsA6AHSRh5r1NydlOPt/su2skF1TcynZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419765; c=relaxed/simple;
	bh=pZbexU0CRO7f0MpBQDZBAgEa9CNEdvwW3aE/6IDH1wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeNml6sh+UBCJa91+5kxQZ2nOtAYRT0HNK1qRiMQthIEG4q4UiZ4MwmI75Mg/iAaThgcOmsOuMBEUKAs08WEvNUjPEo4L2e9OccmPK6KvileLhzr0l0qoE+BPlxqj/6Qgx+qSYFXfTtSDmOONM9y+XD3PuBpELKuuWR0ahzTK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC741F02;
	Mon, 31 Mar 2025 04:16:06 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C152A3F694;
	Mon, 31 Mar 2025 04:16:00 -0700 (PDT)
Message-ID: <867cca4f-7180-42e6-bb2a-9f73ad09e5e4@arm.com>
Date: Mon, 31 Mar 2025 12:15:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2025 18:57, Ariel D'Alessandro wrote:
> Hi all,
> 
> This is a new iteration on Panfrost support for AARCH64_4K page table
> format. The main reason behind this patchset is that MediaTek MT8188 SoC
> (ARM Mali-G57 MC3 GPU) constantly faults due to the actual Panfrost cache
> configuration.
> 
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as Bifrost
> calls it) mode, a (modified) version of LPAE "Large Physical Address
> Extension", which in Linux we've called "mali_lpae".
> 
> This patchset adds support for conditionally enabling AARCH64_4K page table
> format. To achieve that, a "GPU optional quirks" field was added to
> `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> The patchset only enables the new format on Mediatek MT8188 and MT8192,
> which have been tested on a Mediatek Genio 700 EVK (MT8390) and Mediatek
> Genio 1200 EVK (MT8395) boards respectively.
> 
> Thanks!
> 
> Changes in v5:
> * Fixed drm_WARN() in panfrost_mmu_cfg_init().
> 
> Changes in v4:
> * Fixed panfrost_mmu_cfg_init() return value on warning.
> 
> Changes in v3:
> * Fixed error handling in panfrost_mmu_ctx_create().
> 
> Changes in v2:
> * Dropped panfrost_mmu_enable/disable unification.
> * Rename gpu_configs as gpu_quirks.
> * Added error handling on page table not properly aligned.
> * Enabled AARCH64_4K format on MediaTek MT8192 as well.
> * Minor fixes.
> 
> Changes in v1:
> * Added "Set IOMMU_CACHE flag" patch.
> * Replaced `panfrost_mmu->enable()` function pointer by `cfg` struct
> prepared during init time.
> * Made mali_lpae/aarch64_4k name more clear.
> * Added GPU_CONFIG_AARCH64_4K flag to enable AARCH64_4K page table
>   format.
> * Enabled AARCH64_4K mode only on mediatek-mt8188.
> 
> Ariel D'Alessandro (6):
>   drm/panfrost: Set IOMMU_CACHE flag
>   drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
>   drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
>     models
>   drm/panfrost: Add support for AARCH64_4K page table format
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
> 
>  drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c      |   2 +
>  drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c      | 150 +++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
>  5 files changed, 196 insertions(+), 11 deletions(-)
> 

This looks in good shape now, so unless anyone shouts I'll merge this to
drm-misc-next later today.

Thanks,
Steve

