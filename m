Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7249025E465
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.206.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200751; cv=none; b=aCe/7StQwObQ0LqeooV6G96k5ADSxKiXEXwkAW/XnudSd1ExFLd9ZfG3s2KmFumQFT+A70aVYCsRLm6yAqQDHUTEOTiTpvWZNhdLXFD4r6notBhW6NnSiGRHpAmtoGu3CPYtXLNbx8YH9w1FRhZ/NtitgiPFEWjWZ/8RFUw05KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200751; c=relaxed/simple;
	bh=9ShIM87fTN5wWJiAsaRG7UZD/FSN/zrxByKhGLJ0kOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P+bp0uSC+DD4QdpLmeog5zF7j7ieXCuFU9q5CoeYJogb7CpQjrthWdtLmcznoFWtSD9+IAXOWhb+EVS5Imng0R6seH55YuaRb3/wlwrdiiYj004GEBp4lmC22Lx/ApX0upSbwsLpRA/BkW6J90ggbnltTDTWnhXwJmYtDRl6Tuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net; spf=pass smtp.mailfrom=gouders.net; dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b=vEQipIZk; arc=none smtp.client-ip=202.61.206.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gouders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b="vEQipIZk"
Received: from localhost ([193.175.198.193])
	(authenticated bits=0)
	by mx10.gouders.net (8.17.1.9/8.17.1.9) with ESMTPSA id 539CBsur014378
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 9 Apr 2025 14:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1744200714; bh=9ShIM87fTN5wWJiAsaRG7UZD/FSN/zrxByKhGLJ0kOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=vEQipIZkb05bZZ7R1kpqCsN5XmKkQo92g/Ov/qQwlOWgKkygjvntxe82hr9mSFSQZ
	 ifLkaiciAo9lkHF2grrDYREB341Oe2trus7AwNx9AJgIN9DcDPcpcZPBnhRKRTvEEL
	 CPNbbJEhtI6iiVkzoBlohLKBttsnEsZ/pvIaEhA4=
From: Dirk Gouders <dirk@gouders.net>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Linux Kernel
 <linux-kernel@vger.kernel.org>,
        Linux x86 <x86@kernel.org>
Subject: Re: AMD Ryzen 7 PRO 7735U: 8 instead of 16 CPUs?
In-Reply-To: <20250409112414.GFZ_ZY3k88JhYTbYJ0@fat_crate.local> (Borislav
	Petkov's message of "Wed, 9 Apr 2025 13:24:14 +0200")
References: <ghlds9lidx.fsf@gouders.net>
	<20250409112414.GFZ_ZY3k88JhYTbYJ0@fat_crate.local>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Wed, 09 Apr 2025 14:11:49 +0200
Message-ID: <ghplhl1qm2.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Borislav Petkov <bp@alien8.de> writes:

> On Wed, Apr 09, 2025 at 12:49:14PM +0200, Dirk Gouders wrote:
>> I got new hardware and after setting up everything, I was wondering why
>> I don't see the expected 16 CPUs in top(1) or /proc/cpuinfo...
>
> Send full dmesg pls.

Oh well, thanks for the hint: CONFIG_NR_CPUS=8

And if I had analyzed that better, I would have noticed myself:

[    0.059658] CPU topo: CPU limit of 8 reached. Ignoring further CPUs
...
[    0.059709] CPU topo: Rejected CPUs 8


OK, next recipients are the amdgpu folks with a trace that has a higher
chance the problem isn't me...

Best regards,

Dirk
