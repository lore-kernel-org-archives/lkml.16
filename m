Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D698A1386DA
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 04:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676822; cv=none; b=C4jFRqW/qMmsV9GArVjOVtxOP7JjG/O3h7mZ4a93/1EIXsRZbh02U+eBDBjotPtYxWNCKI0ShqRPhJCe565eZ+MOiTLbCdVrxg8Izl2JeatA8GkOvKc1TgA8GDq597s45vagpW/XXOMkxWhyDKzpKe0dAeM9JWljgE80FnXkQgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676822; c=relaxed/simple;
	bh=PmSVdl+UvuG5FG70NhIwEGyowO9u0Ll9gMgWbPIX5K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bekkmijNz2OlkNBW2+KAVw4UMkfz4IULpP8AIhO09LIrtY0IB+zVVSEtPZgPI/kj4dzCiW8II0TDoHA8Hzs3Rt5EQuEmkCxuPzi8yESI0y8OIU4WQ8C2hk6YubZ+3tulADtq2/VufhbvFv4iX65xYdKw9CvkSv1LVF42BFDr/i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71B45106F;
	Wed,  7 May 2025 21:00:08 -0700 (PDT)
Received: from [10.162.43.19] (K4MQJ0H1H2.blr.arm.com [10.162.43.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48E9C3F5A1;
	Wed,  7 May 2025 21:00:14 -0700 (PDT)
Message-ID: <613ae7bd-b006-4f5a-8916-345001beb50f@arm.com>
Date: Thu, 8 May 2025 09:30:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Drop duplicate check in pmd_trans_huge()
To: Gavin Shan <gshan@redhat.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 anshuman.khandual@arm.com, ryan.roberts@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, yangyicong@hisilicon.com, shan.gavin@gmail.com
References: <20250508035142.189726-1-gshan@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250508035142.189726-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/05/25 9:21 am, Gavin Shan wrote:
> pmd_val(pmd) is inclusive to pmd_present(pmd) since the PMD entry
> value isn't zero when pmd_present() returns true. Just drop the
> duplicate check done by pmd_val(pmd).
> 
> No functional changes intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> Found this by code inspection
> ---
>   arch/arm64/include/asm/pgtable.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index d3b538be1500..2599b9b8666f 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
>   	 * If pmd is present-invalid, pmd_table() won't detect it
>   	 * as a table, so force the valid bit for the comparison.
>   	 */
> -	return pmd_val(pmd) && pmd_present(pmd) &&
> -	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
> +	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
>   }
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   

LGTM

Reviewed-by: Dev Jain <dev.jain@arm.com>
