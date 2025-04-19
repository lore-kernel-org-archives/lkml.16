Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF013C695;
	Sat, 19 Apr 2025 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745048889; cv=none; b=Ih0zdHEbofQOvFbhxz3uU2YuLojx/Z7HfNMeLgQRvFOi7cdE/m17ThQl7+P8Yx/Q9Av3ZZkknWjo6yUqy4R8okNYj75iCXQ7Aaw9te8IcXSTN1aSVu+N3WNbPH8NDxduiT5/43OGjEGdEQrOL0SqG3PeCrTIQxTIuoAWAwYfd7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745048889; c=relaxed/simple;
	bh=bNrQiIeZQDZWm5VqOQ/C83YaxluHbHA5avtHOdHb7rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr55GgBuqtlTuh5nneYAUtqv6M9dFefbajLIHfhwHD6nYsQAgc3n6XbEeywHbomoId1kY6YrBeTYBfJ63RsxXCzRLZlHCz3nO3d8wSo/GCDcX4U7P8i0BFat1MyUieoR8Na9OUUDilwFINCeMonaTluv4iRAp+s/iPIBut7dL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbSmdcbm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbSmdcbm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0FBC4CEE7;
	Sat, 19 Apr 2025 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745048888;
	bh=bNrQiIeZQDZWm5VqOQ/C83YaxluHbHA5avtHOdHb7rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbSmdcbm/djjHMvP6Qix5SEwCLyQWLWBF2fyMuCZpwfw4sw2YBU34WD827f9/Slsn
	 0/Vjmc3cqt0Phb5KQnwYP+RFIajP5wMwv2ORApwto6s6tUUQ114759a8TLdmOxzehN
	 I6ewB4zm8g+mmstTmMpQvQ2dG8nyEolJOkMlSOvoY++nB0n7L5ou07QK9mzsE6crwW
	 y25qCY/dgZw8smMjLTZ3+vFeOzpro9qDuRpdqpapbM/IgQfi2vmnFIUvpXZjeD+OkL
	 sDCmpl5EemsKR9JQ+Yw471mUaug9YS1fafIuDbPKPM5EhryiS61L+G87i8cEe6VKLl
	 pxH/aimGrprHw==
Date: Sat, 19 Apr 2025 10:48:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: Re: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
Message-ID: <aANVMaepni3KeABI@kernel.org>
References: <20250415072118.3774454-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072118.3774454-1-chenhuacai@loongson.cn>

Hi Huacai,

On Tue, Apr 15, 2025 at 03:21:18PM +0800, Huacai Chen wrote:
> Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
> numa_memblks from x86 to the generic code, but LoongArch was left out
> of this conversion.
> 
> This patch introduces the generic numa_memblks for LoongArch.
> 
> In detail:
> 1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
> 2. Use generic definition for numa_memblk and numa_meminfo;
> 3. Use generic implementation for numa_add_memblk() and its friends;
> 4. Use generic implementation for numa_set_distance() and its friends;
> 5. Use generic implementation for memory_add_physaddr_to_nid() and its
>    friends.
>
> Note: Disable NUMA_EMU because it needs more efforts and no obvious
> demand now.
> 
> Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/Kconfig                 |   1 +
>  arch/loongarch/include/asm/numa.h      |  14 ----
>  arch/loongarch/include/asm/sparsemem.h |   5 --
>  arch/loongarch/include/asm/topology.h  |   7 +-
>  arch/loongarch/kernel/acpi.c           |  11 ---
>  arch/loongarch/kernel/numa.c           | 108 +++----------------------
>  arch/loongarch/mm/init.c               |   8 --
>  mm/Kconfig                             |   1 +
>  8 files changed, 16 insertions(+), 139 deletions(-)

This is really cool simplification!

I wonder if maybe we can take a step or two further and make loongarch to
share more code with other architectures.

Is there a strong reason not to call numa_memblks_init() from
init_numa_memory()? 
And more broadly, maybe loongarch can be even switched to arch_numa?

-- 
Sincerely yours,
Mike.
