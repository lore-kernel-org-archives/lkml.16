Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28A24500A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 20:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751661302; cv=none; b=ra2FHJEdAyVViPPmc6w0Ne5/z1afz3QJK9HYu7tY9maZxfELz+oJkoUkEExYBbSlbuBB2GIiNAe5rwwmyverEobv3E+M5cNaM4wEkO0NOZ5h4VD8f0owG8mM5434ldPTnTg87EKsraqEEy6MyyD3JNZe4b+J5kJww3ZKi4pGuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751661302; c=relaxed/simple;
	bh=869jhvQSQnJ44+RGbn7YMRH5r88WjqQVfPOwMT0bKj0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=H4jwOEzsqpCcXOdv1b+3UIcTk/QOvKsdsCPf6xqrnepO1ohzlU/Vs69PIQKvbpVWFYYDOAKTbvPb53dcVfrpf5qgq46Nvu7k5Pr8dXuPyUWEXl/nkI8xDW/tpCECyid6GzIWPqJSEb3xNEiu3Du0iMu1LOrXFrYAqTsFW8saLj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L8APpfIe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L8APpfIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEB5C4CEE3;
	Fri,  4 Jul 2025 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751661301;
	bh=869jhvQSQnJ44+RGbn7YMRH5r88WjqQVfPOwMT0bKj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L8APpfIeyH3GmuJdJz0SQ2etJy/imeezDG5IC46k4Xu5Um3xMrAi8OdUE/+66C0ya
	 cc/GaY/B+kPlqWPFnDQK/49mBUt5zNyjZUAUocEjdHv0DSHPwVbyhLWLG9qZuo52CX
	 6OgmDje5/ohhyp1RGmfDBzJIW0dka37B8ElrNbO8=
Date: Fri, 4 Jul 2025 13:35:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matt Fleming <matt@readmodwrite.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@cloudflare.com, Marco Elver
 <elver@google.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Oscar
 Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, Matt
 Fleming <mfleming@cloudflare.com>
Subject: Re: [PATCH v2] stackdepot: Make max number of pools build-time
 configurable
Message-Id: <20250704133500.c21fc228600f70c51a16e04c@linux-foundation.org>
In-Reply-To: <20250704120604.2688934-1-matt@readmodwrite.com>
References: <20250704120604.2688934-1-matt@readmodwrite.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Jul 2025 13:06:04 +0100 Matt Fleming <matt@readmodwrite.com> wrote:

> From: Matt Fleming <mfleming@cloudflare.com>
> 
> We're hitting the WARN in depot_init_pool() about reaching the stack
> depot limit because we have long stacks that don't dedup very well.
> 
> Introduce a new config to allow users to set the number of maximum stack
> depot pools at build time. Also, turn the silent capping into a
> build-time assert to provide more obvious feedback when users set this
> value too high.
> 
> ...
>
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -720,6 +720,12 @@ config STACKDEPOT_MAX_FRAMES
>  	default 64
>  	depends on STACKDEPOT
>  
> +config STACKDEPOT_MAX_POOLS
> +	int "Maximum number of stack depot pools to store stack traces" if EXPERT
> +	range 1024 131071
> +	default 8192
> +	depends on STACKDEPOT

Do we need a range?  If someone wants values outside the range they'll
just edit the Kconfig, shrug.

>  config REF_TRACKER
>  	bool
>  	depends on STACKTRACE_SUPPORT
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 245d5b416699..1c25c40f31f9 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -36,11 +36,11 @@
>  #include <linux/memblock.h>
>  #include <linux/kasan-enabled.h>
>  
> -#define DEPOT_POOLS_CAP 8192
> +#define DEPOT_MAX_POOLS CONFIG_STACKDEPOT_MAX_POOLS

A boot-time option would be much friendlier.  Can we dynamically
allocate stack_pools[]?

Or possibly even runtime, although perhaps not a good effort-to-utility
ratio.

