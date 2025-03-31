Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A43B191F94
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743419720; cv=none; b=QGPDtUbVh4mad5FUz+ouv8qo0nGrpB13wNAdii3fnIwnKTBecFgvJZ2qCW+FDnF0prue0im1KCJfGlu0t4Dc+CJI9EdMyeLftfIKB2Y0vB78mVta1uZpy4zTWlKf5RbuOW9SpED2WTNJf6uIYhdWP+7wzyMF2kCmxwL3q2Qh7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743419720; c=relaxed/simple;
	bh=D8Em8BVNXif9GajVEZqCWriTDda1ygYzADo5cDz4z0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJMxbyoymibvT5WTrtNgtKvTkVdzKTsPz5+9I4FiCJcjx9PZL/+5+bnNAeol13I7M/rAJ4GdVq748JNf7jef1aeIwIt5vv9Bb5SsVT7bbPwimglBGmMFJ9Z4CLmYoHq4C9C1gpgsGw5z2siMzxmXeMuUmlmVEEF/Ib57KgyOumw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30B251F02;
	Mon, 31 Mar 2025 04:15:22 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8830B3F694;
	Mon, 31 Mar 2025 04:15:14 -0700 (PDT)
Message-ID: <2aa3bf07-924b-4359-b566-0db57d53cdf5@arm.com>
Date: Mon, 31 Mar 2025 12:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
 <20250324185801.168664-5-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250324185801.168664-5-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/03/2025 18:57, Ariel D'Alessandro wrote:
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> Address Extension", which in Linux we've called "mali_lpae".
> 
> This commit adds support for conditionally enabling AARCH64_4K page
> table format. To achieve that, a "GPU optional quirks" field was added
> to `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

(one very minor nit below)

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
>  3 files changed, 183 insertions(+), 7 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 294f86b3c25e..ccf51fd5f9c0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
[...]
> +
> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
> +				  enum io_pgtable_fmt fmt)

NIT: It's always hard to see in the diff, but the alignment of the
second line is wrong. But I'll fix this up when merging.

Thanks,
Steve

