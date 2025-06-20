Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D1F24E4BD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750416261; cv=none; b=TZeFTfScGK3qBAutVcH/AwmKilgWAlQH8W4Plva9uGAY9XY+T3ETclSpP05zXzbU7hGsDojMHOxsWgBpJgM4Gq4lVjKCtnIqrxfzQwsS5YinxyC2f9YJlPr2kLwlTynZrqAJMLxKmWGm+dPfwuk+eauOL5z/a1jBSniku1YBd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750416261; c=relaxed/simple;
	bh=9jOGLzk2xSjPK7nSigsZpTXKm1FSTZKO7DIMsSAGypY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5cJgRMekpXaeiEewt1c405e37sAOBHX62pll4VPRqyv7ZxC7SAsgm0wZRFJD4D0YYJh5MUqCHmLBv90V2EMf4VOtmXXIlGRIj5b+MRJfWDQU9a3bYNJYNTz0qmTQtQtC+o+hx/UkprpVtm9J9g762D6vk2ULmuhLiWJRXdqiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9AAC176A;
	Fri, 20 Jun 2025 03:43:58 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 681EF3F58B;
	Fri, 20 Jun 2025 03:44:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:44:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH v3] mm/alloc_tag: Fix the kmemleak false positive issue
 in the allocation of the percpu variable tag->counters
Message-ID: <aFU7f5fcD9RJ3Mpa@arm.com>
References: <20250620093102.2416767-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093102.2416767-1-hao.ge@linux.dev>

On Fri, Jun 20, 2025 at 05:31:02PM +0800, Hao Ge wrote:
> From: Hao Ge <gehao@kylinos.cn>
> 
> When loading a module, as long as the module has memory
> allocation operations, kmemleak produces a false positive
> report that resembles the following:
> 
> unreferenced object (percpu) 0x7dfd232a1650 (size 16):
>   comm "modprobe", pid 1301, jiffies 4294940249
>   hex dump (first 16 bytes on cpu 2):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_alloc_percpu+0xb4/0xd0
>     pcpu_alloc_noprof+0x700/0x1098
>     load_module+0xd4/0x348
>     codetag_module_init+0x20c/0x450
>     codetag_load_module+0x70/0xb8
>     load_module+0xef8/0x1608
>     init_module_from_file+0xec/0x158
>     idempotent_init_module+0x354/0x608
>     __arm64_sys_finit_module+0xbc/0x150
>     invoke_syscall+0xd4/0x258
>     el0_svc_common.constprop.0+0xb4/0x240
>     do_el0_svc+0x48/0x68
>     el0_svc+0x40/0xf8
>     el0t_64_sync_handler+0x10c/0x138
>     el0t_64_sync+0x1ac/0x1b0
> 
> This is because the module can only indirectly reference alloc_tag_counters
> through the alloc_tag section, which misleads kmemleak.
> 
> However, we don't have a kmemleak ignore interface for percpu
> allocations yet. So let's create one and invoke it for tag->counters.
> 
> Fixes: 12ca42c23775 ("alloc_tag: allocate percpu counters for module tags dynamically")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
