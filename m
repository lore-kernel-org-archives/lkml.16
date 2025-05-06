Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net (zg8tmja5ljk3lje4ms43mwaa.icoremail.net [209.97.181.73])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFDE198823
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.181.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494541; cv=none; b=ZFTjcQtIC/LFDpVv5SMzzELa4NB6bNoJlY+3gBaoUrTXndyO2QT0orRZzsL9Ko8hqx1w9WBlns9DMvjpg2dC48G0fds4uRqgiE5WjJmsVBq7bhdSe0ShY2fYr/s4MN5atofOceXbAjaZF18AbM+h6lGB38ZlnM0PE++B5duF0XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494541; c=relaxed/simple;
	bh=JfbMqOgKa807whHUusnnPM1sxQC4+hvuDSEV5c4e/QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbC9mfDL0D0S8HPtFtSwRL0PJVcGbSivYqU77Qc/kxUbU8GtFMCSG7b5W0XjpzpsAlht1cJWciqpgyUuyOi0vIhbSRVeQDWjt+37C6f1sAVl2sWfwlUBpjtNkx/ylVh/0I7PEKtrmgC2r4TQrz4KfCfilXT1YelmDjDjciHK4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=209.97.181.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwBXXXk6ZBlozYyiAg--.12934S2;
	Tue, 06 May 2025 09:22:02 +0800 (CST)
Received: from localhost (unknown [123.150.8.50])
	by mail (Coremail) with SMTP id AQAAfwD3iyU4ZBlozLoTAA--.13091S2;
	Tue, 06 May 2025 09:22:01 +0800 (CST)
Date: Tue, 6 May 2025 09:22:00 +0800
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V2] LoongArch: Introduce the numa_memblks conversion
Message-ID: <aBlkOBwIjvUDE0hY@phytium.com.cn>
References: <20250415072118.3774454-1-chenhuacai@loongson.cn>
 <aANVMaepni3KeABI@kernel.org>
 <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H65jh29ccYzcaJf1=QpDuV5xZfBd-1Kr0=in_nk-Z4h7Q@mail.gmail.com>
X-CM-TRANSID:AQAAfwD3iyU4ZBlozLoTAA--.13091S2
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAQAWgRLLwIYwBFsX
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
	1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7CrWDGrWUZr1DXr1xtF4ktFb_yoW5Jr4kpF
	WS9a1DCF48CrWrA3Z2v34UWryYvwn7GrnFqFnxKry09ry2v345Zr40qwsY9FyDX3y8JFy0
	vFn8J3ZxW3WUAFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
	UUUUU

On Sat, Apr 19, 2025 at 03:57:16PM +0800, Huacai Chen wrote:
> Hi, Mike,
> 
> On Sat, Apr 19, 2025 at 3:48 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > Hi Huacai,
> >
> > On Tue, Apr 15, 2025 at 03:21:18PM +0800, Huacai Chen wrote:
> > > Commit 87482708210ff3333a ("mm: introduce numa_memblks") has moved
> > > numa_memblks from x86 to the generic code, but LoongArch was left out
> > > of this conversion.
> > >
> > > This patch introduces the generic numa_memblks for LoongArch.
> > >
> > > In detail:
> > > 1. Enable NUMA_MEMBLKS (but disable NUMA_EMU) in Kconfig;
> > > 2. Use generic definition for numa_memblk and numa_meminfo;
> > > 3. Use generic implementation for numa_add_memblk() and its friends;
> > > 4. Use generic implementation for numa_set_distance() and its friends;
> > > 5. Use generic implementation for memory_add_physaddr_to_nid() and its
> > >    friends.
> > >
> > > Note: Disable NUMA_EMU because it needs more efforts and no obvious
> > > demand now.
> > >
> > > Tested-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > Signed-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  arch/loongarch/Kconfig                 |   1 +
> > >  arch/loongarch/include/asm/numa.h      |  14 ----
> > >  arch/loongarch/include/asm/sparsemem.h |   5 --
> > >  arch/loongarch/include/asm/topology.h  |   7 +-
> > >  arch/loongarch/kernel/acpi.c           |  11 ---
> > >  arch/loongarch/kernel/numa.c           | 108 +++----------------------
> > >  arch/loongarch/mm/init.c               |   8 --
> > >  mm/Kconfig                             |   1 +
> > >  8 files changed, 16 insertions(+), 139 deletions(-)
> >
> > This is really cool simplification!
> >
> > I wonder if maybe we can take a step or two further and make loongarch to
> > share more code with other architectures.
> >
> > Is there a strong reason not to call numa_memblks_init() from
> > init_numa_memory()?
> > And more broadly, maybe loongarch can be even switched to arch_numa?
> This is a minimal change for Yuquan, I will make it in linux-next as
> soon as possible so Yuquan can continue his work.
> 
Hi, Huacai & Mike

Where could I know this has been merged in linux-next? After that, should I
re-push my commit "introduce numa_add_reserved_memblk"?

Sorry for my unfamiliarity with the community rules.

Yuquan
> Switching to numa_memblks_init() or arch_numa will be done in future,
> but need some time because some machines seem to need some hacks.
> 
> Huacai
> 
> >
> > --
> > Sincerely yours,
> > Mike.

