Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1A254B03
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897572; cv=none; b=jC17bZ4T7VYGDdjzFutpf51KSEelcD4HkBO1i3yKWvIOGfYx3XYznj8IPcvs37taiDGQ2hMUcYfr80KEBy+39BwRlrFstw+2QvHVAb1oaeMg5OqGoKDKhLXN9+vmyLK75cg0ZJ6ZXcXKjyiCkiz9GkiCp9xU0M28CKaXmyHNCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897572; c=relaxed/simple;
	bh=neGtYlWL+rQqRl60UNqwVx8pYYCSbrpYZKEEqreHKKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozGS4MZnll3fUANepNEApkjn6g52Tjge1DIZtJ4VGNdTd1bzyEA1EQPKyU/tRcr+xcrJ4q3XvaoiTkd/P2rvdpN17Y0Z9L1TMtHYSdJsbEjdUrvSOr/XGeJg4VIJUXfwwEH3nbEZqEcIAuAO12ZjB+0f/XxoYs9r1Jb+dSHdswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=StF1VnN/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="StF1VnN/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qYR+jkuSHU7Rs1PF8jTIcbOj/9F6zvOH3CGJ+OiZIjo=; b=StF1VnN/K1W6Lh/zAolQt9AcNA
	5O2cIaUXQZxoJmfjn3+zOGkxluF7pKX89NoIWTlOW84CcjyIafcSis2VHlVH//8xDZTgS+MnBhqn1
	RVFGL29f3gBbh2vd0rHNOx+4tfGcBa3KC3EL7K6SldfzfcODSPnhdmtkMJytQbQtfbD43P5kwvSfX
	tJIbPMsQMaBd6nfuKMwAeV69g7LGXie/Q/Mraw8f4HdsOBz2bhCF2qdMcsGh7SnNKt8JVHo8AfZnc
	2ImiTbCWiQPyeGwq61UllECjLbieBaUrWhUG/ME0CwDywRiW4pwnmPW4f3B3UOKjMypRFyCzYAsqn
	EYwMyjrQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOI9-00000003Crm-0JzJ;
	Sat, 14 Jun 2025 10:39:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A16333061B2; Sat, 14 Jun 2025 12:39:15 +0200 (CEST)
Date: Sat, 14 Jun 2025 12:39:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>, jannh@google.com,
	Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the
 defconfig
Message-ID: <20250614103915.GM2278213@noisy.programming.kicks-ass.net>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-10-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515132719.31868-10-mingo@kernel.org>

On Thu, May 15, 2025 at 03:27:15PM +0200, Ingo Molnar wrote:
> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, enable the following
> MM options that are typically enabled on major Linux distributions:
> 
> - ACPI_HOTPLUG_MEMORY, ZSWAP, SLAB hardening, MEMORY_HOTPLUG,
>   MEMORY_HOTREMOVE, PAGE_REPORTING, KSM, higher DEFAULT_MMAP_MIN_ADDR,
>   MEMORY_FAILURE, HWPOISON_INJECT, TRANSPARENT_HUGEPAGE,
>   TRANSPARENT_HUGEPAGE_MADVISE, IDLE_PAGE_TRACKING, ZONE_DEVICE
>   DEVICE_PRIVATE, ANON_VMA_NAME, USERFAULTFD, multi-gen LRU.
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>

> +CONFIG_KSM=y

Isn't this thing like a giant security fail?
