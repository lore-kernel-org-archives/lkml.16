Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0CCEAF1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072540; cv=none; b=uPspHhU5pjRUPtPBWS+Uw9Cj/+kSdoE1iWcdYH4h3nZ+4HitSl91HwHOvUcYV4b9CcmbdwOrnsi8dlvc7DffmIKN94cS+KlTx/na3U5KRFAT64yVxek+FzH5SXW54aVY1aQSSrDouhzCrIySdxInhaPjNFWy+HUkkGa/jYS9gcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072540; c=relaxed/simple;
	bh=TCzi3ed8dsyYfOS7QGDf3ScUMu2NO0cSnD4uHOnhK4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hkg8w+uqQmAU+3TWaCTki4I6YYLCNd5jHKK9YsHKs34kHduPkDG1bY62GSkgAsoR6u9ZiRnTO1sJ5POtvncDcvxcS7YkLnUCaVjmf4uUNC6CUmMru9aE0p4OoRc8QR5OMZ/OZjBLNWyTdP0je6EaGCoWVEmxho6OyPi9QmFYlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7087E150C;
	Mon, 16 Jun 2025 04:15:14 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 102C73F673;
	Mon, 16 Jun 2025 04:15:34 -0700 (PDT)
Message-ID: <55346820-fbca-4b23-824e-89483601bf61@arm.com>
Date: Mon, 16 Jun 2025 12:15:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: realm: Add support for encrypted data from
 firmware
To: linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, steven.price@arm.com, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250613111153.1548928-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:11, Suzuki K Poulose wrote:
> Confidential compute firmware may provide secret data via reserved memory regions
> (e.g., ACPI CCEL, EFI Coco secret area). These must be ioremap'ed() as encrypted.
> As of now, realm only maps "trusted devices" (RIPAS = RSI_RIPAS_DEV) as encrypted.
> This series adds support for mapping areas that are protected
> (i.e., RIPAS = RSI_RIPAS_RAM) as encrypted. Also, extrapolating that, we can map
> anything that is not RIPAS_EMPTY as protected, as it is guaranteed to be "protected".
> 
> With this in place, we can naturally map any firmware provided area based on the
> RIPAS value. If the firmware provides a shared region (not trusted), it must have
> set the RIPAS accordingly, before placing the data, as the transition is always
> destructive.
> 
> Also enables the EFI Coco secret area support and Confidential Compute Event
> Log (CCEL) for arm64.
> 

A branch with the patches is also available here:

git@git.gitlab.arm.com:linux-arm/linux-cca.git  cca-guest/coco-secret/v1


Suzuki


> 
> Suzuki K Poulose (3):
>    arm64: realm: ioremap: Allow mapping memory as encrypted
>    arm64: Enable EFI secret area Securityfs support
>    arm64: acpi: Enable ACPI CCEL support
> 
>   arch/arm64/include/asm/io.h          |  6 +++++-
>   arch/arm64/include/asm/rsi.h         |  2 +-
>   arch/arm64/kernel/acpi.c             |  5 +++++
>   arch/arm64/kernel/rsi.c              | 26 ++++++++++++++++++++++----
>   drivers/virt/coco/efi_secret/Kconfig |  2 +-
>   5 files changed, 34 insertions(+), 7 deletions(-)
> 

