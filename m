Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D12701B7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366531; cv=none; b=YFZmtaB5FgoDcRSwgK6meaOss2A+eq68UbBVvmiEbUeUlr1GoU/m1XSgmrHCq8dioCN7hvJHsYNbti61WHgSwynscN9eL52W+WFtKENSiOIxb6r9t6cE4kWX+gbx3Gx+jTV02diL5I4ozhaOqLQsJPWkenueqv3LwY+wiIYeph4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366531; c=relaxed/simple;
	bh=eDpmZr/W7abK7TOh4z28CqdS8NP76IJiT9pe9JH2vXI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kGJkUrqSqbYL+mLUhGK2gwcpZQ2feLDp6Yy4Hm3JuqPJkTlW07+u2NikhLBDNntAUx0XnDS2IxpW9Eqqes2yMTziUr2EAljZhD8iQwjz2ZT2/Qb/lMdd3ZFqm+v4Y00lsMIG7/amAzdQJ3MpZSIeUU/2+bAhvWWmLZLdnItbviE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mf6qzicp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mf6qzicp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC797C4CEE9;
	Wed, 23 Apr 2025 00:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745366530;
	bh=eDpmZr/W7abK7TOh4z28CqdS8NP76IJiT9pe9JH2vXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mf6qzicpbC9BTF5qV15mgsETGid3iwB043YrvY5wXyQ3VMQWVvGsxytWIiFFWCnsu
	 f+b5e9vNnD2VJ+4t7WRjmT6Rn6urKLHlv7QQocxdpKXx9fEh6yiDsDOBVXL0r4BhCQ
	 DYPpMaUcC5mnEwgvbCGlBgUQGJrU6jMdV5VaskUs=
Date: Tue, 22 Apr 2025 17:02:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: gaoxu <gaoxu2@honor.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph
 Lameter <cl@linux.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>, yipengxiang
 <yipengxiang@honor.com>
Subject: Re: mm: percpu: increase PERCPU_MODULE_RESERVE to avoid allocation
 failure
Message-Id: <20250422170209.a8beaa8a3610d2e92421476f@linux-foundation.org>
In-Reply-To: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com>
References: <bcfb90b2cecf43d7a0760ebaddde10d8@honor.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 11:39:30 +0000 gaoxu <gaoxu2@honor.com> wrote:

> In android16-6.12, enabling CONFIG_MEM_ALLOC_PROFILING causes some modules
> to fail to load during boot because of failed percpu memory allocation.

Which modules?  If they're in-tree modules then we should fix this
issue in -stable kernels also.

If they're out-of-tree modules then what argument is there for altering
the mainline kernel?

> [811:modprobe]percpu: allocation failed, size=5200 align=8 atomic=0, alloc
> from reserved chunk failed
> [811:modprobe]Call trace:
> [811:modprobe] dump_backtrace+0xfc/0x17c
> [811:modprobe] show_stack+0x18/0x28
> [811:modprobe] dump_stack_lvl+0x40/0xc0
> [811:modprobe] dump_stack+0x18/0x24
> [811:modprobe] pcpu_alloc_noprof+0x96c/0xb58
> [811:modprobe] percpu_modalloc+0x50/0xec
> [811:modprobe] load_module+0x1158/0x153c
> [811:modprobe] __arm64_sys_finit_module+0x23c/0x340
> [811:modprobe] invoke_syscall+0x58/0x10c
> [811:modprobe] el0_svc_common+0xa8/0xdc
> [811:modprobe] do_el0_svc+0x1c/0x28
> [811:modprobe] el0_svc+0x40/0x90
> [811:modprobe] el0t_64_sync_handler+0x70/0xbc
> [811:modprobe] el0t_64_sync+0x1a8/0x1ac
> [811:modprobe]ipam: Could not allocate 5200 bytes percpu data
> 
> Increase PERCPU_MODULE_RESERVE to resolve this issue.
> 
> ...
>
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -16,7 +16,7 @@
>  /* enough to cover all DEFINE_PER_CPUs in modules */
>  #ifdef CONFIG_MODULES
>  #ifdef CONFIG_MEM_ALLOC_PROFILING
> -#define PERCPU_MODULE_RESERVE		(8 << 13)
> +#define PERCPU_MODULE_RESERVE		(8 << 14)
>  #else
>  #define PERCPU_MODULE_RESERVE		(8 << 10)
>  #endif

PERCPU_MODULE_RESERVE is a pretty unpleasant thing.  It appears that it
gives us the choice between either wasting memory or failing module
loading.  But I expect that something more dynamic would be a ton of work.
