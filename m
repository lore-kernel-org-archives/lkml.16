Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31598212F83
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674521; cv=none; b=tdu3q6oFWe9Mv2kwrf3iauGna00+Zb85MwyQBdjHsVCYveRvwgZUqq1fczFk7r5BNk97TjJdprw7eAazVHKL6n8jjxkF5KOj0kL/uzx8REfecAigpDPp+rfWb/Cy0DITSUToo5obI/sdkSFXUuVMRMhZEGxPD2I8nmybAS92WDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674521; c=relaxed/simple;
	bh=WJYLX+htA6jdaBcQbWXWuHyrEeF40woSzwAmHNiLlJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CU1MHLp98ufF18++E7A/Nny2ONpxCM/MPuTRkbmuVQ9AfXsaHD2NAJxPPl2fAZHqbsfMdn/omhVuhKXp9InCuImYEfpgJqF3YdgsER0kfe9hKMRUA6pEHMBAS+YJTklEGtRdbR9An7L59fz2atUoZZD346BKAfp7e6y9q+yU9lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4XCkX00g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l5jNDgfo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4XCkX00g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l5jNDgfo"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738674517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5DeqBZU1L9QeN9+jSLCKVus5CfdrhjiOwXPQY3ZMZs=;
	b=4XCkX00gNx2wQJKBGnIkm5Orn7cKaAc/gnIn3rVSJ9P/cbTwnQ/y2YTjbwPByi8sgGthTn
	h6VDvqD87nlQqv+SsDJPPG7vz3qhlYMdlHHhIf8snhVJ72kLNmfH49PbgSpPCbWWjpFYad
	yVSiR9T48gxWZSj/+r96aCh3usUiA9yVS7QOdjrIVA7xlOr7vS4V+rQLfw1Yud8IoUZ/m9
	ezGfQqYAIiO4fjXW5hCOEYm1eCEOURVm0BFOEghdww7bpPVDXp9wU83ZLlVQiHvaRf/0ec
	1Q/ijZyMac/8zyTHHYh6W+v4Z5i0hLNJGW/lFlRGV+gGGu8gsGScBesa0nw+/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738674517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5DeqBZU1L9QeN9+jSLCKVus5CfdrhjiOwXPQY3ZMZs=;
	b=l5jNDgfoExDvAIV8gfDzxRuGhJnYeLAIb2W3ik0rpczuqULHv9Mk0dEXvrelr5BiTIAHCX
	/Mlcexpsp2eNEWCA==
To: Anup Patel <apatel@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Sunil V L
 <sunilvl@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 01/10] irqchip/riscv-imsic: Handle non-atomic MSI
 updates for device
In-Reply-To: <20250204075405.824721-2-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-2-apatel@ventanamicro.com>
Date: Tue, 04 Feb 2025 14:08:37 +0100
Message-ID: <87frktoo16.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 04 2025 at 13:23, Anup Patel wrote:
> Device having non-atomic MSI update might see an intermediate
> state when changing target IMSIC vector from one CPU to another.
>
> To handle such intermediate device state, update MSI address
> and MSI data through separate MSI writes to the device.

As pointed out in the other mail, this intermediate step does not fix
the issue. It requires that the MSI message write happens on the
original target CPU so that an interrupt which is raised on that
intermediate vector can be observed.

Thanks,

        tglx


