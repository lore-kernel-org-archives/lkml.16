Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674F122D78A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711743; cv=none; b=C2KKI+WvMBhIfqDRDKsz6o6DQdFrKILM29BZPwtrPEcO9cJm+uMgBEPnPevl4kBHypmTVphaQzZnE70Fr38r8cItxbQ9edrLdH3AXJBO2JzeZniajZB1s2jBOMuhL3VXYScyznMs0hZlOEIEumhoMvaKOaRoG0h6WKTLLOmb24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711743; c=relaxed/simple;
	bh=v12XHqKEzDEirzDTPXp9IK0M/UIJ/WsUETNMMhI+JF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNw7hzly+hHlypkd5GJnUXu3FwNt1QMNKvJxvYez5I/MinOY++1nObFUYGxU/9d7DOnfLYQRHxnE9ge39W+ij3h1l4O7rJfnLdk0LrxeRv1Ntud2kwSIXGBYyCT5dFtVIlRdjhjwdWByYt2SLThFkOJfSBUIGz8qml+QHxUqe/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE4E106F;
	Thu,  8 May 2025 06:42:11 -0700 (PDT)
Received: from [10.1.26.156] (e137867.arm.com [10.1.26.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B1C33F58B;
	Thu,  8 May 2025 06:42:20 -0700 (PDT)
Message-ID: <6e861958-da74-4761-abb6-c7f3b56f7784@arm.com>
Date: Thu, 8 May 2025 14:42:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <20250508044752.234543-1-anshuman.khandual@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250508044752.234543-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anshuman,

On 08/05/2025 05:47, Anshuman Khandual wrote:

> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc5
>
> Changes in V2:
>
> - Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
> - Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
>    install_ss() per Ada

Thanks for the changes, the patch looks good to me now !

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


