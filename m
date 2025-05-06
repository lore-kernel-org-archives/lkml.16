Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977E27E7EF;
	Tue,  6 May 2025 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544048; cv=none; b=c8U66Mvba6aVuLcOX+HaWCJx6GvchRMqf+uebrfCTKdHPzyDT2+TRdH4vngLSg71o8EcFGFXmBBdzlJBSpAgwKeoWaXymLcwvZZPRfoiBAq2ETIepDAchcikCkRPUkSFnlVSj0+Lkbw6HkuUdu9oOWABUtTctix/7323INXF6nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544048; c=relaxed/simple;
	bh=BYd0Qq0VSm68kkZAqPj7Yh7eeZtdp5eJ3xOmvv1oA2Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OtRl8XWLp4i85b+8pPAOZq3je/K3yIsJGRS8eybhev1FqIkx1WNoNf/Lflgv/PVDCS3rWxG+1oc0uMXX2HVz3UNMgyMArN5WMNoxEoEhRETwI7oy6kpqVGFTi2ZAFBp7ChNwBUPteNz79mxyrTi4Vb9eicUkfQOX2GveqAsthFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uhJrKX7G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KqXLwv2K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uhJrKX7G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KqXLwv2K"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746544045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6wNOT1DAoZVhSLpHhkXu8/sSOgpiwDL+Pi84W+S/Gos=;
	b=uhJrKX7G2UJLk+tOWtsqowh95IQY5uGUDWf3PWRWDjVn9bkdQ3elYf48wya934dsrnOT5d
	L4odQlCu2ElpTYewxnkjBZgOI3LDJrSSIw/HTFsh3B58t+4dknyCN6QaQKHaow7zFenpVe
	xjv7MI921BIhfbHTcYJzGnLENkt8capo8x3QU/pNL2czmE2SMrfbyVyOADhaoZAtF46AkR
	gauXlpAQXIUfXS52VMLaKeCeYhOcPM7rpYrCC9OoZj9e5TLmKGOPUYauuALA14feJEl55t
	9KtmmgXY0SV6v1iOFuS/b7FHGeSlFcPIt2ztrDMcdisKzHtmzMHeOzoOO8CvLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746544045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6wNOT1DAoZVhSLpHhkXu8/sSOgpiwDL+Pi84W+S/Gos=;
	b=KqXLwv2Ko7xWWiugCq2HozHlQ8iVBy4y4Hvpq1P0rMkctKCWxLLdIkEbPhZXaEASntugN5
	ItHXuROFf5HU4ZAg==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 22/25] irqchip/gic-v5: Add GICv5 LPI/IPI support
In-Reply-To: <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
Date: Tue, 06 May 2025 17:07:24 +0200
Message-ID: <87wmatn5g3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> +static int __init gicv5_irs_init_ist(struct gicv5_irs_chip_data *irs_data)
> +{
> +	u32 lpi_id_bits, idr2_id_bits, idr2_min_lpi_id_bits,
> +	    l2_iste_sz, l2sz, l2_iste_sz_split, idr2;

Please don't do that. That's horrible to read. If it does not fit into a
single line, make it

       u32 a,....,h;
       u32 i,...,m;

