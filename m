Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611A2229B12;
	Thu, 12 Jun 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732662; cv=none; b=EtpvFX/o9UUFLVja7C8gZSsBjJnROMlkboRkyCP8w3KP37uQtKEZmY6kllFJjUS6jkbjliK6J81s6Ipl98nwiq23/exlu1wceE7yLwITB2d0sqECoxABjoBy+MhMPDyGtSCrDPSohBtVI1qrzBGKNn7BavWi8aIG2wWlM6xI3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732662; c=relaxed/simple;
	bh=FYAchfzV30Dip4AccSWccXU22v/2sm2EN/5Ete6GYsw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sYxJatCZ1cYIecKA0TqWmh6KVWhBIYAlZz0ZOJ3zFPVH+Efr7HhJgG4lxNZwPTWc3kzXegdl174BGo+2kohT0+17glrE/QkT7tfaUBJ63Kq/B6Yuf5aFBOeLQNYacTlr6l4ePXzPk5wJ9xq5+ed2DNvHv0Bev4yMWMNB6Yor9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sMt2SYSH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OMVrBsow; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sMt2SYSH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OMVrBsow"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749732652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w25nhMgVqdOfPC/cHt9LodtYaiDNkuaOb39/bucgAv4=;
	b=sMt2SYSHVg2g/iTY8jfJnT0nY2MKBqfXyJYeozgo134YmbiW+0PXzc8WShhyN7XT75MWhD
	uFUiP0m57NjwZ5oyDaPzWAHkzdl0pPi1Ddv1HekeJhmbkV+b18mS06MYtKF6PDJdVUxyN5
	TIrF+K22K50w6gNuCsq3tToBw1Cbc0HMorZIKbTMRpfIvFEf+fpUKndTG6q9V9ro77AGd8
	T+mVGE2k039VomkITimMF5DRitpb8fL7AMFPqk7i1l/yggQ3/nripCRbvDJPYGDDoRBbl2
	x5Ud+q6QJO7ppqVKlhtjba8cZNYmjtUl8P3kMFE3Fr5wn+NZtY6HLd2vM1LnAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749732652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w25nhMgVqdOfPC/cHt9LodtYaiDNkuaOb39/bucgAv4=;
	b=OMVrBsowEer3f9arJs9mXBrwL3AVPO+UqHab5iE0xbYgvvUPPnKv/Elg+VeNwXlWFewJb8
	sel8OToCmpkvOxDQ==
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
Subject: Re: [PATCH v1 2/7] irqchip: riscv aplic: use riscv_get_hart_index()
In-Reply-To: <20250609134749.1453835-3-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-3-vladimir.kondratiev@mobileye.com>
Date: Thu, 12 Jun 2025 14:50:52 +0200
Message-ID: <87h60lrumr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 09 2025 at 16:47, Vladimir Kondratiev wrote:

Please use the documented subsytem prefix nomenclature:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

Thanks,

        tglx
