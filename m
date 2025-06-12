Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD512F4302
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733239; cv=none; b=KcJnOxqnI+gJ8NfEKRDV2QbQzsR7FbFWAkhqn9sJPUQGL7m2AdxnXDc43TIIvC086NzEmJi632gnmReffrfIKS9USWzLDY4pvtLzaLEaC//jGoYceoWifBYEFvGwAuWMaG8ewW5srYon+w9/4nvmg4kejYxF3oSJE1GiLk2Zz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733239; c=relaxed/simple;
	bh=dTvR9UZttgVaGIO8XCk5wZouq0hitpNZTtvPhho8QAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dX57S7fmd3qsu7l903+VLJi7d3GZa2TAGNNPuSZVmoFhp2kvL9HQGrh18DyaTaxuenqtUwNR1B+ylBVpgeDh66kuHGTTuZ/u/LrV6HlZFPZTNKX3mHCkS+fbJ2/I5YIXSwqhhgdwAQ8wRFO+Jf2fKSrh2AajGy4r1RnZxbzROWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4F2344344;
	Thu, 12 Jun 2025 13:00:33 +0000 (UTC)
Message-ID: <288c7d1d-e1b4-4ea1-8877-8b7de033b24a@ghiti.fr>
Date: Thu, 12 Jun 2025 15:00:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: Optimize gcd() performance on RISC-V
 without Zbb extension
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, Yu-Chun Lin <eleanor15x@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
 <20250606134758.1308400-4-visitorckw@gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250606134758.1308400-4-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepvhhishhithhorhgtkhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrk
 hgvlhgvhidrvgguuhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjshgvrhhvsegttghnshdrnhgtkhhurdgvughurdhtfi
X-GND-Sasl: alex@ghiti.fr

On 6/6/25 15:47, Kuan-Wei Chiu wrote:
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
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>   arch/riscv/kernel/setup.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f7c9a1caa83e..785c7104fde7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -21,6 +21,8 @@
>   #include <linux/efi.h>
>   #include <linux/crash_dump.h>
>   #include <linux/panic_notifier.h>
> +#include <linux/jump_label.h>
> +#include <linux/gcd.h>
>   
>   #include <asm/acpi.h>
>   #include <asm/alternative.h>
> @@ -361,6 +363,9 @@ void __init setup_arch(char **cmdline_p)
>   
>   	riscv_user_isa_enable();
>   	riscv_spinlock_init();
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
> +		static_branch_disable(&efficient_ffs_key);
>   }
>   
>   bool arch_cpu_is_hotpluggable(int cpu)


Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

