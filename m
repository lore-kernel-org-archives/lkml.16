Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB719E97B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195596; cv=none; b=luGvQagNPHZ2hhfkoW4Y0luBY39kpzkuoL9fztTCEhYbVsbBSBhu9Cdc1AqYVJE3aQdAAW4Buf7CycdAXTr69PZDOno98jsdC9iQK9V9CXo8VUnXyV+w9Xulb9yDZckBBODJowHjX1DTTnR//jgaZjuxOJX8R9NMALACI+h+gXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195596; c=relaxed/simple;
	bh=9NCnJEvTNi5RFQa82/PB0GyDEkBbpIKdoJQumbgTQ0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7n3828LkVOB+xhSwROehEKbcdh0YDxnPQ11T3FXM/Prc77NR1Mzfy+2oU2CDiACH+zKGtPtfFAL41n5OHousMColE3weWGzmDLGLXgXfPerwnllNXkCxmTfJgaM/l0hiSzbRFc2TByOQuLRwrm1MouCJwqvYPHheGnEJdiZywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496BFC4CEE4;
	Fri,  2 May 2025 14:19:54 +0000 (UTC)
Date: Fri, 2 May 2025 15:19:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jan Stancek <jstancek@redhat.com>
Subject: Re: [PATCH v2 1/2] arm64: vdso: Work around invalid absolute
 relocations from GCC
Message-ID: <aBTUh6WwC0_jl5_e@arm.com>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
 <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>

Hi Thomas,

On Wed, Apr 30, 2025 at 11:20:13AM +0200, Thomas Weiﬂschuh wrote:
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler emits
> PC-relative relocations.
> However GCC emits absolute relocations for symbol-relative references with
> an offset >= 64KiB. After recent refactorings in the vDSO code this is the
> case in __arch_get_vdso_u_timens_data() with a page size of 64KiB.
> 
> Work around the issue by preventing the optimizer from seeing the offsets.
> 
> Reported-by: Jan Stancek <jstancek@redhat.com>
> Closes: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
> Fixes: 83a2a6b8cfc5 ("vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
> index 92a2b59a9f3df4d20feb483e6d8ebd1d813b7932..3322c7047d84fecae316a2904f1adec0cb458f6f 100644
> --- a/arch/arm64/include/asm/vdso/gettimeofday.h
> +++ b/arch/arm64/include/asm/vdso/gettimeofday.h
> @@ -99,6 +99,19 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
>  	return res;
>  }
>  
> +#if IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB)
> +static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
> +{
> +	const struct vdso_time_data *ret = &vdso_u_time_data;
> +
> +	/* Work around invalid absolute relocations */
> +	OPTIMIZER_HIDE_VAR(ret);
> +
> +	return ret;
> +}
> +#define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
> +#endif /* IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB) */

Thanks for the fix. We may have to chase other such cases in the future
but I don't have any better suggestion.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Question for the other Thomas (tglx): what's your preference, do you
plan to take these through tip or shall I queue them via the arm64 tree?

Thanks.

-- 
Catalin
