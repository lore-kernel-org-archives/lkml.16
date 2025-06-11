Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAC19D890
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663259; cv=none; b=RLquHJLOsYcdCoK2UBxGfEIZQHqKpW4d68QaU0dCZ/naGHV/L25YhedPhJaehMZG3pkYK0Xy9IomHm/MOsgkPwW0aAg+TA4gxHpaBJRHveEvqtI6g+mSchMskhiF4z7fJ+c9bMSPhAuu6oFOQgOPvfHvGX64SKs6sVAStpSFX1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663259; c=relaxed/simple;
	bh=arq9sEPBSyiJkrXfXGK5H21SI5ic27DxPn+1UFfC1ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pn5csDNAJye0vcb/rEZ4hw2TVnW2NQhx4aQz5QNbeKNuwwnQCpoM47w1rdS9Z5dzH3l4H1KF/h93x5pdWM1SfLQuhmvVDm+A9X/sW9frF2jdEDJQ0VtyXHlPGDuOj0PH7QpL8g2uaOx7g7qHEyc4atcjwsr2vkGh2R75+SgPZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E40C4CEE3;
	Wed, 11 Jun 2025 17:34:18 +0000 (UTC)
Date: Wed, 11 Jun 2025 18:34:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <aEm-F04k0sC1tOCp@arm.com>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>

On Wed, Jun 11, 2025 at 05:28:13PM +0100, Mark Brown wrote:
> Currently we call gcs_free() during flush_gcs() to reset the thread state
> for GCS. This includes unmapping any kernel allocated GCS, but this is
> redundant when doing a flush_thread() since we are reinitialisng the thread
> memory too. Inline the reinitialisaton of the thread struct.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/process.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index a5ca15daeb8a..5954cec19660 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -288,7 +288,9 @@ static void flush_gcs(void)
>  	if (!system_supports_gcs())
>  		return;
>  
> -	gcs_free(current);
> +	current->thread.gcspr_el0 = 0;
> +	current->thread.gcs_base = 0;
> +	current->thread.gcs_size = 0;
>  	current->thread.gcs_el0_mode = 0;
>  	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
>  	write_sysreg_s(0, SYS_GCSPR_EL0);

I think this makes sense.

However, I thought there was another slightly misplaced call to
gcs_free() via arch_release_task_struct(). I wouldn't touch the user
memory with vm_munmap() when releasing a task structure. Is this needed
because the shadow stack is allocated automatically on thread creation,
so we need something to free it when the thread died?

Another caller of gcs_free() is deactivate_mm(). It's not clear to me
when we need to free the shadow stack on this path. On the exit_mm()
path for example we have mmput() -> exit_mmap() that takes care of
unmapping everything. Similarly on the exec_mmap() path.

-- 
Catalin
