Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F78978F4A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418659; cv=none; b=DrTi6pq5QnDJIoAYCH0Dc2Qs54Qyg2PQZ1m1BJeucIHFa2uP/r9l32PfMD+d8PpuY9Abkup1YU/+LYd2+On3zxk1RApz8P/gEmTB7t4I+KRkD4zYqsJjsVdKP16tubCGG2PMgQvO6c6XVw/nvHVOoYTb5GdBfneElstPi3eWgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418659; c=relaxed/simple;
	bh=i+kZHo82f8GJo3mDV/bfL8liyESiA6Eejq63EajMt5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8KbH98KdLOcgt9tBpjWXYybvX8jF24T79+NrE95hoXj3ZOhZWiSkdkaoMHiEaIGu5zUVE0mNc8JmSQAQfiCdoO8fcNRdn2ax3wlR1z4jfn7iOw1ghUZVRfB/mOPFzAI+0SdzWANl8c+kzXRbf8/Qwy86x5ftU7LWmCsH4uDB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6031C176A;
	Fri, 20 Jun 2025 04:23:58 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68553F673;
	Fri, 20 Jun 2025 04:24:16 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:24:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Message-ID: <aFVE3uuNCbHF7f5z@arm.com>
References: <20250620111045.3364827-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111045.3364827-1-arnd@kernel.org>

On Fri, Jun 20, 2025 at 01:10:41PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> For really large values of CONFIG_NR_CPUS, a CPU mask value should
> not be put on the stack:
> 
> arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> This could be achieved using alloc_cpumask_var(), which makes it
> depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
> serialized and can only run on one CPU, making the variable 'static'
> is easier.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 15987100c0cf..5c605dc7f5be 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1107,7 +1107,7 @@ static inline unsigned int num_other_online_cpus(void)
>  void smp_send_stop(void)
>  {
>  	static unsigned long stop_in_progress;
> -	cpumask_t mask;
> +	static cpumask_t mask;
>  	unsigned long timeout;

This would work, there's a stop_in_progress check and only one CPU would
modify the mask.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
