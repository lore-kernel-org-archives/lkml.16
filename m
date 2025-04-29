Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C02C256B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927530; cv=none; b=jzYjAnbIIJGXwaM9nesefobrCmNRHOVoMqiLBTzgGH5rq3g6WvQ2gHxFTqYQ7JR63yp05jnNw3ugPACyfGKe9SG0uikne6wo2NGdI3ZS03hu3eTSfb/Aj1NXE81BKQed5wDKA2vx78XkdAC1M04IFwpSaiOfm34s/zcli71VBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927530; c=relaxed/simple;
	bh=YSi+2pk2Y0OakkzAIbd3npt05KKhla52x73T72f+oCo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jEcvXGMnOvZq/4tcl3aRCqFSSLdC9aXqItL6uf2qxxcXxQJjkSMobthjY5iRz6K5A1v0rE5Jf/EJ1OQfVKDPGEUeAlVuMNyOIo6KOhvQFZVx5U23qdAMF5fnFJGE1iTgCN841Sr9h2jbglQ0dFeOIefNqwboe47RuPTLhbosDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=BR/xMWVP; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="BR/xMWVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1745927090;
	bh=NskZHmQ3jsP9LjMN23KzcSCE5zyblLz8whIXfHKEw1E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BR/xMWVP9VHC673+uC1BXyT6rTRpWcLKNfObTS7QVorwlWUDZok9NIhzj041nMOTF
	 x95AduzZnykXxd5prsoIbMnmsBy7044afBCGDYktkeQf5xrTF7uyrMHH3xeUcY8JZC
	 rK4jg3h32n/SKMxpJx3RFa5j5/90xdyk0szueYc4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 217CC65997;
	Tue, 29 Apr 2025 07:44:47 -0400 (EDT)
Message-ID: <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
Subject: Re: [PATCH] LoongArch:support CONFIG_SCHED_MC
From: Xi Ruoyao <xry111@xry111.site>
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org, 
	kernel@xen0n.name, wanghongliang@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 29 Apr 2025 19:44:44 +0800
In-Reply-To: <20250429113356.17929-1-zhangtianyang@loongson.cn>
References: <20250429113356.17929-1-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-29 at 19:33 +0800, Tianyang Zhang wrote:
> From: wanghongliang <wanghongliang@loongson.cn>
>=20
> In order to achieve more reasonable load balancing behavior,
> support for SCHED_MC has been added.
> The LLC distribution of Loongarch now is consistent with numa-node,
> the balancing domain of SCHED_MC can effectively reduce the situation
> where processes are awakened to smt_slibing
>=20
> Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
> Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
> =C2=A0arch/loongarch/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++++++
> =C2=A0arch/loongarch/include/asm/smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A0arch/loongarch/include/asm/topology.h |=C2=A0 8 +++++
> =C2=A0arch/loongarch/kernel/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 46 +++++++++++++++++++++++++++
> =C2=A04 files changed, 64 insertions(+)
>=20
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1a2cf012b..72a142a85 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -493,6 +493,15 @@ config NR_CPUS
> =C2=A0	=C2=A0 This allows you to specify the maximum number of CPUs which=
 this
> =C2=A0	=C2=A0 kernel will support.
> =C2=A0
> +config SCHED_MC
> +	def_bool y
> +	prompt "Multi-core scheduler support"
> +	depends on SMP
> +	help
> +	=C2=A0 Multi-core scheduler support improves the CPU scheduler's decisi=
on
> +	=C2=A0 making when dealing with multi-core CPU chips at a cost of sligh=
tly
> +	=C2=A0 increased overhead in some places. If unsure say N here.

To me it's puzzling to say "if unsure say N here" while setting the
default to y.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
