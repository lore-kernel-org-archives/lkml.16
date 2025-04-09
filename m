Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4A127C142;
	Wed,  9 Apr 2025 18:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225026; cv=none; b=TECE0Y77wcG4ygFQzUMywfAawxZiu3X22u/ygwaJ5aMYVvpl5FCqMMEu8T0rDaqMa6L6jfsmZNUhwOxU/VZ/FAZKU57gTVS4YjZvl4jyoWr11ag2bJTEtWobsjvX/skZ7ydnxDM433d9VXyH43wkq2tNlrtz7qOo+rC0rgZr1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225026; c=relaxed/simple;
	bh=QgCVNfhnxCyV7oCEOhyavAwHpvhQxAg2FaURxSbiHl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YaPWSkuPMAsC29zYWgK/Z8U1kG3FFJEpIHr3HBQD4YyZ3ce24wQTFOOHHYIUQPtlIzH8lwjGal9eBe4qpf2DrFoWFXR5wUBVqd6mOzOZGQDtNlU/T1ECqtBuf6Ytjq5sE8IbbxqWhB7JnRLgAfGHE3tc84MHDsslY+zi+jLqox8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V6l5bphN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qEOZxBUb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V6l5bphN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qEOZxBUb"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744225023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X63LlIOy8rjdC5bLvYbU2XXDpERzuQXTgv0CKEjSzFI=;
	b=V6l5bphNJl9MFuk5ibsCEsPmLrq26hsIy5D2MbBoNii8P9NKjuzlYHFs8gbDGdFv5+3q5h
	ZUfEH8gbl233r0VNcC4STsyjJmwctYCG9qvBLc0oxIySG44XuUbVkgVEKn3q/7o7TcLsPu
	hELQBlPmpyAHZFLYPoqKre8juUQ/75JRqHmslX3hr3y2K1dGYn0Ct9zuKXRmFrbiR+MGAg
	2qFau1fEfORGcDVh9lEZmIQBM1He/KZzfBBoZNyS2wdtB/nJkyYDh0yiFAuz3fDbehaeS3
	CpZwNyiibTyM4RqvtBlEFLbtu3eUY2hdVJumgKXtqFFGhcUimx4D0hLqfZWHhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744225023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X63LlIOy8rjdC5bLvYbU2XXDpERzuQXTgv0CKEjSzFI=;
	b=qEOZxBUb3z4zRWExCXzuinLodmT3Sn+f0c4t/ZD0OICMa6J/iLia1SPcwa/QGy2qlkL4LY
	C9JMX1w5ogYN9lCQ==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org>
Date: Wed, 09 Apr 2025 20:57:02 +0200
Message-ID: <87jz7ttb7l.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +	guard(mutex)(&its->dev_alloc_lock);
> +
> +	its_dev = gicv5_its_find_device(its, device_id);
> +	if (IS_ERR(its_dev))
> +		return PTR_ERR(its_dev);
> +
> +	ret = gicv5_its_alloc_eventid(its_dev, nr_irqs, &event_id_base);
> +	if (ret)
> +		return ret;
> +
> +	ret = iommu_dma_prepare_msi(info->desc,
> +				    its->its_trans_phys_base);
> +	if (ret)
> +		goto out_eventid;

As 0-day already complained, guard() and goto does not mix. the simple
solution is to do

foo()
        guard()
        return __foo();

Then you can put the gotos into __foo()
