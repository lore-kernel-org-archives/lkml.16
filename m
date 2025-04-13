Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BEFAD51
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744536071; cv=none; b=E2vzRRIS2s9g5zJo6XpMkpAczBnmXzoFqEVka90+BJ9eYjJP3nySo2ZGybsDHDHz5LBAzXOL8MggTeyG3xMwzfynmmrBGPc+iihYi3hxP2CFaZZtiYAO6bKI3RlWBXtVqKwO64F/HvBClDvygfh/OWe8qip12yt4p23UGWys2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744536071; c=relaxed/simple;
	bh=5x+MkrmRRu6zOGXI7SShCtjrYDlS9NVzUsB9GHStHRY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DTwGJOCuu5jrheooqA3oCNcUZ/v+4ZHsJ2b9FeM5V5HK3TfLxqoCxi6JenAdzRmS/XvPyIjv49dSzchHB8GgzT+rbDkKY0fUbXUT4Af+RddhEEwZZJmiQ6tSxQsx8t1+YaWDUbg0qJeNhWuYiQmqWuVucxU8PD5MmkCJdgTNsNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CS6YVo21; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CS6YVo21"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 777A640E01FF;
	Sun, 13 Apr 2025 09:21:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GEQqxRuvBsdT; Sun, 13 Apr 2025 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744536059; bh=q/78SM1Gv24o6hPeZvfPDHJxDcGqzrvRW77yoVOo2dk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CS6YVo21Z7Oa5f7lc5BlphiesMIbZ7iC3NIyKs9xS/nikRZRH3aswuCX7LgaxwfVI
	 vRRYs5n+eOEi8uM1mbzMkGa6SkOjuVePQEMptx25/cAXFQLprk4Sirxfxjhchgc6Sd
	 bSO00lODsuLSCo5UXgWlaFSsck9ae3yVOrVPzO3f6IJe9gy9XHByhXM5m1d/miwixZ
	 Tma6EZSq9tPXzGy9FMKbWbwBIRWiyM4FvoOBwIHYa0i3+ha49ISrBSGmZ3KEsx7NDF
	 T+wU0T4MTR6jTdBzD15/sOktVtJ73h5vFhtpGi3MatfAsO6k+QbVt+sSj3/h2dKMdT
	 cgIIMCVnxj1WLkZgCY4Jc0T/TgyMJhdeSzc/Nr75+dhIhXlY/SG+N8AV+g9fT9j6J5
	 zW8hcC//x37BEb5pdiiRSbFKtuI6arYR2t6GxGngAxRvdepq9s2Ce1SwlVEyhbmHk2
	 xjcWdp8RaWPNkAYR5d90/7nXEimOlE1nX9CuiK6382z8eCguXPW/LVcrXNsi97pZw7
	 bseQlnQ1nb8YGvz4oDR7IgtBeLKfGE5Qr/V520kn4Go5FvTR8xYNqlcyDVklrZmRti
	 ER5GQ2Gk3ZNqaK/xVtg7lWZRJTTh8sQ8ak3QtOilU1wgOwPUEuKOLpcm3ywIT3WW2s
	 ittI2oVQtq5Xi9E0seFyEqUY=
