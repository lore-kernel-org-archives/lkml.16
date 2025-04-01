Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15FB1A2390
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487511; cv=none; b=a/KApQsN3vf09+nQSbSnINa0I6PoLB3PCcLp/HqZArP2RBPvUWaytq//QQPl7rHcyX9LUG8FdRw1W+OkRSXGQuNDFx41auPlrB+exlhdT5zHvDC8qTLjkKqd+VetixB8/Jd9wRhh5EyrRXqTkVO0K7qXh6koVyv/w+NOy+sMR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487511; c=relaxed/simple;
	bh=m05TQ3Jo1HDQW91S8oa0OW0B51ZhejqU0yzaIdKEdFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSjwnD2MRGmAYJdfg+Y7tMOI4WO+c/50U4V5CJoxDw6wPAXLpkGa5Jj3WCD2BXHIRnzzix3oIOD/oyfMSJ3bmjr9+27AdbXtoJrims4IHS3fJuUMMv0aiWU+RslKS1Ld2OvNKKOiY9D4Lr8O15yQv5IaWL6kvFjdBa9dxcWA06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA1E150C;
	Mon, 31 Mar 2025 23:05:11 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A14F3F63F;
	Mon, 31 Mar 2025 23:05:06 -0700 (PDT)
Message-ID: <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
Date: Tue, 1 Apr 2025 11:35:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250331085415.122409-1-angelos@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
> do_alignment_t32_to_handler only fixes up alignment faults for specific
> instructions; it returns NULL otherwise. When that's the case, signal to
> the caller that it needs to proceed with the regular alignment fault
> handling (i.e. SIGBUS).
> 
> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
> ---
>  arch/arm64/kernel/compat_alignment.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
> index deff21bfa680..b68e1d328d4c 100644
> --- a/arch/arm64/kernel/compat_alignment.c
> +++ b/arch/arm64/kernel/compat_alignment.c
> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>  		return 1;
>  	}
>  
> +	if (!handler)
> +		return 1;

do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
the right thing to do here and consistent. Otherwise does this cause a
kernel crash during subsequent call into handler() ?

>  	type = handler(addr, instr, regs);
>  
>  	if (type == TYPE_ERROR || type == TYPE_FAULT)
