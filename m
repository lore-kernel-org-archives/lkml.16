Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C631C5D4C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743188800; cv=none; b=hhmqjgBm9Db5slz+TMcmixHq2AXIcAeF+nPQ9eOvgrB7cC/VytfzNgAlRMKZGxP3Tg7rFN1jzaDwJHrS/X4vh8grVrtYY5upHs27JVB3PCV1ILJf8QwbYX/55XRx8sOmSe5++DawCZThju4kowetV8W2qFzR8Z1X9cV3OM4VG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743188800; c=relaxed/simple;
	bh=M64IOLP1uv/J6iWlZ2NVRHsj0q9QuienksfjE1UVi0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6CE8AmHPnKWmnlj0tA7mKaYyQ3xwKCH4JKi+eBt27as3AzYsntxYQLb0TqraWPJJMMFaJZivXkOhLingU6elna/rOGfW1d5TRurSXFmOWCML5CEbxHA5su8zQZwg0wPQATg+Xwxsx7DIplntcnn57EEspNCRxfqNN4niK9qlho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6642FEC;
	Fri, 28 Mar 2025 12:06:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D96A3F63F;
	Fri, 28 Mar 2025 12:06:36 -0700 (PDT)
Date: Fri, 28 Mar 2025 19:06:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Angelos Oikonomopoulos <angelos@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Message-ID: <Z-bzOrF-4lSykkgJ@arm.com>
References: <20250326133521.13637-1-angelos@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326133521.13637-1-angelos@igalia.com>

On Wed, Mar 26, 2025 at 02:35:21PM +0100, Angelos Oikonomopoulos wrote:
> do_alignment_t32_to_handler only fixes up alignment faults for specific
> instructions; it returns NULL otherwise. When that's the case, signal to
> the caller that it needs to proceed with the regular alignment fault
> handling (i.e. SIGBUS).

Did you hit this in practice? Which instruction triggered the alignment
fault that was not handled by do_alignment_t32_to_handler()? Standard
LDR/STR should not trigger unaligned accesses unless you have some
device memory mapped in user space.

> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
> ---
>  arch/arm64/kernel/compat_alignment.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
> index deff21bfa680..76cf1c1b5bc6 100644
> --- a/arch/arm64/kernel/compat_alignment.c
> +++ b/arch/arm64/kernel/compat_alignment.c
> @@ -34,7 +34,7 @@
>  
>  #define REGMASK_BITS(i)	(i & 0xffff)
>  
> -#define BAD_INSTR 	0xdeadc0de
> +#define BAD_INSTR	0xdeadc0de

Unrelated change (white space I guess), please drop it, not worth
fixing.

-- 
Catalin
