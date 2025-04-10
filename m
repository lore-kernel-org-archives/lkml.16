Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C421372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291226; cv=none; b=Q7B58huTOXK6ESM3mdxSUjgzZRu6vVhwTrz0BkfxR4G0anI3fedLfE22Xat+qta2rSsoWl0Whc9i+QCQWxWJIiQDkCHO+6tpZLt9lUCUaVL9O0O4bMMMFhTjQIyr8pblkXvbFslT3j0vYrO7fc4hmJn+Ngj9PSMnRNX13lqZdyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291226; c=relaxed/simple;
	bh=2+5JJLnn1Ol2KyHL78eVGJpBjHlDREmN5fI8AJdAfow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=brmPrXBJvXuMRVqjslMBQmsKPzqhZG81othvqqkaz3a0FJ71pXn3CHYzP58fjQlbEe13zSbJVeY2m3nOOYxRw9XDJDGx6Gn4nox9/ddsbVuIpGzf+i+wzzCLR8lQ/wAzM7+NBLDVJwpFo7z354dYWlocEcmIvP43elIYOHgJjxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02EE120481;
	Thu, 10 Apr 2025 13:20:20 +0000 (UTC)
Message-ID: <c546c4c6-a4a0-431e-9299-5477bedf6280@ghiti.fr>
Date: Thu, 10 Apr 2025 15:20:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Fix unaligned access info messages
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 alexghiti@rivosinc.com, geert@linux-m68k.org
References: <20250409153650.84433-2-ajones@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409153650.84433-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeltdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvfedvmegtfegrkeemugegsgegmedusggusggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegrjhhonhgvshesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdro
 hhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Drew,

On 09/04/2025 17:36, Andrew Jones wrote:
> Ensure we only print messages about command line parameters when
> the parameters are actually in use. Also complain about the use
> of the vector parameter when vector support isn't available.
>
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/kernel/unaligned_access_speed.c | 35 +++++++++++++---------
>   1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 585d2dcf2dab..b8ba13819d05 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -439,29 +439,36 @@ static int __init check_unaligned_access_all_cpus(void)
>   {
>   	int cpu;
>   
> -	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> -	    !check_unaligned_access_emulated_all_cpus()) {
> -		check_unaligned_access_speed_all_cpus();
> -	} else {
> -		pr_info("scalar unaligned access speed set to '%s' by command line\n",
> -			speed_str[unaligned_scalar_speed_param]);
> +	if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
> +		pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
> +			speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
>   		for_each_online_cpu(cpu)
>   			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> +	} else if (!check_unaligned_access_emulated_all_cpus()) {
> +		check_unaligned_access_speed_all_cpus();
> +	}
> +
> +	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
> +		if (!has_vector() &&
> +		    unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED) {
> +			pr_warn("vector support is not available, ignoring unaligned_vector_speed=%s\n",
> +				speed_str[unaligned_vector_speed_param]);
> +		} else {
> +			pr_info("vector unaligned access speed set to '%s' (%lu) by command line\n",
> +				speed_str[unaligned_vector_speed_param], unaligned_vector_speed_param);
> +		}
>   	}
>   
>   	if (!has_vector())
>   		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>   
> -	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> -	    !check_vector_unaligned_access_emulated_all_cpus() &&
> -	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> -		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> -			    NULL, "vec_check_unaligned_access_speed_all_cpus");
> -	} else {
> -		pr_info("vector unaligned access speed set to '%s' by command line\n",
> -			speed_str[unaligned_vector_speed_param]);
> +	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
>   		for_each_online_cpu(cpu)
>   			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> +	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> +		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> +		kthread_run(vec_check_unaligned_access_speed_all_cpus,
> +			    NULL, "vec_check_unaligned_access_speed_all_cpus");
>   	}
>   
>   	/*


Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll wait for Geert feedback before picking it.

Thanks,

alex




