Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C3E253F3F;
	Tue, 29 Apr 2025 04:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745900095; cv=none; b=d2PP8/p6HR/CM9+hwQH/vFkf/l6raQF5OKIfrURhQeHc1rqxUKw9osNk07RTJJmEZFKNzDiykuKdk1U4RJnMsP0jFR7Zm4clu2xiX+10himiRZlR3RddpelMPO3qyxM9T2on5HgaBHINbFqeACoKGRUYd7fF6M3MP1OirWMT5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745900095; c=relaxed/simple;
	bh=baMMwFVDxypluEk8CV7aFD5fbx3ebJGyWjS37zcBV2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtP9pGhQ1AfkdwlDCRJKAB0GBoGSE6OckVcD9qTm84f61/25XmjBBTi6+AWKbApXp0Aoi2GjbwdvZ2KCvk7TBiAwKSOoog9YiPf2LoW8l6tpATYye5cgtkQK8jfLIDOtcUP1zqvyU0wyf657p9T39P+GW5pBGm4dd9ZRWY1OOcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A55C1515;
	Mon, 28 Apr 2025 21:14:46 -0700 (PDT)
Received: from [10.163.52.122] (unknown [10.163.52.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C797B3F66E;
	Mon, 28 Apr 2025 21:14:49 -0700 (PDT)
Message-ID: <afc531fe-c4d0-4676-92ef-c5cfc63a3967@arm.com>
Date: Tue, 29 Apr 2025 09:44:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/16/25 11:57, Anshuman Khandual wrote:
> Add an entry for nodebugmon which has been used on arm64 platforms.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc2
> 
>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d9fd26b95b34..f4a313d6c0ab 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4085,6 +4085,13 @@
>  			/sys/module/printk/parameters/console_suspend) to
>  			turn on/off it dynamically.
>  
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.
> +
>  	no_debug_objects
>  			[KNL,EARLY] Disable object debugging
>  

Any updates on this ?
