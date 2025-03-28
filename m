Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF8188A0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170865; cv=none; b=pZS1z0+Dxkdl3nhdN1JMXL2vSqca8mztOB4s2LIVV3t5cqDPYMBHJSoJso/QYjTYKFxCyV29dN0KRnNxs9IQKzF7zQ1fN8ETYwvdzu1f/9POjIdEM/dG2w5el15fqoLj4zaw6VogBDySoucAzfxRZI3xBCR8r9z/qCZoOQR2aKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170865; c=relaxed/simple;
	bh=5ubbnVUjZcrVdNpkTAj97UWuCTU2k7NfswoFZe30KmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaaGR3PhkAIPa+zIPbYTx2tS/xnfb5fmDnPpHs7J+uTZc6Cc1MDPNMEfcmtaACWQ0BJfwY1RymHL54QTQYAX4MZF/tXB7QwO4V1J64R0OAo1wuxSph5nNQN0t72JaCaCQz6ziYp4wQ/sGse+TzNnvIyGcAVVQvRehw5BnN08b+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6450F44380;
	Fri, 28 Mar 2025 14:07:37 +0000 (UTC)
Message-ID: <61173b04-faea-4dfe-8e82-95a55ee33f3f@ghiti.fr>
Date: Fri, 28 Mar 2025 15:07:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] riscv: Optimize gcd() performance by selecting
 CPU_NO_EFFICIENT_FFS
Content-Language: en-US
To: Kuan-Wei Chiu <visitorckw@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250217013708.1932496-1-visitorckw@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250217013708.1932496-1-visitorckw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedugeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehvihhsihhtohhrtghkfiesghhmrghilhdrtghomhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepjhhsvghrvhestggtnhhsrdhntghkuhdrvgguuhdrthifpdhrtghpthhtohepvghlvggrnhhorhduheigsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqr
 hhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Kuan-Wei,

First sorry for the late review.

On 17/02/2025 02:37, Kuan-Wei Chiu wrote:
> When the Zbb extension is not supported, ffs() falls back to a software
> implementation instead of leveraging the hardware ctz instruction for
> fast computation. In such cases, selecting CPU_NO_EFFICIENT_FFS
> optimizes the efficiency of gcd().
>
> The implementation of gcd() depends on the CPU_NO_EFFICIENT_FFS option.
> With hardware support for ffs, the binary GCD algorithm is used.
> Without it, the odd-even GCD algorithm is employed for better
> performance.
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Although selecting NO_EFFICIENT_FFS seems reasonable without ctz
> instructions, this patch hasn't been tested on real hardware. We'd
> greatly appreciate it if someone could help test and provide
> performance numbers!
>
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7612c52e9b1e..2dd3699ad09b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -91,6 +91,7 @@ config RISCV
>   	select CLINT_TIMER if RISCV_M_MODE
>   	select CLONE_BACKWARDS
>   	select COMMON_CLK
> +	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
>   	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
>   	select EDAC_SUPPORT
>   	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)


So your patch is correct. But a kernel built with RISCV_ISA_ZBB does not 
mean the platform supports zbb and in that case, we'd still use the slow 
version of gcd().

Then I would use static keys instead, can you try to come up with a 
patch that does that?

Thanks,

Alex