Received: from [127.0.0.1] (ip-109-091-218-137.um37.pools.vodafone-ip.de [109.91.218.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 312D840E0214;
	Sun, 13 Apr 2025 09:20:52 +0000 (UTC)
Date: Sun, 13 Apr 2025 11:20:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
CC: Mario Limonciello <superm1@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/6=5D_x86/platform=3A_Move_A?=
 =?US-ASCII?Q?MD_specific_headers_to_=3Casm/amd/*=2Eh=3E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250413084144.3746608-1-mingo@kernel.org>
References: <20250413084144.3746608-1-mingo@kernel.org>
Message-ID: <D80EADFE-7336-4007-9E7D-7E2F22F0BF6C@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 13, 2025 10:41:38 AM GMT+02:00, Ingo Molnar <mingo@kernel=2Eorg> w=
rote:
>Also clean up some details while at it=2E
>
>The Git tree of these patches can also be found at:
>
>  git://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/mingo/tip=2Egit WIP=
=2Ex86/platform
>
>Thanks,
>
>	Ingo
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>
>Ingo Molnar (6):
>  x86/platform/amd: Move the <asm/amd-ibs=2Eh> header to <asm/amd/ibs=2Eh=
>
>  x86/platform/amd: Add standard header guards to <asm/amd/ibs=2Eh>
>  x86/platform/amd: Move the <asm/amd_nb=2Eh> header to <asm/amd/nb=2Eh>
>  x86/platform/amd: Move the <asm/amd_hsmp=2Eh> header to <asm/amd/hsmp=
=2Eh>
>  x86/platform/amd: Clean up the <asm/amd/hsmp=2Eh> header guards a bit
>  x86/platform/amd: Move the <asm/amd_node=2Eh> header to <asm/amd/node=
=2Eh>
>
> Documentation/userspace-api/ioctl/ioctl-number=2Erst | 2 +-
> MAINTAINERS                                        | 6 +++---
> arch/x86/events/amd/ibs=2Ec                          | 2 +-
> arch/x86/include/asm/{amd_hsmp=2Eh =3D> amd/hsmp=2Eh}    | 4 ++--
> arch/x86/include/asm/{amd-ibs=2Eh =3D> amd/ibs=2Eh}      | 5 +++++
> arch/x86/include/asm/{amd_nb=2Eh =3D> amd/nb=2Eh}        | 2 +-
> arch/x86/include/asm/{amd_node=2Eh =3D> amd/node=2Eh}    | 0
> arch/x86/kernel/amd_gart_64=2Ec                      | 2 +-
> arch/x86/kernel/amd_nb=2Ec                           | 2 +-
> arch/x86/kernel/amd_node=2Ec                         | 2 +-
> arch/x86/kernel/aperture_64=2Ec                      | 2 +-
> arch/x86/kernel/cpu/cacheinfo=2Ec                    | 2 +-
> arch/x86/kernel/cpu/mce/inject=2Ec                   | 2 +-
> arch/x86/mm/amdtopology=2Ec                          | 2 +-
> arch/x86/mm/numa=2Ec                                 | 2 +-
> arch/x86/pci/amd_bus=2Ec                             | 2 +-
> arch/x86/pci/fixup=2Ec                               | 2 +-
> drivers/char/agp/amd64-agp=2Ec                       | 2 +-
> drivers/edac/amd64_edac=2Ec                          | 4 ++--
> drivers/hwmon/k10temp=2Ec                            | 2 +-
> drivers/platform/x86/amd/hsmp/acpi=2Ec               | 4 ++--
> drivers/platform/x86/amd/hsmp/hsmp=2Ec               | 2 +-
> drivers/platform/x86/amd/hsmp/plat=2Ec               | 4 ++--
> drivers/platform/x86/amd/pmc/mp1_stb=2Ec             | 2 +-
> drivers/platform/x86/amd/pmc/pmc=2Ec                 | 2 +-
> drivers/platform/x86/amd/pmf/core=2Ec                | 2 +-
> drivers/pnp/quirks=2Ec                               | 2 +-
> drivers/ras/amd/atl/internal=2Eh                     | 4 ++--
> sound/soc/amd/acp/acp-rembrandt=2Ec                  | 2 +-
> sound/soc/amd/acp/acp63=2Ec                          | 2 +-
> sound/soc/amd/acp/acp70=2Ec                          | 2 +-
> sound/soc/sof/amd/acp=2Ec                            | 2 +-
> tools/perf/check-headers=2Esh                        | 2 +-
> tools/perf/util/amd-sample-raw=2Ec                   | 2 +-
> 34 files changed, 44 insertions(+), 39 deletions(-)
> rename arch/x86/include/asm/{amd_hsmp=2Eh =3D> amd/hsmp=2Eh} (91%)
> rename arch/x86/include/asm/{amd-ibs=2Eh =3D> amd/ibs=2Eh} (98%)
> rename arch/x86/include/asm/{amd_nb=2Eh =3D> amd/nb=2Eh} (98%)
> rename arch/x86/include/asm/{amd_node=2Eh =3D> amd/node=2Eh} (100%)


Cool, /me like=2E

Thx=2E


--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 
