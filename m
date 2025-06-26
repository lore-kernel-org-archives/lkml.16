Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A362E1C7E;
	Thu, 26 Jun 2025 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945722; cv=none; b=rRtGx8CqvlAtOpFvzZL4l1gA7w9/zStBs5mgqnr4AwnKGhHhUrv9D7tdL0UbW7GCh3y+9Z5cwH1JRaoBtO44tnrV4R9sEDRiBFwKcmLd1aTFXqYKDZEQgXyfbMiqCL1YHS6C2h8fY3E2fNGHEwrxCYZI28FX9KaB2uMlO9tSMxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945722; c=relaxed/simple;
	bh=9gQSknL79pJ8IOxl4ObzSYmMYFOI5aawI+JojD35p7Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=up+0AwaUu9J5p03aNwZDoxAZZZ5U+/mONNrIni+Ji69PcAT7VAhcqtaK4t8SFlR/Ds0u6obiMfYeclEnZL+sRd8S+9S1+C+84E6sJ0Yb1LZarnjn36DBkHVUBIC3pKPtqAiEyLtsc9fYPm2LdvLkVznO/7xNDmRNWT3WtRrdH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GaawndPC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l5/j29XU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GaawndPC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l5/j29XU"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750945716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGFsGaDc7A/iv6amXFrZJ2p4lD8QHxWg/O8VbpAqBE8=;
	b=GaawndPCLcbH0vtikGwu74OYD/tQD4YKZsCGIoqeoWPnEq7Skn031WCaFXU8q2Wa3SwM3t
	SZmiiF1NfVSGLeUG7CvTHrUVRD4ncF1EIcpm2oMlFXpOh2iWZM4WpvfDUOBlAvF/jAT3Qf
	nBHKDs32ggwzFkcNu+JSMRhHVSkCZG5z4x6EWVk4yeaIlsL3I5zANGmKZJIeQ0/e73ODes
	at0PJLQMRZt4ZAt7J8IBKEm6G0/XJAmUK50nnMPkPCq9pLzVfBkxNj2IGHCzIPdTcifrzf
	S1E+ZiIPUTB4BBHrakeUTFNggghHpTd8FOx22pK1NxKy9x0rK7UimP3B71n7HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750945716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGFsGaDc7A/iv6amXFrZJ2p4lD8QHxWg/O8VbpAqBE8=;
	b=l5/j29XUJJcTB0Wfh3QngXEc/2MEVzwBbRdlBUIk8igVqy/SPjHUfc8QvksCYULQlQVl27
	WZbNSf8spvlZ5IBg==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 0/7] MIPS P8700 variant of the ACLINT IPI controller
In-Reply-To: <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
Date: Thu, 26 Jun 2025 15:48:35 +0200
Message-ID: <874iw2r4uk.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 12 2025 at 17:39, Vladimir Kondratiev wrote:
> Patches 1 and 2 refactor "hart index" support, replacing
> APLIC specific implementation with generic helper
>
> Patch 3 adds dt-bindings
>
> Patch 4 refactors Thead-specific SSWI, adding MIPS variant
>
> Patch 5 adds "riscv,hart-indexes" support
>
> Patches 6 and 7 do some minor improvements for the SSWI

It seems I'm the only one who cares about this series aside of Conor
looking at the DT part and of course Vladimir himself.

This whole thing looks reasonable to me and I'm not longer waiting for
those who keep me busy with their own patches and fail to look at stuff
which affects the architecture/drivers they depend on. I don't want to
hear complaints about any fallout of this further down the road.

Oh well.

Thanks,

        tglx
