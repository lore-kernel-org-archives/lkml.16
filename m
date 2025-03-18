Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FCD1C36
	for <linux-kernel@vger.kernel.org>; Tue, 18 Mar 2025 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742277294; cv=none; b=pXwkZZXpcgWs3TknOiEmKLBpybzKadqbKkHoyzOjpc9xysYHfrhWG89iBxI6XhUuBGkDUqa/nsjmQf+nBtSugyq8GYOpw4pyrC0AUO2Vs+gs/GNZde5wxE6wjknYQNBW9i+a/bhx/zimm2lHHBEAlDLJ9Em/1witIBhj8qQRJ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742277294; c=relaxed/simple;
	bh=LeDl/wb2FB0mMxlDMsasaf/IqG7uAFRimvjuHCuQtNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuQr+aQv74p+EDitcLVMGOKsannnqA6mia4Nebo9L82vS98Gzu7isNEKM9PTTTgXYTDZUXGVYhHEe65Mvueo8DIRCj2G6dNHhD/vXpOF6f+sakSUfE8dAxPnM7QWfmsa/KVRYPzk5pAtMjFx/M8oPAHDHhlNw5ujv3O5GVO0Ym0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD1A0152B;
	Mon, 17 Mar 2025 22:54:59 -0700 (PDT)
Received: from [10.163.44.33] (unknown [10.163.44.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B70BA3F63F;
	Mon, 17 Mar 2025 22:54:48 -0700 (PDT)
Message-ID: <9abeecc3-2b19-43ba-8619-ea286d54db8e@arm.com>
Date: Tue, 18 Mar 2025 11:24:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64/mm/hotplug: Drop some redundant WARN_ON()
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250221094449.1188427-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250221094449.1188427-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/25 15:14, Anshuman Khandual wrote:
> This series drops some redundant WARN_ON() tests which are not required any
> more while unmapping and freeing up kernel page table pages during a memory
> hot remove operation.
> 
> This series applies on v6.14-rc3
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (2):
>   arm64/mm/hotplug: Drop redundant [pgd|p4d]_present()
>   arm64/mm/hotplug: Replace pxx_present() with pxx_valid()
> 
>  arch/arm64/mm/mmu.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 

Gentle ping, any updates on this series ? This simplifies WARN_ON()
checks during memory hotplug operation, after subsequent changes to
page table helpers such as pxd_present() etc.
