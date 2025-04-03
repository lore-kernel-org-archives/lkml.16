Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C7161320;
	Thu,  3 Apr 2025 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695036; cv=none; b=VqfmbgTYJGTOJTSzTpy/59rSb1NuYC2F+8qTkZVt4Yhz4wWgqjYwy+YKbFCnKak2FPoMEWyP6B2lO9DLcsxgDLVNsn9U5Jnn1lc0K2FMyJ3JcNCazHWTOvt8vs+ARjPogaZaR38TW+i5pUIyLJlYltZZzP3zcut4AgbRLVXecOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695036; c=relaxed/simple;
	bh=7khyoEb3BiDDSzevfFG1+eWWVDgG0gp2hpgaW6e9qq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YzUKWsn5l+/DlkZFvlgL+sbf++5r9dHd2h1TF3CDphhRVwnsg2K37d2vIitu8FVLtoirUlKYIDEL1LehBfmgmmb7kBVstLOP2lVHORrTGWhYhQxBqR4CtzQXnhahMM8LhWQEyMv5FGEiSjrpbWUUCpGD4nzUdg+tYDuL3ydUpl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dFWiJT0F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=v8VAC7w3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dFWiJT0F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="v8VAC7w3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743695032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
	b=dFWiJT0FPb501rI4xZxAByeZrueh0d+1tmsohsU10/skaN4SqFYNYnNUBrxpwGfwv6ZgFe
	sRGiTo7ylfSy8Ansnahrr1ZZ/GGkol94OFKkcdGM6NI6cZg0b3rzO+I8Cx/6v/yUkgQza0
	lT9KtmHQ61kb1AX+T8hP4C/RMdBbpv+jJFqYMR9t47lLg+ao9k9Gh9sl5n8MaRm3bmf2Jv
	tqp7J++dTsLFYelx0UX0mA5+w06DJY45qs/FCA6WG1SKALnZZrs7LeN5kJzhbRBFQdHevE
	HpJIUFwbhOtGkX4c3pD1LyWqRZEy7x/rNBcowLk0kP0k5KGjgmtsQpWuLiF6Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743695032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zw2Q8IErZl7b2iE4osU+g+AbXrA3g7lMnn18YWn6OGA=;
	b=v8VAC7w3EX8v79DHy2WTqiCxnEnOI+yD68u3RIJprG8VcGaUoghq9uoYwhGbQp8UrheL3f
	SKmG2quvzSHdxNBg==
To: Christian Bruel <christian.bruel@foss.st.com>, maz@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christian Bruel <christian.bruel@foss.st.com>
Subject: Re: [PATCH 2/3] irqchip/gic: Use 0x10000 offset to access GICC_DIR
 on STM32MP2
In-Reply-To: <20250403122805.1574086-3-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com>
Date: Thu, 03 Apr 2025 17:43:52 +0200
Message-ID: <87mscxuu6f.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 03 2025 at 14:28, Christian Bruel wrote:

> When GIC_4KNOT64K bit in the GIC configuration register is
> 0 (64KB), address block is modified in such a way than only the

s/than/that/

> first 4KB of the GIC cpu interface are accessible with default
> offsets.
> With this bit mapping GICC_DIR register is accessible at

What's 'this bit mapping' ? This sentence does not parse.

> offset 0x10000 instead of 0x1000, thus remap accordingly

...

> +/*
> + * 8kB GICC range is not accessible with the default 4kB translation
> + * granule. 0x1000 offset is accessible at 64kB translation.
> + */

I have a hard time to map this comment to the change log, which suggests
to me that this is the other way round.

> +static bool gic_8kbaccess(void *data)
> +{
> +	struct gic_chip_data *gic = data;
> +	void __iomem *alt;
> +
> +	if (!is_hyp_mode_available())
> +		return false;
> +
> +	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
> +	if (!alt) {
> +		pr_err("Unable to remap GICC_DIR register\n");
> +		return false;

That's a hack because in case that the remap fails, this leaves the
thing enabled, but disfunctional.

Thanks,

        tglx
