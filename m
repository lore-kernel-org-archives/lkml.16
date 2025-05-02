Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAF4690;
	Fri,  2 May 2025 00:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746146159; cv=none; b=YHfbh2lPlRVNA5uebtzZaVxmWzwVZikkhwfI7o4Z/VUx9stDpZPwySFmxhkhQoYSVXXbwKs2oVHY958hYshn2ZrKKfmXU8oN2xKPyTb8/U/Nsuxn4wr11XRZhUG33UFC2d7XRtgcmYn3/zMR+eEyCJVuxyOLgBdBi+Rob1l2ApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746146159; c=relaxed/simple;
	bh=r6cZ5DSQF3o0HeCCObfwUfYlDtCGgIB48FkNaQjiLrM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YhczO5weclDMMQuPxP8WgvxCxSYl8uyCcmGUO9AgbLk/UpCLVH6qCrz11WohTMzLMEOF8ZTSsGPr1v6hMXHGCNvqcSPywl9OxdWkX4KWxeE++TD+yvQghFnlPDQg7IsBqMqbGhPZOWyCODYGr6X6S0AdfIjN4wXLLdUFFzsTvAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZxVOGTRW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZxVOGTRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC394C4CEE3;
	Fri,  2 May 2025 00:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746146159;
	bh=r6cZ5DSQF3o0HeCCObfwUfYlDtCGgIB48FkNaQjiLrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZxVOGTRW15HvfWwscTK1CyhkU7Z0go8+g3X1Tx0IO+X6s2A0wZzwujqf7KkAM3rfo
	 SerkH9ABOcdbuUmxcJCSJtCW+GF8tU5uQGYr7rJY8LfxJPqG/URjiPpyLqXC1F81IB
	 m37cxSxymyVLc09B33S2IR3AZjFGRqsCNuhqhUgs=
Date: Thu, 1 May 2025 17:35:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Changyuan Lyu <changyuanl@google.com>
Cc: linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de,
 ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com,
 devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com,
 graf@amazon.com, hpa@zytor.com, jgowans@amazon.com,
 kexec@lists.infradead.org, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com,
 mingo@redhat.com, pasha.tatashin@soleen.com, pbonzini@redhat.com,
 peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org,
 rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com,
 skinsburskii@linux.microsoft.com, tglx@linutronix.de,
 thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
Message-Id: <20250501173557.1880f3aa8694352e0eb153b4@linux-foundation.org>
In-Reply-To: <20250501225425.635167-7-changyuanl@google.com>
References: <20250501225425.635167-1-changyuanl@google.com>
	<20250501225425.635167-7-changyuanl@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 May 2025 15:54:13 -0700 Changyuan Lyu <changyuanl@google.com> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The early_memremap() function is decleared in a header that is only indirectly
> included here:
> 
> kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>  1116 |         fdt = early_memremap(fdt_phys, fdt_len);
>       |               ^
> 
> ...
>
> --- a/kernel/kexec_handover.c
> +++ b/kernel/kexec_handover.c
> @@ -17,6 +17,9 @@
>  #include <linux/memblock.h>
>  #include <linux/notifier.h>
>  #include <linux/page-isolation.h>
> +
> +#include <asm/early_ioremap.h>
> +
>  /*
>   * KHO is tightly coupled with mm init and needs access to some of mm
>   * internal APIs.

When resending, it's best to fold little fixes like this into the base
patch, along with a little note and the author's signed-off-by.

I shall queue this as a fix to be folded into "kexec: add KHO parsing
support", thanks.
