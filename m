Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73AB1C861D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078139; cv=none; b=PVm/R3U6aN7k/KYS1KcaQ4ftFZ4YboYtifWHSYB8IQaqAo6AJmSfNS9a/0gg6LsjQwFuIYudGu3UbEr51uYryuUB1WYX7gDiVL38bECp7zT3rpF3KcRqr4ss2bymj/PZN/dTeqlCmoeXLIXki/2b5gc/ur3Ydyk/ok86sW1QTys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078139; c=relaxed/simple;
	bh=7HVnavcozlAGqUoew8jM2OzrVTESgvO41Oq+UN60Jl4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=d8TV5i6ViRoyjK7RqX1wjSxWQzeSuBcCPy5WfojeAgfI7bGj7oqRU6eTK5o4Au4Z6a0OrHvFik+aqU5xPHwrSGRfPPPDghIyCYxQHj5k4GVG/TacEyql10MSOudNrh9t1mK9mEABebv3vTGA8kHiLi6QHKk/nxBeDXEinrSqDOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DEzKvAfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DEzKvAfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCAEC4CEE4;
	Wed,  4 Jun 2025 23:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749078137;
	bh=7HVnavcozlAGqUoew8jM2OzrVTESgvO41Oq+UN60Jl4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DEzKvAfkv9zRmp2q7hwsbAEplUDcrJY8ti9x8ZSb6l1hEvYmslm/gV17/k9EJLXnS
	 7BaVNnfVakmAdcgkANIHALTtyFp1URH6vMiN/4OAPSieJ+QUksgM4cNGFSP6cXRPIC
	 rNvSnMq8MQjhaMyvHlH4QP4apbw0EJXuyc6BJmCM=
Date: Wed, 4 Jun 2025 16:02:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw, Yu-Chun Lin
 <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: Optimize gcd() performance on RISC-V
 without Zbb extension
Message-Id: <20250604160216.d93f5b06030342ad5dfea0a8@linux-foundation.org>
In-Reply-To: <20250524155519.1142570-4-visitorckw@gmail.com>
References: <20250524155519.1142570-1-visitorckw@gmail.com>
	<20250524155519.1142570-4-visitorckw@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 May 2025 23:55:19 +0800 Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> The binary GCD implementation uses FFS (find first set), which benefits
> from hardware support for the ctz instruction, provided by the Zbb
> extension on RISC-V. Without Zbb, this results in slower
> software-emulated behavior.
> 
> Previously, RISC-V always used the binary GCD, regardless of actual
> hardware support. This patch improves runtime efficiency by disabling
> the efficient_ffs_key static branch when Zbb is either not enabled in
> the kernel (config) or not supported on the executing CPU. This selects
> the odd-even GCD implementation, which is faster in the absence of
> efficient FFS.
> 
> This change ensures the most suitable GCD algorithm is chosen
> dynamically based on actual hardware capabilities.
> 
> ...
>
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -21,6 +21,7 @@
>  #include <linux/efi.h>
>  #include <linux/crash_dump.h>
>  #include <linux/panic_notifier.h>
> +#include <linux/jump_label.h>
>  
>  #include <asm/acpi.h>
>  #include <asm/alternative.h>
> @@ -51,6 +52,8 @@ atomic_t hart_lottery __section(".sdata")
>  ;
>  unsigned long boot_cpu_hartid;
>  
> +DECLARE_STATIC_KEY_TRUE(efficient_ffs_key);

Please let's get this into a header file, visible to the definition
site and to all users.

