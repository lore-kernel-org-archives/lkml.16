Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDB15A86B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747468794; cv=none; b=FAGJCOA0/XJb5/+JWbDaxYuJanTUVHJS7ofelOUSr40taikquo5NgAmpDanZpNUlIPc+/X3fgaBDObbjBYjbMj/wTHg1xw+PysskcbeGqVjOx7CppNFUpO6cbHqHsXB0Wl7R0Ncb7guPJMYulgbC8JpxfTF6zvp9aFxEytqvMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747468794; c=relaxed/simple;
	bh=4tQF5xih7V/rvCw9zMCakloK3rx/l+YpV0BFbx+lkrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtfzNHVnlpegt5WaksHSvsiA5sGQ5x3R40fnZCfOQ42+GFehHJamBqb1G2uthQ0BL4tK6DrY54xg8cQRf1VLyus+7QTbMKgefewgkvi3CIdZsqF98MIjTDLAIhNJrZLlnh3KwGLb91avEmqdHQRDHgBo847TTIwfooe5z2vot38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pfy6WaB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfy6WaB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77880C4CEE3;
	Sat, 17 May 2025 07:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747468793;
	bh=4tQF5xih7V/rvCw9zMCakloK3rx/l+YpV0BFbx+lkrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfy6WaB5aCyJxaXTmcss1e3Uj8gyr7H5rCi14StwkuULVsnpviJuUJvGuyYNxRL8D
	 T+blvfXa/mt4vck6O6GMTWQKFtLKAk20Nia0iYcQxY7PVmBvxNL6ICgvjef3IfEURZ
	 L9qti+OfU+TrxmXKgJaN3ARuJi67Hdhwe/R724gRERko0/K1G5ZVsM2rr9o+JaC3OJ
	 vBpWz0wdRWX7Dv7jXdtDoRh9EPklSyPqoN/T7w08NzOMlYtudvj7B91ldFFv/PSuzK
	 hi9RwWSryKut3F0mskg8BxgNpLG9St8e/bD3PQngg3mwAIrdDZ+qQBmDcdKy5SZF1J
	 gWgdxxmQWTPVA==
Date: Sat, 17 May 2025 09:59:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] x86/mm: resize user_pcid_flush_mask for PTI / broadcast
 TLB flush combination
Message-ID: <aChB9ORFxaL8VfyD@gmail.com>
References: <20250516123317.70506358@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516123317.70506358@fangorn>


* Rik van Riel <riel@surriel.com> wrote:

> @@ -121,7 +140,11 @@ struct tlb_state {
>  	 * the corresponding user PCID needs a flush next time we
>  	 * switch to it; see SWITCH_TO_USER_CR3.
>  	 */
> +#if defined(CONFIG_X86_TLB_BROADCAST_TLB_FLUSH) && defined(CONFIG_MITIGATION_PAGE_TABLE_ISOLATION)
> +	unsigned long user_pcid_flush_mask[(1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG];
> +#else
>  	unsigned short user_pcid_flush_mask;
> +#endif

1)

CONFIG_X86_TLB_BROADCAST_TLB_FLUSH doesn't actually exist, the name is 
CONFIG_BROADCAST_TLB_FLUSH.

This patch could not possibly have been tested on a vanilla kernel on 
actual hardware in the PTI usecase it claims to fix...

2)

Testing aside, this definition and the usage of user_pcid_flush_mask is 
unnecessarily confusing, as it also defines user_pcid_flush_mask when 
it's not actually used by runtime code. user_pcid_flush_mask is only 
used if CONFIG_MITIGATION_PAGE_TABLE_ISOLATION=y, so as an interim step 
we could make this a more obvious:

   #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
   # ifdef CONFIG_BROADCAST_TLB_FLUSH
	unsigned long user_pcid_flush_mask[(1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG];
   # else
	unsigned short user_pcid_flush_mask;
   # endif
   #endif

And wrap the body of invalidate_user_asid() in an #ifdef 
CONFIG_MITIGATION_PAGE_TABLE_ISOLATION. The entry assembly code is 
already under such an #ifdef.

And once we do that it becomes obvious that the two definitions of 
user_pcid_flush_mask can be merged by doing something like:

   #ifdef CONFIG_BROADCAST_TLB_FLUSH
   # define CR3_AVAIL_PCID_LONGS ((1 << CR3_AVAIL_PCID_BITS) / BITS_PER_LONG)
   #else
   # define CR3_AVAIL_PCID_LONGS 1
   #endif

   #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
   unsigned long user_pcid_flush_mask[CR3_AVAIL_PCID_LONGS];
   #endif

(Or so, if I counted my bits and longs right.)

And we can drop the ugly & fragile type cast in invalidate_user_asid():

-	__set_bit(kern_pcid(asid),
-		  (unsigned long *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));

+	__set_bit(kern_pcid(asid), this_cpu_ptr(cpu_tlbstate.user_pcid_flush_mask));

And yeah, this means user_pcid_flush_mask is a long on 
!CONFIG_BROADCAST_TLB_FLUSH kernels, while it was a short before.
Literally nobody cares, because it's enabled on all distro kernels that 
have CPU_SUP_AMD:

  config BROADCAST_TLB_FLUSH 
        def_bool y
        depends on CPU_SUP_AMD && 64BIT

Literally no Linux distribution is going to have this option disabled.

Ie. we'd be uglifying and obfuscating the code for a config that people 
aren't actually using...

3)

If we are going to grow user_pcid_flush_mask from 2 bytes to 256 bytes 
then please reorder 'struct tlb_state' for cache efficiency: at minimum 
the ::cr4 shadow should move to before ::user_pcid_flush_mask. But I 
think we should probably move user_pcid_flush_mask to the end of the 
structure, where it does the least damage to cache layout.

Thanks,

	Ingo
