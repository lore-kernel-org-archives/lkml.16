Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E027779F5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749196; cv=none; b=Wu36ag+olkgFP5u9eeNYAMgdcWUJBRBgbjPwF74bm5UCaF4zemDWM2+QVhsqxQJm/LxSYGIaq5KrEAgx/l4HQghOvZiF8TCmb7K80dAUpJJbmbdF628xfm5guFZkbHbuO8rIZTD/KHLybba091DstezOCo6Ww8gU5rkkxROkRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749196; c=relaxed/simple;
	bh=TO/Y2USpzYRUg4bT8WhOPaXWcfmQqfQUwsIwalxBOsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z52tmlXBgTeuxMkwHtpRbzMjL5q/ELzRarXb0gvxKvwtP4dZ3Z1lL3pNRi3x6uXPNWNkasn8/nzAxeGVrwz0xUDIdl4+22KqOV8HDiHL1gJZY9FUQ5fgCRZdBt3kLGAYPDtjzuFAR5XzF/gVnEzMUehzsqv1F1IEf+omw/EK7oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 757C41063;
	Thu,  3 Apr 2025 23:46:36 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 113043F694;
	Thu,  3 Apr 2025 23:46:30 -0700 (PDT)
Message-ID: <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
Date: Fri, 4 Apr 2025 12:16:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting
 ARCH_MMAP_RND_BITS_MAX
To: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ssradjacoumar@google.com, chromeos-krk-upstreaming@google.com,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
References: <20250403183638.3386628-1-korneld@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250403183638.3386628-1-korneld@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/4/25 00:06, Kornel Dulęba wrote:
> When the 52-bit virtual addressing was enabled the select like
> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> Because of that the rnd max bits would be set to the default value of
> 18 when ARM64_VA_BITS=52.
> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> be used if 48-bit addressing was used. That's because the 52-bit
> addressing is used only if the caller provides a hint to mmap, with a
> fallback to 48-bit addressing.

Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
bits VA in case the user does request for 52 bit VA via mmap() hint and
the HW supports it ?

> 
> Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
>  arch/arm64/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 748c34dc953c..38e0bac567f5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
>  	default 24 if ARM64_VA_BITS=39
>  	default 27 if ARM64_VA_BITS=42
>  	default 30 if ARM64_VA_BITS=47
> -	default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
> -	default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
> -	default 33 if ARM64_VA_BITS=48
> +	default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
> +	default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
> +	default 33 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
>  	default 14 if ARM64_64K_PAGES
>  	default 16 if ARM64_16K_PAGES
>  	default 18
